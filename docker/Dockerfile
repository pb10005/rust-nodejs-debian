FROM rust:slim-buster

RUN apt -y -q update \
  && apt install -y -q libpq-dev \
  && cargo install diesel_cli -q --no-default-features --features postgres

ENV CARGO_BUILD_TARGET_DIR=/tmp/target

CMD ["/bin/bash"]