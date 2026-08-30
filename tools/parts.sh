# Shared HTML fragments for the Smoked Meat Academy static site.
# Sourced by the page-writing scripts; not shipped.
# SITE_URL is the canonical origin used for canonical links, Open Graph URLs
# and the social card. It matches the CNAME committed at the repository root.
SITE_URL="https://smokedmeatacademy.com"

head_open() { # $1 title, $2 description, $3 page filename ("" or index.html for the home page)
  local page="${3:-}"
  local canonical="$SITE_URL/"
  case "$page" in
    ""|index.html) ;;
    *) canonical="$SITE_URL/$page" ;;
  esac
cat <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>$1</title>
<meta name="description" content="$2">
<link rel="canonical" href="$canonical">
<meta property="og:title" content="$1">
<meta property="og:description" content="$2">
<meta property="og:type" content="website">
<meta property="og:url" content="$canonical">
<meta property="og:site_name" content="Smoked Meat Academy">
<meta property="og:image" content="$SITE_URL/assets/img/social.png">
<meta property="og:image:width" content="1200">
<meta property="og:image:height" content="630">
<meta name="twitter:card" content="summary_large_image">
<meta name="theme-color" content="#0b0908">
<link rel="icon" href="assets/img/mark.svg" type="image/svg+xml">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Inter:wght@300;400;500&family=JetBrains+Mono:wght@400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/style.css">
<script>document.documentElement.classList.add('js');</script>
</head>
<body>
<a class="skip-link" href="#main">Skip to content</a>
EOF
}

nav() {
cat <<'EOF'
<header class="nav">
  <div class="nav__inner">
    <a class="brand" href="index.html">
      <svg class="brand__mark" viewBox="0 0 40 40" aria-hidden="true">
        <defs>
          <linearGradient id="bm" x1="0" y1="1" x2="0" y2="0">
            <stop offset="0%" stop-color="#8a3a12"/><stop offset="55%" stop-color="#f26a1b"/><stop offset="100%" stop-color="#ffa33d"/>
          </linearGradient>
        </defs>
        <circle cx="20" cy="20" r="19" fill="none" stroke="#f26a1b" stroke-width="1.2" opacity=".55"/>
        <path d="M20 7c4 5 6.5 8 6.5 12.4A6.5 6.5 0 0 1 20 26a6.5 6.5 0 0 1-6.5-6.6C13.5 15 16 12 20 7z" fill="url(#bm)"/>
        <path d="M20 15c1.7 2.3 2.7 3.6 2.7 5.4a2.7 2.7 0 0 1-5.4 0c0-1.8 1-3.1 2.7-5.4z" fill="#0b0908" opacity=".65"/>
        <path d="M11 30h18" stroke="#f4efe8" stroke-width="1.4" stroke-linecap="round" opacity=".8"/>
      </svg>
      <span class="brand__text">Smoked Meat<span>Academy · Jordan</span></span>
    </a>
    <nav class="nav__links" id="nav-links" aria-label="Primary">
      <a href="index.html">Home</a>
      <a href="meat.html">The Meat</a>
      <a href="process.html">The Process</a>
      <a href="journal.html">Smoke Journal</a>
      <a href="smoker-box.html">Smoker Box</a>
      <a href="story.html">Our Story</a>
      <a class="btn" href="order.html"><span class="btn__spark">&#9650;</span>Order</a>
    </nav>
    <button class="nav__toggle" type="button" aria-expanded="false" aria-controls="nav-links">
      <span></span><span class="sr-only">Menu</span>
    </button>
  </div>
</header>
EOF
}

band() { # $1 heading, $2 paragraph, $3 cta href, $4 cta label
cat <<EOF
<section class="band">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="14"></div>
  <div class="wrap band__inner reveal">
    <h2>$1</h2>
    <p class="lede" style="margin-inline:auto">$2</p>
    <p style="margin-top:2rem"><a class="btn" href="$3"><span class="btn__spark">&#9650;</span>$4</a></p>
  </div>
</section>
EOF
}

foot() {
cat <<'EOF'
<footer class="footer">
  <div class="wrap">
    <div class="footer__grid">
      <div>
        <h4>Smoked Meat Academy</h4>
        <p style="font-size:.9rem">Fire, time and patience. A meat-smoking house bringing low-and-slow barbecue culture to Jordan.</p>
      </div>
      <div>
        <h4>The Journey</h4>
        <ul>
          <li><a href="index.html">Home</a></li>
          <li><a href="meat.html">The Meat</a></li>
          <li><a href="process.html">The Process</a></li>
          <li><a href="journal.html">Smoke Journal</a></li>
        </ul>
      </div>
      <div>
        <h4>Order</h4>
        <ul>
          <li><a href="smoker-box.html">The Smoker Box</a></li>
          <li><a href="order.html">Catering &amp; Events</a></li>
          <li><a href="story.html">Meet The Smoker</a></li>
        </ul>
      </div>
      <div>
        <h4>Contact</h4>
        <ul>
          <li><a href="mailto:smokedmeatacademy@yandex.com">smokedmeatacademy@yandex.com</a></li>
          <li><a href="tel:+962781560495">+962 78 156 0495</a></li>
          <li>Amman, Jordan</li>
        </ul>
      </div>
    </div>
    <div class="footer__base">
      <span>&copy; <span data-year>2026</span> Smoked Meat Academy</span>
      <span>Smoke. Fire. Meat.</span>
    </div>
  </div>
</footer>
<script src="assets/js/main.js"></script>
</body>
</html>
EOF
}

box_svg() {
cat <<'EOF'
<svg viewBox="0 0 520 340" role="img" aria-label="Illustration of the Smoker Box, open, packed with smoked meat, sides and sauces">
  <defs>
    <linearGradient id="bxTop" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0%" stop-color="#3a2b23"/><stop offset="100%" stop-color="#1b1512"/>
    </linearGradient>
    <linearGradient id="bxFront" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#2a201b"/><stop offset="100%" stop-color="#150f0d"/>
    </linearGradient>
    <linearGradient id="bxMeat" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#5a2412"/><stop offset="55%" stop-color="#8f3d17"/><stop offset="100%" stop-color="#41180c"/>
    </linearGradient>
    <linearGradient id="bxGlow" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#f26a1b" stop-opacity=".35"/><stop offset="100%" stop-color="#f26a1b" stop-opacity="0"/>
    </linearGradient>
  </defs>
  <ellipse cx="260" cy="305" rx="185" ry="20" fill="#000" opacity=".55"/>
  <rect x="120" y="20" width="280" height="90" fill="url(#bxGlow)"/>
  <path d="M90 120 L260 70 L430 120 L430 140 L260 92 L90 140 Z" fill="url(#bxTop)"/>
  <path d="M90 140 L260 92 L430 140 L430 250 L260 300 L90 250 Z" fill="url(#bxFront)"/>
  <path d="M260 92 L430 140 L430 250 L260 300 Z" fill="#000" opacity=".28"/>
  <g>
    <rect x="130" y="150" width="110" height="26" rx="3" fill="url(#bxMeat)" transform="rotate(-8 185 163)"/>
    <rect x="140" y="176" width="110" height="24" rx="3" fill="url(#bxMeat)" transform="rotate(-6 195 188)"/>
    <rect x="150" y="200" width="104" height="22" rx="3" fill="url(#bxMeat)" transform="rotate(-4 202 211)"/>
    <path d="M275 150 h70 a6 6 0 0 1 6 6 v34 a6 6 0 0 1-6 6 h-70 z" fill="#6d2c14"/>
    <rect x="275" y="205" width="80" height="30" rx="4" fill="#2f2723" stroke="#f26a1b" stroke-opacity=".5"/>
    <circle cx="295" cy="220" r="7" fill="#f26a1b" opacity=".8"/>
    <circle cx="320" cy="220" r="7" fill="#c04a17" opacity=".8"/>
    <circle cx="345" cy="220" r="7" fill="#8a3a12" opacity=".8"/>
  </g>
  <path d="M90 250 L260 300 L430 250" fill="none" stroke="#f26a1b" stroke-opacity=".35"/>
  <text x="260" y="278" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="11" letter-spacing="4" fill="#b9aea4">SMOKER BOX</text>
</svg>
EOF
}

smoker_svg() {
cat <<'EOF'
<svg viewBox="0 0 620 320" role="img" aria-label="Interactive diagram of an offset smoker with labelled parts">
  <defs>
    <linearGradient id="skBody" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#3b302a"/><stop offset="100%" stop-color="#16110f"/>
    </linearGradient>
    <linearGradient id="skFire" x1="0" y1="1" x2="0" y2="0">
      <stop offset="0%" stop-color="#8a3a12"/><stop offset="100%" stop-color="#ffa33d"/>
    </linearGradient>
  </defs>
  <ellipse cx="310" cy="292" rx="230" ry="14" fill="#000" opacity=".5"/>
  <rect x="150" y="120" width="300" height="130" rx="60" fill="url(#skBody)" stroke="#f26a1b" stroke-opacity=".25"/>
  <rect x="452" y="160" width="86" height="90" rx="16" fill="url(#skBody)" stroke="#f26a1b" stroke-opacity=".25"/>
  <rect x="470" y="200" width="50" height="34" rx="6" fill="url(#skFire)" opacity=".9"/>
  <rect x="196" y="82" width="34" height="42" fill="url(#skBody)" stroke="#f26a1b" stroke-opacity=".25"/>
  <path d="M200 78 q6-26 14-34 q6 16 14 34" fill="none" stroke="#b9aea4" stroke-opacity=".35" stroke-width="2"/>
  <line x1="180" y1="185" x2="420" y2="185" stroke="#f4efe8" stroke-opacity=".22" stroke-dasharray="6 8"/>
  <line x1="180" y1="215" x2="420" y2="215" stroke="#f4efe8" stroke-opacity=".14" stroke-dasharray="6 8"/>
  <rect x="180" y="250" width="14" height="40" fill="#241e1b"/>
  <rect x="406" y="250" width="14" height="40" fill="#241e1b"/>
  <g class="hotspot" tabindex="0" role="button" aria-label="Cooking chamber" data-title="Cooking Chamber" data-body="The meat sits here, never over a flame. Hot air and smoke enter from the firebox on the right, travel the length of the barrel and leave through the stack. Racks are loaded fat side up so the rendering fat bastes the meat all day.">
    <circle cx="300" cy="150" r="9" fill="#c04a17" stroke="#f4efe8" stroke-opacity=".5"/>
    <text x="300" y="154" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="9" fill="#0b0908">1</text>
  </g>
  <g class="hotspot" tabindex="0" role="button" aria-label="Firebox" data-title="Firebox" data-body="A separate chamber, offset and slightly lower than the cooking barrel. A small hot fire of seasoned hardwood burns here all day. Small and hot is the rule: a large smouldering fire makes dirty smoke and bitter meat.">
    <circle cx="495" cy="217" r="9" fill="#c04a17" stroke="#f4efe8" stroke-opacity=".5"/>
    <text x="495" y="221" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="9" fill="#0b0908">2</text>
  </g>
  <g class="hotspot" tabindex="0" role="button" aria-label="Chimney" data-title="Chimney Stack" data-body="The stack pulls air through the whole cooker. Its damper, together with the firebox intake, is how the pitmaster sets temperature. Fuel does not control heat here; airflow does.">
    <circle cx="213" cy="100" r="9" fill="#c04a17" stroke="#f4efe8" stroke-opacity=".5"/>
    <text x="213" y="104" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="9" fill="#0b0908">3</text>
  </g>
  <g class="hotspot" tabindex="0" role="button" aria-label="Racks" data-title="Racks and Placement" data-body="The end nearest the firebox runs hotter, so the biggest cuts go there and the delicate ones sit further along. Every cut gets rotated at least once, and the door stays shut the rest of the time.">
    <circle cx="240" cy="200" r="9" fill="#c04a17" stroke="#f4efe8" stroke-opacity=".5"/>
    <text x="240" y="204" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="9" fill="#0b0908">4</text>
  </g>
  <g class="hotspot" tabindex="0" role="button" aria-label="Wood store" data-title="The Wood" data-body="Oak is the base wood: steady, neutral and long burning. Hickory is added for depth on beef, and local olive or citrus wood for lighter cuts. Everything is seasoned dry, because green wood makes acrid white smoke.">
    <circle cx="560" cy="255" r="9" fill="#c04a17" stroke="#f4efe8" stroke-opacity=".5"/>
    <text x="560" y="259" text-anchor="middle" font-family="JetBrains Mono, monospace" font-size="9" fill="#0b0908">5</text>
  </g>
  <path d="M552 268 l14 22 h-28 z" fill="#4a3f39"/>
  <path d="M566 268 l14 22 h-28 z" fill="#3a3029"/>
</svg>
EOF
}

# meat_art <id> <colourA> <colourB> <variant: slab|ribs|pulled|bird|links>
meat_art() {
  local id="$1" ca="$2" cb="$3" variant="${4:-slab}" body=""
  case "$variant" in
    ribs)
      body='<rect x="0" y="0" width="240" height="120" rx="10" fill="url(#m'"$id"')"/>
            <rect x="0" y="0" width="240" height="11" rx="5" fill="#150d09"/>
            <rect x="0" y="11" width="240" height="6" fill="#c04a17" opacity=".5"/>
            <g fill="#f4efe8" fill-opacity=".16">
              <rect x="22" y="96" width="46" height="16" rx="8"/>
              <rect x="98" y="96" width="46" height="16" rx="8"/>
              <rect x="174" y="96" width="46" height="16" rx="8"/>
            </g>
            <path d="M20 58 q40-14 80 0 t80 0 t60 0" fill="none" stroke="#f4efe8" stroke-opacity=".10" stroke-width="6"/>' ;;
    pulled)
      body='<g stroke-linecap="round" fill="none">
              <path d="M6 40 q50 14 108 2 t118 6" stroke="url(#m'"$id"')" stroke-width="15"/>
              <path d="M2 66 q60-16 120 0 t114-4" stroke="url(#m'"$id"')" stroke-width="17"/>
              <path d="M10 92 q54 16 112 0 t114 4" stroke="url(#m'"$id"')" stroke-width="14"/>
              <path d="M8 52 q60 10 118 0" stroke="#f4efe8" stroke-opacity=".10" stroke-width="3"/>
              <path d="M28 80 q60 12 118 0" stroke="#f4efe8" stroke-opacity=".08" stroke-width="3"/>
            </g>' ;;
    bird)
      body='<path d="M40 30 q80-28 150 6 q34 17 30 48 q-5 36-60 40 q-70 5-108-16 q-32-18-26-44 q3-22 14-34z" fill="url(#m'"$id"')"/>
            <path d="M56 44 q70-18 128 8" fill="none" stroke="#f4efe8" stroke-opacity=".16" stroke-width="4"/>
            <path d="M64 78 q60 16 118-2" fill="none" stroke="#f4efe8" stroke-opacity=".10" stroke-width="4"/>
            <circle cx="196" cy="96" r="9" fill="#f4efe8" fill-opacity=".18"/>' ;;
    links)
      body='<g>
              <rect x="4" y="18" width="230" height="36" rx="18" fill="url(#m'"$id"')"/>
              <rect x="12" y="66" width="222" height="36" rx="18" fill="url(#m'"$id"')"/>
              <path d="M60 36 h4 M120 36 h4 M180 36 h4" stroke="#150d09" stroke-width="6" stroke-linecap="round" opacity=".5"/>
              <path d="M70 84 h4 M130 84 h4 M190 84 h4" stroke="#150d09" stroke-width="6" stroke-linecap="round" opacity=".5"/>
            </g>' ;;
    *)
      body='<rect x="0" y="0" width="240" height="120" rx="14" fill="url(#m'"$id"')"/>
            <rect x="0" y="0" width="240" height="12" rx="6" fill="#150d09"/>
            <rect x="0" y="12" width="240" height="7" fill="#c04a17" opacity=".55"/>
            <path d="M20 60 q40-18 80 0 t80 0 t60 0" fill="none" stroke="#f4efe8" stroke-opacity=".10" stroke-width="6"/>
            <path d="M20 88 q50-14 100 0 t100 0" fill="none" stroke="#f4efe8" stroke-opacity=".08" stroke-width="5"/>' ;;
  esac
cat <<EOF
<svg viewBox="0 0 320 200" role="img" aria-label="Abstract illustration of a smoked cut">
  <defs>
    <linearGradient id="g$id" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#1c1512"/><stop offset="100%" stop-color="#0b0908"/>
    </linearGradient>
    <linearGradient id="m$id" x1="0" y1="0" x2="0" y2="1">
      <stop offset="0%" stop-color="#2a1a12"/>
      <stop offset="18%" stop-color="#$ca"/>
      <stop offset="60%" stop-color="#$cb"/>
      <stop offset="100%" stop-color="#2a1a12"/>
    </linearGradient>
  </defs>
  <rect width="320" height="200" fill="url(#g$id)"/>
  <circle cx="255" cy="45" r="60" fill="#f26a1b" opacity=".10"/>
  <g transform="translate(40 40)">
$body
  </g>
  <line x1="0" y1="176" x2="320" y2="176" stroke="#f26a1b" stroke-opacity=".25"/>
</svg>
EOF
}
