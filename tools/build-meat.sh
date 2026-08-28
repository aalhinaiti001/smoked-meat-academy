#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh

# id | name | tags | cut | time | wood | temp | flavour | serve | blurb | colourA | colourB | art variant
CUTS='
brisket|Brisket|beef signature|Whole packer, flat and point|12–14 hours|Oak with a little hickory|110°C chamber, 96°C internal|Deep, beefy, peppery bark with rendered fat under it|Sliced pencil-thick against the grain, butcher paper, pickles|The cut the whole method was built around. Trimmed by hand, seasoned with nothing but coarse salt and pepper, and left alone until it gives.|7a2f14|a8481c|slab
shortribs|Short Ribs|beef signature|Plate ribs, three bones|7–8 hours|Oak|115°C chamber, 98°C internal|Rich and buttery, heavy bark, almost no chew left|One bone per person, cut between the bones, served hot|Beef ribs are what brisket wants to be when it grows up. Heavy marbling, heavy bone, and a bark you can hear when the knife goes in.|6d2a12|9c4218|ribs
beefribs|Beef Back Ribs|beef|Back ribs from the rib primal|5 hours|Oak and cherry|115°C chamber|Leaner than plate ribs, sweeter edge from the cherry|Racked whole, sliced at the table|Less meat than plate ribs and more of it between the bones, which makes them the best thing on the smoker to eat with your hands.|713016|ad4c1e|ribs
pulled|Pulled Beef|beef|Chuck roll|9 hours|Oak|110°C chamber, 97°C internal|Soft, moist, heavily seasoned, holds sauce well|Piled into brioche with slaw, or on rice|Chuck has more connective tissue than brisket and turns into strands rather than slices. This is the cut for sandwiches and for feeding a crowd.|66280f|9a4016|pulled
chicken|Smoked Chicken|poultry|Whole bird, brined overnight|3 hours|Citrus and olive wood|135°C chamber, finished hot for the skin|Light smoke, salty brine, crisp skin, juicy breast|Quartered, with pickles and a vinegar sauce|Poultry cannot take twelve hours of oak, so it gets lighter wood and a shorter cook. The overnight brine is what keeps the breast from drying.|8a5a1c|b8802c|bird
sausage|House Sausages|beef poultry|Coarse ground beef, house blend|2.5 hours|Hickory|115°C chamber, 74°C internal|Sharp, spiced, snappy casing, smoke all the way through|Two links per portion, mustard on the side|Ground and stuffed in house on the morning of the cook, then hung in the chamber. The snap of the casing is the whole point.|7b3b12|a95a1e|links
lamb|Lamb Shoulder|lamb|Bone-in shoulder|8 hours|Olive wood|115°C chamber, 95°C internal|Local and familiar, olive smoke instead of oak, deeply savoury|Pulled, with flatbread and yoghurt|The one cut on the rack that belongs to this region before it belongs to Texas. Olive wood keeps the smoke close to what a Jordanian table already knows.|6a3218|9c4c22|pulled
turkey|Smoked Turkey Breast|poultry|Boneless breast, brined|4 hours|Cherry|120°C chamber, 74°C internal|Mild, clean, gently sweet|Cold-sliced for sandwiches or warm with sides|Proof that smoke does not have to mean heavy. Brined for a day, smoked over cherry, and sliced thin.|8b5f24|b98432|slab
'

{
head_open "The Meat — Smoked Meat Academy" "Every cut on the rack: the trim, the wood, the temperature, the hours and how it is served."
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="16"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">The Meat</p>
    <h1>Know the cut</h1>
    <p class="lede">This is not a menu. Every cut is listed with the way it is trimmed, the wood it sees, the temperature it is held at and the hours it takes, because understanding the cook is most of the pleasure of eating it.</p>
  </div>
</section>

<section>
  <div class="wrap">
    <div class="filter-bar">
      <button class="chip is-active" type="button" data-filter="all" aria-pressed="true">All cuts</button>
      <button class="chip" type="button" data-filter="beef" aria-pressed="false">Beef</button>
      <button class="chip" type="button" data-filter="lamb" aria-pressed="false">Lamb</button>
      <button class="chip" type="button" data-filter="poultry" aria-pressed="false">Poultry</button>
      <button class="chip" type="button" data-filter="signature" aria-pressed="false">Signature</button>
    </div>
    <div class="meat-grid">
EOF

printf '%s\n' "$CUTS" | while IFS='|' read -r id name tags cut time wood temp flavour serve blurb ca cb art; do
  [ -z "${id:-}" ] && continue
  echo "      <article class=\"meat-card reveal\" data-tags=\"$tags\" id=\"$id\">"
  echo "        <div class=\"meat-card__art\">"
  meat_art "$id" "$ca" "$cb" "$art"
  echo "        </div>"
  echo "        <div class=\"meat-card__body\">"
  echo "          <span class=\"meat-card__cut\">$cut</span>"
  echo "          <h3>$name</h3>"
  echo "          <p>$blurb</p>"
  echo "          <ul class=\"spec\">"
  echo "            <li><span class=\"k\">Smoking time</span><span class=\"v\">$time</span></li>"
  echo "            <li><span class=\"k\">Wood</span><span class=\"v\">$wood</span></li>"
  echo "            <li><span class=\"k\">Temperature</span><span class=\"v\">$temp</span></li>"
  echo "            <li><span class=\"k\">Flavour</span><span class=\"v\">$flavour</span></li>"
  echo "            <li><span class=\"k\">Served</span><span class=\"v\">$serve</span></li>"
  echo "          </ul>"
  echo "        </div>"
  echo "      </article>"
done

cat <<'EOF'
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap split">
    <div class="reveal">
      <p class="eyebrow">Sides &amp; Sauces</p>
      <h2>What sits beside it</h2>
      <p class="lede">Sides are built to cut through fat, not to compete with it. Sauce always arrives on the side.</p>
    </div>
    <div class="grid grid--2 reveal">
      <div class="card"><h3>House pickles</h3><p>Cucumber and green chilli, sharp enough to reset the palate between slices.</p></div>
      <div class="card"><h3>Charred corn</h3><p>Grilled over the firebox coals, dressed with lemon and sumac.</p></div>
      <div class="card"><h3>Smoked beans</h3><p>Cooked under the brisket rack all day, catching the drippings.</p></div>
      <div class="card"><h3>Two sauces</h3><p>A thin vinegar sauce for poultry, and a dark peppery one for beef.</p></div>
    </div>
  </div>
</section>
EOF
band "Eat it the way it was cooked" "Order a Smoker Box for the table, or book the pit for an event and let the cook happen where people can watch it." "order.html" "Order"
echo "</main>"
foot
} > meat.html
echo "meat.html $(wc -c < meat.html) bytes"
