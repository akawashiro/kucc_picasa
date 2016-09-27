for account in `cat picasa_account.txt`
do
    echo $account
    wget -P ./picasa_user https://picasaweb.google.com/data/feed/api/user/${account}
    xmllint --format ./picasa_user/${account} > ./picasa_user/${account}.xml
done

find picasa_user | grep -v xml | xargs rm
