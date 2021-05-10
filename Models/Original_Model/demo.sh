#! /bin/sh
# demo.sh Fri 22 Jan 2021 10:38:30 AM EST
# Lina and Nick Feng 

TESTOR_DIR=${TESTOR_DIR:-..}

# check the presence of CADP

if [ "$CADP" = "" ] ; then
	echo "$0: \$CADP should point to the installation directory of CADP"
	exit 1
elif [ ! -d $CADP ] ; then
	echo "$0: directory \$CADP does not exist"
	exit 1
fi

ARCH=`$CADP/com/arch`

echo "-------------------------------------------------------------------------"
echo "SUD FM"
echo "-------------------------------------------------------------------------"


echo
echo "generate baby.bcg"
#lnt.open baby.lnt generator baby.bcg

echo
echo "minimize baby.bcg"
#bcg_min baby.bcg

echo
echo "generate purpose1.bcg"
lnt.open purpose1.lnt generator -rename tgv.rename purpose1.bcg


#echo
#echo "compute complete test graph (synchronous product): regulation_p1.ctg.bcg"
#bcg_open baby.bcg $TESTOR_DIR/bin.$ARCH/testor.a -total -io baby.io -ctg purpose1.bcg baby_p2.ctg.bcg

echo "computing test case on the fly using testor for purpose purpose1 "
#bcg_open baby.bcg $TESTOR_DIR/bin.$ARCH/testor.a -total -io baby.io purpose1.bcg baby.tc.bcg
lnt.open baby.lnt $TESTOR_DIR/bin.$ARCH/testor.a -total -io baby.io purpose1.bcg baby.tc.bcg


#echo "-------------------------------------------------------------------------"
#echo "Extracting test cases from complete test graphs"
#echo "-------------------------------------------------------------------------"

#for CTG in `ls -1 *ctg*.bcg` ; do
#	TC_PREFIX=TC.`$CADP/src/com/cadp_basename $CTG .bcg`
#	$CADP_TIME $TESTOR_DIR/com/extract_all -check -copy -io baby.io $CTG $TC_PREFIX 2>&1
#done

#echo "-------------------------------------------------------------------------"
#echo "Generating traces"
#echo "-------------------------------------------------------------------------"

#`mkdir -p traces`

#for TC in `ls TC*.bcg` ; do
#	bcg_io $TC $TC.aut
#	`mv $TC.aut traces/.`
#done

#rm *.bcg *.o
