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
  Array.prototype.forEach.call(document.querySelectorAll('.knowledge-panel'), function (panel) {
    var scope = panel.closest('section') || document;
    var tagButtons = scope.querySelectorAll('[data-tag]');
    if (!tagButtons.length) { return; }
    var showTag = function (btn) {
      panel.querySelector('h3').textContent = btn.dataset.title || '';
      panel.querySelector('p').textContent = btn.dataset.body || '';
      Array.prototype.forEach.call(tagButtons, function (b) {
        b.classList.toggle('is-active', b === btn);
        b.setAttribute('aria-pressed', String(b === btn));
      });
    };
    Array.prototype.forEach.call(tagButtons, function (btn) {
      btn.addEventListener('click', function () { showTag(btn); });
    });
  });

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
