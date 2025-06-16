Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB7ADB9A9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jun 2025 21:34:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XiNFj8mP+7AVwQHa1mpls5RejzCQXlkry2Y/To0vd8c=; b=e2yDgTvCGAGsumN1knAepE8ffb
	Q6TJY8/9t4htIxLzJePsYS0hLYbCgbGFdy56HhSFCuBXhCu2HMbpqwcJP8fLmRPL0HldLAlTZbf4i
	a2w9yRuOFDzKsyLzBGaT2XIUMScKRcAfnjgTjy0lBhhs5CbW9J+mqdSKCWA1dhjLhgpw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRFbT-0001pe-I3;
	Mon, 16 Jun 2025 19:34:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lorenzo.stoakes@oracle.com>) id 1uRFbQ-0001pO-1O;
 Mon, 16 Jun 2025 19:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PiNJNTJE1OfkQxlJqIVcx5Xp7Gs3tunUhFqn6/frVm8=; b=dSGG26cjzuUVV1bu/N0ON9RscJ
 zAXUbhNSS+rGG7q70TyPy2CTDJQAseWjjDyQaUUkn/3MK2It3/zG1I4T3BImFwcK7C2Twy0BLE0wX
 zcibJnnKwv22M/dOJarwVpmaZdrn6B0vPxGNm51Q0c14hoUoW2CT/AXmNTjepvEUN3xU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PiNJNTJE1OfkQxlJqIVcx5Xp7Gs3tunUhFqn6/frVm8=; b=Jl/nlAdJWQdsXq654W3VW8PMJq
 TSVOhNR15MVGjqHQpA55ymAoZZuAwlD3ei9nFhze2cmH9N3vB4g9uHJuX/Za8DDRy48QIlWinaa8F
 sA6WONtlyqI3BKxj71Zl3dIFil4+en0jhKfe6OCdkDWxzopVpvgHJveeMYOxddSAAZTc=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRFbP-0008ID-Ar; Mon, 16 Jun 2025 19:34:43 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuTpO017630;
 Mon, 16 Jun 2025 19:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=PiNJNTJE1OfkQxlJqIVcx5Xp7Gs3tunUhFqn6/frVm8=; b=
 N3Ef8kP5ZSdN8sKZ4o8AiGuJArP37bsUE0/OT+bKXgm4UUgk0daDq9lri7Ej1fNa
 qm3DisJW1GAOjMxrkmo2XxKlPbLloPe+xKt/8o/8w3Bin12pUUZIby0wfeRxL+ii
 rcsumFJzaocuJrAdNRUmP20VtpuPJvrJ2ebZUeb5mEuNEeFoovQ03RiccOCq5pwg
 CAuhTyBBoF9bdpqZL+F4zje3Yj4Do63j1b7DRSVRCZznxpTTbXk4xf3xU1HTDrfo
 +mHz10dVitKy9Hgc3t4ageLl+9pD1Wk0YwKbYRQQswdHlIpQcarlkqVw8XkJQvzi
 itPAiDVt0QMp+mdl6pCvZA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yp4kqef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:51 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55GJAKnW001648; Mon, 16 Jun 2025 19:33:49 GMT
Received: from bn8pr05cu002.outbound.protection.outlook.com
 (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh8bqb0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Jun 2025 19:33:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm6btSN8OgkaDq4AmyQ7HGNkv01oKBVPKlxxvnsNhOaBP3GSONKu7JvaOTp1zYHKC1Vec1akl4VK1UCbEiUXNDWKHB+LcDj5l7GPby7ioKhrJs9vvAJEdUUUvlk9HyP77rGS9glSiOkiJO1804GbTczKBWD6dik9VQjPXQBfZElJYVV+HR9yBye3K2T7Zscqci1ZEMTxAml6kckqtxQPVoR4BdxRdO5Fzpq/vvAvlkitlikZszwhNSLr4ZtTEiM5EQ1hBIrED2hndm2NyutfOJ3nHk0AKK8VKWK1cXdr1mOWUqKdutAiLgn6YUBnTibgvF3uhlZGtdY5oeboDJTyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PiNJNTJE1OfkQxlJqIVcx5Xp7Gs3tunUhFqn6/frVm8=;
 b=E3TrM2CO/0NHymo8IJVqrV4zsbZ4nczeiJaClQxMIRmQN9CiywsXD8YhUV2ZA21FaJMT+8rCmiNdxeJN0ky+ILvOs+KFWRflIv7x8GR74vHhNrl0f+PDPzl7wrp8deH2JDCPzf7YdcotJn0y0wCD3l/bw0YIek310hRE8X8ou2JxS2uuJknWMuyPXLJMlyK8deunTVhMn2mzpkfsb4j4Jfj6avp9nmnhf9wWWq3zkSrGYcD0gk/8+an8XC/UwIU6fNGkuAJDyyNIBBUz31erdx/YjGqLlUncMPmSz1XRUTQOV/ZhbJaKhmRSEpS9xSK207UPbGRU0wD6PayAsjktYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PiNJNTJE1OfkQxlJqIVcx5Xp7Gs3tunUhFqn6/frVm8=;
 b=mR3r4WnmYrb2TimxxnSgL8C4NC6vjV/466abvOG9p5qgWjwg+KBF1NuZ5vCNDJf4nwoOuvoD5iNJC4Ab0OnYyxm9bFJDU/OKwv7nDVbKWVaPcGsvjUcUTqXVSkgZxefpnQlWU2R76WAgon+W716u74DlMYDSZjvZZwtKOScD5zE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH0PR10MB5870.namprd10.prod.outlook.com (2603:10b6:510:143::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Mon, 16 Jun
 2025 19:33:44 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Mon, 16 Jun 2025
 19:33:44 +0000
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 16 Jun 2025 20:33:20 +0100
Message-ID: <8d389f4994fa736aa8f9172bef8533c10a9e9011.1750099179.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0570.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::14) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH0PR10MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f0e8a0-96d2-4e0a-bfaf-08ddad0cb4d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O8gHb3vKsVg0+QRdKBoY37GyN2aMvWvebJtNZoqBMqQRXdVm4GhDuuRN0ao6?=
 =?us-ascii?Q?6ZffaqMO2HIZHXjl5a4JhzXNiIqUmolzzxoymJG3MrxgKGZCUFW2kMYXHTK7?=
 =?us-ascii?Q?o/5atQF4SUnhWrexbxgKZQN8sdGhlva/ub8PMaBWfbn6UkBCH+cJ811tdXX6?=
 =?us-ascii?Q?zwRtsEXtk5AGRcwqqlIo0MHCiegteCZicUCFz5GyDelouUZzxpYf8j8lK9ir?=
 =?us-ascii?Q?ZlMaEwCsiJmpE6NyNm4gNG173B4VFiV42J8vDIBenvLzwwc2gy9GbhDPanX1?=
 =?us-ascii?Q?8JqEqhyW5QJiOcm/YG4aomldpO1d21qKqHfSWtDxEjtkBWHoA85Koi5kBziC?=
 =?us-ascii?Q?b/cBsRYJystOFvWsAJkW/wR20r/wbGwJQruHklCBGXzTwTEe3mnQJq8Tv7Oc?=
 =?us-ascii?Q?kEpnWhRpGO/ECdut1dC102Sr412VnrSjg5T8icnUFU/cPE1BiQ6jHU5ADfRh?=
 =?us-ascii?Q?vqCO+e24TJOpTCJSZ8g4CbULI6t0CClWa9eVkWSBrwAUG5sxllBF5JfYM4Dj?=
 =?us-ascii?Q?EZRy3P5uQts40nXhPcz4o9hhQ65LSqRcCr7Ji/WBq54sVB+AGmhqTg+vVRcv?=
 =?us-ascii?Q?pWUMshZoh1U6mLABIWEMlYq3HEOJgaj1idwXGv1b+kUvCiMKOcithb7CA9kF?=
 =?us-ascii?Q?wG8LdjqHmPRZLv8N6C8Ag78x8AR4XDkkVrEoruBvnydBOIUw4bInyaAit82N?=
 =?us-ascii?Q?i000f2xcCJo7MDIdQyh5ZuQmiFF4mPLyNvBz18ZqknFsn9dyivFuXlC1lRgV?=
 =?us-ascii?Q?GvurKNyJ31XivEvz4x+qyi67Cfz3OqMfpwfZGjBVEieGdD/ipwTgk8z31ibt?=
 =?us-ascii?Q?I2tUXFrxcea54uD4LNBxg/0+Oe+hvaJhsg7rrFmL+PTwsziJe9nurk96TASe?=
 =?us-ascii?Q?pmFg5knjf29j6O8GH8LQxIYY2UwFKO6ZZM2nLbkR0IYID9RBBARXB88SLVTw?=
 =?us-ascii?Q?XXWBSlQnaxq9gk+MNaFF3Y1FVP+YF0HBcQqGiA/5369FFt9qJQI9a/A0KBi5?=
 =?us-ascii?Q?y6FWWdJLOjisyh0u0SQLMfL2uw0RKqieB9LkM4ywC6+o60oLdwam3ucBiUjQ?=
 =?us-ascii?Q?XIjieKRvdScQClXzn0bzhXBbsWzcLvZqj5ALVm2JhO6gr+4Xkf3MKrTThbAa?=
 =?us-ascii?Q?Ls0lu1pilGl2+sM3BEzHUQGm7jNJ5eHRt8GvgO8nr8tGnH3gIvkPqemSG9JE?=
 =?us-ascii?Q?L6O2uf7CvYo/3fc4QiZ/0o3pA0Ln5RKwbe5Gv8eGJVwcYRVSGJ6admxD81Pa?=
 =?us-ascii?Q?0eKpSdr5XFJ04JlD937v5V3cAzu0sU4+CqZp3TkNAdlEeHJpfyZOvqEDWayH?=
 =?us-ascii?Q?hQdzb8Lr8nNOxiMgioWQtIXwXDO4eWuGBDqbj6UVstQblaZNvRyXFOhd+FXb?=
 =?us-ascii?Q?SI0R9prZfRM0OpznXJBT0ZFnh9uImT+DAyU5lcrLkGmGtCjqRaWuHq5ojAqM?=
 =?us-ascii?Q?bwTUCItfEwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR10MB8218.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ryGDXt5DuBnTqAm4BFzxc3GYez43rEGZFe3OftN6Lwt4eSrDrx39EtOFDxDG?=
 =?us-ascii?Q?i4FAvhJd76zT11iOaMZdONIZxWNhlcQTdvBUFxyweSUeRjtCSxLxVpCr3DMv?=
 =?us-ascii?Q?5nc1VB+R8z58R0v4Gp/KqedVNBpiyHoZyHdM3wNqKM11Qw0lvwjry/T/UNCT?=
 =?us-ascii?Q?ioT89v4tUgPKQMdKw5sEVgUJh29rAnNsgw7eooVA78GBqfRLMeiXM1LXOz/Y?=
 =?us-ascii?Q?k2HMGUdMGkT8HbWy1hysdkmsusXFR3IwwnVlE5MDoXfX61aEeqcpW+Aw6vxn?=
 =?us-ascii?Q?Quo3KIeCRTy7IslTyuCsWuo1yd81F4mqeUr7jaVl7B6yxpCkm76S00lJIKBX?=
 =?us-ascii?Q?ykw7RVNW7+FlYtUeCYoulUWYdPxiqWxdViF6H/7CKzwaLp7TjPKoDBI8WVnZ?=
 =?us-ascii?Q?26vsxVxouFoLCy0+4xowfwAPHWebteSi1E14Ys5Uxbl0eEW8AhpwMWaFujCG?=
 =?us-ascii?Q?b308ttC3zGA+iG50wS51Rb+DgxYMprVglVSNDE16EgWU+6sx2ZSigOTVN/Sh?=
 =?us-ascii?Q?fVlU6aZVQv9ihb2jmwLDHmxoYjpLG6YrzJZ/YCHp6YianSRGYaNffSMQ0CGt?=
 =?us-ascii?Q?d34BwZVb2Qt5IKupoLVd/WrvB9ryZvbEGwQ4RY18V72BAnaRtv0v9h9qefM4?=
 =?us-ascii?Q?sQJHheN8u406Y8dQcv7VHi7yFbh6s2Uv3R9eNtqjG8UtSL8WuUMc4OCDIO5c?=
 =?us-ascii?Q?ANbfjREkXHO9k26vgzqqwlWxWaTaIPiRjZuhfKmoZd9ergg0ycFAAmW15+Qo?=
 =?us-ascii?Q?SatDxrRquhSkSzt+3kvqtldWtWy5aevbeBoLennkSdfhNliEX4EVA5g2Z8VS?=
 =?us-ascii?Q?0abEU1JRFN/Ay944EMjnN5zaPBpcpbndpuMKZ1kxsGlcHJOE+rOFFep8sNoK?=
 =?us-ascii?Q?zGyV6zXBI4yu+YTzk+Z9mkRYXOgXql8pReBL7YNCooDHqdab07B9rIvRDQqA?=
 =?us-ascii?Q?h5qRMrtLDfUJr0Kslne5wqx8bcAIwMqvowSgxEo34nx5blUOIJ3JuOa2z8ja?=
 =?us-ascii?Q?nSFMoD+yVWh8Ek73jw/v29iEPpCJz/GQkylTXcnnKcTefukVMypG9eBjkDX6?=
 =?us-ascii?Q?OdAtUucUgcq5koXgsZ7wrHZqrRZP/8rmEWUZKEfu7n8CNtBuxMpUTrm/z+Lw?=
 =?us-ascii?Q?Tz5nIF8KZIyTY+R0fbywFu4j9biaY3ty1Gu9CJSn50xfbIQUB5pbc5K1Coa3?=
 =?us-ascii?Q?7z3dolzHg8C5mI0zBTm9rnnM337mNQTHCYuaR1zBSL4B2x7OkRrXGAoo8N8G?=
 =?us-ascii?Q?i2tLtgucusWJW9g1hW9i/gjbD9QTO0awAuaT+SakbJNQrXOs0maZp3y6wL9f?=
 =?us-ascii?Q?zdLiI53MX6kt4Gten9LxBhJJqxUo2jLoZaZjphT8XX3USItPQPMDGbOmGwvb?=
 =?us-ascii?Q?bjz3SURx+anCfktydtoH9jEl/Gp8uCFERXyk2VOjhlEN1xrhVnIpZOLBi1dY?=
 =?us-ascii?Q?AitUePjODCkqd86PBWYgKqX1l+O9+n1CKps01pU+A0uwE6wYLp35+IJWuOfu?=
 =?us-ascii?Q?UY99GWAGmPoMMxOn2K5zCu+fFLKsP/MBfAu+ogbaY647n4BOKr/KeqTqlkUd?=
 =?us-ascii?Q?NHxDAgZN9I4iKH2916zyZNxXX1r2uEQE56vn9s/+WQbFNeszu/2M8QIUtUzv?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AlDNR2s/TgpSujR5+7KM3uUCrh5/T8JRh6A/8ckoR4aCsZPbAETDTrS0CqvngRFT3aJbIqlIIOCLZ9jC6tDkU5Ze0C7mATUW2fClB0QsGRdB67Y/xpMdr6Esh4uaoZk3YHHZnG0j5hZe8b35J/RJRItAJA+FPfjuMVaO42HMm0R1wPomLOwAyNU7eynowLyoQp9cZChM/kS/+aZ0jzBh5N9iME7Ucf2r30+JYFHrdp/9FbOW1ak9gIBrl2fsJMhOBbOOzujZsiam0C2gg611Ofr+ZzlRCqb9Twn8Z4jvBYyMlVrsjje/OxHoafIjHbc9f5KjJUJOFOtgi2PNbKuvd2ylOIG8OJRENN1hps5QoUx2+7TCiKc2uU90JbMJv9QhyyBLb2jX8uMdoty7gjEK/Iro7A94qPgq8K9bvLctXI+r24tTk8SmUSq2YdSTAtoPBnQ3LR6PAG9zmWLtwKkfH0efpvy48LEZ0+YJfEokJ3jobnoNyO12nXPDAkW3Ufas8Eg3lgqt4F3d0tX44JD6vsjGd4i0BNzf0dsC+md6IQwaRA9tKbT0lELHSPp0RauCNv/dKeaC1FK5lgXSDS+rtSk8iUQIXg6OCqrNjrR4vGU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f0e8a0-96d2-4e0a-bfaf-08ddad0cb4d0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 19:33:44.3635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auoG50dk0nLRcup3i/u7hQSpwNmotlFXnF8mNyM4mbdmgcdnROVWVHgAfR77A4rYvLVpeIdi/JBGeAnFqfwWQdiTQQJkxZjODmk4dM5PIHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5870
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506160134
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEzNCBTYWx0ZWRfX1gR6djjtETYi
 jDjqTyiitN+1+7alF1sRtWXcARSCbD8yPNF/HI34CNd81h4gKtz+ym0EewWXdnd1sy6360C4uCT
 /bIukXaov3vXd8iBiOj1DhQIn4PenJwuLJKy2qScqBndblxbuUy2FrghW0h/uQ2UwlAT/tljgVN
 hCgPqh/QljCvkC/ZzdAhWIToxQgtGxC/M+xJsFupIuwyBDGDwTMOzbjMAv1eG7eihxE6S3ToCEu
 s6jJZoc+W/DilIdBIiWbQmMxekq/BjA8D4RcNlC+X2imwJ18qQk8FYsdt8Mwdzgs0hQZKDo2pGj
 lMzF6R7nxoEN/4HN81HTFOhyb3UANsAoLFH3i19aUoiCjn1b7BEKq60AWhcqBB0/fNy/u+/AM3h
 EyyvKzZV5cy7ZomQcrUKo/yYZxmMrPjzFC9T/axdmiEH4kB8p87FA+pSCw5jjnDQSpuUyRjI
X-Authority-Analysis: v=2.4 cv=K5EiHzWI c=1 sm=1 tr=0 ts=6850719f b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=QJg4o-Cu8ZDUSi6hA70A:9 cc=ntf
 awl=host:13206
X-Proofpoint-GUID: EiNym53hQtI96y5LyceqB98RR32-Qas6
X-Proofpoint-ORIG-GUID: EiNym53hQtI96y5LyceqB98RR32-Qas6
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The call_mmap() function violates the existing convention
 in include/linux/fs.h whereby invocations of virtual file system hooks is
 performed by functions prefixed with vfs_xxx(). Correct this by renaming
 call_mmap()
 to vfs_mmap(). This also avoids confusion as to the fact that
 f_op->mmap_prepare may be invoked here. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRFbP-0008ID-Ar
Subject: [f2fs-dev] [PATCH 01/10] mm: rename call_mmap/mmap_prepare to
 vfs_mmap/mmap_prepare
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
From: Lorenzo Stoakes via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The call_mmap() function violates the existing convention in
include/linux/fs.h whereby invocations of virtual file system hooks is
performed by functions prefixed with vfs_xxx().

Correct this by renaming call_mmap() to vfs_mmap(). This also avoids
confusion as to the fact that f_op->mmap_prepare may be invoked here.

Also rename __call_mmap_prepare() function to vfs_mmap_prepare() and adjust
to accept a file parameter, this is useful later for nested file systems.

Finally, fix up the VMA userland tests and ensure the mmap_prepare -> mmap
shim is implemented there.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  2 +-
 fs/backing-file.c                          |  2 +-
 fs/coda/file.c                             |  4 +--
 include/linux/fs.h                         |  5 ++--
 ipc/shm.c                                  |  2 +-
 mm/internal.h                              |  2 +-
 mm/vma.c                                   |  2 +-
 tools/testing/vma/vma_internal.h           | 32 ++++++++++++++++++----
 8 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 05e440643aa2..f4f1c979d1b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -105,7 +105,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *
 	if (!obj->base.filp)
 		return -ENODEV;
 
-	ret = call_mmap(obj->base.filp, vma);
+	ret = vfs_mmap(obj->base.filp, vma);
 	if (ret)
 		return ret;
 
diff --git a/fs/backing-file.c b/fs/backing-file.c
index 763fbe9b72b2..04018679bf69 100644
--- a/fs/backing-file.c
+++ b/fs/backing-file.c
@@ -339,7 +339,7 @@ int backing_file_mmap(struct file *file, struct vm_area_struct *vma,
 	vma_set_file(vma, file);
 
 	old_cred = override_creds(ctx->cred);
-	ret = call_mmap(vma->vm_file, vma);
+	ret = vfs_mmap(vma->vm_file, vma);
 	revert_creds(old_cred);
 
 	if (ctx->accessed)
diff --git a/fs/coda/file.c b/fs/coda/file.c
index 148856a582a9..2e6ea9319b35 100644
--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -199,10 +199,10 @@ coda_file_mmap(struct file *coda_file, struct vm_area_struct *vma)
 	spin_unlock(&cii->c_lock);
 
 	vma->vm_file = get_file(host_file);
-	ret = call_mmap(vma->vm_file, vma);
+	ret = vfs_mmap(vma->vm_file, vma);
 
 	if (ret) {
-		/* if call_mmap fails, our caller will put host_file so we
+		/* if vfs_mmap fails, our caller will put host_file so we
 		 * should drop the reference to the coda_file that we got.
 		 */
 		fput(coda_file);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 93ee0d2d6f1a..7120f80255b3 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -2278,7 +2278,7 @@ static inline bool file_has_valid_mmap_hooks(struct file *file)
 
 int compat_vma_mmap_prepare(struct file *file, struct vm_area_struct *vma);
 
-static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
+static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	if (file->f_op->mmap_prepare)
 		return compat_vma_mmap_prepare(file, vma);
@@ -2286,8 +2286,7 @@ static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
 	return file->f_op->mmap(file, vma);
 }
 
-static inline int __call_mmap_prepare(struct file *file,
-		struct vm_area_desc *desc)
+static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
 {
 	return file->f_op->mmap_prepare(desc);
 }
diff --git a/ipc/shm.c b/ipc/shm.c
index 492fcc699985..a9310b6dbbc3 100644
--- a/ipc/shm.c
+++ b/ipc/shm.c
@@ -602,7 +602,7 @@ static int shm_mmap(struct file *file, struct vm_area_struct *vma)
 	if (ret)
 		return ret;
 
-	ret = call_mmap(sfd->file, vma);
+	ret = vfs_mmap(sfd->file, vma);
 	if (ret) {
 		__shm_close(sfd);
 		return ret;
diff --git a/mm/internal.h b/mm/internal.h
index 3823fb356d3b..a55c88afff6d 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -165,7 +165,7 @@ static inline void *folio_raw_mapping(const struct folio *folio)
  */
 static inline int mmap_file(struct file *file, struct vm_area_struct *vma)
 {
-	int err = call_mmap(file, vma);
+	int err = vfs_mmap(file, vma);
 
 	if (likely(!err))
 		return 0;
diff --git a/mm/vma.c b/mm/vma.c
index 5d35adadf2b5..f548bede3bbe 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -2582,7 +2582,7 @@ static int call_mmap_prepare(struct mmap_state *map)
 	};
 
 	/* Invoke the hook. */
-	err = __call_mmap_prepare(map->file, &desc);
+	err = vfs_mmap_prepare(map->file, &desc);
 	if (err)
 		return err;
 
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index d7fea56e3bb3..51dd122b8d50 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -1458,6 +1458,27 @@ static inline void free_anon_vma_name(struct vm_area_struct *vma)
 	(void)vma;
 }
 
+/* Declared in vma.h. */
+static inline void set_vma_from_desc(struct vm_area_struct *vma,
+		struct vm_area_desc *desc);
+
+static inline struct vm_area_desc *vma_to_desc(struct vm_area_struct *vma,
+		struct vm_area_desc *desc);
+
+static int compat_vma_mmap_prepare(struct file *file,
+		struct vm_area_struct *vma)
+{
+	struct vm_area_desc desc;
+	int err;
+
+	err = file->f_op->mmap_prepare(vma_to_desc(vma, &desc));
+	if (err)
+		return err;
+	set_vma_from_desc(vma, &desc);
+
+	return 0;
+}
+
 /* Did the driver provide valid mmap hook configuration? */
 static inline bool file_has_valid_mmap_hooks(struct file *file)
 {
@@ -1467,22 +1488,21 @@ static inline bool file_has_valid_mmap_hooks(struct file *file)
 	/* Hooks are mutually exclusive. */
 	if (WARN_ON_ONCE(has_mmap && has_mmap_prepare))
 		return false;
-	if (WARN_ON_ONCE(!has_mmap && !has_mmap_prepare))
+	if (!has_mmap && !has_mmap_prepare)
 		return false;
 
 	return true;
 }
 
-static inline int call_mmap(struct file *file, struct vm_area_struct *vma)
+static inline int vfs_mmap(struct file *file, struct vm_area_struct *vma)
 {
-	if (WARN_ON_ONCE(file->f_op->mmap_prepare))
-		return -EINVAL;
+	if (file->f_op->mmap_prepare)
+		return compat_vma_mmap_prepare(file, vma);
 
 	return file->f_op->mmap(file, vma);
 }
 
-static inline int __call_mmap_prepare(struct file *file,
-		struct vm_area_desc *desc)
+static inline int vfs_mmap_prepare(struct file *file, struct vm_area_desc *desc)
 {
 	return file->f_op->mmap_prepare(desc);
 }
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
