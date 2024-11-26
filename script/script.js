function OpenModal(id) {
    var modal = document.getElementById("modal");
    var productImage = document.getElementById("product-image");
    var productTitle = document.getElementById("product-title");
    var productDescription = document.getElementById("product-description");
    var productVersion = document.getElementById("product-version");
    var productPrice = document.getElementById("product-price");        

    var product = products.find(function(product) {
        return product.id === id;    
    });
    
    if (product) {
        productImage.src = product.image;
        productTitle.textContent = product.title;
        productDescription.textContent = product.description;
        productVersion.textContent = product.version;
        productPrice.textContent = product.price;
    }

    modal.style.display = "block";
}