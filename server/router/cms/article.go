package cms

import (
	"github.com/gin-gonic/gin"
	"server/api"
)

type ArticleRouter struct {
}

func (receiver ArticleRouter) InitArticleRouter(RouterGroup *gin.RouterGroup) {
	//Router := RouterGroup.Group("cms").Use(middleware.OperationRecord())
	Router := RouterGroup.Group("article")

	ArticleApi := api.ApiGroupApp.Cms.ArticleApi
	{
		Router.POST("addArticle", ArticleApi.AddArticle)
		Router.POST("getArticleList", ArticleApi.GetArticleList)
		Router.POST("getArticleById", ArticleApi.GetArticleById)
		Router.POST("editArticle", ArticleApi.EditArticle)
	}
}
