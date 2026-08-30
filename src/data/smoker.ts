/** Labelled parts of the offset smoker, keyed to the diagram. */
export interface Hotspot { label: string; title: string; body: string; x: number; y: number }

export const hotspots: Hotspot[] = [
  {
    label: 'Cooking chamber',
    title: 'Cooking Chamber',
    body:
      'The meat sits here, never over a flame. Hot air and smoke enter from the firebox on the right, travel the length of the barrel and leave through the stack. Racks are loaded fat side up so the rendering fat bastes the meat all day.',
    x: 300,
    y: 150,
  },
  {
    label: 'Firebox',
    title: 'Firebox',
    body:
      'A separate chamber, offset and slightly lower than the cooking barrel. A small hot fire of seasoned hardwood burns here all day. Small and hot is the rule: a large smouldering fire makes dirty smoke and bitter meat.',
    x: 495,
    y: 217,
  },
  {
    label: 'Chimney',
    title: 'Chimney Stack',
    body:
      'The stack pulls air through the whole cooker. Its damper, together with the firebox intake, is how the pitmaster sets temperature. Fuel does not control heat here; airflow does.',
    x: 213,
    y: 100,
  },
  {
    label: 'Racks',
    title: 'Racks and Placement',
    body:
      'The end nearest the firebox runs hotter, so the biggest cuts go there and the delicate ones sit further along. Every cut gets rotated at least once, and the door stays shut the rest of the time.',
    x: 240,
    y: 200,
  },
  {
    label: 'Wood store',
    title: 'The Wood',
    body:
      'Oak is the base wood: steady, neutral and long burning. Hickory is added for depth on beef, and local olive or citrus wood for lighter cuts. Everything is seasoned dry, because green wood makes acrid white smoke.',
    x: 560,
    y: 255,
  },
];
