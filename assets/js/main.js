/* Smoked Meat Academy — site behaviour.
   Everything degrades gracefully: with JS off the content is still readable. */
(function () {
  'use strict';

  var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* ---- mobile navigation ------------------------------------------------ */
  var toggle = document.querySelector('.nav__toggle');
  var links = document.querySelector('.nav__links');
  if (toggle && links) {
    var closeNav = function (refocus) {
      links.classList.remove('is-open');
      toggle.setAttribute('aria-expanded', 'false');
      if (refocus) { toggle.focus(); }
    };
    toggle.addEventListener('click', function () {
      var open = links.classList.toggle('is-open');
      toggle.setAttribute('aria-expanded', String(open));
      if (open) {
        var first = links.querySelector('a');
        if (first) { first.focus(); }
      }
    });
    links.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') { closeNav(false); }
    });
    document.addEventListener('keydown', function (e) {
      if (e.key === 'Escape' && links.classList.contains('is-open')) { closeNav(true); }
    });
  }

  /* ---- mark the current page in the nav --------------------------------- */
  var here = location.pathname.split('/').pop() || 'index.html';
  Array.prototype.forEach.call(document.querySelectorAll('.nav__links a'), function (a) {
    if (a.getAttribute('href') === here) { a.setAttribute('aria-current', 'page'); }
  });

  /* ---- drifting embers --------------------------------------------------- */
  function seedEmbers(field) {
    var count = Number(field.dataset.embers || 18);
    if (reduceMotion) { count = Math.min(count, 6); }
    var frag = document.createDocumentFragment();
    for (var i = 0; i < count; i++) {
      var e = document.createElement('span');
      e.className = 'ember';
      e.style.left = (Math.random() * 100).toFixed(2) + '%';
      e.style.animationDuration = (7 + Math.random() * 11).toFixed(2) + 's';
      e.style.animationDelay = (-Math.random() * 12).toFixed(2) + 's';
      e.style.setProperty('--drift', (Math.random() * 120 - 60).toFixed(0) + 'px');
      var s = (1 + Math.random() * 2.4).toFixed(1);
      e.style.width = s + 'px';
      e.style.height = s + 'px';
      frag.appendChild(e);
    }
    field.appendChild(frag);
  }
  Array.prototype.forEach.call(document.querySelectorAll('.ember-field'), seedEmbers);

  /* ---- reveal on scroll -------------------------------------------------- */
  var revealables = document.querySelectorAll('.reveal, .step');
  if ('IntersectionObserver' in window && revealables.length) {
    var io = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add('is-visible');
          io.unobserve(entry.target);
        }
      });
    }, { threshold: 0.15, rootMargin: '0px 0px -8% 0px' });
    Array.prototype.forEach.call(revealables, function (el) { io.observe(el); });
  } else {
    Array.prototype.forEach.call(revealables, function (el) { el.classList.add('is-visible'); });
  }

  /* ---- meat catalogue filter -------------------------------------------- */
  var meatFilters = document.querySelectorAll('[data-filter]');
  var meatCards = document.querySelectorAll('.meat-card');
  if (meatFilters.length && meatCards.length) {
    Array.prototype.forEach.call(meatFilters, function (btn) {
      btn.addEventListener('click', function () {
        var want = btn.dataset.filter;
        Array.prototype.forEach.call(meatFilters, function (b) {
          b.classList.toggle('is-active', b === btn);
          b.setAttribute('aria-pressed', String(b === btn));
        });
        Array.prototype.forEach.call(meatCards, function (card) {
          var tags = (card.dataset.tags || '').split(/\s+/);
          card.hidden = !(want === 'all' || tags.indexOf(want) !== -1);
        });
      });
    });
  }

  /* ---- smoke knowledge tags --------------------------------------------- */
  var knowledge = {
    brisket: {
      title: 'Brisket',
      body: 'Cut from the lower chest. Two muscles, the flat and the point, joined by a seam of fat. It is tough, collagen-heavy meat that only turns tender after long hours between 90 and 96 degrees internal. Trim it to a smooth aerodynamic shape so smoke and heat flow evenly.'
    },
    smoking101: {
      title: 'Smoking 101',
      body: 'Low temperature, clean smoke, patience. The chamber sits between 110 and 135 degrees Celsius while the meat climbs slowly. Fat renders, collagen turns to gelatin, and the surface builds a dark crust called bark. Nothing here can be rushed with more heat.'
    },
    wood: {
      title: 'Wood',
      body: 'Oak burns steady and neutral, the backbone of most cooks. Hickory is stronger and slightly sweet. Cherry and apple are mild and give colour. Olive and citrus wood, both local to Jordan, sit between fruit and hardwood. Green or damp wood makes bitter smoke, so everything is seasoned and dry.'
    },
    fire: {
      title: 'Fire',
      body: 'A small hot fire beats a large smouldering one. Airflow controls temperature, not the amount of fuel. Thin blue smoke means clean combustion. Thick white or grey smoke means the fire is starving and the meat will taste of ash.'
    },
    temperature: {
      title: 'Temperature',
      body: 'Two numbers matter: the chamber and the meat. Chamber stays steady. The meat stalls around 70 degrees while moisture evaporates off the surface and cools it. Push through the stall with time or a foil wrap, never with a spike in heat.'
    },
    bbq: {
      title: 'BBQ',
      body: 'Barbecue is not grilling. Grilling is fast, direct and hot. Barbecue is indirect heat, wood smoke and hours. Central Texas taught the world to season beef with salt and pepper alone and let fire do the rest, and that is the school this kitchen follows.'
    },
    meatcuts: {
      title: 'Meat Cuts',
      body: 'Hard-working muscles carry connective tissue, and connective tissue is what long smoking converts into richness. Brisket, short rib, chuck and shoulder all reward the method. Lean cuts such as tenderloin have nothing to break down and dry out instead.'
    },
    smokering: {
      title: 'Smoke Ring',
      body: 'The pink band under the bark is a chemical reaction, not doneness. Nitrogen dioxide from burning wood dissolves into the wet surface and fixes the myoglobin colour before it can turn grey. It is a sign of a live wood fire, not a measure of flavour.'
    },
    rub: {
      title: 'Rub',
      body: 'Coarse salt and coarse black pepper in equal parts is the whole recipe for beef. The grind matters more than the list of spices, because coarse particles survive the cook and build texture in the bark. Sugar belongs on pork and chicken, not on a twelve-hour brisket.'
    },
    rest: {
      title: 'Rest',
      body: 'Meat pulled straight from the smoker is still cooking and still tense. An hour or more in a warm holding cabinet lets the temperature even out and the rendered fat settle back into the muscle. Skipping the rest undoes the twelve hours before it.'
    }
  };
  var tagButtons = document.querySelectorAll('[data-tag]');
  var panel = document.querySelector('.knowledge-panel');
  if (tagButtons.length && panel) {
    var showTag = function (key, btn) {
      var item = knowledge[key];
      if (!item) { return; }
      panel.innerHTML = '<h3></h3><p></p>';
      panel.querySelector('h3').textContent = item.title;
      panel.querySelector('p').textContent = item.body;
      Array.prototype.forEach.call(tagButtons, function (b) {
        b.classList.toggle('is-active', b === btn);
        b.setAttribute('aria-pressed', String(b === btn));
      });
    };
    Array.prototype.forEach.call(tagButtons, function (btn) {
      btn.addEventListener('click', function () { showTag(btn.dataset.tag, btn); });
    });
    showTag(tagButtons[0].dataset.tag, tagButtons[0]);
  }

  /* ---- accordion --------------------------------------------------------- */
  Array.prototype.forEach.call(document.querySelectorAll('.acc__btn'), function (btn) {
    btn.addEventListener('click', function () {
      var item = btn.closest('.acc__item');
      var open = item.classList.toggle('is-open');
      btn.setAttribute('aria-expanded', String(open));
      btn.querySelector('span').textContent = open ? '–' : '+';
    });
  });

  /* ---- smoker diagram hotspots ------------------------------------------ */
  var hotspots = document.querySelectorAll('.hotspot');
  var readout = document.querySelector('.hotspot-readout');
  if (hotspots.length && readout) {
    var showSpot = function (spot) {
      readout.innerHTML = '<h3></h3><p></p>';
      readout.querySelector('h3').textContent = spot.dataset.title || '';
      readout.querySelector('p').textContent = spot.dataset.body || '';
      Array.prototype.forEach.call(hotspots, function (s) {
        s.classList.toggle('is-active', s === spot);
      });
    };
    Array.prototype.forEach.call(hotspots, function (spot) {
      spot.addEventListener('click', function () { showSpot(spot); });
      spot.addEventListener('keydown', function (e) {
        if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); showSpot(spot); }
      });
    });
    showSpot(hotspots[0]);
  }

  /* ---- footer year ------------------------------------------------------- */
  Array.prototype.forEach.call(document.querySelectorAll('[data-year]'), function (el) {
    el.textContent = new Date().getFullYear();
  });
})();
