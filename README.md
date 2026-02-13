# Site de Casamento em Ruby on Rails

Projeto inicial para site de casamento com:

- Página inicial inspirada no layout enviado
- Página de RSVP (nome + presença) persistida em SQLite
- Página de presentes com fluxo de pagamento por QR Code
- Painel admin com login por e-mail/senha

## Pastas importantes

- `app/assets/images/wedding/`: armazene aqui as fotos oficiais do site.

## Configuração

1. Instale gems: `bundle install`
2. Crie banco e rode migrations: `bin/rails db:setup`
3. Rode o servidor: `bin/rails server`

## Configuração de admin para deploy

Antes do primeiro `db:seed` em produção, configure credenciais via variáveis de ambiente:

- `ADMIN_EMAIL`
- `ADMIN_PASSWORD`

Exemplo:

```bash
ADMIN_EMAIL=admin@seudominio.com ADMIN_PASSWORD='uma-senha-forte' bin/rails db:seed
```

Também é possível trocar a senha depois pelo painel em **/admin/settings**.

## Acesso admin (seed)

- E-mail: `admin@casamento.com`
- Senha: `trocar-essa-senha`

Altere imediatamente após o primeiro login.
