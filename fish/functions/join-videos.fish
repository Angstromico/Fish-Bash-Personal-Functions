function join-videos --description "Une dos o más videos en orden usando FFmpeg copy"
    set -l total (count $argv)
    if test $total -lt 3
        echo "Uso: join-videos video1.mp4 video2.mp4 [video3.mp4 ...] salida.mp4"
        return 1
    end

    set -l salida $argv[-1]
    set -l entradas $argv[1..-2]
    set -l tmp_list (mktemp /tmp/ffmpeg_concat_XXXXXX.txt)

    for vid in $entradas
        echo "file '(realpath $vid)'" >> $tmp_list
    end

    echo "Concatenando videos en: $salida..."
    ffmpeg -f concat -safe 0 -i $tmp_list -c copy $salida

    rm -f $tmp_list
end
