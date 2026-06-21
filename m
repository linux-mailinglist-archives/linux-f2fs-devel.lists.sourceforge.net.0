Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kS4bCRgNOGq+XQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:11:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E266AB3F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 21 Jun 2026 18:11:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=B7lbelPN;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=CKohZvS0;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=CDDiqb3Q;
	dkim=fail ("body hash did not verify") header.d=outlook.com header.s=selector1 header.b=R1ESN4mY;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=outlook.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:From:References:To:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQjzZgzLaMMZ3sdfaKLA600H6e8PpuzeFhQ1AUNHmg8=; b=B7lbelPNf0LymSK0dp7wJzv0+Y
	uiiELpZ2swXXOGt8NGPIUbbtymL26YofXIhUTmI/cn/c4WicU1U4vCc4Hco1i3B15CReHvCpqIRgV
	gxVCdxOu97mUpTtOznSPTfAnkn9xxIyfjvNImZbwmgutBDIUD81diLN6MYvJSxU7qEts=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wbKl4-0004cc-2g;
	Sun, 21 Jun 2026 16:10:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@outlook.com>)
 id 1wbKl2-0004cN-9B for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SkFxQAhbKb7Usli8MwwLinKhpvVbRsV/Gfu/c+4KdDk=; b=CKohZvS0WPVyiJM51UV3iNt1Gy
 s5y4Gg0yuvegMsR6BA02CZmcoPObaEzqNhTj+yfoU3IiW3XkjAmya3XtSswj2hOn3CuKnCIhM9IsH
 zSmjd3u0+57Mo7GFGFFHGIMQmgbDIv/NlUze7S0YMWLwTZcpgyd9GdfANThgMSUdiIqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SkFxQAhbKb7Usli8MwwLinKhpvVbRsV/Gfu/c+4KdDk=; b=CDDiqb3QDVQZS9ieFbJ7bTy9ra
 7Xcarp5ShymgWIq87wkTY8JF0wMqsFMdUKyXEAp16cOekARaUJyN6X8D94/JI4KhJHCOw7Spo2QpB
 wetiSAPWX1jaPcBqIXH5k0YnnjwBZ9yXa+xwMKXI7woIKCwRg5vcZ1Ozgag6gLF1eWNs=;
Received: from mail-japaneastazolkn19013087.outbound.protection.outlook.com
 ([52.103.43.87] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wbKl1-0007Mk-JQ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 21 Jun 2026 16:10:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lx5y259HSCLwZfEJXOHnsOe8+APjYjedqbiS1pw9WM86RxNhHEawTFP1UL2tqcu3XxoO9pmr/cLsVk/pKsGo80rAC62+o0rXS5xkHfv0QoQbMQPjkQLFne4AtWKEX0qYdYZH16jDpwVXf1wZnEDu0XPzrlx0GPBXpSmOhNYqINqDpfATi8ypW2TCeZNbOd6oww6ejbZXHSyda9wwxmXsIL37pDvjAGWdNN8JCAL1J1OiJRi6ALbaAicOmkwfxE3scXVyHpL9U/5B7VjYQ2uDn3+Mm9fqGM1/Ep3mruExm8dVNjtdo8T8iLxjIZUGKoUlWJ1IvJy62trHobg2T+CWGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkFxQAhbKb7Usli8MwwLinKhpvVbRsV/Gfu/c+4KdDk=;
 b=eZFcbDl3qEJZldUWr0488aqtH2mrguE+tOTggdJ7N3XKxmfmK9cgZ7gzeyiZ2wxasqymXWcz0Dq9qXbGsw3BGLXoBbbrPoUmwlr4XK493vgXh/G0U0Wi1RxuGUy2ZJr3d1qBYK0kb8BaUxZN7kuus8bPw8A8R3E8FikJ29NJPnALWgG+0ReZzyh0UoQHG1dCInd0mJIFbUhO+G57BGodV145flgRqvZ0Xd1k0c19X+tzTvOvOlTqKDxb9Qwuq6nwT8CsQCUoHrS6lT8PkQxFtvxFb8CvFRUnvaxaJ9YLyTS4j8y6anW/+x/e3UJUuWdLvaqfsu96zNVV01rU9yDn7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SkFxQAhbKb7Usli8MwwLinKhpvVbRsV/Gfu/c+4KdDk=;
 b=R1ESN4mYx9r6kuJiDxuLpqGLeD4U61D8c2VYgwz6+zZr3otEXStS5HraWeS6f3bye7BwQrkwimHNBy9HALV45EeQGXAm8toFGb4p8X9tGSyn3po0O0bc1+l39byFEW+/YLIcFilILu2+8+njQzx57ljJWdt8ZF+w97L6R5XynbVe9rEj6bnp6otHbWN6n5stQNHb22B7CAaIR7zVUPgeFQ32LAwkKTH7JeeIp0PboNLe4JvOOlDk10AH7lUOYB8wtbtKQ0EaWMOxRYgNTyPhLi9ArxK7q6yWUwXRTv2M2ZAu6Rm7RERrhbIUl9JRY2xJdor0B3d9U5qoDwZw+lxHvQ==
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com (2603:1096:101:4e::13)
 by KUYPR02MB9910.apcprd02.prod.outlook.com (2603:1096:d10:71::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Sun, 21 Jun
 2026 16:10:38 +0000
Received: from SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72]) by SEZPR02MB5662.apcprd02.prod.outlook.com
 ([fe80::e4bc:d995:70f6:5b72%6]) with mapi id 15.21.0139.018; Sun, 21 Jun 2026
 16:10:38 +0000
Message-ID: <SEZPR02MB5662354CD0B8CC9D2F56CC1F99E02@SEZPR02MB5662.apcprd02.prod.outlook.com>
Date: Mon, 22 Jun 2026 00:10:32 +0800
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-5-yangyongpeng.storage@gmail.com>
 <b2560939-82ef-4d1b-82fd-fa90388c3316@kernel.org>
 <SEZPR02MB56625194F24957F19418C62A99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
 <05ea8dea-3c93-4157-946c-5fbb593636a7@kernel.org>
From: Yongpeng Yang <yangyongpeng.storage@outlook.com>
In-Reply-To: <05ea8dea-3c93-4157-946c-5fbb593636a7@kernel.org>
X-ClientProxiedBy: TPYP295CA0045.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::6)
 To SEZPR02MB5662.apcprd02.prod.outlook.com
 (2603:1096:101:4e::13)
X-Microsoft-Original-Message-ID: <1ffcbbd8-0f23-421c-a63e-8bcb4076d353@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB5662:EE_|KUYPR02MB9910:EE_
X-MS-Office365-Filtering-Correlation-Id: 35e0d613-46ab-4856-4c59-08decfafa209
X-MS-Exchange-SLBlob-MailProps: vuaKsetfIZn9IFDOZRHBr3PkJ6iE+FIkYyWIor6daN2rQxwiIxzNXy1fSx/G87eGhLUR1jLzmk1oXMQsJb9QFuWNRozcAkQ6IMrIhpJMLAoEGlVzRRCC/78RIB1siKPJk5tI+pMRb43KPK1jV1c0Qp1Olswc/3DIL5QqkwS7pmToVaqmAnVxZ25PXxEcw/P/Qi6yEapxyMzw7NU2J8CQ8ENBmmHUn4VjnF3PpqN45iY7Kjn11vGqPIAR0tx0B7KR6uKPrLw8VGoP8+ubuqZ1K0hmPocX2NeEo4PNQ/eh5+Otk0Ed6hFU+26Vlb2idgaFZ0fCtaEvLwzsvjPkFv8v8uHXvydl0e2R7gFrpFJT64OZ/z8QWKMsZtMxOch9z5seHqq1QcjxdF78lUZMKbaIeKlAU9daZq+KaKZ49B6sCezbZTsg54UsaDwfGxfz0yZqlX8vSB4HGG6EvFmov7abV4aqSIU6wjjSdCjbhST7HbCccScIQW6Pun0PVFPNBd2XnFOz9i579a0jhfN+HFl3tbK+Dh9inSd6kkaU49F1kRLtnSLJrq7UlbKMw9XlUUIKq9v3bno+ShguiE99MGa4qpIz/4+95JBcPCBzoxbjqokm2blKWSwQBNFfUyhyL5zro9eOGkg5IvtYGQPjYJDfUNHrda7bb6XP3l1umdaRjxSgsfkNXCzd6Bx9EeQVHuX+mPMrKxDsy0g/CJTCXJMuY8mmAcXi3ZjnPIChnZib9bTEdZe5+SXw9WgwakAfjzoBqtQx0dhQ9ZaUkPeVpIfti/YITw9+kXVuLpnuqxURKZiOHYa/sAyeu58PBmf3tXLV
X-Microsoft-Antispam: BCL:0;
 ARA:14566002|24121999003|23021999003|22091999003|6090799003|45011099003|15080799012|5072599009|7042599007|8060799015|19110799012|51005399006|25010399006|41001999006|40105399003|10035399007|12091999003|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2lSNUpEWUhsWjM3d2cybUF5ZG1WS0hjZ0dkeHZDdmZWK3dtcEkrblIvdzY2?=
 =?utf-8?B?OUtMbTV1NVFqZ2FWVXh5RjBjUUhLYi8zM1duc2hFVXhuVW52VUJkbTlVd051?=
 =?utf-8?B?QmpvQStkZ3lzc3YzTTVEdk90V2srYUh2Z3hQVys2YVVTd204STFOZG83UmIr?=
 =?utf-8?B?eW1LRWhFOUd3cDFtcmdWWHhNUFRjWEJjVmdCanllTHhpN09uNDRvdHJOTWlW?=
 =?utf-8?B?TEV0ZTRrZWFqNE1XS1dnUjRXMjRFdFl1bEZSMGlqZEZSam8ySmdRbGMrQzZW?=
 =?utf-8?B?cGhRd0hDYlJBK0pzNkFScGR2ZnRuL0dHUStpTlB5VUF1MXd5L1V6QUQ4WWFh?=
 =?utf-8?B?d0xTN3ZSTXg4aDRkL1B5MW5xMDZkZ3RKNXJyelQ2RUZVR2hGUE9rdDFMWmNR?=
 =?utf-8?B?cHEwdEhKcWR0WlFoR2VNZkN2Wk1LQUtSYTFVdGZQam1INEZlc01lYjBCSWVs?=
 =?utf-8?B?blBlVnNSWUttK25MU3N5VUt6ZWN0WGNxTlBHMi9aSmFHb1Jwak5OekwwMU9O?=
 =?utf-8?B?cmdobUIyU0EvRHI5bGlwRzRuSVZWeExZQkNoamdhaTRSMXJqa3Jpd29lSlBy?=
 =?utf-8?B?dmF1QVczcGtrOXRBcStpbUYrb1F2T24wdW9XYnUwMTJWa3RrS1RpZmw5N1A4?=
 =?utf-8?B?RmdQRHVNV2dvSFZ5aDNyaU56MkVUSDZpbTI0UkRYZXREcVZoODBsZml3ZW1n?=
 =?utf-8?B?ZHV6N255VUMxVVRFOEJPMFRGU1BkOGtvQmF1U1V4aGFCaVlBSG1KMnpCSTlK?=
 =?utf-8?B?QVFOc3Bxa0FoSEFUclBDd2lNcUNTUXdOMUNWbUdqeFUrT1BaOGl6aHMwQWF4?=
 =?utf-8?B?dUdrenRWcmhQdVVSREtHRVMzbjlUOER1V2Y5QUJpTHd4YTBWY1ZwSzZkTmVo?=
 =?utf-8?B?bUx5SXBCZFZ6TjdUaTI0NHA5MjdpSytMUTVCNkZLSzJHNDA0SVFxODlmVG9a?=
 =?utf-8?B?ZTNvdTBEU2VaOTR3NDlYdi9RanRNQlRiTmk0UXdKK0tGdFdVTFArTlJWU0dk?=
 =?utf-8?B?M0Jkb21jVFpkb29JRHQ5K3ZUcndBT2wzcGFSaFZxK2c4TGVsbWwvVlhZaCtN?=
 =?utf-8?B?YlNGWHJiL3JzYmJWTk41N1MwR0RaNFFqa0JrVGY3cVlCdkg5YXR0TTUrTGxB?=
 =?utf-8?B?Ym9tYnE4bVVTRkZlQXNkY0o2VnBmMWJoVmNxRFR1WFRSWEl6dFJKdmVVL29R?=
 =?utf-8?B?VUdhdVNhcXVyNEZiZFZKZ2ZOOUJ1Qkw1VjZlQVRVbkgybzlJd2NtWTAwVDNF?=
 =?utf-8?B?aWE5eGR5Yit0WDNYRmVzQkU4eVh3YjgxVlN0UHBrcFZZSWRDMUpFa0FkaXRh?=
 =?utf-8?B?a2NVbW9EelVmZHRWaW5vc0xoWmFIV3duQ0M3VWlmaFE1S2Vna0Y3ZEZlZitJ?=
 =?utf-8?B?U2xtSlNTN0N4bmtUMW13Y25RWU1DVVh4MlFQOUZyVG4rZ0IwR24yV0tQV3hz?=
 =?utf-8?B?ZWtXNHpYYm9RZHBST2pnWDdSTjgvQmh3RGhHd2doY0tNRC8vdFJaNzQyZWFV?=
 =?utf-8?B?dkdmSUNvRFhDRGpDeWttNEdqRGNaNW8rVlFIRE5KNWRKZUpud3RxUm9OM0NG?=
 =?utf-8?Q?i7Hu+DXHuZ+xXfLgqeaNit6kMp2+r0OLwXUFugha3lfB80?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnFLT0dLSU1PenpmcHFKY3lZNFJpNFBkQUxmRHM1ZTR6Ykp4Y1EyQkxZZGhE?=
 =?utf-8?B?UnNZMnk1U0xXdU5yaWs1VzlXOS9PbXBmQkRpcXhiZjlBSTJyaGlaclRLL3Y5?=
 =?utf-8?B?dllyVFR3ZmV1VWQwM2VsYVV5bnhuRTRKNTNIMWpUR1lkaXUyajh4WDRXNm13?=
 =?utf-8?B?c0hVc0JuZGZxRkhpUTdkZHJqcmhnVzRMeHFyVDhqQkZ6TXM5KzQyMzR6Uzk4?=
 =?utf-8?B?bGJYY1VCSnNlSUo0cjZZN2UvQVFnUXlkRVhTZzVkbkVzemxrcDZESG42amZp?=
 =?utf-8?B?U3k1aGVUeThmdjhaK25XOVFjMUI0UEJpNDc1QlkyZm45dGp5WktUMlh1a0lw?=
 =?utf-8?B?MVh6eHVSVTZZNUQvc2ZuQThTQ0gxTFhXZGVMVFo0QkpvdlBIeTlZZEhYMlZI?=
 =?utf-8?B?dnNtR0hhSGZZeDFuazZTVElVeVpFQi9VVDNxQTRsMzMyeGl5K2JaSThzNHhD?=
 =?utf-8?B?ZTNDTHdWZDlLMEVaTFFzS3FGa0RNcEFOSFBHUGxxNVZqL0FldElldzFmY1ZH?=
 =?utf-8?B?ZjkxL2ZIRms3RkRBb1lqWHhWVkJ5dzlmM1ZoZWFUQkNUVWg0aGNBcWpjNnNO?=
 =?utf-8?B?ekxvRVB0SWRST2RMOVZEN2xtYjdCL3h4MWI2dlg1bldjVHREcmsraWpCM3Fw?=
 =?utf-8?B?Q2U4OVdPK1gwVFMra2JFMnpXemYxUUR4ZzBUaW5BQVBKOGZNOFpTY0M1QWg1?=
 =?utf-8?B?TGVQazZpdnAvMTI5bW93SWlrQWcwV0pZWWJnOHhCWnNHMmpqU3lFaTV2SHFM?=
 =?utf-8?B?N3ZBdTg4RXZtVVJmd1ZkeE5BL1liYm01OXdHSmlZNjBLczVKczV6NCtVR3Jh?=
 =?utf-8?B?YTV6ZjVja2c0NlliR0xmQjVRTyt2OUhaYkZFVDRWcVdxSUd4SkxWajRVaUVy?=
 =?utf-8?B?QXNMVDRWbWlrUlEwTTlUSzBibFV0SXhOSmM2WW82d21vQnp6WmhKTjBqNEh0?=
 =?utf-8?B?MHo4bmpSeGNwd3BIeS8wa0dOa0JiMWhPdEtXZFJ3OTVMV09ocVRRNW1NUW50?=
 =?utf-8?B?R3BsVVJLRXhEK1BqeDFpRWNEWC9GZ0ozNU1zSXNXZWR4YUxYOGV0Z01WY3dn?=
 =?utf-8?B?WXZWUmxRWHNIWTFhdzlpdDAzOGJKc2s4L0wzVm9pUWRRV0VWTVA2Ny9OZDlq?=
 =?utf-8?B?WG1qQVRMbjFzOWlnMjRVK1o3VGVMUG5CbCtiUkE2Qm4yWVpkNU91NGtoWVJt?=
 =?utf-8?B?aVpnYmtLbE9ReHFFZlpOYnViOVpBYzhBTS9EMWRURjNCZzJBN0VDYTlzV00w?=
 =?utf-8?B?ejd2ampnQldGaUN5elY2NGNJb3BLWDJiaFBwbGpXRFlydGhFWWRGWlp1ZnRH?=
 =?utf-8?B?SUtERXlBb0VtdHhJRTZlNVBaWWZIYXo3a0VqcndXdmV0RUVnQnk3SGV3bC9K?=
 =?utf-8?B?T3ZVRUc1ZGhuakhqS1hvcjhLdE00eWQzTnEzUENUNEtua2I1SWs5L2pjL29T?=
 =?utf-8?B?bmd3NUpSTUZPd2FUU2MwdU5McVNPL2haTGhibnRuRldaVklENEZRZ1NLbEI4?=
 =?utf-8?B?REhtTjR2WmVnMWdSYzZleUhUMXhPaW9YKzdQM1pvcldOYmx4cDhLdWQxRHlO?=
 =?utf-8?B?UnZ6dng4SWo0ZE9VeU9qNjFyTTZCM0NZUDNtYVlDOXFYc1prS3FCMkMvU3VU?=
 =?utf-8?B?K2NVVDcyTWdsdDRKd3lDajN4NGJ2LzlrZU9vKzhFTVY4Z2had0V0TE50RUtu?=
 =?utf-8?B?YTNJNHljdlpuTmFzOTd3SDNGcTluakdEdFF5ZGVQMjh6TW5WVEp6Tm4vTnAw?=
 =?utf-8?B?NjdKUEdsRW4rWndkNmVyYUtUbUpPZGsxV1FVZDREbHdKcDROcHZJMHdQWGRY?=
 =?utf-8?B?SU9KUEEwVlBrYnVPTlpDbzhPb1BjM1pOanh5Yk1KMXhZM1lHTEZnRDV0dFNo?=
 =?utf-8?B?cVBZenkydFozS1I1RU1PZ1lFTHlrNForSi9MZ2JyUjd2TTB4a054NWlQYTFO?=
 =?utf-8?B?WlVkWWNkZ2l5TDNGcmN6ckRsNmx2Y0tOU1NtSWI3dXlDeUVYZTJIbHdEMGxR?=
 =?utf-8?Q?F0s1q8XzigAeojAZEbjvdniAd6AaqI=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e0d613-46ab-4856-4c59-08decfafa209
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB5662.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2026 16:10:37.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR02MB9910
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/20/26 2:58 PM, Chao Yu via Linux-f2fs-devel wrote: >
 On 6/19/26 22:45, Yongpeng Yang wrote: >> On 6/15/26 8:05 PM, Chao Yu via
 Linux-f2fs-devel wrote: >>> On 6/12/26 19:58, Yongpeng Yang wrote: > [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)outlook.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.103.43.87 listed in wl.mailspike.net]
X-Headers-End: 1wbKl1-0007Mk-JQ
Subject: Re: [f2fs-dev] [PATCH RESEND 4/5] f2fs: add extent_access_mode to
 track extent cache access patterns
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.09 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[outlook.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,outlook.com];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,outlook.com:s=selector1];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpeng.storage@outlook.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[outlook.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,outlook.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 39E266AB3F0

T24gNi8yMC8yNiAyOjU4IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IE9uIDYvMTkvMjYgMjI6NDUsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IE9uIDYvMTUvMjYgODow
NSBQTSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+IE9uIDYvMTIvMjYg
MTk6NTgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4gRnJvbTogWW9uZ3BlbmcgWWFuZyA8eWFu
Z3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4KPj4+PiBJbnRyb2R1Y2UgZW51bSBleHRlbnRfYWNj
ZXNzX21vZGUgdG8gY2xhc3NpZnkgaG93IGVhY2ggZXh0ZW50IG5vZGUKPj4+PiBpcyBhY2Nlc3Nl
ZCBvciBjcmVhdGVkIChSRUFELCBXUklURSwgUFJFQ0FDSEUsIFRSVU5DQVRFLCBMQVJHRVNUKS4K
Pj4+PiBUaGlzIG1ldGFkYXRhIG9wdGltaXplIExSVSBldmljdGlvbiBkZWNpc2lvbnM6Cj4+Pgo+
Pj4gQ2FuIHlvdSBwbGVhc2UgZ2l2ZSBzb21lIG51bWJlcnMgZm9yIHRoaXMgY2hhbmdlPwo+Pgo+
PiBUaGlzIGlzIGEgcXVhbGl0YXRpdmUgYW5hbHlzaXMuIFRoaXMgcGF0Y2ggYWltcyB0byBwcmlv
cml0aXplIHNocmlua2luZwo+PiBleHRlbnRzIHRoYXQgYXJlIG5vdCByZWFkLWhpdCBhbmQgdGhl
IGxhcmdlc3QgZXh0ZW50Lgo+IAo+IEkgdGhpbmsgaXQgbmVlZHMgdG8gZ2l2ZSBzb21lIG51bWJl
cnMgdG8gc2hvdyBiZW5lZml0cy4KCk9LLCBJJ2xsIHRyeSB0byBwcm9maWxlIGFuZCBzaG93IHRo
ZSBiZW5lZml0cy4KClRoYW5rcwpZb25ncGVuZywKCj4gCj4+Cj4+Cj4+Pgo+Pj4+Cj4+Pj4gMS4g
RXh0ZW50cyBvbmx5IGFjY2Vzc2VkIGFzIHRoZSBsYXJnZXN0IGV4dGVudCAobmV2ZXIgcmVhZC1o
aXQpIGFyZQo+Pj4+IGRlcHJpb3JpdGl6ZWQgaW4gdGhlIExSVSBsaXN0IHNpbmNlIHJlYWRzIGNh
biBzdGlsbCB1c2UgdGhlIGxhcmdlc3QKPj4+PiBleHRlbnQgZGlyZWN0bHkuCj4+Pj4KPj4+PiAy
LiBTcGFyc2Ugc2luZ2xlLWJsb2NrIHdyaXRlIGV4dGVudHMgdGhhdCB3ZXJlIG5ldmVyIG1lcmdl
ZCBhcmUgbW92ZWQKPj4+PiB0byB0aGUgaGVhZCBvZiBMUlUgZm9yIGVhcmxpZXIgcmVjbGFpbSwg
cHJlc2VydmluZyBleHRlbnRzIHdpdGgKPj4+PiBiZXR0ZXIgY29udGludWl0eSBhbmQgaGlnaGVy
IHJlYWQtaGl0IHByb2JhYmlsaXR5Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3Blbmcg
WWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZnMvZjJmcy9k
YXRhLmPCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0KPj4+PiDCoCBmcy9mMmZzL2V4dGVudF9j
YWNoZS5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPj4+PiDCoCBmcy9mMmZz
L2YyZnMuaMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKysrKysrKysrKysrLQo+Pj4+IMKgIGZzL2Yy
ZnMvZmlsZS5jwqDCoMKgwqDCoMKgwqDCoCB8wqAgNiArKysrLS0KPj4+PiDCoCA0IGZpbGVzIGNo
YW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+Pj4+IGluZGV4IDljNjQ0MGE3
ZGIwZS4uMmQzODEzNTAwNWZlIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4g
KysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+PiBAQCAtMTg3Myw3ICsxODczLDcgQEAgaW50IGYyZnNf
bWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCAKPj4+PiBzdHJ1Y3QgZjJmc19tYXBfYmxv
Y2tzICptYXAsIGludCBmbGFnKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNf
dXBkYXRlX3JlYWRfZXh0ZW50X2NhY2hlX3JhbmdlKCZkbiwKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0YXJ0X3Bnb2ZzLCBtYXAtPm1fcGJsayArIG9mcywKPj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+bV9sZW4gLSBvZnMpOwo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tX2xlbiAtIG9mcywgRVhfQUNDRVNT
X1BSRUNBQ0hFKTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4+IMKgwqDCoMKgwqAgfQo+
Pj4+IEBAIC0xOTE5LDcgKzE5MTksNyBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9k
ZSAqaW5vZGUsIAo+Pj4+IHN0cnVjdCBmMmZzX21hcF9ibG9ja3MgKm1hcCwgaW50IGZsYWcpCj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKG1hcC0+bV9sZW4gPiBvZnMpCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVu
dF9jYWNoZV9yYW5nZSgmZG4sCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0YXJ0X3Bnb2ZzLCBtYXAtPm1fcGJsayArIG9mcywKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tX2xlbiAtIG9mcyk7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1hcC0+bV9sZW4gLSBvZnMsIEVY
X0FDQ0VTU19QUkVDQUNIRSk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKG1hcC0+bV9uZXh0X2V4dGVudCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqbWFwLT5tX25leHRfZXh0ZW50ID0gaXNfaG9sZSA/IHBnb2ZzICsgMSA6IHBn
b2ZzOwo+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2V4dGVudF9jYWNoZS5jIGIvZnMvZjJmcy9l
eHRlbnRfY2FjaGUuYwo+Pj4+IGluZGV4IDgyZDg0YzRlOThiMi4uZTE0MWZmYjY0ZTVmIDEwMDY0
NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+PiArKysgYi9mcy9mMmZzL2V4
dGVudF9jYWNoZS5jCj4+Pj4gQEAgLTE0Miw2ICsxNDIsNyBAQCBzdGF0aWMgdm9pZCBfX3RyeV91
cGRhdGVfbGFyZ2VzdF9leHRlbnQoc3RydWN0IAo+Pj4+IGV4dGVudF90cmVlICpldCwKPj4+PiDC
oMKgwqDCoMKgIGlmIChlbi0+ZWkubGVuIDw9IGV0LT5sYXJnZXN0LmxlbikKPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+ICvCoMKgwqAgZW4tPmVpLmxhc3RfYWNjZXNzX21vZGUg
PSBFWF9BQ0NFU1NfTEFSR0VTVDsKPj4+PiDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0ID0gZW4tPmVp
Owo+Pj4+IMKgwqDCoMKgwqAgZXQtPmxhcmdlc3RfdXBkYXRlZCA9IHRydWU7Cj4+Pj4gwqAgfQo+
Pj4+IEBAIC01MTgsNiArNTE5LDcgQEAgc3RhdGljIGJvb2wgX19sb29rdXBfZXh0ZW50X3RyZWUo
c3RydWN0IGlub2RlIAo+Pj4+ICppbm9kZSwgcGdvZmZfdCBwZ29mcywKPj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgc3RhdF9pbmNfcmJ0cmVlX25vZGVfaGl0KHNiaSwgdHlwZSk7Cj4+Pj4gwqDCoMKg
wqDCoCAqZWkgPSBlbi0+ZWk7Cj4+Pj4gK8KgwqDCoCBlbi0+ZWkubGFzdF9hY2Nlc3NfbW9kZSA9
IEVYX0FDQ0VTU19SRUFEOwo+Pj4+IMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZldGktPmV4dGVudF9s
b2NrKTsKPj4+PiDCoMKgwqDCoMKgIGlmICghbGlzdF9lbXB0eSgmZW4tPmxpc3QpKSB7Cj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgIGxpc3RfbW92ZV90YWlsKCZlbi0+bGlzdCwgJmV0aS0+ZXh0ZW50
X2xpc3QpOwo+Pj4+IEBAIC02MjQsNiArNjI2LDIxIEBAIHN0YXRpYyBzdHJ1Y3QgZXh0ZW50X25v
ZGUgCj4+Pj4gKl9faW5zZXJ0X2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
Pj4+PiDCoMKgwqDCoMKgIC8qIHVwZGF0ZSBpbiBnbG9iYWwgZXh0ZW50IGxpc3QgKi8KPj4+PiDC
oMKgwqDCoMKgIHNwaW5fbG9jaygmZXRpLT5leHRlbnRfbG9jayk7Cj4+Pj4gK8KgwqDCoCAvKgo+
Pj4+ICvCoMKgwqDCoCAqIDEuIEZvciB0aGUgbGFyZ2VzdCBleHRlbnQsIGlmIHN1YnNlcXVlbnQg
d3JpdGVzIGFyZSBub3QgCj4+Pj4gbWVyZ2VkIGludG8KPj4+PiArwqDCoMKgwqAgKiBpdCwgdGhl
IHdyaXRlIHBhdGggd2lsbCBtb3N0IGxpa2VseSBub3QgdXNlIHRoZSBsYXJnZXN0IAo+Pj4+IGV4
dGVudF9ub2RlLAo+Pj4+ICvCoMKgwqDCoCAqIHdoaWxlIHJlYWQgcmVxdWVzdHMgY2FuIHN0aWxs
IGFjY2VzcyB0aGUgbWFwcGluZyB0aHJvdWdoIHRoZSAKPj4+PiBsYXJnZXN0Cj4+Pj4gK8KgwqDC
oMKgICogZXh0ZW50Lgo+Pj4+ICvCoMKgwqDCoCAqCj4+Pj4gK8KgwqDCoMKgICogMi4gRm9yIHNw
YXJzZSB3cml0ZXMsIGlmIHRoZSBleHRlbnQgbGVuZ3RoIGlzIDEgYW5kIG5vIAo+Pj4+IGV4dGVu
dCBtZXJnaW5nCj4+Pj4gK8KgwqDCoMKgICogb2NjdXJzLCB0aGlzIGV4dGVudCBzaG91bGQgYmUg
cmVjbGFpbWVkIHdpdGggaGlnaGVyIHByaW9yaXR5IAo+Pj4+IHRvIGF2b2lkCj4+Pj4gK8KgwqDC
oMKgICogZXZpY3RpbmcgZXh0ZW50cyB3aXRoIGJldHRlciBjb250aW51aXR5IGFuZCBoaWdoZXIg
cmVhZC1oaXQuCj4+Pj4gK8KgwqDCoMKgICovCj4+Pj4gK8KgwqDCoCBpZiAoZXQtPnR5cGUgPT0g
RVhfUkVBRCAmJiBldC0+Y2FjaGVkX2VuICYmCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIChldC0+Y2Fj
aGVkX2VuLT5laS5sYXN0X2FjY2Vzc19tb2RlID09IEVYX0FDQ0VTU19MQVJHRVNUIHx8Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqAgKGV0LT5jYWNoZWRfZW4tPmVpLmxlbiA9PSAxICYmCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoCBldC0+Y2FjaGVkX2VuLT5laS5sYXN0X2FjY2Vzc19tb2RlID09IEVY
X0FDQ0VTU19XUklURSkpKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBsaXN0X21vdmUoJmV0LT5jYWNo
ZWRfZW4tPmxpc3QsICZldGktPmV4dGVudF9saXN0KTsKPj4+PiDCoMKgwqDCoMKgIGxpc3RfYWRk
X3RhaWwoJmVuLT5saXN0LCAmZXRpLT5leHRlbnRfbGlzdCk7Cj4+Pj4gwqDCoMKgwqDCoCBldC0+
Y2FjaGVkX2VuID0gZW47Cj4+Pj4gwqDCoMKgwqDCoCBzcGluX3VubG9jaygmZXRpLT5leHRlbnRf
bG9jayk7Cj4+Pj4gQEAgLTc0Nyw2ICs3NjQsOCBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRl
bnRfdHJlZV9yYW5nZShzdHJ1Y3QgCj4+Pj4gaW5vZGUgKmlub2RlLAo+Pj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoZm9mcyA+IGRlaS5mb2ZzICYmICh0eXBlICE9IEVYX1JFQUQgfHwKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvZnMgLSBkZWkuZm9mcyA+PSBGMkZT
X01JTl9FWFRFTlRfTEVOKSkgewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVuLT5l
aS5sZW4gPSBmb2ZzIC0gZW4tPmVpLmZvZnM7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKHR5cGUgPT0gRVhfUkVBRCkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGVuLT5laS5sYXN0X2FjY2Vzc19tb2RlID0gRVhfQUNDRVNTX1RSVU5DQVRFOwo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByZXZfZW4gPSBlbjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwYXJ0cyA9IDE7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+PiBAQCAt
NzYxLDYgKzc4MCw4IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0
cnVjdCAKPj4+PiBpbm9kZSAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVuZCAtIGRlaS5mb2ZzICsgZGVpLmJsaywgZmFsc2UsCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5hZ2UsIGRlaS5sYXN0
X2Jsb2NrcywKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
dHlwZSk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodHlwZSA9PSBF
WF9SRUFEKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlaS5s
YXN0X2FjY2Vzc19tb2RlID0gRVhfQUNDRVNTX1RSVU5DQVRFOwo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZW4xID0gX19pbnNlcnRfZXh0ZW50X3RyZWUoc2JpLCBldCwg
JmVpLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgTlVMTCwgTlVMTCwgdHJ1ZSk7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBuZXh0X2VuID0gZW4xOwo+Pj4+IEBAIC03NzAsNiArNzkxLDggQEAgc3Rh
dGljIHZvaWQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2Uoc3RydWN0IAo+Pj4+IGlub2RlICpp
bm9kZSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW4t
PmVpLmJsayArIChlbmQgLSBkZWkuZm9mcyksIHRydWUsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5hZ2UsIGRlaS5sYXN0X2Jsb2NrcywKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdHlwZSk7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAodHlwZSA9PSBFWF9SRUFEKQo+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlbi0+ZWkubGFzdF9hY2Nlc3Nf
bW9kZSA9IEVYX0FDQ0VTU19UUlVOQ0FURTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG5leHRfZW4gPSBlbjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFydHMrKzsKPj4+PiBAQCAtODA4LDYg
KzgzMSw3IEBAIHN0YXRpYyB2b2lkIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKHN0cnVjdCAK
Pj4+PiBpbm9kZSAqaW5vZGUsCj4+Pj4gwqDCoMKgwqDCoCBpZiAodGVpLT5ibGspIHsKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgX19zZXRfZXh0ZW50X2luZm8oJmVpLCBmb2ZzLCBsZW4sIHRlaS0+
YmxrLCBmYWxzZSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAw
LCAwLCBFWF9SRUFEKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZWkubGFzdF9hY2Nlc3NfbW9kZSA9
IHRlaS0+bGFzdF9hY2Nlc3NfbW9kZTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFfX3Ry
eV9tZXJnZV9leHRlbnRfbm9kZShzYmksIGV0LCAmZWksIHByZXZfZW4sIG5leHRfZW4pKQo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9faW5zZXJ0X2V4dGVudF90cmVlKHNiaSwgZXQs
ICZlaSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5z
ZXJ0X3AsIGluc2VydF9wYXJlbnQsIGxlZnRtb3N0KTsKPj4+PiBAQCAtOTc4LDYgKzEwMDIsNyBA
QCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRlbnRfY2FjaGUoc3RydWN0IAo+Pj4+IGRub2RlX29m
X2RhdGEgKmRuLCBlbnVtIGV4dGVudF90eXBlIHR5cAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGVpLmJsayA9IE5VTExfQUREUjsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVpLmJsayA9IGRuLT5kYXRhX2Jsa2FkZHI7
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGVpLmxhc3RfYWNjZXNzX21vZGUgPSBFWF9BQ0NFU1NfV1JJ
VEU7Cj4+Pj4gwqDCoMKgwqDCoCB9IGVsc2UgaWYgKHR5cGUgPT0gRVhfQkxPQ0tfQUdFKSB7Cj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChfX2dldF9uZXdfYmxvY2tfYWdlKGRuLT5pbm9kZSwg
JmVpLCBkbi0+ZGF0YV9ibGthZGRyKSkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47Cj4+Pj4gQEAgLTEwOTEsMTIgKzExMTYsMTQgQEAgdm9pZCBmMmZzX3VwZGF0ZV9yZWFk
X2V4dGVudF9jYWNoZShzdHJ1Y3QgCj4+Pj4gZG5vZGVfb2ZfZGF0YSAqZG4pCj4+Pj4gwqAgfQo+
Pj4+IMKgIHZvaWQgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2Uoc3RydWN0IGRu
b2RlX29mX2RhdGEgKmRuLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGdv
ZmZfdCBmb2ZzLCBibG9ja190IGJsa2FkZHIsIHVuc2lnbmVkIGludCBsZW4pCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwZ29mZl90IGZvZnMsIGJsb2NrX3QgYmxrYWRkciwg
dW5zaWduZWQgaW50IGxlbiwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVu
dW0gZXh0ZW50X2FjY2Vzc19tb2RlIGFjY2Vzc19tb2RlKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDC
oMKgIHN0cnVjdCBleHRlbnRfaW5mbyBlaSA9IHsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLmZv
ZnMgPSBmb2ZzLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAubGVuID0gbGVuLAo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAuYmxrID0gYmxrYWRkciwKPj4+PiArwqDCoMKgwqDCoMKgwqAgLmxhc3Rf
YWNjZXNzX21vZGUgPSBhY2Nlc3NfbW9kZSwKPj4+PiDCoMKgwqDCoMKgIH07Cj4+Pj4gwqDCoMKg
wqDCoCBpZiAoIV9fbWF5X2V4dGVudF90cmVlKGRuLT5pbm9kZSwgRVhfUkVBRCkpCj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBpbmRleCBmZmZi
NTE2Yjc4ZjQuLjE1ODhiNjRkMDRhMyAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+
Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gQEAgLTc2Myw2ICs3NjMsMTUgQEAgZW51bSBl
eHRlbnRfdHlwZSB7Cj4+Pj4gwqDCoMKgwqDCoCBOUl9FWFRFTlRfQ0FDSEVTLAo+Pj4+IMKgIH07
Cj4+Pj4gKy8qIGV4dGVudCBhY2NlcyBtb2RlIGZvciBjYWNoZSBoaXQgb3IgZXh0ZW50IGFkZCAq
Lwo+Pj4+ICtlbnVtIGV4dGVudF9hY2Nlc3NfbW9kZSB7Cj4+Pj4gK8KgwqDCoCBFWF9BQ0NFU1Nf
UkVBRCwKPj4+PiArwqDCoMKgIEVYX0FDQ0VTU19XUklURSwKPj4+PiArwqDCoMKgIEVYX0FDQ0VT
U19QUkVDQUNIRSwKPj4+PiArwqDCoMKgIEVYX0FDQ0VTU19UUlVOQ0FURSwKPj4+PiArwqDCoMKg
IEVYX0FDQ0VTU19MQVJHRVNULAo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiDCoCAvKgo+Pj4+IMKgwqAg
KiBSZXNlcnZlZCB2YWx1ZSB0byBtYXJrIGludmFsaWQgYWdlIGV4dGVudHMsIGhlbmNlIHZhbGlk
IGJsb2NrIAo+Pj4+IHJhbmdlCj4+Pj4gwqDCoCAqIGZyb20gMCB0byBVTExPTkdfTUFYLTEKPj4+
PiBAQCAtNzgxLDYgKzc5MCw4IEBAIHN0cnVjdCBleHRlbnRfaW5mbyB7Cj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLyogcGh5c2ljYWwgZXh0ZW50IGxlbmd0aCBvZiBjb21wcmVzc2Vk
IGJsb2NrcyAqLwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBj
X2xlbjsKPj4+PiDCoCAjZW5kaWYKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiByZWNv
cmQgbGFzdCBhY2Nlc3MgbW9kZSAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVudW0g
ZXh0ZW50X2FjY2Vzc19tb2RlIGxhc3RfYWNjZXNzX21vZGU7Cj4+Pgo+Pj4gQXMgd2Uga25vdywg
bWVtb3J5IGlzIGV4cGVuc2l2ZSwgOlAsIEknZCBsaWtlIHRvIGtub3cgaWYgd2UgY2FuIAo+Pj4g
ZW5hYmxlIHRoaXMKPj4+IG9wdGlvbmFsbHkgaWYgdGhlcmUgaXMgYmVuZWZpdHMuCj4+Cj4+IGV4
dGVudF9hY2Nlc3NfbW9kZSBjb25zdW1lcyBvbmx5IHBhZGRpbmcgaG9sZXMgd2l0aGluIHRoZSB1
bmlvbiBhbmQKPj4gYnJpbmdzIG5vIGFkZGl0aW9uYWwgbWVtb3J5IG92ZXJoZWFkLiBUaGUgdW5p
b24gaXMgc2l6ZWQgdG8gMTYgYnl0ZXMgaW4KPj4gdG90YWwsIHdoZXJlYXMgYmxrLCBjX2xlbiBh
bmQgZXh0ZW50X2FjY2Vzc19tb2RlIHRvZ2V0aGVyIHRha2UgdXAganVzdAo+PiAxMiBieXRlcy4K
PiAKPiBXZWxsLCBzZWVtcyBmaW5lIG5vdywgYnV0IEkganVzdCBub3RpY2UgYmxvY2sgYWdlIGV4
dGVudCBjb3N0cyBtb3JlIHNwYWNlCj4gdGhhbiByZWFkIGV4dGVudC4KPiAKPiBUaGFua3MsCj4g
Cj4+Cj4+IFRoYW5rcwo+PiBZb25ncGVuZywKPj4KPj4KPj4+Cj4+PiBUaGFua3MsCj4+Pgo+Pj4K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgfTsKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgLyogYmxv
Y2sgYWdlIGV4dGVudF9jYWNoZSAqLwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+
Pj4+IEBAIC00NTc3LDcgKzQ1ODgsOCBAQCBib29sIAo+Pj4+IGYyZnNfbG9va3VwX3JlYWRfZXh0
ZW50X2NhY2hlX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHBnb2ZmX3QgaW5kZXgsCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxvY2tfdCAqYmxrYWRkcik7Cj4+Pj4gwqAgdm9p
ZCBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNoZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4p
Owo+Pj4+IMKgIHZvaWQgZjJmc191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2Uoc3RydWN0
IGRub2RlX29mX2RhdGEgKmRuLAo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBnb2ZmX3Qg
Zm9mcywgYmxvY2tfdCBibGthZGRyLCB1bnNpZ25lZCBpbnQgbGVuKTsKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBnb2ZmX3QgZm9mcywgYmxvY2tfdCBibGthZGRyLCB1bnNp
Z25lZCBpbnQgbGVuLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bSBl
eHRlbnRfYWNjZXNzX21vZGUgYWNjZXNzX21vZGUpOwo+Pj4+IMKgIHVuc2lnbmVkIGludCBmMmZz
X3Nocmlua19yZWFkX2V4dGVudF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgbnJfc2hyaW5rKTsKPj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+IGluZGV4IDYzM2U5YWRlNjU0
Zi4uYTNhNWQ0OTllYWRmIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gKysr
IGIvZnMvZjJmcy9maWxlLmMKPj4+PiBAQCAtNzMzLDcgKzczMyw4IEBAIHZvaWQgZjJmc190cnVu
Y2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgCj4+Pj4gZG5vZGVfb2ZfZGF0YSAqZG4sIGlu
dCBjb3VudCkKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBmb2ZzID0gZjJmc19zdGFydF9iaWR4X29mX25vZGUob2ZzX29mX25vZGUoZG4tPm5vZGVf
Zm9saW8pLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZG4tPmlub2RlKSArIG9mczsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgZjJm
c191cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2UoZG4sIGZvZnMsIDAsIGxlbik7Cj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIGYyZnNfdXBkYXRlX3JlYWRfZXh0ZW50X2NhY2hlX3JhbmdlKGRuLCBm
b2ZzLCAwLCBsZW4sCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBFWF9BQ0NFU1NfVFJVTkNBVEUpOwo+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBmMmZzX3VwZGF0ZV9hZ2VfZXh0ZW50X2NhY2hlX3JhbmdlKGRuLCBmb2ZzLCBsZW4pOwo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkZWNfdmFsaWRfYmxvY2tfY291bnQoc2JpLCBkbi0+aW5v
ZGUsIG5yX2ZyZWUpOwo+Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IEBAIC0xNjcyLDcgKzE2NzMsOCBA
QCBzdGF0aWMgaW50IGYyZnNfZG9femVyb19yYW5nZShzdHJ1Y3QgCj4+Pj4gZG5vZGVfb2ZfZGF0
YSAqZG4sIHBnb2ZmX3Qgc3RhcnQsCj4+Pj4gwqDCoMKgwqDCoCBpZiAoaW5kZXggPiBzdGFydCkg
ewo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwZGF0ZV9yZWFkX2V4dGVudF9jYWNoZV9y
YW5nZShkbiwgc3RhcnQsIDAsCj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmRleCAtIHN0YXJ0KTsKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGluZGV4IC0gc3RhcnQs
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBFWF9BQ0NFU1NfVFJVTkNBVEUpOwo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3Vw
ZGF0ZV9hZ2VfZXh0ZW50X2NhY2hlX3JhbmdlKGRuLCBzdGFydCwgaW5kZXggLSBzdGFydCk7Cj4+
Pj4gwqDCoMKgwqDCoCB9Cj4+Pgo+Pj4KPj4+Cj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+PiBodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4+Cj4g
Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
