#!/bin/bash

FORMULA=${FORMULA:-$1}

if [ -z "$FORMULA" ]; then
  read -p "FORMULA is not set. Please enter a formula : " FORMULA
fi

source "./Templates/$FORMULA.template" || exit 1

# Set variables
SHA256=$(curl -L "$URL" | shasum -a 256 | cut -d ' ' -f 1)

# Read the template
template=$(cat ./Templates/Template.rb)

echo "FORMULA_CLASS_NAME: " $FORMULA_CLASS_NAME
echo "DESCRIPTION: " $DESCRIPTION
echo "HOMEPAGE: " $HOMEPAGE
echo "URL: " $URL
echo "SHA256: " $SHA256
echo "VERSION: " $VERSION
echo "SCRIPT_NAME: " $SCRIPT_NAME

# Replace placeholders using sed
template=$(echo "$template" | sed \
  -e "s|#{FORMULA_CLASS_NAME}|$FORMULA_CLASS_NAME|g" \
  -e "s|#{DESCRIPTION}|$DESCRIPTION|g" \
  -e "s|#{HOMEPAGE}|$HOMEPAGE|g" \
  -e "s|#{URL}|$URL|g" \
  -e "s|#{SHA256}|$SHA256|g" \
  -e "s|#{VERSION}|$VERSION|g" \
  -e "s|#{SCRIPT_NAME}|$SCRIPT_NAME|g")

# Output the resolved template
echo "$template" >"Formula/${FORMULA_CLASS_NAME}.rb"
