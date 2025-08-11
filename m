Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D44DB1FE04
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 04:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v584Oqqf+uBUlh6LlU4iDNqcqGc20slgnkZgYw4yGlM=; b=PeMkmWu22/uRhsYCA7XPoiLPoE
	k8ygfkFLqOkkTdxWoXO8DocSynZkVpA8pxl1l3dw9BZfOmCAqiN5r9CqOBLoUKJycH7Hk/gkXGVyx
	BON/RnZWxGxUB3PDIHo5EQFf/UuO/pVZ+3V31hY5iH9U3EMoXVuyIIymDPaf6Ef2uRyY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulIhe-000802-AJ;
	Mon, 11 Aug 2025 02:56:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1ulIgr-0007zE-Nf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 02:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dr+dNJY52xBDhvYeKMVnVs13K8DQ0Lwe8g6/sHZ95BQ=; b=l93dEpSge/oFuBebYLwtqI3XFh
 S7jejXsEizmSbgYKd873FtgwqGIl8qaX2D57x+0eW+zEZSWVsniXpy8F9MJECJ2LSWluEuCaPAwR/
 LSJ6TrJD3GrfGo+/xLesyHLYZQPEc2Ubh9fPcLO5ENHIykhNlkonomWaeVYJ54VOmIQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dr+dNJY52xBDhvYeKMVnVs13K8DQ0Lwe8g6/sHZ95BQ=; b=K8n++FTCcjiATmd7NjSHD+tmKY
 T5SagRf8+P0gazImOaTavZrWjWMaod1onMDT5XOd/L+sQ05J9gIvkT9MdptUnzmORWWXCHR7p8r6r
 ln6g1nlKICww593XH4+bwRjUuRS7l9qbynNli7XvEs7iu4O9dQC3tL3F0UmkLizncUNA=;
Received: from mail-japanwestazon11012043.outbound.protection.outlook.com
 ([40.107.75.43] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulIgr-0006HQ-PE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 02:55:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQGXCX/OTPKEn9T0e9TZxz42sUE6NC/EclzykH2nThj7LqlsPBr4YX0mmYfedq0x9OUehTTSPvSLO3uuQE6AlgBqu1S4vvQqUVrsosUp3K9EA52WKbY7CIAJTs21/c+C/LGctMQKiD4yYWqZ1fnZX/qOD89y0E4HXqVizNF3hwpMKerNd0p8jqdYmSr1t6TjUUnFTIfSMsBBwFwnifRcWi5rVsaTOiqbEVwAKuF91D+Af26Cbn5kVYSXQWFv1H28K2Y+BrGEr/8b2sdISleGAo9s/RYMhv/G6nst+aZoAEZzhsIMH8gfWuaigFiVuZ107XUSijF3+ZX6jjXgXiZCRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dr+dNJY52xBDhvYeKMVnVs13K8DQ0Lwe8g6/sHZ95BQ=;
 b=xZ0w/dSaWGKYKGL9/R1406FONptKGfvgGwDrMTLabOIwgFS9LTLfCmRoUd9Z5yxrN1n+I8AJen1o0z27sUTZBBJ3Dc0lYo7fDczP/TcVsIuQmujYNWq5VROizkmvkOitmTrvarD9h8LU0TJYup1mTE4YRl+C6eCWKbfiyhaRPesFDxET0FvUXOqwd9bwieoNJ8GGZYdDsPkkqabp/5eZIPD7oe9GSscdrBSf9KbfnX/p9zD10XLz9bdsoAwlbFKUhA0Cj05vqH6FFUdJdZGY6JXxbwC7zLrfCi2I2D+M07DHeI2bxHIF5Zpgz/C6uebQeHlABRgBlJOvf4ZDEx0i3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dr+dNJY52xBDhvYeKMVnVs13K8DQ0Lwe8g6/sHZ95BQ=;
 b=HZmWrCd3jzS9BV9qhRdw8Y9BhY0UcBkYG3GyHrPbGeIDaoM8E96NDi0wybiArysf2FJD0o06otssHmxUG5ceA9bPUDNY31MDnYya6lg3qxJTR7xDC3FwYFzRXNY7hYqv+VhwKq3O3tSC9KFskhMrsU5vmV1MFsEFzV+5abLG1CL1aMXcAGznoPnVFRDl3Bn96pW54yImdIgE6QnySBlj8n4lLs7vTrb4XbF1OF21iiny25UUc9x/HwKUr2r9yonVfs40eXAbGY69PPy1TTifKNdgVnhQDocFe5I8toGmCDPCnB9RLWH2lH848LqZVDrV1UY/4oPQqKFcdRscC1LdnQ==
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SG2PR06MB5192.apcprd06.prod.outlook.com (2603:1096:4:1d4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 02:54:59 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 02:54:58 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
Thread-Index: AQHcB3eLVY4SVx71lUaUM/5T13XYU7RYJ4YAgASgL4A=
Date: Mon, 11 Aug 2025 02:54:58 +0000
Message-ID: <4ca35d43-1e9d-4dd4-a291-0a54f93a2d67@vivo.com>
References: <20250807084442.422751-1-wangxiaojun@vivo.com>
 <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
In-Reply-To: <7fbd778a-8676-4040-bb8f-f5417d458c7e@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR06MB6845:EE_|SG2PR06MB5192:EE_
x-ms-office365-filtering-correlation-id: e8c23a7b-407b-4773-19fc-08ddd88275a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NC93UFNlQTFNOXRETUg2RUxXcjRNV01WYmNOL3hza3dyMDlldFNHQk5QNTB0?=
 =?utf-8?B?a24rdlRoSUcxb2J4OWRBQTQzTDhnUkVPWXZWWDNnR1F5dXQ2LytROHBIYlN1?=
 =?utf-8?B?NmFuUk5MQ3h2TGF6NXhZeGZ0MDNlaXQxR09lWlZKdjFUeVg3UWtlcS9tTGxB?=
 =?utf-8?B?OEo4YVpXcTBjWThGcVZmekZmeXJhWEtpQ1N4dXJERnJ6OHNvNHdGQW53clhT?=
 =?utf-8?B?TWZNcnRVMjZvWFRWVEUwcmNxTlZ4TGRXeWdNaDB5YlFtNW5wdEs3OWFSSEtl?=
 =?utf-8?B?LzR1a3crYitHTkJnWnBiNGIvRW0ycnhLck1xMXRRaDVHZWFlK0EyWmtjaTJj?=
 =?utf-8?B?SDZibHJDZ1FybllhYkM1OUJsbTNRZll0K3BxUytBNnlJZ2phc2VhUStDVVE2?=
 =?utf-8?B?MVNPb3RDNklSV1lNck10RU9vRTFtMk4wdm9RN3JiTGlLYjFvV2hETTcvZFpD?=
 =?utf-8?B?eXBhY29DQzdNUHdiMFBrREJDUmpib0c0RnVQSWU3QzA0WE13YTc1eE9TYlNs?=
 =?utf-8?B?VVBEbEFDdHc0N0tHcTJzK0hFSnlSaUt6M25obUp0Y0hSSGN6T3pZcmVKakNV?=
 =?utf-8?B?NzdoS3pxZGYyeU5Qb1lHNGZ4ZW52S0tydmJhTUZiY0FmbjQzRDJpcDJobEI5?=
 =?utf-8?B?UDdFbExEVVZrNERLbjhGUmVCK05sZ1NrZ3NFRnNlSFBHa3FEaCswbHZCaW9O?=
 =?utf-8?B?aTM4Q3NFaUVkVStlcWtXZTI2b2xFUEpyTlQ4SWE5ejhFOERzRmhQeDNHV294?=
 =?utf-8?B?aUFkQUs2QmRaTWowTUVkZFAwK0ZWWmxyN21NZk0wbGx5SmhSelVHNG1yNENv?=
 =?utf-8?B?TEd2eWRBcDZwU2U3ZkpzOTB4TjlLYW05SE1PK243Q0V5SFBuMENwMWN0aWkr?=
 =?utf-8?B?aHErZHhPZUNsbmVhOW04Uml1VGhLMXMxZjBJdjgzd1A4czlBdFBIdC9VTjh6?=
 =?utf-8?B?dzhiWUJXY2U0U2trelNCQmZoYmJVR2MybEdleU9KQUJjbm5sUVRQa2pDWUpr?=
 =?utf-8?B?aUI4TFUwNFEvUU1mUU1YYVlHRUJJdzBwOFArM1NKeU44bjBVOGIwUlJWaVY2?=
 =?utf-8?B?UlhYYm1tMnA2ZEQ4UlNlOEdoc3VXSE5hTTgyMDhHZ29MZHhGajAyQ0hTdUZR?=
 =?utf-8?B?Y2poVk04ZFJOSFYvb0FNNUszNUJUMzloYVU0UEZQaFB4Q3dvWnNtcDFVR080?=
 =?utf-8?B?WUttWnQweElJVkt0anV2NUkvQmt5Z0tHYk9EOG9BVEgyTEF1TlNLTUcwWHhB?=
 =?utf-8?B?VCtvMnBVQmdXdzBNUTlCcXVnM0M4UFdOY2VQVjVoeTlhMHNvdmdvaFRVYURF?=
 =?utf-8?B?QlVNRmhOcktUakwyV2FSdjd3cjRrZTJ5UERUZHVraHZ6Y3NZOCtqUktkbE9k?=
 =?utf-8?B?akovSkUwL2V5cnRjSHZxZzQrbi9jcVowOThJYTFqZlN2a09wVHBJdTF5TVBP?=
 =?utf-8?B?NlR1cDdTSVJlK0RWOW1BaTdya2xUQzRvMVFiZCtZZW1DelQrb0VZNDdjejlk?=
 =?utf-8?B?dVB1UitEL29CZS9lc0hkdFRCTFBtTUlmMjBtUVBvRW9mTlVLdU16Y25IZFl4?=
 =?utf-8?B?djlBbm4raUFMMjZvTzR4dGtiUUhmWEJqWnlXcHFwcE1nWGU0ZkszRndDRFdh?=
 =?utf-8?B?bUJ2QjVQK3czcnUybmlTT2JVNytHN0dEcWhNZmpiOWVZcko2YzE4b2dONTB6?=
 =?utf-8?B?VXJlaytnR1pNT283anhIaG1UWG1SSyt6bTFYVS9rcHg3UFlxOXRleVQzbjdo?=
 =?utf-8?B?SktINTg0bUZpVWIrRkpRN2VTK1FSc0pNellCV3U5MU9oUW9KTXJ1b0FKZzdW?=
 =?utf-8?B?dXVGTysyWXg4Q2FzRC9GRk92WmtRQlpJTUNqekhVZnM1eEt3b1dyRkc5ZEZz?=
 =?utf-8?B?T1RYOVh2YTZ1M25xZHhvalIrR1pyL2hpekhHZTZ1MFFPcVpweFRQdlJJaTlF?=
 =?utf-8?B?a0JYSllDOEkvK0l4VlB1WnJER1JUeVR5VWd6cFVIcFFlUTFLOWsvZjRPZlVC?=
 =?utf-8?B?bXdKSWVRVmZnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(42112799006)(376014)(1800799024)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmdSckRrK3l2RkFCR2h6ekdEbnYyVDJyYnF4N21mK0pMaldPaTYwQ0FBZ3F6?=
 =?utf-8?B?YjBvZDVKckVScmlvZ1JVQ01CUXBWSDcxNmk1NldYdVJIWTdEUFAxaVo5SVg0?=
 =?utf-8?B?WGhiRitNVzdFK2xEakVWSHc5UUEydlBJcEFUQWQzWjJreVg2dXB3WWk5RFk1?=
 =?utf-8?B?U0dtV0ZxL2o0QWhrZVQwNDZSQ1NKbVJhcTA1NzV4Qkl2YlR1bFNFQnZHNURJ?=
 =?utf-8?B?eTU5bzVjZkJqUm9kRnRaR0l3cExTREpNbmxTcHdoemVnUTh1N0l3bWpIdFE4?=
 =?utf-8?B?QUs4cllvWVpENDRoSlNmK3MwdHdrM3RybkJCSE93eTR1ZGsrdGtoc1hQcHY2?=
 =?utf-8?B?SGtEM2Y2dm9vS2dpaDh6L01qdHdOa0RxQncrem9NVk96ZnVZZko4d1BUaWt4?=
 =?utf-8?B?YXErYldFNlB0LzZrblp6SDJ2dXpMTEhvb3p6RzFaeE4vK3BubEh6Tnh6N09B?=
 =?utf-8?B?WEN1NVVwc0JyMFU3eG15Ny9YdDN5UExUakdQdlVrazJ0MkhWQ1RyTFVHd3Bm?=
 =?utf-8?B?L3RUWlZmT1JYUFA3MVR5SXhRbUx3ZkZyUzhQS3J1NlZiOXRHMWpZMDNCeFVa?=
 =?utf-8?B?NE9tWEJraGpiY0JMVDdVTEZzSjAvUmRiVm1KclNRMi81Ulk0bmwwRU1LTEth?=
 =?utf-8?B?Z1g3K2RYdjUwUzY4dGpZMWpLZXU3SXQvZTFraW9UOWo5V3BLNWRzRlcxd1NW?=
 =?utf-8?B?bXo5WFl6Y0hXOWplRjlXNnN5YlJYLzB3K3czVHo1T0s4bXBSYUpBb3lxeXdZ?=
 =?utf-8?B?STlzNjQveEkwZkMwc1lDQWdvbS9sQkNXM0RWbmJwTnFLeGV5VGs1NnM5dHlj?=
 =?utf-8?B?QjIrZEk0ZXhHM1o3UCtqU1JyL0ovaEZxeVRMTW5wL3U2T3k4U2FtOU9hWWxU?=
 =?utf-8?B?YmZMLzYzZ2E1UnE3amxZL2QxeGFQL3laSE5uTVgzbjY2dnppTkcwdElRV1FP?=
 =?utf-8?B?Zld4akRSa1VuMkNEb0creEhRQnN0cGFSWWlPYXBNcWFrbFlOZDFiRWVtV2tx?=
 =?utf-8?B?S2wxOVlkWFhXcEZCQjltd0ZlUnJERUo3M0NSQkFjWHZwVkcyRGNOZmlLcmln?=
 =?utf-8?B?eXBueXNjeEZrN1RkSmViNCtJbUhGM29iaDdoMTdnZHlnNklCTWh0d3dOMlRi?=
 =?utf-8?B?VUVid3Qvd2h5OWl4V1J6alEvYU9vNm1rM0FUVG05eWJBcXFCOWlVcmhLYmhY?=
 =?utf-8?B?MStFUWoxeXVBUnNNSVZjOWpoTlV0VDdPclY2V3Rrd3lLNDI0NVRCZGdhVjR2?=
 =?utf-8?B?OWN2Q09vVUd6YWZzRnRyRHFDNFlvQ2RpM2ZTNDg4UUJmS2pDSXZXeEdWdU8y?=
 =?utf-8?B?cXl6RXVNZDNqRVhBY0ptZXkzaTZFT0hGY2ZobW1kbmdHRmJiQTY1dkVHNkVQ?=
 =?utf-8?B?Y090RzNFT2tMcGF0RmJlY2MxWEhVYmNJZzZzWDlTOE9ucjBnaitrL0VUVk91?=
 =?utf-8?B?WnJyWWJkVXhXU096SkgxZnlwNGtoZXZRa0QrSjhzSE1BdUoxekNETE9sTHhw?=
 =?utf-8?B?SWlQT1RrRG9BSkQ0cVpSdFJDcDYxRWJZUDhGQ3lscTJOc3hnanVqQWhWRE9Z?=
 =?utf-8?B?WTJrUWdzcFBHcEFQNVY1Z1huNlRPN2VpR1llUm84Y1dwRHZVYzR5VzhMWk1S?=
 =?utf-8?B?d2dFbXhXS2dMZnRmTnlzYmFxaXgyQjRHT3NTYnRONWFBdUwvY0kza1o1MnRJ?=
 =?utf-8?B?NTZPeWZma1U4NGR5NDJMODVGU1lMWVY4bEQ2OWpYSUdXcVFYMGJrY1lZOUFm?=
 =?utf-8?B?aWdxWlVIZ05ldm1vSmRSdm5DS2ZDU3hlWFZBWkpoUnBYSzY4YStlNVpmZHJZ?=
 =?utf-8?B?QnlPSUtGdmRFZ2JJdFlRMWFOczAzc2UxK0lGKzlWdkRvN0hjdUxUaTJ5czZa?=
 =?utf-8?B?bDNGcXlNYUxTS044cHg0QmNOcDliaVNjRlBXSWdYUGVXV2daTWgwQTg5WW55?=
 =?utf-8?B?dU13elFiVEcyV0Uzd2dnVjhWZXZpbGZTcW1YRnVJVUNueUpwdFJVR1dCS1Fn?=
 =?utf-8?B?WmttSG1CVGJ4N0w1bUdlSExxUGJGSHlweVNKbFp3bmtrSUNXcS85OCt2V0Fq?=
 =?utf-8?B?L1RvK3NBd21YaEpPdFNFL1JiR3c3L204c0l2WU1HS0tDZjVlek1EOTZXQTJ3?=
 =?utf-8?Q?HSJs=3D?=
Content-ID: <12F8D9096F06584E834C88FF89F2F220@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c23a7b-407b-4773-19fc-08ddd88275a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 02:54:58.5243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5bxJDl64UQ8DjlrPbChii71j6Gf/BYGBSH9Ztwj4d4WbjWLToGVzvZF25htYFE6IjRcyOSw36kHIQRalO0AqjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5192
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao,
 This patch will cause falloc to fail in the following
 scenarios. write fileA 2M | fsync | truncate 256K | falloc -k 256K 1M | fsync
 A | SPO So I will fix this issue in the next version of the patch. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.43 listed in wl.mailspike.net]
X-Headers-End: 1ulIgr-0006HQ-PE
Subject: Re: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during
 the recovery process
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
From: =?utf-8?B?546L5pmT54+6?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?546L5pmT54+6?= <wangxiaojun@vivo.com>
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywNCg0KVGhpcyBwYXRjaCB3aWxsIGNhdXNlIGZhbGxvYyB0byBmYWlsIGluIHRoZSBm
b2xsb3dpbmcgc2NlbmFyaW9zLg0Kd3JpdGUgZmlsZUEgMk0gfCBmc3luYyB8IHRydW5jYXRlIDI1
NksgfCBmYWxsb2MgLWsgMjU2SyAxTSB8IGZzeW5jIEEgfMKgU1BPDQpTbyBJIHdpbGwgZml4IHRo
aXMgaXNzdWUgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiB0aGUgcGF0Y2guDQoNClRoYW5rcywNCg0K
T24gOC84LzIwMjUgMTI6MTYgUE0sIENoYW8gWXUgd3JvdGU6DQo+IFhpYW9qdW4sDQo+DQo+IEkg
anVzdCBub3RpY2UgZ2VuZXJpYy80ODMgd2lsbCBmYWlsIHcvIHRoaXMgY2hhbmdlLCBjYW4geW91
IHBsZWFzZSB0YWtlIGENCj4gbG9vaz8NCj4NCj4gVGhhbmtzLA0KPg0KPiBPbiA4LzcvMjAyNSA0
OjQ0IFBNLCBXYW5nIFhpYW9qdW4gd3JvdGU6DQo+PiBUaGlzIHBhdGNoIGZpeGVzIG1pc3Npbmcg
c3BhY2UgcmVjbGFtYXRpb24gZHVyaW5nIHRoZSByZWNvdmVyeSBwcm9jZXNzLg0KPj4gSW4gdGhl
IGZvbGxvd2luZyBzY2VuYXJpb3MsIEYyRlMgY2Fubm90IHJlY2xhaW0gdHJ1bmNhdGVkIHNwYWNl
Lg0KPj4gY2FzZSAxOg0KPj4gd3JpdGUgZmlsZSBBLCBzaXplIGlzIDFHIHwgQ1AgfCB0cnVuY2F0
ZSBBIHRvIDFNIHwgZnN5bmMgQSB8IFNQTw0KPj4NCj4+IGNhc2UgMjoNCj4+IENQIHwgd3JpdGUg
ZmlsZSBBLCBzaXplIGlzIDFHIHwgZnN5bmMgQSB8IHRydW5jYXRlIEEgdG8gMU0gfCBmc3luYyBB
IA0KPj4gfFNQTw0KPj4NCj4+IER1cmluZyB0aGUgcmVjb3ZlcnkgcHJvY2VzcywgRjJGUyB3aWxs
IHJlY292ZXIgZmlsZSBBLA0KPj4gYnV0IHRoZSAxTS0xRyBzcGFjZSBjYW5ub3QgYmUgcmVjbGFp
bWVkLg0KPj4NCj4+IEZpeGVzOiBkNjI0Yzk2ZmIzMjQ5ICgiZjJmczogYWRkIHJlY292ZXJ5IHJv
dXRpbmVzIGZvciByb2xsLWZvcndhcmQiKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGlh
b2p1biA8d2FuZ3hpYW9qdW5Adml2by5jb20+DQo+PiAtLS0NCj4+IHYzOiBBZGQgYSBGaXhlcyBs
aW5lLg0KPj4gdjI6IEFwcGx5IENoYW8ncyBzdWdnZXN0aW9uIGZyb20gdjEuIE5vIGxvZ2ljYWwg
Y2hhbmdlcy4NCj4+IHYxOiBGaXggbWlzc2luZyBzcGFjZSByZWNsYW1hdGlvbiBkdXJpbmcgdGhl
IHJlY292ZXJ5IHByb2Nlc3MuDQo+PiAtLS0NCj4+IMKgIGZzL2YyZnMvZjJmcy5owqDCoMKgwqAg
fMKgIDEgKw0KPj4gwqAgZnMvZjJmcy9yZWNvdmVyeS5jIHwgMTggKysrKysrKysrKysrKysrKyst
DQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaA0KPj4g
aW5kZXggNDZiZTc1NjA1NDhjLi4yOGZjZTU5MTk4Y2UgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZz
L2YyZnMuaA0KPj4gKysrIGIvZnMvZjJmcy9mMmZzLmgNCj4+IEBAIC00NTksNiArNDU5LDcgQEAg
c3RydWN0IGZzeW5jX2lub2RlX2VudHJ5IHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGlub2RlICpp
bm9kZTvCoMKgwqAgLyogdmZzIGlub2RlIHBvaW50ZXIgKi8NCj4+IMKgwqDCoMKgwqAgYmxvY2tf
dCBibGthZGRyO8KgwqDCoCAvKiBibG9jayBhZGRyZXNzIGxvY2F0aW5nIHRoZSBsYXN0IGZzeW5j
ICovDQo+PiDCoMKgwqDCoMKgIGJsb2NrX3QgbGFzdF9kZW50cnk7wqDCoMKgIC8qIGJsb2NrIGFk
ZHJlc3MgbG9jYXRpbmcgdGhlIGxhc3QgDQo+PiBkZW50cnkgKi8NCj4+ICvCoMKgwqAgbG9mZl90
IG1heF9pX3NpemU7wqDCoMKgIC8qIHByZXZpb3VzIG1heCBmaWxlIHNpemUgZm9yIHRydW5jYXRl
ICovDQo+PiDCoCB9Ow0KPj4gwqAgwqAgI2RlZmluZSBuYXRzX2luX2N1cnN1bShqbmwpIChsZTE2
X3RvX2NwdSgoam5sKS0+bl9uYXRzKSkNCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3JlY292ZXJ5
LmMgYi9mcy9mMmZzL3JlY292ZXJ5LmMNCj4+IGluZGV4IDRjYjNhOTE4MDFiNC4uNjhiNjJjOGE3
NGQzIDEwMDY0NA0KPj4gLS0tIGEvZnMvZjJmcy9yZWNvdmVyeS5jDQo+PiArKysgYi9mcy9mMmZz
L3JlY292ZXJ5LmMNCj4+IEBAIC05NSw2ICs5NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZnN5bmNfaW5v
ZGVfZW50cnkgDQo+PiAqYWRkX2ZzeW5jX2lub2RlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwN
Cj4+IMKgwqDCoMKgwqAgZW50cnkgPSBmMmZzX2ttZW1fY2FjaGVfYWxsb2MoZnN5bmNfZW50cnlf
c2xhYiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBf
RjJGU19aRVJPLCB0cnVlLCBOVUxMKTsNCj4+IMKgwqDCoMKgwqAgZW50cnktPmlub2RlID0gaW5v
ZGU7DQo+PiArwqDCoMKgIGVudHJ5LT5tYXhfaV9zaXplID0gaV9zaXplX3JlYWQoaW5vZGUpOw0K
Pj4gwqDCoMKgwqDCoCBsaXN0X2FkZF90YWlsKCZlbnRyeS0+bGlzdCwgaGVhZCk7DQo+PiDCoCDC
oMKgwqDCoMKgIHJldHVybiBlbnRyeTsNCj4+IEBAIC03OTYsNiArNzk3LDcgQEAgc3RhdGljIGlu
dCByZWNvdmVyX2RhdGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCANCj4+IHN0cnVjdCBsaXN0
X2hlYWQgKmlub2RlX2xpc3QsDQo+PiDCoMKgwqDCoMKgIHdoaWxlICgxKSB7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGZzeW5jX2lub2RlX2VudHJ5ICplbnRyeTsNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBzdHJ1Y3QgZm9saW8gKmZvbGlvOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGxvZmZf
dCBpX3NpemU7DQo+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX2lzX3ZhbGlkX2Js
a2FkZHIoc2JpLCBibGthZGRyLCBNRVRBX1BPUikpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBicmVhazsNCj4+IEBAIC04MjgsNiArODMwLDkgQEAgc3RhdGljIGludCByZWNvdmVyX2Rh
dGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCANCj4+IHN0cnVjdCBsaXN0X2hlYWQgKmlub2Rl
X2xpc3QsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVjb3ZlcmVkX2lub2RlKys7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpX3NpemUg
PSBpX3NpemVfcmVhZChlbnRyeS0+aW5vZGUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKGVudHJ5LT5tYXhfaV9zaXplIDwgaV9zaXplKQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBlbnRyeS0+bWF4X2lfc2l6ZSA9IGlfc2l6ZTsNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVudHJ5LT5sYXN0X2RlbnRyeSA9PSBi
bGthZGRyKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIgPSByZWNvdmVyX2Rl
bnRyeShlbnRyeS0+aW5vZGUsIGZvbGlvLCBkaXJfbGlzdCk7DQo+PiBAQCAtODQ0LDggKzg0OSwx
OSBAQCBzdGF0aWMgaW50IHJlY292ZXJfZGF0YShzdHJ1Y3QgZjJmc19zYl9pbmZvIA0KPj4gKnNi
aSwgc3RydWN0IGxpc3RfaGVhZCAqaW5vZGVfbGlzdCwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9
DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmVjb3ZlcmVkX2Rub2RlKys7DQo+PiDCoCAtwqDCoMKg
wqDCoMKgwqAgaWYgKGVudHJ5LT5ibGthZGRyID09IGJsa2FkZHIpDQo+PiArwqDCoMKgwqDCoMKg
wqAgaWYgKGVudHJ5LT5ibGthZGRyID09IGJsa2FkZHIpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlfc2l6ZSA9IGlfc2l6ZV9yZWFkKGVudHJ5LT5pbm9kZSk7DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoZW50cnktPm1heF9pX3NpemUgPiBpX3NpemUpIHsNCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZjJmc190cnVuY2F0ZV9ibG9ja3MoZW50
cnktPmlub2RlLA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpX3NpemUsIGZhbHNlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKGVycikgew0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX21hcmtf
aW5vZGVfZGlydHlfc3luYyhlbnRyeS0+aW5vZGUsIHRydWUpOw0KPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdF9tb3ZlX3RhaWwo
JmVudHJ5LT5saXN0LCB0bXBfaW5vZGVfbGlzdCk7DQo+PiArwqDCoMKgwqDCoMKgwqAgfQ0KPj4g
wqAgbmV4dDoNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByYV9ibG9ja3MgPSBhZGp1c3RfcG9yX3Jh
X2Jsb2NrcyhzYmksIHJhX2Jsb2NrcywgYmxrYWRkciwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXh0X2Jsa2FkZHJfb2Zfbm9kZShmb2xpbykpOw0KPg0K
DQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
