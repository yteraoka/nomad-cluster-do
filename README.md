# Setup Consul, Nomad Cluster using Ansible + Terraform

DigitalOcean で
consul cluster (3台) + nomad server cluster (3台) + nomad worker (3台) のセットアップを行います。

![Nomad reference diagram](https://www.nomadproject.io/assets/images/nomad_reference_diagram-72c969e0.png "Nomad reference diagram")

## 1. Terraform で Server (droplet) 9台を作成

環境変数 `DIGITALOCEAN_TOKEN` に DigitalOcean の token をセットしておく必要があります。
tfenv を使う場合は明示的に use で version を指定しておく必要がある。

```
./step1.sh
```

- Ansible で Terraform を実行する
- 後のステップで使用するCA、証明書の作成なども行う

## 2. ansible playbook 適用

```
./step2.sh
```

- consul, nomad の通信は暗号化する
- consul, nomad の通信は TLS のクライアント証明書を必要とする
- Ansible の inventory に [terraform-inventory](https://github.com/adammck/terraform-inventory/) を使って terraform.tfstate から読み出している

## 3. ブラウザでアクセスする

```
./gen-p12.sh
```

`client.pfx` ファイルが作成されるのでこれを PC で読み込んでブラウザでクライアント証明書を使えるようにする。

- consul サーバーの 8501/tcp に https でアクセスする
- nomad サーバーの 4646/tcp に https でアクセスする

## 掃除

```
./destroy.sh
```

Ansible から実行しているが `terraform destroy` を実行しているだけ

## ドキュメント

### Consul

- [Consul Deployment Guide](https://learn.hashicorp.com/consul/advanced/day-1-operations/deployment-guide)
- [Creating and Configuring TLS Certificates](https://learn.hashicorp.com/consul/advanced/day-1-operations/certificates)
- [Bootstrapping the ACL System](https://learn.hashicorp.com/consul/advanced/day-1-operations/acl-guide)

### Nomad

- [Nomad Deployment Guide](https://www.nomadproject.io/guides/operations/deployment-guide.html)
- [Nomad Configuration](https://www.nomadproject.io/docs/configuration/index.html)
