#!/bin/sh
# Quarto's sitemap lists the homepage as /index.html, but its own
# canonical tag (and every internal link) points to the trailing-slash
# root URL instead. That mismatch is what triggered Google's "Duplicate
# without user-selected canonical" notice, so keep the sitemap in sync
# with the canonical URLs.
sitemap="docs/sitemap.xml"
[ -f "$sitemap" ] || exit 0
sed -i '' 's#<loc>https://stanleybarrell-kane.com/index.html</loc>#<loc>https://stanleybarrell-kane.com/</loc>#' "$sitemap"
