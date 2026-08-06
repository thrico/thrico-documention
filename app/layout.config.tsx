import type { BaseLayoutProps } from "fumadocs-ui/layouts/shared";
import { BookOpen, Code2, FileText, HelpCircle } from "lucide-react";

export const baseOptions: BaseLayoutProps = {
  nav: {
    title: (
      <div className="flex items-center gap-2.5">
        <img src="/thrico-logo.svg" alt="Thrico Logo" className="h-7 w-auto" />
      </div>
    ),
    transparentMode: "top",
  },
  links: [
    {
      text: "Documentation",
      url: "/docs",
      icon: <BookOpen className="size-4" />,
      active: "nested-url",
    },
    {
      text: "API Reference",
      url: "/docs/api",
      icon: <Code2 className="size-4" />,
    },
    {
      text: "Release Notes",
      url: "/docs/release-notes",
      icon: <FileText className="size-4" />,
    },
    {
      text: "FAQ",
      url: "/docs/faq",
      icon: <HelpCircle className="size-4" />,
    },
  ],
};
