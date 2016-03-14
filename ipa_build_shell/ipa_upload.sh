#!/bin/sh

function upload_ipa()
{
    #上传至pre.im
    result=`curl -F "file=@${1}" \
                 -F "user_key=38d17ef193895614c648878305f7959b" \
                 -F "update_notify=1" http://pre.im/api/v1/app/upload`
                 
    echo $result | awk '{printf("%d\n", match($0, "\"code\":\"0\""));}'
}
