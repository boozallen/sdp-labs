.. _Understanding the Pipeline Configuration File:

---------------------------------------------
Understanding the Pipeline Configuration File
---------------------------------------------

In this step, we will be going over the pipeline configuration file that has already been created and placed within the `sample application
GitHub Repository`_. 

.. _sample application GitHub Repository: https://github.com/boozallen/sdp-labs-sample-app

The `pipeline_config.groovy`_ file is a file where organization or project-wide settings can be configured for your DevSecOps pipelines.
It contains the organization-wide libraries you’d like to utilize within SDP, the application environments, your pipeline templates, and more. 

For this lab, the `pipeline_config.groovy`_ file will be able to perform static quality analysis using SonarQube
and build a Docker image if the given code reaches a certain code quality based on the analysis.

While this example of a pipeline configuration only uses two software tools (Docker and SonarQube), 
there are many other tools already integrated with SDP. For more information about the libraries that have already been 
integrated with SDP, visit the section about `SDP libraries`_.

.. _SDP libraries: https://boozallen.github.io/sdp-pipeline-framework/pages/libraries/index.html

The rest of this page will now focus on explaining the different parts of our sample `pipeline_config.groovy`_ file with the content of the file shown below.

.. code-block:: bash
  
  libraries{
    sdp{
      images{
        registry = "http://localhost:5000" // registry url
        cred = "sdp-docker-registry"// jenkins cred id to authenticate
        docker_args = "--network=try-it-out_sdp"  // docker runtime args
      }
    }
    github_enterprise
    sonarqube{
      enforce_quality_gate = true
    }
    docker{
      registry = "localhost:5000"
      cred = "sdp-docker-registry"
    }
  }


.. _pipeline_config.groovy: https://github.com/boozallen/sdp-labs-sample-app/blob/master/pipeline_config.groovy


=================
General Libraries
=================

On the top-most level, there is the ``libraries`` section. This is where you need to list out all the libraries that you'd like to utilize
within your Jenkins pipelines and any other libraries they may depend on.

In the pipeline_config.groovy file above, there are four different libraries: `sdp`_, `github_enterprise`_, `sonarqube`_, and `docker`_.

.. _sdp: https://boozallen.github.io/sdp-docs/pages/libraries/sdp/README.html

.. _github_enterprise: https://boozallen.github.io/sdp-docs/pages/libraries/github_enterprise/README.html

.. _sonarqube: https://boozallen.github.io/sdp-docs/pages/libraries/sonarqube/README.html

.. _docker: https://boozallen.github.io/sdp-docs/pages/libraries/docker/README.html

Inside each individual library, there may be a section within some curly braces of some configurable parameters. We will be going into a more
in-depth explanation for each library in the next few sections. As the ``github_enterprise`` library didn't have any parameters within it, we
will be skipping over an explanation for that library. You just need to know that it is how your Jenkins instance is able to interact with
(in this case, the public version of) GitHub.

===========
SDP Library
===========

The images section within the SDP library contains four parameters that were configurable. They resolve around the storage of Docker
images created and relating to SDP. 

The ``registry`` value specifies the URL of the Docker registry for where SDP Docker images will be pulled from whereas the value for ``cred`` specifies the ID
of the Jenkins credential that Jenkins will be using to access that Docker registry. In this case, the local Docker registry (accessible at localhost:5000) we deployed
earlier is where we will be pulling and pushing our SDP Docker images to.

Finally, the ``docker_args`` parameter forces all the SDP-related Docker images to be run with any given Docker flag, as the 
``"--network=try-it-out_sdp"`` value specifies that the SDP docker images should all be placed inside a `Docker network`_ called 
``try-it-out_sdp``.

.. _Docker network: https://docs.docker.com/v17.09/engine/userguide/networking/#user-defined-networks


=================
SonarQube Library
=================

In the SonarQube library, the ``enforce_quality_gate`` boolean variable is set to true so that the Jenkins build will fail if the code
does not pass the `quality gate`_, or some general code quality percentage, which is configurable in SonarQube itself.

.. _quality gate: https://docs.sonarqube.org/latest/user-guide/quality-gates/

==============
Docker Library
==============

For the Docker library, there are only two configurable parameters: the registry and the cred values.

The ``registry`` parameter is to specify the URL of the Docker registry where Docker images for the different
applications will be pushed to or where users can retrieve them from.

The value of ``cred`` parameter is the ID of the Jenkins credential Jenkins uses to be able to access the local Docker registry.

.. note::

  The value of the ``localhost:5000`` URL does not contain ``http://`` on purpose, as the URL value is what is used for the Docker tag,
  whose syntax does not allow for ``http://`` to be in there.

