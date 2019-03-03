HOME ?= `$HOME`
DISTRO=$(shell lsb_release -si)

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

.PHONY:
describe:
	echo "Distro: $(DISTRO)"

provision: ansible

install: install-ansible install-krypton

.PHONY: install-ansible
install-ansible:
ifeq ($(DISTRO),ManjaroLinux)
	sudo pacman -Sy
	sudo pacman -S ansible --noconfirm
else
	sudo apt-get update
	sudo apt-get install software-properties-common
	sudo apt-add-repository ppa:ansible/ansible
	sudo apt-get update
	sudo apt-get install ansible
endif

.PHONY: install-krypton
install-krypton:
ifneq ($(DISTRO),ManjaroLinux)
	curl https://krypt.co/kr | sh
	kr pair
endif

.PHONY: ansible
ansible:
ifeq ($(DISTRO),ManjaroLinux)
	make ansible-arch
else
	make ansible-ubuntu
endif

.PHONY: ansible-ubuntu
ansible-ubuntu:
	ansible-playbook -i ansible/hosts ansible/ubuntu/playbook.yml --verbose --ask-become-pass

.PHONY: ansible-arch
ansible-arch:
	ansible-playbook -i ansible/hosts ansible/arch/playbook.yml --verbose --ask-become-pass
