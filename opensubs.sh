curl -iLs "https://rapiddns.io/subdomain/$1?full=1#result" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep "<td><a" | cut -d '"' -f 2 | grep http | cut -d '/' -f3 | sed 's/#results//g' | sort -u
curl -iLs "https://dns.bufferover.run/dns?q=$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" |jq -r .FDNS_A[]|cut -d',' -f2|sort -u
curl -iLs "https://riddler.io/search/exportcsv?q=pld:$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u
curl -iLs "https://www.virustotal.com/ui/domains/$1/subdomains?limit=40" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0"| grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u
curl -iLs "https://certspotter.com/api/v0/certs?domain=$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u
curl -iLs "http://web.archive.org/cdx/search/cdx?url=*.$1/*&output=text&fl=original&collapse=urlkey" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | sed -e 's_https*://__' -e "s/\/.*//" | sort -u
curl -iLs "https://jldc.me/anubis/subdomains/$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u
curl -iLs "https://securitytrails.com/list/apex_domain/$1" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | grep ".$1" | sort -u
curl -iLs "https://crt.sh/?q=%25.$1&output=json" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
curl -iLs "$1/sitemap.xml" | xmllint --format - | grep -e 'loc' | sed -r 's|</?loc>||g'
curl -iLs "https://domain.tld/v2/swagger.json" -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | jq '.paths | keys[]'
curl -iLs -w "\n%{http_code}" https://api.recon.dev/search?domain=site.com -A "Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:59.0) Gecko/20100101 Firefox/59.0" | jq .[].domain
