# presigned url pattern

## why use it: reduce the cost to half

## how to do it

1. put with presigned url and see what happens (express only)
2. client request presigned url, api server creates one and respond with it
3. client put image with it
4. client request to api server with filename
5. api server stores that in db

## keypoint: set cache control, keep use old presigned url, request renewed one if expired

### how to check expiredness

- X-Amz-Date: The exact UTC timestamp when the URL was generated (Format: YYYYMMDDTHHMMSSZ).X-Amz-Expires: The lifespan
  of the URL in seconds (e.g., 604800 for 7 days).
- check expiredness before request to presigned url
- if expired, request new one to api server
