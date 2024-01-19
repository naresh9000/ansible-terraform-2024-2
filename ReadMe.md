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

commands
----------

ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml --syntax-check
ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml --check  =>similar to terraform plan
ansible-playbook -i invfile playbooks/nginx_sample_playbook.yml -vv
For checking the service is runing on hosts
 ansible -i <inv-file-path> <group-name_from_inventory> -m <init-module_for_eg:systemd> -a "name=nginx state=started"
 ansible your_target_hosts -m systemd -a "name=nginx state=stopped" 
 ansible your_target_hosts -m systemd -a "name=nginx enabled=yes" 
 ansible your_target_hosts -m copy -a "src=local_nginx.conf dest=/etc/nginx/nginx.conf" 
