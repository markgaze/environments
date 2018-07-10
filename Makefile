HOME ?= `$HOME`

explain:
	### Welcome
	#
	# Makefile for the my host machine
	#
	### Setup
	#
	# To use the Ansible scripts to provision your environment you will require the following:
	# - Ansible (install via apt)
	#
	### Installation
	#
	#  -> $$ make install provision
	#
	###

provision: setup-git-config ansible

install: install-ansible install-krypton

.PHONY: install-ansible
install-ansible:
	sudo apt-get update
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible

.PHONY: install-krypton
install-krypton:
	curl https://krypt.co/kr | sh
	kr pair

.PHONY: setup-git-config
setup-git-config:
ifeq ("$(wildcard $(HOME)/.gitconfig)","")
	@echo "Enter your full name - This is how git will report your work";
	@read name; \
	git config --global user.name "$$name"

	@echo "Enter your work email address";
	@read email; \
	git config --global user.email $$email
endif

.PHONY: ansible
ansible:
	ansible-playbook -i ansible/hosts ansible/playbook.yml --verbose --ask-become-pass