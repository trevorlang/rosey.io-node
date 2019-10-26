# Run the installer if the dist directory does not exist
if test -f "~/rosey.io-server/build/bundle/index.js"; then
    echo "Running install script..."
    bash ~/rosey.io-node/build/bin/install.sh
fi

# Start the server
bash ~/rosey.io-node/build/bin/server.sh

# Start the display
bash ~/rosey.io-node/build/bin/display.sh