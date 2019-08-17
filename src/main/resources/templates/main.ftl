<#import "parts/common.ftl" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input class="form-control" type="text" name="filter" placeholder="Search by tag">
                <button class="btn btn-primary ml-2" type="submit">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Введите сообщение" />
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Тэг">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>
    </div>

    <#if messages??>
        <div class="card-columns">
        <#list messages as message>
            <div class="card my-3" style="width: 18rem;">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2"
                <span>${message.text}</span>
                <i>${message.tag}</i>
            </div>
            <div class="card-footer text-mited">
                ${message.authorName}
            </div>
            </div>
        </#list>
        </div>
    </#if>
</@c.page>