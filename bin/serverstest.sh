#!/usr/bin/env sh

# List of URLs
urls=(
    "https://google.com"
    "https://bing.com"
    "https://roseapi.theasteroid.tech"
    "https://rose.theasteroid.tech"
    "https://adminrose.theasteroid.tech"
)

# Loop through each URL
for url in "${urls[@]}"; do
    # Make a network call with a timeout of 10 seconds and get the HTTP status code
    status_code=$(curl -o /dev/null -s -w "%{http_code}\n" --max-time 10 "$url")
    
    # Check if the status code is empty, indicating a timeout
    if [ -z "$status_code" ]; then
        echo "URL: $url - Request Timed Out"
    else
        # Print the URL and its status code
        echo "URL: $url - Status Code: $status_code"
    fi
done
