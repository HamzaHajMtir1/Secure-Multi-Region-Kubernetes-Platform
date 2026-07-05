const http = require("http");

const PORT = 3000;

const server = http.createServer((req, res) => {
    if (req.url === "/health") {
        res.writeHead(200, {
            "Content-Type": "application/json"
        });
        return res.end(JSON.stringify({
            status: "ok"
        }));
    }

    res.writeHead(200, {
        "Content-Type": "application/json"
    });

    res.end(JSON.stringify({
        message: "Secure Multi-Region Kubernetes Platform",
        status: "running"
    }));
});

server.listen(PORT, "0.0.0.0", () => {
    console.log(`Server running on port ${PORT}`);
});