defmodule HumanAgent do
  use GenServer
    # Input Interface
  def start_link(default) when is_map(default) do
    GenServer.start(__MODULE__, default)
  end

  def addMemory(pid, item,value) do
    if item=="age" do 
      willBuy = willHumanBuy(value);
      GenServer.cast(pid, {:add, "buy", willBuy})
    end
    GenServer.cast(pid, {:add, item, value})
  end

  def getMemory(pid,item) do
    GenServer.call(pid, {:get, item})
  end
  
  def removeMemory(pid,item) do
    GenServer.call(pid, {:forget, item})
  end

  def killHuman(pid) do
    GenServer.stop(pid)
  end

  # Output Actions 

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  @impl true
  def handle_cast({:add, item, value}, mind) do
    {:noreply, Map.put(mind, item, value)}
  end

  @impl true
  def handle_call({:get,item}, _from, mind) do
    {:reply, Map.get(mind,item),mind}
  end

  @impl true
  def handle_call({:forget,item}, _from, mind) do
    {value, newState} = Map.pop(mind,item)
    {:reply, value, newState}
  end 

  def willHumanBuy(age) do
    x = :getcwd
    path = to_charlist(Application.app_dir(:sym_world,"scripts"))
    {:ok, pid} =:python.start([{:python_path,path}])
    cwd = :python.call(pid,:os,x,[])
    :python.call(pid,:os,:chdir,[cwd<>"/scripts/"])

    # Call function
    willBuy =  :python.call(pid,:human,:willBuy,[age])

    :python.stop(pid)
    willBuy
  end

  @impl true
  def handle_info(:human_msg, mind) do
    {:noreply, Map.put(mind, "msg", true)}
  end

end