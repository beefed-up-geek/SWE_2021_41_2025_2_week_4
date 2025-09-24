FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
# 파일 자체는 바인드 마운트로 덮어쓰지만, 없을 때 대비해 복사해 둡니다.
COPY ./bind_mount ./bind_mount

# 컨테이너 시작 시 파이썬 실행
CMD ["python3", "/app/bind_mount/ishappy.py"]
