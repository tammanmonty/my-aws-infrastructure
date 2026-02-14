param(
  [Parameter(Mandatory=$true)][string]$ProjectName,
  [string]$Remote = 'origin'
)

$branch = "project/$ProjectName"
git checkout main
git pull $Remote main
git checkout -b $branch
git push -u $Remote $branch
Write-Host "Created and pushed branch $branch"
