function getAllProducts() {

    $.getJSON(apiUriGetAll)
        .done(function (data) {
            
            $.each(data, function (key, item) {
                $('<li>', { id: 'ProductItem' + counter + 'Id' }).appendTo($('#ProdutosId'));
                $('<ul>', { id: 'Product' + counter + 'Id', class: 'product-item-list', style: '{list-style-type: none;}' }).appendTo($('#ProductItem' + counter + 'Id'));
                $('<a>', {
                    id: 'ProductLink' + counter + 'Id', href: 'Home/ProductDetails', 'data-index': counter,
                    'object-id': item.id, onclick: 'selectProduct(this)'
                }).appendTo($('#Product' + counter + 'Id'));
                $('<li>', { text: item.name }).appendTo($('#ProductLink' + counter + 'Id'));
                $('<li>', { text: 'Marca: ' + item.brand }).appendTo($('#Product' + counter + 'Id'));
                $('<li>', { text: 'Categoria: ' + item.category.categoryName }).appendTo($('#Product' + counter + 'Id'));
                $('<li>', { text: 'Descrição: ' + item.description }).appendTo($('#Product' + counter + 'Id'));
                $('<li>', { text: 'Preço: R$' + item.price }).appendTo($('#Product' + counter + 'Id'));
                $('<li>', { id: 'Image' + counter, class: 'image-item' }).appendTo($('#Product' + counter + 'Id'));
                $('<img>', { src: item.urlImage }).appendTo($('#Image' + counter));
                $('<br>', {}).appendTo($('#Product' + counter + 'Id'));
                objectsList[counter] = item;
                counter++;
            });
            
        });
}