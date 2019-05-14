find . -type f -exec mv --backup=numbered {} . \; && find . -maxdepth 1 -type d -exec rm -r {} +
