local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local workspace = game:GetService("Workspace")
local self = game.Players.LocalPlayer
local T1 = wndw:Tab("Main")
local T3 = wndw:Tab("Easter Event")

local const = {
  train = false,
  punch = false,
  spin = false,
  reward = false,
  egg = {
    table = {},
    name = "",
    toggle = false
  },
  easter = false,
  reb = false,
  near = true
}

--lib:AddTable(,{})

local function child(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

 T1:Toggle("Auto train",false,function(value)
    const.train = value
    while wait() do
      if const.train == false then break end
      game:GetService("ReplicatedStorage")["BridgeNet"]["dataRemoteEvent"]:FireServer({"1","\11"})
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

T3:Toggle("Use nearest system [ 25 Distance ]",true,function(value)
    const.near = value
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
