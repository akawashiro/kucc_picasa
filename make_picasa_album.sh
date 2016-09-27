cat picasa_user/*xml | grep "<id>" | grep albumid | sed "s/<id>//" | sed "s:</id>::" | sed "s:entry:feed:" > tmp_make_picasa_album

for album in `cat tmp_make_picasa_album`
do
    wget -P ./picasa_album ${album} 
done

for album in `ls -1 ./picasa_album`
do
    xmllint --format ./picasa_album/${album} > ./picasa_album/${album}.xml
done

rm tmp_make_picasa_album
