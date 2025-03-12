Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 841ADA5D4C3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 04:34:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsCrV-0005mf-4G;
	Wed, 12 Mar 2025 03:34:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tsCrR-0005mS-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:34:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5V3wjgs4pbhNsItnfcIY/hbCzaw+neUF16DZKgXCw2g=; b=C2ZekdKmh5XUGIra2PfvcNyMSx
 aXJuZHC7SZC7XpNXDw7YtfPXbyrMjKEh9SnxeC+oDC583OBtjOeIRVtA2lfjKIP/Fh9Lk1kSkENzM
 Ul6DONfpuok/kfyGQAbJ5V6bzGZ/5sSNZfREiVQzVJ1q9ssxqyI5JOFBENfZNtHMoTyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5V3wjgs4pbhNsItnfcIY/hbCzaw+neUF16DZKgXCw2g=; b=cL/CBLrHwyJ/3Ocs5PUEt7KkNv
 wmSn/d6bxBBRjoZ/IpcDFbNAecVqi7t2mlJHIlsruORSVb/SsJIomiFP1oF5kfqd2dEHV75N4tTZL
 CUnaTxlqxxRhwoxO0W9l4meOEwAINSZ1ykspqrltfVcQZHtIgJGTiSqatCc88MysbUoc=;
Received: from mail-koreacentralazon11013016.outbound.protection.outlook.com
 ([40.107.44.16] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsCrL-00087s-S4 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 03:34:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f94Mn+aQVUTRkqDpfoKFgkh31ARCJPt4sOamvxfEwdYAEhf0MWWJTUyLeJFlW2zczr0Fj7mS66yXh/k74qaLvB8IceYQL4AyMopUTjxWk88n7Wymkv2FPpwwZ5Eq3ygvUlpycr2u20dN63MtiO2yb6ptV9FKOJvzK/DpLhWVsQL3JPO88OSBaSOfXGcffOzPGOEHtff5LNYPYRzriBzmpJ2HFdQ7yjUNB/lp1dryNxLDutePzWYiUHK1atlmHfEeKU2vsct/k0G3Xc5TaWmxo0RbTxKHJrkJTO0Qp5IsABms13Jrl3jgXCYH3E1IWEiSSfVRoEQ4BVa+NfMkhHGw1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V3wjgs4pbhNsItnfcIY/hbCzaw+neUF16DZKgXCw2g=;
 b=P581rshXid8nAM8F0fbUf6redXqXepUj5XLyL4+Zp36lu3dYxp6xlii9riM100HUOWuP32YW+uKD2TKf4MRq3fiEIZ8EhkxlHHiL9r/zAO9fHZfILUGppDvLrTA0LJMlakwqVA1DzVTPOMXFJS4V7aYuj/ou0JiutjN7iDTHQzKXnGUfMlQt5YI8tOLAvL+UMRonreihkM1AYoCE0ZW3Oe3foOt/4tWttu65TCMj0/oDShF+lSWjdozaRTbVQR/PE01gNVVIxpSDVZ0TGXpcA+wkJhdYVyTWCQ3Gkh17XnotQ7+p56lbLHVTHDAV1PWLDkNNjZWqZ6lC9E0lYn2Rjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V3wjgs4pbhNsItnfcIY/hbCzaw+neUF16DZKgXCw2g=;
 b=aK4MJwAnj6YiVxRc9/JrTxNTEhrtpcujufzyB9X1QwPsYaCSxvnuf720UYzeZpYe9TrH4/azLKkmTGIY+Ko0OJ8aKILFkYLKWdtuupA1MX9RGDmDJAVv023uCw2H0CG72mIFNbBAn5mx9rUqRJ9JLckRNlHLXGGBQGsyKhdNKfPhxU34rM0ac/g5VnQ7/5hgoNMV+AAdBzIZF89Qp2lqXhtjtZOz7+hAsuyBRoR2BY/y9Sv+BOPulsRHj7yGGYVJxZD4EHi8lgnvGQuUBAAz6oJUAL565k3vLN0ndFVuac5VLTrMkNXf0/wp8AqyPx294oTVxDjdOczIxvP7MVX/xg==
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by JH0PR06MB7032.apcprd06.prod.outlook.com (2603:1096:990:70::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 03:19:26 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 03:19:25 +0000
To: Chao Yu <chao@kernel.org>, Chunhai Guo <guochunhai@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
Thread-Topic: [PATCH v2] f2fs: fix missing discard candidates in fstrim
Thread-Index: AQHbanks1Og+9RgwPkqktZiDK9WrP7MfjMYAgE+ZZIA=
Date: Wed, 12 Mar 2025 03:19:25 +0000
Message-ID: <74811428-9fee-467b-802f-dcb9f9dbb5a5@vivo.com>
References: <20250119140834.1061145-1-guochunhai@vivo.com>
 <77fa4633-f7db-4daa-a9e1-3fdb5bf9dd1d@kernel.org>
In-Reply-To: <77fa4633-f7db-4daa-a9e1-3fdb5bf9dd1d@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB7096:EE_|JH0PR06MB7032:EE_
x-ms-office365-filtering-correlation-id: 9c11098e-8d34-4c30-784c-08dd6114b13f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1Nablg5TmdxdlhvVXZLc3hJVEc2TElpRXFBNUNTOTI0ZnZZd1JSaFEzU0pE?=
 =?utf-8?B?azZMQkZwYmthRVdrU2pCc2RCMmJZSnFGSVh0ODRjVWVTZ2VGYkZ5dm9hcFZH?=
 =?utf-8?B?a0RoVXlKOWtBYndDbVFaSEM4WWxDclRodGxBQ0h0cExhMjF4cnVUalUzelF2?=
 =?utf-8?B?N21ocWNnczFNUEhwSDJQOW5DTmVVYWhoOEw2MVF3U3MrUElLbCsyakFtdHJX?=
 =?utf-8?B?ZVlGV0hReU44YUZoS09BdWJjUHBzY2lDZ1lZQ1h6OUQ2ZS9iSHpWM2VTSmhk?=
 =?utf-8?B?R2MvMXUzQmlub09MZW45bFZsaWJMNjQvSWlGWG1DZExBTTJVQkZCTUcwbGgr?=
 =?utf-8?B?NkZkNklXQ2xoWXdFb2VWTmdJNEg2MHllTk92clFFSGo2YkxmdjcxTU9LU0Y4?=
 =?utf-8?B?Z1cyTzJvNGhzNW00Zko1K2VTRzZROTlqaTFYZWczNFphTENTeW9BaVFXZ1Ur?=
 =?utf-8?B?NEtkWWVKTzNGU0pwRDhJcUU3QWh3NUNIanMxNDBzMzY1T29wRkgwS3lQdERq?=
 =?utf-8?B?ZDNrb25HWHFzeEswVnF4a2YxV0h1YTJkc2crZnFhNnBtOUl6V1hUQjlUWGs3?=
 =?utf-8?B?MEtaNXkzbGQyQUNaNDhWME12ZkNvTXdPVzBYN3c2dnBLYVpWNG5mRURTL0ZF?=
 =?utf-8?B?eWNMSExKNFJPdzhXR2pZRVBCY1FPY1JEK1JxNnlUTk1GRkZpRjJldEVjeWVu?=
 =?utf-8?B?T3A2VFBwSVpaOGlIdThrZnd6ZlB2R1N2OXp4eUR0S0l5SUtRc2IrcDE3UFc0?=
 =?utf-8?B?eG9uaUNHVmozYzVzWFVHZmhINVVGWC9RdTYyS1gvTmx1Z1dyQW5SaElUZms4?=
 =?utf-8?B?dWREVDdhWnRNTGdMYWFaUXArZjFqZVVXWmVuMnkrbnExdzEzY2ZoUTdaTkhk?=
 =?utf-8?B?MU5DS3hKTHlUNmVNT2xpYlpIcDdxWkZoWWV0WU5GM3J4RzlNbFBsNXdNSU4v?=
 =?utf-8?B?Zm4rV254am1UM3hHbk9qUzVBNE8rU0hMRldjRWhVN0NFd2ZsL0ttWnZjS2h3?=
 =?utf-8?B?OHd2OGRJVmpvVHd5K3p4QUdIRGdVL0tmd2NkNEZQbm1FN1RyVGdTd1hkanpE?=
 =?utf-8?B?TkdRRWx6b2lidXpzNWwzV2F5UTJOcS81Y0k1Yk9DajVvSnFhK1FzZTNsOXUy?=
 =?utf-8?B?WHJ4aGFtdkVQVjBQVXBFNTRZdDAyek9jMXRxU25ZSHFrSnE1Uk1LOTNUTytZ?=
 =?utf-8?B?cll5ajFXRTlZdnlGS2luY1hQdHY3R3lqaFBIdmQrSjZzYyt0MFhJWW5xVHph?=
 =?utf-8?B?eFRNRVI3RUhYYVFKblM0b2hPTmpyN1FaL1JseVAvTGRlYTVITjIzeE00SHBW?=
 =?utf-8?B?bGxBcGZlUWpNZG1kZ01aVmR3a0d6SXRXMXRCTTlyQmxIUmZmc2NScEZVRFBv?=
 =?utf-8?B?S3JtUndmQTIzUG5ITncvTXNHbks2WVBSVzVObDlId2huOC9FWlMrSVE3MlJQ?=
 =?utf-8?B?MFVMQWtPelZjUXNFcWlYNmdBVFpMSWhzaDROY1VlRzdsM3ZuczA4dUVIWjNC?=
 =?utf-8?B?cVdsUDU1S3N1eElFckhWdDAxc3k4VmREbktiV01BNVJqa0lrdW03dGJhcXZ4?=
 =?utf-8?B?Q1NKcGUzVE41aFBoQldCV1NJQ2NJbC9nNEU0TWxNM0NrbjB0WFRmYjdrd1Ax?=
 =?utf-8?B?eE4yYzNBVE9peHNXc1ZKVkJ5aFBaRzN5dThTaDkrWk5ENDU4VVY0cHpMb0RU?=
 =?utf-8?B?TnJMaGVsQVdGc01iZkJRQm9XL2VIblp1RnM1SDFTcGZlalFzSUIwZVU0dWZY?=
 =?utf-8?B?cmRBdGVZazErQzhJZFljem1obnk5Tkc0Tlo1L2p5U0p3c3UyMklhcGJrUzli?=
 =?utf-8?B?MU42Z2hJT3JYUTViMGxZN0JQZUZnb3E0bWdwaEg5NXpiRGJ4aGVBSWMyVUdv?=
 =?utf-8?B?UHRhbHloOURSNEFEa3UrMjJ5WEJlTGVDR0c4OFJUQkNGeUpOT2UxUm95VC8z?=
 =?utf-8?Q?waFkjP+5LYa7/IyTCvA9P+AiGKY1gSUx?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGRtbEJtNHAxbEpTZmZaN0k0ZmpaOFY0bUEwZEtWN0RMQW8rN2dnUlV1bksz?=
 =?utf-8?B?YUNqay95RzJhZzRpU2NhTlFXelVSTFZFTTRVeVVOZWNYYy9sTGdhVFE2YXMx?=
 =?utf-8?B?RExKa2NONFBzNUNNcldBQms4UStjODd1RUdkNnB4VGVZNjNsTWJZT1ZkS3l3?=
 =?utf-8?B?UG03Y0F6V29xQWY2SjQrUm5mL1E3WEF5Kyt2ZHYwOThyVjk1NmNlbnhTKzVi?=
 =?utf-8?B?enE5WTFVb0NKYlcwRGJQZTludXhFdnhmc2pDVWFXOFBQdkMxaHlmM2ZpZ0hv?=
 =?utf-8?B?RWh1TGo3RzROU2dRemxHaEhkc0lvTG9zMzkrZ2ZybTVyMEpid3VtMGU3Mllw?=
 =?utf-8?B?dVlKNGNmcEk3WEV4U0FMYWRBWmVESzdna1ZXWVZrZTdNazF3Z1Bsb1U0UVZ6?=
 =?utf-8?B?N1dsVXVGOEt1QjFEYlpoMW9MWndvUFlWUzVWak5HZWc2ZXFQQlNOdHdmbVR6?=
 =?utf-8?B?bk1IRFcxOHcvQjRVVGZCK3V5RmE5OW45dHkzUDdxMEJaMHZ0YkZ1WVcwSnVB?=
 =?utf-8?B?L0NxenZFeGVFTmxOclJvclgvUk4yUXRqNTlEU0NWbWV0Y0hHNGVid0t2SHRs?=
 =?utf-8?B?c0Fkb0hNR1RYTWpDTVh3b1IrQzlXTmdkOFp0SVVJeXM0VnJCRExmS3lqeHhE?=
 =?utf-8?B?QmJFMHVwWkxjOGRWdXNPaUVRWisxVnEvQVI1S0xpTUQ3UmIxODlZTm0yMFA0?=
 =?utf-8?B?UjRERVdlU1ptSGczY3JTRTBjYTNycVlTZkR5SjBWMW9VNjF1enBGdkxrd2Zv?=
 =?utf-8?B?aEkrUi9iZW1XSWZmS3ZmUGF6TnVLZVdqa1FsVjB6dHdPL1phRmtkbmZYMHJR?=
 =?utf-8?B?TGdnendQMERFbWhpa0tPTE9vZ2M2M2Ewc1BDbzRGSDR0RzdEdW1STHoyL3hh?=
 =?utf-8?B?cGhVWlE4bk8zREtva0tKWHZKeHA4ekhXUld4Tm9rNWk3YTgzcWZqZFl4Z1l3?=
 =?utf-8?B?QVFrTHNlQ2JsdDVOMFB0VnY5WGUwT3JjQ3dmZE9TaE1HajVGaHM2Mi9oVTVj?=
 =?utf-8?B?OURmZmlTQlNjcm9iQUk1dFJXdUJ0STkxRlRmaHRRUDBwSzc3ZUd1VkxpaWZj?=
 =?utf-8?B?MGowTlpiYk1XczNoL0JicUh1NkJENVJORTdqM1QyTzlBODk5a3llOU1XY2Vl?=
 =?utf-8?B?MkM2UDR1TVJqMHphT0xLbENnNFdsSjdmMjRCOHkzdnZBb0lWY2g3Ulc0ODhr?=
 =?utf-8?B?ZjBEeDBzZ0d3UXhtL1ltSkdBdmN4ckQvbURnNElUOVc0WVlkVUNRcXNZNG5r?=
 =?utf-8?B?Q25vY0NhdWU1TVRDRHM4a256K1FJelVUN2luNjZqejUxdHVwTFhkcW1UNlBE?=
 =?utf-8?B?Y0tRZUh0WVBkU09EMTNiRldUa2FmdTNQdjc4aWU2cUY2T2ZaYmhxaWRzaGtl?=
 =?utf-8?B?QzdZYXhaVFRoeXVKYVRYT1k4WnNmL0FlWUw1K1A5a3JoR25pam9mNGNKditS?=
 =?utf-8?B?dGVjTEpIVW9jMDhBQWN5bDZMaHlGTCszeUhCb0VZeUhtUyttTkZUNlFLNjBU?=
 =?utf-8?B?RitLd3ZOZGtjVXhHQUFYc1dDOEdBZlB4T3lKSThLVUVacjIrWWVPQVF5b2ht?=
 =?utf-8?B?UnVhOEZFQ2RzZ0lOM096bnlBcEJkbWo2bVo1aEJObDkvS00ySEV6L0JieUtH?=
 =?utf-8?B?Q2VENnF6Vjc1VkNBRGFvazVldXVQMlZZZ1psOEJocEpDRC9VaDY3VldqY0Nx?=
 =?utf-8?B?Q3pJNDRpOUVKMWVGb2M2Z2crRGxDcUhhUFJoZTV2ME9wb3Z3SEpkYjZPbk5x?=
 =?utf-8?B?QnBtVXI0MFE4NENjd1FpODhwaXFEU3RBeklPd2htNElSelRZOXpwWGFvNWJM?=
 =?utf-8?B?NmlDSDd4bUI1MFNEelpHL2VnS2RZQzJ1bExwaWR6d0pYaUo0d0xjNEd1Smp4?=
 =?utf-8?B?Y3pTN1ZFc0htSTZPdFRIQlNOZU9WYzRQVzF2UGRtcllTU3paT0hZaXV0SEtI?=
 =?utf-8?B?cENPWlBlbmdndGt6bXZWaC9mTHEzcGtIME9VUU1rbXR5ajU1K2swV3RtdVZq?=
 =?utf-8?B?YzAxeEo1WW1yekM0cXV3YU9OcjkwVGVxYU9seFAzSmVkcGlCaUZYbWc2NC80?=
 =?utf-8?B?eEtBRGVSTi9INlZIang4RVVtbC94cXlKOEJhSm1yZ0dLV05RSXR6YVVuNHZG?=
 =?utf-8?Q?Z/Jg=3D?=
Content-ID: <3F859DAD29E8584FB2210FC39AF5074C@apcprd06.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c11098e-8d34-4c30-784c-08dd6114b13f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2025 03:19:25.6910 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5X2uTFgvHaD+tRBzSg90gjSnrEceUdAMfOMF02Bgg4O7zqC+oPrVm/spTgc+98ws3LTxR2XosLnNW8lCE8VRZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7032
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  在 1/20/2025 7:45 PM, Chao Yu 写道: > On 1/19/25 22:08,
    Chunhai Guo wrote: >> fstrim may miss candidates that need to be discarded,
    as shown in the >> examples below. >> >> The root cause is that w [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                           [40.107.44.16 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [40.107.44.16 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [40.107.44.16 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tsCrL-00087s-S4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix missing discard candidates in
 fstrim
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

5ZyoIDEvMjAvMjAyNSA3OjQ1IFBNLCBDaGFvIFl1IOWGmemBkzoNCj4gT24gMS8xOS8yNSAyMjow
OCwgQ2h1bmhhaSBHdW8gd3JvdGU6DQo+PiBmc3RyaW0gbWF5IG1pc3MgY2FuZGlkYXRlcyB0aGF0
IG5lZWQgdG8gYmUgZGlzY2FyZGVkLCBhcyBzaG93biBpbiB0aGUNCj4+IGV4YW1wbGVzIGJlbG93
Lg0KPj4NCj4+IFRoZSByb290IGNhdXNlIGlzIHRoYXQgd2hlbiBjcGMtPnJlYXNvbiBpcyBzZXQg
d2l0aCBDUF9ESVNDQVJELA0KPj4gYWRkX2Rpc2NhcmRfYWRkcnMoKSBleHBlY3RzIHRoYXQgY2tw
dF92YWxpZF9tYXAgYW5kIGN1cl92YWxpZF9tYXAgaGF2ZQ0KPj4gYmVlbiBzeW5jZWQgYnkgc2Vn
X2luZm9fdG9fcmF3X3NpdCgpIFsxXSwgYW5kIGl0IHRyaWVzIHRvIGZpbmQgdGhlDQo+PiBjYW5k
aWRhdGVzIGJhc2VkIG9uIGNrcHRfdmFsaWRfbWFwIGFuZCBkaXNjYXJkX21hcC4gSG93ZXZlciwN
Cj4+IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBkb2VzIG5vdCBhY3R1YWxseSBydW4gYmVmb3JlDQo+
PiBmMmZzX2V4aXN0X3RyaW1fY2FuZGlkYXRlcygpLCByZXN1bHRpbmcgaW4gdGhlIGZhaWx1cmUu
DQo+Pg0KPj4gVGhlIGNvZGUgbG9naWMgY2FuIGJlIHNpbXBsaWZpZWQgZm9yIGFsbCBjYXNlcyBi
eSBmaW5kaW5nIGFsbCB0aGUNCj4+IGRpc2NhcmQgYmxvY2tzIGJhc2VkIG9ubHkgb24gZGlzY2Fy
ZF9tYXAuIFRoaXMgbWlnaHQgcmVzdWx0IGluIG1vcmUNCj4+IGRpc2NhcmQgYmxvY2tzIGJlaW5n
IHNlbnQgZm9yIHRoZSBzZWdtZW50IGR1cmluZyB0aGUgZmlyc3QgY2hlY2twb2ludA0KPj4gYWZ0
ZXIgbW91bnRpbmcsIHdoaWNoIHdlcmUgb3JpZ2luYWxseSBleHBlY3RlZCB0byBiZSBzZW50IG9u
bHkgaW4NCj4+IGZzdHJpbS4gUmVnYXJkbGVzcywgdGhlc2UgZGlzY2FyZCBibG9ja3Mgc2hvdWxk
IGV2ZW50dWFsbHkgYmUgc2VudCwgYW5kDQo+PiB0aGUgc2ltcGxpZmllZCBjb2RlIG1ha2VzIHNl
bnNlIGluIHRoaXMgY29udGV4dC4NCj4+DQo+PiByb290IyBjcCB0ZXN0ZmlsZSAvZjJmc19tb3Vu
dHBvaW50DQo+Pg0KPj4gcm9vdCMgZjJmc19pbyBmaWVtYXAgMCAxIC9mMmZzX21vdW50cG9pbnQv
dGVzdGZpbGUNCj4+IEZpZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxDQo+PiAgICAgICAgICAgbG9n
aWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MNCj4+
IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwNDA2YTAwMDAwIDAwMDAwMDAwM2Q4MDAw
MDAgMDAwMDEwMDANCj4+DQo+PiByb290IyBybSAvZjJmc19tb3VudHBvaW50L3Rlc3RmaWxlDQo+
Pg0KPj4gcm9vdCMgZnN0cmltIC12IC1vIDB4NDA2YTAwMDAwIC1sIDEwMjRNIC9mMmZzX21vdW50
cG9pbnQgLS0gbm8gY2FuZGlkYXRlIGlzIGZvdW5kDQo+PiAvZjJmc19tb3VudHBvaW50OiAwIEIg
KDAgYnl0ZXMpIHRyaW1tZWQNCj4+DQo+PiBSZWxldmFudCBjb2RlIHByb2Nlc3Mgb2YgdGhlIHJv
b3QgY2F1c2U6DQo+PiBmMmZzX3RyaW1fZnMoKQ0KPj4gICAgICAgZjJmc193cml0ZV9jaGVja3Bv
aW50KCkNCj4+ICAgICAgICAgICAuLi4NCj4+ICAgICAgICAgICBpZiAoY3BjLT5yZWFzb24gJiBD
UF9ESVNDQVJEKSB7DQo+PiAgICAgICAgICAgICAgICAgICBpZiAoIWYyZnNfZXhpc3RfdHJpbV9j
YW5kaWRhdGVzKHNiaSwgY3BjKSkgew0KPj4gICAgICAgICAgICAgICAgICAgICAgIHVuYmxvY2tf
b3BlcmF0aW9ucyhzYmkpOw0KPj4gICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0OyAvLyBO
byBjYW5kaWRhdGVzIGFyZSBmb3VuZCBoZXJlLCBhbmQgaXQgZXhpdHMuDQo+PiAgICAgICAgICAg
ICAgICAgICB9DQo+PiAgICAgICAgICAgICAgIC4uLg0KPj4gICAgICAgICAgIH0NCj4+DQo+PiBb
MV0gUGxlYXNlIHJlZmVyIHRvIGNvbW1pdCBkN2JjMjQ4NGI4ZDQgKCJmMmZzOiBmaXggc21hbGwg
ZGlzY2FyZHMgbm90DQo+PiB0byBpc3N1ZSByZWR1bmRhbnRseSIpIGZvciB0aGUgcmVsYXRpb25z
aGlwIGJldHdlZW4NCj4+IHNlZ19pbmZvX3RvX3Jhd19zaXQoKSBhbmQgYWRkX2Rpc2NhcmRfYWRk
cnMoKS4NCj4+DQo+PiBGaXhlczogMjUyOTBmYTU1OTFkICgiZjJmczogcmV0dXJuIGZzX3RyaW0g
aWYgdGhlcmUgaXMgbm8gY2FuZGlkYXRlIikNCj4+IFNpZ25lZC1vZmYtYnk6IENodW5oYWkgR3Vv
IDxndW9jaHVuaGFpQHZpdm8uY29tPg0KPj4gLS0tDQo+PiB2MTogaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI1MDEwMjEwMTMxMC41ODAyNzctMS1ndW9jaHVuaGFp
QHZpdm8uY29tLw0KPj4gdjEtPnYyOiBGaW5kIGFsbCB0aGUgZGlzY2FyZCBibG9ja3MgYmFzZWQg
b25seSBvbiBkaXNjYXJkX21hcCBpbiBhZGRfZGlzY2FyZF9hZGRycygpLg0KPj4gLS0tDQo+PiAg
ICBmcy9mMmZzL3NlZ21lbnQuYyB8IDUgKy0tLS0NCj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9z
ZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYw0KPj4gaW5kZXggMTNlZTczYTNjNDgxLi4yNWVh
ODkyYTQyZGQgMTAwNjQ0DQo+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYw0KPj4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmMNCj4+IEBAIC0yMDc0LDggKzIwNzQsNiBAQCBzdGF0aWMgYm9vbCBhZGRf
ZGlzY2FyZF9hZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9s
ICpjcGMsDQo+PiAgICB7DQo+PiAgICAgIGludCBlbnRyaWVzID0gU0lUX1ZCTE9DS19NQVBfU0la
RSAvIHNpemVvZih1bnNpZ25lZCBsb25nKTsNCj4+ICAgICAgc3RydWN0IHNlZ19lbnRyeSAqc2Ug
PSBnZXRfc2VnX2VudHJ5KHNiaSwgY3BjLT50cmltX3N0YXJ0KTsNCj4+IC0gICAgdW5zaWduZWQg
bG9uZyAqY3VyX21hcCA9ICh1bnNpZ25lZCBsb25nICopc2UtPmN1cl92YWxpZF9tYXA7DQo+PiAt
ICAgIHVuc2lnbmVkIGxvbmcgKmNrcHRfbWFwID0gKHVuc2lnbmVkIGxvbmcgKilzZS0+Y2twdF92
YWxpZF9tYXA7DQo+PiAgICAgIHVuc2lnbmVkIGxvbmcgKmRpc2NhcmRfbWFwID0gKHVuc2lnbmVk
IGxvbmcgKilzZS0+ZGlzY2FyZF9tYXA7DQo+PiAgICAgIHVuc2lnbmVkIGxvbmcgKmRtYXAgPSBT
SVRfSShzYmkpLT50bXBfbWFwOw0KPj4gICAgICB1bnNpZ25lZCBpbnQgc3RhcnQgPSAwLCBlbmQg
PSAtMTsNCj4+IEBAIC0yMTAwLDggKzIwOTgsNyBAQCBzdGF0aWMgYm9vbCBhZGRfZGlzY2FyZF9h
ZGRycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBjcF9jb250cm9sICpjcGMsDQo+
Pg0KPj4gICAgICAvKiBTSVRfVkJMT0NLX01BUF9TSVpFIHNob3VsZCBiZSBtdWx0aXBsZSBvZiBz
aXplb2YodW5zaWduZWQgbG9uZykgKi8NCj4+ICAgICAgZm9yIChpID0gMDsgaSA8IGVudHJpZXM7
IGkrKykNCj4+IC0gICAgICAgICAgICBkbWFwW2ldID0gZm9yY2UgPyB+Y2twdF9tYXBbaV0gJiB+
ZGlzY2FyZF9tYXBbaV0gOg0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY3VyX21h
cFtpXSBeIGNrcHRfbWFwW2ldKSAmIGNrcHRfbWFwW2ldOw0KPj4gKyAgICAgICAgICAgIGRtYXBb
aV0gPSB+ZGlzY2FyZF9tYXBbaV07DQo+IGRpc2NhcmQgaXMgY3JpdGljYWwsIHdlIG5lZWQgbW9y
ZSBzYW5pdHkgY2hlY2sgaGVyZSwgbWF5YmU6DQo+DQo+IC8qIG5ldmVyIGlzc3VlIGRpc2NhcmQg
dG8gdmFsaWQgZGF0YSdzIGJsb2NrIGFkZHJlc3MgKi8NCj4gZjJmc19idWdfb24oc2JpLCAoY3Vy
X21hcFtpXSBeIGRpc2NhcmRfbWFwW2ldKSAmIGN1cl9tYXBbaV0pOw0KPg0KPiBDYW4geW91IHBs
ZWFzZSBjaGVjayB0aGlzPw0KDQpTdXJlLiBJIGhhdmUgYWRkZWQgdGhlIEJVR19PTiBjaGVjayBh
bmQgcGVyZm9ybWVkIHRoZSBmb2xsb3dpbmcgdGVzdHMNCndpdGhvdXQgaXNzdWU6DQoxLiBSYW4g
eGZzdGVzdHMgYW5kIGZzc3RyZXNzIGluIHRoZSBRRU1VIGVudmlyb25tZW50Lg0KDQoyLiBSYW4g
bW9ua2V5IGFuZCByZWJvb3QgdGVzdHMgb24gQVJNNjQgQW5kcm9pZCBkZXZpY2VzIHdpdGggdGhl
IDYuNiBrZXJuZWwuDQoNClRoYW5rcywNCg0KDQo+DQo+IFRoYW5rcywNCj4NCj4+DQo+PiAgICAg
IHdoaWxlIChmb3JjZSB8fCBTTV9JKHNiaSktPmRjY19pbmZvLT5ucl9kaXNjYXJkcyA8PQ0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTTV9JKHNiaSktPmRjY19pbmZvLT5tYXhfZGlz
Y2FyZHMpIHsNCg0KDQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
