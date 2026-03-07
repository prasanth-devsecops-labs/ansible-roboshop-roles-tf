# default:
# 	git pull
# 	ansible-playbook -e component=$(component) robo.yaml

# all:
# 	git pull
# 	make component=mongodb
# 	make component=redis
# 	make component=mysql
# 	make component=rabbitmq
# 	make component=catalogue
# 	make component=user
# 	make component=cart
# 	make component=shipping
# 	make component=payment
# 	make component=frontend


# 1. Variables
COMPONENTS = mongodb redis mysql rabbitmq catalogue user cart shipping payment frontend
INSTANCES  = '{"instances":["mongodb","catalogue","redis","user","cart","mysql","shipping","rabbitmq","payment","frontend"]}'

# 2. Phony Targets (Always add new command names here)
.PHONY: all pull infra destroy $(COMPONENTS)

# 3. Infrastructure Commands
infra: pull
	ansible-playbook -i localhost, -e $(INSTANCES) aws-infra.yaml

destroy: pull
	ansible-playbook -i localhost, -e $(INSTANCES) -e actions=destroy aws-infra.yaml

# 4. Component Deployment
all: pull $(COMPONENTS)

pull:
	git pull

$(COMPONENTS): pull
	ansible-playbook -e component=$@ robo.yaml

check:
	ansible-playbook health-check.yaml
