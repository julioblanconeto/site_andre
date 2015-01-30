function mostra_esconde(id_div)
{
    if (document.getElementById(id_div).style.display == 'none')
    {
        document.getElementById(id_div).style.display = 'block';
    }
    else
    {
        document.getElementById(id_div).style.display = 'none';
    }
}