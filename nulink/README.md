<p align="right">
<html>
   <body>
      <a href="https://t.me/detective_gems/">
         Join Channel Detective Gems<img alt="Detective Gems" src="https://user-images.githubusercontent.com/48665887/191190210-b1c14331-4bd5-45ae-a271-e4f967ad7e45.png"
         width="20" height="20">
      </a>
   </body>
</html>
</p>
          
<p align="center">
 <img src="https://user-images.githubusercontent.com/107190154/190568136-14f5a7d8-5b15-46fb-8132-4d38a0779171.gif" width="250">
<p>

# NuLink Testnet `Horus`
---

- Date: Phase 1: (September 15 - November 20)
- Official Instructions: https://docs.nulink.org/products/testnet
- More info about testnet: https://www.nulink.org/blog-posts/nulink-testnet-announcement

#### Official documentation:
----
- Official manual: https://docs.nulink.org/products/nulink_worker
- Block explorer: N/A

#### Recommended hardware requirements
| Hardware | Specs    |
| :---:   | :---: |
| CPU | 4 CPU   |
| RAM | 8GB RAM |
| DISK | 100 GB SSD STORAGE |
| OS | Ubuntu 20.04 LTS|

#### Required ports :
- Exposed  TCP port `9151` , make sure it's not occupied
open port `9151`
```
apt install ufw -y 
ufw allow ssh 
ufw allow https 
ufw allow http 
ufw allow 9151
ufw enable
```

#### 1. Create a worker account (automatic instalation)
```
wget -O nulink.sh https://raw.githubusercontent.com/lukmanc405/testnet/main/nulink/nulink.sh && chmod +x nulink.sh && ./nulink.sh
```

- at last creating worker you need to create password then repeat that
![image](https://user-images.githubusercontent.com/48665887/191491113-02c63cad-cfe5-4ba9-906e-6d3d2f42e997.png)

- save these information to your pc/notepad
![image](https://user-images.githubusercontent.com/48665887/191491646-004ee8be-7112-448a-99e4-780a0f91fac6.png)


#### 2. Send `TBNB` to your operator address above 

- get faucet from https://testnet.binance.org/faucet-smart

![image](https://user-images.githubusercontent.com/48665887/191492348-46c2b694-df39-48e6-bd87-4ae66460cf03.png)


- send funds to your operator address 

![image](https://user-images.githubusercontent.com/48665887/191492509-9e639f6d-0d53-4684-86eb-ebaf10cbc9a1.png)


#### 3. NuLink Worker Installation

- Copy the keystore file of the Worker account to the host directory selected in step 1. The private file generated by NuLink Worker will also be stored in this directory. Please ensure that this directory has 777 permissions, if not yet just type `chmod -R 777 /root/nulink`

- then type this 
`cp xxxxxxxx /root/nulink`

- Replace `xxxxxxx` by your Path of the `secret key file`

![image](https://user-images.githubusercontent.com/48665887/191497662-ae6508d6-dfa4-4939-b0c2-e5cfbbaefa26.png)

- example it will be like this 

![image](https://user-images.githubusercontent.com/48665887/191569610-b3467be5-ef30-49f1-be9d-9effab17d09f.png)

### set vars
- NOTE : CHANGE `$YOUR_PASSWORD` to your own password

```
export NULINK_KEYSTORE_PASSWORD=$YOUR_PASSWORD
```
```
export NULINK_OPERATOR_ETH_PASSWORD=$YOUR_PASSWORD
```

like this example :

![image](https://user-images.githubusercontent.com/48665887/191535522-1d27998f-157b-4dc0-9142-94b4d6920f8d.png)

#### 4. set docker config
NOTE : 
- CHANGE `$ETH_KEYSTORE_URL` with your UTC--2022-09-21T11-15-34.119242544Z--7c14dhsdjhhdksahfsnjdjid (you created above in step 1)
- CHANGE `$OPERATOR_ADDRESS` with your operator addres (you created above in step 1)

*Reminder this will create pharse , you need to save that!*

```
chmod -R 777 /root/nulink

docker run -it --rm \
-p 9151:9151 \
-v /root/nulink:/code \
-v /root/nulink:/home/circleci/.local/share/nulink \
-e NULINK_KEYSTORE_PASSWORD \
nulink/nulink nulink ursula init \
--signer keystore:///code/$ETH_KEYSTORE_URL \
--eth-provider https://data-seed-prebsc-2-s2.binance.org:8545 \
--network horus \
--payment-provider https://data-seed-prebsc-2-s2.binance.org:8545 \
--payment-network bsc_testnet \
--operator-address $OPERATOR_ADDRESS \
--max-gas-price 100
```
like this example :
![image](https://user-images.githubusercontent.com/48665887/191534476-74654fc0-c5f0-4147-9ed6-ccb09cbe8a2f.png)


you will see like this ,copy and save to your notepad
![image](https://user-images.githubusercontent.com/48665887/191529203-c01a2f97-0755-46ee-807d-0dbd944b81bf.png)

after then enter previously blue words

then showing like this ,save this info to yor notepad

![image](https://user-images.githubusercontent.com/48665887/191536858-a378ad89-2965-4510-a4d4-3cce4b7ccc0e.png)


#### 5. Start the node
```
docker run --restart on-failure -d \
--name ursula \
-p 9151:9151 \
-v /root/nulink:/code \
-v /root/nulink:/home/circleci/.local/share/nulink \
-e NULINK_KEYSTORE_PASSWORD \
-e NULINK_OPERATOR_ETH_PASSWORD \
nulink/nulink nulink ursula run --no-block-until-ready
```
#### check node logs

```
docker logs -f ursula
```

### update node

```
wget -O update_node.sh https://raw.githubusercontent.com/lukmanc405/testnet/main/nulink/update_node.sh && chmod +x update_node.sh && ./update_node.sh
```


#### make sure your note pad have these backup

![image](https://user-images.githubusercontent.com/48665887/191542745-f47d139f-2d6b-4684-bf71-4476ef404e2c.png)

   
### Staking & Bond an active worker to gain reward
---

1. Go to [NLK faucet](https://test-staking.nulink.org/faucet)

![image](https://user-images.githubusercontent.com/48665887/191538034-ef5afbc5-1a84-42bd-b935-27fbbd44aa27.png)

![image](https://user-images.githubusercontent.com/48665887/191538183-cdbe2fcb-a4b1-46d7-ad27-20ce6ecfc71a.png)


2. Now go to [horus staking](https://test-staking.nulink.org/) 

![image](https://user-images.githubusercontent.com/48665887/191538429-d7a1165b-28e3-4c7b-8387-d2dcff5a858b.png)

3. Press max then confirm 

![image](https://user-images.githubusercontent.com/48665887/191538721-d561e398-98c7-4206-9ae2-9a20f3708c20.png)

4. Now bond worker

![image](https://user-images.githubusercontent.com/48665887/191539042-bd95094b-7495-4156-85ab-f9afecec830f.png)

5. put your operator and node url address
NOTE :
- operator address = worker address
- NODE URI=https://Your_adress_VPS:9151

example :

`https://20.166.51.233:9151`

![image](https://user-images.githubusercontent.com/48665887/191540364-8b451563-818d-43ea-916d-c9b63464c764.png)

![image](https://user-images.githubusercontent.com/48665887/191541828-96ab8cbe-91c9-43c0-b24f-e9a6d6bbb54b.png)

![image](https://user-images.githubusercontent.com/48665887/191542082-534a511c-a420-4203-b523-d3813b80cedb.png)


#### Congrats well done,you finish it!

### Dont forget to fill the [form](https://docs.google.com/forms/d/e/1FAIpQLSep0rgPRcMd2kUhz53GYmBoktu-u-8npU2DakmzGpmpCmYZPw/viewform)

#### other command for worker nodes (if needed)
   
to delete node

```
cd $HOME && docker stop ursula && docker rm ursula && rm -rf ~/{geth-linux-amd64-1.10.24-972007a5,geth-linux-amd64-1.10.24-972007a5.tar.gz,nulink,nulink.sh}
```
