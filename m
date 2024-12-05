Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B91C9E54C5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Dec 2024 13:00:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJAX0-0002y7-Lc;
	Thu, 05 Dec 2024 12:00:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tJAWy-0002xz-UI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 12:00:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7DFONczhoE9iuKEAOIvoxcexh8KyhF2OnIammbOs0g=; b=eD7vSBt+ynETDXlJTt8PQHOdhz
 ZZHvx0Y0ksEkhM7omXUYw4LUikcatcok+TntPmbjlKmReoCt1FbIdb9uAzbZ+/DZG5o3nAG2J5PKk
 yBBxRQpj2O1+BYxrtQpjO4NKqEnPIjKoQCyjhXXlYbcEO68bvnXNVzEJQhlgI333U0bk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h7DFONczhoE9iuKEAOIvoxcexh8KyhF2OnIammbOs0g=; b=FFtFHplHiJ+jNMMJSx1prWjrdT
 5YygO6Kk6oTSNVIxm02OIzGhEP4K2siJCx+1HMiu52cdrZ1JGnG1ytVLafztgew0LzC/ifaP4ggb1
 SfzVvCfw45vQEQ3eKZ/g4JSJ9KROLojkVv16cdtX+pEXYY9QTUXkVOozzfIj2uhiH23w=;
Received: from mail-tyzapc01on2089.outbound.protection.outlook.com
 ([40.107.117.89] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tJAWw-0007mJ-VL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Dec 2024 12:00:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzVZwGKiNCox/TdmRBABCc6rXzqfU7LRFaDFUH3UUeSvIPgMsbZTyZF+Kb4ZXUeNLE71ngCP5J8Xrn92fuihsrvZS+yrfSM91Dl2PvCoDv8Uv6wnuqs44upD4l7GLvIYtnFNZGlzOWsCMvOwGI5GwSCzkcZLtClCHCqEzRsU4N0KDGgvaf1VCHjGHqHgPlsyo48SBe9JgYmlkhoVg9EvAtVTxwwEILbh6DN7XyybLNnTi+yiCmmTWR1ANrYpT+ADuWcLuElxlTSqZdPc8a+VQimUG22CL+KAulrU2+3dmFuX5sqGPFDKO5/YhQ9iIgz5ETWK42mKhE0jyFJ4EQi8tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7DFONczhoE9iuKEAOIvoxcexh8KyhF2OnIammbOs0g=;
 b=Jy1b/GR0Cb3Lo0Ox3OjK/vz/GTB3M/jVjUZV11k26qaGOQ7CiWe2GmifsvYtvOYIMbw4a7dEGMcXuK3WHxdXydwDF/T4oQI1Ga2wcp+WoYCPgRs/VBRnTKfhNy5fsalgshSsLmTuX2m+rDyoSncJRx0Vw5U1kxQr1gm4U16jRKIryTJ3QnuL6qzzaWGqaVRg8iCwUZt56kw0lkwMq756yZmrSqO7oqmekKR1JurS17Sld1uU/e2ZQ/ZHZ9X6hYNy9wt3Qf2Dnx+QBBcnopnuAFWwJ0xxGzGuYawv982ZEZXW8ufjmQT4stLGB9DIT4CFROyAx9LjZhBS+5qpWgfXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7DFONczhoE9iuKEAOIvoxcexh8KyhF2OnIammbOs0g=;
 b=XVG8NQT+KSCLrPldiuYdvKnmCG9zxQ7KdLrtDqkLiDs/VrUczvPoXTI7yuTw8iuTnPDj+cBAZk+Jydq0+xT0RgseLeXaycpckR1Bp6qvzH3Ea1lITSTwG8iJ32YktCJBb8nqHU+gOhEXWosrw8aqL1d4qBH/Nt0xQIbTqxC4anA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB6095.apcprd02.prod.outlook.com (2603:1096:101:96::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.10; Thu, 5 Dec
 2024 12:00:11 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 12:00:11 +0000
Message-ID: <7ba0f67f-20bc-4097-9372-7feb45a6cefb@oppo.com>
Date: Thu, 5 Dec 2024 20:00:07 +0800
User-Agent: Mozilla Thunderbird
To: Lu Pang <panglu2022@gmail.com>, chao@kernel.org
References: <20241205080109.43552-1-panglu2022@gmail.com>
Content-Language: en-US
In-Reply-To: <20241205080109.43552-1-panglu2022@gmail.com>
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 225e829a-bcd7-4e07-f4c2-08dd15245ef6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWs4QjNFSXF4czJhNy8yTjVhVXRjNENIMW9YZkNBSk5MYmNPZHlTakNtZHZO?=
 =?utf-8?B?a0lxdUdZenNobWVLamFtanAzMENhaTAxUTVTcUppRDVyVjZnKzl5Z2YxemMw?=
 =?utf-8?B?UmVvRUV3V3pycGs5OTU4Z05NckdwTjhtTVVITFZMWUZ2R1Fmb1dtMy9vOURt?=
 =?utf-8?B?RW5hb0x0WElIMlU0VUsvdmRyU2tIbnpTdU5IdHI1RDU5N1BjZ1FIR2UrZGhm?=
 =?utf-8?B?NFhHREJ0NjA5QXRwcFM0bnFhRFlFMVhoam1vbFJZWWI4b0M5bXh2bisrL1Mz?=
 =?utf-8?B?dGQrVU44YytjL2xHdk94M2ZZTSs5RzhwQ3VhWjI1QkIrNVdiaGZQbU1jZXIw?=
 =?utf-8?B?T3h5aU1zcXpvQWt6aHFlRmRGVEpFd3FTSDNFYW9KV09KZWZkSmdwWEtYT20x?=
 =?utf-8?B?cVJkVjdrV0JsaWh5UmRjNFpnWUN6cE1JeStoemQ5OG1rUTRpNUQva0NTMk1O?=
 =?utf-8?B?M2JKK0Q4d0pkREMwYnZBTE85Q0xKcStYaUZuZlVYa2ZiU0ZsdWZrbzc4aWNX?=
 =?utf-8?B?aG5yS3lsaUppaEtMWmlaZDBOWXVvVXpoTXBiazJZMEdscVhhU1JCR3h4L3Vl?=
 =?utf-8?B?R2RybzNHY1pSQk82dWRwZmFocmVoR09OVnBjcEl5bjlqQnQ3ckxoQVlWMTFZ?=
 =?utf-8?B?YnRTM2FSUmxZeDlnYXorZG9KYXlYb2lIRVkza3JVeEFVWStvcCtyNEoyUFRx?=
 =?utf-8?B?MHVNeEgwcEhaT3ViUzlsZ1l2V0dHS0NlSmhsbWEydnNIV3kzNjZEQjF4Ly96?=
 =?utf-8?B?R3p3bWYrVDVmbzRXdkRzUko1UzArem95ZzNCWURiWkF2b1FmSVhVRWc3YTMr?=
 =?utf-8?B?WVdHVkhxMlBXQWk3RjJNdlE4K28zeEZnQXpYb0pLcDhDaDY2bTMwY0pMMG1V?=
 =?utf-8?B?MjZ5cHVnRFNPdkkrcmdnbWczUkpDcCthcnZ2ZHF2U2w0V3ZPZFZKeW81SkEy?=
 =?utf-8?B?a01OUkwyQkRiZ2lLU0Z4YXRtb3puWWRWSWFSTGxTeFhIb1o3ckMwR3p2cy9a?=
 =?utf-8?B?bkZwWkpGbVhPaUY5dlluWHlCV0NCZ2dmbWVlK1FyMVFnZTE4UklZOVZqWHFF?=
 =?utf-8?B?NUd4bEg4TlRmTityT2pPc0hzUVFPQ2ZuVlpWSnZtdDZTWWRmaUEveW1ubmpz?=
 =?utf-8?B?eENYQ0J2b2xLNWtJYmxGSWlrYUNEcU4xOVNuSEFralcrUlZpRFRaTmZRa0FP?=
 =?utf-8?B?cG5jMnVNUy9xZjRUZVJoaUU2UWtYblV3eGVsTGtacUZ6UncrNWhKa1Uza2px?=
 =?utf-8?B?UW04d0hBc2NGdk93Nlp2TElPTUg4QnFqZWRETElPODgvajA5RG9iQ1FVU3Bl?=
 =?utf-8?B?TXdwb2VvRkRzUEUrRlZEQUNJeUI5U0JOS2hUWm9NeCswbnl0cWVaMXBHV3h3?=
 =?utf-8?B?WWxhOENaeldzUjRiSUljeWQ2b2FTQWErZm9jb3FrRFJjNG55UVpCYVJrT1Jp?=
 =?utf-8?B?ZHI1YmxISE9MbW0rdDZhZVI3cm5oaHRaa2YwTGduaXpsZ3hwV3NucTVXRXlo?=
 =?utf-8?B?bXJJR2F2RExWb2J3SXdLRktTZEdwUWJlVFBEbW11OXd3cjl6MVBtRStpeUdu?=
 =?utf-8?B?OWo4VzdJWmMzQ3A4b2cvdVc1TzFwakV1aDd4Z3FUZHRkQXh2UElXWFNUZFAx?=
 =?utf-8?B?WUprTlRMb0xPU0pXUWdScVBpRDZJSkZTMk9vYjlZaFFLNG5CR2lITGpxTW9Z?=
 =?utf-8?B?cDF5Qzc2MDRyN21PT1NmcG1WRkZ4Szl2TjhYb0UwdGxKTlJRenpJMXlGcnBO?=
 =?utf-8?B?OEhMV1NQUndzZDltZ0dEaGVvSmFZMElmOGNJMkFLWVRSTWJublBUVFB2MUpX?=
 =?utf-8?B?d2xmaWhvS1VtRG50b2w1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmhnY0NKaHF4UHFkeXdTc0tNL3NaSHkxMCt1c1FVUlUySm1NR1FibXI2WHI4?=
 =?utf-8?B?K2tKMVhWa2NlZkRtaXFMRStUbkRpS21vbVlQWlFLMWJQcnFjSmw2R0NDcVRw?=
 =?utf-8?B?WG5iTnloYjYxcWJDT1J3NFhmSnllTmFGMWdCbUh5RFlHNUc2OXpDY3NqWE5W?=
 =?utf-8?B?SDc3S09PSGlldXU3ZEhWbnBMVlFURkY2VEdLcURidnZnMUF4R0N4R0QvSjJt?=
 =?utf-8?B?THV3d0NudEdwUjZiTDJ4Q1hjblo4azRnZ1FhTGl5cll6a29oQW9oNUhPQVhl?=
 =?utf-8?B?WTZmWm9ZOGw2WnZLTDVLdm1ScCs2Mjh5NS9wQmozeXZiNmFhejBlTktzYjVP?=
 =?utf-8?B?RW1zSHZBMlNyTHdwWDFod1ltdXVuZ2lHZEJkK0JxUXc5QndualorM2hNTGhl?=
 =?utf-8?B?eHd6ZTcvWVZXeXo0RXVkYTRUbURKZGd0QnUyZUFTWDRjMDdoV0NsYytLMW5l?=
 =?utf-8?B?OGo5Q0xPTEJPai85TFNtMGsxMkJsR202bERYTmM1U3pMOVl1TEV1NEtiQUhh?=
 =?utf-8?B?TjlhYkNvR1NFcnptZS9uQ1BFU2l4TTVEYXBuZTI2REpzb3I0UmxHR08rb0xj?=
 =?utf-8?B?VHEzY29oL2JkN05JdGZTSStkakhvN0xnM2dwQytkeXE2OW53WG9Ed2tmZlZV?=
 =?utf-8?B?TFNUZUtHM1o0NGVhYWhOcVhNcGxjSEZxSTNFV0hXZTdBYXQ1RGpGdnhZRU9z?=
 =?utf-8?B?STVsNkI3M0FvMTlaanJFN05qUVBLeE9qaGtPTjhjUHIwR0NrZFI3QWhFemY5?=
 =?utf-8?B?WWNQcWdwbXZub3RrcTJFc2dFZXhLL3BTb1AzelQ2RG9mdnpROUh1MXBSQ3pp?=
 =?utf-8?B?ek1aMlRCNmRndHNuc3B1UWZ1ZTRIV0ZGdFVRU1NIM3IrQWNzd0xJTC9UUGVG?=
 =?utf-8?B?Z0drcnpIUDNzZm5FMThXYlY0KzNIdmIrR1hEaC9LZHpHd09md3hsZlFKaDJo?=
 =?utf-8?B?Y0h6MDhHLzcxTTRXWDNIRzJ4dnVpNlZHSVhEejh2TjQzeVB3UmZSdkd5ays2?=
 =?utf-8?B?YS8yZE5SN3VpOUZZWHpSNWtJMG9BQ21JUGFzMUtNczQ0dm9WVjkxYk14SDBQ?=
 =?utf-8?B?SjllMXZ5b2J4KzRLWU85LzlLNkhBZWh5N0liZDlHVXN2T0x4SVNTZHIzVmNN?=
 =?utf-8?B?N2dBR29iUWdmaWhZWkM4RkF6V2dlVTdSZURja3M2MjZERUpISGowSnVVL01w?=
 =?utf-8?B?dkgvTS9kUmtJaVB1NlIyZzdNNzZybmlvV0hXdzVZa2gyWFU0WnY5ZnpWK3Nv?=
 =?utf-8?B?QVh6S1h4eWl1aXg4RHlNR21pUXc5a0hheEhzYy8raHdKRjdUOFRMbzJTYk9n?=
 =?utf-8?B?MFFFMi82a05vWUttVExvMHptM3VYakM5d0ZvV1d5YzBvbmtBRVZFd1E2MWZr?=
 =?utf-8?B?YVJkaGVRYi82MFhiS2xpV0dQZEpxckQ1US9KRzRwRjJrc1J3QnFvdmU0ZG95?=
 =?utf-8?B?dUtvdjc4MkNTampjb28ydm9XcDY1QnNJanhwUS9Fc3ovSkszU1owcnptVG5V?=
 =?utf-8?B?a2RIZFYzTFhYOFE5WmJiY3JiNkc0d2tmMkVwN2tMWVlhTnlJcWE3VzJrYjRT?=
 =?utf-8?B?SlRWN0JQbmVqSlVwWUdseU1qQXplc29ZRyt6cFROaWRPM0RScVRweHI0dWpR?=
 =?utf-8?B?Z1FBSG5Zb21zNmI0QllrVklyYWwrdjRNdG9wNTdtRXdEOENyQ0tsNm80TTRw?=
 =?utf-8?B?cnBYeG5ENzlSNjZ2KzVuQXF1MWs4c3RwbUlhU0J4RXdzNnkxWXJ3czcxNEo2?=
 =?utf-8?B?U3lva25WbXliWGFYWXNXdjV1cTUwUFJ4NEZOWnQ2bm4vU0tVbFMwY3RRaVpG?=
 =?utf-8?B?K3VNRXVzVVZlYk5GbkRWSmtaQjhvNGtTSzJueEdTY3pNSHBWM0JnWG5tbWsr?=
 =?utf-8?B?Z2xpMDJXRUE5cEhZaU1JdnNrYnBxTE5XVXY0ZGpoUjNVL050TUV1MEowTnlH?=
 =?utf-8?B?bExXUDlHby83czduRHZ1VXFROTJvVTQzNnoxYityemdWMERSVVJsTEUzQ2FY?=
 =?utf-8?B?c2JqdHFHeXhYK1JtZGcrQk9hSERFbHM0Wng0SVI1NDhvUTBjY1lVWitoUnRz?=
 =?utf-8?B?VWpNV3dJQUFiVW85bCtBMXBzZHVUUDNqT3ZjZmUwbFhHNVh5a3hrQUNJRnVG?=
 =?utf-8?Q?YYIa/apjeVKkRDVrug2bMxcb4?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225e829a-bcd7-4e07-f4c2-08dd15245ef6
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 12:00:11.5140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPgSDsDIGfrDqL7fH7OF+onpsiNJhPxxHgSjan0uvbzCoW7sFmh56ZoSzgFk8aTqe8ibvkGvhb9FPV1IMT4a7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6095
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/12/5 16:01,
 Lu Pang wrote: > Most of read() and write()
 are performed with lseek(), > combining two operations into one can slightly
 improve the performance. Hi, Lu Pang, It seems that both pread and pwrite
 are not available on windows. However, (I think) windows targets are needed
 for Windows Android SDK. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.89 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.89 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.89 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.89 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tJAWw-0007mJ-VL
Subject: Re: [f2fs-dev] [PATCH] libf2fs_io: change lseek & read/write to
 pread/pwrite
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2024/12/5 16:01, Lu Pang wrote:
> Most of read() and write() are performed with lseek(),
> combining two operations into one can slightly improve the performance.
Hi, Lu Pang,

It seems that both pread and pwrite are not available on windows. However,
(I think) windows targets are needed for Windows Android SDK.

thanks,
shengyong
> 
> Signed-off-by: Lu Pang <panglu2022@gmail.com>
> ---
>   lib/libf2fs_io.c | 22 +++++-----------------
>   1 file changed, 5 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
> index 520ae03..6388ace 100644
> --- a/lib/libf2fs_io.c
> +++ b/lib/libf2fs_io.c
> @@ -279,11 +279,7 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
>   	if (fd < 0)
>   		return fd;
>   
> -	if (lseek(fd, offset, SEEK_SET) < 0) {
> -		MSG(0, "\n lseek fail.\n");
> -		return -1;
> -	}
> -	if (read(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE) < 0) {
> +	if (pread(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE, (off_t)offset) < 0) {
>   		MSG(0, "\n read() fail.\n");
>   		return -1;
>   	}
> @@ -393,9 +389,7 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
>   {
>   	if (c.sparse_mode)
>   		return 0;
> -	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
> -	if (read(c.kd, buf, len) < 0)
> +	if (pread(c.kd, buf, len, (off_t)offset) < 0)
>   		return -1;
>   	return 0;
>   }
> @@ -535,9 +529,7 @@ int dev_read(void *buf, __u64 offset, size_t len)
>   	fd = __get_device_fd(&offset);
>   	if (fd < 0)
>   		return fd;
> -	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
> -	if (read(fd, buf, len) < 0)
> +	if (pread(fd, buf, len, (off_t)offset) < 0)
>   		return -1;
>   	return 0;
>   }
> @@ -615,8 +607,6 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>   	if (fd < 0)
>   		return fd;
>   
> -	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
>   
>   #if ! defined(__MINGW32__)
>   	if (c.need_whint && (c.whint != whint)) {
> @@ -629,7 +619,7 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
>   	}
>   #endif
>   
> -	if (write(fd, buf, len) < 0)
> +	if (pwrite(fd, buf, len, (off_t)offset) < 0)
>   		return -1;
>   
>   	c.need_fsync = true;
> @@ -663,9 +653,7 @@ int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
>   
>   int dev_write_dump(void *buf, __u64 offset, size_t len)
>   {
> -	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
> -		return -1;
> -	if (write(c.dump_fd, buf, len) < 0)
> +	if (pwrite(c.dump_fd, buf, len, (off_t)offset) < 0)
>   		return -1;
>   	return 0;
>   }



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
