# frozen_string_literal: true

module Apollo
  module Controllers
    class AdminWidgetController < Apollo::Controllers::AdminController

      get '/admin/widgets' do
        @widgets = Apollo::Widget.descendants
        erb :'widgets/index.html', layout: :'layout.html'
      end

      get '/admin/widgets/:template_name' do |widget_name|
        @widget = Apollo::Widget.descendants.detect {|widget| widget.name == widget_name }
        erb :'widgets/show.html', layout: :'layout.html'
      end

    end
  end
end
