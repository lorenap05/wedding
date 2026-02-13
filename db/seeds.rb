AdminUser.find_or_create_by!(email: "admin@casamento.com") do |admin|
  admin.password = "trocar-essa-senha"
  admin.password_confirmation = "trocar-essa-senha"
end

[
  ["Jantar romântico", 250.00],
  ["Jogo de panelas", 399.90],
  ["Air fryer", 550.00]
].each do |name, price|
  Gift.find_or_create_by!(name: name) do |gift|
    gift.price = price
    gift.image_url = "https://placehold.co/600x400?text=#{CGI.escape(name)}"
    gift.description = "Descrição editável do presente #{name}."
  end
end
