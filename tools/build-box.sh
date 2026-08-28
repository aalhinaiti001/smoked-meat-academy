#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh
{
head_open "The Smoker Box — Smoked Meat Academy" "A full smoked meat cook packed to travel: meat, sides, sauces, pickles and heating instructions for four to six people."
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="20"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Smoker Box</p>
    <h1>The Smoker Box</h1>
    <p class="lede">The whole pit, packed flat and sent to your table. Cooked the same morning, packed warm, and built so the last slice is as good as the first.</p>
  </div>
</section>

<section>
  <div class="wrap box-hero">
    <div class="box-visual reveal">
EOF
box_svg
cat <<'EOF'
    </div>
    <div class="reveal">
      <p class="eyebrow">What's inside</p>
      <h2>Everything, in order</h2>
      <ul class="contents">
        <li><span><b>Sliced brisket, 600&nbsp;g.</b> Flat and point, cut to order, wrapped in butcher paper.</span></li>
        <li><span><b>Beef short rib, 2 bones.</b> Left whole so they stay hot on the way.</span></li>
        <li><span><b>Pulled beef, 400&nbsp;g.</b> Chuck, smoked nine hours and pulled by hand.</span></li>
        <li><span><b>Two house sausages.</b> Coarse ground, hickory smoked, casing intact.</span></li>
        <li><span><b>Two sides.</b> Smoked beans cooked under the brisket rack, and charred corn with sumac.</span></li>
        <li><span><b>House pickles.</b> Cucumber and green chilli, sharp on purpose.</span></li>
        <li><span><b>Two sauces.</b> Thin vinegar for poultry, dark and peppery for beef. Both on the side.</span></li>
        <li><span><b>Bread and butcher paper.</b> Serve straight from the paper, the way it comes off the pit.</span></li>
      </ul>
      <p style="margin-top:1.8rem" class="price-tag">JOD 68 <small>Serves 4–6</small></p>
      <p><a class="btn" href="order.html"><span class="btn__spark">&#9650;</span>Get the Smoker Box</a></p>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Portions</p>
      <h2>Three sizes</h2>
      <p class="lede">Same cook, same packing, different weight on the scale.</p>
    </div>
    <div class="grid grid--3 reveal" style="margin-top:2.5rem">
      <div class="card">
        <span class="card__num">Box 01</span>
        <h3>The Pair</h3>
        <p>Brisket, one short rib, one side, pickles and sauce. For two people who want the full method without the leftovers.</p>
        <p class="price-tag">JOD 32 <small>Serves 2</small></p>
      </div>
      <div class="card">
        <span class="card__num">Box 02</span>
        <h3>The Table</h3>
        <p>The full box described above. Four cuts, two sides, both sauces. The default, and the one most people come back for.</p>
        <p class="price-tag">JOD 68 <small>Serves 4–6</small></p>
      </div>
      <div class="card">
        <span class="card__num">Box 03</span>
        <h3>The Gathering</h3>
        <p>Double meat, three sides, extra bread and a whole smoked chicken. Built for a house full of people.</p>
        <p class="price-tag">JOD 125 <small>Serves 8–10</small></p>
      </div>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap split">
    <div class="reveal">
      <p class="eyebrow">Packaging</p>
      <h2>Packed to survive the drive</h2>
      <p>Meat goes into the box in butcher paper, not plastic, so the bark keeps its texture instead of steaming soft. Each cut is wrapped separately and kept whole wherever possible, because a whole piece holds heat far better than slices.</p>
      <p>Sides and sauces travel in their own sealed containers on a lower deck, away from the hot meat. The outer box is insulated and closed with a tamper seal, and it will hold serving temperature for around ninety minutes.</p>
    </div>
    <div class="reveal">
      <p class="eyebrow">Heating instructions</p>
      <h2>If it has gone cold</h2>
      <ul class="spec" style="border-top:0;padding-top:0">
        <li><span class="k">Oven</span><span class="v">150°C, foil covered, 20 minutes</span></li>
        <li><span class="k">Sliced brisket</span><span class="v">Splash of stock, foil, 12 minutes</span></li>
        <li><span class="k">Short ribs</span><span class="v">Whole, foil, 25 minutes</span></li>
        <li><span class="k">Sausages</span><span class="v">Dry pan, 3 minutes, turned</span></li>
        <li><span class="k">Never</span><span class="v">Microwave the bark</span></li>
      </ul>
      <p style="margin-top:1.5rem" class="form__note">Sides reheat in the same oven at the same time. Sauces and pickles stay cold.</p>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Serving</p>
      <h2>How to put it on the table</h2>
    </div>
    <div class="acc reveal" style="margin-top:2rem">
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Serve on the paper<span>+</span></button>
        <div class="acc__panel"><p>Open the butcher paper flat in the middle of the table and lay the cuts straight onto it. Plates are optional and the paper catches the rendered fat, which is where a lot of the flavour is.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Slice the ribs last<span>+</span></button>
        <div class="acc__panel"><p>Short ribs stay hotter and juicier whole. Cut between the bones at the table, right before people eat them.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Sauce on the side<span>+</span></button>
        <div class="acc__panel"><p>Pour a little onto the paper beside the meat rather than over it. The bark took twelve hours to build and sauce dissolves it in seconds.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Leftovers<span>+</span></button>
        <div class="acc__panel"><p>Refrigerate within two hours, wrapped tight. Pulled beef and brisket both improve the next day in a sandwich, warmed gently with a spoonful of stock.</p></div>
      </div>
    </div>
  </div>
</section>
EOF
band "Get the Smoker Box" "Boxes are built to the day's cook and go out in limited numbers. Reserve yours and we confirm the pickup or delivery window by phone." "order.html" "Reserve a box"
echo "</main>"
foot
} > smoker-box.html
echo "smoker-box.html $(wc -c < smoker-box.html) bytes"
