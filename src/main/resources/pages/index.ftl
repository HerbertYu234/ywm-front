<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>websocket测试</title>
    <style type="text/css">
        h3, h4 {
            text-align: center;
        }
    </style>
</head>
<body>

<h3>WebSocket测试，在<span style="color:red">控制台</span>查看测试信息输出！</h3>
<h4>
<#--[url=/api/ws/sendOne?message=单发消息内容&id=none]单发消息链接[/url]-->
<#--[url=/api/ws/sendAll?message=群发消息内容]群发消息链接[/url]-->
</h4>


<script type="text/javascript">
    var socket;
    if (typeof (WebSocket) == "undefined") {
        console.log("遗憾：您的浏览器不支持WebSocket");
    } else {
        //实例化WebSocket对象
        //指定要连接的服务器地址与端口建立连接
        //注意ws、wss使用不同的端口。ws对应http、wss对应https。

        // 通过路径传递参数的方法（服务端采用第一种方法"@ServerEndpoint"实现）
        // socket = new WebSocket("ws://127.0.0.1:7700/ws/testid");

        // 通过类似GET请求方式传递参数的方法（服务端采用第二种方法"WebSocketHandler"实现）
        socket = new WebSocket("ws://127.0.0.1:7700/ws?key=testid&secret=yhb&type=t1");

        //连接打开事件
        socket.onopen = function (evt) {
            console.log("Socket 已打开", evt);
            // socket.send("消息发送测试(From Client)");
        };

        // 收到的是 blob 数据
        //ws.binaryType = "blob";
        //ws.onmessage = function(e) {
        //  console.log(e.data.size);
        //};

        // 收到的是 ArrayBuffer 数据
        //ws.binaryType = "arraybuffer";
        //ws.onmessage = function(e) {
        //  console.log(e.data.byteLength);
        //};

        //收到消息事件
        socket.onmessage = function (evt) {
            console.log("...onmessage: ", evt);

            if (typeof evt.data == "string") {
                let msg = JSON.parse(evt.data);
                console.log("Received data string", msg);
                if(msg.socketSessionId){
                    socket.sessionId = msg.socketSessionId;
                }
            }

            if (evt.data instanceof ArrayBuffer) {
                console.log("Received data arraybuffer");
            }

            if (evt.data instanceof Blob) {
                console.log("Received data blob");
            }
        };
        //连接关闭事件
        socket.onclose = function (evt) {
            console.log("Socket已关闭", evt);
        };
        //发生了错误事件
        socket.onerror = function (evt) {
            alert("Socket发生了错误", evt);
        };

        //窗口关闭时，关闭连接
        window.unload = function () {
            socket.close();
        };
    }
</script>

</body>
</html>