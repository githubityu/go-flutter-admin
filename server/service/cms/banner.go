package cms

import (
	"errors"
	"gorm.io/gorm"
	"server/global"
	"server/model/cms"
	"server/model/cms/request"
)

type BannerService struct {
}

func (receiver *BannerService) GetBannerList(params request.BannerSearchParams) (list []cms.BannerModel, total int64, err error) {
	limit := params.PageSize
	offset := params.Page * (params.PageSize - 1)
	db := global.TD27_DB.Model(&cms.BannerModel{})

	if params.Title != "" {
		db = db.Where("title like ?", "%"+params.Title+"%")
	}
	err = db.Count(&total).Error
	err = db.Limit(limit).Offset(offset).Order("id desc").Find(&list).Error
	return
}

func (receiver *BannerService) GetBannerById(id uint) (item cms.BannerModel, err error) {
	return item, global.TD27_DB.Where("id = ?", id).First(&item).Error
}

func (receiver *BannerService) EditBanner(params request.EditBannerParams) (ok bool, err error) {
	var model cms.BannerModel
	if err = global.TD27_DB.First(&model, params.Id).Error; errors.Is(err, gorm.ErrRecordNotFound) {
		return false, err
	}

	if err = global.TD27_DB.Model(&model).Updates(map[string]any{
		"title":     params.Title,
		"file_name": params.FileName,
		"type":      params.Type,
		"url":       params.URL,
	}).Error; err != nil {
		return false, err
	}
	return true, nil
}

func (receiver BannerService) AddBanner(params cms.BannerModel) (ok bool, err error) {
	//查询是否存在
	err = global.TD27_DB.Save(params).Error
	return true, err
}
