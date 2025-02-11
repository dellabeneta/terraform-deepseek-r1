
Este projeto utiliza Terraform para provisionar e gerenciar a infraestrutura na DigitalOcean. Ele inclui a criação de droplets, balanceadores de carga, firewalls, registros DNS e VPCs.

## Estrutura do Projeto

- `backend.tf`: Configuração do backend para armazenar o estado do Terraform no S3.
- `provider.tf`: Configuração do provedor DigitalOcean.
- `variables.tf`: Definição das variáveis utilizadas no projeto.
- `outputs.tf`: Definição das saídas do Terraform.
- `network.tf`: Configuração da VPC.
- `droplet.tf`: Configuração dos droplets.
- `load-balancer.tf`: Configuração do balanceador de carga.
- `firewall.tf`: Configuração do firewall.
- `records.tf`: Configuração dos registros DNS.
- `ssh-key.tf`: Configuração da chave SSH.
- `env-tst.tfvars`, `env-stg.tfvars`, `env-prd.tfvars`: Arquivos de variáveis para diferentes ambientes (teste, staging, produção).

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado.
- Token da API do DigitalOcean.
- Chave SSH pública para acesso aos droplets.

## Configuração

1. Clone o repositório:

    ```sh
    git clone <URL_DO_REPOSITORIO>
    cd <NOME_DO_REPOSITORIO>
    ```

2. Crie um arquivo [terraform.tfvars](http://_vscodecontentref_/2) com o seguinte conteúdo:

    ```tfvars
    do_token = "SEU_TOKEN_DA_API_DO_DIGITALOCEAN"
    domain_name = "SEU_DOMINIO"
    certificate_name = "NOME_DO_CERTIFICADO"
    ```

3. Escolha o ambiente desejado (`env-tst.tfvars`, [env-stg.tfvars](http://_vscodecontentref_/3), [env-prd.tfvars](http://_vscodecontentref_/4)) e ajuste as variáveis conforme necessário.

4. Utilize os arquivos de exemplo [backend.tf.example](http://_vscodecontentref_/5) e [terraform.tfvars.example](http://_vscodecontentref_/6) como referência para criar seus próprios arquivos [backend.tf](http://_vscodecontentref_/7) e [terraform.tfvars](http://_vscodecontentref_/8). Renomeie os arquivos de exemplo e ajuste as configurações conforme necessário:

    ```sh
    cp backend.tf.example backend.tf
    cp terraform.tfvars.example terraform.tfvars
    ```

## Uso

1. Inicialize o Terraform:

    ```sh
    terraform init
    ```

2. Visualize o plano de execução:

    ```sh
    terraform plan -var-file=env-tst.tfvars
    ```

3. Aplique o plano:

    ```sh
    terraform apply -var-file=env-tst.tfvars
    ```

4. Para destruir a infraestrutura:

    ```sh
    terraform destroy -var-file=env-tst.tfvars
    ```

## Saídas

- `droplet_ips`: Mapa que associa o nome de cada droplet ao seu endereço IPv4 público.
- `vpc_ip_range`: Faixa de IP da VPC.
- `ssh_key_fingerprint`: Impressão digital da chave SSH registrada.
- `load_balancer_pip`: Endereço IP público do load balancer.
- `record_name`: Nome do registro A no DNS.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.