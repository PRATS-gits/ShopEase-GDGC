# ShopEase Backend Deployment

This guide covers deployment instructions for the ShopEase Backend API.

## AWS App Runner (Recommended)

### Option 1: Container Deployment (ECR)

This is the recommended method, especially for Node.js 22+ applications.

1.  Push the Docker image to Amazon ECR (automated via CI/CD).
2.  Create an App Runner service.
3.  Choose **Amazon ECR**.
4.  Select the `shopease-backend` image tag (e.g., `latest`).
5.  Configure service:
    - **Port**: `3000`
    - **Environment Variables**:
      - `DATABASE_URL`: Your production PostgreSQL connection string
      - `PORT`: `3000`
      - See `.env.example` for other required variables.
6.  Deploy.

### Option 2: Source Code Deployment

Current App Runner runtimes (Node.js 18) may not support all Node.js 22 features used in this project. **Option 1 is preferred.**

1.  Create an App Runner service.
2.  Choose **Source Code Repository** -> GitHub.
3.  Select the `backend` branch.
4.  Configure build settings (use `apprunner.yaml`):
    - Runtime: `Nodejs 18`
    - Build command: `npm install && npm run build`
    - Start command: `npm start`
    - Port: `3000`
5.  Add Environment Variables.
6.  Deploy.

## Vercel (Serverless Function)

The backend is configured to run as a serverless function via `api/index.js` (if present) or standalone express server.

1.  Connect your GitHub repository to Vercel.
2.  Import the project.
3.  Vercel should automatically detect the framework.
4.  Override Build Command: `npm run build`.
5.  Set Output Directory: `dist`.
6.  Add Environment Variables (`DATABASE_URL`, etc.).
7.  Deploy.
