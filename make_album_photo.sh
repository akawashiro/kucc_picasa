xmls=`find picasa_album | grep xml | head -n 100`
for xml in ${xmls[@]}
do
    #echo ${xml}
    b1="${xml%.*}"
    b2=`basename $b1`
    echo $b2
    photos=`cat ${xml} | grep "<media:content url=" | sed -e 's/.*<media:content url="//g' | sed -e 's/".*//g'`
    dir=./album_photo/${b2}
    mkdir $dir
    for p in ${photos[@]} 
    do
        echo ${dir}
        wget  --directory-prefix=${dir} -nc ${p}
    done
done

