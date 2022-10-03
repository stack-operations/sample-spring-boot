/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
USE `--demo_db_replace_me--`;

INSERT INTO `template_location` (`TEMPLATE_LOCATION_ID`, `LOCATION_NAME`, `STATUS_TLM`, `LAST_UPDATED`) VALUES (27, 'Employee Profile', '2020-07-01 09:59:21', '2020-07-01 09:59:22');
INSERT INTO `customise_view` (`CUSTOMISE_VIEW_ID`, `ORG_ID`, `TENANT_ID`, `LOADED`, `NAME`, `DESCRIPTION`, `TEMPLATE`, `TEMPLATE_LOCATION_ID`, `STATUS`, `STATUS_TLM`, `WHEN_CREATED`, `MODIFIED_BY`, `CREATED_BY`, `LAST_UPDATED`) VALUES (31, 1, 1, b'1', 'Employee Profile', 'Employee Profile', '[ {\r\n  "id" : 0,\r\n  "fields" : [ {\r\n    "id" : "26",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "20",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "18",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "199",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "260",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "92",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "73",\r\n    "type" : "metadata"\r\n  }, {\r\n    "id" : "22",\r\n    "type" : "metadata"\r\n  } ]\r\n} ]', 27, 'ACTIVE', '2021-03-26 16:53:25', '2021-03-26 16:53:25', 13, 13, '2021-03-26 16:53:25');

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;