document.getElementById("search-bar").addEventListener("input", function () {
    const query = this.value;
    if (query.length < 2) return; // Trigger search after 2+ characters

    fetch(`/api/search?q=${encodeURIComponent(query)}`)
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                console.error("Error:", data.error);
                return;
            }
            displaySearchResults(data);
        })
        .catch((error) => console.error("Error:", error));
});

document.addEventListener("DOMContentLoaded", function () {
    const urlParams = new URLSearchParams(window.location.search);
    const productId = urlParams.get("productId");
    if (!productId) {
        console.error("Product ID not provided.");
        return;
    }
    fetch(`/api/products/${productId}`)
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                handleError(data.error);
                return;
            }
            renderProductDetails(data);
        })
        .catch(handleError);
});

function renderProductDetails(product) {
    document.getElementById("ProductImg").src = product.image_url || "default.jpg";
    document.querySelector(".col-2 h1").innerText = product.name;
    document.querySelector(".col-2 h4").innerText = `$${product.price}`;
    document.querySelector(".col-2 p").innerText = product.description;
}


function displaySearchResults(products) {
    const resultsContainer = document.getElementById("search-results");
    resultsContainer.innerHTML = ""; // Clear previous results
    products.forEach((product) => {
        const productDiv = document.createElement("div");
        productDiv.className = "col-4";
        productDiv.innerHTML = `
            <img src="${product.image_url || 'default.jpg'}" alt="${product.name}">
            <h4>${product.name}</h4>
            <p>$${product.price}</p>
        `;
        resultsContainer.appendChild(productDiv);
    });
}

function handleError(error) {
    alert("An error occurred: " + error.message || error);
    console.error(error);
}

export function renderProducts(products, container) {
    container.innerHTML = ""; // Clear previous content
    products.forEach((product) => {
        const productDiv = document.createElement("div");
        productDiv.className = "col-4";
        productDiv.innerHTML = `
            <img src="${product.image_url || 'default.jpg'}" alt="${product.name}">
            <h4>${product.name}</h4>
            <p>$${product.price}</p>
        `;
        container.appendChild(productDiv);
    });
}

productDiv.addEventListener("click", () => {
    window.location.href = `/product-details.html?productId=${product.id}`;
});

