# ShopEase Backend

The backend API for the ShopEase e-commerce application, built with **Express.js**, **TypeScript**, **Prisma ORM**, and **PostgreSQL**.

## Tech Stack

- **Runtime**: Node.js 22+
- **Framework**: Express.js 5
- **Language**: TypeScript 5.9
- **ORM**: Prisma 7
- **Database**: PostgreSQL (via `pg` adapter)
- **Validation**: Zod 4

## Getting Started

### Prerequisites

- Node.js 22+ (LTS recommended)
- PostgreSQL database (local or remote)

### Installation

```bash
npm install
```

### Environment Setup

```bash
cp .env.example .env
# Edit .env with your database connection string
```

### Database Setup

```bash
# Generate Prisma client
npm run prisma:generate

# Run migrations
npm run prisma:migrate:dev

# Seed database
npm run prisma:seed
```

### Development

```bash
npm run dev
```

### Production Build

```bash
npm run build
npm start
```

## Scripts

| Script                          | Description                                   |
| ------------------------------- | --------------------------------------------- |
| `npm run dev`                   | Start development server with hot-reload      |
| `npm run build`                 | Generate Prisma client and compile TypeScript |
| `npm start`                     | Start production server                       |
| `npm run prisma:generate`       | Generate Prisma client                        |
| `npm run prisma:migrate:dev`    | Run database migrations (dev)                 |
| `npm run prisma:migrate:deploy` | Run database migrations (prod)                |
| `npm run prisma:studio`         | Open Prisma Studio                            |
| `npm run prisma:seed`           | Seed database with sample data                |
| `npm run setup`                 | Full setup (generate + migrate + seed)        |

## Project Structure

```
├── src/               # Application source code
├── prisma/            # Prisma schema and migrations
├── api/               # Vercel serverless function entry
├── Dockerfile         # Container image build
├── apprunner.yaml     # AWS App Runner config
├── vercel.json        # Vercel deployment config
└── package.json       # Dependencies and scripts
```

## Deployment

See [DEPLOYMENT.md](./DEPLOYMENT.md) for deployment guides.

## Docker

See [DOCKER.md](./DOCKER.md) for Docker build and push instructions.
