# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
products = [
  {
    name: "Página de aterragem",
    description: "Uma experiência premium de uma página para lançamentos, campanhas e ofertas validadas.",
    base_price_cents: 150_000,
    features: [ "Sessão de estratégia", "Estrutura de copy focada em conversão", "Design responsivo", "Implementação Rails", "Configuração de analytics", "Checklist de lançamento" ],
    position: 1
  },
  {
    name: "Website",
    description: "Um website completo para empresas, com padrões reutilizáveis, navegação clara e espaço para crescer.",
    base_price_cents: 350_000,
    features: [ "Descoberta e mapa do site", "Até 6 páginas principais", "Componentes de design reutilizáveis", "Formulários de contacto e orçamento", "Bases de SEO", "Revisão de performance e acessibilidade" ],
    position: 2
  },
  {
    name: "Loja online",
    description: "Uma loja online cuidada para empresas que precisam de clareza nos produtos e um percurso de compra fiável.",
    base_price_cents: 650_000,
    features: [ "Estrutura de catálogo", "Design da montra", "Planeamento de checkout", "Bases de emails transaccionais", "Admin preparado para inventário", "Suporte de lançamento" ],
    position: 3
  },
  {
    name: "Solução à medida",
    description: "Uma solução Rails personalizada para fluxos de trabalho, portais, dashboards e produtos digitais específicos.",
    base_price_cents: 10_000_00,
    features: [ "Descoberta de produto", "Planeamento técnico", "Aplicação Rails personalizada", "Fluxos de admin", "Integrações", "Roadmap e plano de suporte" ],
    position: 4
  }
]

products.each do |attributes|
  Product.find_or_initialize_by(position: attributes[:position]).tap do |product|
    product.assign_attributes(attributes.merge(cta_label: "Pedir orçamento", published: true))
    product.save!
  end
end

projects = [
  {
    title: "PulseFit Challenge Launch",
    product_type: "Página de aterragem",
    industry: "Fitness",
    summary: "Uma página de campanha energética para um programa de coaching de 30 dias com um caminho claro de inscrição.",
    outcome: "Mensagem mais focada, prova mais forte e captação rápida de leads para tráfego pago.",
    services: [ "Estratégia da página", "Estrutura de campanha", "Captação de leads" ],
    featured: true,
    position: 1
  },
  {
    title: "NovaTax Consultation Page",
    product_type: "Página de aterragem",
    industry: "Finance",
    summary: "Uma página focada em conversão para uma oferta sazonal de consultoria fiscal para fundadores.",
    outcome: "Menos fricção, urgência mais clara e uma secção de confiança junto à marcação.",
    services: [ "Posicionamento da oferta", "Design de CTA", "Analytics" ],
    featured: true,
    position: 2
  },
  {
    title: "Luma Course Waitlist",
    product_type: "Página de aterragem",
    industry: "Education",
    summary: "Uma página de lista de espera para um curso premium com prova, currículo e acesso antecipado.",
    outcome: "Uma campanha cuidada para validar procura antes de construir a plataforma completa.",
    services: [ "Fluxo de lista de espera", "Estrutura de copy", "Construção responsiva" ],
    featured: true,
    position: 3
  },
  {
    title: "Website Atlas Advisory",
    product_type: "Website",
    industry: "Professional Services",
    summary: "Um website claro para uma consultora que queria transformar referências numa presença inbound escalável.",
    outcome: "Posicionamento mais claro, melhor fluxo de contacto e padrões reutilizáveis para novos serviços.",
    services: [ "Estratégia de website", "Sistema visual", "Construção Rails" ],
    featured: true,
    position: 4
  },
  {
    title: "Harbor Dental Studio",
    product_type: "Website",
    industry: "Healthcare",
    summary: "Um website calmo e premium com páginas de serviço, FAQ para pacientes e encaminhamento para marcações.",
    outcome: "Primeira impressão mais confiante e caminho mais claro da pesquisa à marcação.",
    services: [ "Arquitectura de serviços", "Secções de confiança", "Fluxo de contacto" ],
    featured: false,
    position: 5
  },
  {
    title: "Fieldstone Architecture",
    product_type: "Website",
    industry: "Architecture",
    summary: "Um website de estúdio centrado em portefólio, equilibrando imagem, processo e pedidos de contacto.",
    outcome: "Estrutura editorial refinada que torna o trabalho de alto valor mais fácil de explorar.",
    services: [ "Sistema de portefólio", "Página Sobre", "Design de pedido" ],
    featured: false,
    position: 6
  },
  {
    title: "Northline Commerce Refresh",
    product_type: "Loja online",
    industry: "Retail",
    summary: "Um conceito moderno de ecommerce focado em confiança, merchandising editorial e conversão mobile.",
    outcome: "Estrutura de loja preparada para migração de catálogo e integração de checkout.",
    services: [ "UX ecommerce", "Arquitectura de produto", "Montra responsiva" ],
    featured: true,
    position: 7
  },
  {
    title: "Sol Pantry Market",
    product_type: "Loja online",
    industry: "Food",
    summary: "Uma loja online acolhedora para produtos alimentares, com categorias, detalhe de produto e carrinho claro.",
    outcome: "Descoberta de produto mais simples e caminho mais calmo até à intenção de compra.",
    services: [ "Design da montra", "Estrutura de catálogo", "Experiência de carrinho" ],
    featured: false,
    position: 8
  },
  {
    title: "Aster Home Goods",
    product_type: "Loja online",
    industry: "Home Decor",
    summary: "Uma montra premium para artigos de casa, com storytelling de colecções e cartões de produto comparáveis.",
    outcome: "Experiência de compra mais rica sem complicar escolha, carrinho ou checkout.",
    services: [ "Páginas de colecção", "Cartões de produto", "Planeamento de checkout" ],
    featured: false,
    position: 9
  },
  {
    title: "SignalOps Portal",
    product_type: "Solução à medida",
    industry: "Operations",
    summary: "Um protótipo de dashboard para pedidos internos, acompanhamento de projectos e comunicação com clientes.",
    outcome: "Base prática para uma aplicação Rails com fluxos de trabalho personalizados.",
    services: [ "Design de workflow", "Interface de admin", "Protótipo de aplicação" ],
    featured: true,
    position: 10
  },
  {
    title: "Relay Client Hub",
    product_type: "Solução à medida",
    industry: "Agency",
    summary: "Um conceito de portal de cliente para aprovações, ficheiros, estados de projecto e notas de reunião.",
    outcome: "Um espaço operacional único que reduz comunicação dispersa e seguimento manual.",
    services: [ "UX de portal", "Workflow de aprovação", "Dashboard admin" ],
    featured: false,
    position: 11
  },
  {
    title: "Motive Inventory Desk",
    product_type: "Solução à medida",
    industry: "Logistics",
    summary: "Um sistema interno leve para verificações de inventário, excepções e relatórios semanais.",
    outcome: "Workflow mais claro para equipas que precisam de software próprio sem complexidade empresarial.",
    services: [ "Aplicação Rails", "Relatórios", "Workflows por função" ],
    featured: false,
    position: 12
  }
]

projects.each do |attributes|
  PortfolioProject.find_or_initialize_by(position: attributes[:position]).tap do |project|
    project.assign_attributes(attributes.merge(published: true))
    project.save!
  end
end

faqs = [
  [ "Geral", "Quanto tempo demora um projecto?", "Uma página de aterragem focada pode ser lançada em 1 a 2 semanas. Um website completo costuma demorar 3 a 6 semanas, dependendo de conteúdo, feedback e integrações." ],
  [ "Preços", "Os preços são fixos?", "Os preços listados são pontos de partida transparentes. O valor final depende de âmbito, conteúdo, integrações e prazo." ],
  [ "Processo", "Ajudam com conteúdo?", "Sim. Todos os projectos incluem estrutura de conteúdo. Copywriting pode ser adicionado quando quiser que a CPT escreva ou refine o texto final." ],
  [ "Propriedade", "Quem fica dono do website depois do lançamento?", "O website, o conteúdo e os acessos ficam consigo. A CPT pode continuar a dar suporte se quiser manter um parceiro técnico." ],
  [ "Tecnologia", "Porquê Rails?", "Rails mantém o site rápido, sustentável e preparado para crescer para admins, portais, ecommerce ou funcionalidades à medida." ]
]

faqs.each_with_index do |(category, question, answer), index|
  Faq.find_or_initialize_by(question: question).tap do |faq|
    faq.assign_attributes(category: category, answer: answer, position: index + 1, published: true)
    faq.save!
  end
end

admin_email = ENV.fetch("ADMIN_EMAIL", "admin@cptconsulting.com")
admin_password = ENV.fetch("ADMIN_PASSWORD", "password123")

AdminUser.find_or_create_by!(email: admin_email) do |admin|
  admin.password = admin_password
  admin.password_confirmation = admin_password
end
