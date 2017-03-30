BEGIN{
	FS="\t"
	ENERGIAS="0.053,0.073,0.100,0.137,0.188,0.257,0.352,0.482,0.661,0.906,1.241,1.700,2.329,3.191,4.372,5.989,8.205,11.24,15.40,21.10,28.90,39.60,54.25,74.32,101.8,139.5,191.1,261.8,358.7,491.4,673.2,922.4,1264,1731,2372,3249,4451,6098,8355,11446,15681,21483"
	split(ENERGIAS, ENERGIA, ",")
	emax=190
	emin=1
	binmax=0
	}
#/^[^#]/
{
	if($1>emax){emax=$1}
	if($1<emin){emin=$1}
	#print $0
	#print $1, $1/0.053, log($1/0.053), log($1/0.053)/log(1.37), int(log($1/0.053)/log(1.37))
	caja=int(log($1/0.053)/log(1.37)) + 1
	#print caja
	++EB[ENERGIA[caja]]
	if(EB[ENERGIA[caja]]>binmax){binmax=EB[ENERGIA[caja]]}
	#print EB[ENERGIA[caja]]
	}
END{
	print "Emax","\t","Emin"
	print emax,"\t",emin
	print "###\n###\n###\n"
	print "E(GeV)\t Npart\t log(E/53MeV)/log(1.37)"
	for(k in ENERGIA){
		if(EB[ENERGIA[k]]!=0){
			print ENERGIA[k],"\t",EB[ENERGIA[k]],"\t"barra(int(50*log(EB[ENERGIA[k]])/log(binmax)))
			}
		else{
			print ENERGIA[k], 0, "\t*"
			}
		} 
	}
function barra(n){
	c=1
	out="-"
	do{
		out=out"-"
		c++
		}
	while(c<n)
	out=out"o"
	return out
	}
