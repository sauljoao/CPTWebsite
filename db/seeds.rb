# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
products = [
  {
    name: "Landing Page",
    description: "A focused, premium one-page experience for launches, campaigns, and validated offers.",
    base_price_cents: 150_000,
    features: [ "Strategy session", "Conversion-focused copy structure", "Responsive design", "Rails implementation", "Analytics setup", "Launch checklist" ],
    position: 1
  },
  {
    name: "Website",
    description: "A complete company website with reusable page patterns, clear navigation, and room to grow.",
    base_price_cents: 350_000,
    features: [ "Discovery and sitemap", "Up to 6 core pages", "Reusable design components", "Contact and quote forms", "SEO foundations", "Performance and accessibility QA" ],
    position: 2
  },
  {
    name: "Ecommerce Website",
    description: "A polished online store experience for businesses that need product clarity and a trustworthy checkout path.",
    base_price_cents: 650_000,
    features: [ "Product catalog structure", "Storefront design", "Checkout integration planning", "Transactional email basics", "Inventory-ready admin structure", "Launch support" ],
    position: 3
  },
  {
    name: "Custom Solution",
    description: "A tailored Rails build for workflows, portals, dashboards, and business-specific digital products.",
    base_price_cents: 10_000_00,
    features: [ "Product discovery", "Technical planning", "Custom Rails application", "Admin workflows", "Integrations", "Roadmap and support plan" ],
    position: 4
  }
]

products.each do |attributes|
  Product.find_or_initialize_by(name: attributes[:name]).tap do |product|
    product.assign_attributes(attributes.merge(cta_label: "Request a quote", published: true))
    product.save!
  end
end

projects = [
  {
    title: "PulseFit Challenge Launch",
    product_type: "Landing Page",
    industry: "Fitness",
    summary: "A high-energy campaign page for a 30-day coaching program with one clear signup path.",
    outcome: "Focused messaging, sharper proof, and a fast lead capture flow for paid traffic.",
    services: [ "Landing page strategy", "Campaign structure", "Lead capture" ],
    featured: true,
    position: 1
  },
  {
    title: "NovaTax Consultation Page",
    product_type: "Landing Page",
    industry: "Finance",
    summary: "A conversion-focused page for a seasonal tax consultation offer aimed at founders.",
    outcome: "Reduced friction, clearer urgency, and a compact trust section near the booking action.",
    services: [ "Offer positioning", "CTA design", "Analytics setup" ],
    featured: true,
    position: 2
  },
  {
    title: "Luma Course Waitlist",
    product_type: "Landing Page",
    industry: "Education",
    summary: "A waitlist page for a premium cohort course with proof, curriculum, and early access signup.",
    outcome: "A polished campaign surface that can validate demand before building the full platform.",
    services: [ "Waitlist flow", "Copy structure", "Responsive build" ],
    featured: true,
    position: 3
  },
  {
    title: "Atlas Advisory Website",
    product_type: "Website",
    industry: "Professional Services",
    summary: "A crisp company website for a consulting firm moving from referrals to a scalable inbound presence.",
    outcome: "Clearer positioning, stronger inquiry flow, and reusable page patterns for future services.",
    services: [ "Website strategy", "Visual system", "Rails build" ],
    featured: true,
    position: 4
  },
  {
    title: "Harbor Dental Studio",
    product_type: "Website",
    industry: "Healthcare",
    summary: "A calm, premium practice website with service pages, patient FAQs, and appointment routing.",
    outcome: "More confident first impressions and a clearer path from treatment research to booking.",
    services: [ "Service architecture", "Trust sections", "Contact flow" ],
    featured: false,
    position: 5
  },
  {
    title: "Fieldstone Architecture",
    product_type: "Website",
    industry: "Architecture",
    summary: "A portfolio-led studio website balancing project imagery, process, and inquiry conversion.",
    outcome: "A refined editorial structure that makes high-value work easier to browse and request.",
    services: [ "Portfolio system", "About page", "Inquiry design" ],
    featured: false,
    position: 6
  },
  {
    title: "Northline Commerce Refresh",
    product_type: "Ecommerce Website",
    industry: "Retail",
    summary: "A modern ecommerce concept focused on product trust, editorial merchandising, and mobile conversion.",
    outcome: "A storefront structure ready for real catalog migration and checkout integration.",
    services: [ "Ecommerce UX", "Product architecture", "Responsive storefront" ],
    featured: true,
    position: 7
  },
  {
    title: "Sol Pantry Market",
    product_type: "Ecommerce Website",
    industry: "Food",
    summary: "A warm online store for pantry products with category browsing, product detail, and cart clarity.",
    outcome: "Easier product discovery and a calmer path from browsing to checkout intent.",
    services: [ "Storefront design", "Catalog structure", "Cart experience" ],
    featured: false,
    position: 8
  },
  {
    title: "Aster Home Goods",
    product_type: "Ecommerce Website",
    industry: "Home Decor",
    summary: "A premium home goods storefront with collection storytelling and comparison-friendly product cards.",
    outcome: "A richer shopping experience that still keeps product choice and checkout momentum simple.",
    services: [ "Collection pages", "Product cards", "Checkout planning" ],
    featured: false,
    position: 9
  },
  {
    title: "SignalOps Portal",
    product_type: "Custom Solution",
    industry: "Operations",
    summary: "A dashboard-style prototype for internal requests, project tracking, and client communication.",
    outcome: "A practical foundation for a custom Rails workflow application.",
    services: [ "Workflow design", "Admin interface", "Application prototype" ],
    featured: true,
    position: 10
  },
  {
    title: "Relay Client Hub",
    product_type: "Custom Solution",
    industry: "Agency",
    summary: "A client portal concept for approvals, project assets, status updates, and meeting notes.",
    outcome: "A single operational workspace that reduces scattered communication and manual follow-up.",
    services: [ "Portal UX", "Approval workflow", "Admin dashboard" ],
    featured: false,
    position: 11
  },
  {
    title: "Motive Inventory Desk",
    product_type: "Custom Solution",
    industry: "Logistics",
    summary: "A lightweight internal system for inventory checks, exceptions, and weekly operations reporting.",
    outcome: "A clearer workflow for teams that need custom software without enterprise complexity.",
    services: [ "Custom Rails app", "Reporting", "Role-aware workflows" ],
    featured: false,
    position: 12
  }
]

projects.each do |attributes|
  PortfolioProject.find_or_initialize_by(title: attributes[:title]).tap do |project|
    project.assign_attributes(attributes.merge(published: true))
    project.save!
  end
end

faqs = [
  [ "General", "How long does a website project take?", "A focused landing page can launch in 1 to 2 weeks. A full website usually takes 3 to 6 weeks depending on content, feedback, and integrations." ],
  [ "Pricing", "Are the prices fixed?", "The listed prices are transparent starting points. Final pricing depends on scope, content, integrations, and timeline." ],
  [ "Process", "Do you help with content?", "Yes. Every project includes content structure. Copywriting can be added when you want CPT to draft or refine the final copy." ],
  [ "Ownership", "Who owns the website after launch?", "You own the website, content, and account access. CPT can continue supporting the system if you want an ongoing partner." ],
  [ "Technology", "Why Rails?", "Rails keeps the site fast, maintainable, and ready to grow into admin workflows, portals, ecommerce, or custom product features." ]
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
