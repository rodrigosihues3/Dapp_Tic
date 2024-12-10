const productForm = document.querySelector("#productForm");
const updateProductForm = document.querySelector("#updateProductForm");

document.addEventListener("DOMContentLoaded", () => {
    App.init();
})

productForm.addEventListener("submit", e => {
    e.preventDefault();

    console.log(
        productForm["title"].value,
        productForm["description"].value,
        productForm["expirationDate"].value,
        productForm["brand"].value,
        productForm["lote"].value
    );

    App.createProduct(productForm["title"].value, productForm["description"].value, productForm["expirationDate"].value, productForm["brand"].value, productForm["lote"].value);
})

updateProductForm.addEventListener("submit", e => {
    e.preventDefault();
    
    console.log(
        parseInt(updateProductForm["id"].value, 10),
        updateProductForm["newTitle"].value,
        updateProductForm["newDescription"].value,
        updateProductForm["newExpirationDate"].value,
        updateProductForm["newBrand"].value,
        updateProductForm["newLote"].value,
        updateProductForm["reasonForChange"].value
    );

    App.updateProduct(parseInt(updateProductForm["id"].value, 10), updateProductForm["newTitle"].value, updateProductForm["newDescription"].value, updateProductForm["newExpirationDate"].value, updateProductForm["newBrand"].value, updateProductForm["newLote"].value, updateProductForm["reasonForChange"].value);
})