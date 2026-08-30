/** Counter questions, answered on the process page. */
export interface Question { q: string; a: string }

export const questions: Question[] = [
  {
    q: 'Is smoked meat the same as grilled meat?',
    a:
      'No. Grilling is direct heat for minutes and cooks the surface hard and fast. Smoking is indirect heat for hours and works on the inside of the muscle. They share a fuel and almost nothing else.',
  },
  {
    q: 'Why is the meat pink inside if it is fully cooked?',
    a:
      'That band is the smoke ring. Nitrogen dioxide from burning wood dissolves into the wet surface and fixes the colour of the myoglobin before heat can turn it grey. It is a sign of a live wood fire, not of undercooked meat.',
  },
  {
    q: 'Can you cook it faster at a higher temperature?',
    a:
      'You can cook it faster, but you will not get the same thing. Collagen needs both heat and time to become gelatin. Raise the temperature and the muscle fibres tighten and squeeze out moisture before that conversion finishes.',
  },
  {
    q: 'Do you use gas or electricity at any point?',
    a:
      'Only to light the first chimney of charcoal. From there the cook runs on seasoned hardwood, and the temperature is managed by hand with the intake and the stack.',
  },
  {
    q: 'What happens if I ask for it well done?',
    a:
      'It already is. Barbecue is taken past well done on purpose, to around 96 degrees internal, which is the point where the connective tissue has melted. That is why it is tender rather than dry.',
  },
];
