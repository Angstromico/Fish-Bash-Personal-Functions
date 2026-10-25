function set-mic --description 'Ajusta el volumen del micrófono predeterminado'
    set -l vol $argv[1]
    if test -z "$vol"
        set vol "60%"
    else if not string match -q "*%" $vol
        set vol "$vol%"
    end

    wpctl set-volume @DEFAULT_AUDIO_SOURCE@ $vol
    echo "Volumen del micrófono ajustado a $vol"
end
