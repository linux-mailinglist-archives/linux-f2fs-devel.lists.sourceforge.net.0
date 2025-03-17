Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272CA645F5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 09:41:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu62g-0004CL-P5;
	Mon, 17 Mar 2025 08:41:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tu62e-0004CE-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 08:41:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Gr20c4g8fzJbm+YhBuVcVavLvJvOt47DfzgrJE9yJw=; b=GgvTXBlpxJzmybMA99V9EEN0LO
 vldBf2i3MGHDOnK4s6DtqsRqziI2vcxS9+NozGfzAbmw+DoGRf05tGh5ZV517o2dTSVMTZrwNRsMP
 +pHF3HJ4qJGTd22shPc8tRbEHOLdxprqfE22JP8ZOkh4ocMawb3FSizrLKg+aVYzGsRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Gr20c4g8fzJbm+YhBuVcVavLvJvOt47DfzgrJE9yJw=; b=JlHpPCHpsY7Cm5l4h2M2awoKca
 4Y0ROlHAmwW70XGo45unhZhpq31pGcMHJbe8OGuicI5Z25nwRooyjEBrPc/HN7w66f5QmcFHX/4S/
 tITReYl9X1mG0aTh1EtwLsPnQT3n5G8xUIGeoKOFvO/QUQ2oDMd3F6zLEokOLhICPsU8=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu62S-00036p-Vb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 08:41:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oMms34EWwa7WYemZ0UM1uGweA4l6SBsDUoW2Q7YwJ3ZEYGSCHKvC/xeSI75lp4vFQjCWMOzRWSitx9fq4cSdh8hhYnxy0H87dzB43/mYwuUqvCEb/+p0sUWIx8WHE0A5WERD7r78YCVirb+/EyFAKGZol0a3rpXgTCEidZKc+/Pa2MlukUJopTL+bq8nVhAN4XyRcrRQ5X/XAcNcgk1yoqTJ0bql4oAnP0pTuzaHNImYeSKNhweRjc/BmX5NXe1VssyJ27MNkrSaLra0+C+76nbpfu0q/sfTnWFaFElUgKRT+X/GPw892u/hpop+SzVY1guHMgzNopzpQqnvoplUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gr20c4g8fzJbm+YhBuVcVavLvJvOt47DfzgrJE9yJw=;
 b=axrj8nsTSCUDkMMxaxoJd6RZiiupeKRyhebWEXLlV3NhQ3RU9k7RAqpV4+kwRE797RF2lsI3/SioBvQkUao5P618waXn5ddnhmGszLUkch+vCjv3OWND8gEN6sW/fmIdjkcEoU17daGuws11LZDIKk1ctBwiZVmzo6LpIqRqwI9y8uJLZps7fonE/IPiMhqgsI+xCT0p/nz5A0PF0xq5F3XcDwanMk606WsTQkBRBSoxqYMkRSV58sVq424CXo/XhEwkJnByVyxHOZUr3WaUa6CWiHuv8URrgyvb1Inq1VfxWHVfgH83NU4tvyPIqYhe3B4Y0WjxHKFe7sH7YYH4Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gr20c4g8fzJbm+YhBuVcVavLvJvOt47DfzgrJE9yJw=;
 b=Fjje6+ehhNLV7zhIsVpQIxNHCrznh9ElGbdpdZn0/PgIttAkCSVWSJn9hBMYJn/II1ugH+65CPctCdTU65bi5ZfLB4aQOiwA0H8Hjut6udzfYggzenE0vpFaPUq13rD5op440vujyyyIwuD2COrMo46YHMIm5772zXfiq7ENflaZOh722CIf+cupfxMBQtVJErWewyyl9aSiNa3cvI//3gQ2lukSX/ucdFeHWcC0cxxcV5z7fjwSdNd8Q+KYehMiGU1QAO56ZXpHxLP71RXf6xLm7LHTSJsmoogMmtpDGJKkwSbUd9qaCyERR05fhWkTpSDyma6EWrgqRl7AbCoJ7A==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEZPR06MB5920.apcprd06.prod.outlook.com (2603:1096:101:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:27:05 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Mon, 17 Mar 2025
 08:27:04 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: fix missing discard for active segments
Thread-Index: AQHbYo97IM4VJ+ShM0Cx72FTZCbyqbMfp5AAgFERrQCABpkyAIAAFSsA
Date: Mon, 17 Mar 2025 08:27:04 +0000
Message-ID: <47f3cf96-62fc-4bb2-936f-dd4564e4afe5@vivo.com>
References: <20250109122755.177926-1-guochunhai@vivo.com>
 <4270b213-e4f9-46b2-958a-df3dbaaed969@kernel.org>
 <95b8334a-45e6-496a-8b0b-ab7a7fe180b5@vivo.com>
 <610d08c6-fe48-4013-98d0-867d23da506d@kernel.org>
In-Reply-To: <610d08c6-fe48-4013-98d0-867d23da506d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|SEZPR06MB5920:EE_
x-ms-office365-filtering-correlation-id: 05a21c61-54fe-488e-48db-08dd652d7fbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eHBHOUs0Z1NOREhOS21zNzk0U3daUDFuTzZ2aGgvUmg2VVZCVlh3VDBtdkpn?=
 =?utf-8?B?Y2VwelVrM2VrSzFRTThpOHhqR2RQZ25pMGZQK1pRejF3UG9QTlA2MDZwUVUw?=
 =?utf-8?B?cUlpYkVEY3ZReWYyVEZwdllRbXJMSGlmU1ltNFlKVzZLdExNNUhOKy9ZRDB4?=
 =?utf-8?B?aktScXd2RGhuVWJxcks4VEJ5V1BzMmJ5UXhKdGVockhrNGJwRjNhMTBsRG1X?=
 =?utf-8?B?Q0ZtbHc5RWRvRlZ4RVhZdXFzclp4dmw1cVE1MVRMbTBFNGhRWXpxd2k1YU5o?=
 =?utf-8?B?bmI0bTVmMWt1ZkRzbTFsRW02OGhBbTc5MWdNeitkU3AzVlRNU0MwcEVzL0dV?=
 =?utf-8?B?S0cxNWVwRG5EYUNFUVpIQTF5TTV1bFM3M3FXYUtNOWRXNVlXaW9YYzY5dnZk?=
 =?utf-8?B?SlhaUWs2YVBVLzc0Zkcvdit4alp5aXEvYjdjbGt5Zlp3cXhPYVJvTEdKY2dS?=
 =?utf-8?B?bGkrd0lIY3pDbjlpSWJYbzlJMWNxWkJHK2lpYmQvdmFkajlsNmlZb1o4TVZx?=
 =?utf-8?B?QlRBVDVESTZJMzJOYWlhTFUyTFNrUEtZVFVFS0QvQ3NGRDQyZkNCSlpXTTE5?=
 =?utf-8?B?eWNzNEVyQmVINzA0dEEraVlHSlA5MVlyandFMjR3cnA0bXBwRGxnQ2hLWW95?=
 =?utf-8?B?L05VNFNKRDBucUFxYTZpUGx5RHU3NlhSZlZEWXZuZTBKb1NRVzJCaVlEd21S?=
 =?utf-8?B?VE05TCszTnYwV2JjN2xnWlYyVTRNL3h4TTAxR3JQQm0wdk44UUI4Y3gvRURx?=
 =?utf-8?B?TDJhWnBzYnJFbHJnVktka2dRc0Q2QVpadE90NHlZSk9nWmF1RS93aHJnTXpL?=
 =?utf-8?B?aHNMNzVvWUxWM2tvYUN3a3VldlZRdi9yeUtqV1ZnZFRwWXhDSWJuVE5SSEFU?=
 =?utf-8?B?MWdkb0doeWQzaHg5WGROV1Zwbmw4MVlyUStxb0ZqY1Z1TnV5NXEwOXRQaGIr?=
 =?utf-8?B?TkRnTmFWSllBYzBlMUptcnlzQlFkVVgzWlhWZU1oL3BHalZVdm1VYWtvQXRX?=
 =?utf-8?B?SC9BOVZNM3FtRkd4eEJRd3VMT0pWUGkwYzdVZlFJTnJERW1PWmhNeWtjQ0N0?=
 =?utf-8?B?a3c4QUZLRnFJMDN2bkl5RS9JSzJvYUJPMHhDMS9BbVN6cWVxdWoyQU83NE9n?=
 =?utf-8?B?WlJ1VlRRTmgzTFUxeGFrSEtIakRNR3VQdTVPOENhbXgwa1RXL054YVNXWjJj?=
 =?utf-8?B?NDc0Nm1BRld5RmxlcHdpRkZOK1BGclFTZFczQlFEUGN4akRHWEJOaVB6OFFq?=
 =?utf-8?B?alFvSVd1K1ZqeURlNmpkNzVyME9aV3MwU0JSUHpXWVRQS0YwaXNzS3QybWF6?=
 =?utf-8?B?YnQ5TGF0U3c2d1JaWWNWNzJlZ3U4dndTWU9zYy90SHdYOVZmQTduMmZHUmMv?=
 =?utf-8?B?TUEzNmM0Nm00bVZxaFY2UlBGVmZ5dldNa2lrQXBjVmpUbEkzRklqVjA3SzZS?=
 =?utf-8?B?cFF1OU55WWtNWTYvc25oMzFCOU9sMktLeGxWdnZHTS9yV2U5aHZNUEtnQWF0?=
 =?utf-8?B?WlRwbklYRTVOb3c3SlZWcjNJQnpPU1RKYXFtU0VuK2srZFJTTXJBVm4xME5F?=
 =?utf-8?B?TTlXQTZjTkNudXdMcHZldWNUYmQ4R2dYYlhxOU5tbjBPQ0E5SkpmK09kTG1Z?=
 =?utf-8?B?ZG42a0NXUW1LUDlrTjNxUXhxa1Q5N2MyMTNGaExPVCsrU05uWTJJdWptWFZ4?=
 =?utf-8?B?T2FVa0Jpd29wTVd1eS9NcC9ZTGRIdWd0cGlOZE1XWEd6UHduRndWN2ZrYWdV?=
 =?utf-8?B?OWR1c0xCZUVMOHNkcnZ4dTZJM0ZqTHNDTG5vb0VNLy9sclNhdno5KzJlYzlE?=
 =?utf-8?B?bnFaREFHc3ZwME13N1l3N2NaL0cyR1dTbHcrMzc0SFppTThGNnZWRkVjVitG?=
 =?utf-8?B?akJ5ajBBRmd2R3RiMENlVzhzYVNiU3Zma1RTRWppbFAxeitDdzNsT3lILzBv?=
 =?utf-8?Q?urW7lTOU0UBIx2OkmyVOak7k3TTtQLh2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MjMxQ3B6NWZpbTdNSkhSSHA2amRPSVFCYUplNkNSeUhzZXVsMThvY295ckpj?=
 =?utf-8?B?Mmt3ekZuQ1dYOEg3OURlT1A4OU1BT1cydUFxZ0NkVTVhSngwcmZPazZ1V3hY?=
 =?utf-8?B?RjYwRnJiTER1QURwaW1nZU5IS3B3bGprcFJoR0VQRkhzemtxeGVDdDFwVzUz?=
 =?utf-8?B?MFRtb3pSM2FUNzQwUzhtbmFXUVBqdldybkJjckhJMW5FMFZ3dTdEWFBFcDlR?=
 =?utf-8?B?MDBmUXVudDRmdk9kQ2dkZ0ZOUVVselJyTnhNaXBlMm9jemU3RzZtTzRkS05Z?=
 =?utf-8?B?NFl1YzJhSk5lRW5lTDBJWnBjU0Y2QmltREN0SGtiWWg5TXk3ODNkWCtCR01p?=
 =?utf-8?B?R0M5VWNncnRWYlExaFdhcExyRklhVzJPL28ycFhvS0p5Z3hBOVFLZHlDbmRW?=
 =?utf-8?B?eTR6ZXE0VFRkNnFGSXE4Y01PenRJQnRuVjJHbGVUMWVPZHpnRjhMVWV2OHBu?=
 =?utf-8?B?R3NyV0QxUHpERFR2MXFCNXF1QWFOZkpndDZtMlNUZ2drSUhiWDJNd3M3bmxM?=
 =?utf-8?B?VTlCa3hRcVAvaFZIYlpRZjZBaFB3SkowZ3dKZ0JlZXk4TG91bWNuS3FVbUpI?=
 =?utf-8?B?bWE0VVpDSDhBZnA3RVFLbWZ2dk4xZVV1SDJrVWd6WEg1Q1JBOGNET2w1czNU?=
 =?utf-8?B?UGNHTWw3NUhrSGVZM1BudE1td05wL1dTRGZFQitsQ1dMRS91Ymw5ckQvRjRW?=
 =?utf-8?B?eVpPa2pzckNGOTJYSTV4NFFVZ2FwSk1nN21USlFzODQxODA5VXFYWWE2dEFw?=
 =?utf-8?B?ZVZlUW9XQWZYTlhKQ1JPU1BKWGhIUk81QmR5RlpOQ3VYU0hBdGJ5dmRUY3Nk?=
 =?utf-8?B?bmtweUN1TzVjYnhPSUtZaEM3WU9mdzcwT0pJRzIwQS9od1c4c3UxWENGYTBp?=
 =?utf-8?B?YisyeGt5MnNTTURSQ3RTc3dqUkZmL0lHamFQeTR2Tm4rUjFrVVBIeTZpWUVE?=
 =?utf-8?B?eDhFUS8zanBTZmdoTHNTS1ZSZVhQNmVHRU9mNkpiN2h5dVhxUFk3YzdYczRY?=
 =?utf-8?B?SXUvTlNuWmUycm9Ca0NwZUtiZlRydUwzSzV6M0lwek91Tk9DdE1Fd1QvdEY5?=
 =?utf-8?B?RVZ5YUhLYmE1dWNMZnpxRE0vUE03RjNRUUc5ZEVQZUN3NE42RUxLOCtZMmJi?=
 =?utf-8?B?L1dPVlVsYWJtdjJHekdaRitRVVZuR0QrR3MxRll6amVVTitjRjZvVnU5Y2Jy?=
 =?utf-8?B?Y05JemZmaXhJZU1pbWtTYzh6Q3cwNkhNcitXVWx4UjU0RDd2dzNZWm5aV2ky?=
 =?utf-8?B?WFVwcnZkMzZEekNvNjFoMVBCakNjMWlRdlZOaEIyZ2wwY3hkNXZHQ2FiR284?=
 =?utf-8?B?TzEydVEzb3FNK2lSWlM2OVFCM1RqUDY4K21md1FNZjZJa29sczdValJNS3lH?=
 =?utf-8?B?cVpvV3BEdCthWjdQakJETnEwSmxaRWlSdnEwdGxvellDNjBsMXQ3K0JvS0RL?=
 =?utf-8?B?WlZZS0NETGZWbTljWW85SVpZTnVBczdkbVZMV1RiZVRSSmdLOEpPblNrVyti?=
 =?utf-8?B?cTJCQVZqc1hoMnBYZVZJNlhrWWUxVm1nK0tVZDZ2THJFOXB0R3Z5ZjdJcDF5?=
 =?utf-8?B?S0JVKzczTFVTUjEzNHR2dHRWelprbzF1dG1nWmFjaE1pa1lJZjRYWkdHUFdy?=
 =?utf-8?B?eFdrU3Bycy9FWi8rejJuUUZ5OVRUeDJQUVRlMDJ3Q0hkQlB2Z2gwWDVPSW5Q?=
 =?utf-8?B?WDFHK2tUeFVrRmx1ZUNQbFRiRmYvc0VrdEV5VE9tUklPN0g5dHp3MTFDV0F4?=
 =?utf-8?B?aEZubnNwTktSamhKOFR6T0lPZ3krQVE2bTJDRzNSamttM1dpZTFqU3VQUll4?=
 =?utf-8?B?T3ZPa2JJZU1aeExoUzYvMzJyTEljR3lOSkl1ajhWRVM4VWtOUklqSEJ3RlZ3?=
 =?utf-8?B?VWdDcTNWQXczYnJmVlFlbXdpdGVSektwd2hQQzEwNUxyUkFkVTd2b3BCMktm?=
 =?utf-8?B?bXZzWUcxRWE4ZVI0V0EwVkNJM1FVUGFGWnR2VVZhczVyN3pQeU9BQUdyNDNS?=
 =?utf-8?B?clkzR2owOEsyRG01a2UyMVpBSUNRL3ZORENWT0tIQlVlZGgyV0w4ZkNmbnhB?=
 =?utf-8?B?bTJLaTBzcG44QzlxMWh5cFBFUUYwUXpDbEtzOGRaUlhyNlJ5aU1nSy9iVUNt?=
 =?utf-8?Q?vL+M=3D?=
Content-ID: <3D6AEF01CF7F0942AA78AF540B42153A@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a21c61-54fe-488e-48db-08dd652d7fbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 08:27:04.7236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lWDAcrBg+3meZxDRJ860GLIFjuExqAY//CTeMtY7+HLGbpPOjZs3MoVURolSWDDajfXNbuDEJDPC8Erxd20Ebw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5920
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 3/17/2025 3:11 PM, Chao Yu 写道: > On 3/13/25 10:25,
    Chunhai Guo wrote: >> 在 1/20/2025 8:25 PM, Chao Yu 写道: >>> On 1/9/25
    20:27, Chunhai Guo wrote: >>>> During a checkpoint, the current ac [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.117.49 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.117.49 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.117.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1tu62S-00036p-Vb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard for active
 segments
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDMvMTcvMjAyNSAzOjExIFBNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMy8xMy8yNSAxMDoy
NSwgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+PiDlnKggMS8yMC8yMDI1IDg6MjUgUE0sIENoYW8gWXUg
5YaZ6YGTOg0KPj4+IE9uIDEvOS8yNSAyMDoyNywgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+Pj4+IER1
cmluZyBhIGNoZWNrcG9pbnQsIHRoZSBjdXJyZW50IGFjdGl2ZSBzZWdtZW50IFggbWF5IG5vdCBi
ZSBoYW5kbGVkDQo+Pj4+IHByb3Blcmx5LiBUaGlzIG9jY3VycyB3aGVuIHNlZ21lbnQgWCBoYXMg
MCB2YWxpZCBibG9ja3MgYW5kIGEgbm9uLXplcm8NCj4+PiBIb3cgZG9lcyB0aGlzIGhhcHBlbj8g
QWxsb2NhdG9yIHNlbGVjdHMgYSBkaXJ0eSBzZWdtZW50IHcvIFNTUj8gYW5kIHRoZQ0KPj4+IGxl
ZnQgdmFsaWQgZGF0YSBibG9ja3Mgd2VyZSBkZWxldGVkIGxhdGVyIGJlZm9yZSBmb2xsb3dpbmcg
Y2hlY2twb2ludD8NCj4+Pg0KPj4+IElmIHNvLCBwZW5kaW5nIGRpc2NhcmQgY291bnQgaW4gdGhh
dCBzZWdtZW50IHNob3VsZCBiZSBpbiByYW5nZSBvZiAoMCwgNTEyKT8NCj4+DQo+PiBUaGlzIGlz
c3VlIGlzIGZvdW5kIHdpdGggTEZTIHJhdGhlciB0aGFuIFNTUi4gSGVyZSdzIHdoYXQgaGFwcGVu
czogc29tZQ0KPj4gZGF0YSBibG9ja3MgYXJlIGFsbG9jYXRlZCBmb3IgYSBmaWxlIGluIHRoZSBj
dXJyZW50IGFjdGl2ZSBzZWdtZW50LCBhbmQNCj4+IHRoZW4gdGhlIGZpbGUgaXMgZGVsZXRlZCwg
cmVzdWx0aW5nIGluIGFsbCB2YWxpZCBkYXRhIGJsb2NrcyBpbiB0aGUNCj4+IGN1cnJlbnQgYWN0
aXZlIHNlZ21lbnQgYmVpbmcgZGVsZXRlZCBiZWZvcmUgdGhlIGZvbGxvd2luZyBjaGVja3BvaW50
Lg0KPj4gVGhpcyBpc3N1ZSBpcyBlYXN5IHRvIHJlcHJvZHVjZSB3aXRoIHRoZSBmb2xsb3dpbmcg
b3BlcmF0aW9uczoNCj4+DQo+Pg0KPj4gIyBta2ZzLmYyZnMgLWYgL2Rldi9udm1lMm4xDQo+PiAj
IG1vdW50IC10IGYyZnMgL2Rldi9udm1lMm4xIC92dG1wL21udC9mMmZzDQo+PiAjIGRkIGlmPS9k
ZXYvbnZtZTBuMSBvZj0vdnRtcC9tbnQvZjJmcy8xLmJpbiBicz00ayBjb3VudD0yNTYNCj4+ICMg
c3luYw0KPj4gIyBybSAvdnRtcC9tbnQvZjJmcy8xLmJpbg0KPj4gIyB1bW91bnQgL3Z0bXAvbW50
L2YyZnMNCj4+ICMgZHVtcC5mMmZzIC9kZXYvbnZtZTJuMSB8IGdyZXAgImNoZWNrcG9pbnQgc3Rh
dGUiDQo+PiBJbmZvOiBjaGVja3BvaW50IHN0YXRlID0gNDUgOiAgY3JjIGNvbXBhY3RlZF9zdW1t
YXJ5IHVubW91bnQgLS0tLQ0KPj4gJ3RyaW1tZWQnIGZsYWcgaXMgbWlzc2luZw0KPiBDaHVuaGFp
LA0KPg0KPiBUaGFuayB5b3UgZm9yIHByb3ZpZGluZyB0ZXN0Y2FzZSwgYXJlIHlvdSBpbnRlcmVz
dCBpbiB1cHN0cmVhbSB0aGlzDQo+IGFzIGEgZjJmcyB0ZXN0Y2FzZSB0byB4ZnN0ZXN0cz8NCg0K
DQpZZXMsIGJ1dCBJIG1heSBub3QgYmUgYWJsZSB0byBzdGFydCB0aGlzIHdvcmsgZm9yIGEgZmV3
IGRheXMgc2luY2UgSQ0Kd2lsbCBiZSBidXN5IGluIHRoZSBuZXh0IGZldyBkYXlzLg0KDQpUaGFu
a3MsDQoNCg0KPg0KPiBUaGFua3MsDQo+DQo+PiBUaGUgcGVuZGluZyBkaXNjYXJkIGNvdW50IGlu
IHRoYXQgc2VnbWVudCBpbmRlZWQgZmFsbHMgd2l0aGluIHRoZSByYW5nZQ0KPj4gb2YgKDAsIDUx
MikuDQo+Pg0KPj4gVGhhbmtzLA0KPj4+IFRoYW5rcywNCj4+Pg0KPj4+PiBudW1iZXIgb2YgZGlz
Y2FyZCBibG9ja3MsIGZvciB0aGUgZm9sbG93aW5nIHJlYXNvbnM6DQo+Pj4+DQo+Pj4+IGxvY2F0
ZV9kaXJ0eV9zZWdtZW50KCkgZG9lcyBub3QgbWFyayBhbnkgYWN0aXZlIHNlZ21lbnQgYXMgYSBw
cmVmcmVlDQo+Pj4+IHNlZ21lbnQuIEFzIGEgcmVzdWx0LCBzZWdtZW50IFggaXMgbm90IGluY2x1
ZGVkIGluIGRpcnR5X3NlZ21hcFtQUkVdLCBhbmQNCj4+Pj4gZjJmc19jbGVhcl9wcmVmcmVlX3Nl
Z21lbnRzKCkgc2tpcHMgaXQgd2hlbiBoYW5kbGluZyBwcmVmcmVlIHNlZ21lbnRzLg0KPj4+Pg0K
Pj4+PiBhZGRfZGlzY2FyZF9hZGRycygpIHNraXBzIGFueSBzZWdtZW50IHdpdGggMCB2YWxpZCBi
bG9ja3MsIHNvIHNlZ21lbnQgWCBpcw0KPj4+PiBhbHNvIHNraXBwZWQuDQo+Pj4+DQo+Pj4+IENv
bnNlcXVlbnRseSwgbm8gYHN0cnVjdCBkaXNjYXJkX2NtZGAgaXMgYWN0dWFsbHkgY3JlYXRlZCBm
b3Igc2VnbWVudCBYLg0KPj4+PiBIb3dldmVyLCB0aGUgY2twdF92YWxpZF9tYXAgYW5kIGN1cl92
YWxpZF9tYXAgb2Ygc2VnbWVudCBYIGFyZSBzeW5jZWQgYnkNCj4+Pj4gc2VnX2luZm9fdG9fcmF3
X3NpdCgpIGR1cmluZyB0aGUgY3VycmVudCBjaGVja3BvaW50IHByb2Nlc3MuIEFzIGEgcmVzdWx0
LA0KPj4+PiBpdCBjYW5ub3QgZmluZCB0aGUgbWlzc2luZyBkaXNjYXJkIGJpdHMgZXZlbiBpbiBz
dWJzZXF1ZW50IGNoZWNrcG9pbnRzLg0KPj4+PiBDb25zZXF1ZW50bHksIHRoZSB2YWx1ZSBvZiBz
YmktPmRpc2NhcmRfYmxrcyByZW1haW5zIG5vbi16ZXJvLiBUaHVzLCB3aGVuDQo+Pj4+IGYyZnMg
aXMgdW1vdW50ZWQsIENQX1RSSU1NRURfRkxBRyB3aWxsIG5vdCBiZSBzZXQgZHVlIHRvIHRoZSBu
b24temVybw0KPj4+PiBzYmktPmRpc2NhcmRfYmxrcy4NCj4+Pj4NCj4+Pj4gUmVsZXZhbnQgY29k
ZSBwcm9jZXNzOg0KPj4+Pg0KPj4+PiBmMmZzX3dyaXRlX2NoZWNrcG9pbnQoKQ0KPj4+PiAgICAg
ICAgZjJmc19mbHVzaF9zaXRfZW50cmllcygpDQo+Pj4+ICAgICAgICAgICAgIGxpc3RfZm9yX2Vh
Y2hfZW50cnlfc2FmZShzZXMsIHRtcCwgaGVhZCwgc2V0X2xpc3QpIHsNCj4+Pj4gICAgICAgICAg
ICAgICAgIGZvcl9lYWNoX3NldF9iaXRfZnJvbShzZWdubywgYml0bWFwLCBlbmQpIHsNCj4+Pj4g
ICAgICAgICAgICAgICAgICAgICAuLi4NCj4+Pj4gICAgICAgICAgICAgICAgICAgICBhZGRfZGlz
Y2FyZF9hZGRycyhzYmksIGNwYywgZmFsc2UpOyAvLyBza2lwIHNlZ21lbnQgWCBkdWUgdG8gaXRz
IDAgdmFsaWQgYmxvY2tzDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgLi4uDQo+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgc2VnX2luZm9fdG9fcmF3X3NpdCgpOyAvLyBzeW5jIGNrcHRfdmFsaWRf
bWFwIHdpdGggY3VyX3ZhbGlkX21hcCBmb3Igc2VnbWVudCBYDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgLi4uDQo+Pj4+ICAgICAgICAgICAgICAgICB9DQo+Pj4+ICAgICAgICAgICAgIH0NCj4+
Pj4gICAgICAgIGYyZnNfY2xlYXJfcHJlZnJlZV9zZWdtZW50cygpOyAvLyBzZWdtZW50IFggaXMg
bm90IGluY2x1ZGVkIGluIGRpcnR5X3NlZ21hcFtQUkVdIGFuZCBpcyBza2lwcGVkDQo+Pj4+DQo+
Pj4+IFNpbmNlIGFkZF9kaXNjYXJkX2FkZHJzKCkgY2FuIGhhbmRsZSBhY3RpdmUgc2VnbWVudHMg
d2l0aCBub24temVybyB2YWxpZA0KPj4+PiBibG9ja3MsIGl0IGlzIHJlYXNvbmFibGUgdG8gZml4
IHRoaXMgaXNzdWUgYnkgYWxsb3dpbmcgaXQgdG8gYWxzbyBoYW5kbGUNCj4+Pj4gYWN0aXZlIHNl
Z21lbnRzIHdpdGggMCB2YWxpZCBibG9ja3MuDQo+Pj4+DQo+Pj4+IEZpeGVzOiBiMjk1NTU1MDVk
ODEgKCJmMmZzOiBhZGQga2V5IGZ1bmN0aW9ucyBmb3Igc21hbGwgZGlzY2FyZHMiKQ0KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaHVuaGFpIEd1byA8Z3VvY2h1bmhhaUB2aXZvLmNvbT4NCj4+Pj4gLS0t
DQo+Pj4+IHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQx
MjAzMDY1MTA4LjI3NjM0MzYtMS1ndW9jaHVuaGFpQHZpdm8uY29tLw0KPj4+PiB2MS0+djI6DQo+
Pj4+ICAgICAtIE1vZGlmeSB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gbWFrZSBpdCBlYXNpZXIgdG8g
dW5kZXJzdGFuZC4NCj4+Pj4gICAgIC0gQWRkIGZpeGVzIHRvIHRoZSBjb21taXQuDQo+Pj4+IC0t
LQ0KPj4+PiAgICAgZnMvZjJmcy9zZWdtZW50LmMgfCA0ICsrKy0NCj4+Pj4gICAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4NCj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMNCj4+Pj4gaW5kZXgg
ODZlNTQ3ZjAwOGY5Li4xM2VlNzNhM2M0ODEgMTAwNjQ0DQo+Pj4+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jDQo+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jDQo+Pj4+IEBAIC0yMDkwLDcgKzIw
OTAsOSBAQCBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsDQo+Pj4+ICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOw0KPj4+Pg0KPj4+PiAgICAgICBpZiAoIWZvcmNlKSB7DQo+Pj4+IC0gICAgICAgICAg
ICBpZiAoIWYyZnNfcmVhbHRpbWVfZGlzY2FyZF9lbmFibGUoc2JpKSB8fCAhc2UtPnZhbGlkX2Js
b2NrcyB8fA0KPj4+PiArICAgICAgICAgICAgaWYgKCFmMmZzX3JlYWx0aW1lX2Rpc2NhcmRfZW5h
YmxlKHNiaSkgfHwNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgKCFzZS0+dmFsaWRfYmxvY2tz
ICYmDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIUlTX0NVUlNFRyhzYmksIGNw
Yy0+dHJpbV9zdGFydCkpIHx8DQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICBTTV9JKHNiaSkt
PmRjY19pbmZvLT5ucl9kaXNjYXJkcyA+PQ0KPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBTTV9JKHNiaSktPmRjY19pbmZvLT5tYXhfZGlzY2FyZHMpDQo+Pj4+ICAgICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gZmFsc2U7DQo+Pg0KDQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
