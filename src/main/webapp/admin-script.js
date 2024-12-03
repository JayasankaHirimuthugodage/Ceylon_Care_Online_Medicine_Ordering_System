// Ceylon Care Admin Script
document.addEventListener('DOMContentLoaded', function() {
    // Highlight active navigation item
    const navLinks = document.querySelectorAll('.admin-nav a');
    const currentPage = window.location.pathname;
    navLinks.forEach(link => {
        if (link.getAttribute('href') === currentPage) {
            link.classList.add('active');
        }
    });

    // Simple accordion for sidebar (if present)
    const accordionItems = document.querySelectorAll('.accordion-item');
    accordionItems.forEach(item => {
        const header = item.querySelector('.accordion-header');
        const content = item.querySelector('.accordion-content');
        header.addEventListener('click', function() {
            content.style.display = content.style.display === 'none' ? 'block' : 'none';
        });
    });
});
