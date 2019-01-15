.. _Deploy Devops Tools:
-----------------------
Deploy The Devops Tools
-----------------------

In this section, you will be deploying all of the DevOps tools that we will be using within this tutorial. This consists of deploying a Jenkins instance, a SonarQube server, and a local (insecure) Docker registry. 

To begin, clone our SDP-Labs_ GitHub repository, which includes all of the files you'll need to use throughout our guide. 

.. _SDP-Labs: https://github.com/boozallen/sdp-labs

.. code-block:: bash

   ## cloning via ssh
   git clone git@github.com:boozallen/sdp-labs.git
   ## cloning via https
   git clone https://github.com/boozallen/sdp-labs.git

**If you haven't already**, use one of the above commands to clone the repository to your computer. 

In your terminal, navigate to the inside of the **sdp-labs** directory that you just cloned from GitHub.

Run the following command in your terminal from the top-level directory of the **sdp-labs** directory to deploy the Docker containers using a provided docker-compose.yaml file.

.. code-block:: bash

   docker-compose -f /try-it-out/docker-compose.yaml up -d