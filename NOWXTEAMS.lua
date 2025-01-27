-- Cấu trúc các phần tử trong UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- UI Frame chính
local uiFrame = Instance.new("Frame")
uiFrame.Size = UDim2.new(0, 400, 0, 500)
uiFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
uiFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
uiFrame.Visible = true
uiFrame.Parent = screenGui

-- Nút Toggle ẩn/hiện UI
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 0, 1, -60)
toggleButton.Text = "Toggle UI"
toggleButton.Parent = screenGui

-- TextBox để nhập ID item
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0, 30)
textBox.PlaceholderText = "Nhập ID Item"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Parent = uiFrame

-- Button xử lý ID item
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 300, 0, 40)
submitButton.Position = UDim2.new(0.5, -150, 0, 80)
submitButton.Text = "Xử lý ID"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
submitButton.Parent = uiFrame

-- Label hiển thị tên Item
local itemLabel = Instance.new("TextLabel")
itemLabel.Size = UDim2.new(0, 300, 0, 40)
itemLabel.Position = UDim2.new(0.5, -150, 0, 130)
itemLabel.Text = "Tên Item: Chưa có"
itemLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
itemLabel.BackgroundTransparency = 1
itemLabel.Parent = uiFrame

-- Label hiển thị số lượng stock
local stockLabel = Instance.new("TextLabel")
stockLabel.Size = UDim2.new(0, 300, 0, 40)
stockLabel.Position = UDim2.new(0.5, -150, 0, 170)
stockLabel.Text = "Số lượng còn lại: 0"
stockLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
stockLabel.BackgroundTransparency = 1
stockLabel.Parent = uiFrame

-- ImageLabel hiển thị hình ảnh item
local imageLabel = Instance.new("ImageLabel")
imageLabel.Size = UDim2.new(0, 100, 0, 100)
imageLabel.Position = UDim2.new(0.5, -50, 0, 210)
imageLabel.Image = "rbxassetid://0000000000"  -- Placeholder image
imageLabel.BackgroundTransparency = 1
imageLabel.Parent = uiFrame

-- Button Claim Item
local claimButton = Instance.new("TextButton")
claimButton.Size = UDim2.new(0, 300, 0, 40)
claimButton.Position = UDim2.new(0.5, -150, 0, 320)
claimButton.Text = "Claim Item"
claimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
claimButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
claimButton.Visible = false
claimButton.Parent = uiFrame

-- TextBox để nhập UGC Code
local ugcCodeBox = Instance.new("TextBox")
ugcCodeBox.Size = UDim2.new(0, 300, 0, 40)
ugcCodeBox.Position = UDim2.new(0.5, -150, 0, 370)
ugcCodeBox.PlaceholderText = "Nhập Code UGC"
ugcCodeBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ugcCodeBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ugcCodeBox.Parent = uiFrame

-- Button để xử lý UGC Code
local ugcSubmitButton = Instance.new("TextButton")
ugcSubmitButton.Size = UDim2.new(0, 300, 0, 40)
ugcSubmitButton.Position = UDim2.new(0.5, -150, 0, 420)
ugcSubmitButton.Text = "Nhập Code UGC"
ugcSubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ugcSubmitButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ugcSubmitButton.Parent = uiFrame

-- Tạo nút Auto-Click và Auto-Claim
local autoClickButton = Instance.new("TextButton")
autoClickButton.Size = UDim2.new(0, 300, 0, 40)
autoClickButton.Position = UDim2.new(0.5, -150, 0, 470)
autoClickButton.Text = "Bật Auto-Click"
autoClickButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoClickButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
autoClickButton.Parent = uiFrame

local autoClaimButton = Instance.new("TextButton")
autoClaimButton.Size = UDim2.new(0, 300, 0, 40)
autoClaimButton.Position = UDim2.new(0.5, -150, 0, 520)
autoClaimButton.Text = "Bật Auto-Claim"
autoClaimButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoClaimButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
autoClaimButton.Parent = uiFrame

-- Biến trạng thái bật/tắt auto-click và auto-claim
local isAutoClickEnabled = false
local isAutoClaimEnabled = false

-- Cơ sở dữ liệu item UGC Limited (giả lập)
local itemDatabase = {
    ["123"] = {name = "Kiếm Thần Bí UGC", stock = 50, imageUrl = "rbxassetid://1234567890"},
    ["456"] = {name = "Khiên Vàng UGC", stock = 10, imageUrl = "rbxassetid://9876543210"},
    ["789"] = {name = "Phép Thuật Cổ Đại UGC", stock = 0, imageUrl = "rbxassetid://1122334455"},
}

-- Cơ sở dữ liệu UGC Code (giả lập)
local ugcCodeDatabase = {
    ["FLEX123"] = {name = "Kiếm Thần Bí", reward = "50 Robux"},
    ["FLEX456"] = {name = "Khiên Vàng", reward = "100 Robux"},
}

-- Hàm cập nhật thông tin item
local function updateItemInfo(itemID)
    -- Kiểm tra nếu ID là một item trong cơ sở dữ liệu
    local itemData = itemDatabase[itemID]
    
    -- Nếu có item trong cơ sở dữ liệu
    if itemData then
        itemLabel.Text = "Tên Item: " .. itemData.name
        stockLabel.Text = "Số lượng còn lại: " .. itemData.stock
        imageLabel.Image = itemData.imageUrl

        -- Hiển thị nút claim nếu có hàng
        if itemData.stock > 0 then
            claimButton.Visible = true
        else
            claimButton.Visible = false
            stockLabel.Text = "Item đã hết hàng!"
        end
    else
        itemLabel.Text = "Không tìm thấy item."
        stockLabel.Text = ""
        imageLabel.Image = ""
        claimButton.Visible = false
    end
end

-- Xử lý ID Item
submitButton.MouseButton1Click:Connect(function()
    local inputID = textBox.Text
    updateItemInfo(inputID)
end)

-- Xử lý UGC Code
ugcSubmitButton.MouseButton1Click:Connect(function()
    local inputCode = ugcCodeBox.Text
    local ugcItem = ugcCodeDatabase[inputCode]
    
    -- Kiểm tra nếu code có trong cơ sở dữ liệu
    if ugcItem then
        print("Code hợp lệ: " .. ugcItem.name .. " - " .. ugcItem.reward)
        -- Hiển thị thông tin thưởng (reward) khi nhập code đúng
        itemLabel.Text = "Code UGC: " .. ugcItem.name
        stockLabel.Text = "Thưởng: " .. ugcItem.reward
        imageLabel.Image = "rbxassetid://1122334455"  -- Thay hình ảnh phù hợp với reward
    else
        print("Code không hợp lệ!")
        itemLabel.Text = "Không tìm thấy code UGC!"
        stockLabel.Text = ""
        imageLabel.Image = ""
    end
end)

-- Claim Item
claimButton.MouseButton1Click:Connect(function()
    local inputID = textBox.Text
    local itemData = itemDatabase[inputID]

    if itemData and itemData.stock > 0 then
        itemData.stock = itemData.stock - 1
        stockLabel.Text = "Số lượng còn lại: " .. itemData.stock
        print("Bạn đã claim item: " .. itemData.name)
        claimButton.Visible = false
    else
        print("Item không còn nữa hoặc không tồn tại.")
    end
end)

-- Tạo tính năng Auto-Click
autoClickButton.MouseButton1Click:Connect(function()
    isAutoClickEnabled = not isAutoClickEnabled
    if isAutoClickEnabled then
        autoClickButton.Text = "Tắt Auto-Click"
        -- Thực hiện hành động auto-click
        while isAutoClickEnabled do
            submitButton.MouseButton1Click:Fire()
            wait(1)  -- Click mỗi giây
        end
    else
        autoClickButton.Text = "Bật Auto-Click"
    end
end)

-- Tạo tính năng Auto-Claim
autoClaimButton.MouseButton1Click:Connect(function()
    isAutoClaimEnabled = not isAutoClaimEnabled
    if isAutoClaimEnabled then
        autoClaimButton.Text = "Tắt Auto-Claim"
        -- Thực hiện auto-claim item
        while isAutoClaimEnabled do
            claimButton.MouseButton1Click:Fire()
            wait(1)  -- Claim mỗi giây
        end
    else
        autoClaimButton.Text = "Bật Auto-Claim"
    end
end)

-- Cửa sổ UI có thể di chuyển
local dragging = false
local dragInput = nil
local dragStart = nil
local startPos = nil

uiFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = uiFrame.Position
    end
end)

uiFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        uiFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

uiFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- Nút để ẩn hoặc hiện cửa sổ UI
toggleButton.MouseButton1Click:Connect(function()
    if uiFrame.Visible then
        uiFrame.Visible = false
    else
        uiFrame.Visible = true
    end
end)
