// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
/* app/assets/javascripts/application.js */

//= require popper
//= require bootstrap
import "@hotwired/turbo-rails"
import "controllers"

const iconError = document.querySelector('#icon-error')
const iconInput = document.querySelector('.icon-input')
const categoryForm = document.querySelector('.category-form')

const showMessage = (succes) => {
    if (succes) {
        iconError.classList.remove("text-danger")
        iconError.classList.add("text-success")
        iconError.classList.remove("d-none")
        iconError.textContent = "Your url is a valid image url"
    } else {
        iconError.classList.remove("text-success")
        iconError.classList.add("text-danger")
        iconError.classList.remove("d-none")
        iconError.textContent = "Please provide an image link"
    }

    const t = setTimeout(() => {
        iconError.classList.add("d-none")
        clearTimeout(t)
    }, 5000)
}

function isImgUrl(url) {
    const img = new Image();
    img.src = url;
    return new Promise((resolve) => {
      img.onload = () => resolve(true);
      img.onerror = () => resolve(false);
    });
}

let urlTest = false

iconInput.addEventListener('change', async(e) => {
    urlTest = await isImgUrl(e.target.value)
    showMessage(urlTest)

})

//prevent the form from being submited if the link is not an image lintk
categoryForm.addEventListener("submit", async (e) => {
    if(!urlTest) e.preventDefault()
    console.log(urlTest);
})

