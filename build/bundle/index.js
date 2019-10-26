"use strict";

var _express = _interopRequireDefault(require("express"));

var _path = _interopRequireDefault(require("path"));

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { "default": obj }; }

var PORT = 8080;
var app = (0, _express["default"])();
app.use(_express["default"]["static"](_path["default"].join(__dirname, "/../public")));
app.get("/ping", function (req, res) {
  return res.send("pong");
});
app.get("/", function (req, res) {
  res.sendFile(_path["default"].join(__dirname, "/../public", "index.html"));
});
app.listen(8080);
console.log("Web server started on port ".concat(PORT));