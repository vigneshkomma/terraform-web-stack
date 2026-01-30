
# Terrafrom web stack

Terrafrom code to deploy a basic web stack on Amazon AWS




## Resources deployed

- Two EC2 instances
- Elastic Load Balancer
- VPC
- Subnets
- Internet Gateway



## Output variables

- EC2 instances IP addresses
- ELB DNS name 
- Public subnet ID

sample output:
```
Changes to Outputs:
  + addresses        = [
      + (known after apply),
      + (known after apply),
    ]
  + elb_address      = (known after apply)
  + public_subnet_id = (known after apply)
```


## License

[GNU Public License](https://www.gnu.org/licenses/gpl-3.0.en.html)

