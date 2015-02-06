#!/bin/sh

wget -q -O 'webregister-rijksoverheid-orig.ods' 'http://www.rijksoverheid.nl/bestanden/documenten-en-publicaties/publicaties/2014/08/28/websiteregister-rijksoverheid-ods-36-kb/webregister-rijksoverheid-20141127.ods'
ruby ./ods2csv.rb 'webregister-rijksoverheid-orig.ods'
awk 'NR > 3 {print $0}' 'webregister-rijksoverheid-orig.csv' |grep -v '^""$' >webregister-rijksoverheid.csv
ruby ./https-scan.rb 'webregister-rijksoverheid.csv'
