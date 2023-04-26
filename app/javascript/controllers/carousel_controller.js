import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const carousel = this.element.querySelector('.carousel');
    const firstImage = this.element.querySelectorAll('.img-carousel')[0];
    const arrowIcons = this.element.querySelectorAll('.wrapper i');

    let isDragStart = false, prevPageX, prevScrollLeft;

    const showHideIcons = () => {
      let scrollWidth = carousel.scrollWidth - carousel.clientWidth;
      arrowIcons[0].style.display = carousel.scrollLeft === 0 ? 'none' : 'block';
      arrowIcons[1].style.display = carousel.scrollLeft === scrollWidth ? 'none' : 'block';
    }

    arrowIcons.forEach(icon => {
      icon.addEventListener('click', () => {
        let firstImageWidth = firstImage.clientWidth + 14;
        carousel.scrollLeft += (icon.id === "left" ? -firstImageWidth : firstImageWidth);
        setTimeout(() => showHideIcons(), 60);
      });
    });

    const dragStart = (e) => {
      isDragStart = true;
      prevPageX = e.pageX || e.touches[0].pageX;
      prevScrollLeft = carousel.scrollLeft;
    }

    const dragging = (e) => {
      if(!isDragStart) return;
      e.preventDefault();
      carousel.classList.add('dragging');
      let positionDiff = (e.pageX || e.touches[0].pageX ) - prevPageX;
      carousel.scrollLeft = prevScrollLeft - positionDiff;
      showHideIcons();
    }

    const dragStop = () => {
      isDragStart = false;
      carousel.classList.remove('dragging');
    }

    carousel.addEventListener('mousedown', dragStart);
    carousel.addEventListener('touchstart', dragStart);

    carousel.addEventListener('mousemove', dragging);
    carousel.addEventListener('touchmove', dragging);

    carousel.addEventListener('mouseup', dragStop);

    carousel.addEventListener('mouseleave', dragStop);
    carousel.addEventListener('touchend', dragStop);
  }
}
