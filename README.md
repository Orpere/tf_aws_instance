# tf_aws_instance

- [x] Install [tfswitch](https://warrensbox.github.io/terraform-switcher/) and chose terraform 11
- [x] Install [git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [x] How to use this repo

## How to use this repo

- In a directory of your choice, clone the github repository :
  
```bash
git clone git@github.com:orlando-pereira/tf_aws_instance.git
```

- Change into the directory :
  
```bash
cd tf_aws_instance
```

- use tfswitch to change the version of terraform:

```zsh
tfswitch 
✔ 0.12.17 *recent
Switched terraform to version "0.12.17"
```

- terraform init && terraform apply

```terraform
Switched terraform to version "0.12.17"
➜  tf_aws_instance git:(master) ✗ terraform init

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.42"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
➜  tf_aws_instance git:(master) ✗ terraform apply

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_ebs_volume.example will be created
  + resource "aws_ebs_volume" "example" {
      + arn               = (known after apply)
      + availability_zone = "us-east-1a"
      + encrypted         = (known after apply)
      + id                = (known after apply)
      + iops              = (known after apply)
      + kms_key_id        = (known after apply)
      + size              = 1
      + snapshot_id       = (known after apply)
      + tags              = {
          + "Name" = "orlando-test"
        }
      + type              = (known after apply)
    }

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                          = "ami-0ab1d87ce9286b9a4"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = "us-east-1a"
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t1.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Name" = "orlando-test"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

  # aws_volume_attachment.ebs_att will be created
  + resource "aws_volume_attachment" "ebs_att" {
      + device_name = "/dev/sdh"
      + id          = (known after apply)
      + instance_id = (known after apply)
      + volume_id   = (known after apply)
    }

Plan: 3 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_ebs_volume.example: Creating...
aws_instance.web: Creating...
aws_ebs_volume.example: Still creating... [10s elapsed]
aws_instance.web: Still creating... [10s elapsed]
aws_ebs_volume.example: Creation complete after 12s [id=vol-0bdefa2a83219874c]
aws_instance.web: Still creating... [20s elapsed]
aws_instance.web: Creation complete after 21s [id=i-08a85d295a82efdab]
aws_volume_attachment.ebs_att: Creating...
aws_volume_attachment.ebs_att: Still creating... [10s elapsed]
aws_volume_attachment.ebs_att: Still creating... [20s elapsed]
aws_volume_attachment.ebs_att: Creation complete after 23s [id=vai-3634650902]

Apply complete! Resources: 3 added, 0 changed, 0 destroyed.
```

- terraform destroy and you can check on the aws console the ebs was also destroyed

```terraform
terraform destroy
aws_ebs_volume.example: Refreshing state... [id=vol-0bdefa2a83219874c]
aws_instance.web: Refreshing state... [id=i-08a85d295a82efdab]
aws_volume_attachment.ebs_att: Refreshing state... [id=vai-3634650902]

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_ebs_volume.example will be destroyed
  - resource "aws_ebs_volume" "example" {
      - arn               = "arn:aws:ec2:us-east-1:729476260648:volume/vol-0bdefa2a83219874c" -> null
      - availability_zone = "us-east-1a" -> null
      - encrypted         = false -> null
      - id                = "vol-0bdefa2a83219874c" -> null
      - iops              = 100 -> null
      - size              = 1 -> null
      - tags              = {
          - "Name" = "orlando-test"
        } -> null
      - type              = "gp2" -> null
    }

  # aws_instance.web will be destroyed
  - resource "aws_instance" "web" {
      - ami                          = "ami-0ab1d87ce9286b9a4" -> null
      - arn                          = "arn:aws:ec2:us-east-1:729476260648:instance/i-08a85d295a82efdab" -> null
      - associate_public_ip_address  = true -> null
      - availability_zone            = "us-east-1a" -> null
      - cpu_core_count               = 1 -> null
      - cpu_threads_per_core         = 1 -> null
      - disable_api_termination      = false -> null
      - ebs_optimized                = false -> null
      - get_password_data            = false -> null
      - id                           = "i-08a85d295a82efdab" -> null
      - instance_state               = "running" -> null
      - instance_type                = "t1.micro" -> null
      - ipv6_address_count           = 0 -> null
      - ipv6_addresses               = [] -> null
      - monitoring                   = false -> null
      - primary_network_interface_id = "eni-0506821d4338b068b" -> null
      - private_dns                  = "ip-172-31-79-27.ec2.internal" -> null
      - private_ip                   = "172.31.79.27" -> null
      - public_dns                   = "ec2-34-200-224-248.compute-1.amazonaws.com" -> null
      - public_ip                    = "34.200.224.248" -> null
      - security_groups              = [
          - "default",
        ] -> null
      - source_dest_check            = true -> null
      - subnet_id                    = "subnet-f0bcc295" -> null
      - tags                         = {
          - "Name" = "orlando-test"
        } -> null
      - tenancy                      = "default" -> null
      - volume_tags                  = {
          - "Name" = "orlando-test"
        } -> null
      - vpc_security_group_ids       = [
          - "sg-7371cd0f",
        ] -> null

      - ebs_block_device {
          - delete_on_termination = false -> null
          - device_name           = "/dev/sdh" -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - volume_id             = "vol-0bdefa2a83219874c" -> null
          - volume_size           = 1 -> null
          - volume_type           = "gp2" -> null
        }

      - root_block_device {
          - delete_on_termination = true -> null
          - encrypted             = false -> null
          - iops                  = 100 -> null
          - volume_id             = "vol-006de9229d1c3e234" -> null
          - volume_size           = 8 -> null
          - volume_type           = "gp2" -> null
        }
    }

  # aws_volume_attachment.ebs_att will be destroyed
  - resource "aws_volume_attachment" "ebs_att" {
      - device_name = "/dev/sdh" -> null
      - id          = "vai-3634650902" -> null
      - instance_id = "i-08a85d295a82efdab" -> null
      - volume_id   = "vol-0bdefa2a83219874c" -> null
    }

Plan: 0 to add, 0 to change, 3 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_volume_attachment.ebs_att: Destroying... [id=vai-3634650902]
aws_volume_attachment.ebs_att: Still destroying... [id=vai-3634650902, 10s elapsed]
aws_volume_attachment.ebs_att: Destruction complete after 11s
aws_ebs_volume.example: Destroying... [id=vol-0bdefa2a83219874c]
aws_instance.web: Destroying... [id=i-08a85d295a82efdab]
aws_ebs_volume.example: Destruction complete after 1s
aws_instance.web: Still destroying... [id=i-08a85d295a82efdab, 10s elapsed]
aws_instance.web: Still destroying... [id=i-08a85d295a82efdab, 20s elapsed]
aws_instance.web: Still destroying... [id=i-08a85d295a82efdab, 30s elapsed]
aws_instance.web: Destruction complete after 33s

Destroy complete! Resources: 3 destroyed.
```
