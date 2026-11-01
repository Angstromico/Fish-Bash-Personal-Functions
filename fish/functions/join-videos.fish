function join-videos --description "Join one or more videos with FFmpeg copy"
    set -l total (count $argv)
    if test $total -lt 3
        echo "Uso: join-videos video1.mp4 video2.mp4 [video3.mp4 ...] blend.mp4"
        return 1
    end

    set -l salida $argv[-1]
    set -l entradas $argv[1..-2]
    set -l tmp_list (mktemp /tmp/ffmpeg_concat_XXXXXX.txt)

    for vid in $entradas
        set -l ruta (realpath $vid)
        echo "file '$ruta'" >> $tmp_list
    end

    echo "Joining videos: $salida..."
    ffmpeg -f concat -safe 0 -i $tmp_list -c copy $salida

    rm -f $tmp_list
end
