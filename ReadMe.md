Playbooks
-----------
playbook is a configuration file written in YAML format that defines a set of tasks, hosts, and other parameters necessary for Ansible to execute automation on a set of target hosts.

terms used in playbooks from basic to advancede
----------------------------------------------------
1. Task                         21. Roles Path
2. Play                         22. Connection Plugins
3. Handler                      23. Custom Modules
4. Module                       24. Dynamic Inventories
5. Inventory                    25. Task Blocks
6. Host                         26. Private Roles
7. Group                        27. Parallelism
8. Variable                     28. Error Handling
9. Facts                        29. Prompting for Variables
10. Roles                       30. Async and Polling
11. Conditionals                31. Callback Plugins
12. Loops                       32. Idempotence
13. Tags                        33. Include Statements
14. Templates                   34. Inventory Plugins
15. Vault                       35. Role Dependencies
16. Playbook                    36. Task Includes
17. Jinja2                      37. Performance Optimization
18. Delegate                    38. Conditionally Importing Tasks
19. Vault Encryption            39. Environment Variables
20. Dependencies                40. Static Analysis

IMportant points::
------------------
# notify keyword is used within a task to specify a list of handlers that should be
# executed when the task changes something on the managed host. Handlers are special tasks
# that are only executed when notified by other tasks.notify keyword is used to trigger handlers
-----
#  gather_facts: false is a playbook option that instructs
  # Ansible to skip the default task of gathering facts about the
  # target hosts before executing other tasks in the playbook.
-----
**delegate_to**::is a parameter that allows you to execute a task on a different host than the one defined in the play. 
scenarios where we use the delegate_to parameter in playbook..
Dynamic Inventory Management:
ump Hosts or Bastion Servers:
Operations on the Ansible Controller itself:
Operations Outside the Target Environment:
For EX: for clear understanings
```
- name: Execute task on a server via bastion host
  hosts: your_target_group
  become: yes  # Enable privilege escalation, if needed
  tasks:
    - name: Run a command on the target server
      command: echo "This command runs on the target server"
      delegate_to: your_bastion_host
      remote_user: your_bastion_user
```
-----------------
**register** keyword to capture the output of a task into a variable, and then use the debug module to display the variable's content.
```
- name: Execute a command and capture output
  command: your_command
  register: command_result

- name: Display command output
  debug:
    var: command_result.stdout

```


commands
----------

ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml --syntax-check
 ansible-playbook -i invfile  playbooks/nginx_sample_playbook.yml --syntax-check --limit <group-name>
 **DRy-run**
ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml --check  =>similar to terraform plan
**debug and RUN mode::**
ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml -vv
**For checking the service is runing on hosts**
 ansible -i <inv-file-path> <group-name_from_inventory> -m <init-module_for_eg:systemd> -a "name=nginx state=started"
 ansible your_target_hosts -m systemd -a "name=nginx state=stopped" 
 ansible your_target_hosts -m systemd -a "name=nginx enabled=yes" 
 ansible your_target_hosts -m copy -a "src=local_nginx.conf dest=/etc/nginx/nginx.conf" 

run playbook using the tags::
---------------------------------
ansible-playbook -i invfile playbook.yml --tags setup,deploy
ansible-playbook -i your_inventory_file your_playbook.yml --skip-tags your_tag3,your_tag4

Note::
**Check Logs:**
**Task logs**: /var/log/ansible.log or specified in ansible.cfg.
**System logs**: /var/log/syslog, /var/log/messages

