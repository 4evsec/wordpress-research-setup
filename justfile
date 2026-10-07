set shell := ["bash", "-uc"]

clean:
    rm -rf plugins/*
    echo -e '*\n!.gitignore' | tee "plugins/.gitignore"
    docker compose down -v --remove-orphans

rebuild: clean
    docker compose build # --no-cache
    docker compose up -d
exec:
    docker compose exec analysis bash
semgrep:
    semgrep scan --sarif --output results.sarif \
        --no-git-ignore --metrics off --config ./tools/semgrep-rules/php/  plugins/