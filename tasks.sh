#!/bin/bash

run () {

    ./gradlew assembleDebug ;
    adb install -r app/build/outputs/apk/app-debug-unaligned.apk;
    adb shell am start -n com.example.joao.myapplication/.MyActivity

    leave 1
}

leave() {
    exit $1
}

usage() {
    echo ""
    echo "Modo de uso: ./tasks.sh [OPÇÃO]..."
    echo ""
    echo "  run ............................. compila, instala e executa app no device"
    echo ""
    leave 0
}

if [ "$1" = "" ]
then
    usage
fi

while [ "$1" != "" ]
do
    case $1 in

        run)
            run $2 $3
            shift
            ;;
        *)
            echo "Comando não encontrado"
            usage
            ;;
    esac
    shift
done
