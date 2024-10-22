Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDCE9A96B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 05:15:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t35MS-0004bZ-VD;
	Tue, 22 Oct 2024 03:15:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t35MQ-0004bP-3E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R972W8mtEoaX2rgZCHWgtyxQyFRYryo3E3gOjAsSf/Y=; b=MRXM9dI7TV2+5ab1bI0LfDgKdF
 mIMIHY8iUSDlPuxpLl+JWYnqYWrAO43snHhnOoj6TyYFQSwZ+pQsQ4pVYbtTLJ+F2esE27zF9/lEx
 DoGW/GIEhLzgntsCbjmPHrMp3ytNZUB7xQFC2Lm5SOA6UOuB7aHn7d8Ucp/a52kfTSbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R972W8mtEoaX2rgZCHWgtyxQyFRYryo3E3gOjAsSf/Y=; b=EVCEgHRCMk7EWcnWyvLr5dR01b
 EFSrvDymDe5h5zPbFi+9OZjyehFEAabd+LQDIsgVUgCnpBO5iz88Jxfbz4sIA74KaPrt2CAqAEG1A
 NRsg3J6CR9dcW0u8U46gXW+NmZ+AefkNE7RijM10LpipPvkeVX4CGWxss6Ahktvt3Ej0=;
Received: from mail-eastasiaazon11010034.outbound.protection.outlook.com
 ([52.101.128.34] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t35MP-00011k-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 03:15:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGDkjaC6iXGhjFYFdHMgPEwDwr8vSk04pBnuYedOrDsbi9tq/ZW3Dt/BFhV4bobudU62xpM+nse4KPAuHmqyFVYkCSAICZRhdl1mKKFWVuwm/mYHBQuW4YISL1KAv5nqLuUC1E7C9T8jPlvQ8/E3iFGikcwW8II1NMkSh06RUtQU8iZDAhxcQ6ExjUNBkICM4CxqsBS1qhht++lV6pGmNU9k3avrkMasWAM/G+6jo1BbQwG+Q4TqFwAmFO7h/cjl+E/8DqNdz17J001ep8pb7Y6o8QCwvMMRlXsOlm3MOGfI/Uf/KXRyhpnQPTzdc5n+pmu8GSMaNWWnKKmaS4IWDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R972W8mtEoaX2rgZCHWgtyxQyFRYryo3E3gOjAsSf/Y=;
 b=IQk2JPeYO/MPAp6KHJS7oBZMAD+QhjKVM5gymRns8v6EQhY4M4rDTziUrc0LQxdgPEzyIW6EcAXYmtm00UKSu0v5Fnbf0smoU+sROo4mWIx1fuw4dk882ysrY4daQmTIhblIjZUYARpYgvdUiA5SKTV9UC865eH0htxzLZIIQ1C5XZQ/+lvrsu586mkItbY4bAZ16xBTW5C3Lbbh2KthqHvVui/anILsUf32yVTaigdZxG7+v9b44eeSkZZkaGzse6M+XY0s9Oho1UmRggyVcZM7+0o4/zw0dUY3p34cbP6uO6KKXYqGd2aDWBVu4zjNBNkOyJHQbQlYZVCVkw48HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R972W8mtEoaX2rgZCHWgtyxQyFRYryo3E3gOjAsSf/Y=;
 b=ers7AzKOV1QCRkBQGjKneFFf+aWYvuB/+jOJfRvOcfxOnnPoAA348ibsffsSshdfu1FnL6xr8eqH+P9NnfAXd9Lbk1/do22KB156/r83OnQVT31HPID7pUhDuw5iV9EH+1E7Yx13aiNTPdUeBk2cZN/nyuqGm0QpXJbwK2SX6051uhyl++6hJScLfctcNSEY1Y7yHue1emNErGoNW9YgIbI5GmCHXzuKW8JHEwrwg4Ac++7tKb3bPZT7y12Zn7djklZ+VFyVKpCKaSyfBdg9Obi1V1grD28ebpvL1AWTkUD9/fV8R1e0A3ROjA1gQVYYx6nXburTLhfbwKr7FScD5A==
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by SEZPR06MB6549.apcprd06.prod.outlook.com (2603:1096:101:17e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.14; Tue, 22 Oct
 2024 03:14:54 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 03:14:54 +0000
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic to allow
 more data to be written with the CP disable
Thread-Index: AQHbGjOl9uPnM3AaYEqxY543nx+w4bKSJqqAgAAGDwA=
Date: Tue, 22 Oct 2024 03:14:54 +0000
Message-ID: <7450a770-22cf-45e4-bc92-1812d1295eec@vivo.com>
References: <20241009102745.1390935-1-hanqi@vivo.com>
 <3fdd8fdd-8b80-4989-8cfd-78051bd85936@kernel.org>
In-Reply-To: <3fdd8fdd-8b80-4989-8cfd-78051bd85936@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR06MB7140:EE_|SEZPR06MB6549:EE_
x-ms-office365-filtering-correlation-id: f278471e-94a2-4a84-81e3-08dcf247b350
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RGo3TDdtak81bXJqcFBKOENYOGZ2d21sV2lVNUNsWWVqYWxrM21kbDlrLzJp?=
 =?utf-8?B?RnF5Q1dyL1dBQUc3UUNaZVFPdHBCSittS0NTaTNwK0pMMnJMZkw2djk4azZC?=
 =?utf-8?B?R09rcUs2OWd3Y3JxU1BHaXlaVkZLMy81WmpvSEwxdDQ4dlg0dGc5QzZ0RWNn?=
 =?utf-8?B?bm1tYlBHZXJPaC9MUGJ3cXRpNys0QnJkMWhFUnpNZmRqNjl1M1lPbHkyaWdR?=
 =?utf-8?B?Ri9yT3ZVSjJyT2lKNWhzL0ovTHFwOHpQWWduRTYxWmVwN29XK2ZQNE9lN1p2?=
 =?utf-8?B?Y3BJanFhUnZibnVhWFgwbTNjbzM3ZUhJZUxnc3FDd0YwU2twamUyNGl6cDZU?=
 =?utf-8?B?Y2VRMzVEYkhVM2VEUEdUL0pDbTRpTjNBcFV1aVM3dmVyTGNyRElSQXpyWVdT?=
 =?utf-8?B?VTdvZnI2c3Nyd1IxUXdQbnhENUp1VldBcTBydlR2bVpFOFdKSTY3dTRSNkxj?=
 =?utf-8?B?MGFudWNucFZTQ3RsYjFsOHFKQTIySDY3ZitLOFRqdkpEL2ljUU1QNHk4Wk11?=
 =?utf-8?B?RFNOTEE4QnRzQ2x5WVpkVGlwKzRWdzczdzZsM2NZdmp2emJpNDlHVlE2amsv?=
 =?utf-8?B?SnhQQ3lRMjAwS0tQUndmZXpaTnVsNDIxc1A5b2xqSzlMNVJTTWczamxWRkox?=
 =?utf-8?B?MUVQMFEwbW5ZMHA4bFpET0k1Q3hHdXRMN0VIanI2b1R1emQ5Y1Zydm51Tzk4?=
 =?utf-8?B?eDQ2c2hJT2lsdzFDRHFvQ0YwSloveHZxR1N1NXBMWUhqSUJTMkFyRVgwNjQ5?=
 =?utf-8?B?bW9IMmMyYitJL3Jlb2RZa3NFT1NvdmRoNlJsVkkvN0ZCOHU3aW5HUnJZN2g5?=
 =?utf-8?B?RHBENTVvM3JxM0szcEJJVjdoUWFtNnYwTXBWREpTdUE2UlpHbGFSWDBGZEl4?=
 =?utf-8?B?bDJ4cXI1d0I4a0xCQ3VDbjFNL0tkanBvb0FQTFpEN2c0M012VnFIZjFCZDJF?=
 =?utf-8?B?cmxPWHI3U2lFYlptN0luMmRKQ0lSeGxNcTNGTDA5ZjEyYWxLRnpVSnhKWUpB?=
 =?utf-8?B?K0tDVzVBZEMwTWlPRktzZ1U1OGpsWXd5MHI1ZEVxYmZBZkpaWS9Qd1RsZkdW?=
 =?utf-8?B?Rmw0TTdoMnpNYlUrVzQ0dDV3OElPOG50RGxGMmN0d3lyMjlQbUxUS2t3S2Rp?=
 =?utf-8?B?TDd2ank5MjZjUTJRZnFjSDNMZzBzMHJWREw4bUNaTTY3ZUVPME40VGZQcFAw?=
 =?utf-8?B?ampraGxRUzlYd2pPcTlxMXM5RUpMY3UxUXJZaUdrWlN1Tll4Q01BeUxNUFJG?=
 =?utf-8?B?Vyt0azBKRUNNM253U0UyQjRXa1htN292NHNjNytyNU1LV1hQNkdldC9GU29v?=
 =?utf-8?B?VlVLM1ZmQ2V6RkJZU3lQRkhBdFdQNkE5VGhNNjEzUVFrZlpuTWNSRXNlSlV5?=
 =?utf-8?B?dHU1SjE1dnRJTDUxUEJVR2pkaEw0U281T3VUV2xjTkR1d0xlWkppczFPVU1k?=
 =?utf-8?B?b2NQWUtmeVhBaklRZHVhNk1FL05MSVFMWWJtV1UzWWJFSFJrL1dscWlJOVlk?=
 =?utf-8?B?SDNiOHZCb3VoOUNvcTFTQUtWRjh0dnNCSUwwRzdJeWgwQVZmN290QzIySWhD?=
 =?utf-8?B?bk1pQVBMRWdJUTNKVTJoWUluTm1teEppMTlXaVhqL0NqY3FQZG9TZTkrNk9s?=
 =?utf-8?B?MFJYRWtieVNXcEQ1TnBsZUgvd0F4NTJZWHZORzJjZVY3WVRIV0owdHFVREk5?=
 =?utf-8?B?bk5lV0VxNXhmdHIyQ2JBekw5Y25NOGs0dmlGa2tpeUI2bHUvV0szTGdjb2tn?=
 =?utf-8?B?a200eDh2SzZLYjNoK3JpZ0ZxclBPTDZyWm1vMGl5R1Mva2x3ME5ZMmxtSmRI?=
 =?utf-8?Q?KKjAngVbtgw6U2Z8WSd7NgXkBLMOeNYUDPIeQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEhnSXlOM0xzYWxFejA3M2lTVXRUd001eGpTSmZlakEyWlZmUzZidGREMzF2?=
 =?utf-8?B?SFpHZkhGVjg3TEN6bHgwdlREOExyd1QybnFFcUpqbUxYcW40SS9kdDJEZEor?=
 =?utf-8?B?Unc4aDB6S1B3S2t1VjdRdTY3U3VlYlg1TzIrMDBVUWtsazVqWmFnb1FyTUNh?=
 =?utf-8?B?S2pBY1dJZTFTUzNsR0h2TFZjTFlxWTJURGI4d2QrSHRzbHdCcmhuUkFvV2Fh?=
 =?utf-8?B?SDVVUnNHS1ZPN3pzaWIyYUJNQXJvZkQzQk45WlAyald5cHljLzdHMVo3SkV4?=
 =?utf-8?B?em9kakhjcE1pM0R3RDlLWWEyVERRRE1JeVYxbVN0V1M5d20yMGZ2NDIvbWwv?=
 =?utf-8?B?MDdMaTRmRlIzdmtQV2FRYUtFMFllaXYzbFhkUVkxNTBNWnZNMVQ5bDl4OUQ2?=
 =?utf-8?B?SzNiUUtGYythVjYrSWJ6WFQ3S0NzczN2TmxmajdZTDlseXJTR1FWZzNJR1c1?=
 =?utf-8?B?ZkUraU1FdDh6ZlhIRitLN25SOFRsazZERzI0YXFTT0NLNTJTbi9xZDFubGcr?=
 =?utf-8?B?UHFyaGN3NDhRZ0M5dW52K3ExTHIvdGdWeExsb0xWNlYrY1d4UHBzT3cyTEpX?=
 =?utf-8?B?SzA3bENaeE8yWmI4emdtRGpsblRRTzQ3eS95Ly9LNnVPY3VkeXVzdWZwVHBM?=
 =?utf-8?B?djNNbitrSW9BaWFOLzNKMmM0d21SSE5IL1dSMnFiWUhrYTVuellqSWFKQnNB?=
 =?utf-8?B?VHl2TFUzWktDTm03QkdKRS9YWUNVOFRhWC94d2JKcWJzYUxkSWtPNjdhNVZX?=
 =?utf-8?B?ejU5dDNGN1E5bzBFNWhDTXNBMG0vUTFIMnpDMGo2OFliN29SaTVRdE5XeVRC?=
 =?utf-8?B?emwyN01VQlV4ekxSc1h1ZENJZ1IwRVErK3VObyt3ckZKYUJ0V21FaDlyTmt3?=
 =?utf-8?B?MVFSTGcxdWZDcWFCVy9GM0dxMGZKRElVWFRWQy9LRCtYUWtmdUxtMkQzaWJC?=
 =?utf-8?B?UUFuMDNQbGhDNlhCWkRPMjg1SDVYVUhRc2RBemRidUxzNXBOaEtKRTMvMW5R?=
 =?utf-8?B?L3pjSG5ZY1Btbjk1STZ5MTUybG94MUg4OEpqWGRGbVFxcmp3eTY0ajAvT2Qy?=
 =?utf-8?B?Vk9OTlQ5ajIxM3lpUlF0MFpmUGoyUlkvMmE4ekd1bTI1ek9vTW9GRG1GSFFI?=
 =?utf-8?B?eTJ1VGdoZ3BoUUtqeCtEd055YTJickl0d3hxYmxHSFc1QUJLbVVhazR3NTd4?=
 =?utf-8?B?bDErWkhIdmxram0rZ2FXTkIxWWdwMVF6a2xvOVkzMjI0RzJPNXVoNTFtZXVT?=
 =?utf-8?B?eGlubTRKY25haGJZM0k5YXYwdGpwKzk3ek1Ia21QazNJODAzZU5ORFBGVU9t?=
 =?utf-8?B?TE45dXM1QVROTmVCTW9UNDlxZzBRRVRQbTVtZWRIQ2dITnpGSVo4TU5DTWZ1?=
 =?utf-8?B?ZGJYeEVydkMzeXlINGdkdHR0RkVEbnM1bUFheGYvZGt1VUZXTmF2OFZZS2lY?=
 =?utf-8?B?eUVBbDlpRHArdi9ybkxUZm5HMGphYlVZQnFTUUs4Zlk0SXRrS3hndldKU3ZO?=
 =?utf-8?B?Y2oyTXJNZm1wQ1R4eWp0QlBMdlM1cGtiVmhqN1AxcnFINnJ4blRDZ3dubzJi?=
 =?utf-8?B?cWs2Q1cvK29nK2EvMkhUQU1ncVZoQ2t2empmTGl5S0FoSFZHak96bzV3SkNB?=
 =?utf-8?B?emJHR2htVUl0MndYOWF5Y1ovL28rbWs5WnVTM01wRjdZOFNXZy9QL3B4NjVY?=
 =?utf-8?B?ZXZFOUZnTlU0ZytxTzQwbWhqbmhqaUpEeXl0MC9mQWI2V1dlbmFjVGlEeGpP?=
 =?utf-8?B?dFMzMjhNZGJTUC9OM1crYnlzSDhyano4QVZucTNoOEVJSGc5NzN3OVdKNnUr?=
 =?utf-8?B?clBYR3JSdmtwWFRRNEZVQlNqVVM5L1F1NllUdmo2U0x1dDhYRy8xSXNDZlpK?=
 =?utf-8?B?eThpTllXNUlPNkVSdTNiMmVPM0JNZlk5TkhOTm1STWlKK3BRR2NacVlJT0Fu?=
 =?utf-8?B?YUplczJrOFk0VStMdlo0YkJiaWhjZnVrZ1FTYldMSnBuaHovNFZQcEhTVHVQ?=
 =?utf-8?B?SUtrSTlMZmhSSGhSb1BPbmpTK1BHVmtRbTBMd2NoYXNEZ3JKQVZEU0hYSHli?=
 =?utf-8?B?bnlVdGpxdkdUL3JkaUFYVzBaOWZ6QUFVUlI0azZ1Ty9zc0lZaTY5T0YzNVd4?=
 =?utf-8?Q?Cv74=3D?=
Content-ID: <F37783D4DC2E6045BF03B27FE508CC27@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f278471e-94a2-4a84-81e3-08dcf247b350
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 03:14:54.4379 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QE3X13Ge1Sa7JsQmH+0e8oTpeEP8BFtrd36DxBLwFXulaQktlJEIC24SJdynXjLktpl9Mwm41Hlk2E2iCBJi/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6549
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 2024/10/22 10:53, Chao Yu 写道: > On 2024/10/9 18:27,
    Qi Han wrote: >> When the free segment is used up during CP disable, many
    write or >> ioctl operations will get ENOSPC error codes, even if [...] 
 
 Content analysis details:   (-1.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [52.101.128.34 listed in list.dnswl.org]
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [52.101.128.34 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t35MP-00011k-S4
Subject: Re: [f2fs-dev] [PATCH] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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
From: =?utf-8?B?6Z+p5qOL?= via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: =?utf-8?B?6Z+p5qOL?= <hanqi@vivo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

5ZyoIDIwMjQvMTAvMjIgMTA6NTMsIENoYW8gWXUg5YaZ6YGTOg0KPiBPbiAyMDI0LzEwLzkgMTg6
MjcsIFFpIEhhbiB3cm90ZToNCj4+IFdoZW4gdGhlIGZyZWUgc2VnbWVudCBpcyB1c2VkIHVwIGR1
cmluZyBDUCBkaXNhYmxlLCBtYW55IHdyaXRlIG9yDQo+PiBpb2N0bCBvcGVyYXRpb25zIHdpbGwg
Z2V0IEVOT1NQQyBlcnJvciBjb2RlcywgZXZlbiBpZiB0aGVyZSBhcmUNCj4+IHN0aWxsIG1hbnkg
YmxvY2tzIGF2YWlsYWJsZS4gV2UgY2FuIHJlcHJvZHVjZSBpdCBpbiB0aGUgZm9sbG93aW5nDQo+
PiBzdGVwczoNCj4+DQo+PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZjJmcy5pbWcgYnM9MU0gY291bnQ9
NTUNCj4+IG1rZnMuZjJmcyAtZiBmMmZzLmltZw0KPj4gbW91bnQgZjJmcy5pbWcgZjJmc19kaXIg
LW8gY2hlY2twb2ludD1kaXNhYmxlOjEwJQ0KPj4gY2QgZjJmc19kaXINCj4+IGRkIGlmPS9kZXYv
emVybyBvZj1iaWdmaWxlIGJzPTFNIGNvdW50PTUwDQo+PiBzeW5jDQo+PiBybSBiaWdmaWxlDQo+
PiBpPTE7IHdoaWxlIFtbICRpIC1sdCAxMDAwMDAwMCBdXTsgZG8gKGZpbGVfbmFtZT0uL2ZpbGUk
aTsgZGQgXA0KPj4gaWY9L2Rldi9yYW5kb20gb2Y9JGZpbGVfbmFtZSBicz0xTSBjb3VudD0wKTsg
aT0kKChpKzEpKTsgZG9uZQ0KPj4gc3RhdCAtZiAuLw0KPj4NCj4+IEluIGYyZnNfbmVlZF9TU1Io
KSBmdW5jdGlvbiwgaXQgaXMgYWxsb3dlZCB0byB1c2UgU1NSIHRvIGFsbG9jYXRlDQo+PiBibG9j
a3Mgd2hlbiBDUCBpcyBkaXNhYmxlZCwgc28gaW4gZjJmc19pc19jaGVja3BvaW50X3JlYWR5IGZ1
bmN0aW9uLA0KPj4gY2FuIHdlIGp1ZGdlIHRoZSBudW1iZXIgb2YgaW52YWxpZCBibG9ja3Mgd2hl
biBmcmVlIHNlZ21lbnQgaXMgbm90DQo+PiBlbm91Z2gsIGFuZCByZXR1cm4gRU5PU1BDIG9ubHkg
aWYgdGhlIG51bWJlciBvZiBpbnZhbGlkIGJsb2NrcyBpcw0KPj4gYWxzbyBub3QgZW5vdWdoPw0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFFpIEhhbiA8aGFucWlAdml2by5jb20+DQo+PiAtLS0NCj4+
IMKgIGZzL2YyZnMvc2VnbWVudC5oIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+PiDCoCAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL3NlZ21lbnQuaCBiL2ZzL2YyZnMvc2VnbWVudC5oDQo+PiBpbmRleCA3MWFkYjRhNDNiZWMu
LjliZjBjZjNhNmEzMSAxMDA2NDQNCj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5oDQo+PiArKysg
Yi9mcy9mMmZzL3NlZ21lbnQuaA0KPj4gQEAgLTYzNywxMiArNjM3LDMzIEBAIHN0YXRpYyBpbmxp
bmUgYm9vbCBoYXNfZW5vdWdoX2ZyZWVfc2VjcyhzdHJ1Y3QgDQo+PiBmMmZzX3NiX2luZm8gKnNi
aSwNCj4+IMKgwqDCoMKgwqAgcmV0dXJuICFoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3Moc2JpLCBm
cmVlZCwgbmVlZGVkKTsNCj4+IMKgIH0NCj4+IMKgICtzdGF0aWMgaW5saW5lIGJvb2wgaGFzX2Vu
b3VnaF9hdmFpbGFibGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gDQo+PiAqc2JpKQ0KPj4g
K3sNCj4+ICvCoMKgwqAgdW5zaWduZWQgaW50IHRvdGFsX2ZyZWVfYmxvY2tzID0gc2JpLT51c2Vy
X2Jsb2NrX2NvdW50IC0NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB2YWxpZF91c2VyX2Jsb2NrcyhzYmkpIC0NCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBzYmktPmN1cnJlbnRfcmVzZXJ2ZWRfYmxvY2tzOw0KPj4gKw0KPj4gK8Kg
wqDCoCBpZiAodG90YWxfZnJlZV9ibG9ja3MgPD0gc2JpLT51bnVzYWJsZV9ibG9ja19jb3VudCkN
Cj4+ICvCoMKgwqDCoMKgwqDCoCB0b3RhbF9mcmVlX2Jsb2NrcyA9IDA7DQo+PiArwqDCoMKgIGVs
c2UNCj4+ICvCoMKgwqDCoMKgwqDCoCB0b3RhbF9mcmVlX2Jsb2NrcyAtPSBzYmktPnVudXNhYmxl
X2Jsb2NrX2NvdW50Ow0KPj4gKw0KPj4gK8KgwqDCoCBpZiAodG90YWxfZnJlZV9ibG9ja3MgPiBG
MkZTX09QVElPTihzYmkpLnJvb3RfcmVzZXJ2ZWRfYmxvY2tzKQ0KPj4gK8KgwqDCoMKgwqDCoMKg
IHRvdGFsX2ZyZWVfYmxvY2tzIC09IEYyRlNfT1BUSU9OKHNiaSkucm9vdF9yZXNlcnZlZF9ibG9j
a3M7DQo+PiArwqDCoMKgIGVsc2UNCj4+ICvCoMKgwqDCoMKgwqDCoCB0b3RhbF9mcmVlX2Jsb2Nr
cyA9IDA7DQo+PiArDQo+PiArwqDCoMKgIHJldHVybiAodG90YWxfZnJlZV9ibG9ja3MgPiAwKSA/
IHRydWUgOiBmYWxzZTsNCj4NCj4gQ2FuIHlvdSBwbGVhc2UgcmV1c2UgZ2V0X2F2YWlsYWJsZV9i
bG9ja19jb3VudCgpIGFzIG11Y2ggYXMgcG9zc2libGU/DQo+IGFuZCBjb3ZlciBpdCB3LyBzdGF0
X2xvY2s/DQo+DQo+IFRoYW5rcywNCg0KVGhhbmsgeW91IGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkg
d2lsbCBzZW5kIHRoZSB2MiB2ZXJzaW9uIHBhdGNoIGxhdGVyLg0KDQo+DQo+PiArfQ0KPj4gKw0K
Pj4gwqAgc3RhdGljIGlubGluZSBib29sIGYyZnNfaXNfY2hlY2twb2ludF9yZWFkeShzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmkpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGlmIChsaWtlbHkoIWlz
X3NiaV9mbGFnX3NldChzYmksIFNCSV9DUF9ESVNBQkxFRCkpKQ0KPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiB0cnVlOw0KPj4gwqDCoMKgwqDCoCBpZiAobGlrZWx5KGhhc19lbm91Z2hfZnJl
ZV9zZWNzKHNiaSwgMCwgMCkpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOw0K
Pj4gK8KgwqDCoCBpZiAobGlrZWx5KGhhc19lbm91Z2hfYXZhaWxhYmxlX2Jsb2NrcyhzYmkpKSkN
Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIGZh
bHNlOw0KPj4gwqAgfQ0KPg0KPg0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
