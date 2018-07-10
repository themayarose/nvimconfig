#!/usr/bin/zsh

function get_latest_release {
    curl --silent "https://api.github.com/repos/$1/tags" |
        grep '"name":' |
        head -n 1 |
        sed -E 's/.*"([^"]+)".*/\1/'
}

function get_vscode_java {
    local target=$(mktemp -d)
    local zip="$target/jdt.tar.gz"
    local extract="$HOME/.config/nvim/jdt"
    echo "Downloading to $zip and unpacking to $extract..."
    curl -L http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -o $zip
    echo "Downloaded."

    rm -rf $extract
    echo "Removed old version."
    mkdir $extract
    pushd $extract
    tar -xzvf $zip
    $popd
    echo "Unzipped."
    rm $zip
    echo "Removed zip."
    local launcher=$(ls $extract/plugins/org.eclipse.equinox.launcher_* | head -n 1)
    ln -s $launcher $extract/plugins/launcher.jar
}

get_vscode_java
