# kakao pay 사전과제
### Installation
<pre>
cd /home
git clone https://github.com/suhyunback100/kakaopay-docker.git
cd kakaopay-docker
</pre>
### Run
<pre>
docker pull wh56789/kakaopay-docker
docker run -p 80:80 -v /home/kakaopay-docker/file:/var/www/html wh56789/kakaopay-docker
</pre>
