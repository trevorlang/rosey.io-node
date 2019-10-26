# Run the installer if the dist directory does not exist
if test ! -f "~/rosey.io-server/dist/index.js"; then
    echo "Running install script..."
    bash ~/rosey.io-server/bin/install.sh
fi

# Start the webserver
echo "Starting server..."
node ~/rosey.io-server/index.js
