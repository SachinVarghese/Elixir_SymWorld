defmodule SymWorld do
  use Application, Task
  @moduledoc """
  Documentation for SymWorld.
  """

  @doc """
  Hello world.
  """
    
  def start(_type, _args) do 
    appName = Application.get_env(:sym_world, :AppName) 
    Task.start(fn -> main("Welcome to "<>appName<>"!") end)
  end

  def main(args) do
    IO.puts "Simulating World..."
    # simulateWorld()
    IO.puts "Simulation Ends."
    args
  end

  def simulateWorld() do 
    {:ok, pid} = HumanWorld.start_link([])
    HumanWorld.create(pid,"Tom Cruise")
    {:ok, person} = HumanWorld.lookup(pid,"Tom Cruise")
    HumanAgent.addMemory(person,"age",50)
    HumanAgent.getMemory(person,"buy")
    
    #send Message
    sendMessage(person)

    HumanAgent.getMemory(person,"msg")
    HumanAgent.killHuman(person)
    # {:ok, _person} = HumanWorld.lookup(pid,"Tom Cruise")
    HumanWorld.destroy(pid)
  end  



  def sendMessage(id) do 
    path = to_charlist(Application.app_dir(:sym_world,"scripts"))
    {:ok, pid} =:python.start([{:python_path,path}])
    cwd = :python.call(pid,:os,:getcwd,[])
    :python.call(pid,:os,:chdir,[cwd<>"/scripts/"])
    # Pass message
    :python.call(pid,:human,:message_init,[id])
    :python.cast(pid,"Hello Human")
    # flush()
    # :python.stop(pid)

  end

end
