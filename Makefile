WEBROOT=$(CURDIR)/files

serve:
	-docker rm -f some-nginx
	docker run --net=host -v $$PWD/nginx.conf:/etc/nginx/nginx.conf:ro --name some-nginx -v $(WEBROOT):/files:ro nginx:alpine

ssh:
	-docker rm -f some-ssh
	docker run -v $(WEBROOT):/files --name some-ssh -p 2222:22 -v $$PWD/authorized_keys:/root/.ssh/authorized_keys:ro quay.io/macropin/sshd
