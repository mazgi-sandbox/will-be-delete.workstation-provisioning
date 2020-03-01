# Examples: (TITLE)

Available languages: [日本語](README.ja.md)

This example creates GCP resources as below.

(TBD)

## Prepare

### Create .env file

(TBD)

### Export environment variables via .env file

`.env` ファイルに書かれた値を環境変数として export するには次のようにします。

```shellsession
export $(xargs < .env)
```

### Create a Cloud Storage bucket for save tfstate

Terraform の適用状態を管理する `tfstate` ファイルを保存するために Google Cloud Storage(GCS)のバケットを作ります。

```shellsession
gsutil mb gs://${PROJECT_UUID}-system/
gsutil acl set private gs://${PROJECT_UUID}-system/
gsutil versioning set on gs://${PROJECT_UUID}-system/
```

See also:

- https://www.terraform.io/docs/backends/types/gcs.html
- https://cloud.google.com/storage/docs/gsutil

### Initialize tfstate file

GCS バケットができたら次のように `terraform init` コマンドを実行します。

```shellsession
terraform init -backend-config="bucket=${PROJECT_UUID}-system"
```

## Create and update resources

次のように `terraform apply` コマンドを実行するとコードが GCP 上に反映され、リソースが作成/変更されます。

```shellsession
terraform apply
```

## Delete all resources

次のように `terraform destroy` コマンドを実行するとコードで定義した全てのリソースが GCP 上から削除されます。

```shellsession
terraform destroy
```
