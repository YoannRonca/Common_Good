const toggleFilterButtons = () => {
  const toggleSelected = () => {
    const label = event.target;
    const filterContainer = label.parentElement.parentElement;
    const selectedLabel = filterContainer.querySelector('.filter-radio-btn.selected');
    if (selectedLabel != label) {
      if (selectedLabel) {
        selectedLabel.classList.toggle('selected');
      }
      label.classList.toggle('selected');
    }
  }

  const sidebar = document.getElementById('sidebar');

  if (sidebar) {
    const filterButtons = document.querySelectorAll('.filter-radio-btn');
    filterButtons.forEach((btn) => {
      btn.addEventListener('click', toggleSelected);
    });
  }
};

export { toggleFilterButtons };
