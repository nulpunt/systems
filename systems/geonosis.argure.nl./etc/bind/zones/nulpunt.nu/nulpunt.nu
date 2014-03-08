$ORIGIN		nulpunt.nu.
$TTL		7200

@			IN	SOA	geonosis.argure.nl. (
						dnsmaster@argure.nl.
						2014030801
						7200
						3600
						604800
						3600
					)

			IN	NS	geonosis.argure.nl.
			IN	NS	ilum.argure.nl.
			IN	A	82.94.175.151
			IN	TXT	"v=spf1 +mx +ptr -all"
			IN	SPF	"v=spf1 +mx +ptr -all"
			IN	MX	10 edi



edi			IN	A	82.94.175.151
			IN	AAAA	2001:888:2000:73::151
			IN	SSHFP	3 2 aff6bc5d4bc86c6fed3beb6d5ffef35280e79f31c2b5cf07f3e16d1dd7032656

ci			IN	CNAME	edi
mail			IN	CNAME	edi
nightly			IN	CNAME	edi
pad			IN	CNAME	edi



ipmi.edi		IN	A	82.94.175.150
				AAAA	2001:888:2000:73::150



nrpe			IN	A	92.63.168.76
			IN	AAAA	2a00:f10:121:100:44a:eff:fe00:110
