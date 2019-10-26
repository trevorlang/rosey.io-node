
# Clean the dist directory
echo "Cleaning dist directory..."
rm -rf dist/

# Make the dist directory
echo "Initializing fresh dist directory..."
mkdir dist/

# Scaffold subdirectories
echo "Scaffolding subdirectories..."
mkdir dist/bin
mkdir dist/bundle

# Transpile the javascript bundle 
echo "Building Javascript bundle..."
babel src/**/*.js --out-dir dist/bundle

# Copy source bash scripts to the dist directory
echo "Copying scripts..."
cp -R -f src/bin dist