// Animation function
function animate(element, property, start, end, duration, delay = 0) {
    const startTime = performance.now() + delay;
    const endTime = startTime + duration;
    function update(currentTime) {
        if (currentTime < startTime) {
            requestAnimationFrame(update);
            return;
        }
        const elapsed = currentTime - startTime;
        const progress = Math.min(elapsed / duration, 1);
        const value = start + (end - start) * progress;
        element.style[property] = value + (property === 'opacity' ? '' : 'px');
        if (progress < 1) {
            requestAnimationFrame(update);
        }
    }
    requestAnimationFrame(update);
}

// Animate elements when the DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
    // Animate header
    const header = document.querySelector('.header');
    animate(header, 'opacity', 0, 1, 1000);
    animate(header, 'transform', -50, 0, 1000);

    // Animate logo
    const logo = document.querySelector('.logo img');
    animate(logo, 'opacity', 0, 1, 1000);
    animate(logo, 'transform', -20, 0, 1000);

    // Animate main content
    const mainContent = document.querySelector('.main-content');
    animate(mainContent, 'opacity', 0, 1, 1000, 500);
    animate(mainContent, 'transform', 50, 0, 1000, 500);

    // Animate footer
    const footer = document.querySelector('.footer');
    animate(footer, 'opacity', 0, 1, 1000, 1000);
    animate(footer, 'transform', 50, 0, 1000, 1000);

    // Animate navigation menu items
    const navItems = document.querySelectorAll('.nav-menu a');
    navItems.forEach((item, index) => {
        animate(item, 'opacity', 0, 1, 500, index * 100);
        animate(item, 'transform', 20, 0, 500, index * 100);
    });

    // Animate user action buttons
    const userActions = document.querySelectorAll('.user-actions a');
    userActions.forEach((action, index) => {
        animate(action, 'opacity', 0, 1, 500, index * 100);
        animate(action, 'transform', 20, 0, 500, index * 100);
    });
});
