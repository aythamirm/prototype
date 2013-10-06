# DOC:
# We use Helper Methods for tree building,
# because it's faster than View Templates and Partials

# SECURITY note
# Prepare your data on server side for rendering
# or use h.html_escape(node.content)
# for escape potentially dangerous content
module RenderSortableTreeHelper
  module Render 
    class << self
      attr_accessor :h, :options

      def render_node(h, options)
        @h, @options = h, options

        node = options[:node]

        "
          <li id='#{ node.id }_#{options[:klass]}' class='hyde'>
            <div class='item'>
              <i class='handle'></i>
              #{ show_link }
              #{ hide_root}
              #{ controls }
            </div>
            #{ children }
          </li>
        "
      end

      def show_link
        node = options[:node]  
        root = options[:root]
        ns   = options[:namespace]
        url  = h.url_for(ns + [node])
        title_field = options[:title]
        "<h4>#{ h.link_to(node.send(title_field), url) }</h4>"
      end

      def hide_root
        if options[:title] == '/' 

        end
      end 
      def controls
        node = options[:node]

        edit_path = h.url_for(:controller => options[:klass].pluralize, :action => :edit, :id => node)
        show_path = h.url_for(:controller => options[:klass].pluralize, :action => :show, :id => node)
        "<div class='controls'>
          #{ h.link_to '', edit_path, :class => :edit }
          #{ h.link_to '', show_path, :class => :delete, :method => :delete, :data => { :confirm => 'Are you sure?' } }
          <ul class='nav nav-pills'>
            <li class='dropdown'>
              <a class='dropdown-toggle' data-toggle='dropdown' href='#'>Action <span class='caret'></span></a>
              <ul class='dropdown-menu'>
                <li><a href='#'>Inbox</a></li>
                <li><a href='#'>Next</a></li>
                <li><a href='#'>Project</a></li>
                <li><a href='#'>Waiting</a></li>
                <li><a href='#'>Someday</a></li>
                <li><a href='#'>Finish</a></li>
              </ul>
            </li>
            <li class='dropdown'>
              <a class='dropdown-toggle' data-toggle='dropdown' href='#'>State <span class='caret'></span></a>
              <ul class='dropdown-menu'>
                <li><a href='#'>Start</a></li>
                <li><a href='#'>Finish</a></li>
                <li><a href='#'>interrup-list</a></li>
              </ul>
            </li>
            <li><a href='#'></a></li>
            <li><a href='#'></a></li>
          </ul>
        </div>"
      end

      def children
        unless options[:children].blank?
          "<ol class='nested_set'>#{ options[:children] }</ol>"
        end
      end

    end
  end
end