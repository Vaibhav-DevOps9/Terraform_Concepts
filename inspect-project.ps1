
Write-Host "`n===== TERRAFORM VERSION =====" -ForegroundColor Cyan
terraform version

Write-Host "`n===== TFSEC VERSION =====" -ForegroundColor Cyan
tfsec --version

Write-Host "`n===== TFLINT VERSION =====" -ForegroundColor Cyan
tflint --version

Write-Host "`n===== INFRACOST VERSION =====" -ForegroundColor Cyan
infracost --version

Write-Host "`n===== TOOL PATHS =====" -ForegroundColor Cyan
Get-Command terraform, tfsec, tflint, infracost |
Select-Object Name, Source |
Format-Table -AutoSize
