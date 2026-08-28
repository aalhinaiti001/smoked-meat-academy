#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh

{
head_open "Smoked Meat Academy — Smoke. Fire. Meat." "A meat-smoking concept built around fire, time and patience, bringing authentic smoked meat culture to Jordan."
nav
cat <<'EOF'
<main id="main">

<section class="hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="26"></div>
  <div class="wrap hero__inner">
    <p class="eyebrow">Jordan &middot; Low and Slow &middot; Wood Fired</p>
    <h1>Smoke.<br>Fire.<br><em>Meat.</em></h1>
    <p class="lede hero__lede">A meat-smoking concept built around fire, time and patience &mdash; bringing authentic smoked meat culture to Jordan. No shortcuts, no gas, no rush. Just hardwood, a steady chamber and the hours it takes.</p>
    <div class="hero__cta">
      <a class="btn" href="process.html"><span class="btn__spark">&#9650;</span>Explore the Smoke</a>
      <a class="btn btn--ghost" href="smoker-box.html">The Smoker Box</a>
    </div>
    <div class="hero__meta">
      <div><b>12h</b>Brisket cook</div>
      <div><b>110&deg;C</b>Chamber, held steady</div>
      <div><b>3</b>Woods on the rack</div>
      <div><b>0</b>Shortcuts</div>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap split">
    <div class="reveal">
      <p class="eyebrow">The Smoker Story</p>
      <h2>What is a smoker?</h2>
      <p class="lede">A smoker is not a grill. A grill puts food directly over fire and cooks it in minutes. A smoker keeps the fire in a separate chamber and lets heat and wood smoke travel slowly around the meat for hours.</p>
      <p>That separation is the whole idea. Cooking at 110 to 135 degrees gives collagen the time it needs to melt into gelatin, which is what turns a tough working muscle into something you can pull apart with a fork. Push the heat higher to save time and the muscle tightens and dries instead.</p>
      <p><a class="btn btn--ghost" href="process.html">See the five stages</a></p>
    </div>
    <div class="grid reveal">
      <div class="card">
        <span class="card__num">01 / Heat</span>
        <h3>Indirect and steady</h3>
        <p>Fire lives in the firebox. The meat never sees a flame, only the hot air and smoke that pass over it on the way to the chimney.</p>
      </div>
      <div class="card">
        <span class="card__num">02 / Time</span>
        <h3>Hours, not minutes</h3>
        <p>Six hours for ribs, twelve or more for a full brisket. The clock is an ingredient, and the stall around 70 degrees is part of the plan.</p>
      </div>
      <div class="card">
        <span class="card__num">03 / Wood</span>
        <h3>Seasoned hardwood</h3>
        <p>Oak for the backbone, hickory for depth, local olive and citrus wood for a lighter, sweeter edge. Dry wood only, thin blue smoke only.</p>
      </div>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">The Meat</p>
      <h2>Cuts that reward patience</h2>
      <p class="lede">Every cut on the rack is chosen because it has connective tissue to break down. Read the cut, the wood, the temperature and the hours before you ever read a price.</p>
    </div>
    <div class="grid grid--3 reveal" style="margin-top:2.5rem">
      <a class="post" href="meat.html">
        <span class="post__meta">Beef &middot; 12 hours</span>
        <h3>Brisket</h3>
        <p>Salt, pepper, oak. The cut that the whole method was built around.</p>
        <span class="post__more">View the cut &rarr;</span>
      </a>
      <a class="post" href="meat.html">
        <span class="post__meta">Beef &middot; 7 hours</span>
        <h3>Short Ribs</h3>
        <p>Heavy bone, heavy marbling, a bark you can hear when you cut it.</p>
        <span class="post__more">View the cut &rarr;</span>
      </a>
      <a class="post" href="meat.html">
        <span class="post__meta">Poultry &middot; 3 hours</span>
        <h3>Smoked Chicken</h3>
        <p>Brined overnight, smoked over citrus wood, finished hot for the skin.</p>
        <span class="post__more">View the cut &rarr;</span>
      </a>
    </div>
    <p style="margin-top:2rem"><a class="btn btn--ghost" href="meat.html">See all cuts</a></p>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Smoking Process</p>
      <h2>Five stages, one direction</h2>
    </div>
    <div class="process process-rail" style="margin-top:1rem">
      <article class="step">
        <div><div class="step__no">01</div><p class="step__label">Select</p></div>
        <div><h3>Select</h3><p>The cook starts at the butcher. Grade, thickness and fat cap decide everything that follows, so cuts are chosen whole and trimmed in house rather than bought ready to cook.</p></div>
      </article>
      <article class="step">
        <div><div class="step__no">02</div><p class="step__label">Season</p></div>
        <div><h3>Season</h3><p>Coarse salt and coarse black pepper for beef, a lighter rub for poultry and sausage. The grind matters more than the spice list, because coarse particles survive the hours and build the bark.</p></div>
      </article>
      <article class="step">
        <div><div class="step__no">03</div><p class="step__label">Smoke</p></div>
        <div><h3>Smoke</h3><p>Into the chamber at first light. Thin blue smoke, a steady 110 to 120 degrees, and the door stays shut. Every time it opens the cook loses twenty minutes.</p></div>
      </article>
      <article class="step">
        <div><div class="step__no">04</div><p class="step__label">Rest</p></div>
        <div><h3>Rest</h3><p>Off the smoker and into a warm holding cabinet for an hour or more. The temperature evens out, the rendered fat settles back into the muscle, and the meat relaxes.</p></div>
      </article>
      <article class="step">
        <div><div class="step__no">05</div><p class="step__label">Serve</p></div>
        <div><h3>Serve</h3><p>Sliced against the grain, thickness of a pencil, served on butcher paper. Sauce on the side, never on top, because the meat should not need it.</p></div>
      </article>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Smoke Knowledge</p>
      <h2>Pick a thread, pull it</h2>
      <p class="lede">Short answers to the things people ask across the counter. Tap a tag.</p>
    </div>
    <div class="tag-cloud reveal" style="margin-top:2rem">
      <button class="tag" type="button" data-tag="brisket">#Brisket</button>
      <button class="tag" type="button" data-tag="smoking101">#Smoking101</button>
      <button class="tag" type="button" data-tag="wood">#Wood</button>
      <button class="tag" type="button" data-tag="fire">#Fire</button>
      <button class="tag" type="button" data-tag="temperature">#Temperature</button>
      <button class="tag" type="button" data-tag="bbq">#BBQ</button>
      <button class="tag" type="button" data-tag="meatcuts">#MeatCuts</button>
      <button class="tag" type="button" data-tag="smokering">#SmokeRing</button>
      <button class="tag" type="button" data-tag="rub">#Rub</button>
      <button class="tag" type="button" data-tag="rest">#Rest</button>
    </div>
    <div class="knowledge-panel reveal"><h3>Brisket</h3><p>Tap a tag to read more.</p></div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap split">
    <div class="box-visual reveal">
EOF
box_svg
cat <<'EOF'
    </div>
    <div class="reveal">
      <p class="eyebrow">The Smoker Box</p>
      <h2>A whole cook, boxed</h2>
      <p class="lede">Meat, sides, sauces and heating instructions packed the way a pitmaster would hand it to you. Built for a table of four to six, opened at home, finished in fifteen minutes.</p>
      <p>Sliced brisket and short rib, pulled beef, two sides, house pickles, two sauces and butcher paper to serve on. Everything is cooked the same morning and packed warm.</p>
      <p><a class="btn" href="smoker-box.html"><span class="btn__spark">&#9650;</span>Get the Smoker Box</a></p>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Smoke Journal</p>
      <h2>Reading between the hours</h2>
    </div>
    <div class="grid grid--3 reveal" style="margin-top:2.5rem">
      <a class="post" href="journal-brisket-12-hours.html">
        <span class="post__meta">Method &middot; 6 min read</span>
        <h3>Why brisket takes 12 hours</h3>
        <p>Collagen, the stall, and why heat cannot be traded for time.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post" href="journal-oak-vs-hickory.html">
        <span class="post__meta">Wood &middot; 5 min read</span>
        <h3>Oak vs hickory: does wood matter?</h3>
        <p>What each wood actually contributes, and what it does not.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post" href="journal-smoking-vs-grilling.html">
        <span class="post__meta">Basics &middot; 4 min read</span>
        <h3>Smoking vs grilling</h3>
        <p>Two different crafts that share a word and almost nothing else.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
    </div>
    <p style="margin-top:2rem"><a class="btn btn--ghost" href="journal.html">All journal entries</a></p>
  </div>
</section>

EOF
band "Come for the smoke" "The chamber is loaded before sunrise and the counter opens when the brisket is ready, not a minute before. Reserve a box or book a cook for your table." "order.html" "Order"
cat <<'EOF'
</main>
EOF
foot
} > index.html
echo "index.html $(wc -c < index.html) bytes"
