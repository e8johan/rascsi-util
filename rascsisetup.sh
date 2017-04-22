CSI環境を構築スクリプト
#systemdに登録までしてしまうのです
#登録されるsystemd等はread.meで確認すること
#
#。
wget http://www.geocities.jp/kugimoto0715/rascsi/rascsi120.zip
unzip rascsi120.zip
mv rascsi120/bin/raspberrypi/rascsi.tar.gz  .
tar zxvf rascsi.tar.gz
sudo mv rascsi /usr/local/bin/
sudo mv rasctl /usr/local/bin/
echo "後片付けを行います。"
sleep 1
rm rascsi120.zip
rm -rf rascsi120/
rm rascsi.tar.gz
echo -n "/usr/local/binへのrascsiのインストールが行われました。デーモン登録(HDD,bridge,allどれか)を実施しますか？[h/e/a/n]"
while :
  do
    read INPUT
    case "$INPUT" in
      "h" ) sudo mv rascsihdd.sh /usr/local/bin/


sudo chown root:root rascsihdd.service
sudo chmod 644 rascsihdd.service
sudo mv rascsihdd.service /etc/systemd/system/
sudo systemctl enable rascsihdd.service
sudo systemctl start rascsihdd
            
            break ;;
      "e" ) sudo mv rascsibrid.sh /usr/local/bin/
            

sudo chown root:root rascsibrid.service
sudo chmod 644 rascsibrid.service
sudo mv rascsibrid.service /etc/systemd/system/
sudo systemctl enable rascsibrid.service
sudo systemctl start rascsibrid
            
            break ;;

      "a" ) sudo mv rascsiall.sh /usr/local/bin/
            

sudo chown root:root rascsiall.service
sudo chmod 644 rascsiall.service
sudo mv rascsiall.service /etc/systemd/system/
sudo systemctl enable rascsiall.service
sudo systemctl start rascsiall
            
            break ;;


      "n" ) echo "Canceled."
            break ;;
      * )   echo "ちゃんと入力してね！" ;;
    esac
  done
  


