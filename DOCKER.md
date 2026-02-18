# ShopEase Backend Docker Guide

## Local Build & Run

### 1. Build the image

```bash
docker build -t shopease-backend .
```

### 2. Run the container

```bash
docker run -p 3000:3000 -e DATABASE_URL="postgresql://user:pass@host:5432/db" shopease-backend
```

### 3. Access

Go to `http://localhost:3000`.

## CI/CD Deployment

Images are automatically built and pushed to **Docker Hub** and **Amazon ECR** on every push to the `backend` branch.

### Tags

- `latest`: The most recent commit
- `<SHA>`: Unique commit hash

### Manual Push (optional)

```bash
docker tag shopease-backend <your-docker-id>/shopease-backend:latest
docker push <your-docker-id>/shopease-backend:latest
```
