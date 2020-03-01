# Examples

Available languages: [日本語](README.ja.md)

## List of examples

| title                                    | link                                 | IaaS |
| ---------------------------------------- | ------------------------------------ | ---- |
| One Instance on GCP                      | [simple-vm-on-gcp](simple-vm-on-gcp) | GCP  |
| One Step Instance and GPU Workers on GCP | [gpu-on-gcp](gpu-on-gcp)             | GCP  |
| One Step Instance and Web Servers on GCP | [https-on-gcp](https-on-gcp)         | GCP  |

## Appendix

### How to install terraform

You can install Terraform as below in macOS and Linux.

See also: https://www.terraform.io/downloads.html

```shellsession
export TERRAFORM_VERSION=0.12.9
export PLATFORM=$(uname -s | awk '{print(tolower($0))}')
curl -o /tmp/terraform.zip -L https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_${PLATFORM}_amd64.zip
sudo unzip -d /usr/local/bin/ /tmp/terraform.zip
```

### How to install Google Cloud SDK

Please refer to [Installing Google Cloud SDK](https://cloud.google.com/sdk/install).

### Get the service account key file from 1Password CLI

If you are a user of 1Password, you can get the GCP service account key file that below step.

```shellsession
eval $(op signin my)
op get document your-service-account@your-gcp-project.iam.gserviceaccount.com > .config/credentials/google-cloud-keyfile.json
```

### Download cargo-make

Linux:

```shellsession
export CARGO_MAKE_VERSION="0.26.1" \
&& curl -sL https://github.com/sagiegurari/cargo-make/releases/download/${CARGO_MAKE_VERSION}/cargo-make-v${CARGO_MAKE_VERSION}-x86_64-unknown-linux-musl.zip \
| busybox unzip -p - cargo-make-v${CARGO_MAKE_VERSION}-x86_64-unknown-linux-musl/cargo-make > bin/cargo-make && chmod a+x bin/cargo-make
```

macOS:

```shellsession
export CARGO_MAKE_VERSION="0.26.1" \
&& curl -sL https://github.com/sagiegurari/cargo-make/releases/download/${CARGO_MAKE_VERSION}/cargo-make-v${CARGO_MAKE_VERSION}-x86_64-apple-darwin.zip \
| bsdtar --strip-components 1 -C bin/ -xvf - cargo-make-v${CARGO_MAKE_VERSION}-x86_64-apple-darwin/cargo-make
```

```shellsession
bin/cargo-make make --makefile tasks/setup-project.toml
```
