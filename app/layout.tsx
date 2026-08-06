import './global.css';
import { RootProvider } from 'fumadocs-ui/provider';
import type { Metadata } from 'next';
import type { ReactNode } from 'react';

export const metadata: Metadata = {
  title: {
    template: '%s | Thrico Docs',
    default: 'Thrico Documentation',
  },
  description:
    'The official documentation portal for the Thrico platform. Guides for Super Admins, Entity Admins, Community Admins, Developers, and more.',
  metadataBase: new URL('https://docs.thrico.com'),
  openGraph: {
    title: 'Thrico Documentation',
    description:
      'The official documentation portal for the Thrico platform.',
    url: 'https://docs.thrico.com',
    siteName: 'Thrico Docs',
    type: 'website',
  },
  icons: {
    icon: '/favicon.ico',
  },
  twitter: {
    card: 'summary_large_image',
    title: 'Thrico Documentation',
    description:
      'The official documentation portal for the Thrico platform.',
  },
  robots: {
    index: true,
    follow: true,
  },
};

export default function RootLayout({ children }: { children: ReactNode }) {
  return (
    <html lang="en" suppressHydrationWarning>
      <body className="font-sans antialiased">
        <RootProvider>{children}</RootProvider>
      </body>
    </html>
  );
}
