### Docker 유용한 명령어

---

#### 모든 컨테이너 삭제하기
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

#### 모든 컨테이너 삭제하기
```
docker rmi $(docker images -q)
```

#### Exit 상태의 모든 컨테이너 삭제하기
```
docker rm $(docker ps --filter 'status=exited' -a -q)
```