local http = require("connect"); -- импорт connect

local router = http.router()

local ip = "localhost" -- Ип сервера, в случае если ставить на сервер - писать глобальный ип
local port = "80" -- Порт сервера
local site = "./src/" -- Путь до сайта


http.server = function(req,res) {
	res.setHeader('Access-Control-Allow-Origin', '*'); -- Устанавливаю хедер
	res.header('Access-Control-Allow-Methods', '*'); -- Устанавливаю хедер
	res.header('Access-Control-Allow-Headers', '*'); -- Устанавливаю хедер
	res.header('Access-Control-Allow-Credentials', true); -- Устанавливаю хедер
}

router.get("/api/", function (req, res) -- создаю get роутер для запроса localhost:80/api/

	res.send(200, "Hello world!"); -- Возвращает 200 (успех) и строку Hello world!

end)

router.post("/api/", function (req, res) -- создаю post роутер для запроса localhost:80/api/

	console.log(req.data) -- Принтит из x-www-form-urlencoded
	res.send(200) -- Возвращает 200 (успех)

end)

router.put("/api/", function (req, res) -- создаю put роутер для запроса localhost:80/api/

	console.log(req.data) -- Принтит из x-www-form-urlencoded
	res.send(200) -- Возвращает 200 (успех)

end)

router.delete("/api/", function (req, res) -- создаю delete роутер для запроса localhost:80/api/

	res.send(200) -- Возвращаею 200 (успех)

end)

router.get("/", site.."index.html") -- В случае захода через браузер возвращает сайт

http.listen(ip, port, server); -- Начинает работу сервера
