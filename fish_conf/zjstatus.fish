function zjstatus-update --description "Download the latest zjstatus Zellij plugin to ~/.config/zellij/zjstatus.wasm"
    set dest ~/.config/zellij/zjstatus.wasm
    set url (curl -sf https://api.github.com/repos/dj95/zjstatus/releases/latest \
        | python3 -c "import sys,json; d=json.load(sys.stdin); print(next((a['browser_download_url'] for a in d['assets'] if a['name']=='zjstatus.wasm'), ''))")

    if test -z "$url"
        echo "zjstatus-update: zjstatus.wasm not found in latest release" >&2
        return 1
    end

    mkdir -p (dirname $dest)
    echo "Downloading $url → $dest"
    curl -fL -o $dest $url
    and echo "zjstatus updated."
end
