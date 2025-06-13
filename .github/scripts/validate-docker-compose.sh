#!/usr/bin/env bash

# Validates Docker Compose configurations for manual contributions
# This script tests docker-compose.json files to ensure they have valid syntax
# and structure before merge in manual PRs.

if [ -z "$CHANGED_FILES" ]; then
    echo "❌ Environment variable CHANGED_FILES is required"
    exit 1
fi

echo "🔍 Testing Docker Compose configurations..."

hasErrors=false

for file in $CHANGED_FILES; do
    if [[ $file == *"docker-compose.json" ]]; then
        echo "🔍 Testing Docker Compose: $file"

        if [ ! -f "$file" ]; then
            echo "❌ Docker Compose file not found: $file"
            hasErrors=true
            continue
        fi

        # Test JSON validity first
        if ! python -m json.tool "$file" >/dev/null 2>&1; then
            echo "❌ Invalid JSON format: $file"
            hasErrors=true
            continue
        fi

        # Basic docker-compose structure validation
        # Check if it has 'services' field
        if ! grep -q '"services"' "$file"; then
            echo "❌ Missing 'services' field in: $file"
            hasErrors=true
            continue
        fi

        # Try to validate with docker-compose if available
        if command -v docker-compose >/dev/null 2>&1; then
            if docker-compose -f "$file" config >/dev/null 2>&1; then
                echo "✅ Valid Docker Compose: $file"
            else
                echo "❌ Invalid Docker Compose structure: $file"
                echo "Docker Compose validation errors:"
                docker-compose -f "$file" config 2>&1 | head -10
                hasErrors=true
            fi
        else
            echo "⚠️  Docker Compose not available - skipping structure validation for: $file"
            echo "✅ JSON syntax valid: $file"
        fi
    fi
done

if [ "$hasErrors" = true ]; then
    echo ""
    echo "❌ Docker Compose validation failed - please fix errors before merge"
    echo "📋 Requirements:"
    echo "   - Valid JSON syntax"
    echo "   - Must contain 'services' field"
    echo "   - Must pass docker-compose config validation"
    exit 1
else
    echo ""
    echo "✅ All Docker Compose files are valid"
    exit 0
fi
