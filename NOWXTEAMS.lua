-- Cấu trúc các phần tử trong UI
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- UI Frame chính
local uiFrame = Instance.new("Frame")
uiFrame.Size = UDim2.new(0, 400, 0, 350)
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

-- TextBox để nhập mã code UGC
local ugcCodeTextBox = Instance.new("TextBox")
ugcCodeTextBox.Size = UDim2.new(0, 300, 0, 40)
ugcCodeTextBox.Position = UDim2.new(0.5, -150, 0, 370)
ugcCodeTextBox.PlaceholderText = "Nhập mã UGC"
ugcCodeTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ugcCodeTextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ugcCodeTextBox.Parent = uiFrame

-- Button xử lý mã code UGC
local submitUGCButton = Instance.new("TextButton")
submitUGCButton.Size = UDim2.new(0, 300, 0, 40)
submitUGCButton.Position = UDim2.new(0.5, -150, 0, 420)
submitUGCButton.Text = "Xử lý mã UGC"
submitUGCButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitUGCButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
submitUGCButton.Parent = uiFrame

-- Button Claim UGC Item
local claimUGCButton = Instance.new("TextButton")
claimUGCButton.Size = UDim2.new(0, 300, 0, 40)
claimUGCButton.Position = UDim2.new(0.5, -150, 0, 470)
claimUGCButton.Text = "Claim UGC"
claimUGCButton.TextColor3 = Color3.fromRGB(255, 255, 255)
claimUGCButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
claimUGCButton.Visible = false
claimUGCButton.Parent = uiFrame

-- Cơ sở dữ liệu item UGC Limited (giả lập) với hình ảnh từ Roblox Asset
local itemDatabase = {
    ["123"] = {name = "Kiếm Thần Bí UGC", stock = 50, imageUrl = "rbxassetid://1234567890"}, -- Thay bằng asset hợp lệ
    ["456"] = {name = "Khiên Vàng UGC", stock = 10, imageUrl = "rbxassetid://9876543210"}, -- Thay bằng asset hợp lệ
    ["789"] = {name = "Phép Thuật Cổ Đại UGC", stock = 0, imageUrl = "rbxassetid://1122334455"}, -- Đã hết hàng
}

-- Cơ sở dữ liệu mã code UGC (giả lập)
local ugcCodeDatabase = {
    ["FLEX123"] = {itemID = "123", discount = 10}, -- Mã code giảm giá 10% cho item 123
    ["LIMITED456"] = {itemID = "456", discount = 20}, -- Mã code giảm giá 20% cho item 456
}

-- Hàm cập nhật thông tin item
local function updateItemInfo(itemID)
    if itemDatabase[itemID] then
        local itemData = itemDatabase[itemID]
        itemLabel.Text = "Tên Item: " .. itemData.name -- Hiển thị tên item
        stockLabel.Text = "Số lượng còn lại: " .. itemData.stock -- Hiển thị số lượng còn lại
        imageLabel.Image = itemData.imageUrl -- Hiển thị hình ảnh item

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
        imageLabel.Image = "" -- Ẩn hình ảnh nếu không tìm thấy item
        claimButton.Visible = false -- Ẩn nút claim nếu không tìm thấy item
    end
end

-- Hàm xử lý mã code UGC
local function processUGCCode(code)
    if ugcCodeDatabase[code] then
        local ugcData = ugcCodeDatabase[code]
        local itemData = itemDatabase[ugcData.itemID]

        -- Thông báo người dùng về mã code và giảm giá nếu có
        print("Mã code hợp lệ! Giảm giá " .. ugcData.discount .. "% cho item: " .. itemData.name)
        stockLabel.Text = "Giảm giá " .. ugcData.discount .. "% cho item: " .. itemData.name
        -- Hiển thị nút claim UGC
        claimUGCButton.Visible = true
    else
        print("Mã code không hợp lệ!")
        stockLabel.Text = "Mã code không hợp lệ!"
        claimUGCButton.Visible = false
    end
end

-- Khi nhấn nút "Xử lý", bot tự động hiển thị thông tin item
submitButton.MouseButton1Click:Connect(function()
    local inputID = textBox.Text -- Lấy ID từ TextBox
    updateItemInfo(inputID) -- Cập nhật thông tin item theo ID
end)

-- Khi nhấn nút "Claim", giảm số lượng stock và thông báo đã nhận
claimButton.MouseButton1Click:Connect(function()
    local inputID = textBox.Text
    local itemData = itemDatabase[inputID]

    if itemData and itemData.stock > 0 then
        itemData.stock = itemData.stock - 1 -- Giảm số lượng khi đã claim

        -- Cập nhật lại thông tin sau khi claim
        stockLabel.Text = "Số lượng còn lại: " .. itemData.stock
        print("Bạn đã claim item: " .. itemData.name)

        -- Ẩn nút claim sau khi nhận item
        claimButton.Visible = false
    else
        print("Item không còn nữa hoặc không tồn tại.")
    end
end)

-- Khi nhấn nút "Submit UGC Code"
submitUGCButton.MouseButton1Click:Connect(function()
    local ugcCode = ugcCodeTextBox.Text -- Lấy mã code từ TextBox
    processUGCCode(ugcCode) -- Xử lý mã code
end)

-- Khi nhấn nút "Claim UGC", giảm số lượng stock và thông báo đã nhận UGC item
claimUGCButton.MouseButton1Click:Connect(function()
    local ugcCode = ugcCodeTextBox.Text
    local ugcData = ugcCodeDatabase[ugcCode]
    local itemData = itemDatabase[ugcData.itemID]

    if itemData and itemData.stock > 0 then
        itemData.stock = itemData.stock - 1 -- Giảm số lượng khi đã claim
        stockLabel.Text = "Số lượng còn lại: " .. itemData.stock
        print("Bạn đã claim UGC item: " .. itemData.name)

        -- Ẩn nút claim sau khi nhận item
        claimUGCButton.Visible = false
    else
        print("Item không còn nữa hoặc không tồn tại.")
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
        uiFrame.Visible = false -- Ẩn UI
    else
        uiFrame.Visible = true -- Hiện UI
    end
end)
