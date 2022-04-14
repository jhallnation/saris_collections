// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

window.toggleMenu = function(event) {
  event.preventDefault();
  let dropdown = document.getElementById('dropdown-content');
  console.log(dropdown.style);
  if (dropdown.style.display == 'block') {
    dropdown.style.display = '';
    event.target.innerHTML = '<i class="material-icons md-36">menu</i>';
  } else {
    dropdown.style.display =  'block';
    event.target.innerHTML = '<i class="material-icons md-36">close</i>';
  }
}