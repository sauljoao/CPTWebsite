import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [
    "eyebrow",
    "title",
    "body",
    "control",
    "metricLabel",
    "metric",
    "progress",
    "screenEyebrow",
    "screenTitle",
    "screenBody",
    "actionTitle",
    "actionBody",
    "actionButton"
  ]

  static values = {
    kind: String
  }

  connect() {
    this.interactionCount = 0
    this.showState(this.controlTargets.find((control) => control.dataset.active === "true")?.dataset.productMockupStateParam)
  }

  show(event) {
    this.showState(event.params.state)
  }

  interact() {
    this.interactionCount += 1
    const state = this.currentState || this.defaultState
    const nextMetric = this.interactionCount === 1 ? "Activo" : `${this.interactionCount} acções`
    this.metricTarget.textContent = nextMetric
    this.actionBodyTarget.textContent = this.copyFor(state).interaction
    this.actionButtonTarget.textContent = this.copyFor(state).buttonAfter
  }

  showState(state = this.defaultState) {
    this.currentState = state
    const copy = this.copyFor(state)

    this.controlTargets.forEach((control) => {
      control.dataset.active = String(control.dataset.productMockupStateParam === state)
    })

    this.eyebrowTarget.textContent = copy.eyebrow
    this.titleTarget.textContent = copy.title
    this.bodyTarget.textContent = copy.body
    this.metricLabelTarget.textContent = copy.metricLabel
    this.metricTarget.textContent = copy.metric
    this.progressTarget.style.width = copy.progress
    this.screenEyebrowTarget.textContent = copy.screenEyebrow
    this.screenTitleTarget.textContent = copy.screenTitle
    this.screenBodyTarget.textContent = copy.screenBody
    this.actionTitleTarget.textContent = copy.actionTitle
    this.actionBodyTarget.textContent = copy.actionBody
    this.actionButtonTarget.textContent = copy.button
  }

  copyFor(state) {
    return this.copy[state] || this.copy[this.defaultState]
  }

  get defaultState() {
    return {
      landing: "hero",
      website: "home",
      ecommerce: "shop",
      custom: "dashboard",
      dashboard: "plan"
    }[this.kindValue] || "plan"
  }

  get copy() {
    return {
      hero: {
        eyebrow: "Página de aterragem",
        title: "Um primeiro ecrã focado numa oferta clara.",
        body: "Mensagem, prova e acção principal trabalham em conjunto sem distracções.",
        metricLabel: "Clareza",
        metric: "98",
        progress: "88%",
        screenEyebrow: "Oferta de lançamento",
        screenTitle: "Uma promessa, um público, uma acção.",
        screenBody: "Uma página criada para campanhas, captação de leads e validação rápida.",
        actionTitle: "CTA principal",
        actionBody: "A chamada à acção mantém-se visível e directa.",
        interaction: "CTA activado. A pré-visualização mostra uma nota curta de confiança.",
        button: "Clicar CTA",
        buttonAfter: "CTA activo"
      },
      proof: {
        eyebrow: "Página de aterragem",
        title: "A prova aparece onde a dúvida surge.",
        body: "Testemunhos, métricas e garantias apoiam a decisão sem criar ruído.",
        metricLabel: "Confiança",
        metric: "Forte",
        progress: "76%",
        screenEyebrow: "Bloco de prova",
        screenTitle: "Resultados, logos e frases curtas.",
        screenBody: "O visitante lê evidência rapidamente antes de avançar.",
        actionTitle: "Revelar prova",
        actionBody: "Uma micro-interacção mostra prova sem desviar o visitante.",
        interaction: "Prova expandida. Testemunho e métrica estão visíveis.",
        button: "Revelar",
        buttonAfter: "Visível"
      },
      cta: {
        eyebrow: "Página de aterragem",
        title: "A secção final reduz fricção.",
        body: "Um formulário curto, marcação ou pedido de orçamento capta intenção com pouco esforço.",
        metricLabel: "Caminho da lead",
        metric: "Pronto",
        progress: "92%",
        screenEyebrow: "Conversão",
        screenTitle: "O próximo passo certo no momento certo.",
        screenBody: "A página termina com uma acção clara e contexto suficiente.",
        actionTitle: "Captação",
        actionBody: "A interacção pode validar dados ou enviar para orçamento.",
        interaction: "Pedido iniciado. O interesse passa a acção sem escolhas extra.",
        button: "Iniciar pedido",
        buttonAfter: "Pedido iniciado"
      },
      home: {
        eyebrow: "Website",
        title: "Uma homepage que encaminha visitantes rapidamente.",
        body: "O website dá a cada público um caminho claro para serviços, prova e contacto.",
        metricLabel: "Navegação",
        metric: "A+",
        progress: "82%",
        screenEyebrow: "Website empresarial",
        screenTitle: "Uma homepage moderna com caminhos claros.",
        screenBody: "Hero, serviços, prova e contacto criam confiança rapidamente.",
        actionTitle: "Pré-visualização",
        actionBody: "Os visitantes movem-se entre secções sem perder contexto.",
        interaction: "Navegação aberta. Serviços, prova e contacto ficam fáceis de ler.",
        button: "Abrir menu",
        buttonAfter: "Menu aberto"
      },
      services: {
        eyebrow: "Website",
        title: "Páginas de serviço explicam valor sem ruído.",
        body: "Secções reutilizáveis tornam cada serviço consistente e específico.",
        metricLabel: "Profundidade",
        metric: "6 páginas",
        progress: "70%",
        screenEyebrow: "Serviços",
        screenTitle: "Páginas estruturadas por oferta.",
        screenBody: "Benefícios, processo, FAQ e CTA repetem-se com consistência.",
        actionTitle: "Trocar secção",
        actionBody: "A pré-visualização troca secções como componentes reais.",
        interaction: "Secção seleccionada. A vista actualiza sem recarregar a página.",
        button: "Trocar",
        buttonAfter: "Activa"
      },
      about: {
        eyebrow: "Website",
        title: "Sobre e prova tornam o negócio real.",
        body: "História, valores, processo e casos ajudam a perceber quem está por trás.",
        metricLabel: "Credibilidade",
        metric: "Alta",
        progress: "78%",
        screenEyebrow: "Sobre",
        screenTitle: "Uma história credível.",
        screenBody: "Pessoas, processo e resultados em secções calmas e legíveis.",
        actionTitle: "Camada de confiança",
        actionBody: "Uma interacção leve revela prova sem poluir a página.",
        interaction: "Prova revelada. Processo e casos estão destacados.",
        button: "Mostrar prova",
        buttonAfter: "Prova visível"
      },
      shop: {
        eyebrow: "Loja online",
        title: "Uma montra que torna a escolha simples.",
        body: "Categoria, produto e carrinho são desenhados para confiança e rapidez.",
        metricLabel: "Catálogo",
        metric: "Rápido",
        progress: "74%",
        screenEyebrow: "Montra",
        screenTitle: "Grelha limpa com filtros confiantes.",
        screenBody: "Clientes comparam produtos, preço e detalhes rapidamente.",
        actionTitle: "Filtro",
        actionBody: "Os filtros reduzem o catálogo sem esconder informação essencial.",
        interaction: "Filtro aplicado. Os produtos relevantes estão destacados.",
        button: "Filtrar",
        buttonAfter: "Filtrado"
      },
      product: {
        eyebrow: "Loja online",
        title: "Detalhes de produto respondem às dúvidas de compra.",
        body: "Fotografia, specs, entrega, reviews e acções ficam próximos.",
        metricLabel: "Confiança",
        metric: "92%",
        progress: "86%",
        screenEyebrow: "Detalhe",
        screenTitle: "Informação perto do adicionar ao carrinho.",
        screenBody: "Variantes, prova e entrega apoiam a decisão.",
        actionTitle: "Escolha de variante",
        actionBody: "A vista pode trocar variantes, preço e stock.",
        interaction: "Variante seleccionada. Preço, stock e CTA actualizaram.",
        button: "Escolher",
        buttonAfter: "Escolhida"
      },
      cart: {
        eyebrow: "Loja online",
        title: "O carrinho mantém o checkout calmo.",
        body: "Um bom carrinho resume valor, totais, entrega e próximo passo.",
        metricLabel: "Checkout",
        metric: "Pronto",
        progress: "90%",
        screenEyebrow: "Carrinho",
        screenTitle: "Resumo claro antes do checkout.",
        screenBody: "Itens, totais, entrega e suporte ficam visíveis.",
        actionTitle: "Acção do carrinho",
        actionBody: "Adicionar produto actualiza o carrinho de imediato.",
        interaction: "Produto adicionado. O carrinho mostra um item pronto.",
        button: "Adicionar",
        buttonAfter: "Adicionado"
      },
      dashboard: {
        eyebrow: "Solução à medida",
        title: "Um dashboard transforma operação em sistema claro.",
        body: "Rails à medida organiza trabalho, pedidos, clientes e métricas num só lugar.",
        metricLabel: "Operação",
        metric: "Ao vivo",
        progress: "80%",
        screenEyebrow: "Dashboard",
        screenTitle: "Tudo o que importa numa vista.",
        screenBody: "Estados, responsáveis, prioridades e próximas acções visíveis.",
        actionTitle: "Acção de tarefa",
        actionBody: "Uma interface à medida move registos por estados reais.",
        interaction: "Tarefa avançada. Estado e métrica foram actualizados.",
        button: "Avançar",
        buttonAfter: "Avançado"
      },
      workflow: {
        eyebrow: "Solução à medida",
        title: "Workflows alinhados com a forma real de trabalhar.",
        body: "A solução codifica aprovações, pedidos, passagens e notificações sem cerimónia extra.",
        metricLabel: "Automação",
        metric: "3 passos",
        progress: "72%",
        screenEyebrow: "Workflow",
        screenTitle: "Um pedido a avançar por estados claros.",
        screenBody: "Entrada, revisão, aprovação e conclusão podem viver em Rails.",
        actionTitle: "Aprovação",
        actionBody: "A interacção simula uma decisão real.",
        interaction: "Aprovado. O pedido avançou para o próximo estado.",
        button: "Aprovar",
        buttonAfter: "Aprovado"
      },
      report: {
        eyebrow: "Solução à medida",
        title: "Relatórios tornam o sistema útil depois do lançamento.",
        body: "Dashboards e exportações mantêm decisores perto dos números.",
        metricLabel: "Insight",
        metric: "Claro",
        progress: "84%",
        screenEyebrow: "Relatórios",
        screenTitle: "Números prontos para decisão.",
        screenBody: "Tendências, totais e excepções sem limpeza manual.",
        actionTitle: "Acção de relatório",
        actionBody: "Um relatório pode filtrar, exportar ou abrir detalhe.",
        interaction: "Relatório filtrado. A vista foca os registos prioritários.",
        button: "Filtrar",
        buttonAfter: "Filtrado"
      },
      plan: {
        eyebrow: "Sistema CPT",
        title: "Estratégia, design e entrega ficam ligados.",
        body: "Esta pré-visualização mostra como a CPT mantém cada projecto claro.",
        metricLabel: "Clareza",
        metric: "Alta",
        progress: "78%",
        screenEyebrow: "Plano",
        screenTitle: "Um caminho calmo da ideia ao lançamento.",
        screenBody: "Descoberta, design, construção e lançamento visíveis desde o início.",
        actionTitle: "Planeamento",
        actionBody: "A vista move estratégia e design sem perder o objectivo.",
        interaction: "Plano avançado. O próximo marco está destacado.",
        button: "Avançar",
        buttonAfter: "Avançado"
      },
      design: {
        eyebrow: "Sistema CPT",
        title: "Decisões de design reutilizáveis criam ritmo.",
        body: "Componentes, cores e padrões nascem em contexto e reutilizam-se quando fazem sentido.",
        metricLabel: "Reutilização",
        metric: "Inteligente",
        progress: "70%",
        screenEyebrow: "Sistema de design",
        screenTitle: "Componentes que servem páginas reais.",
        screenBody: "Cartões, secções, botões, formulários e mockups tornam-se reutilizáveis em uso real.",
        actionTitle: "Acção de design",
        actionBody: "A interacção destaca um módulo reutilizável.",
        interaction: "Módulo destacado. O sistema ganhou mais um componente provado.",
        button: "Destacar",
        buttonAfter: "Destacado"
      },
      launch: {
        eyebrow: "Sistema CPT",
        title: "A prontidão de lançamento é visível antes do dia final.",
        body: "Performance, acessibilidade, conteúdo e admin são revistos antes da entrega.",
        metricLabel: "Prontidão",
        metric: "92%",
        progress: "92%",
        screenEyebrow: "Lançamento",
        screenTitle: "Revisões antes do site ficar online.",
        screenBody: "QA responsivo, conteúdo, analytics e deploy fecham o projecto.",
        actionTitle: "Acção de lançamento",
        actionBody: "A vista marca tarefas concluídas à medida que passam.",
        interaction: "Checklist actualizado. O projecto está mais perto do lançamento.",
        button: "Validar",
        buttonAfter: "Validado"
      }
    }
  }
}
