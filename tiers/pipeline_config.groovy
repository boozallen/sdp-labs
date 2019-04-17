allow_scm_jenkinsfile = false

libraries{

  sonarqube{// testing the sdp sonarqube
    enforce_quality_gate = true
  }

}

steps{
  merge = true 
}

keywords{
  merge = true
}
