# frozen_string_literal: true

module Apollo
  module Helpers
    module AdminNavigation
      ITEMS = [
        { title: 'Zur Seite', href: '/', icon: '', children: [], group: 'Dashboard' },
        { title: 'Dashboard', href: '/admin/dashboard', icon: '', children: [], group: 'Dashboard' },
        { title: 'Pages', href: '/admin/pages', icon: '', children: [], group: 'Dashboard' },
        { title: 'Posts', href: '/admin/posts', icon: '', children: [], group: 'Dashboard' },
        { title: 'Themes', href: '/admin/themes', icon: '', children: [], group: 'Dashboard' },
        { title: 'Plugins', href: '/admin/plugins', icon: '', children: [], group: 'Dashboard' },
        { title: 'Widgets', href: '/admin/widgets', icon: '', children: [], group: 'Dashboard' },
        { title: 'Settings', href: '/admin/settings', icon: '', children: [], group: 'Dashboard' }
      ].freeze
    end
  end
end
