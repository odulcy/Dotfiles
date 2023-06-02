#!/bin/bash

# There is a weird artifact!
# Keep only last line
content=$(curl -sS 'https://www.google.com/async/finance_wholepage_price_updates?ei=si0PZIezLcmakdUPzLWewAg&yv=3&cs=0&async=mids:%2Fm%2F016j14%7C%2Fm%2F02q4tvl%7C%2Fg%2F11f3jy5sx4%7C%2Fg%2F1q52g5hz_,currencies:,_fmt:jspb'   -H 'authority: www.google.com'   -H 'accept: */*'   -H 'accept-language: en-US,en;q=0.9'  -H 'referer: https://www.google.com/'   -H 'sec-ch-ua: "Chromium";v="109", "Not_A Brand";v="99"'   -H 'sec-ch-ua-arch: "x86"'   -H 'sec-ch-ua-bitness: "64"'   -H 'sec-ch-ua-full-version: "109.0.5414.74"'   -H 'sec-ch-ua-full-version-list: "Chromium";v="109.0.5414.74", "Not_A Brand";v="99.0.0.0"'   -H 'sec-ch-ua-mobile: ?0'   -H 'sec-ch-ua-model;'   -H 'sec-ch-ua-platform: "Linux"'   -H 'sec-ch-ua-platform-version: "5.15.0"'   -H 'sec-ch-ua-wow64: ?0'   -H 'sec-fetch-dest: empty'   -H 'sec-fetch-mode: cors'   -H 'sec-fetch-site: same-origin'   -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36'   --compressed|tail -n1)

echo "$content"|jq -r '.PriceUpdate[0][0][0][17][4:7]| "\(.[0]) (\(.[1])) \(.[2])"'
