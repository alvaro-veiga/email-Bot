
local smtp = require("socket.smtp")
local mime = require("mime")

local server = "smtp.gmail.com"
local port = 587
local username = "test@gmail.com"
local password = "123"

local message = {
    headers = {
        to = "client@email.com",
        subject = "test"
    },
    body = "this is a test e-mail!"
}

function auth()
    return smtp.login(server, username, password)
end

function sendEmail()
    local ok, err = smtp.send {
        from = "test@gmail.com",
        rcpt = "client@email.com",
        source = smtp.message(message),
        user = username,
        password = password,
        server = server,
        port = port,
        create = auth
    }

    if not ok then
        print("Faild to send e-mail: " .. err)
    else
        print("E-mail sendded success!")
    end
end

sendEmail()
