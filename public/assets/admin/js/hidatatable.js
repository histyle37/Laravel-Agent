function hidatatable(element, config){
    let index = config.index || 1;
    let count = config.count || 10;
    let keyword = config.keyword || '';
    let columns = config.columns || [];
    let loading = config.loading || null;
    let noResultText = config.noResultText || 'NO RESULT';
    let showButtons = config.showButtons || true;

    let id = element.attr('id');
    let wrapperId = id+'_wrapper';
    let wrapperDiv = document.createElement("div");
    wrapperDiv.id = wrapperId;
    wrapperDiv.classList.add("hi-datatable");
    wrapperDiv.innerHTML = element.html();
    element.empty();
    element.append(wrapperDiv);

    let header = element.find(".search-header")[0];
    let section = element.find(".search-section");
    let pagination = document.createElement("div");
    
    pagination.innerHTML = `<div class="pagination">
        <div class="pagination-wrapper">
            <div class="prev-btn nav-btn"><span>«</span></div>
            <div>
                <input class="form-control current-page-index" value="1" type="number" min="1">
            </div>
            <div class="next-btn nav-btn"><span>»</span></div>
        </div>
    </div>`;
    
    let currentIndexElement = pagination.getElementsByClassName("current-page-index")[0];
    // wrapperDiv.append(pagination.cloneNode(-1));
    wrapperDiv.prepend(pagination);

    let buttonsDiv = document.createElement("div");
    buttonsDiv.innerHTML = `<div class="row button-area">
        <div class="col-lg-3 hidatatable-length-area">
            <select class="input-field hidatatable-search-count">
                <option vlaue="10" selected="">10</option>
                <option vlaue="20">20</option>
                <option vlaue="50">50</option>
            </select>
        </div>
        <div class="col-lg-6 hidatatable-filter-area">
            <div class="input-group mb-3">
                <input type="text" class="form-control filter-text" placeholder="Search">
                <div class="input-group-append">
                <button class="btn filter-btn">Go</button> 
                </div>
            </div>
        </div>
    </div>`;
    let filterBtn = buttonsDiv.getElementsByClassName("filter-btn")[0];
    let filterText = buttonsDiv.getElementsByClassName("filter-text")[0];
    showButtons && wrapperDiv.prepend(buttonsDiv);
    //Event Listeners 
    section[0].addEventListener('mousedown', section_click_event);
    pagination.getElementsByClassName("prev-btn")[0].addEventListener('mousedown', hidatatable_prev_page);
    pagination.getElementsByClassName("next-btn")[0].addEventListener('mousedown', hidatatable_next_page);
    currentIndexElement.addEventListener('change', hidatatable_current_index_change_event);
    buttonsDiv.getElementsByClassName("hidatatable-search-count")[0].addEventListener('change', hidatatable_change_search_count);
    filterBtn.addEventListener('mousedown', hidatatable_filter_search_button_click);
    filterText.addEventListener('change', hidatatable_filter_text_change);
    // filter-text
    //Event Listeners 

    let noSearchResultElement = document.createElement("div");
    noSearchResultElement.innerHTML = `<div class="no-result">`+noResultText+`</div>`;

    let prefix = config.ajax || '';
    reload();

    function reload(){
        url = updateURL();
        console.log(keyword);
        if (!url) return;
        currentIndexElement.value = index;

        if (loading) loading.show();
        $.get(url, function(data, status){
            section.empty();
            if (status == 'success'){
                let _data = data.data;
                if (_data.length > 0){
                    for (var datumn of _data){
                        let rowElement = createROW(datumn);
                        section.append(rowElement);
                    }
                } else {
                    section.append(noSearchResultElement);
                }
            }
            loading.hide();
        });
    }

    function updateURL(){
        return prefix + "?keyword=" + keyword + "&count=" + count + "&index=" + index;
    }
    function createROW(datumn){
        let searchRow = document.createElement("div");
        searchRow.classList.add("row");
        searchRow.classList.add("search-item");
        searchRow.dataset.id = datumn.id;

        let i = 0;
        for (var column of columns){
            let searchCol = document.createElement("div");
            let colClass = header.children[i].classList[0];
            searchCol.classList.add(colClass);

            searchCol.innerHTML = datumn[columns[i].data];
            searchRow.append(searchCol);
            i++;
        }

        return searchRow;
    }
    function hidatatable_next_page(){
        index++;
        reload();
    }
    function hidatatable_prev_page(){
        if (index == 1) return;
        index--;
        reload();
    }
    function hidatatable_change_search_count(e){
        count = e.target.value;
        reload();
    }
    function section_click_event(e){
        let deleteBtn = e.target.closest("a.delete-btn");
        if (deleteBtn){
            let isDelete = window.confirm("Are you sure to delete this data?");
            if (!isDelete) return;
            let url = deleteBtn.dataset.href;
            if (loading) loading.show();
            $.get(url, function(data){
                if (loading) loading.hide();
                let id = data.data.id;
                section.find(".search-item[data-id="+id+"]").remove();
                $.notify(data.message, "success");
            })
        }
    }
    function hidatatable_current_index_change_event(e)
    {
        (e.target.value < 0) ? (index = 1,currentIndexElement.value=index) : index = e.target.value;
        reload();
    }
    function hidatatable_filter_search_button_click()
    {
        reload();
    }
    function hidatatable_filter_text_change(e)
    {
        keyword = e.target.value;
        reload();
    }
}

