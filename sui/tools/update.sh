echo -e "\e[1m\e[32mUpdating Sui fullnode by lukman nodes... \e[0m" && sleep 1
cd $HOME && rm -rf sui
mkdir sui && cd sui
wget -qO docker-compose.yaml https://raw.githubusercontent.com/MystenLabs/sui/main/docker/fullnode/docker-compose.yaml
wget -qO fullnode-template.yaml https://github.com/MystenLabs/sui/raw/main/crates/sui-config/data/fullnode-template.yaml
wget -qO genesis.blob https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob
sed -i 's/127.0.0.1/0.0.0.0/' fullnode-template.yaml
version=$(wget -qO- https://api.github.com/repos/SecorD0/Sui/releases/latest | jq -r ".tag_name")
wget -qO- "https://github.com/SecorD0/Sui/releases/download/${version}/sui-linux-amd64-${version}.tar.gz" | sudo tar -C /usr/local/bin/ -xzf -
docker-compose down --volumes
docker-compose up -d
