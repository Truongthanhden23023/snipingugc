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

-- TextBox để nhập ID item hoặc link item
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 300, 0, 40)
textBox.Position = UDim2.new(0.5, -150, 0, 30)
textBox.PlaceholderText = "Nhập ID hoặc Link Item"
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textBox.Parent = uiFrame

-- Button xử lý ID item hoặc link item
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0, 300, 0, 40)
submitButton.Position = UDim2.new(0.5, -150, 0, 80)
submitButton.Text = "Xử lý"
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

-- Label hiển thị số lượng stock (chỉ hiển thị cho item UGC Limited)
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

-- Nút Browser để mở Google (hoặc trang web khác)
local browserButton = Instance.new("TextButton")
browserButton.Size = UDim2.new(0, 300, 0, 40)
browserButton.Position = UDim2.new(0.5, -150, 0, 570)
browserButton.Text = "Mở Browser"
browserButton.TextColor3 = Color3.fromRGB(255, 255, 255)
browserButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
browserButton.Parent = uiFrame

-- Hàm mở trình duyệt web bên trong Roblox (chỉ có thể mở các trang web trong Roblox)
browserButton.MouseButton1Click:Connect(function()
    -- Mở Google trong Roblox (hoặc trang web khác)
    game:GetService("GuiService"):OpenBrowserWindow("https://www.google.com") -- Mở trang Google
    print("Mở trang web Google: https://www.google.com")
end)

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

-- Hàm lấy ID từ Link
local function getItemIdFromLink(link)
    -- Giả sử rằng item link có định dạng: https://www.roblox.com/catalog/ID_ITEM
    local idPattern = "catalog/(%d+)"
    local itemId = string.match(link, idPattern)
    return itemId
end

-- Hàm cập nhật thông tin item (không kiểm tra stock đối với item bình thường)
local function updateItemInfo(itemID)
    -- Kiểm tra nếu ID là một item trong cơ sở dữ liệu
    local itemData = itemDatabase[itemID]
    
    -- Nếu có item trong cơ sở dữ liệu
    if itemData then
        itemLabel.Text = "Tên Item: " .. itemData.name
        imageLabel.Image = itemData.imageUrl

        -- Nếu là item UGC Limited, hiển thị stock
        if itemData.stock then
            stockLabel.Text = "Số lượng còn lại: " .. itemData.stock
            claimButton.Visible = true
        else
            stockLabel.Text = ""
            claimButton.Visible = false
        end
    else
        itemLabel.Text = "Không tìm thấy item."
        stockLabel.Text = ""
        imageLabel.Image = ""
        claimButton.Visible = false
    end
end

-- Xử lý ID Item hoặc Link Item
submitButton.MouseButton1Click:Connect(function()
    local inputText = textBox.Text
    local itemID = nil
    
    -- Kiểm tra nếu nhập link
    if string.find(inputText, "https://www.roblox.com/catalog/") then
        itemID = getItemIdFromLink(inputText)  -- Lấy ID từ link
    else
        itemID = inputText  -- Nếu không phải link, coi như là ID
    end
    
    if itemID then
        updateItemInfo(itemID)
    else
        itemLabel.Text = "Không tìm thấy item."
        stockLabel.Text = ""
        imageLabel.Image = ""
        claimButton.Visible = false
    end
end)

-- Thêm chức năng Claim cho item UGC (giả lập)
claimButton.MouseButton1Click:Connect(function()
    -- Thực hiện claim item (giả lập)
    print("Claiming item!")
end)
