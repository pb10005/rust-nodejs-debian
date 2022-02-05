sudo apt -y -q update
sudo apt install -y -q gcc build-essentials curl
curl https://sh.rustup.rs -sSf | sh -s -- -y

source $HOME/.cargo/env

sudo apt install -y -q libpq5 libpq-dev
cargo install diesel_cli --no-default-features --features postgres