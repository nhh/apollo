# frozen_string_literal: true

module Apollo
  module Helpers
    module AdminNavigation
      ITEMS = [
        { title: 'Dashboard', href: '/admin/dashboard', icon: '', children: [], category: 'Allgemein' },

        { title: 'Beiträge', href: '/admin/posts', icon: '', children: [], category: 'Beiträge' },
        { title: 'Seiten', href: '/admin/pages', icon: '', children: [], category: 'Seiten' },
        { title: 'Benutzer', href: '/admin/users', icon: '', children: [], category: 'Benutzer' },
        { title: 'Themes', href: '/admin/themes', icon: '', children: [], category: 'Erweiterungen' },
        { title: 'Plugins', href: '/admin/plugins', icon: '', children: [], category: 'Erweiterungen' },
        { title: 'Widgets', href: '/admin/widgets', icon: '', children: [], category: 'Erweiterungen' },
        { title: 'Settings', href: '/admin/settings', icon: '', children: [], category: 'Einstellungen' }
      ].freeze
    end
  end
end