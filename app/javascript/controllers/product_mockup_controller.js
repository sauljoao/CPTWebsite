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
    const nextMetric = this.interactionCount === 1 ? "Active" : `${this.interactionCount} actions`
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
        eyebrow: "Landing page",
        title: "A focused first screen for one clear offer.",
        body: "Hero messaging, supporting proof, and one primary action work together without distractions.",
        metricLabel: "Message clarity",
        metric: "98",
        progress: "88%",
        screenEyebrow: "Launch offer",
        screenTitle: "One promise, one audience, one action.",
        screenBody: "A landing page preview built for campaign traffic, lead capture, and fast validation.",
        actionTitle: "Hero CTA",
        actionBody: "The call-to-action stays visible and direct so the visitor always knows the next step.",
        interaction: "CTA clicked. The preview reveals a short trust note and keeps the lead path focused.",
        button: "Click CTA",
        buttonAfter: "CTA clicked"
      },
      proof: {
        eyebrow: "Landing page",
        title: "Trust signals appear exactly where doubt shows up.",
        body: "Testimonials, metrics, and guarantees support the page without turning it into a brochure.",
        metricLabel: "Trust lift",
        metric: "Strong",
        progress: "76%",
        screenEyebrow: "Proof block",
        screenTitle: "Results, logos, and short quotes.",
        screenBody: "The visitor can scan evidence quickly before committing to the action.",
        actionTitle: "Proof reveal",
        actionBody: "Useful micro-interactions can reveal supporting proof without moving the visitor away.",
        interaction: "Proof expanded. A compact testimonial and result metric are now visible.",
        button: "Reveal proof",
        buttonAfter: "Proof visible"
      },
      cta: {
        eyebrow: "Landing page",
        title: "The final section removes friction.",
        body: "A short form, scheduling path, or quote request captures intent with minimal effort.",
        metricLabel: "Lead path",
        metric: "Ready",
        progress: "92%",
        screenEyebrow: "Conversion",
        screenTitle: "A simple next step at the right moment.",
        screenBody: "The page closes with a confident CTA and just enough context to act.",
        actionTitle: "Lead capture",
        actionBody: "The interaction can validate input, expose availability, or send visitors to quote flow.",
        interaction: "Lead path started. The mockup moves from interest to request without extra choices.",
        button: "Start request",
        buttonAfter: "Request started"
      },
      home: {
        eyebrow: "Website",
        title: "A homepage that routes visitors quickly.",
        body: "The website product gives every major audience a clear path into services, proof, and contact.",
        metricLabel: "Navigation clarity",
        metric: "A+",
        progress: "82%",
        screenEyebrow: "Company website",
        screenTitle: "A modern homepage with clear routes.",
        screenBody: "Hero, services, proof, and contact modules establish trust in the first few scrolls.",
        actionTitle: "Navigation preview",
        actionBody: "Visitors can move between core sections without losing context.",
        interaction: "Navigation opened. Services, proof, and contact routes stay easy to scan.",
        button: "Open menu",
        buttonAfter: "Menu open"
      },
      services: {
        eyebrow: "Website",
        title: "Service pages explain value without clutter.",
        body: "Reusable content sections make each service consistent while leaving room for specific proof.",
        metricLabel: "Service depth",
        metric: "6 pages",
        progress: "70%",
        screenEyebrow: "Services",
        screenTitle: "Structured pages for each offer.",
        screenBody: "Benefits, process, FAQ, and CTA blocks repeat cleanly across the site.",
        actionTitle: "Section switch",
        actionBody: "The mockup swaps page sections the same way real reusable components would.",
        interaction: "Service section selected. The preview updates without a full page reload.",
        button: "Switch section",
        buttonAfter: "Section active"
      },
      about: {
        eyebrow: "Website",
        title: "About and proof make the business feel real.",
        body: "Story, values, process, and case studies help buyers understand who they are trusting.",
        metricLabel: "Credibility",
        metric: "High",
        progress: "78%",
        screenEyebrow: "About",
        screenTitle: "A credible company story.",
        screenBody: "People, process, and results are organized into calm, readable sections.",
        actionTitle: "Trust layer",
        actionBody: "A light interaction can reveal extra proof while keeping the page clean.",
        interaction: "Trust layer revealed. Process and case study cues are now highlighted.",
        button: "Show proof",
        buttonAfter: "Proof shown"
      },
      shop: {
        eyebrow: "Ecommerce",
        title: "A storefront that helps products feel easy to choose.",
        body: "Category, product, and cart moments are designed around confidence and speed.",
        metricLabel: "Catalog scan",
        metric: "Fast",
        progress: "74%",
        screenEyebrow: "Storefront",
        screenTitle: "A clean product grid with confident filters.",
        screenBody: "Customers can compare products, understand pricing, and move to detail pages quickly.",
        actionTitle: "Product filter",
        actionBody: "Interactions help customers narrow the catalog without hiding key product information.",
        interaction: "Filter applied. The preview highlights the most relevant products.",
        button: "Apply filter",
        buttonAfter: "Filtered"
      },
      product: {
        eyebrow: "Ecommerce",
        title: "Product detail pages answer buying questions.",
        body: "Photography, specs, delivery notes, reviews, and checkout actions stay close together.",
        metricLabel: "Buy confidence",
        metric: "92%",
        progress: "86%",
        screenEyebrow: "Product detail",
        screenTitle: "Information close to the add-to-cart moment.",
        screenBody: "Variant choices, proof, and delivery clarity support the buying decision.",
        actionTitle: "Variant choice",
        actionBody: "The preview can switch variants, update price, or surface stock state.",
        interaction: "Variant selected. Price, stock, and CTA state update together.",
        button: "Select variant",
        buttonAfter: "Variant set"
      },
      cart: {
        eyebrow: "Ecommerce",
        title: "The cart keeps checkout calm.",
        body: "A strong cart experience summarizes value, totals, delivery, and the next step.",
        metricLabel: "Checkout path",
        metric: "Ready",
        progress: "90%",
        screenEyebrow: "Cart",
        screenTitle: "A clear summary before checkout.",
        screenBody: "Customers see items, totals, delivery expectations, and support options.",
        actionTitle: "Cart action",
        actionBody: "Adding a product updates the cart state immediately with a clear next step.",
        interaction: "Added to cart. The cart summary now shows one ready-to-checkout item.",
        button: "Add item",
        buttonAfter: "Item added"
      },
      dashboard: {
        eyebrow: "Custom solution",
        title: "A dashboard turns operations into a clear system.",
        body: "Custom Rails builds can organize work, requests, clients, and metrics in one place.",
        metricLabel: "Operational clarity",
        metric: "Live",
        progress: "80%",
        screenEyebrow: "Dashboard",
        screenTitle: "Everything important in one view.",
        screenBody: "Status, owners, priority, and next actions are visible without digging.",
        actionTitle: "Task action",
        actionBody: "A custom interface can move records through real business states.",
        interaction: "Task advanced. The workflow state and metric both updated.",
        button: "Advance task",
        buttonAfter: "Advanced"
      },
      workflow: {
        eyebrow: "Custom solution",
        title: "Workflows match how the business already runs.",
        body: "The product can encode approvals, requests, handoffs, and notifications without unnecessary ceremony.",
        metricLabel: "Automation",
        metric: "3 steps",
        progress: "72%",
        screenEyebrow: "Workflow",
        screenTitle: "A request moving through clear states.",
        screenBody: "Intake, review, approval, and completion can all be modeled in Rails.",
        actionTitle: "Approval action",
        actionBody: "The interaction simulates a real workflow decision.",
        interaction: "Approved. The preview moves the request into the next state.",
        button: "Approve",
        buttonAfter: "Approved"
      },
      report: {
        eyebrow: "Custom solution",
        title: "Reports make the system useful after launch.",
        body: "Dashboards and exports keep owners close to the numbers they need.",
        metricLabel: "Insight",
        metric: "Clear",
        progress: "84%",
        screenEyebrow: "Reporting",
        screenTitle: "Decision-ready numbers.",
        screenBody: "Trends, totals, and exceptions are readable without spreadsheet cleanup.",
        actionTitle: "Report action",
        actionBody: "A report can filter, export, or drill into the right operational detail.",
        interaction: "Report filtered. The view now focuses on the highest-priority records.",
        button: "Filter report",
        buttonAfter: "Filtered"
      },
      plan: {
        eyebrow: "CPT system",
        title: "Strategy, design, and delivery stay connected.",
        body: "This dashboard preview shows how CPT keeps each project clear from first call to launch.",
        metricLabel: "Project clarity",
        metric: "High",
        progress: "78%",
        screenEyebrow: "Project plan",
        screenTitle: "A calm path from idea to launch.",
        screenBody: "Discovery, design, build, and launch steps are visible from the beginning.",
        actionTitle: "Planning action",
        actionBody: "The preview can move from strategy to design without losing the business goal.",
        interaction: "Plan advanced. The next delivery milestone is now highlighted.",
        button: "Advance plan",
        buttonAfter: "Plan advanced"
      },
      design: {
        eyebrow: "CPT system",
        title: "Reusable design decisions build momentum.",
        body: "Components, colors, and page patterns are created in context and reused only when useful.",
        metricLabel: "Design reuse",
        metric: "Smart",
        progress: "70%",
        screenEyebrow: "Design system",
        screenTitle: "Components that serve real pages.",
        screenBody: "Cards, sections, buttons, forms, and mockups become reusable through actual use.",
        actionTitle: "Design action",
        actionBody: "The interaction highlights a reusable module in the preview.",
        interaction: "Module highlighted. The design system now has one more proven component.",
        button: "Highlight",
        buttonAfter: "Highlighted"
      },
      launch: {
        eyebrow: "CPT system",
        title: "Launch readiness is visible before launch day.",
        body: "Performance, accessibility, content, and admin workflows get checked before handoff.",
        metricLabel: "Readiness",
        metric: "92%",
        progress: "92%",
        screenEyebrow: "Launch",
        screenTitle: "Quality checks before the site goes live.",
        screenBody: "Responsive QA, content review, analytics, and deployment prep finish the project.",
        actionTitle: "Launch action",
        actionBody: "The preview marks launch tasks complete as each check passes.",
        interaction: "Checklist updated. The build is closer to launch-ready.",
        button: "Run check",
        buttonAfter: "Checked"
      }
    }
  }
}
