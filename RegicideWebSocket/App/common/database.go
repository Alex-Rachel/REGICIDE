package common

import (
	"Regicide/App/model"
	"fmt"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"github.com/spf13/viper"
	"github.com/wonderivan/logger"
)

var DB *gorm.DB

func InitDB() *gorm.DB {
	driverName := viper.GetString("datasource.driverName")
	host := viper.GetString("datasource.host")
	port := viper.GetString("datasource.port")
	database := viper.GetString("datasource.database")
	username := viper.GetString("datasource.username")
	password := viper.GetString("datasource.password")
	charset := viper.GetString("datasource.charset")
	args := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=true",
		username,
		password,
		host,
		port,
		database,
		charset)

	db, err := gorm.Open(driverName, args)
	if err != nil {
		panic("failed to connect database,err: " + err.Error())
	}

	logger.Info("Connect MySql Success!")

	//自动创建数据表
	db.AutoMigrate(&model.User{})
	db.AutoMigrate(&model.RumenRank{})
	db.AutoMigrate(&model.EasyRank{})
	db.AutoMigrate(&model.NormalRank{})
	db.AutoMigrate(&model.HardRank{})
	db.AutoMigrate(&model.VeryHardRank{})
	db.AutoMigrate(&model.HunRank{})
	db.AutoMigrate(&model.OnlineRank{})
	DB = db
	return db
}

func GetDB() *gorm.DB {
	return DB
}
