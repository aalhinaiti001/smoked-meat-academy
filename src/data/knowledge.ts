/** Short answers behind the #tags, shown on the home and journal pages. */
export interface Knowledge { tag: string; title: string; body: string }

export const knowledge: Knowledge[] = [
  {
    tag: 'brisket',
    title: 'Brisket',
    body:
      'Cut from the lower chest. Two muscles, the flat and the point, joined by a seam of fat. It is tough, collagen-heavy meat that only turns tender after long hours between 90 and 96 degrees internal. Trim it to a smooth aerodynamic shape so smoke and heat flow evenly.',
  },
  {
    tag: 'smoking101',
    title: 'Smoking 101',
    body:
      'Low temperature, clean smoke, patience. The chamber sits between 110 and 135 degrees Celsius while the meat climbs slowly. Fat renders, collagen turns to gelatin, and the surface builds a dark crust called bark. Nothing here can be rushed with more heat.',
  },
  {
    tag: 'wood',
    title: 'Wood',
    body:
      'Oak burns steady and neutral, the backbone of most cooks. Hickory is stronger and slightly sweet. Cherry and apple are mild and give colour. Olive and citrus wood, both local to Jordan, sit between fruit and hardwood. Green or damp wood makes bitter smoke, so everything is seasoned and dry.',
  },
  {
    tag: 'fire',
    title: 'Fire',
    body:
      'A small hot fire beats a large smouldering one. Airflow controls temperature, not the amount of fuel. Thin blue smoke means clean combustion. Thick white or grey smoke means the fire is starving and the meat will taste of ash.',
  },
  {
    tag: 'temperature',
    title: 'Temperature',
    body:
      'Two numbers matter: the chamber and the meat. Chamber stays steady. The meat stalls around 70 degrees while moisture evaporates off the surface and cools it. Push through the stall with time or a foil wrap, never with a spike in heat.',
  },
  {
    tag: 'bbq',
    title: 'BBQ',
    body:
      'Barbecue is not grilling. Grilling is fast, direct and hot. Barbecue is indirect heat, wood smoke and hours. Central Texas taught the world to season beef with salt and pepper alone and let fire do the rest, and that is the school this kitchen follows.',
  },
  {
    tag: 'meatcuts',
    title: 'Meat Cuts',
    body:
      'Hard-working muscles carry connective tissue, and connective tissue is what long smoking converts into richness. Brisket, short rib, chuck and shoulder all reward the method. Lean cuts such as tenderloin have nothing to break down and dry out instead.',
  },
  {
    tag: 'smokering',
    title: 'Smoke Ring',
    body:
      'The pink band under the bark is a chemical reaction, not doneness. Nitrogen dioxide from burning wood dissolves into the wet surface and fixes the myoglobin colour before it can turn grey. It is a sign of a live wood fire, not a measure of flavour.',
  },
  {
    tag: 'rub',
    title: 'Rub',
    body:
      'Coarse salt and coarse black pepper in equal parts is the whole recipe for beef. The grind matters more than the list of spices, because coarse particles survive the cook and build texture in the bark. Sugar belongs on pork and chicken, not on a twelve-hour brisket.',
  },
  {
    tag: 'rest',
    title: 'Rest',
    body:
      'Meat pulled straight from the smoker is still cooking and still tense. An hour or more in a warm holding cabinet lets the temperature even out and the rendered fat settle back into the muscle. Skipping the rest undoes the twelve hours before it.',
  },
];
