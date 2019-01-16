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

In your terminal, navigate to the inside of the ``sdp-labs`` directory that you just cloned from GitHub.

Run the following command in your terminal from the top-level directory of the ``sdp-labs`` directory to deploy the Docker containers using the `provided docker-compose.yaml file`_ within the ``try-it-out`` directory.

.. _provided docker-compose.yaml file: https://github.com/boozallen/sdp-labs/blob/master/try-it-out/docker-compose.yaml

.. code-block:: bash

   docker-compose -f ./try-it-out/docker-compose.yaml up -d

.. note:: For some more information about docker-compose files, visit `this page`_.

.. note:: The ``docker-compose`` command run above may not work on a company's WIFI depending on its firewall settings, so you may need to run it on a private network or where firewall rules are more lax. 

.. _this page: https://docs.docker.com/compose/compose-file/

The above command will create and run the following Jenkins containers: Jenkins, a Docker registry, and SonarQube. To verify this, you can run ``docker ps`` in your terminal. 

The response should show something similar to the following screenshot.

.. image:: ../images/deploy-devops-tools/docker_ps_command.png

.. note:: If you looked at the ``docker-compose.yaml`` file we provided, you may have noticed that sonar-scanner isn't a running container. This is a Docker image that we will need later, even though it's intentionally not running.

