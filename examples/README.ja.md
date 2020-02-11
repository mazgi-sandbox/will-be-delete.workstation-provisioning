# Examples

他の言語: [English](.)

## List of examples

| title                                    | link                                 | IaaS |
| ---------------------------------------- | ------------------------------------ | ---- |
| One Instance on GCP                      | [simple-vm-on-gcp](simple-vm-on-gcp) | GCP  |
| One Step Instance and GPU Workers on GCP | [gpu-on-gcp](gpu-on-gcp)             | GCP  |
| One Step Instance and Web Servers on GCP | [https-on-gcp](https-on-gcp)         | GCP  |

## Appendix

### How to install terraform

macOS や Linux では次のように Terraform をインストールできます。

See also: https://www.terraform.io/downloads.html

```shellsession
export TERRAFORM_VERSION=0.12.9
export PLATFORM=$(uname -s | awk '{print(tolower($0))}')
curl -o /tmp/terraform.zip -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${PLATFORM}_amd64.zip
sudo unzip -d /usr/local/bin/ /tmp/terraform.zip
```

### How to install Google Cloud SDK

[Installing Google Cloud SDK](https://cloud.google.com/sdk/install)を参照してください。
