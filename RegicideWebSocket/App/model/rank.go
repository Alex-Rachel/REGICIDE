package model

import "github.com/jinzhu/gorm"

type Rank struct {
	gorm.Model
	Name     string `gorm":type:varchar(20);not null"`
	Username string `gorm:varchar(11);not null`
	Roleid   int    `gorm:int(11);not null`
	Rumen    int    `gorm:int(11);not null`
	Easy     int    `gorm:int(11);not null`
	Normal   int    `gorm:int(11);not null`
	Hard     int    `gorm:int(11);not null`
	VeryHard int    `gorm:int(11);not null`
}

type RumenRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type EasyRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type NormalRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type HardRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type VeryHardRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type HunRank struct {
	gorm.Model
	Name      string `gorm":type:varchar(20);not null"`
	Username  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	GoldCount int    `gorm:int(11);not null`
	YinCount  int    `gorm:int(11);not null`
	TongCount int    `gorm:int(11);not null`
}

type OnlineRank struct {
	gorm.Model
	Usersname string `gorm":type:varchar(40);not null"`
	Roomname  string `gorm:varchar(11);not null`
	Roleid    int    `gorm:int(11);not null`
	WinTime   int64  `gorm:int(11);not null`
}
