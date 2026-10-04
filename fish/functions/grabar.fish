function grabar
    mkdir -p ~/Videos
    set -l salida ~/Videos/gameplay_(date +%Y-%m-%d_%H-%M-%S).mp4
    gpu-screen-recorder -w HDMI-A-1 -f 60 -a "default_output|alsa_input.usb-USB_Microphone_USB_Microphone_20200508V100-00.mono-fallback" -q very_high -o $salida
end
