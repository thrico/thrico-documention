import Link from "next/link";
import {
  Building2,
  Users,
  UserPlus,
  MessageSquare,
  Calendar,
  ShoppingBag,
  Shield,
  Code2,
  BarChart3,
  Sparkles,
  Heart,
  Trophy,
  Briefcase,
  Bell,
  Smartphone,
  ArrowRight,
  Search,
  BookOpen,
  Rocket,
  Zap,
} from "lucide-react";

const categories = [
  {
    title: "Getting Started",
    description: "Introduction, architecture, roles, and quick start guides.",
    icon: Rocket,
    href: "/docs/getting-started",
    color: "from-violet-500 to-purple-600",
  },
  {
    title: "Entity Management",
    description: "Register, configure, and manage your organizations.",
    icon: Building2,
    href: "/docs/entity",
    color: "from-blue-500 to-indigo-600",
  },
  {
    title: "Community",
    description: "Create communities, manage settings, roles, and moderators.",
    icon: Users,
    href: "/docs/community",
    color: "from-emerald-500 to-teal-600",
  },
  {
    title: "Members",
    description: "Invite, import, approve, and manage members.",
    icon: UserPlus,
    href: "/docs/members",
    color: "from-orange-500 to-amber-600",
  },
  {
    title: "Feed & Content",
    description: "Posts, stories, reactions, comments, and moderation.",
    icon: MessageSquare,
    href: "/docs/feed",
    color: "from-pink-500 to-rose-600",
  },
  {
    title: "Events",
    description: "Online and offline events, RSVP, and attendance.",
    icon: Calendar,
    href: "/docs/events",
    color: "from-cyan-500 to-sky-600",
  },
  {
    title: "Marketplace",
    description: "Products, categories, orders, and payments.",
    icon: ShoppingBag,
    href: "/docs/marketplace",
    color: "from-lime-500 to-green-600",
  },
  {
    title: "Security",
    description: "Authentication, SSO, audit logs, and password policies.",
    icon: Shield,
    href: "/docs/security",
    color: "from-red-500 to-rose-600",
  },
  {
    title: "API Reference",
    description: "GraphQL, REST, webhooks, SDK, and rate limits.",
    icon: Code2,
    href: "/docs/api",
    color: "from-fuchsia-500 to-purple-600",
  },
  {
    title: "Analytics",
    description: "Dashboards, reports, engagement, and retention.",
    icon: BarChart3,
    href: "/docs/analytics",
    color: "from-amber-500 to-yellow-600",
  },
  {
    title: "AI Assistant",
    description: "AI-powered search, moderation, and automation.",
    icon: Sparkles,
    href: "/docs/ai",
    color: "from-violet-500 to-indigo-600",
  },
  {
    title: "Gamification",
    description: "Points, badges, ranks, rewards, and leaderboards.",
    icon: Trophy,
    href: "/docs/gamification",
    color: "from-yellow-500 to-orange-600",
  },
];

const quickLinks = [
  {
    title: "Register Entity",
    href: "/docs/entity/register-entity",
    icon: Building2,
  },
  {
    title: "Create Community",
    href: "/docs/community/create-community",
    icon: Users,
  },
  {
    title: "Invite Members",
    href: "/docs/members/invite-members",
    icon: UserPlus,
  },
  {
    title: "Configure Branding",
    href: "/docs/entity/branding",
    icon: Sparkles,
  },
  { title: "Connect Domain", href: "/docs/entity/domains", icon: Zap },
  { title: "API Reference", href: "/docs/api", icon: Code2 },
];

const popularGuides = [
  {
    title: "Quick Start Guide",
    description: "Get up and running with Thrico in minutes.",
    href: "/docs/getting-started/quick-start",
    icon: Rocket,
  },
  {
    title: "Platform Architecture",
    description: "Understand how Thrico is built and how services connect.",
    href: "/docs/getting-started/architecture",
    icon: BookOpen,
  },
  {
    title: "User Roles & Permissions",
    description: "Learn about the different roles and what each can do.",
    href: "/docs/getting-started/user-roles",
    icon: Shield,
  },
  {
    title: "GraphQL API",
    description: "Integrate with Thrico using our GraphQL API.",
    href: "/docs/api/graphql",
    icon: Code2,
  },
];

export default function HomePage() {
  return (
    <main className="relative overflow-hidden">
      {/* Hero Section */}
      <section className="relative min-h-[85vh] flex items-center justify-center px-4 pt-16 pb-24">
        {/* Background effects */}
        <div className="absolute inset-0 grid-pattern" />
        <div className="absolute top-0 left-1/2 -translate-x-1/2 w-[800px] h-[600px] rounded-full bg-gradient-to-b from-brand-500/10 via-brand-400/5 to-transparent blur-3xl" />
        <div className="absolute bottom-0 right-0 w-[400px] h-[400px] rounded-full bg-gradient-to-t from-blue-500/5 to-transparent blur-3xl" />

        <div className="relative z-10 max-w-4xl mx-auto text-center">
          <div className="inline-flex items-center gap-2 px-4 py-1.5 mb-8 text-sm font-medium rounded-full border border-brand-200 bg-brand-50/50 text-brand-700 dark:border-brand-800 dark:bg-brand-950/50 dark:text-brand-300 animate-fade-in">
            <Sparkles className="size-3.5" />
            Welcome to Thrico Documentation
          </div>

          <h1 className="text-5xl sm:text-6xl lg:text-7xl font-extrabold tracking-tight mb-6 animate-slide-up bg-gradient-to-b from-fd-foreground to-fd-muted-foreground bg-clip-text text-transparent">
            Create & Run Your Own
            <br />
            <span className="bg-gradient-to-r from-brand-500 via-brand-400 to-blue-500 bg-clip-text text-transparent">
              Thriving Communities
            </span>
          </h1>

          <p
            className="text-lg sm:text-xl text-fd-muted-foreground max-w-2xl mx-auto mb-10 animate-slide-up"
            style={{ animationDelay: "0.1s" }}
          >
            Everything you need to configure, manage, and scale your community
            platform. Guides for admins, developers, and teams.
          </p>

          {/* Search Bar */}
          <div
            className="max-w-xl mx-auto mb-8 animate-slide-up"
            style={{ animationDelay: "0.2s" }}
          >
            <Link
              href="/docs"
              className="group flex items-center gap-3 px-5 py-4 rounded-2xl border border-fd-border bg-fd-card/80 backdrop-blur-sm shadow-sm hover:border-brand-400/50 hover:shadow-lg hover:shadow-brand-500/5 transition-all duration-300"
            >
              <Search className="size-5 text-fd-muted-foreground group-hover:text-brand-500 transition-colors" />
              <span className="text-fd-muted-foreground text-[15px]">
                Search documentation...
              </span>
              <kbd className="ml-auto hidden sm:inline-flex items-center gap-1 px-2 py-0.5 rounded-md bg-fd-muted text-fd-muted-foreground text-xs font-mono">
                ⌘K
              </kbd>
            </Link>
          </div>

          {/* CTA buttons */}
          <div
            className="flex flex-wrap items-center justify-center gap-4 animate-slide-up"
            style={{ animationDelay: "0.3s" }}
          >
            <Link
              href="/docs/getting-started"
              className="inline-flex items-center gap-2 px-6 py-3 rounded-xl bg-gradient-to-r from-brand-600 to-brand-500 text-white font-medium shadow-lg shadow-brand-500/25 hover:shadow-brand-500/40 hover:scale-[1.02] transition-all duration-200"
            >
              Get Started
              <ArrowRight className="size-4" />
            </Link>
            <Link
              href="/docs/api"
              className="inline-flex items-center gap-2 px-6 py-3 rounded-xl border border-fd-border bg-fd-card/50 text-fd-foreground font-medium hover:bg-fd-muted/50 hover:border-brand-300 dark:hover:border-brand-700 transition-all duration-200"
            >
              <Code2 className="size-4" />
              API Reference
            </Link>
          </div>
        </div>
      </section>

      {/* Category Cards */}
      <section className="relative px-4 py-20 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto">
          <div className="text-center mb-14">
            <h2 className="text-3xl sm:text-4xl font-bold tracking-tight text-fd-foreground mb-4">
              Browse by Category
            </h2>
            <p className="text-fd-muted-foreground text-lg max-w-2xl mx-auto">
              Find guides organized by feature. Each section covers
              configuration, usage, and best practices.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-4 stagger-children">
            {categories.map((cat) => {
              const Icon = cat.icon;
              return (
                <Link
                  key={cat.title}
                  href={cat.href}
                  className="group glass-card glow rounded-2xl p-5 flex flex-col gap-3"
                >
                  <div
                    className={`inline-flex items-center justify-center w-10 h-10 rounded-xl bg-gradient-to-br ${cat.color} text-white shadow-sm`}
                  >
                    <Icon className="size-5" />
                  </div>
                  <h3 className="font-semibold text-fd-foreground group-hover:text-brand-600 dark:group-hover:text-brand-400 transition-colors">
                    {cat.title}
                  </h3>
                  <p className="text-sm text-fd-muted-foreground leading-relaxed">
                    {cat.description}
                  </p>
                  <div className="mt-auto pt-2 flex items-center gap-1 text-sm font-medium text-brand-600 dark:text-brand-400 opacity-0 group-hover:opacity-100 transition-opacity">
                    Explore
                    <ArrowRight className="size-3.5" />
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* Quick Links */}
      <section className="relative px-4 py-20 sm:px-6 lg:px-8 border-t border-fd-border">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold tracking-tight text-fd-foreground mb-4">
              Quick Links
            </h2>
            <p className="text-fd-muted-foreground text-lg">
              Jump straight to the most common tasks.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-3 stagger-children">
            {quickLinks.map((link) => {
              const Icon = link.icon;
              return (
                <Link
                  key={link.title}
                  href={link.href}
                  className="group flex items-center gap-3 px-5 py-4 rounded-xl border border-fd-border bg-fd-card/50 hover:bg-fd-muted/50 hover:border-brand-300 dark:hover:border-brand-700 transition-all duration-200"
                >
                  <Icon className="size-5 text-fd-muted-foreground group-hover:text-brand-500 transition-colors shrink-0" />
                  <span className="font-medium text-fd-foreground text-[15px]">
                    {link.title}
                  </span>
                  <ArrowRight className="size-4 ml-auto text-fd-muted-foreground group-hover:text-brand-500 group-hover:translate-x-0.5 transition-all" />
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* Popular Guides */}
      <section className="relative px-4 py-20 sm:px-6 lg:px-8 border-t border-fd-border">
        <div className="max-w-5xl mx-auto">
          <div className="text-center mb-12">
            <h2 className="text-3xl font-bold tracking-tight text-fd-foreground mb-4">
              Popular Guides
            </h2>
            <p className="text-fd-muted-foreground text-lg">
              Start here for the most essential documentation.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 stagger-children">
            {popularGuides.map((guide) => {
              const Icon = guide.icon;
              return (
                <Link
                  key={guide.title}
                  href={guide.href}
                  className="group glass-card rounded-2xl p-6 flex items-start gap-4"
                >
                  <div className="flex items-center justify-center w-11 h-11 rounded-xl bg-brand-50 dark:bg-brand-950/50 text-brand-600 dark:text-brand-400 shrink-0">
                    <Icon className="size-5" />
                  </div>
                  <div className="min-w-0">
                    <h3 className="font-semibold text-fd-foreground mb-1 group-hover:text-brand-600 dark:group-hover:text-brand-400 transition-colors">
                      {guide.title}
                    </h3>
                    <p className="text-sm text-fd-muted-foreground leading-relaxed">
                      {guide.description}
                    </p>
                  </div>
                </Link>
              );
            })}
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-fd-border px-4 py-12 sm:px-6 lg:px-8">
        <div className="max-w-7xl mx-auto flex flex-col sm:flex-row items-center justify-between gap-4">
          <div className="flex items-center gap-2.5">
            <div className="flex h-7 w-7 items-center justify-center rounded-lg bg-gradient-to-br from-brand-500 to-brand-700 text-white text-sm font-bold">
              T
            </div>
            <span className="font-semibold text-sm text-fd-foreground">
              Thrico Documentation
            </span>
          </div>
          <p className="text-sm text-fd-muted-foreground">
            © {new Date().getFullYear()} Thrico. All rights reserved.
          </p>
        </div>
      </footer>
    </main>
  );
}
