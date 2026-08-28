#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh
{
head_open "Order — Smoked Meat Academy" "Reserve a Smoker Box, ask about catering, or book a live-pit event in Jordan by phone or email." "order.html"
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="22"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Order</p>
    <h1>Reserve the fire</h1>
    <p class="lede">Boxes are cooked to order and go out in limited numbers each day. Call or email with the date, number of people and what you want on the paper.</p>
  </div>
</section>

<section>
  <div class="wrap split" style="align-items:start">
    <div class="reveal">
      <h2>Order directly</h2>
      <p>Use the monitored phone number or mailbox below. We will confirm availability, timing and price directly; submitting this website never creates an order on its own.</p>
      <div class="card" style="margin-top:1.5rem">
        <span class="card__num">Direct</span>
        <h3>Reach the pit</h3>
        <p><a class="btn" href="tel:+962781560495"><span class="btn__spark">&#9650;</span>Call +962 78 156 0495</a></p>
        <p><a class="btn btn--ghost" href="mailto:smokedmeatacademy@yandex.com?subject=Smoked%20Meat%20Academy%20order%20request">Email an order request</a></p>
        <p class="form__note">Include your preferred date, number of people, area and any cuts you want. An order is confirmed only after we reply.</p>
      </div>
    </div>
    <div class="reveal">
      <div class="card">
        <span class="card__num">Contact</span>
        <h3>Built in Amman</h3>
        <ul class="spec" style="border-top:0;padding-top:0">
          <li><span class="k">Location</span><span class="v">Amman, Jordan</span></li>
          <li><span class="k">Mobile</span><span class="v"><a href="tel:+962781560495" style="color:inherit">+962 78 156 0495</a></span></li>
          <li><span class="k">Email</span><span class="v"><a href="mailto:smokedmeatacademy@yandex.com" style="color:inherit">smokedmeatacademy@yandex.com</a></span></li>
        </ul>
      </div>
      <div class="card" style="margin-top:1.5rem">
        <span class="card__num">Timing</span>
        <h3>How far ahead</h3>
        <ul class="spec" style="border-top:0;padding-top:0">
          <li><span class="k">Smoker Box</span><span class="v">48 hours notice</span></li>
          <li><span class="k">Catering</span><span class="v">5 days notice</span></li>
          <li><span class="k">Live pit</span><span class="v">2 weeks notice</span></li>
          <li><span class="k">Pickup</span><span class="v">From 4pm, when the rest is done</span></li>
        </ul>
      </div>
      <div class="card" style="margin-top:1.5rem">
        <span class="card__num">Note</span>
        <h3>Why we cannot rush</h3>
        <p>A brisket ordered this morning cannot be on your table this evening. The cook is twelve hours and the rest is three more. Everything on this page is scheduled around that, not around convenience.</p>
      </div>
    </div>
  </div>
</section>
EOF
band "Fire is already lit" "Call with your date and table size, or email the details and we will confirm what the pit can take." "tel:+962781560495" "Call the pit"
echo "</main>"
foot
} > order.html
echo "order.html $(wc -c < order.html) bytes"
