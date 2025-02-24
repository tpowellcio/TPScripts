document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM fully loaded and parsed.");

    var stickyElement = document.getElementById("form-pibcjgcQpF");
    var navbar = document.getElementById("section-rjLfyckuu");

    if (!stickyElement) {
        console.error("❌ Form element #form-pibcjgcQpF not found.");
        return;
    }
    if (!navbar) {
        console.error("❌ Navbar element #section-rjLfyckuu not found.");
        return;
    }

    console.log("✅ Sticky element found:", stickyElement);
    console.log("✅ Navbar element found:", navbar);

    var navbarOffset = navbar.offsetTop;
    var navbarHeight = navbar.offsetHeight;
    console.log("📌 Navbar offset top:", navbarOffset);
    console.log("📌 Navbar height:", navbarHeight);

    window.addEventListener("scroll", function () {
        var scrollPosition = window.pageYOffset;
        console.log("🔄 Window scroll position:", scrollPosition);

        if (scrollPosition >= navbarOffset + navbarHeight) {
            if (!stickyElement.classList.contains("sticky")) {
                stickyElement.classList.add("sticky");
                stickyElement.style.top = navbarHeight + "px"; // Prevent overlap
                console.log("✅ Sticky class added.");
            }
        } else {
            if (stickyElement.classList.contains("sticky")) {
                stickyElement.classList.remove("sticky");
                stickyElement.style.top = "auto";
                console.log("❌ Sticky class removed.");
            }
        }
    });
});