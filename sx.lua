

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()



local MainHold = {}
   
      local PJMNotify = Instance.new("ScreenGui")
      PJMNotify.Name = "PJMNotify"
      PJMNotify.Parent = game.CoreGui
      PJMNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

function MainHold:Notify(text, discription, img)

   local HolderFrame = Instance.new("Frame")
   local HolderFrameLayout = Instance.new("UIListLayout")
   local MainFrame = Instance.new("Frame")
   local MainFrameCorner = Instance.new("UICorner")
   local PJMImage = Instance.new("ImageLabel")
   local PJMImageCorner = Instance.new("UICorner")
   local PJMTitle = Instance.new("TextLabel")
   local PJMDesc = Instance.new("TextLabel")
   local TimeFrame = Instance.new("Frame")
   local TimeFrameCorner = Instance.new("UICorner")
   
   HolderFrame.Name = "HolderFrame"
   HolderFrame.Parent = game.CoreGui:FindFirstChild("PJMNotify")
   HolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   HolderFrame.BackgroundTransparency = 1.000
   HolderFrame.Position = UDim2.new(0.844646633, 0, 0.485636115, 0)
   HolderFrame.Size = UDim2.new(0.14975509, 0, 0.470588207, 0)
   HolderFrame.ZIndex = 98
   
   HolderFrameLayout.Name = "HolderFrameLayout"
   HolderFrameLayout.Parent = HolderFrame
   HolderFrameLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
   HolderFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
   HolderFrameLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
   HolderFrameLayout.Padding = UDim.new(0, 5)
   
   MainFrame.Name = "MainFrame"
   MainFrame.Parent = game.CoreGui.PJMNotify:FindFirstChild("HolderFrame")
   MainFrame.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
   MainFrame.Position = UDim2.new(-0.219626144, 0, 0.715116322, 0)
   MainFrame.Size = UDim2.new(1.21962595, 0, 0.284883738, 0)
   MainFrame.ZIndex = 99
   
   MainFrameCorner.CornerRadius = UDim.new(0, 5)
   MainFrameCorner.Name = "MainFrameCorner"
   MainFrameCorner.Parent = MainFrame
   
   PJMImage.Name = "PJMImage"
   PJMImage.Parent = MainFrame
   PJMImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   PJMImage.BackgroundTransparency = 1.000
   PJMImage.Position = UDim2.new(0.0344827585, 0, 0.163265303, 0)
   PJMImage.Size = UDim2.new(0.260536402, 0, 0.673469365, 0)
   PJMImage.Image = img or ""
   
   PJMImageCorner.CornerRadius = UDim.new(0, 5)
   PJMImageCorner.Name = "PJMImageCorner"
   PJMImageCorner.Parent = PJMImage
   
   PJMTitle.Name = "PJMTitle"
   PJMTitle.Parent = MainFrame
   PJMTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   PJMTitle.BackgroundTransparency = 1.000
   PJMTitle.Position = UDim2.new(0.541121364, 0, 0.0695263371, 0)
   PJMTitle.Size = UDim2.new(0.165342644, 0, 0.168849692, 0)
   PJMTitle.Font = Enum.Font.Gotham
   PJMTitle.Text = text or "Project Meow"
   PJMTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
   PJMTitle.TextSize = 17.000
   
   PJMDesc.Name = "PJMDesc"
   PJMDesc.Parent = MainFrame
   PJMDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   PJMDesc.BackgroundTransparency = 1.000
   PJMDesc.Position = UDim2.new(0.507301271, 0, 0.427090406, 0)
   PJMDesc.Size = UDim2.new(0.232982814, 0, 0.139052689, 0)
   PJMDesc.Font = Enum.Font.Gotham
   PJMDesc.Text = discription or "your text here!"
   PJMDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
   PJMDesc.TextSize = 14.000
   
   TimeFrame.Name = "TimeFrame"
   TimeFrame.Parent = MainFrame
   TimeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   TimeFrame.BackgroundTransparency = 0.750
   TimeFrame.Position = UDim2.new(0.0409998819, 0, 0.909864724, 0)
   TimeFrame.Size = UDim2.new(0.925369203, 0, 0.0397293456, 0)
   
   TimeFrameCorner.CornerRadius = UDim.new(0, 2)
   TimeFrameCorner.Name = "TimeFrameCorner"
   TimeFrameCorner.Parent = TimeFrame

   if PJMImage.Image == "" then
      PJMDesc.Position = UDim2.new(0.383307576, 0, 0.405625135, 0)
      PJMTitle.Position = UDim2.new(0.417127669, 0, 0.0909916162, 0)
   end

   TweenService:Create(
      TimeFrame,
      TweenInfo.new(9, Enum.EasingStyle.Quad),
      {Size = UDim2.new(0, 0, 0.0397293419, 0)}
  ):Play()

  repeat task.wait() until TimeFrame.Size == UDim2.new(0, 0, 0.0397293419, 0)

  PJMTitle.Visible = false
  PJMDesc.Visible = false
  PJMImage.Visible = false
  TimeFrame.Visible = false

  TweenService:Create(
      MainFrame,
      TweenInfo.new(.3, Enum.EasingStyle.Quad),
      {BackgroundTransparency = 1}
  ):Play()

  repeat task.wait() until MainFrame.BackgroundTransparency == 1

  MainFrame:Destroy()
  
    for i,v in pairs(game.CoreGui:FindFirstChild("PJMNotify"):GetChildren()) do
        if not v:FindFirstChild("MainFrame") then
            v:Destroy()
        end
    end
    for i,v in pairs(game.CoreGui:GetChildren()) do
        if v.Name == "PJMNotify" and not v:FindFirstChild("PJMNotify") then
            v:Destroy()
        end
    end
    
    local PJMNotify = Instance.new("ScreenGui")
    PJMNotify.Name = "PJMNotify"
    PJMNotify.Parent = game.CoreGui
    PJMNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
end

return MainHold
