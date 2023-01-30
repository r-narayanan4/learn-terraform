Terraform Small Utility Project

Current Problem:

    We are not able to create EC2 Instances in all the subnets of our VPC which are spread across all availability zones in that region

Approach to a Solution:

    We need to find a solution to say that our desired EC2 Instance Type example: t3.micro is supported in that availability zone or not

    In simple terms, give me the availability zone list in a particular region where by desired EC2 Instance Type (t3.micro) is supported

Why utility project?

    In Terraform, we should not go and try things directly in large code base.

    First try your requirements in small chunks and integrate that to main code base.

We are going to do the same now.