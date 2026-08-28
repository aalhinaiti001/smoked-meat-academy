#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh
{
head_open "The Process — Smoked Meat Academy" "Five stages from selecting the cut to slicing it: select, season, smoke, rest, serve." "process.html"
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="18"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Smoking Process</p>
    <h1>Fire, then patience</h1>
    <p class="lede">Nothing here is complicated. It is five stages, done in order, with no way to skip one. Scroll and the smoke moves with you.</p>
  </div>
</section>

<section>
  <div class="wrap">
    <div class="process process-rail">
      <article class="step">
        <div><div class="step__no">01</div><p class="step__label">Select</p></div>
        <div>
          <h3>Select</h3>
          <p>The cook is half decided before any fire is lit. Cuts are bought whole and untrimmed so the fat cap, the grain direction and the thickness of the flat can be judged in the kitchen rather than accepted from a supplier.</p>
          <p>Only hard-working muscles go on the rack. Brisket, plate rib, chuck and shoulder all carry connective tissue, and connective tissue is the raw material that long smoking converts into richness. A lean cut has nothing to break down and comes out dry no matter how carefully it is cooked.</p>
          <ul class="spec">
            <li><span class="k">Decided here</span><span class="v">Grade, trim, fat cap thickness</span></li>
            <li><span class="k">Rule</span><span class="v">Buy whole, trim in house</span></li>
          </ul>
        </div>
      </article>
      <article class="step">
        <div><div class="step__no">02</div><p class="step__label">Season</p></div>
        <div>
          <h3>Season</h3>
          <p>Beef gets coarse salt and coarse black pepper in equal parts, and nothing else. The grind is the decision that matters: fine spice dissolves and disappears into the surface, while coarse particles hold their shape through twelve hours and build the texture of the bark.</p>
          <p>Poultry gets a lighter rub and an overnight brine. Sugar stays away from anything that will sit in the chamber for more than a few hours, because it burns long before the meat is ready.</p>
          <ul class="spec">
            <li><span class="k">Beef rub</span><span class="v">Coarse salt, 16-mesh pepper</span></li>
            <li><span class="k">Rest before fire</span><span class="v">1 hour, uncovered</span></li>
          </ul>
        </div>
      </article>
      <article class="step">
        <div><div class="step__no">03</div><p class="step__label">Smoke</p></div>
        <div>
          <h3>Smoke</h3>
          <p>The chamber is loaded at first light and held between 110 and 120 degrees. Airflow, not fuel, sets that number: the firebox intake and the chimney damper together decide how hard the fire pulls. A small hot fire gives thin blue smoke, and thin blue smoke is the only kind that belongs near food.</p>
          <p>Around 70 degrees internal the meat stalls. Moisture evaporating off the surface cools it as fast as the chamber heats it, and the thermometer stops moving for hours. That is physics, not a problem. It gets pushed through with time, or with a tight wrap, never with a spike in heat.</p>
          <ul class="spec">
            <li><span class="k">Chamber</span><span class="v">110–120°C, held steady</span></li>
            <li><span class="k">Smoke</span><span class="v">Thin and blue, never white</span></li>
            <li><span class="k">Door</span><span class="v">Shut. Every opening costs 20 minutes</span></li>
          </ul>
        </div>
      </article>
      <article class="step">
        <div><div class="step__no">04</div><p class="step__label">Rest</p></div>
        <div>
          <h3>Rest</h3>
          <p>Meat pulled straight off the smoker is still cooking and still tense. It goes into a warm holding cabinet at around 60 degrees for at least an hour, and for a full brisket often three or four.</p>
          <p>During the rest the temperature evens out from edge to centre and the rendered fat settles back into the muscle instead of running onto the board. Slicing early undoes the twelve hours that came before it, which is why the counter opens when the meat is ready and not at a scheduled time.</p>
          <ul class="spec">
            <li><span class="k">Holding</span><span class="v">60°C cabinet</span></li>
            <li><span class="k">Minimum</span><span class="v">1 hour, 3+ for brisket</span></li>
          </ul>
        </div>
      </article>
      <article class="step">
        <div><div class="step__no">05</div><p class="step__label">Serve</p></div>
        <div>
          <h3>Serve</h3>
          <p>Sliced to order, against the grain, about the thickness of a pencil. The flat and the point are cut separately because their grains run in different directions and their fat content is not the same.</p>
          <p>It is served on butcher paper with pickles and bread, and sauce always arrives beside it. If the meat needs sauce to be worth eating, the fault is upstream in the cook, not on the table.</p>
          <ul class="spec">
            <li><span class="k">Slice</span><span class="v">Against the grain, pencil thick</span></li>
            <li><span class="k">Sauce</span><span class="v">On the side, always</span></li>
          </ul>
        </div>
      </article>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Questions from the counter</p>
      <h2>The usual doubts</h2>
    </div>
    <div class="acc reveal" style="margin-top:2rem">
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Is smoked meat the same as grilled meat?<span>+</span></button>
        <div class="acc__panel"><p>No. Grilling is direct heat for minutes and cooks the surface hard and fast. Smoking is indirect heat for hours and works on the inside of the muscle. They share a fuel and almost nothing else.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Why is the meat pink inside if it is fully cooked?<span>+</span></button>
        <div class="acc__panel"><p>That band is the smoke ring. Nitrogen dioxide from burning wood dissolves into the wet surface and fixes the colour of the myoglobin before heat can turn it grey. It is a sign of a live wood fire, not of undercooked meat.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Can you cook it faster at a higher temperature?<span>+</span></button>
        <div class="acc__panel"><p>You can cook it faster, but you will not get the same thing. Collagen needs both heat and time to become gelatin. Raise the temperature and the muscle fibres tighten and squeeze out moisture before that conversion finishes.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">Do you use gas or electricity at any point?<span>+</span></button>
        <div class="acc__panel"><p>Only to light the first chimney of charcoal. From there the cook runs on seasoned hardwood, and the temperature is managed by hand with the intake and the stack.</p></div>
      </div>
      <div class="acc__item">
        <button class="acc__btn" type="button" aria-expanded="false">What happens if I ask for it well done?<span>+</span></button>
        <div class="acc__panel"><p>It already is. Barbecue is taken past well done on purpose, to around 96 degrees internal, which is the point where the connective tissue has melted. That is why it is tender rather than dry.</p></div>
      </div>
    </div>
  </div>
</section>
EOF
band "Watch it happen" "Book the pit for an event and the cook runs where your guests can see it, smell it and ask questions while it is still on the rack." "order.html" "Book a cook"
echo "</main>"
foot
} > process.html
echo "process.html $(wc -c < process.html) bytes"
