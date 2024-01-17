# 個人開発用のインフラのテンプレート

# リソース作成手順

1. GCPのプロジェクトを作成
1. gcloudコマンドの向き先を作成したプロジェクトにする
1. `make init`
    1. `Makefile`の`GCP_PROJECT_ID`にGCPのプロジェクトIDを入れる
1. [Neon](https://neon.tech/)でDBを作成
1. 作成したDBのURLを、GCPのコンソール上からシークレットマネージャーに登録
1. Terraform CloudでWorkspacesを作成してApply

```bash
gcloud auth login
```

```bash
gcloud config set project
```

```bash
gcloud auth configure-docker asia-northeast1-docker.pkg.dev
```

参考. https://cloud.google.com/sdk/gcloud/reference/auth/configure-docker
