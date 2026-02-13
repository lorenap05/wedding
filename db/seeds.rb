admin_email = ENV.fetch("ADMIN_EMAIL", "admin@casamento.com")
admin_password = ENV.fetch("ADMIN_PASSWORD", "trocar-essa-senha")

AdminUser.find_or_create_by!(email: admin_email) do |admin|
  admin.password = admin_password
  admin.password_confirmation = admin_password if admin.respond_to?(:password_confirmation=)
end

official_gifts = [
  ["Plano oficial para o Lukas não dormir no chão (porque ele já não vai dormir mesmo)", 540],
  ["Fundo não vamos chorar no primeiro mercado", 480],
  ["Nos ajude a pagar nossa dívida estudantil", 340],
  ["Café suficiente para manter o Lukas consciente", 300],
  ["Plano anti-miojo (porque Lorena realmente não sabe cozinhar)", 290],
  ["Kit de energético para sobreviver a 4h de sono por noite", 270],
  ["Primeira compra aleatória que esquecemos que precisávamos", 260],
  ["Reserva para as plantas novas", 250],
  ["Kit pintura para a Lorena ter companhia quando o Lukas estiver trabalhando no sábado", 240],
  ["Kit organização para 40m² de caos controlado", 230],
  ["Reserva para o delivery quando a Lorena queimar comida", 220],
  ["Primeiro pequeno luxo para não surtar", 180],
  ["Poupança para pegar Uber", 170],
  ["Jogo novo de Playstation para o Lukas ter uma vida além do trabalho", 160],
  ["Café da manhã dos campeões", 120],
  ["Chocolate terapêutico para dias difíceis", 100],
  ["Vai na fé que tudo vai dar certo", 70],
  ["Ajude o Lukas a permanecer minimamente funcional", 50]
]

official_gifts.each do |name, price|
  Gift.find_or_create_by!(name: name) do |gift|
    gift.price = price
    gift.description = "Presente em formato de contribuição para a nossa mudança."
  end
end
