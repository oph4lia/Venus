document.addEventListener("DOMContentLoaded", function () {
    loadCart();
});

function handleError(error) {
    alert("An error occurred: " + error.message || error);
    console.error(error);
}

function loadCart() {
    const userId = localStorage.getItem("userId");
    if (!userId) {
        console.error("User ID not found. Redirect to login.");
        window.location.href = "/account.html";
    }

    fetch(`/api/cart?user_id=${userId}`)
        .then((response) => response.json())
        .then((data) => {
            if (data.error) {
                console.error("Error loading cart:", data.error);
                return;
            }
            displayCart(data);
        })
        .catch((error) => console.error("Error:", error));
}

function displayCart(cart) {
    const cartTable = document.getElementById("cart-table");
    const subtotalEl = document.getElementById("subtotal");
    const taxEl = document.getElementById("tax");
    const totalEl = document.getElementById("total");

    cart.items.forEach((item) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>
                <div class="cart-info">
                    <img src="${item.image_url || 'default.jpg'}">
                    <div>
                        <p>${item.product_name}</p>
                        <small>Price: $${item.price}</small>
                        <a href="#" onclick="removeFromCart(${item.cart_id}, ${item.product_id})">Remove</a>
                    </div>
                </div>
            </td>
            <td><input type="number" value="${item.quantity}" min="1"></td>
            <td>$${item.price * item.quantity}</td>
        `;
        cartTable.appendChild(row);
    });

    subtotalEl.textContent = `$${cart.subtotal}`;
    taxEl.textContent = `$${cart.tax}`;
    totalEl.textContent = `$${cart.total}`;
}

function removeFromCart(cartId, productId) {
    console.log("Deleting CartID:", cartId, "ProductID:", productId); // Add this debug line
    fetch("/api/cart", {
        method: "DELETE",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cart_id: cartId, product_id: productId }),
    })
        .then((response) => response.json())
        .then((data) => {
            console.log("Delete response:", data); // Log the response
            if (data.success) {
                alert("Item removed from cart!");
                loadCart(); // Reload cart
            } else {
                alert("Failed to remove item.");
            }
        })
        .catch((error) => console.error("Error:", error));
}


function updateCart(cartId, productId, newQuantity) {
    fetch("/api/cart", {
        method: "PATCH",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ cart_id: cartId, product_id: productId, quantity: newQuantity }),
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.success) {
                loadCart(); // Reload cart data
            } else {
                alert("Failed to update cart.");
            }
        })
        .catch(handleError);
}


