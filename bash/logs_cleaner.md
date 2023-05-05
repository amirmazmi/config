# delete logs

delete file according to name that is more than 10 days old
`find wawa*.log -mtime 10 -delete`

<br>

# filters
`ll | grep wawa | awk -F" " '{print $9}' | sort -r | sed -n '10,$p'`

`ls | sed -n '/wawa_1.*.log/p' | sort -r | sed -n '10,$p'`
