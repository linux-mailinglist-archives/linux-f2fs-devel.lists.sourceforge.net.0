Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF129EC1A1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 02:36:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLBe4-0003cF-PX;
	Wed, 11 Dec 2024 01:36:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tLBe3-0003c9-EG
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 01:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3sqXZL8QdIBZpPFrabXX7fkbZv9cvkJRoDRlhD5O5yw=; b=A6kK+Ulb5pArTtK/XMa2L4WA5T
 Zbr5Zcvm71+3VrCfQOte7SmJ32dUFmpi4v3VbutkjyWudJ/gtunDEZ4GgoTuOnCw61ODS5noBQoFx
 fUx0gWqu2TFT4aF1tQtZ9q+ZxQUusayQPEb/l+exyV/Z6kdnz6mPQFcB0PJk1QS39YRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3sqXZL8QdIBZpPFrabXX7fkbZv9cvkJRoDRlhD5O5yw=; b=f+bLa/qd84guc2eSgx26I/2C7m
 ZdPBGkFWPy+9A0OWK1//b1OKa1KkBPKseIyRJrh6uEfV/4wJbY9SjvJ5L1P96j6Sc9U5jxrKMYvgl
 5MzhJ4kUXznOrU53/qU6/vR/dlPWIWoQbm27w8hSd1nusiS/5KD1uBJNP4yvxtyJwmm0=;
Received: from mail-koreacentralazon11013014.outbound.protection.outlook.com
 ([40.107.44.14] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLBe0-0001jV-9k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 01:36:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M68iM6bLuRZhgUUAoqjynvYT35z5+yn/Fm+Y4LhTPGyDbICkNJefW152lfYrXRNfOO7y2OV9jKLcR5mDLcMt+f1lE87pAw27gS6HPUFxV4hH5Elp8EXyOjsbS2UMRyKVnpCgU8Sgx5U8yQRUJbOYcXDqzFOqrCqmBTrrpApEO9cUMh014VOON7ieopC3uecBuoQECIJpQxpoEuUAleDvemGDBueR/Ak48RuaJSY4z9OLBuZGn2utdP6c6fz3Vk5r9f+Uy+dXyGqAgDFUP5tU1CF6Iq3aybEf2+JVdOYk/M4kRgqvEQCdACzf/Cp2qD2i+SNbrIpPG4Qu64RU4FRw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sqXZL8QdIBZpPFrabXX7fkbZv9cvkJRoDRlhD5O5yw=;
 b=h/q39bguoimsPacvX56FLGCOBCxNwza6Cxl6p3d8mpds0fAkUH9xCdUZdES+ORoxi9htMH6Zgc7ElK782xQdKfHvfgjY9Sw5OFzBONbkLXLbbbd5QhOBmICzCi1Vsm523zdmI7m1i1gvOH3tDJy6IC+UpJwjM4Tum05OcQL5QJ1KALlcWT/4OUsAAP8cONSiHnvicXzn91r3qqEnTxgQ7XmUicJQkDslhut+9KSpIwOiG8UazNb7KKS6PbSMuRvp5IaoxbTsa9WgW95cjqpD5mlkv0hiJ8mVBQy9Mqn/U31l9kz6vEgaCQzkhInqERIka1MtCXiboM4iXUu4dTIBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sqXZL8QdIBZpPFrabXX7fkbZv9cvkJRoDRlhD5O5yw=;
 b=hKVn0yRS7JgDQY6w8gOW1dFgQslwiPanlRaf8XzyW85zqBEn4I0oWxZrysGzsUmdyY9tQTkQDAGr+Vw66BHHw9p10BZKa8NeWPsV+dWlC1l0SXRpjMkPyKojnk9kEktXbp+i7WGQA9Yg5aekOkygNw4RVCdtTTU8KJQGl4sETMc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6993.apcprd02.prod.outlook.com (2603:1096:405:29::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 01:35:50 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 01:35:50 +0000
Message-ID: <f9bbd9fe-e530-4574-939f-92e297aaa152@oppo.com>
Date: Wed, 11 Dec 2024 09:35:46 +0800
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org, chao@kernel.org
References: <20241210093402.3747909-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20241210093402.3747909-1-wangzijie1@honor.com>
X-ClientProxiedBy: JH0PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:990:75::9) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: c927e2cc-f042-467b-0e22-08dd198424bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TXhUY09QVk12d2RkblpDRVFqZXFtUGl4dkRhVWdBOGhnVVJxODFhaWQzNUNP?=
 =?utf-8?B?c0tWMWx6a1pwdDl1MFZSalFmSlZzWmVpRk1QNmZTMHpaOEptUjZXZ0I1Y2RX?=
 =?utf-8?B?VGhubnRNN1NPRmNsMGcxa2dTMEVVdzF1L3QyN0RPZkpGMElvNklENzhjUEtJ?=
 =?utf-8?B?ckVOY0xKTVQ4TG5Edys5OXpCUzRlNHg1ZUhvZVA1WDg1OHd3WnF3UUVZWFox?=
 =?utf-8?B?UVpnVmVEdzEzSDNkRWV1eFJIREpmZUFvYTRMNkE1UzN3N3N0enBGZ3BYbFVC?=
 =?utf-8?B?QTJTQTk5aHJwZjA5b3FlKzJkSzR5cTI5WFFhR00wUndJQ0F6YmJ3bVJGbDVU?=
 =?utf-8?B?ZFZXY3ZyYlUvalpuaFhUencvRVM5dXA1UStKMDFMTkVOMnRkLzZBL0ZnWWN6?=
 =?utf-8?B?djMxd0lsKzhDOUdrNUM2UHN3U1B1WTg4QWRETnMwQW5seno1bTk5bXpPTDZF?=
 =?utf-8?B?clBtUklKbyt4Qkk3VVV4SXNha2tDSEdLMFVkUUJYaksyS0VlRzd1VVBpeDln?=
 =?utf-8?B?V0xyZlZEeCtZeVBhSkRJeVlmSkM4OWMxZEpEUnVUZUF3dVRlUExFVUJoNmh0?=
 =?utf-8?B?NENGclYwYWZHbTZMR3VnYTRBTGhuaW95Z0plZTlGQ2NHTTZrVWNjSFRYQk9Q?=
 =?utf-8?B?eHJlekYvNFJDZjRNUHpGZFdQUTd6NTRGS0RaTU9JbDhpeDFxVW1Sb2pZeUhS?=
 =?utf-8?B?TGdiWmlqY1pnS0x3VDI1ZUJDc3Q5WnoyM2lKQndVRUY0djJmdGVGbnQxZTlu?=
 =?utf-8?B?VkUzYmt1eEJ3azVJL1ZnZVNjaVdhR1F5YWIzVlBKem8vaFBlVGVaazdjSm1j?=
 =?utf-8?B?NjkwamVLd2lBdVpMQWYyUTZJazkwb3psYTNPamQ0RS9RTDBjVnZKQm9xalVT?=
 =?utf-8?B?aU9JR3dxRFpxbTJub2JmSm82dlBMNjRSTFFMOHVFUnI0NEZnYWhRT3QzT1RK?=
 =?utf-8?B?ZUdEK2FBQVNabTVEQkJhbGE3b2JjL291eldPSk0wdkhKQ0MwV2s2dnFwOFJQ?=
 =?utf-8?B?UG1ZRVVQNUVqZUlZbDRNM1lPQk40Rm5RMzZxYmNneG1aVjk3anNOdjdIOE90?=
 =?utf-8?B?aFN5bnA0WlNja0xtb0phOEhXVTRKVVdSY3Vza0t6N3dYOUJ6K0JrcmRValQz?=
 =?utf-8?B?Z3dDVmZzZEx4aDhXOE1aRFdYMUpQNTVpOFdhNEE4WkdYTFdFb2ZKZzVRSjBT?=
 =?utf-8?B?dC9wWTRsemhlRjd1ZTQ0T0tkVlgrWkR1T3VQcGtCSjJZL24zTTdlYnNhREZa?=
 =?utf-8?B?VS9rYlBnOFhRWjRVOTQrcDIrNjkvTTRmUGlmZ2FnM3paaVJmVCtKMXhhT0pI?=
 =?utf-8?B?VHhhdUxpWk1MVDVNT2ZTbUd3ODVvWDJ1KzhQVS9pbFAwTWNiRG82U01QSU5o?=
 =?utf-8?B?RDQ1K0xOV2llVFg2TTFza1hpeElweWJjdFN6QzVRZWlIcnA4SVFNTHVOU3d4?=
 =?utf-8?B?ZUROVU8xOUw4SzVDbjExa1pzYWtObUlxaWtKVkh5bm9xc3JYVDdUd2pGYTMz?=
 =?utf-8?B?ejRnSnRaVll6ajNabCtVUlN0dTFQSTJJeGpPaTUxOWorS1B6OHZDRnFXamFH?=
 =?utf-8?B?UStIbWF4SVJ6bnRDcXF2VjNaaWZuYTJXMkJVZGkvbnNjOG9TRmM3c0N0NVZs?=
 =?utf-8?B?NS9jS0MrVElQTm41ajVqbnpzUk1GMDFlanUrS1FESkJDa05ZZmlCODd3eXlR?=
 =?utf-8?B?RjFKRGROOHBxTlEwT2N0bFRPWTF6UTA0UXZMbEVFQ2lmU09nd1ZTdm1WRGN2?=
 =?utf-8?B?djZxeFVTVzk5aG1IdUVabWZERHVzd2VUZUlRcmVNMDJkMHVEMmVHWUVhRU1R?=
 =?utf-8?B?Sm92SE9ZbysyWXhrL2dqUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aG5pQkpxTUt5UUhGZlFRVWF3b01IS250TkdZbEVCY20yOU5Pa2VZSmVJNmR1?=
 =?utf-8?B?Y0F5SlkvTGhXeGVtLysvcHdlb2FQcGZSRHlmV3A4L3cyNUYwQkc4K2l5SkQr?=
 =?utf-8?B?REhtNmlNVUVwTERoQkhOaldPVlBjcXNJZjgrYTlicWhjU0FuL3Jwek5TNVly?=
 =?utf-8?B?VXZxQ2E1OXhJb3pvV29Kem1BbVJNd3RNUTc4clBpbEJWYllQM0RkYURtbTNx?=
 =?utf-8?B?Y2ZCRXk4THZsMzJISk5wNFM4V1NBK3hpWlo3dFRjcll1VXZndkVnamxEWUZ0?=
 =?utf-8?B?aHRzTlhXNUdWSkdtci9OaVF1bjAxK0xBQnZxKzlialRaRmhEcXN1ejR6bzBo?=
 =?utf-8?B?WlF1WkJsSStQQm5iNktQc3h2RHNkVWVvQWN4eU0vZlg3dXgzejN2d1hYVWZr?=
 =?utf-8?B?c0J6eXovN1hrRXhDbDVBRFZzSDRxYW8xY2I5L1FIbjJCbmpxQ1BXYTNOK2NQ?=
 =?utf-8?B?bE5tYXFhZmNBZ1FTV1M4NmczeHVBQzd5ekNWcWhaUEEyUXV6dm1XOEhMMlZR?=
 =?utf-8?B?MmdST3pTZytzZ1hlT2hubko4bzdJanJhRWxSQlROZnRRS3VJTVIyZzQwV2VR?=
 =?utf-8?B?ZWExaVdBbE9uajgrYWV3YnYyVHBLaEUyNUNiMEdlcWJpMmdoQUI2N3RhYXE5?=
 =?utf-8?B?ZWhzd0JSdmxUNFZhTmQzNndPZUFKZ21NaXRGdnRrYUZmV2VrMlp2d0ZQRGwx?=
 =?utf-8?B?dTk1WG1GdVdYbk4zWHpKRU5SU0M3d3BtT21WZCtjOW5JdWRmSVhhZ0lGWEp6?=
 =?utf-8?B?QUxTRlNOMjdudTExTWdRQTE2cm13NVg0NEovUUVjRlRNNEVEOEdFTUtqVTJB?=
 =?utf-8?B?ZHlleDZlbHVHV09WREo3blJxWS9ndU5ya05jV3ZUU3dFZHB4NHlNdzU0TGFO?=
 =?utf-8?B?clBqaEpCYzhzQkNaOU1VZ2ZqNU5WSVIrdEVHeFhNd3l1ZWpaU2ZvM1F1L0p4?=
 =?utf-8?B?ZUV1U3hTR0xxSVQvNlYwd1pMcmIzMmhSOTRIVnpVd1h2a2hWSEdhNUhKUkFS?=
 =?utf-8?B?bXhWZlRndUFxbkNtL25DdjJnMlBMajB4d2pKc1psbXBxYk1waHFBWVo1OTVl?=
 =?utf-8?B?ZzRUSlhHVldpZFJsaUN0VTBJUmxpUUtycUt1L0U1M0xYSUNXeFI2ODZITXhD?=
 =?utf-8?B?MzRmWXVnNFprdnczaEpRZkxyNEhkVzRMVEhwVFZKYy80QnROQVZXeXNHUTc0?=
 =?utf-8?B?cFMrb0toNTViUFBRanBpcGZwejMzd3RlUHlESXVoZ0oyVXc0WitiZmFyT0oz?=
 =?utf-8?B?RFZjZGVuT1RKWXJYS0hkWHVkM2FhY2YvaHdmd0ZPY2dqeVJ5b3ppMERUTUxF?=
 =?utf-8?B?ZE9VOWRHQm5udlBPdDBuSFBWdTNVYklHdENQNEFjSW9GdEZIcUNTZUF1Uk95?=
 =?utf-8?B?YmdaeGZ6LzVQWG9vOEU0MU1jMmVXOXNoSDhmL25UcW5jQkhaUVlRUGVQK25r?=
 =?utf-8?B?UnBYTC8wSzRDWkd2RFR5NEpKOFZWR2lRdm5wak80eGdveTJoTjljYWNWSFV2?=
 =?utf-8?B?Q2IvVnZncDR3OGg2cWtESzdJWG40eGZNNVNySGwyQ1NTZm4wNFIyUjhUNnVt?=
 =?utf-8?B?Z292eC9QZXlNZU1SMTNjSDcxb05BMEdSTlU0V211UGloM0t3ZUorNWV4emI4?=
 =?utf-8?B?R1p5NUNIU0dpNnozck1aRjMzRU8rRFIzUGlKZjI2MU5pRGg4K2pERGY3ZmJY?=
 =?utf-8?B?dXVHNGlTRVlHc21nNVRuT2NNbkdXdzhidHdNd1VTYzlyQm1YeUlzNUFKNnJ4?=
 =?utf-8?B?SURKVkFmeEE3N2Vjd0VaODVuWUJIYXFySUdjeGV6SCtWdTcvWSt4Mm9CKzUy?=
 =?utf-8?B?U1piMk5ieGVjc0xYM2pKc2R0bVRkVGhRM29SQUorY1p2d3QrOWc4R2dOZmFB?=
 =?utf-8?B?ZHJWd0NNMUY1QkNEbVJkWHQ2UVA3TlNVV1RTSjVVVTZsYXg4WnlFTVNmK1F1?=
 =?utf-8?B?OXErT3VoTzF4ZEdDdTE0WkxIQ01SMElUNG5BcmlFM0t5TUM3dHo0TEhwYXZo?=
 =?utf-8?B?UWJReHhRTzNHc2RmUkpMSGd4WWRPTUxmbGZGK0hMa3dLeTVqODZrV1pwY3gw?=
 =?utf-8?B?L21ZSHZYZXJab1M0RHVMeFozaTl3RGZueng4Z0VnRU9JanRGNGVwSk0wVXdt?=
 =?utf-8?Q?2otm4DEFNuf5EB1ijYqmxnbUb?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c927e2cc-f042-467b-0e22-08dd198424bc
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 01:35:50.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LzRkXjVWSGx9I2lEXcjQefD0fLQnyb0N6XLhksqgsKNmrOnwP99JcjZwG9QGNKGDnJTC71Z076PS+6UqSu36g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6993
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/10 17:34,
 wangzijie wrote: [...] > diff --git a/fsck/xattr.c
 b/fsck/xattr.c > index 6373c06..3abdcd8 100644 > --- a/fsck/xattr.c > +++
 b/fsck/xattr.c > @@ -18,7 +18,7 @@ > #include "xattr.h [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.44.14 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.44.14 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.14 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tLBe0-0001jV-9k
Subject: Re: [f2fs-dev] [PATCH v2] f2fs-tools: Check and fix inline xattr
 inplace
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



On 2024/12/10 17:34, wangzijie wrote:
[...]
> diff --git a/fsck/xattr.c b/fsck/xattr.c
> index 6373c06..3abdcd8 100644
> --- a/fsck/xattr.c
> +++ b/fsck/xattr.c
> @@ -18,7 +18,7 @@
>   #include "xattr.h"
>   
>   void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
> -			bool sanity_check)
> +			bool sanity_check, bool may_alloc_xnid)
>   {
>   	struct f2fs_xattr_header *header;
>   	void *txattr_addr;
> @@ -30,6 +30,9 @@ void *read_all_xattrs(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
>   			return NULL;
>   	}
>   
> +	if (!xnid && !may_alloc_xnid)
> +		return inline_xattr_addr(&inode->i);
Hi, zijie,

It cannot return directly, because the header should be checked and set at
the end of this function.
> +
>   	txattr_addr = calloc(inline_size + F2FS_BLKSIZE, 1);
>   	ASSERT(txattr_addr);
>   
> @@ -97,7 +100,8 @@ void write_all_xattrs(struct f2fs_sb_info *sbi,
>   	bool xattrblk_alloced = false;
>   	struct seg_entry *se;
>   
> -	memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
> +	if (inline_xattr_addr(&inode->i) != txattr_addr)
> +		memcpy(inline_xattr_addr(&inode->i), txattr_addr, inline_size);
>   
>   	if (hsize <= inline_size)
>   		return;
> @@ -137,6 +141,16 @@ free_xattr_node:
>   	ASSERT(ret >= 0);
>   }
>   
> +/*
> + * Different address between inline_xattr and txattr_addr means
> + * we newly allocate xattr buffer in read_all_xattrs, free it
> + */
> +void free_xattrs(struct f2fs_node *inode, void *txattr_addr)
> +{
> +	if (inline_xattr_addr(&inode->i) != txattr_addr)
> +		free(txattr_addr);
> +}
> +
>   int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *name,
>   		const void *value, size_t size, int flags)
>   {
> @@ -174,7 +188,7 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>   	ret = dev_read_block(inode, ni.blk_addr);
>   	ASSERT(ret >= 0);
>   
> -	base_addr = read_all_xattrs(sbi, inode, true);
> +	base_addr = read_all_xattrs(sbi, inode, true, true);

Oops, this is a special case. My bad for not thinking it through earlier.
Personally, I am not a fan of adding a new `may_alloc_nid' parameter (btw,
I think something like `for_create' would make more sense), but I cannot
find an appropriate way to get rid of it :-(
Otherwise, it looks good to me.

thanks,
shengyong
>   	ASSERT(base_addr);
>   
>   	last_base_addr = (void *)base_addr + XATTR_SIZE(&inode->i);
> @@ -257,8 +271,8 @@ int f2fs_setxattr(struct f2fs_sb_info *sbi, nid_t ino, int index, const char *na
>   	/* inode need update */
>   	ASSERT(update_inode(sbi, inode, &ni.blk_addr) >= 0);
>   exit:
> +	free_xattrs(inode, base_addr);
>   	free(inode);
> -	free(base_addr);
>   	return error;
>   }
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
