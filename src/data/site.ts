/** Everything about the business that appears in more than one place. */
export const site = {
  name: 'Smoked Meat Academy',
  tagline: 'Smoke. Fire. Meat.',
  description:
    'A meat-smoking concept built around fire, time and patience, bringing authentic smoked meat culture to Jordan.',
  city: 'Amman, Jordan',
  email: 'smokedmeatacademy@yandex.com',
  /** E.164 for the tel: link. */
  phone: '+962781560495',
  phoneDisplay: '+962 78 156 0495',
  orderMailto:
    'mailto:smokedmeatacademy@yandex.com?subject=Smoked%20Meat%20Academy%20order%20request',
} as const;

export const nav = [
  { href: '/', label: 'Home' },
  { href: '/meat', label: 'The Meat' },
  { href: '/process', label: 'The Process' },
  { href: '/journal', label: 'Smoke Journal' },
  { href: '/smoker-box', label: 'Smoker Box' },
  { href: '/story', label: 'Our Story' },
] as const;
