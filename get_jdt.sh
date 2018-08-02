#!/usr/bin/zsh

NVIM_PATH="$HOME/.config/nvim"
UPSTREAM_VERSION="not found"
LATEST_PATH="$NVIM_PATH/.latest_jdt"

set -e # if anything fails, stop what we're doing

function get_latest_release {
    curl -s "http://download.eclipse.org/jdtls/snapshots/latest.txt"
}

function update_needed {
    local local_version=$([[ -r $LATEST_PATH ]] && cat $LATEST_PATH || echo "")
    UPSTREAM_VERSION=$(get_latest_release)

    [ "$UPSTREAM_VERSION" != "$local_version" ]
}

function download_jdt {
    local target=$(mktemp -d)
    local zip="$target/jdt.tar.gz"
    curl -L http://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz -o $zip

    echo $zip
}

function unpack_jdt {
    echo "Unpacking JDT and replacing previous version..."

    local zip=$1
    local extract=$2

    rm -rf $extract
    mkdir $extract
    pushd $extract
    tar -xzvf $zip
    popd
    rm $zip
}

function launcher_setup {
    echo "Setting up launcher..."

    local extract=$1
    local launcher=$(ls $extract/plugins/org.eclipse.equinox.launcher_* | head -n 1)

    ln -s $launcher $extract/plugins/launcher.jar
}

function update_beacon {
    echo "JDT updated. New version:"

    local extract=$1

    echo "$UPSTREAM_VERSION" | tee $LATEST_PATH
}

function update_jdt {
    if update_needed; then
        local extract="$NVIM_PATH/jdt"

        echo "Downloading version $UPSTREAM_VERSION..."
        local zip=$(download_jdt)

        unpack_jdt $zip $extract
        launcher_setup $extract
        update_beacon
    else
        echo "JDT is up to date."
    fi
}

update_jdt
