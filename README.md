This scripts was made based on [http://github.com/tumf/UnitHosting](http://github.com/tumf/UnitHosting)

## Usage

### for CakePHP on LAMP

    bash < <(curl https://raw.github.com/k1LoW/sakuravps/master/shell/lamp-cake-centos-simple.sh)

### for CakePHP on LAPP

    bash < <(curl https://raw.github.com/k1LoW/sakuravps/master/shell/lapp-cake-centos-simple.sh)

### Ansible Playbooks for CakePHP on LAMP

``git clone`` this repository. and ``cd ansible/``

    echo "***.***.***.***" > ~/ansible_hosts; ansible-playbook lamp-cake-centos-simple.yml -i ~/ansible_hosts -u root --ask-pass
