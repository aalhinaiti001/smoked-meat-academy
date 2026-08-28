#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh
{
head_open "Our Story &amp; The Smoker — Smoked Meat Academy" "Why a smoking house in Jordan, and the machine the whole thing runs on."
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="18"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Our Story</p>
    <h1>Jordan,<br>smoked differently</h1>
    <p class="lede">This country already understands fire and it already understands meat. What it had not had was the third ingredient: time.</p>
  </div>
</section>

<section>
  <div class="wrap split">
    <div class="reveal">
      <h2>Where it started</h2>
      <p>Smoked Meat Academy began as a backyard offset smoker in Amman and a stubborn question. Everything good here is cooked over fire, on a grill, quickly. What happens if you take the same fire and the same quality of meat and give it twelve hours instead of twelve minutes?</p>
      <p>The first briskets were bad. The chamber ran too hot, the wood was too wet, and the meat came off tight and grey. It took a year of cooks, a logbook full of temperatures and a lot of thrown-away beef before the method settled into something that could be repeated on a Tuesday and on a Saturday and get the same result both times.</p>
      <p>What is left is deliberately narrow. A small number of cuts, one method, no fryer, no gas, no menu of forty items. The Academy in the name is not decoration: it is a promise that every plate comes with the reasoning behind it.</p>
    </div>
    <div class="grid reveal">
      <div class="card"><span class="card__num">Principle 01</span><h3>Wood only</h3><p>Charcoal to light it, seasoned hardwood to run it. Nothing else touches the fire.</p></div>
      <div class="card"><span class="card__num">Principle 02</span><h3>Whole cuts</h3><p>Bought whole, trimmed here, so the cook owns every decision from the butcher onwards.</p></div>
      <div class="card"><span class="card__num">Principle 03</span><h3>Ready is a time</h3><p>The counter opens when the brisket says so. A schedule cannot rush collagen.</p></div>
      <div class="card"><span class="card__num">Principle 04</span><h3>Local wood</h3><p>Olive and citrus from Jordanian orchards sit on the rack next to imported oak.</p></div>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">The Smoker</p>
      <h2>Meet the smoker</h2>
      <p class="lede">A reverse-flow offset smoker, built from 6&nbsp;mm steel. Tap a number to see what each part does.</p>
    </div>
    <div class="split" style="margin-top:2.5rem">
      <div class="smoker-diagram reveal">
EOF
smoker_svg
cat <<'EOF'
      </div>
      <div class="reveal">
        <div class="hotspot-readout"><h3>Cooking Chamber</h3><p>Select a point on the diagram.</p></div>
        <ul class="spec" style="margin-top:1.5rem">
          <li><span class="k">Type</span><span class="v">Reverse-flow offset</span></li>
          <li><span class="k">Steel</span><span class="v">6 mm, for heat stability</span></li>
          <li><span class="k">Fuel</span><span class="v">Seasoned oak, hickory, olive, citrus</span></li>
          <li><span class="k">Working range</span><span class="v">110–135°C</span></li>
          <li><span class="k">Longest cook</span><span class="v">14 hours</span></li>
          <li><span class="k">Control</span><span class="v">By hand, intake and stack</span></li>
        </ul>
      </div>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap split">
    <div class="reveal">
      <h2>Why this design</h2>
      <p>In a reverse-flow smoker the heat and smoke travel the full length of the barrel underneath a baffle plate before turning back over the meat. The result is an even chamber with no fierce hot spot next to the firebox, which is what makes a twelve-hour cook repeatable rather than lucky.</p>
      <p>Thick steel does the other half of the work. Heavy walls hold their temperature when the door is opened and when a log is added, so the meat never rides a rollercoaster of spikes and dips. Thin steel is cheaper and needs constant nursing.</p>
      <p>There is no digital controller. Temperature is read from two probes and managed by hand, which sounds romantic but is really just the most reliable way to notice when a fire is going dirty.</p>
    </div>
    <div class="reveal">
      <div class="card">
        <span class="card__num">Wood profile</span>
        <h3>What each wood gives</h3>
        <ul class="spec" style="border-top:0;padding-top:0">
          <li><span class="k">Oak</span><span class="v">Steady, neutral, long burning</span></li>
          <li><span class="k">Hickory</span><span class="v">Strong, faintly sweet, for beef</span></li>
          <li><span class="k">Cherry</span><span class="v">Mild, adds colour to the bark</span></li>
          <li><span class="k">Olive</span><span class="v">Local, savoury, suits lamb</span></li>
          <li><span class="k">Citrus</span><span class="v">Light and bright, for poultry</span></li>
        </ul>
      </div>
    </div>
  </div>
</section>
EOF
band "Come stand by the fire" "Bookings, questions, wholesale and events all reach the same place, and the reply comes from someone who was at the pit that morning." "order.html" "Get in touch"
echo "</main>"
foot
} > story.html
echo "story.html $(wc -c < story.html) bytes"
