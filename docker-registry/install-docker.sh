sudo sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list
  
sudo apt-get update && sudo apt-get upgrade -y

echo "192.168.1.100     ubuntu-1804-srv"       | tee -a /etc/hosts > /dev/null
echo "192.168.1.101     docker-registry" | tee -a /etc/hosts > /dev/null


# apt가 HTTPS 저장소의 패키지를 설치할 수 있도록 한다.
sudo apt-get install -y  apt-transport-https ca-certificates curl software-properties-common

# 도커 공식 GPG키를 저장하고 apt-key에 등록한다.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# docker apt-repository 추가한다.
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# docker 설치
sudo apt-get install -y docker-ce

# 현재 계정에 docker 권한 부여
sudo usermod -aG docker $USER 


# docker 삭제
# docker 패키지 제거
# sudo apt purge docker-ce
# Images, Container, volumes, 커스텀화된 설정 파일들은 수동으로 제거한다.
# sudo rm -rf /var/lib/docker
