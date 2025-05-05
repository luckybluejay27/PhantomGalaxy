#!/bin/bash

# Add all changes
git add .

# Commit with timestamp
git commit -m "Vault update: $(date)"

# Push to main branch
git push origin main
