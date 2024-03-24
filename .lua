local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local workspace = game:GetService("Workspace")
local self = game.Players.LocalPlayer
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local T3 = wndw:Tab("Easter Event")

local const = {
  train = false,
  punch = false,
  spin = false,
  reward = false,
  boss = {
    table = {},
    name = "First",
    toggle = false
  },
  easter = false,
  reb = false,
  near = true,
  roll1 = false,
  roll2 = false,
  roll3 = false,
  egg = {
    args1 = "",
    args2 = "",
    toggle = false
  }
}

lib:AddTable(workspace.Items.Easter.ClientBoss,const.boss.table)

local function child(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

 T1:Toggle("Auto train",false,function(value)
    const.train = value
    while wait() do
      if const.train == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({tostring(self:GetAttribute("World"):gsub("World","")),"\11"})
    end
  end)

T1:Toggle("Auto mechine punch",false,function(value)
    const.punch = value
    while wait() do
      if const.punch == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PBD","10.049999999999"},"\n")
    end
  end)

T1:Toggle("Auto spin",false,function(value)
    const.spin = value
    while wait() do
      if const.spin == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"Wheelspin","\20"})
    end
  end)

T1:Toggle("Auto claim online rewards",false,function(value)
    const.reward = value
    while wait() do
      if const.reward == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT1","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT2","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT3","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT4","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT5","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT6","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT7","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT8","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT9","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT10","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT11","\20"})
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"PT12","\20"})
    end
  end)

T1:Toggle("Auto rebirth",false,function(value)
    const.reb = value
    while wait() do
      if const.reb == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"R","\4"})
    end
  end)

T1:Toggle("Auto roll puzzles",false,function(value)
    const.roll1 = value
    while wait() do
      if const.roll1 == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"CraftRoll","\20"})
    end
  end)

T1:Toggle("Auto roll event",false,function(value)
    const.roll2 = value
    while wait() do
      if const.roll2 == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"EventRoll","\20"})
    end
  end)

T1:Toggle("Auto roll artifact",false,function(value)
    const.roll3 = value
    while wait() do
      if const.roll3 == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({{"Roll","First"},"\7"})
    end
  end)

T2:Toggle("Auto hatch",false,function(value)
    const.egg.toggle = value
    while wait() do
      if const.egg.toggle == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({{"\1",const.egg.args1,const.egg.args2},"\6"})
    end
  end)

T3:Dropdown("Choose boss",const.boss.table,function(value)
    const.boss.name = value
end)

T3:Toggle("Use nearest system [ 25 Distance ]",true,function(value)
    const.near = value
end)

T3:Toggle("Instant win",false,function(value)
    const.boss.toggle = value
    while wait() do
      if const.boss.toggle == false then break end
        game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({{"BossDone",const.boss.name,"1"},"\n"})
    end
  end)

--{{"Hit",v.Name},"\16","\11"}
T3:Toggle("Auto hit all eggs",false,function(value)
    const.easter = value
    while wait() do
      if const.easter == false then break end
      child(workspace.Items.Easter.ClientEasterEggs,function(v)
          if const.near == true then
            if (self.Character.HumanoidRootPart.Position - v.Position).Magnitude < 25 then
              game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({{"Hit",v.Name},"\16","\11"})
            end
          else
            game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({{"Hit",v.Name},"\16","\11"})
          end
      end)
    end
  end)

lib:HookFunction(function(method,hook,args)
    if method == "FireServer" and hook == "dataRemoteEvent" and args[1][1][1] == "\1" and args[1][2] == "\6" then
      const.egg.args1 = args[1][1][2]
      const.egg.args2 = args[1][1][3]
    end
end)
