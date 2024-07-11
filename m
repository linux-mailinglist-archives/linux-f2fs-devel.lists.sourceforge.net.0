Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E20892DE2D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2024 03:58:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRj4Y-0004Mu-Kq;
	Thu, 11 Jul 2024 01:58:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sRj4X-0004Mm-8j
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=we9zx1k8TGpWYFBhkgdPRJZsr1oLb+EXD1iJnbN+meM=; b=AbVVK7DILVS12gcUrcq4i2QePj
 Qui0fBGhlcOju6bx7h1rjmdCsNei6srY9EYAxHjBcMRxTnpXmqQzJt/vYPiiPA6wUYsBAKoEsHpWi
 Sdf9NGW7c0T0Xh+aupnuw4xhYf7qvVFT4mSG7d3dxUPzD8+7K6RRhXLojAmEukPVCPug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=we9zx1k8TGpWYFBhkgdPRJZsr1oLb+EXD1iJnbN+meM=; b=g4X/tS5ljoOEuwCrUrSE83tZBu
 5OVO8WgYECHSIGDNHCTA1Li5pt6w2JNKlCezO4Y/YO0B4/mtwd6lG33UFEPeRRFWzkW9fqjCO84tL
 r2677Lx8UV3BJ37NfRWIN2gb73HK3plKvm2h11e/EsP5/Hs41rvoGx/tHBy01gh9dmt8=;
Received: from mail-eastasiaazon11010069.outbound.protection.outlook.com
 ([52.101.128.69] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRj4X-00055S-1f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jul 2024 01:58:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RG0v8WGFV34Nd+7EMG6FvHsDcc8pEsLHMWL7f6lXvEkC/158kphttuhNjQHSMkN6+PINEAxT4YoDb382bp4WkuWvQn9PuXjePY8fAavzj6VojbsdGv3SbrM7KLq5HOBn4xx1iN+t9ORDfyfutajkLjnCtxgO31kOYInC6HcC4SoqJ0E3DWUQaztxIWsQM/KsHmcaqUoW+yPPk7ycJt1P13lSsjfFDu3Q+DrYmOht9xS+d5Ed+68SWG1CLW4lPPi8U0QBOZ3JFvZ9hShfskgC1aiqGixY8DxOUoES27H0woktObCuxvGgt8aQZjJ8C9QVEqQIMO6U3sXE4IXvl8G0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we9zx1k8TGpWYFBhkgdPRJZsr1oLb+EXD1iJnbN+meM=;
 b=lB6Wyc2SO32UrWsI0pHp2swS8K1ZJZeY41NScMBiWFqGwlgYfxH5eygo1Yx0FW9ZEtLi1MIGM/ECnVocl0bNhl9sxvJsZK8/d4JnWJngMSphKKAQh4180j+Zo9AaOEkDb1SpDc6sD/mRldpsJwBSHcbVFfMw0Vce0xFeZYqonRhrTn1GeYJ0sbiP+EOSxqYaWTiQd01u9U4x2BeHerHCLwdIP8LUI0fLDFhhTOM6MXDkQJbGPIbRMkmnsCOrp/oUl40pa8pmK/nYg/uv2EDSgA03cOQAsdsy3IOemw+1bzYAr47Ia3zmMo9Zab+fWamUmZvuSArjhw76954BAUDIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=we9zx1k8TGpWYFBhkgdPRJZsr1oLb+EXD1iJnbN+meM=;
 b=lZRt8dy4yIZLKdgC2d8w6m2EE6TvBtgDnsWHpFTS7GyPqnARaaJKy0cFsmd+XXdkXlnOdbAyp6d8SDPfbwjGbwglxvbvD7lTiebYC3ZtKUgjlEKHQRF+8DZ3TZAd45gZFBo99NnCshKxYVqU4hqaDHhhynl7hJIEMG5JLci8qcQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB6255.apcprd02.prod.outlook.com (2603:1096:101:e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Thu, 11 Jul
 2024 01:25:04 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 01:25:03 +0000
Message-ID: <c0c7325d-3bab-4b00-89c4-4e13380675b8@oppo.com>
Date: Thu, 11 Jul 2024 09:25:00 +0800
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240704025740.527171-1-shengyong@oppo.com>
 <Zo8R5dV8awZ8NuDj@google.com> <Zo8TiszfzVZAhehK@google.com>
Content-Language: en-US
In-Reply-To: <Zo8TiszfzVZAhehK@google.com>
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 035b0938-9114-4ab5-72cc-08dca1484a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHJneFV3UlJaaUhsOWo1bnRMcndOSlJJaytHbG5MNW14UnJ3cVFwTEVrZ3c4?=
 =?utf-8?B?VUpLVGhWdCtid1R3clcvMVhQcUVpUUZTRGtldGRtQTVyVGNPSUF0ekU1T0x1?=
 =?utf-8?B?MGpPcG1Id3pBS1FHVnhoNjhoRloxOUNNV0d3eEpYcTFZVEJCY3dzUE1zSWdT?=
 =?utf-8?B?M3FHV2ZNVUxuTU11SDFmdW1UTm9kZ1ExUHQ1QjhsaDYwSnZLRUh0WWdRc2tG?=
 =?utf-8?B?NzZQUGQyL0NwSUluM0NTODI5aWZFbEw0MTNyN0RHSkVyRnF5VGY2RjBsbGlE?=
 =?utf-8?B?SFNHUEJRZ01ybkVtSDluR05vVVNHNU5FVkl3R2NvVXYvNHpHVkNMSGp0M3Fp?=
 =?utf-8?B?dXU0RFJLVWd5S0FPa0Q2S1k5aWhmbE9rU0hFeFh3OHhUbGJpZ3RVNWpEcVIx?=
 =?utf-8?B?SU5nODZTVE9SQWRlOEMzN3l4TEhFanRpSHdYN3YvSjltQzBXK3lBMEFlMXRM?=
 =?utf-8?B?WE5WT0tLRTB6bEx0MUtJWDBjRlR2dmovSFVOdHVaOFdCb0hvNjNOOVhTV3NX?=
 =?utf-8?B?eUltTWNZSmIrSlo4TGpTMUh1NjZBcVdzdFBUNTlJSk1qUzJXSGpNSDRyWjlI?=
 =?utf-8?B?THpyWVFTMEdGdkpteFdGU3ViZ3drQ1VuYkZUZnYrOTRNaldVWEsvUFZmNlJ2?=
 =?utf-8?B?Z283MEowSGYxcDRoRnpGVCtHaFgzeXZoQXJZakxmTlIvbUxXdUY2ZjE2S1VU?=
 =?utf-8?B?cXRrbm95Vnkwa1VLeUkyT0tuQVlzT0tlUzl0UmpUaU9TRXBhVGg1b2dGUTZQ?=
 =?utf-8?B?Z2VuVVdlL3ZHS1R3ZklITlVMZlh3V2ZDTWRkM1h5bFhDV2FobXM4TnM5MlMw?=
 =?utf-8?B?NUEvMm5QZXhiLzRhcmxxb0VQaTBuODNnRWxrQ1ZEYTJhdDhrVC9WS1ErOVJz?=
 =?utf-8?B?Vi9PMklzWXEvbzl0QjdWVXREaGJoRTJlRCswN2V2QWdwajZkZFJoQTNnZVpT?=
 =?utf-8?B?bURmUTVYZTZVWXFJM1JpejJTSDdVMHA2bG1pWDhDdDZ4SHc4NU5UZ043cUk0?=
 =?utf-8?B?S3MxaVJ6WjBrMnBnSklHMWNxZjQvVEdqSk8wRmkvQkRKem9QMUphN2Y1NlBR?=
 =?utf-8?B?Z3Q5a3BpcmF0dS9mbEI3K29QOE5tM08vM1JWb3dGbzhuL1dpaDZyQXpwc3c2?=
 =?utf-8?B?a0h4UU1aSVExd3gyaU9mK2ZPRWdVWVZWa0FRTGVVeVJ6eEhDNmRJWHJMbG5o?=
 =?utf-8?B?L3FVa0lXTVJUSWxhZ1NidEJGZzBuVTh3cDc3eXN6ZVlod0IyakFzSnBhUGZ4?=
 =?utf-8?B?OGxyYU85bmUxVDJ4dWRmd3ppY2hOWThJSXV1OWoyVWJFRkNtbExlYTdkNWdR?=
 =?utf-8?B?Z2JKdnk3bWFtcnB4cEJqTmpNQ0FVRkU0Q1UrclZNNS9JNWdHSktIVU1mbjFx?=
 =?utf-8?B?VmNiQXZwY0plVERWcldVYUVPRTJ6UzVSRlNLT0VQUjJLL1ZqSWFoMGtBU3M2?=
 =?utf-8?B?cGdTejBQb21WTW9Hdld1aEQ4b0dZNnFzUTVRTnNpaEE1YVJIQ21EUVd5T0Nk?=
 =?utf-8?B?RDdXZzg1QjFWYndrdkpCa3V0UzN1SWt6T004aWN0Q2NkTXFtQzI1MmNpVGNY?=
 =?utf-8?B?ZisyZXNzWmJYaEFTL3d1aFlnWmtMeGl6NUlyUzMwc2xvR1AxS2RsODhlajNX?=
 =?utf-8?B?ZHlTVE40RmllU0hlTFNEaWQ5Vjc0anhkNXlINFYyaHlkRUd4NG8zTFcvMEVD?=
 =?utf-8?B?WENLT0pUdktUUFFsejIya3JjTHFGc0pTVEVEVGJwdWRjQURiTUdEQWlpY0RF?=
 =?utf-8?Q?FIBcfnp6lG1FTW90oI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZkcHM5NUpxTGRUaGRBd3duaXVWSy9halhXSlQ0Vk02ZjZJOTlEMGEzVkpk?=
 =?utf-8?B?Z2k4MFE1N3RCNW9WM0hoQ1Q4VWJwZE9HUXI5NktHQVgyMGRXbHBkYjMzYkdl?=
 =?utf-8?B?ZUQ5Z095b3Z3QVY1Sms1Z0JGdWRwQXJUYlVEblZMNlFVV3dzbXpITTFBVjBB?=
 =?utf-8?B?UjVBbHZrcHh2RVNUZklma2gyL2xmRk04WnBCVzlVWWtyWkM4Q29WSzltY293?=
 =?utf-8?B?TU1yb0gvaktEQkl2M0FaVk5LRWZvaDVsbzJOeld4ZHBFdk52SXNSMCtYYXZJ?=
 =?utf-8?B?UVpYanRoRG1uRzVBNzB4N2d5cG10ejBOT05pcUg1UnZaS2M1a3FQeHJLVnBv?=
 =?utf-8?B?N3ViaFpheXE0V2M0cHMwZWppNXh2bkJyY0UwTkRRNHo2eERMazBMSmJxSEMz?=
 =?utf-8?B?Ui9lZ1NRZU5lZ3UwU2NLOFRJOVc3ZTJHSGdSbm5uYzZnTSt0N2x6bElrTkJI?=
 =?utf-8?B?RnY1UnRiMW9XTFc3dXEwL3VCWnBsMW0rb0NtdEJCWDQ2SmpSZVdodTUzZGtz?=
 =?utf-8?B?QkJMRWtGZW9ORVpJdW42TXNLRXhaZGxYUFVXeEFjclFDN1I1R2NHWGdTUGI4?=
 =?utf-8?B?dkhwTmI5RVBoanRXdHUyejMyN3dtTEdSc2FHT2R0Uk5sdzFmK08ydFAxYUtS?=
 =?utf-8?B?c3NlL09CZlA0aDU5cTdhL1F3N1oxMzR2Mzhyc3V4cm5BWGEzR1pYcUt0M1JR?=
 =?utf-8?B?WTlPQ0tFUjZ4Mm9DU2dIVjNnMDlUSkt1dTFhUzhyM01KN3UxbHVVSnpBQitI?=
 =?utf-8?B?WkRObHRqU0NscWd6TDZrK1VBa1R6SFBickN6S2R4YmN3VzJvS0R3SnFqZHho?=
 =?utf-8?B?T24zeEUwREFIczBFZUNvSnZ4Sjd5czNyTUtqVk9randxb0liVE0xaTBFN2pD?=
 =?utf-8?B?NVYrVm1UQ0ZRTjREVFVBQjIzQU9IR2RqaTFnclJiYWR1eWwxZ0doU1pKT3h1?=
 =?utf-8?B?SGhKTzEyNzUrSWwveVRzWHJKRHliTzJmTWcyNlZXRWtsdmltOXFXYUNCRkRt?=
 =?utf-8?B?ZWU5U2hBM21Gbm5sdGVuU3ZiSHZxa3E1WThBR2dFUURwckJRUGZla1VnSnFL?=
 =?utf-8?B?NFFQZVM5ZWlIdk10WmVzVnZBcGNjV1dwK3pQNEk2YWp1V0xvb3ZLcm5sdkhu?=
 =?utf-8?B?SktJQ21sMHJTUWwyd2hGMGhJdjF4WGNUMUxQSGdYRGRPYnpvZ29sN1VUUTM2?=
 =?utf-8?B?S0tLTzRqNmZnak11NnI5Q2F4Ny9LbUozaGpSZXM5QUNtZ2tDVnp4dzFYbDVu?=
 =?utf-8?B?Ykh0bndQNGVYL0tWcHBtdlV1dUdiRloySk1HN0xTZGlTNjBKcXlXQWdnWmwr?=
 =?utf-8?B?WVR2VmtUems4cnFPMzl2VVVmZlpoYWhBOUJyaCtZSDhJNUdoTlR2RzlVQVNK?=
 =?utf-8?B?YkFWTWxJbUI1NDdOQ1ZYV0xWQi9aUGhiRC90T1ZjdmRpUFZSWmtJdWdmTFFP?=
 =?utf-8?B?djdQUmswRUYrc25pUUZSMmV1V0Z4bEFNendqemUxOVlrOTExeFU0WmZxbWQ4?=
 =?utf-8?B?WFg0SEJFWkZobXNtejVGS1EwSExrc0hUcXg0NjZOd3UyVjFxWlBjM04vK1RM?=
 =?utf-8?B?UXVmaStPRGFJUkpQUGRBYUZhSjRIVkxNMWRtT3BzQldIUmEzZVFBQWk2V3dr?=
 =?utf-8?B?M3h4ODc3THZDT0x2aDhCU096Q0NDdUpEdHcydDB2a3VpY0FscUYxVllmMTFo?=
 =?utf-8?B?bkQvTzlRTXAzbW5aU0Z4NHpGVEZaOVd2WnhKQWN3VTA4WEx1OFBYbzZLRzNk?=
 =?utf-8?B?TVdIZnV1eTZYS3A3ZzlRY2xaMUdNdXp3Sk0yNFpLL1dtQ0pXZnF3VHI3UlJG?=
 =?utf-8?B?SGxmeFQzNENNNlZMTnlQbVhROXUwWDVzeU1WT0JOaXoya05mN3pEWTl1aUt4?=
 =?utf-8?B?OGYyd1NheS8vNSt0M3JKYzBhRkltREg1dGFvVlRIMUlDSkV2YmN6WTYxdmJ1?=
 =?utf-8?B?VldxbWFRelRHbEMzMXc0Nk9SaW1xWHk4WXFoSWxWKzB4Q3RDSzJnNmI1NmVO?=
 =?utf-8?B?S3pmSFVEZlpMZnVxd1pxRU50alAvSXRLU2V0dEFGQVo2eUpqb3RuM2QwaWo3?=
 =?utf-8?B?Z1RoWjhId1VsUnZ5NUQrN3ozbjMxTWdMMW5aN1ViSU1HM0EwVy9lOHYwbDNs?=
 =?utf-8?Q?TB89tKUc7h6QUoluHNy+qqXWr?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035b0938-9114-4ab5-72cc-08dca1484a3f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 01:25:03.7590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mp5fN/tKnm3lbdTq/9JNrySgP/n9B8dX1jlloP7jD3UpvPJkh7iKwgWfgeqAHHD1tlbuXutLGcR2hOVceEGwuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6255
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/11 7:04, Jaegeuk Kim wrote: > On 07/10, Jaegeuk
 Kim wrote: >> Hi Sheng, >> >> Can we have a list of tests to check the expected
 behavior of given >> inject.f2fs followed by fsck.f2fs? Hi, Ja [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [52.101.128.69 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.69 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.69 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sRj4X-00055S-1f
Subject: Re: [f2fs-dev] [RCF PATCH v3 00/10] f2fs-tools: introduce
 inject.f2fs
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/7/11 7:04, Jaegeuk Kim wrote:
> On 07/10, Jaegeuk Kim wrote:
>> Hi Sheng,
>>
>> Can we have a list of tests to check the expected behavior of given
>> inject.f2fs followed by fsck.f2fs?
Hi, Jaegeuk,

Yes, I'm working on the testcases of fsck.f2fs and inject.f2fs. The basic
idea is:
  1. creates an image by mkfs, and prepare some files for injection
  2. inject faults into the image
  3. fsck fixes the image
  4. compare the output with the expected output (which is filtered to remove
     information that changes frequently, like line number or block address).
     Some testcases may requiremounting the image again to check file states.

For some complex testcases where there is no simple way to create the scenario,
we have to prepare the image file (with injected faults) in advance.
  
> 
> And we need this.
> 
> https://lore.kernel.org/linux-f2fs-devel/20240710230319.33025-1-jaegeuk@kernel.org/T/#u
> 
Thanks for the fix.

Thanks,
shengyong
>>
>> Thanks,
>>
>> On 07/04, Sheng Yong wrote:
>>> This patchset introduces a new tool inject.f2fs to modify metadata or
>>> data (directory entry) of f2fs image offline flexibly.
>>>
>>> With inject.f2fs, it is easier to generate a corrupted f2fs image, which
>>> can help verify fsck or reproduce userspace behaviors of some a fault.
>>> If option `--dry-run' is used, nothing really gets changed, and that
>>> could be used to get the value of a specified field.
>>>
>>> inject.f2fs allows injecting some members in sb, cp, nat, sit, ssa, node
>>> and dentry for now. The available members of each part can be listed by
>>> executing command like:
>>>    inject.f2fs --sb 0 --help
>>>
>>>    [...]
>>>    [mb]:
>>>      magic: inject magic number
>>>      s_stop_reason: inject s_stop_reason array selected by --idx <index>
>>>      s_errors: inject s_errors array selected by --idx <index>
>>>      devs.path: inject path in devs array selected by --idx <index> specified by --str <string>
>>>
>>> More injection fields are still work-in-progress. The TODO list includes:
>>>   * sb: features
>>>   * cp: fsync dnodes
>>>   * inode: extent, extra attrs, xattr
>>>   * data: fsverify?
>>>   * other fields which is needed to verify fsck
>>>
>>> v3:
>>>    * patch 3, fix error handling of inject sb->devs.path
>>>    * patch 3, do not ASSERT devs.path when inject is executed
>>>    * patch 3, allow inject to execute if image is umounted unclean
>>>    * patch 9, check whether blkaddr is valid before reading dentry block
>>>    * add is_digits and strtol entptr check when parsing numeric options
>>>
>>> v2:
>>>    * change print format of s_errors
>>>    * add write_raw_cp_blocks to write the first & last cp blocks directly
>>>      to avoid updating ckpt_flags by write_checkpoint
>>>    * call update_block if i_inode_checksum is injected to avoid updating
>>>      i_inode_checksum by update_inode
>>>    * go through all dentry blocks to find the target dir entry
>>>
>>> Examples:
>>>
>>> Inject sb's magic
>>> =================
>>> inject.f2fs --sb 0 --mb magic --val 0x12345 $DEV
>>>
>>> Info: inject sb auto
>>> Info: inject member magic
>>> Info: inject value 74565 : 0x12345
>>> [...]
>>> Info: inject magic of sb 1: 0xf2f52010 -> 0x12345
>>> [update_superblock: 890] Info: Done to update superblock
>>>
>>> Inject cp's cur_data_segno
>>> ==========================
>>> inject.f2fs --cp 0 --mb cur_data_segno --idx 1 --val 0x12345 $DEV
>>>
>>> Info: inject cp pack auto
>>> Info: inject member cur_data_segno
>>> Info: inject slot index 1
>>> Info: inject value 74565 : 0x12345
>>> [...]
>>> Info: inject cur_data_segno[1] of cp 1: 0x4 -> 0x12345
>>> Info: write_checkpoint() cur_cp:1
>>>
>>> Inject nat's ino
>>> ================
>>> inject.f2fs --nat 0 --mb ino --nid $INO --val 0x12345 $DEV
>>>
>>> Info: inject nat pack auto
>>> Info: inject nid 4 : 0x4
>>> Info: inject member ino
>>> Info: inject value 74565 : 0x12345
>>> [...]
>>> Info: inject nat entry ino of nid 4 in pack 1: 4 -> 74565
>>>
>>> Inject ssa's nid
>>> ================
>>> inject.f2fs --ssa --blk $BLK --mb nid --val 0x12345 $DEV
>>>
>>> Info: inject ssa
>>> Info: inject blkaddr 7511 : 0x1d57
>>> Info: inject member nid
>>> Info: inject value 74565 : 0x12345
>>> [...]
>>> Info: auto idx = 343
>>> Info: inject summary entry nid of block 0x1d57: 0x4 -> 0x12345
>>>
>>> Inject inode's i_addr
>>> =====================
>>> inject.f2fs --node --nid $INO --mb i_addr --idx 100 --val 0x12345 $DEV
>>>
>>> Info: inject node
>>> Info: inject nid 4 : 0x4
>>> Info: inject member i_addr
>>> Info: inject slot index 100
>>> Info: inject value 74565 : 0x12345
>>> [...]
>>> Info: inject inode i_addr[100] of nid 4: 0x20864 -> 0x12345
>>>
>>> Inject inode's dentry hash
>>> ==========================
>>> inject.f2fs --dent --nid $INO --mb d_hash --val 0x12345 $DEV
>>>
>>> Info: inject dentry
>>> Info: inject nid 4 : 0x4
>>> Info: inject member d_hash
>>> Info: inject value 74565 : 0x12345
>>> [..]
>>> Info: inject dentry d_hash of nid 4: 0xc77b804e -> 0x12345
>>>
>>> Sheng Yong (10):
>>>    f2fs-tools: export is_digits
>>>    inject.f2fs: introduce inject.f2fs
>>>    inject.f2fs: add sb injection
>>>    inject.f2fs: add cp injection
>>>    inject.f2fs: add nat injection
>>>    inject.f2fs: add sit injection
>>>    inject.f2fs: add ssa injection
>>>    inject.f2fs: add node injection
>>>    inject.f2fs: add dentry injection
>>>    man: add inject.f2fs man page
>>>
>>>   fsck/Makefile.am  |    5 +-
>>>   fsck/fsck.h       |    6 +
>>>   fsck/inject.c     | 1104 +++++++++++++++++++++++++++++++++++++++++++++
>>>   fsck/inject.h     |   41 ++
>>>   fsck/main.c       |   38 +-
>>>   fsck/mount.c      |   30 +-
>>>   include/f2fs_fs.h |    2 +
>>>   man/Makefile.am   |    2 +-
>>>   man/inject.f2fs.8 |  225 +++++++++
>>>   9 files changed, 1447 insertions(+), 6 deletions(-)
>>>   create mode 100644 fsck/inject.c
>>>   create mode 100644 fsck/inject.h
>>>   create mode 100644 man/inject.f2fs.8
>>>
>>> -- 
>>> 2.40.1
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
