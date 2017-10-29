- mjpg-streamer  
    视频传输
    [mjpg-streamer github](https://github.com/jacksonliam/mjpg-streamer)
```shell
# 打开树莓派摄像头，发送http视频
./mjpg-streamer -i "input_raspicam.so" -o "output_http.so -w www"
./mjpg_streamer -i "input_uvc.so -d /dev/video0 -f 30" -o "output_http.so -w www"

# http视频打开地址
192.168.31.133:8080/?action=stream

# 发送rtsp视频
./mjpg-streamer - i "input_raspicam.so" -o "output_rtsp.so"

# 视频打开地址
```