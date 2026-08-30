/** The five stages, used in full on /process and in short on the home page. */
export interface Stage {
  no: string;
  label: string;
  short: string;
  body: string[];
  spec?: [string, string][];
}

export const stages: Stage[] = [
  {
    no: '01',
    label: 'Select',
    short:
      'The cook starts at the butcher. Grade, thickness and fat cap decide everything that follows, so cuts are chosen whole and trimmed in house rather than bought ready to cook.',
    body: [
      'The cook is half decided before any fire is lit. Cuts are bought whole and untrimmed so the fat cap, the grain direction and the thickness of the flat can be judged in the kitchen rather than accepted from a supplier.',
      'Only hard-working muscles go on the rack. Brisket, plate rib, chuck and shoulder all carry connective tissue, and connective tissue is the raw material that long smoking converts into richness. A lean cut has nothing to break down and comes out dry no matter how carefully it is cooked.',
    ],
    spec: [
      ['Decided here', 'Grade, trim, fat cap thickness'],
      ['Rule', 'Buy whole, trim in house'],
    ],
  },
  {
    no: '02',
    label: 'Season',
    short:
      'Coarse salt and coarse black pepper for beef, a lighter rub for poultry and sausage. The grind matters more than the spice list, because coarse particles survive the hours and build the bark.',
    body: [
      'Beef gets coarse salt and coarse black pepper in equal parts, and nothing else. The grind is the decision that matters: fine spice dissolves and disappears into the surface, while coarse particles hold their shape through twelve hours and build the texture of the bark.',
      'Poultry gets a lighter rub and an overnight brine. Sugar stays away from anything that will sit in the chamber for more than a few hours, because it burns long before the meat is ready.',
    ],
    spec: [
      ['Beef rub', 'Coarse salt, 16-mesh pepper'],
      ['Rest before fire', '1 hour, uncovered'],
    ],
  },
  {
    no: '03',
    label: 'Smoke',
    short:
      'Into the chamber at first light. Thin blue smoke, a steady 110 to 120 degrees, and the door stays shut. Every time it opens the cook loses twenty minutes.',
    body: [
      'The chamber is loaded at first light and held between 110 and 120 degrees. Airflow, not fuel, sets that number: the firebox intake and the chimney damper together decide how hard the fire pulls. A small hot fire gives thin blue smoke, and thin blue smoke is the only kind that belongs near food.',
      'Around 70 degrees internal the meat stalls. Moisture evaporating off the surface cools it as fast as the chamber heats it, and the thermometer stops moving for hours. That is physics, not a problem. It gets pushed through with time, or with a tight wrap, never with a spike in heat.',
    ],
    spec: [
      ['Chamber', '110–120°C, held steady'],
      ['Smoke', 'Thin and blue, never white'],
      ['Door', 'Shut. Every opening costs 20 minutes'],
    ],
  },
  {
    no: '04',
    label: 'Rest',
    short:
      'Off the smoker and into a warm holding cabinet for an hour or more. The temperature evens out, the rendered fat settles back into the muscle, and the meat relaxes.',
    body: [
      'Meat pulled straight off the smoker is still cooking and still tense. It goes into a warm holding cabinet at around 60 degrees for at least an hour, and for a full brisket often three or four.',
      'During the rest the temperature evens out from edge to centre and the rendered fat settles back into the muscle instead of running onto the board. Slicing early undoes the twelve hours that came before it, which is why the counter opens when the meat is ready and not at a scheduled time.',
    ],
    spec: [
      ['Holding', '60°C cabinet'],
      ['Minimum', '1 hour, 3+ for brisket'],
    ],
  },
  {
    no: '05',
    label: 'Serve',
    short:
      'Sliced against the grain, thickness of a pencil, served on butcher paper. Sauce on the side, never on top, because the meat should not need it.',
    body: [
      'Sliced to order, against the grain, about the thickness of a pencil. The flat and the point are cut separately because their grains run in different directions and their fat content is not the same.',
      'It is served on butcher paper with pickles and bread, and sauce always arrives beside it. If the meat needs sauce to be worth eating, the fault is upstream in the cook, not on the table.',
    ],
    spec: [
      ['Slice', 'Against the grain, pencil thick'],
      ['Sauce', 'On the side, always'],
    ],
  },
];
