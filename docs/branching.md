# Branching strategy and CI for project-specific deployments

This repository keeps generic, reusable Terraform modules and environment scaffolding on `main`.

Branch naming convention
- Use `project/<project-name>` for project-specific branches (example: `project/acme-api`).

Workflows
- `terraform-plan.yml` (runs on push to `project/**`) — runs `terraform plan` and uploads the plan artifact.
- `terraform-apply.yml` (manual via `workflow_dispatch`) — run this from the GitHub UI to apply a branch's configuration.

Repository secrets required
- `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` — for apply execution.
- `TF_BACKEND_BUCKET` and `TF_BACKEND_REGION` — if you use an S3 backend (referenced by the plan workflow).

How to create a project branch locally
1. From the repo root run PowerShell:

```powershell
.\iles\scripts\create_project_branch.ps1 -ProjectName "my-app"
```

This creates `project/my-app` from `main` and pushes it to the `origin` remote.

How CI works (summary)
- Push changes to `project/<name>` to generate a plan.
- Inspect the uploaded plan in GitHub Actions artifacts.
- Run the manual `Terraform Apply (manual)` workflow to apply.
