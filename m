Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D81064C4039
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Feb 2022 09:38:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nNW7j-0000Ye-BS; Fri, 25 Feb 2022 08:38:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao.yu@oppo.com>) id 1nNW7g-0000YY-Ag
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 08:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A4bZ2bsKvbfTAnsbMgcaeap9AP1VFPE4Inu8kttsLqw=; b=k6g6D/dPHPR2r51lytwD5YqUkH
 x+7uC3/XUdvDbRHHzKuLoG+jpx3gvjsPrpFOnl490V+oGdPOemEp4ohK6WX5wM1ScaxPf/mUXPkWP
 a6q3UbCUmKZDJumgMCIE0Vbk+EES4Il7OdTV3TWS9Bwu1e0s/83dmrnE1pr4hRBFinXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A4bZ2bsKvbfTAnsbMgcaeap9AP1VFPE4Inu8kttsLqw=; b=l5YZjZuI7UDvTSjRZJu4lCOr2l
 3Nd/aOKXd0rS7GyJfwUbFUpBOMR9ms8EPdJjE5QH4/DqWFeXrz1ytR1+fQDU4CDkDhXfHGaL9iFD6
 BCE5dw+3OSvMr12Qz698SliWnpjosFuomuOIvj2qeFVomd1i1xl+o67k7DhXtgw7byIU=;
Received: from mail-sgaapc01on2085.outbound.protection.outlook.com
 ([40.107.215.85] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nNW7d-00EehR-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Feb 2022 08:38:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jHSOQq32xAxcwdgyYMNJjKXtQtD6kkkldzNbthHClwHGXiCq3ak/8wmOr0p4DFOY4+qf8pnzCAfjXSItPT7KfoQfZMj5SPIZhkWQP2p5lxQMWMYDY0dyW6zsKZUQPKUHsS2ASHQs+Ltc/Yrj4BvuDRCPDrqzjjnvyKOczA5+GXqtZ/WQbfKW+j4rBYj1PgawbvBxeaXWYcBVEoN+D4nDrgNcT3A7s+Tn2maHeAgWZN591K34mTFcKf6AY/UsTGWqkItLd6CvnZoCpBsJeZ4VfIg+BCG9phkKhergm+3cH6lBTLhS1YMdSkOBidJwS1RMElqg15Yo255xu4x7xjg8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A4bZ2bsKvbfTAnsbMgcaeap9AP1VFPE4Inu8kttsLqw=;
 b=e1DNm7AFSzKDrIeGzG/uKndFNSON5V4dD3eYgwnXv9hu75kFlzBqWNyGkQkZwtVhLPCS/RxCFHwI07oeVAp6EFwfz05L2f37Ek136q985jkLifE4TWEqkwDVRkurmfGP3crudKJeSTiamO1ktLgCfTxd8i9VRIVUVB1QxrdPKcZkLR60rb6VyDOOcUj3RTjIvVCap661gP+yQgzP4Y+y7Cc67StCEROtN9IjS4XP+pXJiEBqSpco8P8Umuxvanu/6Vy9NsavKwxHWroqkzkd6XeC4A69dwQoxmZdsikhsqBuQzzQBIxkFn54tCt2xF5jdylTtylCemyrTA1wjDh06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A4bZ2bsKvbfTAnsbMgcaeap9AP1VFPE4Inu8kttsLqw=;
 b=qtDnrOx62X6UwQgc2OYBrH052qrItv7dIoVmoiaOWDkhkQVcCUbx3oArGfXKGhlyZNe2h3CR252W9NnEnJS2rO400HKLNalA0EknQJnRAzKuMT3r0gDa/imCAUGfOJj5F8QkmjdSrDbeWewNE1n2YUaxcEnzmHllhSSVBlak0X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com (2603:1096:404:4f::13)
 by SG2PR02MB2955.apcprd02.prod.outlook.com (2603:1096:4:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 08:38:33 +0000
Received: from TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::cc04:c674:b67b:baac]) by TY2PR02MB3165.apcprd02.prod.outlook.com
 ([fe80::cc04:c674:b67b:baac%6]) with mapi id 15.20.5017.024; Fri, 25 Feb 2022
 08:38:32 +0000
Message-ID: <1c1fe250-09ab-d8f1-40bb-b0ef382b2782@oppo.com>
Date: Fri, 25 Feb 2022 16:38:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Content-Language: en-US
To: yebin <yebin10@huawei.com>
References: <20220211093527.3335518-1-yebin10@huawei.com>
 <621891D5.2070800@huawei.com>
In-Reply-To: <621891D5.2070800@huawei.com>
X-ClientProxiedBy: HK0PR03CA0106.apcprd03.prod.outlook.com
 (2603:1096:203:b0::22) To TY2PR02MB3165.apcprd02.prod.outlook.com
 (2603:1096:404:4f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d9758d-c1bc-4f6b-fa54-08d9f83a349f
X-MS-TrafficTypeDiagnostic: SG2PR02MB2955:EE_
X-Microsoft-Antispam-PRVS: <SG2PR02MB29551C8F2F1FE4A1E1460AFC923E9@SG2PR02MB2955.apcprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6VgoP0QI2aqS95WJBHA5Y91+YdXuuG/NxVeKRhKqHrs6S3Mipio7xWs+C/igVWx7Rwi0ob3RXTEK/B5MBvxyQyaYPCPjsWA9iQW3rnLJ83u8Gd+5BqLeQgjPkAl3SXIuL0CUmmbw6Yt44oGVAA70BYTjPLwUzvEXYXZCxrkKdrVUZOYr+tzdxVrm72ZQB4vvueYIMnPO9CF3Bkcb/XRDMGu1hCjkSBGrigPKM1alOxV5qd4RnlLTlhlyj0c4VaFuZwCslCIuOVATAOqDArm1XSffyqOIo/h9J+8MUUujvry9h2g3YGOGNOSJ79d4dZ9bu6Ty413DOc3vJmWNxRAnxCLA9qOlNNjOALQI7jA5fdJJwyhqNwmyHAq0G/A7Z00wWFSdbeQiFfZ279TGTxvUA2RqumExrpo5Nm/DqyRAGFL5/6jxbYEiVbg/EE07QjsQv4W/cd3L/gvqBC45h9MxfcgDLtWzqPAVMppuxiZI/xF0pYMn4u9nWEBlP411mDRp7nr8Ljk1JT6a7kZ7wbJpg7qH7dNUq5km3W/82finf1MJpDOAZ3DWqgGl4YTs6X2PTFx1eEM0C7mKhIO7Q8tBvibkTZgvCSl/XY88cuP2y72Z+cgT+vUMx/SuDjmS0UXChba6kDg9B7XfVLSKTUr3/XN/3UIJKyWXPpfyzuokNUPJDpeJlrl3URoEibqSCGXEx1kEOH52k8urC0Za82I+FVpQkSb7EFfkvlBtVQJqWxjhMNGo1oDKNntpyaMA03EW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB3165.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(86362001)(6666004)(6512007)(26005)(38350700002)(36756003)(6916009)(31686004)(83380400001)(38100700002)(186003)(31696002)(4326008)(66476007)(6506007)(66946007)(52116002)(53546011)(44832011)(6486002)(66556008)(8936002)(2906002)(8676002)(2616005)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aE9Ha1BBZi9sS2dIMnl0cGUrZVgzUWt6UVFHVDZVQzE0RXN6bFhBZkM5cmZu?=
 =?utf-8?B?dThZeTNVdks2aFpQYUt2U25BbEY4dTJ1dTl4aXRqb01iM2hiekpZY0ltV3JP?=
 =?utf-8?B?MU1ZQXVpUFBkQmdlaHlxdHB3eVhRdXNwbjN5RVNrRUFodzJkM0NTWVlQMHF6?=
 =?utf-8?B?NnpvbEJmV01CNTc1TEZzYmU1c2RqM0I0VU9KSmVDZGV1S2x1eU9hK0xZZkhH?=
 =?utf-8?B?THJLOVAwckFKTU0rQlM1UjVNazZGS0dub2dVUHhkTGpDWlB4ejBnMGdleC9S?=
 =?utf-8?B?VnpzcFMyMFZhU1l4SGtLSTVYellNU2NqdjB3WlRTVnc2TXZ3bTBKOFErZXd2?=
 =?utf-8?B?ZXNqMFkrRmJHcnE3QitvcStpa2J4eDlSUXAyU09SMVZRcnd2ekY5U3lNL091?=
 =?utf-8?B?KzNGOWdZTTlranEreTY2SjNncC9rWEJwWVp4T21OcEhKRTR5bEtqRG1YWWJY?=
 =?utf-8?B?bklFVTRrcWVrVWxzSFArWGhsOHhXd3lHMHh2QnJ6ZHlybnFSL0d3eHNRcjhj?=
 =?utf-8?B?VEN2VThHTGdEdDBjUkxIQ2RkOCtHS05qWDdiR1lhSlErOGoweCtSU2pKVHJM?=
 =?utf-8?B?NWFQdnhHYzQva0FVUTYwUzcxK0lheXkvZ0g0a2F1OGM2VTRTTkZpYjBNclBs?=
 =?utf-8?B?ZWZrTE5HK25NQTZxQjRENzVSSWhORDRoZEtvR2k2dmY4WTFpSVZUZTdBSTZw?=
 =?utf-8?B?bE4xeW9wREJIOHNQY0pNY214MEtzMjFhTTBzL0NoUDJuQzN3Y1hUUlhCVkM0?=
 =?utf-8?B?UzI0aUZKYkpmcGxtbDV0V2hnNDZ2MW9TRFh1bTdZRERqQ0tyc2EvbzU3cW83?=
 =?utf-8?B?TkdZLzJqaXB0bVBLV3ZGMDJ1ekxVVnRNT2NrdVRLdDFpWFVKRmd2Z1FCR2Y1?=
 =?utf-8?B?a05kRUQxT1AxSlFWZTJ5SmFSUm00Z2UwVFJ3b1Z4OURpQnBDamFTRTl4c2w1?=
 =?utf-8?B?QlJDQVZXRktVSVpyMlpGWU90Q29vdjZUbU1JZE50K0o3aGcwOGdkTmFZOFBP?=
 =?utf-8?B?V2l2WVVyeWgwcktYQXl5UWUvWmJCV3V6OUVPMk40bXZiL3lQYUJ0dnFjUHdO?=
 =?utf-8?B?UktOQ3VJb3JFMGxYWDlrZTEwcTYyVnFnNjJUTWNGSm5SYURpWEZCcmsvYWs5?=
 =?utf-8?B?dGp1QkpXK3NOZ0N2SVQzRHAxeWFka25mNGZvYWUxb3kyd2lVcTB4a3JRdUZN?=
 =?utf-8?B?cSs1UnFTbENiZlpvK2xuRFhhT0FTaU5xanpFaDJBOWVpUHgyVzYyaGF3U1JR?=
 =?utf-8?B?KzQrSFZZeGp0ODFnWFpScGRyM2VZT2RoMnVmTEN0RzV3citZcFNGOHMzUXpM?=
 =?utf-8?B?WUZ6cUM1ZVlpaVp1VDlSN0hCWDlPWm9ZUHpiMUswZVZwVkdRWlVUV0xzQk1Z?=
 =?utf-8?B?bnFFVDVwcFJncjVKQ3Z5bVNXK2ZnWDU5aGpuM3dtSGRmTnc0WEk2K0tMc1Ru?=
 =?utf-8?B?WU8rV2p6bFg5TDZpWEd3SEpVSXlnbTliYnVrdFltY28yMHNEQXlIZlNiUzFq?=
 =?utf-8?B?aWJpU1NSTFdwdHJHK1FxRFJKeE42REhucUJCSEMzTHFlb2YwOHpKNXI5QU96?=
 =?utf-8?B?NElWYWpvcW9WK3Fnc25jcXZLRWNFalBQZGJ3VUpsSDdqNDR1TVpNSEVUYkVm?=
 =?utf-8?B?eGZYTGl5Q1dTNVRHTkRQMzBOUjRXeVBIOXBPMXpkSWpoQmQ5Rjl4dTZxdGtZ?=
 =?utf-8?B?Rk5QaHAyVjNJVTIrdVE4S09tUklubXZtV0djNkxVWjZ3ZDVsaHZZTjlLMjN1?=
 =?utf-8?B?aDJvTFZNOUdtZVhFbm1CcmVSZVRNUE1NU0tCN1g0QVpmeGtSUndDQnRIR0xR?=
 =?utf-8?B?OUF2N0wxZytGUW51SlJ3Z2MzSVhsQXhJTDNKUVlhT0Nnc2Y4TmRBbmNBRGNB?=
 =?utf-8?B?bWdiSEcvYVlKL25tcGFXNG5HNGZKSUVFZC9idDNvT1pCNmhVTUUvRHlxRm1L?=
 =?utf-8?B?NWVoVVZseExadG8vc0lIWkJDT0NzSDRlbFFMd1B0UW5hajFrMDZqOEY5OGJh?=
 =?utf-8?B?dFBPbDYyMkpjSmJwWXVmZHNVWDdSTDRVQWhqSWw4cEpjT1Z4Ti9PVU9hL0NO?=
 =?utf-8?B?WnFaNXJScnRsNlNLbG1EbllZSkFSZUdmN01hU00zUkUwOWhSdW51eTJOdDc5?=
 =?utf-8?B?UFFoak1FRG1jSHVlRUxsaUQvWURkbGZzUytwc2JKQTBhMlJBeWFackpDbnhs?=
 =?utf-8?Q?7xid82HVJpEnUtYsBEfUn7g=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d9758d-c1bc-4f6b-fa54-08d9f83a349f
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3165.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 08:38:32.7920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c2bnLs7OGYzd2uBIbsXoPrAMQIK1aDURTQn7D8fKP++ptKb6WmXbCJ3fuJhf4ve6ThLZRSvP26tHvy3+2s3L2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB2955
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/25 16:22, yebin via Linux-f2fs-devel wrote: >> diff
 --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c >> index a0e51937d92e..3de5a1343070
 100644 >> --- a/fs/f2fs/dir.c >> +++ b/fs/f2fs/dir.c >> @@ -953, [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.85 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.85 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nNW7d-00EehR-Pg
Subject: Re: [f2fs-dev] [PATCH -next v2] ext4:fix file system corrupted when
 rmdir non empty directory with IO error
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao.yu@oppo.com>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8yLzI1IDE2OjIyLCB5ZWJpbiB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGlyLmMgYi9mcy9mMmZzL2Rpci5jCj4+IGluZGV4IGEwZTUx
OTM3ZDkyZS4uM2RlNWExMzQzMDcwIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL2Rpci5jCj4+ICsr
KyBiL2ZzL2YyZnMvZGlyLmMKPj4gQEAgLTk1Myw3ICs5NTMsNyBAQCB2b2lkIGYyZnNfZGVsZXRl
X2VudHJ5KHN0cnVjdCBmMmZzX2Rpcl9lbnRyeSAqZGVudHJ5LCBzdHJ1Y3QgcGFnZSAqcGFnZSwK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZHJvcF9ubGluayhkaXIsIGlub2RlKTsKPj4gwqAg
fQo+PiAtYm9vbCBmMmZzX2VtcHR5X2RpcihzdHJ1Y3QgaW5vZGUgKmRpcikKPj4gK2ludCBmMmZz
X2VtcHR5X2RpcihzdHJ1Y3QgaW5vZGUgKmRpcikKPj4gwqAgewo+PiDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgYmlkeDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqZGVudHJ5X3BhZ2U7Cj4+
IEBAIC05NzAsNyArOTcwLDcgQEAgYm9vbCBmMmZzX2VtcHR5X2RpcihzdHJ1Y3QgaW5vZGUgKmRp
cikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKFBUUl9FUlIoZGVudHJ5X3BhZ2Up
ID09IC1FTk9FTlQpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29udGlu
dWU7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIoZGVudHJ5X3BhZ2UpOwo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVudHJ5X2JsayA9IHBhZ2VfYWRkcmVzcyhkZW50
cnlfcGFnZSk7Cj4+IEBAIC05ODUsOSArOTg1LDkgQEAgYm9vbCBmMmZzX2VtcHR5X2RpcihzdHJ1
Y3QgaW5vZGUgKmRpcikKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfcHV0X3BhZ2UoZGVudHJ5
X3BhZ2UsIDEpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJpdF9wb3MgPCBOUl9ERU5UUllf
SU5fQkxPQ0spCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FTk9URU1QVFk7Cj4+IMKgwqDCoMKgwqAgfQo+
PiAtwqDCoMKgIHJldHVybiB0cnVlOwo+PiArwqDCoMKgIHJldHVybiAwOwo+PiDCoCB9Cj4+IMKg
IGludCBmMmZzX2ZpbGxfZGVudHJpZXMoc3RydWN0IGRpcl9jb250ZXh0ICpjdHgsIHN0cnVjdCBm
MmZzX2RlbnRyeV9wdHIgKmQsCj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2Yy
ZnMvZjJmcy5oCj4+IGluZGV4IDVjMzBhNjU0NjdlMi4uMDk2MTdkN2IzN2ZkIDEwMDY0NAo+PiAt
LS0gYS9mcy9mMmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtMzQ2NSw3
ICszNDY1LDcgQEAgaW50IGYyZnNfZG9fYWRkX2xpbmsoc3RydWN0IGlub2RlICpkaXIsIGNvbnN0
IHN0cnVjdCBxc3RyICpuYW1lLAo+PiDCoCB2b2lkIGYyZnNfZGVsZXRlX2VudHJ5KHN0cnVjdCBm
MmZzX2Rpcl9lbnRyeSAqZGVudHJ5LCBzdHJ1Y3QgcGFnZSAqcGFnZSwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGlub2RlICpkaXIsIHN0cnVjdCBpbm9kZSAqaW5vZGUpOwo+
PiDCoCBpbnQgZjJmc19kb190bXBmaWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBpbm9k
ZSAqZGlyKTsKPj4gLWJvb2wgZjJmc19lbXB0eV9kaXIoc3RydWN0IGlub2RlICpkaXIpOwo+PiAr
aW50IGYyZnNfZW1wdHlfZGlyKHN0cnVjdCBpbm9kZSAqZGlyKTsKPj4gwqAgc3RhdGljIGlubGlu
ZSBpbnQgZjJmc19hZGRfbGluayhzdHJ1Y3QgZGVudHJ5ICpkZW50cnksIHN0cnVjdCBpbm9kZSAq
aW5vZGUpCj4+IMKgIHsKPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9m
aWxlLmMKPj4gaW5kZXggY2ZkYzQxZjg3ZjVkLi5hM2I2MGQ2YTU4ZjcgMTAwNjQ0Cj4+IC0tLSBh
L2ZzL2YyZnMvZmlsZS5jCj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+IEBAIC0xODQ2LDEwICsx
ODQ2LDEzIEBAIHN0YXRpYyBpbnQgZjJmc19zZXRmbGFnc19jb21tb24oc3RydWN0IGlub2RlICpp
bm9kZSwgdTMyIGlmbGFncywgdTMyIG1hc2spCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
LUVQRVJNOwo+PiDCoMKgwqDCoMKgIGlmICgoaWZsYWdzIF4gbWFza2VkX2ZsYWdzKSAmIEYyRlNf
Q0FTRUZPTERfRkwpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGludCByZXQ7Cj4+ICsKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGlmICghZjJmc19zYl9oYXNfY2FzZWZvbGQoRjJGU19JX1NCKGlub2RlKSkp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQUDsKPj4gLcKg
wqDCoMKgwqDCoMKgIGlmICghZjJmc19lbXB0eV9kaXIoaW5vZGUpKQo+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gLUVOT1RFTVBUWTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IGYy
ZnNfZW1wdHlfZGlyKGlub2RlKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDC
oMKgIGlmIChpZmxhZ3MgJiAoRjJGU19DT01QUl9GTCB8IEYyRlNfTk9DT01QX0ZMKSkgewo+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9uYW1laS5jIGIvZnMvZjJmcy9uYW1laS5jCj4+IGluZGV4IDEz
YTBmZmMzOWZhNC4uZTRkMTgyMWI3MDdiIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL25hbWVpLmMK
Pj4gKysrIGIvZnMvZjJmcy9uYW1laS5jCj4+IEBAIC03ODYsMTAgKzc4NiwxMCBAQCBzdGF0aWMg
aW50IGYyZnNfbWtkaXIoc3RydWN0IHVzZXJfbmFtZXNwYWNlICptbnRfdXNlcm5zLCBzdHJ1Y3Qg
aW5vZGUgKmRpciwKPj4gwqAgc3RhdGljIGludCBmMmZzX3JtZGlyKHN0cnVjdCBpbm9kZSAqZGly
LCBzdHJ1Y3QgZGVudHJ5ICpkZW50cnkpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgaW5v
ZGUgKmlub2RlID0gZF9pbm9kZShkZW50cnkpOwo+PiArwqDCoMKgIGludCByZXQ7Cj4+IC3CoMKg
wqAgaWYgKGYyZnNfZW1wdHlfZGlyKGlub2RlKSkKPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiBm
MmZzX3VubGluayhkaXIsIGRlbnRyeSk7Cj4+IC3CoMKgwqAgcmV0dXJuIC1FTk9URU1QVFk7Cj4+
ICvCoMKgwqAgcmV0ID0gZjJmc19lbXB0eV9kaXIoaW5vZGUpOwo+PiArwqDCoMKgIHJldHVybiBy
ZXQgPyA6IGYyZnNfdW5saW5rKGRpciwgZGVudHJ5KTsKPj4gwqAgfQo+PiDCoCBzdGF0aWMgaW50
IGYyZnNfbWtub2Qoc3RydWN0IHVzZXJfbmFtZXNwYWNlICptbnRfdXNlcm5zLCBzdHJ1Y3QgaW5v
ZGUgKmRpciwKPj4gQEAgLTEwMDEsOSArMTAwMSw3IEBAIHN0YXRpYyBpbnQgZjJmc19yZW5hbWUo
c3RydWN0IHVzZXJfbmFtZXNwYWNlICptbnRfdXNlcm5zLCBzdHJ1Y3QgaW5vZGUgKm9sZF9kaXIs
Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIGlmIChuZXdfaW5vZGUpIHsKPj4gLQo+PiAt
wqDCoMKgwqDCoMKgwqAgZXJyID0gLUVOT1RFTVBUWTsKPj4gLcKgwqDCoMKgwqDCoMKgIGlmIChv
bGRfZGlyX2VudHJ5ICYmICFmMmZzX2VtcHR5X2RpcihuZXdfaW5vZGUpKQo+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKG9sZF9kaXJfZW50cnkgJiYgKGVyciA9IGYyZnNfZW1wdHlfZGlyKG5ld19pbm9k
ZSkpKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dF9kaXI7Cj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCBlcnIgPSAtRU5PRU5UOwoKQ291bGQgeW91IHBsZWFzZSBtb3ZlIGYyZnMg
cGFydCB0byBhIHNlcGFyYXRlZCBwYXRjaD8KClRoYW5rcywKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
