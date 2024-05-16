terraform {
  required_version = "~> 1.8.3"         // Terafform Version 
  required_providers {          // Provider Version
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.49.0"
    }
  }
}


// 1.5.7 = Symentic Versioning
// 1= Major (Upgrade ) = Main changes 
// 5 = Minor (Update) = Features/Enhancemants
// 7 = Patch (Patching)= Fix Vulnarabilities 

// Lazy Constrains: ~>
// before you run terraform apply you should run terraform plan 
// terraform plan generates exacution plans