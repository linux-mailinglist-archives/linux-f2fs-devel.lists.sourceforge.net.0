Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJEVOoNHqWm33gAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 10:06:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E03320DF98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 10:06:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olExrAHvJdp6YmYRL4XssIzt7cc27ChYW+QrQF7s8zc=; b=A6Qn7z2V1l5PpTeUXsFBuwgJ/3
	eRzQIv5Ga41T+rQ5IT/JZy1yckh0zaBe0EA06gtRBfWYYLqcSk1CEEbwIPntov7cowsCsIIUUEt+0
	7La2cQeoj3hCKqDu69PYM0WXHndFQkTNnOeq3LOJgh1UUE6CLRc1CSsUb+FhGsVkgDMg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vy4eg-0000oP-JE;
	Thu, 05 Mar 2026 09:06:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=517a9caaa=shinichiro.kawasaki@wdc.com>)
 id 1vy4ef-0000oC-47 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 09:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H1OaOxT9AyxpQiU40hRBiaO2FVKHWZb4QL/MDckZ1TE=; b=XtlXkfavmUytxKHPrvC1OSmR2Q
 iYVkGgVSCOl8HXaDdEcqBRkoUMYNxZk6OdzZau9WOK87mVFvzRiXENAN956sLxqXfBIQxOKUBQnFw
 niOzpMNxpJ1OXbjTfnr+j8iye4BnrG6JL1RHPB0vyVxwHXKR/uGci/ZF61g+MkM6djP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H1OaOxT9AyxpQiU40hRBiaO2FVKHWZb4QL/MDckZ1TE=; b=OwQud9LVQZYRww1Z2XcbkZZFEb
 Xp2IfKA2NPdlpaPAJ1D6TAM/z1HDI49il9avx4f+tPjl2YBq82HP/Z2sjLsv308tnCmapVWqyp8vm
 eoK1jkxbGGXWFpyHViCW8NM5VE+EY9smvku6puEsXWLLsauP/r7Jpu7ThAg5VgE60xhQ=;
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vy4ee-00037u-FF for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 09:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1772701558; x=1804237558;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wKL/0mcl8b8IGi3m1QYmSxYM+tPliCF2Z0Y1k7/WWLM=;
 b=aqduNAT70VGPR0rsCzpqWH8GlKsX5x+f37Ou+6YKMevXBk6LpAG1KJx+
 9OeGRQ0JPBSaqK0UBENKPXt+NLKZ4ZKTR86DHzaiZ+YE7aqKut2U0lc60
 USNm6xhfsc3eGfeFdHZ/BYU/UZPzXmAWu+HmqcrqDOOXc7vCfocqYnNKN
 rrlkIOSN+5JlER/cRxU3KsQXQiUcle+u6qJpK/rPIIbCn4fCgnUPqfrzt
 YxKgtURWyR//61RUiFXwJeem0kDMBLQaY8ipFbt5FdyR4jbIxN57/KHYx
 prxcEytLIJgWlMNABcsqZcxfwtOMeATADzfqH5FESvUXn0tqPnV2U7pPm Q==;
X-CSE-ConnectionGUID: 9REiTRAvTFCt4GqkMEKGEQ==
X-CSE-MsgGUID: dVEOe8wTTC2F9jmMT27ZbA==
X-IronPort-AV: E=Sophos;i="6.21,325,1763395200"; d="scan'208";a="143081606"
Received: from mail-southcentralusazon11012007.outbound.protection.outlook.com
 (HELO SN4PR2101CU001.outbound.protection.outlook.com) ([40.93.195.7])
 by ob1.hgst.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Mar 2026 16:50:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk3TY0yzJLCEFmIAFn+q1SYmWrbuCU3vX8dCetxEnMbfebvXL6x5lZqjt8KmxzodyKFr7xbcgUAw59tpKHsRBSoWTzB7+4LN3kK0lPTWfIyHheYAzC3HqS2S0XxY6m3y2j6z4sL/hDZ9Lgy4zcY01wKxVc8Vb7888A5WxY+okV9tULNMfuoh46daK5nohQt0q5kM3RMa26qUjQoez7gXec3gEIrI2H3tcO78g3Q3Yvo9H8Bg3oLsnSIUjbRMIf7T6SMrZbO/sVNbz67N+AJ+mwW13ZaQcy8bg8PDj/2YelRXHBmUCXUd+4hf1OrwE2nOElbGvVSPuVn5w/8K4NzzjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1OaOxT9AyxpQiU40hRBiaO2FVKHWZb4QL/MDckZ1TE=;
 b=Ypjv+HoCcrJfCrvvDCJrBtZPk+ev+QoQE/JKl+2SJ+rWowYvljNa7wxbrGGynl4TdpHJMDRXb7DqtIngd7xrWu0QiMRxIHtvMyRNw4lX06aqi0JVC3ofQp9Q1AWJ0cxv86qvVoEIyD0uH+GNueF1lX6Fuiqqsmo9BO4ZOhlNDucUl3GhxxtWfNN88CcvSOHIcZ/d924bn87eHKoshXSHEeOTnL51Vlt/VCP+IdAPhSD0NBf0wQujn/f6GDwc4YeRzkLkICRgDWSrleKUX6IOx9J3+CbHUAkyV+ciNdixUWmosoS9qNksWQJLYzDfLqdGFK6HSrVeG9mFtyX02S0ytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1OaOxT9AyxpQiU40hRBiaO2FVKHWZb4QL/MDckZ1TE=;
 b=YhfMuwOXvl2jqt2YNQAwbh8K9kXeFWpu+9Rj3pmPBz5jCkk84eRP6CgoShQ9Tq6SZ6wlO0V0QNeyy9/xkDWDqY8ZIInQ41vSxQehYxmwahDod/EFxSV9nVeay1iXMQk+jWNlPmEASFULcNOSD0lume375KrWFNkOxMj1dWOBXfk=
Received: from SN7PR04MB8532.namprd04.prod.outlook.com (2603:10b6:806:350::6)
 by DM8PR04MB8168.namprd04.prod.outlook.com (2603:10b6:8::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18; Thu, 5 Mar 2026 08:50:00 +0000
Received: from SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729]) by SN7PR04MB8532.namprd04.prod.outlook.com
 ([fe80::ce42:7775:2df8:8729%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 08:49:59 +0000
To: Chao Yu <chao@kernel.org>
Thread-Topic: [PATCH v2 1/1] f2fs: fix lockdep WARN of sbi->cp_global_sem and
 q->q_usage_counter
Thread-Index: AQHcoNWEWBcPYygC7EirE0kirNCd/LWROPsAgAAzDYCABaKtAIAG1l+AgABCeoCAARgzgIAABBoAgAADFQCAAHF8AA==
Date: Thu, 5 Mar 2026 08:49:59 +0000
Message-ID: <aalBX7IlREU-Yc4R@shinmob>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
 <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
 <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org> <aajhnCU8KjUaoCl_@shinmob>
 <4e22d920-37dc-4414-b512-87343625f1e5@kernel.org>
In-Reply-To: <4e22d920-37dc-4414-b512-87343625f1e5@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wdc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR04MB8532:EE_|DM8PR04MB8168:EE_
x-ms-office365-filtering-correlation-id: 386f9253-6424-4d02-b396-08de7a942f10
wdcipoutbound: EOP-TRUE
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|19092799006|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: D42YvWf6QTnXjG36vZ4XlyejWoOoA90OPF87H/fZ+9HzvRIF2FJ7IEMqv96UNeD83E6jhvaRmpN6DJpnlBVgrLmP5/XRKec6/r57DaYNBAMaaARTSWFrIbSm2ASqdUdSmPBn0I3RtY9TfAcWWF9wqmq1WskyPj1VjAW+sc9jOXRh2Rudae01bQFbbS50estVVP/m5cKnsOlKuLjCMqykf94jbaLQk7hcLRoXFpQuVJueAEj9M8LDF1m18TAKTFe97xXkKNBJghWf192Ya0R4ZoCAhNoydwmCmEkJrz32CeTl3wVl4ADy/TZqyTIYN01XUhCixWgVEs/lrq687KjF7sY+v56TgiBT14qAruvx/4AWeO64tEQq/2tqPEgTT/I7RBPFm27lVqxVUlysNrRlxbRhEx5+JqNvVtfOx7GsTVyWNH4NaVUMrPhVUBUniNmqRoVeWzkg+VZoFiHIK67eE7AF+2CkzLBFGlG1vEkLUPSbjMzr9HK4TWXgkFyWnEee/8/yAszEXT9A/JhVwET96PUfePTC3AVXGU7Sc7tBU1JlwJzIXizekmXrA3klsvgZKs9JJxZgE6sbdEy+HJ5N5h2Em6b6sy8mg3qzcqX6JNc4XAJ0Ibftgt6MG9NhJFveBRT9eHsmuFeVmDTAKpKCrlLMvACFj0nv5UgbwoUoyfzWruZFmBOXVJEsfLlH/s1TnifWP/AmPCq6pnuTar0CZCRC4sjz+AhFjQxSkM2ljcgw1Ht9/EdwYYaFABRzb53BdFSFL1iPCOZ9IcepQg6Yno7RUgqaDs7D6kowICnau4A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR04MB8532.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4kXrfP5qLaEP+mEZYaVfkVuEdIjloOp+DoRnnEsDyT9T9CRKqyj30rAedQsU?=
 =?us-ascii?Q?5k47GEcKduCDgN9p0fGVux3OIcAe/B2oNFkm00oZo/W2thMdBtGMMuqpwk22?=
 =?us-ascii?Q?MtgnsvO4tjrqGOQMbQvbofQb+Y/oHoyAkb+0bkIp6GjOi6h1bUAZdRplpWkT?=
 =?us-ascii?Q?2l5sK9FvIYkh+E4kzjVMmjksORv9cazmZBecy1ug8z2dVdoXhmxs18ij7iw6?=
 =?us-ascii?Q?ltZc+DmHSgsRW01SRTuHTOogH97bhVI5m3SNqwZfJw87DXRpIyi4Os7DNMXL?=
 =?us-ascii?Q?SYWoPiVJyVkHKlE72+Nkc45YBvDGyaUWPIr3XRoTUklyvQTXTd4rIu6U2ETG?=
 =?us-ascii?Q?CTQ+UvPb1LfubeuOTo2vi4InWgqh1il7Bav8i+lz6J6CNw2xGaA7XxXnNt/n?=
 =?us-ascii?Q?Y8gbwRVKsGOmJHAkH/u/0CnV1UJ71NBgHKLe2twXnbIQRH6lFRBeAoJFYtkN?=
 =?us-ascii?Q?NiWyrhRUp/DbJQ8pVzWlPLMm7Pal+q69oapp/84E0W67edXnA7GIRu+K3QiV?=
 =?us-ascii?Q?LrgORM8Ys+5MndIG6xNnNWOhn8sIip4+KwEumhsXtMv67+WEwO0swUdiOgpq?=
 =?us-ascii?Q?AAsYOVz+qlr5zUe/MxkZBxB4yQqVR42BOIrLkOsNnkOZZwWiNvbBAn320WEn?=
 =?us-ascii?Q?pH1NVpZWZ2RW+B2RorBzhS+nX1oUQwhpL+Amfp79W6nBx6E8gpOH3TJO3ts7?=
 =?us-ascii?Q?sdIy0jSm0l2yIt96AA7nCfRziVsms/vSvhLjLmqI6oBXGoNo8PueW73drYet?=
 =?us-ascii?Q?O7kRj6hyNebybjVtZ2nSFnczEej6cUsNCBYPLzhWvE5gP9DxbGx3uDICrXAH?=
 =?us-ascii?Q?/tJU2Wv/cPtTZGBnTcC4dH0k/o5Tv/V29MXA8kbhppn+GE+z+eM8SJl1SwwR?=
 =?us-ascii?Q?KWyjs3L9X73VNooMED9RfUrceV3W0P5FxH2a5JzPaXl/jfUeW68xFZfOSwj8?=
 =?us-ascii?Q?4wCZrbSD56CYMM5NE6eIg+mt/43jSlewXBb7cxEpCWYveLifHdtP3eLJLCyv?=
 =?us-ascii?Q?A4DekAx6+km7scuHafqW6ksQwzoxuspDnd+bK5H6YrbEyp9bnBGPmc6EG4U6?=
 =?us-ascii?Q?zO/kYdly2TDnLIPKbP7MaWvDLZ+3aaR6HXh6+1BjWf/BYj1Sy9A2kn10B4+q?=
 =?us-ascii?Q?D61MsymITCNtLTTiLfpwrwrIA/oc/i4Tw2JXqOujloRSvodVbFeJ0ctOWWaS?=
 =?us-ascii?Q?NRVgsqKKzalvvkga8kgwZcqPe98ydqkL2y4eu507tH/Aq8vw369YouOkKOp/?=
 =?us-ascii?Q?ge7iyxwILiKQGEqqpLbXwCJZhh8ysFgv298U/1Q0T2MN0YLb7aAIC3wZbrFI?=
 =?us-ascii?Q?Sh0UvGyFlGZnWuE5SR+VS4naJ1y2Fd497oYO0SUis57W3afaxpXb5bwMTna+?=
 =?us-ascii?Q?NpWiWKtisYqsu9DzVSDCQnY0RwIt+yWz4QPbfZ/1cm/1d96OApdQRgnuO1cP?=
 =?us-ascii?Q?J+zQCCe9hAmgqNc54lWAgijWA+JwYY9nKtTuoAzsfTyzwb0aqntC3zwSdJL1?=
 =?us-ascii?Q?7KEBRqntYOYvmXjelx/oWEIlvmSZmcNSleOYQJjSocbzYqKLbOli2pzi0os+?=
 =?us-ascii?Q?ajMF12rwCPKBaO9+lOSsTB4eRv7Vo3eBDA7pfunApS1RgyhSoHgjekeub2xk?=
 =?us-ascii?Q?SjCS7ZqB89wcUvGE5kg3YZlauix7qBwkHi/YuBCY8lgLu1OgTAihGIelFafG?=
 =?us-ascii?Q?dw8wpGBfSsnYylqFaur0MN27atwCoVKXga71+kphlU2v45nQRH/bBkY9OejJ?=
 =?us-ascii?Q?n0y5IA42Fx7VDa//7w3skLzY6Oiz04M=3D?=
Content-ID: <BB16B43029BAA04A892A5AB818EB570E@namprd04.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rA64zUCov/QYjkFo74jOHkrSqR40adlfXX5P8+c56FB2TdCKcq2RCNP5MF+FKnXsYcAJQDOKN4AaKrrolFRiqiWwbSMcl20rSoaRz5U0FVyd0MoQCDuPCOljn+v8thybUEOcGDSir1uv1MlSyZHTVgRnu2TpM3k4HGZsgXU7YTKabo49B8jE8I6aAtcuS6Fc1XscbodVzMAxgEmQchuPKXeK8EloYRhL6nlIdw/gYtauNP6kauYfpvUq6P7mDFMbd5rC2GAoIbe7OdqvIfxhoMTI4cQSyeeB3tkVQXEYl9KD+Jd9POO8K2/Uk8brr5AqmWA7yxhUNnP8ygZe+6vtVzv1POOhSLeHg3khsx9hEFn7p4JXrQLMEGKVKFYTJUBNfC4+qvDIijCu8D4aocGs3FgGorWg0DE1mqNEu8NGzV0NJLP0h43/X0iHHKYazR5ugGthEtxGNkZBi/1dVMejsZrJDufFu8uvJP+0e/34wYggEUJXkgCLHMNmUdBcX8OkLLCq1rRhMc97oCLJz91HoRBBYmk5g81fLhnVDRyhf5+L7d9CaJsB4EXsZDfS83WZeJ/Glu7eKuOU4VGj3TR9LSQRX9DTeHIgkKVWBYXsnAx/SGwqJuk7X+gJe70AU0dN
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR04MB8532.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 386f9253-6424-4d02-b396-08de7a942f10
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 08:49:59.6203 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkuiumvqSKTYR2RNOywcABWmp9fOCFEP2Y6KnaMgzhEnb55rTjzRPmyuM6Rv0iNOu2cu7WeoQJTt9loVnYNzTE/97ePVCbuKZzgRGVSOyCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR04MB8168
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mar 05, 2026 / 10:03, Chao Yu wrote: [...] > Updated link
 as below which includes compile error fix. > >
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/syzbot&id=ef
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vy4ee-00037u-FF
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
From: Shinichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 0E03320DF98
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com,sharedspace.onmicrosoft.com:s=selector2-sharedspace-onmicrosoft-com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-,sharedspace.onmicrosoft.com:-];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,wdc.com:replyto]
X-Rspamd-Action: no action

On Mar 05, 2026 / 10:03, Chao Yu wrote:
[...]
> Updated link as below which includes compile error fix.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/syzbot&id=ef20840493da6cb26bb910a73c46413a17ea58e7
>

I applied the patch above and ran my test workload, then I observed the
BUG below.

Mar 05 14:27:51 redsun40 kernel: BUG: key ff1100011a6b5ea0 has not been registered!
Mar 05 14:27:51 redsun40 kernel: ------------[ cut here ]------------
Mar 05 14:27:51 redsun40 kernel: DEBUG_LOCKS_WARN_ON(1)
Mar 05 14:27:51 redsun40 kernel: WARNING: kernel/locking/lockdep.c:4976 at lockdep_init_map_type+0x122/0x220, CPU#11: mount/1829

 4969         /*                                                                      |
 4970          * Sanity check, the lock-class key must either have been allocated     |
 4971          * statically or must have been registered as a dynamic key.            |
 4972          */                                                                     |
 4973         if (!static_obj(key) && !is_dynamic_key(key)) {                         |
 4974                 if (debug_locks)                                                |
 4975                         printk(KERN_ERR "BUG: key %px has not been registered!\n", key);
 4976                 DEBUG_LOCKS_WARN_ON(1);                                         |
 4977                 return;                                                         |
 4978         }                                                                       |

From the comment, I learned that cp_global_sem_key should be registered. I made
the additional patch below. With this, I observed no lockdep splat, no WARN :)
Great.

Chao, thank you again for the solution idea. I would like to ask you to take the
next step to upstream the fix. If it helps, I can post the patch on behalf of
you, but your action might be faster.


diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 23ef8816c04..1d97dded4ee 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4949,6 +4949,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	mutex_init(&sbi->writepages);
 	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
+	lockdep_register_key(&sbi->cp_global_sem_key);
 	lockdep_set_class(&sbi->cp_global_sem.internal_rwsem,
 					&sbi->cp_global_sem_key);
 #endif
@@ -5423,6 +5424,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+	lockdep_unregister_key(&sbi->cp_global_sem_key);
+#endif
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
@@ -5504,6 +5508,9 @@ static void kill_f2fs_super(struct super_block *sb)
 	/* Release block devices last, after fscrypt_destroy_keyring(). */
 	if (sbi) {
 		destroy_device_list(sbi);
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+		lockdep_unregister_key(&sbi->cp_global_sem_key);
+#endif
 		kfree(sbi);
 		sb->s_fs_info = NULL;
 	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
