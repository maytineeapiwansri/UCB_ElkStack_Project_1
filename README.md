# UCB_ElkStack_Project_1
This is my repository for the Elk Stack Project 1.

## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Diagram1](https://github.com/maytineeapiwansri/UCB_ElkStack_Project_1/blob/main/Diagrams/HW_12_Cloud_Network_Diagram-Elk%20Stack%20Diagram.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the **yml and config** file may be used to install only certain pieces of it, such as Filebeat.

  - ansible.cfg
  - ansible_hosts
  - ansible_playbook.yml
  - filebeat-playbook.yml
  - metricbeat-playbook.yml
  - install-elk.yml

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly **available**, in addition to restricting **access** to the network.

- What aspect of security do load balancers protect?
  - The aspect of security which load balancers protect is against the denial-of-service (DDoS) attacks due to transferring the attack traffic to the public cloud provider. 

- What is the advantage of a jump box?
  - The advantage of a jump box is that the jump box has full control of the vulnerable host access as well as automation.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the **data** and system **logs**.
- What does Filebeat watch for?
  - Filebeat tracks the log files and the location specified, gathers log events, as well as forwards them to the Elasticsearch or the Logstach.

- What does Metricbeat record?
  - Metricbeat utilizes the metrics that is collected and transferrs them to the output specified, i.e. Elasticsearch or Logstash.

The configuration details of each machine may be found below.

| Name          | Function      | IP Address                | Operating System  |
|---------------|---------------|---------------------------|-------------------|
| JumpBox       | Gateway       | 10.0.0.4/ 20.120.33.15    | Linux             |
| Web1          | Web Server    | 10.0.0.7                  | Linux             |
| Web-2         | Web Server    | 10.0.0.6                  | Linux             |
| ElkStackVM1   | Elk Server    | 10.1.0.4/ 40.86.6.204     | Linux             |


### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the **Elk Stack** machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- Workstation Public IP via TCP port 5601

Machines within the network can only be accessed by the **JumpBox and the Workstation IP address**.
- Which machine did you allow to access your ELK VM? What was its IP address?
  - JumpBox IP address: 10.0.0.4 via the SSH (port 22)
  - Workstation Public IP address via the TCP port 5601

A summary of the access policies in place can be found in the table below.

| Name      | Publicly Accessible | Allowed IP Addresses                                       |
|-----------|---------------------|------------------------------------------------------------|
| Jump Box  | No                  | Workstation Public IP address via SSH port 22              |
| Web1      | No                  | 10.0.0.4                                                   |
| Web2      | No                  | 10.0.0.4                                                   |
| Elk Stack | No                  | 10.0.0.4, Workstation Public IP address via TCP port 5601  |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because Ansible allows users to easily deploy applications which is also easy to automate the process to the systems instead of implementing custom code. Ansible will configure the tasks one wants to be implemented in the playbook as well as determine how the system will state what one wants them to be.

The playbook implements the following tasks:
- Configure New Virtual Machine
- Install Docker, Python3-pip, docker.io
- Download Container Image
- Increase System Memory
- Launch and Expose Container with Exposed Ports

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Diagram2](https://github.com/maytineeapiwansri/UCB_ElkStack_Project_1/blob/main/Diagrams/docker_ps.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web1: 10.0.0.7
- Web-2: 10.0.0.6

We have installed the following Beats on these machines:
- Elk Server, Web1, Web-2
- Filebeat and Metricbeat are installed on Elk Stack Server

These Beats allow us to collect the following information from each machine:
- The filebeat collects the log events and the metricbeat collects the metrics and system statistics.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the **Ansible playbook.yml** file to** /etc/files**.
- Update the **/etc/ansible/hosts** file to include the **virtual machines** running the playbook.
- Run the playbook, and navigate to **http://<public_IP_address_of_elk_server>:5601/app/kibana** to check that the installation worked as expected.

### **For Filebeat:**
- Download Filebeat configuration files using this command:
  - curl -L -O https://gist.githubusercontent.com/slape/5cc350109583af6cbe577bbcc0710c93/raw/eca603b72586fbe148c11f9c87bf96a63cb25760/Filebeat > /etc/ansible/files/filebeat-config.yml
- Copy the '/etc/ansible/files/filebeat-config.yml' file to '/etc/filebeat/filebeat-playbook.yml'
- Update the filebeat-playbook.yml file to include these:
  - curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.6.1-amd64.deb
  - dpkg -i filebeat-7.6.1-amd64.deb
- Update the filebeat-config file to specify the machine:
  - nano filebeat-config.yml
- Run the playbook using the 'ansible-playbook filebeat-playbook.yml' and navigate to the Kibana using this URL to check that the Elk server is running:
  - http://<public_IP_address_of_elk_server>:5601/app/kibana
- Then Kibana > Logs : Add log data > System logs > Module Status to check that the installation worked as expected


### **For Metricbeat:**
- Download Metricbeat configuration files using this command:
  - curl -L -O https://gist.githubusercontent.com/slape/58541585cc1886d2e26cd8be557ce04c/raw/0ce2c7e744c54513616966affb5e9d96f5e12f73/metricbeat > /etc/ansible/files/metricbeat-config.yml
- Copy the '/etc/ansible/files/metricbeat' file to '/etc/metricbeat/metricbeat-playbook.yml'
- Update the metricbeat-playbook.yml file to include these:
  - curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.6.1-amd64.deb
  - dpkg -i metricbeat-7.6.1-amd64.deb
- Update the metricbeat-config file to specify the machine:
  - nano metricbeat-config.yml
- Run the playbook using the 'ansible-playbook metricbeat-playbook.yml' and navigate to the Kibana using this URL to check that the Elk server is running:
  - http://<public_IP_address_of_elk_server>:5601/app/kibana
- Then Kibana > Add Metric Data > Docker Metrics > Module Status to check that the installation worked as expected
