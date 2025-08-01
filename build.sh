#!/bin/bash

# WonderTrader 编译脚本
echo "启动编译容器..."
docker-compose up -d

echo "开始编译..."
docker-compose exec wondertrader-dev bash -c "
    cd /home/wondertrader/src && 
    mkdir -p build && 
    cd build && 
    cmake .. && 
    make -j\$(nproc)
"

echo "编译完成！"
