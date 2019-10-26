
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
babel src/index.js --out-dir dist/bundle

# Copy source bash scripts to the dist directory
echo "Copying scripts..."
cp -R -f ./src/bin dist

# Copy source public files to the dist directory
echo "Copying public files..."
cp -R -f ./src/public dist

# Moving final bundle
echo "Creating bundle..."
rm -rf build
cp -R dist build
