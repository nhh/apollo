# frozen_string_literal: true

require 'apollo/core/addon_manager'

module Apollo
  module Helpers
    module AdminNavigation
      def menu_items
        [
          { title: 'Dashboard', href: '/admin/dashboard', icon: '', children: [], category: 'Allgemein' },
          { title: 'Beiträge', href: '/admin/posts', icon: '', children: [], category: 'Inhalt' },
          { title: 'Seiten', href: '/admin/pages', icon: '', children: [], category: 'Inhalt' },
          { title: 'Medien', href: '/admin/attachments', icon: '', children: [], category: 'Inhalt' },
          { title: 'Benutzer', href: '/admin/users', icon: '', children: [], category: 'Benutzer' },
          { title: 'Addons', href: '/admin/addons', icon: '', children: [], category: 'Erweiterungen' },
          { title: 'Settings', href: '/admin/settings', icon: '', children: [], category: 'Einstellungen' }
        ] + Apollo::Core::AddonManager.instance.descendants.map{ |addon| addon.new}.map { |a| a.menu_entries }.flatten
      end
    end
  end
end
