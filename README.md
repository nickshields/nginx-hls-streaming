# nginx-hls-streaming

How to use this:
1. Clone the Repo
2. Ensure that docker is installed on your machine.
3. cd into the directory
4. docker build .
5. docker run -P <name-of-image>


Now use docker ps to find out how the ports are being mapped.
In OBS, the link to stream to will be something like rtmp://127.0.0.1:<port-mapped-to-1935>/show
To view the stream, the link will be something like http://127.0.0.1:<port-mapped-to-8080>/hls/<obs-stream-key>.m3u8


