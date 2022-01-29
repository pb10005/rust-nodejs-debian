FROM rust:slim-buster

RUN apt -y -q update \
  && apt install -y -q libpq5 libpq-dev \
  && cargo install diesel_cli -q --no-default-features --features postgres

CMD ["/bin/bash"]