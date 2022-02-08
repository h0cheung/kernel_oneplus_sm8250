#!/bin/bash

rm AnyKernel3/{Image.gz,Image,dtbo.img,dtb.img} &> /dev/null

{
    cp out/arch/arm64/boot/Image.gz AnyKernel3/ &> /dev/null || \
    cp out/arch/arm64/boot/Image AnyKernel3/ &> /dev/null
} && \
    cp out/arch/arm64/boot/dtbo.img AnyKernel3/ &> /dev/null
    cp out/arch/arm64/boot/dts/vendor/qcom/kona-v2.1.dtb AnyKernel3/dtb.img &> /dev/null
    cd AnyKernel3 && \
    {
        DATE=$(date -uI)
        rm ../IllusionX-Plus-$DATE.zip &> /dev/null 
        zip -r9 ../IllusionX-Plus-$DATE * -x .git README.md *placeholder
    } || echo Pack failed!
