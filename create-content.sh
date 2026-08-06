#!/bin/bash
# Script to create all content directories, meta.json files, and MDX content

BASE="/Users/pulseplay/thrico/thrico-documentation/content/docs"

# ============================================
# GETTING STARTED
# ============================================
mkdir -p "$BASE/getting-started"

cat > "$BASE/getting-started/meta.json" << 'ENDJSON'
{
  "title": "Getting Started",
  "pages": ["index", "architecture", "user-roles", "dashboard-overview", "quick-start"]
}
ENDJSON

cat > "$BASE/getting-started/index.mdx" << 'ENDMDX'
---
title: Introduction to Thrico
description: Learn about the Thrico platform and what you can build with it.
---

## What is Thrico?

Thrico is a comprehensive community management platform that enables organizations to build, manage, and scale their communities. Whether you're running an alumni network, a professional association, a member organization, or an enterprise community — Thrico provides all the tools you need.

## Key Capabilities

- **Entity Management** — Create and manage organizations with custom branding, domains, and configurations
- **Community Building** — Launch communities with feeds, groups, events, and member engagement tools
- **Member Management** — Invite, import, approve, and manage members at scale
- **Content & Engagement** — Posts, stories, reactions, comments, and content moderation
- **Marketplace** — Built-in marketplace for products, services, and digital goods
- **Events** — Host online and offline events with RSVP and attendance tracking
- **Gamification** — Points, badges, ranks, and leaderboards to drive engagement
- **AI-Powered** — AI assistant, smart search, automated moderation, and more
- **Analytics** — Comprehensive dashboards for member growth, engagement, and retention
- **API & Integrations** — GraphQL and REST APIs, webhooks, and SDKs

## Who is Thrico For?

| Role | What They Do |
|------|-------------|
| **Super Admin** | Manages the entire Thrico platform |
| **Entity Admin** | Manages a specific organization |
| **Community Admin** | Operates a community within an entity |
| **Moderator** | Moderates content and members |
| **Member** | Participates in communities |
| **Developer** | Integrates via APIs and SDKs |

## Next Steps

<Cards>
  <Card title="Platform Architecture" href="/docs/getting-started/architecture" />
  <Card title="User Roles" href="/docs/getting-started/user-roles" />
  <Card title="Quick Start" href="/docs/getting-started/quick-start" />
</Cards>
ENDMDX

cat > "$BASE/getting-started/architecture.mdx" << 'ENDMDX'
---
title: Platform Architecture
description: Understand the technical architecture of the Thrico platform.
---

## Overview

Thrico is built on a modern, scalable microservices architecture designed for high availability and performance.

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────┐
│                     Client Layer                         │
│  ┌──────────┐  ┌──────────────┐  ┌──────────────────┐  │
│  │ Web App  │  │ Mobile Apps  │  │ Entity Dashboard │  │
│  └────┬─────┘  └──────┬───────┘  └────────┬─────────┘  │
└───────┼───────────────┼───────────────────┼─────────────┘
        │               │                   │
┌───────▼───────────────▼───────────────────▼─────────────┐
│                    API Gateway                           │
│              (GraphQL + REST)                            │
└───────┬───────────────┬───────────────────┬─────────────┘
        │               │                   │
┌───────▼───────┐ ┌─────▼──────┐  ┌────────▼─────────┐
│   Auth Service│ │ Core API   │  │ Notification     │
│               │ │            │  │ Service          │
└───────────────┘ └────────────┘  └──────────────────┘
```

## Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | Next.js, React |
| API | GraphQL (Apollo), REST |
| Backend | Node.js, TypeScript |
| Database | PostgreSQL |
| Cache | Redis |
| Search | Elasticsearch |
| Storage | AWS S3 |
| CDN | CloudFront |
| Infrastructure | AWS ECS, Docker |

## Key Design Principles

1. **Microservices** — Each service handles a specific domain (auth, content, notifications, etc.)
2. **Event-Driven** — Services communicate via events for loose coupling
3. **Multi-Tenant** — Single deployment serves multiple entities securely
4. **API-First** — Every feature is accessible via API
5. **Scalable** — Horizontally scalable services behind load balancers
ENDMDX

cat > "$BASE/getting-started/user-roles.mdx" << 'ENDMDX'
---
title: User Roles & Permissions
description: Learn about the different user roles in Thrico and their permissions.
---

## Role Hierarchy

Thrico uses a hierarchical role system where each role inherits permissions from the roles below it.

```
Super Admin
    └── Entity Admin
            └── Community Admin
                    └── Moderator
                            └── Member
```

## Role Details

### Super Admin

The **Super Admin** has full control over the entire Thrico platform.

- Manage all entities
- Configure platform settings
- Access all analytics
- Manage billing and subscriptions
- Create and delete entities

### Entity Admin

The **Entity Admin** manages a specific organization within Thrico.

- Configure entity branding and settings
- Manage communities within the entity
- Invite and manage members
- Configure custom domains
- View entity analytics

### Community Admin

The **Community Admin** operates a specific community.

- Configure community settings
- Manage community content
- Assign moderator roles
- View community analytics
- Manage events and groups

### Moderator

**Moderators** help manage content and members within a community.

- Approve or reject posts
- Manage reported content
- Mute or warn members
- Manage event RSVPs

### Member

**Members** are regular users who participate in communities.

- Create posts and stories
- Join groups and events
- Use the marketplace
- Participate in discussions

## Permission Matrix

| Permission | Super Admin | Entity Admin | Community Admin | Moderator | Member |
|-----------|:-----------:|:------------:|:--------------:|:---------:|:------:|
| Manage Entities | ✅ | ❌ | ❌ | ❌ | ❌ |
| Manage Communities | ✅ | ✅ | ❌ | ❌ | ❌ |
| Community Settings | ✅ | ✅ | ✅ | ❌ | ❌ |
| Moderate Content | ✅ | ✅ | ✅ | ✅ | ❌ |
| Create Posts | ✅ | ✅ | ✅ | ✅ | ✅ |
| View Analytics | ✅ | ✅ | ✅ | ❌ | ❌ |
ENDMDX

cat > "$BASE/getting-started/dashboard-overview.mdx" << 'ENDMDX'
---
title: Dashboard Overview
description: Navigate the Thrico dashboard and understand its key sections.
---

## Dashboard Layout

The Thrico dashboard is organized into several key areas:

### Navigation Sidebar

The left sidebar provides quick access to all major sections:

- **Home** — Dashboard overview with key metrics
- **Entity** — Entity management and configuration
- **Community** — Community settings and management
- **Members** — Member management and invitations
- **Feed** — Content and post management
- **Groups** — Group management
- **Events** — Event management
- **Marketplace** — Product and order management
- **Analytics** — Reports and metrics
- **Settings** — Platform configuration

### Top Bar

The top bar includes:

- **Search** — Global search across all content
- **Notifications** — Real-time notification center
- **Profile** — Account settings and preferences

### Main Content Area

The central area displays the content for the currently selected section, with contextual actions and filters.

## Key Metrics

The dashboard home page displays:

- Total Members
- Active Members (last 30 days)
- New Members (this month)
- Total Posts
- Engagement Rate
- Revenue (if marketplace/billing enabled)

<Callout type="info">
  The dashboard adapts based on your role. Entity Admins see entity-level metrics,
  while Community Admins see community-specific data.
</Callout>
ENDMDX

cat > "$BASE/getting-started/quick-start.mdx" << 'ENDMDX'
---
title: Quick Start Guide
description: Get up and running with Thrico in under 10 minutes.
---

## Prerequisites

Before you begin, ensure you have:

- A Thrico account with **Entity Admin** or higher role
- Access to the Thrico dashboard

## Step 1: Register Your Entity

Navigate to **Entity → Create Entity** in the dashboard.

1. Enter your organization name
2. Upload your logo
3. Choose your primary color scheme
4. Click **Create Entity**

<Callout type="info">
  An entity represents your organization on Thrico. It's the top-level container for all your communities.
</Callout>

## Step 2: Configure Branding

Go to **Entity → Branding** to customize:

- Logo and favicon
- Primary and secondary colors
- Font preferences
- Email template branding

## Step 3: Create Your First Community

Navigate to **Community → Create Community**:

1. Enter community name and description
2. Choose privacy settings (Public / Private / Secret)
3. Select available features (Feed, Groups, Events, etc.)
4. Click **Create Community**

## Step 4: Invite Members

Go to **Members → Invite Members**:

1. Enter email addresses (one per line, or upload CSV)
2. Select the community to invite to
3. Choose the member role
4. Click **Send Invitations**

## Step 5: Customize Settings

Fine-tune your setup:

- **Notifications** — Configure email and push notification preferences
- **Permissions** — Set up role-based access control
- **Integrations** — Connect third-party services

## What's Next?

<Cards>
  <Card title="Entity Management" href="/docs/entity" />
  <Card title="Community Management" href="/docs/community" />
  <Card title="Member Management" href="/docs/members" />
  <Card title="API Reference" href="/docs/api" />
</Cards>
ENDMDX

echo "✅ Getting Started section created"

# ============================================
# ENTITY MANAGEMENT
# ============================================
mkdir -p "$BASE/entity"

cat > "$BASE/entity/meta.json" << 'ENDJSON'
{
  "title": "Entity Management",
  "pages": ["index", "register-entity", "edit-entity", "delete-entity", "branding", "domains", "packages", "billing"]
}
ENDJSON

cat > "$BASE/entity/index.mdx" << 'ENDMDX'
---
title: Entity Management
description: Learn how to create, configure, and manage entities on the Thrico platform.
---

## What is an Entity?

An **Entity** in Thrico represents an organization, institution, or business that uses the platform. Entities are the top-level organizational unit and contain communities, members, and all associated data.

## Key Features

- **Registration** — Create new entities with custom configurations
- **Branding** — Customize logo, colors, and visual identity
- **Custom Domains** — Connect your own domain to your entity
- **Packages** — Assign feature packages and plans
- **Billing** — Manage subscriptions and payments

## Entity Lifecycle

```
Register → Configure → Brand → Launch → Manage → Scale
```

<Cards>
  <Card title="Register Entity" href="/docs/entity/register-entity" />
  <Card title="Branding" href="/docs/entity/branding" />
  <Card title="Custom Domains" href="/docs/entity/domains" />
  <Card title="Billing" href="/docs/entity/billing" />
</Cards>
ENDMDX

for page in register-entity edit-entity delete-entity branding domains packages billing; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/entity/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn how to ${page//-/ } on the Thrico platform."
---

## Overview

This guide covers how to **${page//-/ }** in Thrico.

## Prerequisites

- **Entity Admin** or **Super Admin** role
- Access to the Thrico dashboard

## Navigation

\`\`\`
Dashboard → Entity → ${title}
\`\`\`

## Step-by-Step Instructions

### Step 1: Access the Entity Section

Navigate to the **Entity** section from the sidebar menu.

### Step 2: Follow the Prompts

Complete the required fields and configuration options.

### Step 3: Save Changes

Review your changes and click **Save** to apply.

## Result

Your changes will be applied immediately and reflected across the platform.

## Troubleshooting

<Callout type="warn">
  If you encounter issues, check that you have the required permissions and that all required fields are completed.
</Callout>

## Related Articles

- [Entity Management Overview](/docs/entity)
- [Quick Start Guide](/docs/getting-started/quick-start)
ENDMDX
done

echo "✅ Entity Management section created"

# ============================================
# COMMUNITY MANAGEMENT
# ============================================
mkdir -p "$BASE/community"

cat > "$BASE/community/meta.json" << 'ENDJSON'
{
  "title": "Community Management",
  "pages": ["index", "create-community", "settings", "branding", "moderators", "roles", "permissions"]
}
ENDJSON

cat > "$BASE/community/index.mdx" << 'ENDMDX'
---
title: Community Management
description: Create and manage communities on the Thrico platform.
---

## What is a Community?

A **Community** is a space within an entity where members interact, share content, participate in events, and engage with each other.

## Key Features

- **Create Communities** — Launch new communities with custom settings
- **Branding** — Customize the look and feel of each community
- **Roles & Permissions** — Fine-grained access control
- **Moderators** — Assign moderators to manage content
- **Settings** — Configure features, privacy, and notifications

<Cards>
  <Card title="Create Community" href="/docs/community/create-community" />
  <Card title="Community Settings" href="/docs/community/settings" />
  <Card title="Roles & Permissions" href="/docs/community/roles" />
</Cards>
ENDMDX

for page in create-community settings branding moderators roles permissions; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/community/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn how to manage ${page//-/ } for communities on Thrico."
---

## Overview

This guide covers **${page//-/ }** management for Thrico communities.

## Prerequisites

- **Community Admin** or higher role
- An existing entity with at least one community

## Navigation

\`\`\`
Dashboard → Community → ${title}
\`\`\`

## Instructions

### Step 1: Navigate to Community Settings

Open the **Community** section from the sidebar.

### Step 2: Configure ${title}

Follow the on-screen prompts to configure your settings.

### Step 3: Save

Click **Save** to apply your changes.

## Related Articles

- [Community Management Overview](/docs/community)
- [Getting Started](/docs/getting-started)
ENDMDX
done

echo "✅ Community Management section created"

# ============================================
# MEMBERS
# ============================================
mkdir -p "$BASE/members"

cat > "$BASE/members/meta.json" << 'ENDJSON'
{
  "title": "Members",
  "pages": ["index", "invite-members", "import-members", "member-approval", "member-management"]
}
ENDJSON

cat > "$BASE/members/index.mdx" << 'ENDMDX'
---
title: Member Management
description: Invite, import, approve, and manage members on the Thrico platform.
---

## Overview

Member management is at the core of every Thrico community. This section covers everything you need to know about managing your members.

## Key Features

- **Invite Members** — Send email invitations to individuals or groups
- **Import Members** — Bulk import members via CSV
- **Approval Workflows** — Review and approve member requests
- **Member Management** — View, edit, and manage member profiles

<Cards>
  <Card title="Invite Members" href="/docs/members/invite-members" />
  <Card title="Import Members" href="/docs/members/import-members" />
  <Card title="Member Approval" href="/docs/members/member-approval" />
  <Card title="Member Management" href="/docs/members/member-management" />
</Cards>
ENDMDX

for page in invite-members import-members member-approval member-management; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/members/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn how to ${page//-/ } on the Thrico platform."
---

## Overview

This guide walks you through how to **${page//-/ }** in Thrico.

## Prerequisites

- **Entity Admin** or **Community Admin** role
- At least one active community

## Navigation

\`\`\`
Dashboard → Members → ${title}
\`\`\`

## Step-by-Step Instructions

### Step 1: Navigate to Members

Open the **Members** section from the sidebar.

### Step 2: Follow the Workflow

Complete the required steps for ${page//-/ }.

### Step 3: Confirm

Review and confirm your actions.

## Related Articles

- [Member Management Overview](/docs/members)
- [Community Management](/docs/community)
ENDMDX
done

echo "✅ Members section created"

# ============================================
# FEED
# ============================================
mkdir -p "$BASE/feed"

cat > "$BASE/feed/meta.json" << 'ENDJSON'
{
  "title": "Feed",
  "pages": ["index", "posts", "stories", "reactions", "comments", "moderation"]
}
ENDJSON

cat > "$BASE/feed/index.mdx" << 'ENDMDX'
---
title: Feed
description: Manage posts, stories, reactions, and content moderation in the Thrico feed.
---

## Overview

The **Feed** is the central content hub of every Thrico community. Members can create posts, share stories, react to content, and engage in discussions.

## Features

- **Posts** — Rich text posts with media attachments
- **Stories** — Ephemeral content that disappears after 24 hours
- **Reactions** — Emoji reactions on posts and comments
- **Comments** — Threaded discussions on posts
- **Moderation** — Content moderation tools and workflows

<Cards>
  <Card title="Posts" href="/docs/feed/posts" />
  <Card title="Stories" href="/docs/feed/stories" />
  <Card title="Content Moderation" href="/docs/feed/moderation" />
</Cards>
ENDMDX

for page in posts stories reactions comments moderation; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/feed/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in the Thrico feed."
---

## Overview

This guide covers **${page//-/ }** in the Thrico feed system.

## Key Features

Detailed documentation for this feature is coming soon.

## Related Articles

- [Feed Overview](/docs/feed)
- [Community Management](/docs/community)
ENDMDX
done

echo "✅ Feed section created"

# ============================================
# GROUPS
# ============================================
mkdir -p "$BASE/groups"

cat > "$BASE/groups/meta.json" << 'ENDJSON'
{
  "title": "Groups",
  "pages": ["index", "create-groups", "privacy", "members", "settings"]
}
ENDJSON

cat > "$BASE/groups/index.mdx" << 'ENDMDX'
---
title: Groups
description: Create and manage groups within your Thrico communities.
---

## Overview

**Groups** allow members to form smaller, focused communities within a larger community. Groups can be public, private, or secret.

## Features

- Create and manage groups
- Set privacy levels
- Manage group members
- Configure group settings

<Cards>
  <Card title="Create Groups" href="/docs/groups/create-groups" />
  <Card title="Group Privacy" href="/docs/groups/privacy" />
  <Card title="Group Settings" href="/docs/groups/settings" />
</Cards>
ENDMDX

for page in create-groups privacy members settings; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/groups/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about group ${page//-/ } in Thrico."
---

## Overview

This guide covers **${page//-/ }** for Thrico groups.

## Related Articles

- [Groups Overview](/docs/groups)
ENDMDX
done

echo "✅ Groups section created"

# ============================================
# EVENTS
# ============================================
mkdir -p "$BASE/events"

cat > "$BASE/events/meta.json" << 'ENDJSON'
{
  "title": "Events",
  "pages": ["index", "online-events", "offline-events", "rsvp", "attendance"]
}
ENDJSON

cat > "$BASE/events/index.mdx" << 'ENDMDX'
---
title: Events
description: Create and manage online and offline events in your Thrico communities.
---

## Overview

Thrico's **Events** feature lets you host online and offline events, manage RSVPs, and track attendance.

## Features

- **Online Events** — Virtual events with video conferencing integration
- **Offline Events** — In-person events with location and maps
- **RSVP** — Member RSVP management
- **Attendance** — Track event attendance

<Cards>
  <Card title="Online Events" href="/docs/events/online-events" />
  <Card title="Offline Events" href="/docs/events/offline-events" />
  <Card title="RSVP Management" href="/docs/events/rsvp" />
  <Card title="Attendance" href="/docs/events/attendance" />
</Cards>
ENDMDX

for page in online-events offline-events rsvp attendance; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/events/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in Thrico events."
---

## Overview

This guide covers **${page//-/ }** for Thrico events.

## Related Articles

- [Events Overview](/docs/events)
ENDMDX
done

echo "✅ Events section created"

# ============================================
# MARKETPLACE
# ============================================
mkdir -p "$BASE/marketplace"

cat > "$BASE/marketplace/meta.json" << 'ENDJSON'
{
  "title": "Marketplace",
  "pages": ["index", "products", "categories", "orders", "payments"]
}
ENDJSON

cat > "$BASE/marketplace/index.mdx" << 'ENDMDX'
---
title: Marketplace
description: Set up and manage your Thrico marketplace for products, services, and digital goods.
---

## Overview

The Thrico **Marketplace** enables communities to buy, sell, and trade products, services, and digital goods.

## Features

- **Products** — Create and manage product listings
- **Categories** — Organize products into categories
- **Orders** — Track and manage orders
- **Payments** — Secure payment processing

<Cards>
  <Card title="Products" href="/docs/marketplace/products" />
  <Card title="Orders" href="/docs/marketplace/orders" />
  <Card title="Payments" href="/docs/marketplace/payments" />
</Cards>
ENDMDX

for page in products categories orders payments; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/marketplace/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about marketplace ${page//-/ } in Thrico."
---

## Overview

This guide covers **${page//-/ }** in the Thrico marketplace.

## Related Articles

- [Marketplace Overview](/docs/marketplace)
ENDMDX
done

echo "✅ Marketplace section created"

# ============================================
# DONATIONS
# ============================================
mkdir -p "$BASE/donations"

cat > "$BASE/donations/meta.json" << 'ENDJSON'
{
  "title": "Donations",
  "pages": ["index", "campaigns", "goals", "reports"]
}
ENDJSON

cat > "$BASE/donations/index.mdx" << 'ENDMDX'
---
title: Donations
description: Set up and manage donation campaigns in your Thrico communities.
---

## Overview

The **Donations** feature allows communities to run fundraising campaigns, set goals, and track contributions.

<Cards>
  <Card title="Campaigns" href="/docs/donations/campaigns" />
  <Card title="Goals" href="/docs/donations/goals" />
  <Card title="Reports" href="/docs/donations/reports" />
</Cards>
ENDMDX

for page in campaigns goals reports; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/donations/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about donation ${page//-/ } in Thrico."
---

## Overview

This guide covers **${page//-/ }** for Thrico donations.

## Related Articles

- [Donations Overview](/docs/donations)
ENDMDX
done

echo "✅ Donations section created"

# ============================================
# MENTORSHIP
# ============================================
mkdir -p "$BASE/mentorship"

cat > "$BASE/mentorship/meta.json" << 'ENDJSON'
{
  "title": "Mentorship",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/mentorship/index.mdx" << 'ENDMDX'
---
title: Mentorship
description: Set up and manage mentorship programs in your Thrico communities.
---

## Overview

The **Mentorship** feature enables communities to create structured mentorship programs, matching mentors with mentees based on skills, interests, and goals.

## Key Features

- Create mentorship programs
- Match mentors and mentees
- Track mentorship progress
- Set goals and milestones

<Callout type="info">
  Detailed documentation for mentorship features is being expanded. Check back soon for comprehensive guides.
</Callout>
ENDMDX

echo "✅ Mentorship section created"

# ============================================
# JOBS
# ============================================
mkdir -p "$BASE/jobs"

cat > "$BASE/jobs/meta.json" << 'ENDJSON'
{
  "title": "Jobs",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/jobs/index.mdx" << 'ENDMDX'
---
title: Jobs
description: Post and manage job listings in your Thrico communities.
---

## Overview

The **Jobs** feature allows communities to post job opportunities, manage applications, and connect members with career opportunities.

## Key Features

- Post job listings
- Manage applications
- Search and filter jobs
- Application tracking

<Callout type="info">
  Detailed documentation for jobs features is being expanded. Check back soon for comprehensive guides.
</Callout>
ENDMDX

echo "✅ Jobs section created"

# ============================================
# GAMIFICATION
# ============================================
mkdir -p "$BASE/gamification"

cat > "$BASE/gamification/meta.json" << 'ENDJSON'
{
  "title": "Gamification",
  "pages": ["index", "points", "badges", "ranks", "rewards", "leaderboards"]
}
ENDJSON

cat > "$BASE/gamification/index.mdx" << 'ENDMDX'
---
title: Gamification
description: Drive member engagement with points, badges, ranks, and leaderboards.
---

## Overview

Thrico's **Gamification** system helps drive member engagement through rewards, recognition, and friendly competition.

## Features

- **Points** — Award points for community activities
- **Badges** — Recognize achievements with badges
- **Ranks** — Level-based progression system
- **Rewards** — Redeemable rewards for active members
- **Leaderboards** — Public rankings to encourage participation

<Cards>
  <Card title="Points" href="/docs/gamification/points" />
  <Card title="Badges" href="/docs/gamification/badges" />
  <Card title="Leaderboards" href="/docs/gamification/leaderboards" />
</Cards>
ENDMDX

for page in points badges ranks rewards leaderboards; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/gamification/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in Thrico gamification."
---

## Overview

This guide covers **${page//-/ }** in the Thrico gamification system.

## Related Articles

- [Gamification Overview](/docs/gamification)
ENDMDX
done

echo "✅ Gamification section created"

# ============================================
# AI
# ============================================
mkdir -p "$BASE/ai"

cat > "$BASE/ai/meta.json" << 'ENDJSON'
{
  "title": "AI Assistant",
  "pages": ["index", "ai-search", "ai-moderation", "ai-automation"]
}
ENDJSON

cat > "$BASE/ai/index.mdx" << 'ENDMDX'
---
title: AI Assistant
description: Leverage AI-powered features in your Thrico communities.
---

## Overview

Thrico integrates **AI-powered** capabilities across the platform to enhance search, content moderation, and community automation.

## Features

- **AI Search** — Intelligent search with natural language understanding
- **AI Moderation** — Automated content moderation and flagging
- **AI Automation** — Smart workflows and automated responses

<Cards>
  <Card title="AI Search" href="/docs/ai/ai-search" />
  <Card title="AI Moderation" href="/docs/ai/ai-moderation" />
  <Card title="AI Automation" href="/docs/ai/ai-automation" />
</Cards>
ENDMDX

for page in ai-search ai-moderation ai-automation; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/ai/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in Thrico."
---

## Overview

This guide covers **${page//-/ }** capabilities in Thrico.

## Related Articles

- [AI Assistant Overview](/docs/ai)
ENDMDX
done

echo "✅ AI section created"

# ============================================
# ANALYTICS
# ============================================
mkdir -p "$BASE/analytics"

cat > "$BASE/analytics/meta.json" << 'ENDJSON'
{
  "title": "Analytics",
  "pages": ["index", "dashboard", "reports", "member-growth", "engagement", "retention", "exports"]
}
ENDJSON

cat > "$BASE/analytics/index.mdx" << 'ENDMDX'
---
title: Analytics
description: Track and analyze your community performance with Thrico analytics.
---

## Overview

Thrico **Analytics** provides comprehensive insights into your community's performance, member growth, engagement, and retention.

## Features

- **Dashboard** — Overview of key metrics
- **Reports** — Detailed reports and data visualization
- **Member Growth** — Track member acquisition and churn
- **Engagement** — Measure content and feature engagement
- **Retention** — Analyze member retention rates
- **Exports** — Export data for external analysis

<Cards>
  <Card title="Dashboard" href="/docs/analytics/dashboard" />
  <Card title="Reports" href="/docs/analytics/reports" />
  <Card title="Member Growth" href="/docs/analytics/member-growth" />
</Cards>
ENDMDX

for page in dashboard reports member-growth engagement retention exports; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/analytics/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } analytics in Thrico."
---

## Overview

This guide covers **${page//-/ }** in Thrico analytics.

## Related Articles

- [Analytics Overview](/docs/analytics)
ENDMDX
done

echo "✅ Analytics section created"

# ============================================
# NOTIFICATIONS
# ============================================
mkdir -p "$BASE/notifications"

cat > "$BASE/notifications/meta.json" << 'ENDJSON'
{
  "title": "Notifications",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/notifications/index.mdx" << 'ENDMDX'
---
title: Notifications
description: Configure and manage notifications in the Thrico platform.
---

## Overview

Thrico's **Notification** system keeps members informed about community activities through email, push, and in-app notifications.

## Notification Types

- **Email** — Transactional and marketing emails
- **Push** — Browser and mobile push notifications
- **In-App** — Real-time in-app notifications
- **SMS** — Text message notifications (where available)

## Configuration

Admins can configure notification preferences at the entity, community, and individual level.

<Callout type="info">
  Detailed documentation for notification configuration is being expanded.
</Callout>
ENDMDX

echo "✅ Notifications section created"

# ============================================
# EMAIL TEMPLATES
# ============================================
mkdir -p "$BASE/email-templates"

cat > "$BASE/email-templates/meta.json" << 'ENDJSON'
{
  "title": "Email Templates",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/email-templates/index.mdx" << 'ENDMDX'
---
title: Email Templates
description: Customize email templates for your Thrico communications.
---

## Overview

Thrico provides customizable **Email Templates** for all automated communications, including invitations, notifications, and transactional emails.

## Available Templates

- Welcome Email
- Invitation Email
- Password Reset
- Event Reminders
- Order Confirmation
- Notification Digest

## Customization

You can customize:

- Subject lines
- Email body content
- Branding (logo, colors)
- Dynamic variables (member name, community name, etc.)

<Callout type="info">
  Detailed template customization documentation is being expanded.
</Callout>
ENDMDX

echo "✅ Email Templates section created"

# ============================================
# MOBILE APPS
# ============================================
mkdir -p "$BASE/mobile-apps"

cat > "$BASE/mobile-apps/meta.json" << 'ENDJSON'
{
  "title": "Mobile Apps",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/mobile-apps/index.mdx" << 'ENDMDX'
---
title: Mobile Apps
description: Learn about Thrico's mobile applications for iOS and Android.
---

## Overview

Thrico provides native **Mobile Apps** for both iOS and Android, giving members on-the-go access to all community features.

## Features

- Full community access
- Push notifications
- Camera integration for posts and stories
- Offline mode for basic features
- Biometric authentication

## Download

- **iOS** — Available on the App Store
- **Android** — Available on Google Play

<Callout type="info">
  Detailed mobile app documentation is being expanded.
</Callout>
ENDMDX

echo "✅ Mobile Apps section created"

# ============================================
# SECURITY
# ============================================
mkdir -p "$BASE/security"

cat > "$BASE/security/meta.json" << 'ENDJSON'
{
  "title": "Security",
  "pages": ["index", "authentication", "sso", "roles", "permissions", "audit-logs", "password-policies"]
}
ENDJSON

cat > "$BASE/security/index.mdx" << 'ENDMDX'
---
title: Security
description: Security features and best practices for the Thrico platform.
---

## Overview

Security is a top priority for Thrico. This section covers authentication, authorization, audit logging, and security best practices.

## Features

- **Authentication** — Secure login with multiple authentication methods
- **Single Sign-On (SSO)** — SAML and OAuth integration
- **Role-Based Access Control** — Fine-grained permissions
- **Audit Logs** — Complete audit trail of all actions
- **Password Policies** — Configurable password requirements

<Cards>
  <Card title="Authentication" href="/docs/security/authentication" />
  <Card title="SSO" href="/docs/security/sso" />
  <Card title="Audit Logs" href="/docs/security/audit-logs" />
</Cards>
ENDMDX

for page in authentication sso roles permissions audit-logs password-policies; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/security/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in Thrico security."
---

## Overview

This guide covers **${page//-/ }** in Thrico's security system.

## Related Articles

- [Security Overview](/docs/security)
ENDMDX
done

echo "✅ Security section created"

# ============================================
# BILLING
# ============================================
mkdir -p "$BASE/billing"

cat > "$BASE/billing/meta.json" << 'ENDJSON'
{
  "title": "Billing",
  "pages": ["index", "subscriptions", "invoices", "payments", "plans", "usage"]
}
ENDJSON

cat > "$BASE/billing/index.mdx" << 'ENDMDX'
---
title: Billing
description: Manage subscriptions, invoices, and payments on the Thrico platform.
---

## Overview

Thrico's **Billing** system handles subscriptions, invoices, payments, and usage tracking for entities and communities.

## Features

- **Subscriptions** — Manage subscription plans
- **Invoices** — View and download invoices
- **Payments** — Payment processing and history
- **Plans** — Available subscription plans
- **Usage** — Track feature usage and limits

<Cards>
  <Card title="Subscriptions" href="/docs/billing/subscriptions" />
  <Card title="Invoices" href="/docs/billing/invoices" />
  <Card title="Plans" href="/docs/billing/plans" />
</Cards>
ENDMDX

for page in subscriptions invoices payments plans usage; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/billing/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in Thrico billing."
---

## Overview

This guide covers **${page//-/ }** in the Thrico billing system.

## Related Articles

- [Billing Overview](/docs/billing)
ENDMDX
done

echo "✅ Billing section created"

# ============================================
# API
# ============================================
mkdir -p "$BASE/api"

cat > "$BASE/api/meta.json" << 'ENDJSON'
{
  "title": "API Reference",
  "pages": ["index", "authentication", "graphql", "rest", "webhooks", "sdk", "rate-limits"]
}
ENDJSON

cat > "$BASE/api/index.mdx" << 'ENDMDX'
---
title: API Reference
description: Integrate with Thrico using our GraphQL and REST APIs.
---

## Overview

Thrico provides powerful APIs for integrating with external systems and building custom applications on top of the platform.

## Available APIs

### GraphQL API

Our primary API uses **GraphQL**, providing flexible and efficient data querying.

```graphql
query {
  community(id: "abc123") {
    name
    members {
      id
      name
      email
    }
  }
}
```

### REST API

For simpler integrations, we also offer a **REST API** with standard HTTP methods.

```bash
curl -X GET https://api.thrico.com/v1/communities \
  -H "Authorization: Bearer YOUR_API_KEY"
```

## Features

- **Authentication** — API key and OAuth2 authentication
- **GraphQL** — Flexible queries and mutations
- **REST** — Standard HTTP endpoints
- **Webhooks** — Real-time event notifications
- **SDK** — Client libraries for popular languages
- **Rate Limits** — Fair usage policies

<Cards>
  <Card title="Authentication" href="/docs/api/authentication" />
  <Card title="GraphQL API" href="/docs/api/graphql" />
  <Card title="REST API" href="/docs/api/rest" />
  <Card title="Webhooks" href="/docs/api/webhooks" />
</Cards>
ENDMDX

for page in authentication graphql rest webhooks sdk rate-limits; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/api/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Learn about ${page//-/ } in the Thrico API."
---

## Overview

This guide covers **${page//-/ }** for the Thrico API.

## Related Articles

- [API Reference Overview](/docs/api)
ENDMDX
done

echo "✅ API section created"

# ============================================
# TROUBLESHOOTING
# ============================================
mkdir -p "$BASE/troubleshooting"

cat > "$BASE/troubleshooting/meta.json" << 'ENDJSON'
{
  "title": "Troubleshooting",
  "pages": ["index", "login-issues", "email-issues", "domain-issues", "billing-issues", "performance-issues"]
}
ENDJSON

cat > "$BASE/troubleshooting/index.mdx" << 'ENDMDX'
---
title: Troubleshooting
description: Solutions for common issues on the Thrico platform.
---

## Overview

This section covers common issues and their solutions. If you can't find what you're looking for, contact our support team.

## Common Issues

<Cards>
  <Card title="Login Issues" href="/docs/troubleshooting/login-issues" />
  <Card title="Email Issues" href="/docs/troubleshooting/email-issues" />
  <Card title="Domain Issues" href="/docs/troubleshooting/domain-issues" />
  <Card title="Billing Issues" href="/docs/troubleshooting/billing-issues" />
  <Card title="Performance Issues" href="/docs/troubleshooting/performance-issues" />
</Cards>
ENDMDX

for page in login-issues email-issues domain-issues billing-issues performance-issues; do
  title=$(echo "$page" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) tolower(substr($i,2))}1')
  cat > "$BASE/troubleshooting/$page.mdx" << ENDMDX
---
title: "${title}"
description: "Troubleshoot ${page//-/ } on the Thrico platform."
---

## Common ${title}

### Issue 1

**Symptom:** Description of the issue.

**Solution:**
1. Check your configuration
2. Clear browser cache
3. Contact support if issue persists

### Issue 2

**Symptom:** Description of the issue.

**Solution:**
1. Verify your settings
2. Check for service outages
3. Review the error logs

## Still Need Help?

If you can't resolve the issue, please contact our support team with:

- Your entity ID
- Steps to reproduce the issue
- Any error messages or screenshots
ENDMDX
done

echo "✅ Troubleshooting section created"

# ============================================
# FAQ
# ============================================
mkdir -p "$BASE/faq"

cat > "$BASE/faq/meta.json" << 'ENDJSON'
{
  "title": "FAQ",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/faq/index.mdx" << 'ENDMDX'
---
title: Frequently Asked Questions
description: Answers to common questions about the Thrico platform.
---

## General

### What is Thrico?

Thrico is a comprehensive community management platform that enables organizations to build, manage, and scale their communities with features like feeds, groups, events, marketplace, gamification, and more.

### Who is Thrico for?

Thrico is designed for alumni networks, professional associations, member organizations, enterprise communities, and any organization that needs a robust community platform.

### How do I get started?

See our [Quick Start Guide](/docs/getting-started/quick-start) to get up and running in minutes.

## Pricing & Billing

### How does pricing work?

Thrico offers tiered subscription plans based on the number of members and features. See our [Billing](/docs/billing) documentation for details.

### Can I change my plan?

Yes, you can upgrade or downgrade your plan at any time from the billing settings.

## Technical

### What APIs are available?

Thrico provides both GraphQL and REST APIs. See our [API Reference](/docs/api) for full documentation.

### Is there a mobile app?

Yes, Thrico has native iOS and Android apps. See [Mobile Apps](/docs/mobile-apps) for details.

### How is data secured?

See our [Security](/docs/security) documentation for details on authentication, encryption, and data protection.

## Support

### How do I contact support?

You can reach our support team through the dashboard or at support@thrico.com.

### Where can I report bugs?

Bugs can be reported through the support portal or via the in-app feedback tool.
ENDMDX

echo "✅ FAQ section created"

# ============================================
# RELEASE NOTES
# ============================================
mkdir -p "$BASE/release-notes"

cat > "$BASE/release-notes/meta.json" << 'ENDJSON'
{
  "title": "Release Notes",
  "pages": ["index"]
}
ENDJSON

cat > "$BASE/release-notes/index.mdx" << 'ENDMDX'
---
title: Release Notes
description: Stay up to date with the latest Thrico platform updates, new features, and bug fixes.
---

## Version History

### v2.5.0 — August 2026

**New Features**
- AI-powered content moderation
- Enhanced analytics dashboard
- Bulk member import improvements

**Bug Fixes**
- Fixed event RSVP notification timing
- Resolved marketplace payment edge cases
- Improved mobile app performance

---

### v2.4.0 — July 2026

**New Features**
- Gamification leaderboards
- Community branding enhancements
- Webhook retry mechanism

**Bug Fixes**
- Fixed SSO login redirect loop
- Resolved email template rendering issues

---

### v2.3.0 — June 2026

**New Features**
- Mentorship program management
- Advanced search filters
- Custom email templates

**Improvements**
- Performance optimizations for large communities
- Improved mobile responsiveness
- Better error handling in API responses
ENDMDX

echo "✅ Release Notes section created"
echo ""
echo "🎉 All content sections created successfully!"
