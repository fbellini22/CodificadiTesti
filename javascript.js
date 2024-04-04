var flag_mostra_altro = 0;
var flag_mostra_legenda = 0;

function mostra_altro() {
    if (flag_mostra_altro == 0) {
        $('.moreinfo').show();
        $('#btn_mostra_info').text('Mostra meno');
        flag_mostra_altro = 1;

        // Nascondi la legenda quando si mostra altro
        $('#legenda').hide();
        $('#btn_mostra_legenda').text('Mostra legenda');
        flag_mostra_legenda = 0;
    } else {
        $('.moreinfo').hide();
        $('#btn_mostra_info').text('Maggiori informazioni');
        flag_mostra_altro = 0;
    }
}

function mostra_legenda() {
    if (flag_mostra_legenda == 0) {
        $('#legenda').show();
        $('#btn_mostra_legenda').text('Nascondi legenda');
        flag_mostra_legenda = 1;

        // Nascondi le informazioni aggiuntive quando si mostra la legenda
        $('.moreinfo').hide();
        $('#btn_mostra_info').text('Maggiori informazioni');
        flag_mostra_altro = 0;
    } else {
        $('#legenda').hide();
        $('#btn_mostra_legenda').text('Mostra legenda');
        flag_mostra_legenda = 0;
    }
}
