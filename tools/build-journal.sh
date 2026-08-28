#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh

article_page() { # $1 slug, $2 title, $3 meta, $4 tags-line, $5 body html
{
head_open "$2 — Smoke Journal" "$(printf '%s' "$3" | sed 's/&middot;/-/g')"
nav
cat <<EOF
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="12"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Smoke Journal</p>
    <h1 style="font-size:clamp(2.1rem,5.5vw,4rem);max-width:20ch">$2</h1>
    <p class="post__meta">$3</p>
  </div>
</section>
<section>
  <div class="wrap">
    <article class="article reveal">
$5
      <p style="margin-top:2.5rem" class="tag-cloud">$4</p>
      <p style="margin-top:2rem"><a class="btn btn--ghost" href="journal.html">&larr; All journal entries</a></p>
    </article>
  </div>
</section>
EOF
band "Taste the theory" "Reading about a twelve-hour cook is one thing. Eating it is the argument that actually settles it." "smoker-box.html" "Get the Smoker Box"
echo "</main>"
foot
} > "$1"
}

article_page journal-brisket-12-hours.html "Why brisket takes 12 hours" "Method &middot; 6 min read &middot; Updated 2026" \
'<span class="tag">#Brisket</span> <span class="tag">#Temperature</span> <span class="tag">#Smoking101</span>' \
'      <p class="lede">A brisket is not slow because tradition says so. It is slow because of what the cut is made of, and because the chemistry that makes it good has a speed limit.</p>
      <h2>The cut fights back</h2>
      <p>Brisket comes from the lower chest of the animal, a muscle group that carries a large share of its weight and never stops working. Muscles like that are laced with collagen, the connective protein that holds fibres together. Collagen is what makes the raw cut tough, and it is also the only reason the finished cut is worth eating.</p>
      <p>Below about 70 degrees internal, collagen simply tightens. It behaves like a net closing around the muscle fibres and squeezing moisture out. Cook a brisket quickly and this is where you stop: dry, grey and chewy. Hold it above that temperature for hours and the collagen begins to hydrolyse into gelatin, which is soft, glossy and holds water in the meat instead of pushing it out.</p>
      <h2>The stall is real physics</h2>
      <p>Somewhere around 70 degrees the internal temperature stops climbing. It can sit there for four hours while the chamber runs at a steady 110. Cooks used to blame their equipment.</p>
      <blockquote>The stall is evaporative cooling. The wet surface of the meat is behaving like a wet towel in a warm room, and the energy going in is being spent turning water into vapour rather than raising temperature.</blockquote>
      <p>Once the surface dries enough for evaporation to slow, the temperature climbs again. Wrapping the meat in foil or butcher paper cuts the stall short by stopping the evaporation, at the cost of softening the bark. Butcher paper is the compromise: it breathes just enough.</p>
      <h2>Why heat cannot buy time</h2>
      <p>Collagen conversion depends on both temperature and duration, but the muscle fibres around it are also reacting to heat, and they react faster. Raise the chamber to 175 degrees to finish sooner and the fibres contract hard and expel moisture long before the collagen has finished converting. You reach the finish line with a cut that is technically cooked and practically ruined.</p>
      <h2>What the twelve hours buy</h2>
      <p>Roughly six hours of open smoke to build bark and colour, three to four hours pushing through the stall wrapped, and then at least three hours of rest in a warm cabinet so the temperature evens out and the rendered fat settles back into the muscle. That last stage is unglamorous and it is the one people skip. It is also the difference between good and finished.</p>'

article_page journal-oak-vs-hickory.html "Oak vs hickory: does wood matter?" "Wood &middot; 5 min read &middot; Updated 2026" \
'<span class="tag">#Wood</span> <span class="tag">#Fire</span> <span class="tag">#BBQ</span>' \
'      <p class="lede">Yes, but not nearly as much as how the wood is burning. A clean fire of the wrong wood beats a dirty fire of the right one every single time.</p>
      <h2>What smoke actually is</h2>
      <p>Smoke is what you get when wood does not fully combust. It carries hundreds of compounds, and the ones that matter for flavour are mostly phenols and carbonyls released as lignin and cellulose break down. Different species hold different ratios of those compounds, which is where the flavour differences come from. The differences are real, and they are subtle.</p>
      <h2>Oak</h2>
      <p>Oak is the working wood of Central Texas and the base wood on our rack. It burns hot, steady and long, which matters over twelve hours because every log you add is a temperature disturbance. Its flavour is broadly neutral, more of a foundation than a note. If you can only have one wood, this is it.</p>
      <h2>Hickory</h2>
      <p>Hickory is stronger, with a faint sweetness and a bacon-like edge that people recognise even when they cannot name it. It is easy to overdo. On a twelve-hour brisket, hickory used alone can tip into bitterness, so we run it as maybe a fifth of the fuel alongside oak.</p>
      <h2>Fruit and local woods</h2>
      <p>Cherry and apple are mild and contribute colour as much as taste, deepening the bark to a darker red. Olive and citrus wood, both easy to find in Jordan, sit somewhere between fruitwood and hardwood: savoury, gentle, and a natural match for lamb and poultry. Using them is not a novelty. It is what is dry and available within an hour of the pit.</p>
      <h2>The thing that actually matters</h2>
      <p>Wood must be seasoned, meaning dried for months until its moisture content is low. Green or damp wood smoulders instead of burning, and smouldering produces thick white smoke loaded with creosote. That is the acrid, ashtray flavour people blame on smoking in general. Thin blue smoke, barely visible, is the target, and you get it from dry wood on a small hot fire with plenty of air.</p>
      <blockquote>Choose your wood second. Choose how your fire burns first.</blockquote>'

article_page journal-smoking-vs-grilling.html "Smoking vs grilling" "Basics &middot; 4 min read &middot; Updated 2026" \
'<span class="tag">#Smoking101</span> <span class="tag">#BBQ</span> <span class="tag">#Fire</span>' \
'      <p class="lede">Two crafts that share a fuel and a word in most languages, and almost nothing else. Confusing them is the reason most first attempts at barbecue fail.</p>
      <h2>Grilling: fast, direct, surface work</h2>
      <p>Grilling puts food a few centimetres above burning fuel at 250 degrees or more. Cooking happens in minutes, and everything interesting occurs on the surface: browning, char, and the Maillard reaction that produces the crust on a steak. The inside barely has time to change. This is the right method for tender cuts that need nothing done to their interior.</p>
      <h2>Smoking: slow, indirect, interior work</h2>
      <p>Smoking keeps the fire in a separate chamber and moves hot air and smoke around the food at 110 to 135 degrees. Nothing chars. The entire point is the interior, where collagen slowly converts into gelatin, a change that needs hours at moderate temperature and cannot be forced.</p>
      <h2>The cuts are different too</h2>
      <p>Put a tenderloin in a smoker for eight hours and you get an expensive piece of leather. It has no connective tissue to convert, so time has nothing to work on and only dries it out. Put a whole brisket on a grill and the outside burns while the inside stays tough. Each method has a family of cuts that belongs to it.</p>
      <h2>Where they meet</h2>
      <p>Serious cooks use both in one meal. Chicken is smoked for three hours and then finished briefly over hot coals so the skin crisps. Corn goes directly over the firebox embers while the brisket rests. The line is not a wall, but you should always know which side of it you are on and why.</p>
      <blockquote>Grilling cooks the surface. Smoking cooks the structure.</blockquote>'

article_page journal-american-bbq.html "The story of American barbecue" "History &middot; 6 min read &middot; Updated 2026" \
'<span class="tag">#BBQ</span> <span class="tag">#Brisket</span> <span class="tag">#MeatCuts</span>' \
'      <p class="lede">Barbecue is not one tradition. It is several regional ones, each shaped by the meat that was cheap locally and the people who had to make it taste good.</p>
      <h2>Before the United States</h2>
      <p>The word comes from barbacoa, a Caribbean Taino term for a wooden frame used to cook meat slowly over indirect heat. Spanish colonists carried the word and the technique to the mainland, where it met Indigenous, African and European cooking practices and became something new.</p>
      <h2>The regions</h2>
      <p>The Carolinas built their barbecue on whole hog and vinegar, a thin sharp sauce that cuts pork fat. Memphis narrowed it to ribs and added sweetness. Kansas City, a rail and stockyard city, took every meat available and unified them under a thick tomato and molasses sauce. Central Texas, settled heavily by German and Czech butchers, sold smoked beef out of meat markets on butcher paper with no sauce at all, because a butcher salts and peppers meat and lets it speak.</p>
      <h2>Why brisket</h2>
      <p>Brisket became the Texas icon for an unromantic reason: it was one of the cheapest cuts on the carcass, and it was cheap because nobody knew what to do with it. The technique that redeemed it, long smoke and a long rest, was the invention of people working with what they could afford.</p>
      <blockquote>Almost every great barbecue tradition began with a cut nobody else wanted and someone patient enough to fix it.</blockquote>
      <h2>Whose craft it is</h2>
      <p>American barbecue is inseparable from the Black pitmasters who carried and refined it, first under slavery and then through generations of restaurants and community cooks who kept the method alive while others took the credit. Any honest account of the food starts there.</p>
      <h2>Why it travels</h2>
      <p>The method is portable because its logic is portable: a tough cut, a small clean fire, indirect heat, and time. That translates anywhere there is hardwood and someone willing to wait, which is exactly why it works in Amman with olive wood and local beef.</p>'

article_page journal-smoke-ring.html "How meat develops a smoke ring" "Science &middot; 5 min read &middot; Updated 2026" \
'<span class="tag">#SmokeRing</span> <span class="tag">#Fire</span> <span class="tag">#Temperature</span>' \
'      <p class="lede">The pink band under the bark is the most photographed thing in barbecue and the most misunderstood. It is a chemical marker, not a quality score.</p>
      <h2>What you are looking at</h2>
      <p>Muscle gets its colour from myoglobin, a protein that stores oxygen. Heat normally denatures myoglobin and turns it a dull grey-brown, which is why the inside of a roast is not pink. The smoke ring is the zone where that change was prevented.</p>
      <h2>The reaction</h2>
      <p>Burning wood produces nitrogen dioxide. It dissolves into the moist surface of the meat and forms nitrous acid, which releases nitric oxide. Nitric oxide binds to myoglobin and locks it into a stable pink form that survives cooking. The gas penetrates only a few millimetres before the meat dries and the reaction stops, which is why the ring is a band rather than a gradient through the whole cut.</p>
      <h2>What helps it form</h2>
      <p>A wet surface, a cold start and a live wood or charcoal fire all deepen the ring. A cut that goes on straight from the fridge stays under the critical temperature longer, giving the gas more time to work. Spritzing the surface during the first hours does the same thing.</p>
      <h2>What it does not tell you</h2>
      <p>The ring contributes no flavour. An electric smoker producing genuinely excellent food may show almost no ring, because there is no combustion generating nitrogen dioxide. Meanwhile a ring can be faked with curing salts, which is why competition judges stopped treating it as evidence of anything.</p>
      <blockquote>The ring proves there was a live fire. Everything else on the plate proves whether the cook knew what to do with it.</blockquote>
      <p>We like a deep ring for the same reason anyone does. It looks like the thing it is: evidence that the meat spent its morning inside real smoke.</p>'

{
head_open "Smoke Journal — Smoked Meat Academy" "Notes on fire, wood, cuts and time from the pit at Smoked Meat Academy."
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="16"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Smoke Journal</p>
    <h1>Notes from the pit</h1>
    <p class="lede">Longer answers to the questions that do not fit on a card. Written between cooks, when there is nothing to do but watch a thermometer refuse to move.</p>
  </div>
</section>

<section>
  <div class="wrap">
    <div class="grid grid--3">
      <a class="post reveal" href="journal-brisket-12-hours.html">
        <span class="post__meta">Method &middot; 6 min read</span>
        <h3>Why brisket takes 12 hours</h3>
        <p>Collagen, the stall, and why heat cannot be traded for time.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post reveal" href="journal-oak-vs-hickory.html">
        <span class="post__meta">Wood &middot; 5 min read</span>
        <h3>Oak vs hickory: does wood matter?</h3>
        <p>What each wood contributes, and the thing that matters far more than species.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post reveal" href="journal-smoking-vs-grilling.html">
        <span class="post__meta">Basics &middot; 4 min read</span>
        <h3>Smoking vs grilling</h3>
        <p>Two crafts sharing one word, and why confusing them ruins the first attempt.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post reveal" href="journal-american-bbq.html">
        <span class="post__meta">History &middot; 6 min read</span>
        <h3>The story of American barbecue</h3>
        <p>Regions, cheap cuts, and the pitmasters the method actually belongs to.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
      <a class="post reveal" href="journal-smoke-ring.html">
        <span class="post__meta">Science &middot; 5 min read</span>
        <h3>How meat develops a smoke ring</h3>
        <p>Nitrogen dioxide, myoglobin, and why the pink band proves less than people think.</p>
        <span class="post__more">Read &rarr;</span>
      </a>
    </div>
  </div>
</section>

<section class="section--hair">
  <div class="wrap">
    <div class="reveal" style="max-width:60ch">
      <p class="eyebrow">Smoke Knowledge</p>
      <h2>Short answers</h2>
      <p class="lede">Everything above, compressed. Tap a tag.</p>
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
EOF
band "Stop reading, start eating" "Everything on this page is theory until it is on butcher paper in front of you." "order.html" "Order"
echo "</main>"
foot
} > journal.html
ls -la journal*.html | wc -l
