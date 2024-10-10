package cms

import (
	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
	"server/global"
	"server/model/cms/request"
	commonReq "server/model/common/request"
	commonRes "server/model/common/response"
)

type ArticleApi struct{}

// AddArticle
// @Tags      ArticleApi
// @Summary   创建
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.Article true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /article/addArticle [post]
func (a *ArticleApi) AddArticle(c *gin.Context) {
	///创建请求参数
	var reqParams request.Article
	if err := c.ShouldBindJSON(&reqParams); err != nil {
		commonRes.FailReq(err.Error(), c)
		return
	}
	//添加到数据库
	if ok := articleService.AddArticle(reqParams); !ok {
		commonRes.Fail(c)
	} else {
		commonRes.OkWithMessage("添加成功", c)
	}
}

// GetArticleList
// @Tags      ArticleApi
// @Summary   查询列表
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.ArticleSearchParams true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /article/getArticleList [post]
func (a *ArticleApi) GetArticleList(c *gin.Context) {
	var reqParams request.ArticleSearchParams
	if err := c.ShouldBindJSON(&reqParams); err != nil {
		commonRes.FailReq(err.Error(), c)
		return
	}
	if list, total, err := articleService.GetArticleList(reqParams); err != nil {
		commonRes.FailWithMessage("获取失败", c)
		global.TD27_LOG.Error("获取文章列表失败", zap.Error(err))
	} else {
		commonRes.OkWithDetailed(commonRes.PageResult{
			Page:     reqParams.Page,
			PageSize: reqParams.PageSize,
			Total:    total,
			List:     list,
		}, "获取成功", c)
	}
}

// GetArticleById
// @Tags      ArticleApi
// @Summary   根据id查询
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      commonReq.CId  true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /article/getArticleById [post]
func (a *ArticleApi) GetArticleById(ctx *gin.Context) {
	var model commonReq.CId
	if err := ctx.ShouldBindJSON(&model); err != nil {
		commonRes.FailReq(err.Error(), ctx)
		return
	}
	if data, err := articleService.GetArticleById(model.ID); err != nil {
		commonRes.FailWithMessage("获取失败", ctx)
	} else {
		commonRes.OkWithDetailed(data, "", ctx)
	}
}

// EditArticle
// @Tags      ArticleApi
// @Summary   编辑
// @Security  ApiKeyAuth
// @accept    application/json
// @Produce   application/json
// @Param     data  body      request.EditArticle  true "请求参数"
// @Success   200   {object}  response.Response{msg=string}
// @Router    /article/editArticle [post]
func (a *ArticleApi) EditArticle(ctx *gin.Context) {
	var model request.EditArticle
	if err := ctx.ShouldBindJSON(&model); err != nil {
		commonRes.FailReq(err.Error(), ctx)
		return
	}
	if err := articleService.EditArticle(model); err != nil {
		commonRes.Fail(ctx)
	} else {
		commonRes.Ok(ctx)
	}
}
