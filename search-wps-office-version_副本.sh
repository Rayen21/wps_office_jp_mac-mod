#!/bin/bash

# 用于搜索 WPS Office for Mac 的离线安装包
# 基础 URL 示例: https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/3.1.4.5932/WPSOffice_3.1.4(5932).dmg

# 并行检查的数量 (数值越大速度越快，但请注意频率限制)
P=30

# 定义版本搜索范围 (根据已知链接 2.0.2 和 3.1.4 设定)
for va in 3; do         # 主版本号 (例如 2 或 3)
  for vb in {0..5}; do       # 次版本号
    for vc in {0..10}; do     # 修订号
      for build in {0000..9999}; do # 编译号 (通常是增加最频繁的)
        
        # 构造版本字符串
        VERSION="${va}.${vb}.${vc}.${build}"
        # 构造完整的 URL
        URL="https://wdl1.pcfg.cache.wpscdn.com/wpsdl/macwpsoffice/download/${VERSION}/WPSOffice_${va}.${vb}.${vc}(${build}).dmg"
        
        echo "$URL"
      done
    done
  done
done |
xargs -n1 -P "$P" sh -c '
  url="$1"
  
  # 在终端显示当前进度 (输出到标准错误，不干扰结果保存)
  echo "Checking: $url" >&2

  # 使用 curl 检查链接有效性 (只检查 Header)
  # WPS 服务器可能返回 HTTP/1.1 或 HTTP/2，所以改用 grep "200 OK" 更稳妥
  if curl -sI "$url" | grep -iq "200 OK"; then
    # 获取最后修改时间
    lm=$(curl -sI "$url" | grep -i "^last-modified:" | sed "s/^[Ll]ast-[Mm]odified: //" | tr -d "\r")
    # 将找到的链接和时间存入文件
    echo "$url | Last Modified: $lm" >> wps_found_links.txt
    echo "------------------------------------------------" >&2
    echo "FOUND: $url" >&2
    echo "------------------------------------------------" >&2
  fi
' sh