allow_scm_jenkinsfile = false

libraries{

  sdp{
    images{
      registry = "http://0.0.0.0:5000" // registry url
      cred = "sdp-docker-registry"// jenkins cred id to authenticate
      docker_args = "--network=governance_sdp"  // docker runtime args
    }
  }
  github_enterprise
  sonarqube{
    require_build_step = true
    build_step = "build_source"
    enforce_quality_gate = true
  }

    docker{
        registry = "0.0.0.0:5000"
        cred = "sdp-docker-registry"
    }
}

steps{
  merge = true 
}

keywords{
  merge = true
}
