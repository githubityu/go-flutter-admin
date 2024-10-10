package cms

import (
	"errors"
	"go.uber.org/zap"
	"gorm.io/gorm"
	"server/global"
	"server/model/cms"
	"server/model/cms/request"
	"time"
)

type ArticleService struct {
}

// AddArticle 新增文章
func (as *ArticleService) AddArticle(reqParams request.Article) bool {
	var newModel cms.ArticleModel
	newModel.Title = reqParams.Title
	newModel.IDChannel = reqParams.IDChannel
	newModel.Content = reqParams.Content
	newModel.Author = reqParams.Author
	newModel.Img = reqParams.Img

	if err := global.TD27_DB.Create(&newModel).Error; err != nil {
		global.TD27_LOG.Error("创建文章失败", zap.Error(err))
		return false
	}

	return true
}

// EditArticle 编辑文章
func (as *ArticleService) EditArticle(reqParams request.EditArticle) (err error) {
	//定义一个需要更新的模型
	//查询出来数据
	//更改需要修改的数据
	var model cms.ArticleModel

	if errors.Is(global.TD27_DB.Where("id = ?", reqParams.ID).First(&model).Error, gorm.ErrRecordNotFound) {
		return errors.New("文章不存在")
	}

	err = global.TD27_DB.Model(&model).Updates(map[string]interface{}{
		"title":      reqParams.Title,
		"id_channel": reqParams.IDChannel,
		"content":    reqParams.Content,
		"author":     reqParams.Author,
		"img":        reqParams.Img,
	}).Error

	return
}

// DeleteArticle 删除
func (as *ArticleService) DeleteArticle(id uint) (err error) {
	return global.TD27_DB.Where("id = ?", id).Unscoped().Delete(&cms.ArticleModel{}).Error
}

// GetArticleList 分页获取
func (as *ArticleService) GetArticleList(params request.ArticleSearchParams) ([]cms.ArticleModel, int64, error) {
	limit := params.PageSize
	offset := params.PageSize * (params.Page - 1)
	db := global.TD27_DB.Model(&cms.ArticleModel{})
	var modelList []cms.ArticleModel

	if params.Title != "" {
		db = db.Where("title LIKE ?", "%"+params.Title+"%")
	}
	if params.Author != "" {
		db = db.Where("author LIKE ?", "%"+params.Author+"%")
	}
	timeFormat := "2006-01-02"
	var err error
	if params.Start != "" && params.End != "" {
		startDate, err := time.Parse(timeFormat, params.Start)
		if err != nil {
			return nil, 0, err
		}
		endDate, err := time.Parse(timeFormat, params.End)
		if err != nil {
			return nil, 0, err
		}
		db = db.Where("created_at >= ? AND created_at <= ?", startDate, endDate)
	}

	var total int64
	err = db.Count(&total).Error

	if err != nil {
		return modelList, total, err
	} else {
		db = db.Limit(limit).Offset(offset).Order("id desc")
		err = db.Find(&modelList).Error
	}
	return modelList, total, err
}

// GetArticleById 根据id获取文章
func (as *ArticleService) GetArticleById(id uint) (model cms.ArticleModel, err error) {
	err = global.TD27_DB.First(&model, id).Error
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return model, errors.New("文章不存在")
		}
		return model, err
	}
	return model, nil
}
