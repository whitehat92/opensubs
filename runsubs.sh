sh opensubdomains.sh $1 | sort -u | sed 's/[[:blank:]]//g' | grep -vi "error"
