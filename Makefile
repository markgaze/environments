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
	#  -> $$ make provision
	#
	###

provision: setup-git-config ansible

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
	ansible-playbook -i ansible/hosts ansible/playbook.yml --verbose