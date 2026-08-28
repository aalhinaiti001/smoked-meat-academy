#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
. tools/parts.sh
{
head_open "Order — Smoked Meat Academy" "Reserve a Smoker Box, book catering, or bring the pit to your event in Jordan."
nav
cat <<'EOF'
<main id="main">
<section class="page-hero">
  <div class="smoke-veil"></div>
  <div class="ember-field" data-embers="22"></div>
  <div class="wrap page-hero__inner">
    <p class="eyebrow">Order</p>
    <h1>Reserve the fire</h1>
    <p class="lede">Boxes are cooked to order and go out in limited numbers each day. Catering runs on the same pit, either delivered hot or cooked live where your guests can see it.</p>
  </div>
</section>

<section>
  <div class="wrap split" style="align-items:start">
    <div class="reveal">
      <h2>Send a request</h2>
      <p>Tell us the date, the number of people and what you want on the paper. We reply within a day with availability and a confirmed price.</p>
      <form class="form" data-order-form novalidate>
        <div class="form__row">
          <div class="field">
            <label for="name">Name</label>
            <input id="name" name="name" type="text" autocomplete="name" required>
          </div>
          <div class="field">
            <label for="phone">Phone</label>
            <input id="phone" name="phone" type="tel" autocomplete="tel">
          </div>
        </div>
        <div class="field">
          <label for="email">Email</label>
          <input id="email" name="email" type="email" autocomplete="email">
        </div>
        <div class="form__row">
          <div class="field">
            <label for="type">What do you need</label>
            <select id="type" name="type">
              <option>Smoker Box &mdash; The Pair (2)</option>
              <option selected>Smoker Box &mdash; The Table (4&ndash;6)</option>
              <option>Smoker Box &mdash; The Gathering (8&ndash;10)</option>
              <option>Catering, delivered hot</option>
              <option>Live pit at my event</option>
              <option>Something else</option>
            </select>
          </div>
          <div class="field">
            <label for="date">Date</label>
            <input id="date" name="date" type="date">
          </div>
        </div>
        <div class="form__row">
          <div class="field">
            <label for="people">People</label>
            <input id="people" name="people" type="number" min="1" step="1" value="6">
          </div>
          <div class="field">
            <label for="area">Area</label>
            <input id="area" name="area" type="text" placeholder="Amman, Abdoun&hellip;">
          </div>
        </div>
        <div class="field">
          <label for="notes">Notes</label>
          <textarea id="notes" name="notes" rows="4" placeholder="Cuts you want, timing, anything we should know."></textarea>
        </div>
        <p class="form__status" role="status" aria-live="polite"></p>
        <p><button class="btn" type="submit"><span class="btn__spark">&#9650;</span>Send request</button></p>
        <p class="form__note">This form is not wired to a backend yet. Until it is, reach us on the phone or email below and nothing is lost.</p>
      </form>
    </div>
    <div class="reveal">
      <div class="card">
        <span class="card__num">Direct</span>
        <h3>Reach the pit</h3>
        <ul class="spec" style="border-top:0;padding-top:0">
          <li><span class="k">Phone</span><span class="v"><a href="tel:+96200000000" style="color:inherit">+962 0 0000 0000</a></span></li>
          <li><span class="k">Email</span><span class="v"><a href="mailto:hello@smokedmeat.academy" style="color:inherit">hello@smokedmeat.academy</a></span></li>
          <li><span class="k">Base</span><span class="v">Amman, Jordan</span></li>
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
band "Fire is already lit" "If you are reading this in the morning, something is on the rack right now. Ask what it is." "mailto:hello@smokedmeat.academy" "Email us"
echo "</main>"
foot
} > order.html
echo "order.html $(wc -c < order.html) bytes"
