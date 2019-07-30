set -euxo pipefail

main() {
    cargo check --target $TARGET

    case $TARGET in
        arm*v7r-none-eabi*)
            ;;

        *)
            cargo test --target $TARGET

            ./check-blobs.sh
            ;;
    esac
}

main
