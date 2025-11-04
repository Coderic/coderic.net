# Coderic Content Hub

**Public content network** - Access shared APIs and datasets from the Coderic network

?? **Live Site**: [coderic.net](https://coderic.net)

---

## ?? Overview

Coderic Content Hub es una red de contenido p?blico que proporciona acceso a APIs compartidas y datasets de la red Coderic. El sitio est? construido con Jekyll y desplegado en **Cloudflare Pages** con Functions para endpoints serverless.

## ??? Tech Stack

- **Static Site**: Jekyll 4.4
- **Theme**: Remote theme from [Coderic/coderic.org](https://github.com/Coderic/coderic.org)
- **Hosting**: Cloudflare Pages
- **Functions**: Cloudflare Workers
- **Styling**: Tailwind CSS 4
- **Authentication**: Auth0

## ?? API Endpoints

### Live Cloudflare Workers Endpoints

- **GET** `/api/helloWorld` - Test endpoint con respuesta JSON
- **GET** `/api` - API index con lista de endpoints disponibles

```bash
# Test Hello World endpoint
curl https://coderic.net/api/helloWorld

# Test API Index
curl https://coderic.net/api
```

### Response Example

```json
{
  "message": "Hello World from Coderic Content Hub!",
  "timestamp": "2025-11-04T22:00:00.000Z",
  "network": "HUB",
  "version": "1.0.0",
  "endpoint": "/api/helloWorld",
  "docs": "https://coderic.net/endpoints",
  "status": "operational"
}
```

## ?? Project Structure

```
/workspace/
??? _config.yml              # Jekyll configuration
??? _includes/
?   ??? portal.html          # Navigation component
??? functions/
?   ??? api/
?       ??? helloWorld.js    # Hello World endpoint
?       ??? [[path]].js      # Catch-all API router
??? images/                  # Static assets
??? js/
?   ??? auth.js             # Auth0 integration
??? wrangler.toml           # Cloudflare configuration
??? package.json            # Node dependencies
??? Gemfile                 # Ruby dependencies
??? index.html              # Homepage
??? apis.html               # Public APIs page
??? datasets.html           # Datasets page
??? endpoints.html          # API endpoints documentation
??? network.html            # Network status page
??? 404.html                # Custom 404 page
??? callback.html           # Auth0 callback
??? logout.html             # Auth0 logout
??? sitemap.xml             # SEO sitemap
??? robots.txt              # SEO robots
??? README.md               # This file
```

## ??? Development

### Prerequisites

- Ruby 3.4.x
- Node.js 18+
- Bundler
- Wrangler CLI (optional, for local Functions testing)

### Local Development (Jekyll only)

```bash
# Install Ruby dependencies
bundle install

# Build site
bundle exec jekyll build

# Serve locally
bundle exec jekyll serve
# Open http://localhost:4000
```

### Local Development (with Cloudflare Functions)

```bash
# Install Node dependencies
npm install

# Build Jekyll site first
bundle exec jekyll build

# Run Cloudflare Pages dev server
npm run dev
# Open http://localhost:8788
```

## ?? Deployment

El sitio se despliega autom?ticamente a **Cloudflare Pages** cuando se hace push a la rama `master`.

### Manual Deployment (Wrangler)

```bash
# Build site
bundle exec jekyll build

# Deploy to Cloudflare Pages
npm run deploy
```

### GitHub Pages (fallback)

El sitio tambi?n se puede desplegar a GitHub Pages autom?ticamente desde la rama `master`.

## ?? Authentication

El sitio integra Auth0 para autenticaci?n de usuarios:

- **Domain**: `auth.coderic.org`
- **Client ID**: Configurado en `js/auth.js`
- **Callback**: `https://coderic.net/callback`
- **Logout**: `https://coderic.net/logout`

## ?? Pages

- **/** - Homepage con hero section y feature cards
- **/apis** - Public APIs documentation
- **/datasets** - Shared datasets information
- **/endpoints** - API endpoints reference
- **/network** - Network status and uptime
- **/404** - Custom 404 error page

## ?? Configuration

### Jekyll (_config.yml)

```yaml
title: "Coderic Content Hub"
url: "https://coderic.net"
remote_theme: Coderic/coderic.org
```

### Cloudflare (wrangler.toml)

```toml
name = "coderic-net"
compatibility_date = "2025-11-04"
pages_build_output_dir = "_site"
```

> **Note**: Las Functions se detectan autom?ticamente desde el directorio `/functions`

## ?? SEO

- ? Sitemap.xml configurado
- ? Robots.txt configurado
- ? IndexNow integration para notificaciones a buscadores
- ? Meta tags y structured data
- ? URLs amigables con permalinks

## ?? Network

Este sitio forma parte de la red de dominios Coderic:

- **coderic.org** - Sitio principal corporativo
- **coderic.co** - Servicios financieros (FinTech)
- **coderic.net** - Content Hub (este sitio)

## ?? License

? 2025 Coderic Corporation. All rights reserved.

## ?? Contributing

Este es un repositorio interno de Coderic. Para contribuciones, contactar al equipo de desarrollo.

---

**Built with ?? by Coderic**
