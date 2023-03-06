// window.onload = function () {
//     quilljsediterInit();
// }

function quilljsediterInit() {
    var option = {
        modules: {
            toolbar: [
                [{ header: [1, 2, false] }],
                ['bold', 'italic', 'underline'],
                ['image', 'code-block'],
                [{ list: 'ordered' }, { list: 'bullet' }]
            ]
        },
        placeholder: '자세한 내용을 입력해 주세요!',
        theme: 'snow'
    };

    quill = new Quill('#editor', option);
}

quilljsediterInit();

quill.on('text-change', function () {
    document.getElementById('CONTENT').value = quill.root.innerHTML;
});