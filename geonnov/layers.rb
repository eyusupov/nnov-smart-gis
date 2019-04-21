#!/bin/env ruby
require 'cgi'
layersGroupConfig = [{
    name: "Административное-территориальное деление",
    layers: [{
        "сaption": "Граница городского округа",
        tableName: "ORCL_PORTAL:GEO_MO_BOUNDARY",
        filter: "TYPE_ID=4",
        style: {
            stroke: {
                color: "#ff0000",
                width: 3
            }
        },
        geomNameForBbox: "GEOMETRY",
        zIndex: 100,
        visibleOnLoad: !0
    }, {
        "сaption": "Районы города",
        tableName: "ORCL_PORTAL:GEO_TERRITORIAL_NAME",
        filter: "TERRITORIAL_TYPE_ID=2",
        style: {
            stroke: {
                color: "#ff0000",
                lineDash: [8],
                width: 2
            }
        },
        geomNameForBbox: "GEOMETRY",
        zIndex: 100,
        visibleOnLoad: !0
    }]
}, {
    name: "Адресный план",
    layers: [{
        "сaption": "Улицы",
        tableName: "ORCL_PORTAL:GEO_STREET_MIDDLE",
        filter: "CONDITION_ID%3C%3E4",
        style: {
            stroke: {
                color: "brown",
                lineDash: [4],
                width: 1
            },
            text: {
                font: '15px "Open Sans", "Arial Unicode MS", "sans-serif"',
                placement: "line",
                fill: {
                    color: "black"
                }
            }
        },
        minZoom: 14,
        zIndex: 450,
        geomNameForBbox: "GEOMETRY",
        visibleOnLoad: !0,
        decl: !0
    }, {
        "сaption": "Здания существующие",
        tableName: "ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_G",
        tableNameAttr: "ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_A",
        style: {
            stroke: {
                color: "#907840",
                width: 1
            },
            fill: {
                color: "rgb(255, 232, 192)"
            }
        },
        minZoom: 17,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "POST_INDEX",
            caption: "Почтовый индекс"
        }, {
            name: "BUILDINGS_CONDITION_NAME",
            caption: "Состояние"
        }, {
            name: "BUILD_NAME",
            caption: "Наименование"
        }, {
            name: "FUNCTIONALITY_NAME",
            caption: "Назначение"
        }, {
            name: "FLOORS",
            caption: "Этажность"
        }, {
            name: "BUILD_YEAR",
            caption: "Год постройки"
        }, {
            name: "BUILDING_STATE",
            caption: "Текущее состояние"
        }],
        zIndex: 400,
        visibleOnLoad: !0
    }, {
        "сaption": "Здания строящиеся",
        tableName: "ORCL_PORTAL:V_PORTAL2_CONSTR_BUILDINGS_G",
        tableNameAttr: "ORCL_PORTAL:V_PORTAL2_CONSTR_BUILDINGS_A",
        style: {
            stroke: {
                color: "#87CEFA",
                width: 1
            },
            fill: {
                color: "rgba(255, 255, 255, 0)"
            }
        },
        minZoom: 17,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "POST_INDEX",
            caption: "Почтовый индекс"
        }, {
            name: "BUILDINGS_CONDITION_NAME",
            caption: "Состояние"
        }, {
            name: "BUILD_NAME",
            caption: "Наименование"
        }, {
            name: "FUNCTIONALITY_NAME",
            caption: "Назначение"
        }, {
            name: "FLOORS",
            caption: "Этажность"
        }, {
            name: "BUILD_YEAR",
            caption: "Год постройки"
        }, {
            name: "BUILDING_STATE",
            caption: "Текущее состояние"
        }],
        zIndex: 400,
        visibleOnLoad: !0
    }, {
        "сaption": "Адреса",
        tableName: "ORCL_PORTAL:GEO_ADDRESS",
        filter: "STATUS_ID=100000005",
        style: {
            text: {
                font: '10px "Open Sans", "Arial Unicode MS", "sans-serif"',
                placement: "point",
                fill: {
                    color: "blue"
                }
            }
        },
        minZoom: 18,
        geomNameForBbox: "GEOMETRY",
        zIndex: 500,
        visibleOnLoad: !0
    }]
}, {
    name: "Топография",
    layers: [{
        "сaption": "Гидрография",
        tableName: "ORCL_PORTAL:GEO_WATER_AREA",
        style: {
            stroke: {
                color: "#242B7A",
                width: 1
            },
            fill: {
                color: "rgba(46, 204, 250, 0.75)"
            }
        },
        minZoom: 13,
        geomNameForBbox: "GEOMETRY",
        zIndex: 200,
        visibleOnLoad: !0
    }]
}, {
    name: "Ветхий фонд",
    layers: [{
        "сaption": "Здания ветхие",
        tableName: "ORCL_PORTAL:V_PORTAL2_VETH_BUILDINGS_G",
        tableNameAttr: "ORCL_PORTAL:V_PORTAL2_VETH_BUILDINGS_A",
        style: {
            stroke: {
                color: "#907840",
                width: 1
            },
            fill: {
                color: "rgb(255, 255, 102)"
            }
        },
        minZoom: 17,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "FLOORS",
            caption: "Этажность"
        }, {
            name: "DEV_PLAN_NAME",
            caption: "Программа"
        }, {
            name: "BUILD_STATUS_NAME",
            caption: "Статус"
        }, {
            name: "PLANNED_ACTION_NAME",
            caption: "Планируется"
        }, {
            name: "SET_OUT_METHOD_NAME",
            caption: "Метод расселения"
        }, {
            name: "BUILDING_STATE",
            caption: "Текущее состояние"
        }],
        zIndex: 400,
        visibleOnLoad: !0
    }, {
        "сaption": "Здания аварийные",
        tableName: "ORCL_PORTAL:V_PORTAL2_AVAR_BUILDINGS_G",
        tableNameAttr: "ORCL_PORTAL:V_PORTAL2_AVAR_BUILDINGS_A",
        style: {
            stroke: {
                color: "#907840",
                width: 1
            },
            fill: {
                color: "rgb(255, 102, 102)"
            }
        },
        minZoom: 17,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "FLOORS",
            caption: "Этажность"
        }, {
            name: "DEV_PLAN_NAME",
            caption: "Программа"
        }, {
            name: "BUILD_STATUS_NAME",
            caption: "Статус"
        }, {
            name: "PLANNED_ACTION_NAME",
            caption: "Планируется"
        }, {
            name: "SET_OUT_METHOD_NAME",
            caption: "Метод расселения"
        }, {
            name: "BUILDING_STATE",
            caption: "Текущее состояние"
        }],
        zIndex: 400,
        visibleOnLoad: !0
    }, {
        "сaption": "Развитие застроенных территорий",
        tableName: "ORCL_PORTAL:V_PORTAL_RZT",
        style: {
            stroke: {
                color: "rgb(0, 130, 0)",
                width: 1
            },
            fill: {
                color: "rgba(0, 130, 0, 0.3)"
            }
        },
        minZoom: 14,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "DISTRICT",
            caption: "Район"
        }, {
            name: "AREA",
            caption: "Площадь"
        }, {
            name: "AUCTION_DATE",
            caption: "Дата проведения аукциона"
        }, {
            name: "ZAKAZCHIK",
            caption: "Заказчик"
        }, {
            name: "INVESTOR",
            caption: "Инвестор"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Территории волнового переселения",
        tableName: "ORCL_PORTAL:V_PORTAL_VOLNA",
        style: {
            stroke: {
                color: "rgb(0, 2, 253)",
                width: 1
            },
            fill: {
                color: "rgba(0, 2, 253, 0.3)"
            }
        },
        minZoom: 14,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "AREA",
            caption: "Площадь"
        }, {
            name: "AUCTION_DATE",
            caption: "Дата проведения аукциона"
        }, {
            name: "ZAKAZCHIK",
            caption: "Заказчик"
        }, {
            name: "INVESTOR",
            caption: "Инвестор"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Генеральный план",
    layers: [{
        "сaption": "ЖИ",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHI%27",
        style: {
            stroke: {
                color: "#E4C676",
                width: 1
            },
            fill: {
                color: "rgba(228, 198, 118, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жи1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHI1%27",
        style: {
            stroke: {
                color: "#EDE6DF",
                width: 1
            },
            fill: {
                color: "rgba(237, 230, 223, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жи2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHI2%27",
        style: {
            stroke: {
                color: "#D4F87A",
                width: 1
            },
            fill: {
                color: "rgba(212, 248, 122, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жи3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHI3%27",
        style: {
            stroke: {
                color: "#BCF42E",
                width: 1
            },
            fill: {
                color: "rgba(188, 244, 46, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жм1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHM1%27",
        style: {
            stroke: {
                color: "#F8EC12",
                width: 1
            },
            fill: {
                color: "rgba(248, 236, 18, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жм2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHM2%27",
        style: {
            stroke: {
                color: "#F4D018",
                width: 1
            },
            fill: {
                color: "rgba(244, 208, 24, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жм3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHM3%27",
        style: {
            stroke: {
                color: "#ECAC18",
                width: 1
            },
            fill: {
                color: "rgba(236, 172, 24, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Жсм",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27ZHSM%27",
        style: {
            stroke: {
                color: "#FE842E",
                width: 1
            },
            fill: {
                color: "rgba(254, 132, 46, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "О-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27O-1%27",
        style: {
            stroke: {
                color: "#EA0000",
                width: 1
            },
            fill: {
                color: "rgba(234, 0, 0, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "О-2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27O-2%27",
        style: {
            stroke: {
                color: "#FC1C80",
                width: 1
            },
            fill: {
                color: "rgba(252, 28, 128, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "О-3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27O-3%27",
        style: {
            stroke: {
                color: "#BC6048",
                width: 1
            },
            fill: {
                color: "rgba(188, 96, 72, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ОИ-сп",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OI-SP%27",
        style: {
            stroke: {
                color: "#E890E0",
                width: 1
            },
            fill: {
                color: "rgba(232, 144, 224, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Од",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OD%27",
        style: {
            stroke: {
                color: "#762C58",
                width: 1
            },
            fill: {
                color: "rgba(118, 44, 88, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Ои",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OI%27",
        style: {
            stroke: {
                color: "#D252BE",
                width: 1
            },
            fill: {
                color: "rgba(210, 82, 190, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-а",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-A%27",
        style: {
            stroke: {
                color: "#E890E0",
                width: 1
            },
            fill: {
                color: "rgba(232, 144, 224, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-к",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-K%27",
        style: {
            stroke: {
                color: "#E890E0",
                width: 1
            },
            fill: {
                color: "rgba(232, 144, 224, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-л",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-L%27",
        style: {
            stroke: {
                color: "#E890E0",
                width: 1
            },
            fill: {
                color: "rgba(232, 144, 224, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-с",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-S%27",
        style: {
            stroke: {
                color: "#FACEB6",
                width: 1
            },
            fill: {
                color: "rgba(250, 206, 182, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-т",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-T%27",
        style: {
            stroke: {
                color: "#EA8E92",
                width: 1
            },
            fill: {
                color: "rgba(234, 142, 146, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Осп-у",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27OSP-U%27",
        style: {
            stroke: {
                color: "#E890E0",
                width: 1
            },
            fill: {
                color: "rgba(232, 144, 224, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ПК-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27PK-1%27",
        style: {
            stroke: {
                color: "#5474C2",
                width: 1
            },
            fill: {
                color: "rgba(84, 116, 194, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ПК-2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27PK-2%27",
        style: {
            stroke: {
                color: "#7C98CC",
                width: 1
            },
            fill: {
                color: "rgba(124, 152, 204, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ПК-3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27PK-3%27",
        style: {
            stroke: {
                color: "#94B4D0",
                width: 1
            },
            fill: {
                color: "rgba(148, 180, 208, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ПК-4",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27PK-4%27",
        style: {
            stroke: {
                color: "#A6C6D8",
                width: 1
            },
            fill: {
                color: "rgba(166, 198, 216, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ПК-о",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27PK-O%27",
        style: {
            stroke: {
                color: "#C08A90",
                width: 1
            },
            fill: {
                color: "rgba(192, 138, 144, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-1%27",
        style: {
            stroke: {
                color: "#68D288",
                width: 1
            },
            fill: {
                color: "rgba(104, 210, 136, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-2%27",
        style: {
            stroke: {
                color: "#BCDC86",
                width: 1
            },
            fill: {
                color: "rgba(188, 220, 134, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-2ц",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-2TS%27",
        style: {
            stroke: {
                color: "#BCDC86",
                width: 1
            },
            fill: {
                color: "rgba(188, 220, 134, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-3%27",
        style: {
            stroke: {
                color: "#74C250",
                width: 1
            },
            fill: {
                color: "rgba(116, 194, 80, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-3н",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-3N%27",
        style: {
            stroke: {
                color: "#74C250",
                width: 1
            },
            fill: {
                color: "rgba(116, 194, 80, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-3п",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-3P%27",
        style: {
            stroke: {
                color: "#60B842",
                width: 1
            },
            fill: {
                color: "rgba(96, 184, 66, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-3с",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-3S%27",
        style: {
            stroke: {
                color: "#74C250",
                width: 1
            },
            fill: {
                color: "rgba(116, 194, 80, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-3т",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-3T%27",
        style: {
            stroke: {
                color: "#60B842",
                width: 1
            },
            fill: {
                color: "rgba(96, 184, 66, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-4",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-4%27",
        style: {
            stroke: {
                color: "#D8D66E",
                width: 1
            },
            fill: {
                color: "rgba(216, 214, 110, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Р-5",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27R-5%27",
        style: {
            stroke: {
                color: "#B6E0BC",
                width: 1
            },
            fill: {
                color: "rgba(182, 224, 188, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "РИ",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27RI%27",
        style: {
            stroke: {
                color: "#68D288",
                width: 1
            },
            fill: {
                color: "rgba(104, 210, 136, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "С-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27S-1%27",
        style: {
            stroke: {
                color: "#84A8B0",
                width: 1
            },
            fill: {
                color: "rgba(132, 168, 176, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "С-2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27S-2%27",
        style: {
            stroke: {
                color: "#928290",
                width: 1
            },
            fill: {
                color: "rgba(146, 130, 144, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "С-3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27S-3%27",
        style: {
            stroke: {
                color: "#96A232",
                width: 1
            },
            fill: {
                color: "rgba(150, 162, 50, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "С-4",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27S-4%27",
        style: {
            stroke: {
                color: "#A696B6",
                width: 1
            },
            fill: {
                color: "rgba(166, 150, 182, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "С-5",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27S-5%27",
        style: {
            stroke: {
                color: "#76D6CE",
                width: 1
            },
            fill: {
                color: "rgba(118, 214, 206, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "СХ-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27SKH-1%27",
        style: {
            stroke: {
                color: "#F2F6C6",
                width: 1
            },
            fill: {
                color: "rgba(242, 246, 198, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Т-1",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27T-1%27",
        style: {
            stroke: {
                color: "#A2A6A8",
                width: 1
            },
            fill: {
                color: "rgba(162, 166, 168, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Т-2",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27T-2%27",
        style: {
            stroke: {
                color: "#A28CA2",
                width: 1
            },
            fill: {
                color: "rgba(162, 140, 162, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Т-3",
        tableName: "ORCL_PORTAL:V_POR_GEO_ZONE_FUNCTIONAL",
        filter: "REG_NUMBER_LAT=%27T-3%27",
        style: {
            stroke: {
                color: "#B0B2B4",
                width: 1
            },
            fill: {
                color: "rgba(176, 178, 180, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJECT",
            caption: "Наименование"
        }, {
            name: "PLACEMENT",
            caption: "Местоположение"
        }, {
            name: "INFO",
            caption: "Информация"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Правила землепользования и застройки",
    layers: [{
        "сaption": "ТОИ",
        title: "ТОИ - зона многофункциональной общественной застройки центрального исторического района, зон охраны объектов культурного наследия и зон достопримечательных мест",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=36",
        style: {
            stroke: {
                color: "rgb(145, 35, 85)",
                width: 1
            },
            fill: {
                color: "rgba(145, 35, 85, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТО-1",
        title: "ТО-1 - зона многофункциональной застройки городского центра и городских подцентров за пределами исторического района и охранных зон объектов культурного наследия",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=32",
        style: {
            stroke: {
                color: "rgb(155, 15, 5)",
                width: 1
            },
            fill: {
                color: "rgba(155, 15, 5, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТО-2",
        title: "ТО-2 - зона многофункциональной общественной застройки местного значения – городских районов и планировочных частей",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=33",
        style: {
            stroke: {
                color: "rgb(195, 35, 25)",
                width: 1
            },
            fill: {
                color: "rgba(195, 35, 25, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТО-3",
        title: "ТО-3 - зона многофункциональной общественной застройки, коммунально-обслуживающих функций, административно-производственных объектов, мелко-оптовой и оптовой торговли, крупных рынков городского и местного значения, малого бизнеса, преимущественно ориентированные на автомобилистов",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=34",
        style: {
            stroke: {
                color: "rgb(195, 65, 55)",
                width: 1
            },
            fill: {
                color: "rgba(195, 65, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОД",
        title: "ТОД - зона многофункциональной общественно-деловой застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=35",
        style: {
            stroke: {
                color: "rgb(105, 0, 25)",
                width: 1
            },
            fill: {
                color: "rgba(105, 0, 25, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-к",
        title: "ТОсп-к - зона культурно-просветительского назначения и культурных объектов",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=37",
        style: {
            stroke: {
                color: "rgb(180, 87, 210)",
                width: 1
            },
            fill: {
                color: "rgba(180, 87, 210, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-л",
        title: "ТОсп-л - зона лечебно-оздоровительных учреждений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=38",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-с",
        title: "ТОсп-с - зона спортивно-рекреационного и развлекательного назначения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=39",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-т",
        title: "ТОсп-т - зона торгово-бытового назначения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=41",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-у",
        title: "ТОсп-у - зона учебно-образовательных учреждений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=42",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТОсп-сп",
        title: "ТОсп-сп - зона объектов массовой культуры городского значения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=40",
        style: {
            stroke: {
                color: "rgb(70, 38, 60)",
                width: 1
            },
            fill: {
                color: "rgba(70, 38, 60, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖИ",
        title: "ТЖИ - зона жилой застройки центрального исторического района",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=24",
        style: {
            stroke: {
                color: "rgb(235, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(235, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖи-1",
        title: "ТЖи-1 - зона индивидуальной низкоплотной жилой застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=25",
        style: {
            stroke: {
                color: "rgb(195, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(195, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖи-2",
        title: "ТЖи-2 - зона индивидуальной среднеплотной жилой застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=26",
        style: {
            stroke: {
                color: "rgb(215, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(215, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖи-3",
        title: "ТЖи-3 - зона индивидуальной высокоплотной жилой застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=27",
        style: {
            stroke: {
                color: "rgb(235, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(235, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖм-1",
        title: "ТЖм-1 - зона многоквартирной низкоплотной, малоэтажной застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=28",
        style: {
            stroke: {
                color: "rgb(245, 205, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 205, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖм-2",
        title: "ТЖм-2 - зона многоквартирной среднеплотной, среднеэтажной застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=29",
        style: {
            stroke: {
                color: "rgb(245, 175, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 175, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖм-3",
        title: "ТЖм-3 - зона многоквартирной высокоплотной многоэтажной застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=30",
        style: {
            stroke: {
                color: "rgb(245, 145, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 145, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТЖсм",
        title: "ТЖсм - зона смешанной многоквартирной и общественной застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=31",
        style: {
            stroke: {
                color: "rgb(255, 102, 0)",
                width: 1
            },
            fill: {
                color: "rgba(255, 102, 0, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТПК-1",
        title: "ТПК-1 - зона производственно-коммунальных объектов I-II класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=43",
        style: {
            stroke: {
                color: "rgb(75, 95, 175)",
                width: 1
            },
            fill: {
                color: "rgba(75, 95, 175, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТПК-2",
        title: "ТПК-2 - зона производственно-коммунальных объектов III класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=44",
        style: {
            stroke: {
                color: "rgb(105, 125, 195)",
                width: 1
            },
            fill: {
                color: "rgba(105, 125, 195, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТПК-3",
        title: "ТПК-3 - зона производственно-коммунальных объектов IV класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=45",
        style: {
            stroke: {
                color: "rgb(135, 155, 215)",
                width: 1
            },
            fill: {
                color: "rgba(135, 155, 215, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТПК-4",
        title: "ТПК-4 - зона производственно-коммунальных объектов V класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=46",
        style: {
            stroke: {
                color: "rgb(165, 185, 235)",
                width: 1
            },
            fill: {
                color: "rgba(165, 185, 235, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТПК-о",
        title: "ТПК-о - зона коммунально-обслуживающих объектов, предусматривающих небольшие посетительские потоки, V класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=47",
        style: {
            stroke: {
                color: "rgb(185, 165, 215)",
                width: 1
            },
            fill: {
                color: "rgba(185, 165, 215, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТРИ",
        title: "ТРИ - зона охраняемых природных ландшафтов центрального исторического района",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=57",
        style: {
            stroke: {
                color: "rgb(101, 141, 117)",
                width: 1
            },
            fill: {
                color: "rgba(101, 141, 117, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-1",
        title: "ТР-1 - зона охраняемых природных территорий",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=48",
        style: {
            stroke: {
                color: "rgb(0, 128, 0)",
                width: 1
            },
            fill: {
                color: "rgba(0, 128, 0, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-2",
        title: "ТР-2 - зона рекреационно-ландшафтных территорий со средними нагрузками",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=49",
        style: {
            stroke: {
                color: "rgb(78, 190, 78)",
                width: 1
            },
            fill: {
                color: "rgba(78, 190, 78, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-3",
        title: "ТР-3 - зона рекреационно-ландшафтных территорий с высокими нагрузками",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=50",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-3т",
        title: "ТР-3т - зона природных территорий со сложными инженерно-геологическими условиями",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=54",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-3н",
        title: "ТР-3н - зона набережных",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=51",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-3п",
        title: "ТР-3п - зона парков",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=52",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-3с",
        title: "ТР-3с - зона скверов, бульваров",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=53",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-4",
        title: "ТР-4 - зона коллективного садоводства",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=55",
        style: {
            stroke: {
                color: "rgb(180, 180, 80)",
                width: 1
            },
            fill: {
                color: "rgba(180, 180, 80, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТР-5",
        title: "ТР-5 - зона природного ландшафта – резерв рекреационного и градостроительного развития",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=56",
        style: {
            stroke: {
                color: "rgb(145, 195, 175)",
                width: 1
            },
            fill: {
                color: "rgba(145, 195, 175, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТС-1",
        title: "ТС-1 - зона водозаборных и иных технических сооружений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=58",
        style: {
            stroke: {
                color: "rgb(115, 165, 165)",
                width: 1
            },
            fill: {
                color: "rgba(115, 165, 165, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТС-2",
        title: "ТС-2 - зона очистных сооружений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=59",
        style: {
            stroke: {
                color: "rgb(115, 165, 165)",
                width: 1
            },
            fill: {
                color: "rgba(115, 165, 165, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТС-3",
        title: "ТС-3 - зона кладбищ и мемориальных сооружений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=60",
        style: {
            stroke: {
                color: "rgb(115, 165, 165)",
                width: 1
            },
            fill: {
                color: "rgba(115, 165, 165, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТС-4",
        title: "ТС-4 - зона режимных объектов ограниченного доступа",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=61",
        style: {
            stroke: {
                color: "rgb(115, 165, 165)",
                width: 1
            },
            fill: {
                color: "rgba(115, 165, 165, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТС-5",
        title: "ТС-5 - зона озелененных территорий специального назначения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=62",
        style: {
            stroke: {
                color: "rgb(135, 165, 115)",
                width: 1
            },
            fill: {
                color: "rgba(135, 165, 115, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТСХ-1",
        title: "ТСХ-1 - зона сельскохозяйственного использования",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=63",
        style: {
            stroke: {
                color: "rgb(150, 225, 150)",
                width: 1
            },
            fill: {
                color: "rgba(150, 225, 150, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "ТТ-2",
        title: "ТТ-2 - зона аэродромов",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=64",
        style: {
            stroke: {
                color: "rgb(106, 106, 106)",
                width: 1
            },
            fill: {
                color: "rgba(106, 106, 106, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТОИ",
        title: "П*ТОИ - зона реорганизации застройки в многофункциональную общественную застройку в границах центрального исторического района, зон охраны объектов культурного наследия и зон достопримечательных мест",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=13",
        style: {
            stroke: {
                color: "rgb(145, 35, 85)",
                width: 1
            },
            fill: {
                color: "rgba(145, 35, 85, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТОД",
        title: "П*ТОД - зона реорганизации застройки в многофункциональную общественно-деловую застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=12",
        style: {
            stroke: {
                color: "rgb(105, 0, 25)",
                width: 1
            },
            fill: {
                color: "rgba(105, 0, 25, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТО-1",
        title: "П*ТО-1 - зона реорганизации застройки в многофункциональную застройку городского центра и городских подцентров за пределами исторического района и охранных зон объектов культурного наследия",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=9",
        style: {
            stroke: {
                color: "rgb(155, 15, 5)",
                width: 1
            },
            fill: {
                color: "rgba(155, 15, 5, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТО-2",
        title: "П*ТО-2 - зона реорганизации застройки в многофункциональную общественную застройку местного значения – городских районов и планировочных частей",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=10",
        style: {
            stroke: {
                color: "rgb(195, 35, 25)",
                width: 1
            },
            fill: {
                color: "rgba(195, 35, 25, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТО-3",
        title: "П*ТО-3 - зона реорганизации застройки в многофункц.обществ. застройку, коммунально-обслужив. функций, администр.-производ. объектов, мелко-оптовой и оптовой торговли, крупных рынков город. и местн. значения, малого бизнеса, преимущ. ориентир. на автомобилистов",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=11",
        style: {
            stroke: {
                color: "rgb(195, 65, 55)",
                width: 1
            },
            fill: {
                color: "rgba(195, 65, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТОсп-л",
        title: "П*ТОсп-л - зона реорганизации застройки в застройку лечебно-оздоровительных учреждений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=14",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТОсп-с",
        title: "П*ТОсп-с - зона реорганизации застройки в застройку спортивно-рекреационного и развлекательного назначения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=15",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТОсп-т",
        title: "П*ТОсп-т - зона реорганизации застройки в застройку торгово-бытового назначения",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=16",
        style: {
            stroke: {
                color: "rgb(225, 75, 155)",
                width: 1
            },
            fill: {
                color: "rgba(225, 75, 155, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖсм",
        title: "П*ТЖсм - зона реорганизации застройки в смешанную многоквартирную и общественную застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=8",
        style: {
            stroke: {
                color: "rgb(255, 102, 0)",
                width: 1
            },
            fill: {
                color: "rgba(255, 102, 0, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖИ",
        title: "П*ТЖИ - зона реорганизации застройки в жилую застройку центрального исторического района",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=1",
        style: {
            stroke: {
                color: "rgb(235, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(235, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖи-1",
        title: "П*ТЖи-1 - зона реорганизации застройки в индивидуальную низкоплотную жилую застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=2",
        style: {
            stroke: {
                color: "rgb(195, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(195, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖи-2",
        title: "П*ТЖи-2 - зона реорганизации застройки в индивидуальную среднеплотную жилую застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=3",
        style: {
            stroke: {
                color: "rgb(215, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(215, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖи-3",
        title: "П*ТЖи-3 - зона реорганизации застройки в индивидуальную высокоплотную жилую застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=4",
        style: {
            stroke: {
                color: "rgb(235, 235, 65)",
                width: 1
            },
            fill: {
                color: "rgba(235, 235, 65, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖм-1",
        title: "П*ТЖм-1 - зона реорганизации застройки в зону многоквартирной низкоплотной, малоэтажной застройки",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=5",
        style: {
            stroke: {
                color: "rgb(245, 205, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 205, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖм-2",
        title: "П*ТЖм-2 - зона реорганизации застройки в многоквартирную среднеплотную, среднеэтажную застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=6",
        style: {
            stroke: {
                color: "rgb(245, 175, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 175, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТЖм-3",
        title: "П*ТЖм-3 - зона реорганизации застройки в многоквартирную высокоплотную многоэтажную застройку",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=7",
        style: {
            stroke: {
                color: "rgb(245, 145, 55)",
                width: 1
            },
            fill: {
                color: "rgba(245, 145, 55, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТПК-о",
        title: "П*ТПК-о - зона реорганизации застройки в застройку коммунально-обслуживающих объектов, предусматривающих небольшие посетительские потоки, V класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=19",
        style: {
            stroke: {
                color: "rgb(185, 165, 215)",
                width: 1
            },
            fill: {
                color: "rgba(185, 165, 215, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТПК-3",
        title: "П*ТПК-3 - зона реорганизации застройки в застройку производственно-коммунальных объектов IV класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=17",
        style: {
            stroke: {
                color: "rgb(135, 155, 215)",
                width: 1
            },
            fill: {
                color: "rgba(135, 155, 215, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТПК-4",
        title: "П*ТПК-4 - зона реорганизации застройки в застройку производственно-коммунальных объектов V класса опасности",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=18",
        style: {
            stroke: {
                color: "rgb(165, 185, 235)",
                width: 1
            },
            fill: {
                color: "rgba(165, 185, 235, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТС-1",
        title: "П*ТС-1 - зона реорганизации застройки в зону водозаборных и иных технических сооружений",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=22",
        style: {
            stroke: {
                color: "rgb(115, 165, 165)",
                width: 1
            },
            fill: {
                color: "rgba(115, 165, 165, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТР-2",
        title: "П*ТР-2 - зона реорганизации застройки в зону рекреационно-ландшафтных территорий со средними нагрузками",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=20",
        style: {
            stroke: {
                color: "rgb(78, 190, 78)",
                width: 1
            },
            fill: {
                color: "rgba(78, 190, 78, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТР-3п",
        title: "П*ТР-3п - зона реорганизации застройки в зону рекреационно-ландшафтных территорий со средними нагрузками",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=21",
        style: {
            stroke: {
                color: "rgb(80, 160, 40)",
                width: 1
            },
            fill: {
                color: "rgba(80, 160, 40, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "П*ТСХ-1",
        title: "П*ТСХ-1 - зона реорганизации застройки в зону сельскохозяйственного использования",
        tableName: "ORCL_PORTAL:UDC_PZZ2018",
        filter: "TIP1=23",
        style: {
            stroke: {
                color: "rgb(150, 225, 150)",
                width: 1
            },
            fill: {
                color: "rgba(150, 225, 150, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "TIP",
            caption: "Тип"
        }, {
            name: "VID",
            caption: "Вид"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Проекты планировки и межевания",
    layers: [{
        "сaption": "Проекты планировки и межевания",
        tableName: "ORCL_PORTAL:V_PORTAL_PPM",
        style: {
            stroke: {
                color: "rgb(255, 0, 255)",
                width: 1
            },
            fill: {
                color: "rgba(255, 0, 255, 0.3)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJ",
            caption: "Наименование"
        }, {
            name: "ZAKAZ",
            caption: "Заказчик"
        }, {
            name: "NOMER",
            caption: "Номер"
        }, {
            name: "DATA_DOC",
            caption: "Дата"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Разрешения на строительство",
    layers: [{
        "сaption": "Разрешения на строительство",
        tableName: "ORCL_PORTAL:V_PORTAL_RAZR_NA_STR",
        style: {
            stroke: {
                color: "rgb(83, 1, 1)",
                width: 1
            },
            fill: {
                color: "rgba(83, 1, 1, 0.3)"
            }
        },
        minZoom: 15,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJ",
            caption: "Наименование"
        }, {
            name: "ZAKAZ",
            caption: "Заказчик"
        }, {
            name: "NOMER",
            caption: "Номер"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Ордера на производство земляных работ",
    layers: [{
        "сaption": "Ордера на производство земляных работ",
        tableName: "ORCL_PORTAL:V_PORTAL2_UDC_ATI",
        filter: "D_START%3C%3D+curDateString+%20AND%20D_END%3E%3D+ curDateString",
        style: {
            stroke: {
                color: "rgb(171, 10, 33)",
                width: 1
            },
            fill: {
                color: "rgba(171, 10, 33, 0.3)"
            }
        },
        showFields: [{
            name: "NAIM_ORG",
            caption: "Наименование организации"
        }, {
            name: "FIO",
            caption: "Ответственное лицо"
        }, {
            name: "TEL",
            caption: "Телефон"
        }, {
            name: "ADR_M",
            caption: "Адрес места производства работ"
        }, {
            name: "D_START_STR",
            caption: "Дата начала работ"
        }, {
            name: "D_END_STR",
            caption: "Дата окончания работ"
        }],
        geomNameForBbox: "GEOMETRY",
        zIndex: 500,
        visibleOnLoad: !1
    }]
}, {
    name: "Контроль закрепления прилегающих территорий",
    layers: [{
        "сaption": "Автозаводский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=1",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Канавинский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=2",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Ленинский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=3",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Московский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=4",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Нижегородский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=5",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Приокский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=6",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Советский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=7",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }, {
        "сaption": "Сормовский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_KZPT",
        filter: "DISTRICT_ID=8",
        style: {
            "1": {
                stroke: {
                    color: "rgb(255, 0, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 0, 0, 0.3)"
                }
            },
            "2": {
                stroke: {
                    color: "rgb(255, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(255, 255, 0, 0.3)"
                }
            },
            "3": {
                stroke: {
                    color: "rgb(0, 255, 0)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 255, 0, 0.3)"
                }
            },
            "4": {
                stroke: {
                    color: "rgb(0, 0, 255)",
                    width: 1
                },
                fill: {
                    color: "rgba(0, 0, 255, 0.3)"
                }
            }
        },
        styleIdentifyingField: "STATUS_ID",
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KN",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS_TEXT",
            caption: "Состояние"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }]
}, {
    name: "Объекты культурного наследия",
    layers: [{
        "сaption": "Объекты культурного наследия",
        tableName: "ORCL_PORTAL:V_PORTAL_UDC_OKN",
        style: {
            stroke: {
                color: "rgb(255, 215, 0)",
                width: 1
            },
            fill: {
                color: "rgba(255, 215, 0, 0.3)"
            }
        },
        minZoom: 11,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJ",
            caption: "Наименование"
        }, {
            name: "TYPE_OKN",
            caption: "Вид"
        }, {
            name: "NOMER_REESTR2",
            caption: "Номер в реестре"
        }, {
            name: "ADRESS",
            caption: "Адрес"
        }, {
            name: "CATEG_OKN",
            caption: "Категория"
        }, {
            name: "TIPOLOGIYA_OKN",
            caption: "Типология"
        }],
        zIndex: 600,
        visibleOnLoad: !1
    }]
}, {
    name: "Земельные участки ГКН",
    layers: [{
        "сaption": "Земельные участки ГКН",
        tableName: "ORCL_PORTAL:V_PORTAL_GKN",
        style: {
            stroke: {
                color: "#006600",
                width: 1
            },
            fill: {
                color: "rgba(255, 255, 255, 0)"
            }
        },
        minZoom: 16,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KAD_NOM",
            caption: "Кадастровый номер"
        }, {
            name: "STATUS",
            caption: "Статус"
        }, {
            name: "AREA",
            caption: "Площадь, кв.м."
        }, {
            name: "CEL",
            caption: "Цель"
        }, {
            name: "FORM_SOBST",
            caption: "Форма собственности"
        }, {
            name: "VID",
            caption: "Вид"
        }, {
            name: "KATEGORIYA",
            caption: "Категория"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Зоны с особыми условиями использования, содержащиеся в ЕГРН",
    layers: [{
        "сaption": "Зоны с особыми условиями использования, содержащиеся в ЕГРН",
        tableName: "ORCL_PORTAL:UDC_KADAST_ZON",
        style: {
            stroke: {
                color: "#660066",
                width: 1
            },
            fill: {
                color: "rgba(255, 255, 255, 0)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME",
            caption: "Наименование"
        }, {
            name: "OPIS",
            caption: "Описание"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Схема размещения рекламных конструкций",
    layers: [{
        "сaption": "Схема размещения рекламных конструкций",
        tableName: "ORCL_PORTAL:V_PORTAL2_AD",
        style: {
            "0": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "1": {
                image: {
                    anchor: [0.5, 20],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/ostanovka-24x24.png"
                }
            },
            "2": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/ukazatel-24x24.png"
                }
            },
            "3": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/skameika-24x24.png"
                }
            },
            "4": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/siti-format-24x24.png"
                }
            },
            "5": {
                image: {
                    anchor: [0.6, 20],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/afishnyi-stend-24x24.png"
                }
            },
            "6": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/tumba-pillar-24x24.png"
                }
            },
            "7": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/tumba-pillar-24x24.png"
                }
            },
            "8": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/siti-bord-24x24.png"
                }
            },
            "9": {
                image: {
                    anchor: [0.6, 20],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/shit-3х4-24x24.png"
                }
            },
            "10": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/shit-6х3-24x24.png"
                }
            },
            "11": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/superbord-24x24.png"
                }
            },
            "12": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/supersait-24x24.png"
                }
            },
            "13": {
                image: {
                    anchor: [0.5, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/unikalka-24x24.png"
                }
            },
            "14": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "15": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "16": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "17": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "18": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/flagshtok-24x24.png"
                }
            },
            "19": {
                image: {
                    radius: 5,
                    fill: {
                        color: "green"
                    },
                    stroke: {
                        color: "black",
                        width: 1
                    }
                }
            },
            "20": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/flagovaya-kompozitsia-24x24.png"
                }
            },
            "21": {
                image: {
                    anchor: [0.4, 26],
                    anchorXUnits: "fraction",
                    anchorYUnits: "pixels",
                    opacity: 1,
                    src: "img/layer-icons/rk/shtender-24x24.png"
                }
            }
        },
        styleIdentifyingField: "KK_ID",
        minZoom: 16,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KK_TITLE",
            caption: "Тип"
        }, {
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "S",
            caption: "Площадь (кв.м.)"
        }, {
            name: "N_POZ",
            caption: "Номер позиции в Схеме"
        }],
        zIndex: 550,
        visibleOnLoad: !1
    }, {
        "сaption": "Действующие разрешения на установку рекламных конструкций",
        tableName: "ORCL_PORTAL:V_PORTAL2_AD_PERM_ACTUAL",
        style: {
            image: {
                radius: 5,
                fill: {
                    color: "yellow"
                },
                stroke: {
                    color: "black",
                    width: 1
                }
            }
        },
        minZoom: 16,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "KK_TITLE",
            caption: "Тип"
        }, {
            name: "ADDRESS",
            caption: "Адрес"
        }, {
            name: "OWNER",
            caption: "Владелец"
        }, {
            name: "S",
            caption: "Площадь (кв.м.)"
        }, {
            name: "N_PASSPORT",
            caption: "Паспорт рекламного места"
        }, {
            name: "CODE",
            caption: "Номер разрешения"
        }, {
            name: "PERIOD",
            caption: "Период действия"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }]
}, {
    name: "Информационные конструкции",
    layers: [{
        "сaption": "Информационные конструкции",
        tableName: "ORCL_PORTAL:UDC_INFORM_CONSTRUC",
        blobType: "ik",
        style: {
            image: {
                radius: 5,
                fill: {
                    color: "#ff7800"
                },
                stroke: {
                    color: "black",
                    width: 1
                }
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ADDRESS",
            caption: "Адрес"
        }],
        zIndex: 500,
        visibleOnLoad: !1
    }]
}, {
    name: "Нестационарные торговые объекты",
    layers: [{
        "сaption": "Нестационарные торговые объекты",
        tableName: "ORCL_PORTAL:UDC_PAVILIONS",
        filter: "RASM_STATION_ID=1%20OR%20RASM_STATION_ID=4%20OR%20RASM_STATION_ID=21%20OR%20RASM_STATION_ID=25",
        blobType: "nto",
        style: {
            stroke: {
                color: "rgb(102, 0, 221)",
                width: 1
            },
            fill: {
                color: "rgba(102, 0, 221, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "MESTO",
            caption: "Адрес торгового объекта"
        }, {
            name: "TYPE",
            caption: "Тип торгового объекта"
        }, {
            name: "AREA",
            caption: "Площадь торгового объекта, кв.м"
        }, {
            name: "SROK",
            caption: "Срок размещения торгового объекта"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Территории уборки города",
    layers: [{
        "сaption": "Автозаводский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=1",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Канавинский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=2",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Ленинский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=3",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Московский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=4",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Нижегородский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=5",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Приокский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=6",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Советский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=7",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Сормовский район",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT",
        filter: "REGION_ID=8",
        style: {
            stroke: {
                color: "rgb(128, 64, 64)",
                width: 1
            },
            fill: {
                color: "rgba(128, 64, 64, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Благоустройство и дорожное хозяйство",
    layers: [{
        "сaption": "Содержание автомобильных дорог",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_SAD",
        style: {
            stroke: {
                color: "rgb(128, 128, 128)",
                width: 1
            },
            fill: {
                color: "rgba(128, 128, 128, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }, {
            name: "CATEG",
            caption: "Категория дорог"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Содержание объектов озеленения",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_SOO",
        style: {
            stroke: {
                color: "rgb(96, 204, 8)",
                width: 1
            },
            fill: {
                color: "rgba(96, 204, 8, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Название территории"
        }, {
            name: "S_ABCD",
            caption: "Площадь уборки, кв.м"
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }, {
        "сaption": "Контейнерные площадки",
        tableName: "ORCL_PORTAL:V_PORTAL2_UBORKA_CONT",
        style: {
            stroke: {
                color: "rgb(108, 120, 232)",
                width: 1
            },
            fill: {
                color: "rgba(108, 120, 232, 0.5)"
            }
        },
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "REGION",
            caption: "Район"
        }, {
            name: "NAME_TRR",
            caption: "Адрес нахождения"
        }, {
            name: "S_ABCD",
            caption: "Кол-во контейнеров на КП, шт."
        }, {
            name: "ORGANIZATION",
            caption: "Ответственный организатор"
        }, {
            name: "CONTACT",
            caption: "Контактное лицо (ФИО)"
        }, {
            name: "PHONE",
            caption: "Телефон"
        }],
        zIndex: 300,
        visibleOnLoad: !1
    }]
}, {
    name: "Дополнительные информационные слои",
    layers: [{
        "сaption": "Шлагбаумы",
        tableName: "ORCL_PORTAL:UDC_GATE",
        style: {
            image: {
                fill: {
                    color: "rgb(255, 0, 0)"
                },
                stroke: {
                    color: "#000",
                    width: 1
                },
                radius: 5
            }
        },
        minZoom: 11,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "ZAK",
            caption: "Заказчик"
        }, {
            name: "ADDRESS",
            caption: "Адрес"
        }],
        zIndex: 700,
        visibleOnLoad: !1
    }, {
        "сaption": "Зоны безалкогольной торговли",
        tableName: "ORCL_PORTAL:UDC_Z_ALKOGOL",
        style: {
            stroke: {
                color: "rgb(128, 128, 128)",
                width: 1
            },
            fill: {
                color: "rgba(128, 128, 128, 0.3)"
            }
        },
        minZoom: 11,
        geomNameForBbox: "GEOMETRY",
        showFields: [{
            name: "NAME_OBJ",
            caption: "Наименование"
        }, {
            name: "ADRESS_OBJ",
            caption: "Местоположение"
        }, {
            name: "DOC_ZON",
            caption: '"Постановление об утверждении'
        }, {
            name: "DOC_IZM_ZON",
            caption: "Постановление об изменении"
        }],
        zIndex: 700,
        visibleOnLoad: !1
    }]
}];
layers = layersGroupConfig.flat_map { |g| g[:layers] }.map { |l| l.values_at(:сaption, :tableName) }

bbox = [
  4863191.269102, 7641409.717669,
  4913448.615199, 7601929.992560
]
bbox_coords = bbox.join(',')

piecewise = %w[
  ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_G
  ORCL_PORTAL:V_PORTAL2_UDC_ATI
  ORCL_PORTAL:V_PORTAL_GKN
  ORCL_PORTAL:V_PORTAL2_AD_PERM_ACTUAL
  ORCL_PORTAL:V_PORTAL2_UBORKA_SAD
  ORCL_PORTAL:V_PORTAL2_UBORKA_ZUT
]

attrs = %w[
  ORCL_PORTAL:V_PORTAL2_EXIST_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_CONSTR_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_VETH_BUILDINGS_A
  ORCL_PORTAL:V_PORTAL2_AVAR_BUILDINGS_A
]

attrs.each do |table|
  params = "http://localhost:8080/geoserver/ORCL_PORTAL/ows?service=WFS&version=1.0.0&request=GetFeature&outputFormat=application%2Fjson&typeName=#{table}"
  uri = "https://geonn.grad-nn.ru/proxy.php?url=" + CGI::escape(params)
  puts uri
  `curl -o "data/#{table}.json" -k #{uri}`
end

exit

(layers.map { |_, table| table }.uniq - piecewise).each do |table|
  params = "http://localhost:8080/geoserver/ORCL_PORTAL/ows?service=WFS&version=1.0.0&request=GetFeature&outputFormat=application%2Fjson&typeName=#{table}"
  uri = "https://geonn.grad-nn.ru/proxy.php?url=" + CGI::escape(params)
  puts uri
  `curl -o "data/#{table}.json" -k #{uri}`
end

