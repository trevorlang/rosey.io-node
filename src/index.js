import express from 'express';
import path from 'path';

const PORT = 8080;

const app = express();

app.use(express.static(path.join(__dirname, "/../public")));

app.get("/ping", (req, res) => {
  return res.send("pong");
});

app.get("/", (req, res) => {
  res.sendFile(path.join(__dirname, "/../public", "index.html"));
});

app.listen(8080);

console.log(`Web server started on port ${PORT}`);
