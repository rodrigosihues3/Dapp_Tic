// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract ProductsContract {
    uint256 public productsCounter = 0;

    constructor () {
        // Creamos un producto de ejemplo para el contrato
        createProduct("Producto de ejemplo", "Ejemplo de descripcion del producto", "Fecha de ejemplo", "Marca de ejemplo", "Lote de ejemplo");
    }

    struct Product {
        uint id;
        string title;
        string description;
        string expirationDate;
        string brand;
        string lote;
        string reasonForChange;
        bool published;
        uint createdAT;
    }

    event ProductCreated(uint id, string title, string description, string expirationDate, string brand, string lote, string reasonForChange, bool published, uint createdAT);
    event ProductTogglePublished(uint id, bool published);
    event ProductUpdate(uint id, string title, string description, string expirationDate, string brand, string lote, string reasonForChange, uint createdAT);
    event ProductDelete(uint id, string title, string description, string expirationDate, string brand, string lote, string reasonForChange, uint createdAT);

    mapping(uint => Product) public products;

    // Función para crear un producto
    function createProduct(string memory _title, string memory _description, string memory _expirationDate, string memory _brand, string memory _lote) public {        
        productsCounter++;
        products[productsCounter] = Product(productsCounter, _title, _description, _expirationDate, _brand, _lote, "", false, block.timestamp);

        emit ProductCreated(productsCounter, _title, _description, _expirationDate, _brand, _lote, "", false, block.timestamp);
    }

    // Función para actualizar el estado de un producto 
    function togglePublished(uint _id) public {
        Product memory _product = products[_id];
        _product.published = !_product.published;
        
        products[_id] = _product;

        emit ProductTogglePublished(_id, _product.published);
    }

    // Función actualizar información de un producto
    function updateProduct(uint _id, string memory _title, string memory _description, string memory _expirationDate, string memory _brand, string memory _lote, string memory _reasonForChange) public {
        Product memory _product = products[_id];

        _product.title = _title;
        _product.description = _description;
        _product.expirationDate = _expirationDate;
        _product.brand = _brand;
        _product.lote = _lote;
        _product.reasonForChange = _reasonForChange;
        _product.createdAT = block.timestamp;

        products[_id] = _product;

        emit ProductUpdate(_id, _product.title, _product.description, _product.expirationDate, _product.brand, _product.lote, _product.reasonForChange, _product.createdAT);
    }

    // Función eliminar producto
    function deleteProduct(uint _id) public {
        Product memory _product = products[_id];

        _product.title = "";
        _product.description = "";
        _product.expirationDate = "";
        _product.brand = "";
        _product.lote = "";
        _product.reasonForChange = "";
        _product.published = false;
        _product.createdAT = block.timestamp;
        
        products[_id] = _product;

        emit ProductDelete(_id, _product.title, _product.description, _product.expirationDate, _product.brand, _product.lote, _product.reasonForChange, _product.createdAT);
    }
}