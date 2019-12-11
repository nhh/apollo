# frozen_string_literal: true

module Apollo
  module Helpers
    module AdminNavigation
      def menu_items
        [
          { title: 'Dashboard', href: '/admin/dashboard', icon: '', children: [], category: 'Allgemein' },
          { title: 'Beiträge', href: '/admin/posts', icon: '', children: [], category: 'Beiträge' },
          { title: 'Seiten', href: '/admin/pages', icon: '', children: [], category: 'Seiten' },
          { title: 'Benutzer', href: '/admin/users', icon: '', children: [], category: 'Benutzer' },
          { title: 'Addons', href: '/admin/addons', icon: '', children: [], category: 'Erweiterungen' },
          { title: 'Widgets', href: '/admin/widgets', icon: '', children: [], category: 'Erweiterungen' },
          { title: 'Settings', href: '/admin/settings', icon: '', children: [], category: 'Einstellungen' }
        ] + Apollo::Addon.descendants.map{ |addon| addon.new}.map { |a| a.menu_entries }.flatten
      end
    end
  end
end
