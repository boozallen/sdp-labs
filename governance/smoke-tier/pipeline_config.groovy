allow_scm_jenkinsfile = false

libraries{

  sonarqube{
    enforce_quality_gate = true
  }
  gradle
}

steps{
  merge = true 
}

keywords{
  merge = true
}
