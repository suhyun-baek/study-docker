# kakao pay 사전과제
### Installation
<pre>
cd /home
git clone https://github.com/suhyunback100/kakaopay-docker.git
cd kakaopay-docker
</pre>
### Run
<pre>
docker push wh56789/kakaopay-docker
docker run -p 80:80 -v /home/ec2-user/bsh/file:/var/www/html bsh-ex
cd kakaopay-docker
</pre>
