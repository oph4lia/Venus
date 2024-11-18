document.addEventListener("DOMContentLoaded", function () {
    fetchProducts();
});

function fetchProducts() {
    fetch("/api/products")
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                console.error("Error fetching products:", data.error);
                return;
            }
            displayProducts(data);
        })
        .catch((error) => console.error("Error:", error));
}

function displayProducts(products) {
    const productsRow = document.getElementById("products-row");
    products.forEach((product) => {
        const productDiv = document.createElement("div");
        productDiv.className = "col-4";
        productDiv.innerHTML = `
            <img src="${product.image_url || 'default.jpg'}" alt="${product.name}">
            <h4>${product.name}</h4>
            <p>$${product.price}</p>
        `;
        productsRow.appendChild(productDiv);
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

