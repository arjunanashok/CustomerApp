class Dashboard_Page < SitePrism::Page
  set_url "#{$base_url}/dashboard/new"

  element :active_tab , "nav.collapse.navbar-collapse.bs-navbar-collapse ul li.b-sidebar__item.active > a"
end
