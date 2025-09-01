# CloudFit API 🚴‍♀️

## 📌 Objetivo do Projeto
Este projeto faz parte de um estudo DevOps para a startup fictícia **CloudFit**, que precisa de uma **API REST** para monitorar atividades físicas em tempo real.  
Além da API, o projeto contempla **Infraestrutura como Código (IaC)** e **CI/CD com GitHub Actions**, permitindo automação de provisionamento, testes e deploy.

---

## 🖥️ Como rodar localmente

1. Clone o repositório:
   ```bash
   git clone https://github.com/guilhermelaender/tarefa-2-github-copilot


2. Crie e ative um ambiente virtual:
   ```bash
   python -m venv venv
   source venv/bin/activate   # Linux/Mac
   venv\Scripts\activate      # Windows
   ```

3. Instale as dependências:
   ```bash
   pip install -r requirements.txt
   ```

4. Rode a API localmente:
   ```bash
   uvicorn app.main:app --reload
   ```

5. Acesse em:  
   👉 [http://localhost:8000/status](http://localhost:8000/status)  
   A resposta esperada é:
   ```json
   {"status": "ok"}
   ```

---

## ☁️ Como funciona a infraestrutura
A infraestrutura é definida como **IaC (Infraestrutura como Código)** no diretório `infra/`.  
O provisionamento pode ser feito usando **Terraform**, garantindo reprodutibilidade e automação.

Exemplo de uso:

```bash
cd infra

# Inicializa o Terraform
terraform init

# Mostra o que será criado/alterado
terraform plan

# Aplica as mudanças (provisiona os recursos)
terraform apply -auto-approve

# Destroi a infraestrutura (quando não for mais necessária)
terraform destroy -auto-approve
```

> ⚠️ Dependendo do provedor (AWS, Azure, GCP), é necessário configurar credenciais de acesso antes de rodar os comandos.

---

## 🔄 Como funciona o CI/CD
O pipeline está definido em **`CI-CD.yaml`** e executa as seguintes etapas:

1. **Instalar dependências**  
   - Usa `pip install -r requirements.txt` para instalar pacotes necessários (FastAPI, pytest, lint etc.).

2. **Rodar testes**  
   - Executa `pytest` para validar o funcionamento da aplicação.  
   - Testes podem incluir o endpoint `/status`.

3. **Fazer deploy (simulado)**  
   - A etapa de deploy roda em pushes para a branch `main`.  
   - Atualmente o deploy é **simulado**, empacotando a aplicação e exibindo logs de um deploy fictício.  
   - Pode ser estendido para deploy real em **AWS, Azure ou GCP**.

---

## 📂 Estrutura do Projeto
```
.
├── app/              # Código da aplicação (FastAPI)
│   └── main.py
├── infra/            # Scripts de IaC (infraestrutura com Terraform)
├── CI-CD.yaml        # Workflow do GitHub Actions (CI/CD)
├── requirements.txt  # Dependências do projeto
└── .git/             # Controle de versão
```

---

⚡ **Resumo**:  
Este projeto integra **desenvolvimento (API)** + **infraestrutura (IaC)** + **DevOps (CI/CD)** em um fluxo único com GitHub Copilot como assistente de código.
