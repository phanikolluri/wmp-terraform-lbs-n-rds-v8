dns_domain = "mydevops88.online."
env = "dev"
vpc_id     = "vpc-04ec560cdc2561e0d"
subnets    = ["subnet-0d6e6257f7a9c428c", "subnet-046b2912872f2bdd9"]


databases = {
  postgresql = {
    allocated_storage = 10
  }
}


apps = {

  frontend = {
    instance_type = "t3.small"
    ports = {
      frontend = 80
    }
    lb = {
      port        = 80
      lb_internal = false
    }
    asg = {
      min_size = 2
      max_size = 10
    }
  }

  auth-service = {
    instance_type = "t3.small"
    ports = {
      auth-service = 8081
    }
    lb = {
      port        = 8081
      lb_internal = true
    }
    asg = {
      min_size = 2
      max_size = 10
    }
  }

  portfolio-service = {
    instance_type = "t3.small"
    ports = {
      portfolio-service = 8080
    }
    lb = {
      port        = 8080
      lb_internal = true
    }
    asg = {
      min_size = 2
      max_size = 10
    }
  }

  analytics-service = {
    instance_type = "t3.small"
    ports = {
      analytics-service = 8000
    }
    lb = {
      port        = 8000
      lb_internal = true
    }
    asg = {
      min_size = 2
      max_size = 10
    }
  }

}
