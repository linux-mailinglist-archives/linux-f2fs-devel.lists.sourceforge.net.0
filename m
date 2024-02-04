Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B70848B18
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 05:53:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWUVS-0006lX-Rk;
	Sun, 04 Feb 2024 04:53:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rWUVQ-0006lR-BF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 04:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pN720aajgdFrIykoJ+Qi4JE3rjsj5ePFnTN9TJyPK4Q=; b=b5Hn0WnTzcvkaGW2oDJ0UpB5vb
 BnXtpYYb6+yXEK2MbyJ6iDbhN/F98nebIT4pJNfl7EnOvwB/sS/htyeR92XU7PlDTWWqHk1BkARaS
 EFzLwYxNiArqt2eX/DHmc97Npy5A8kGdrjFs+A/FAd++Ig2d6zBWHkes90C5sSzGAuAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:Subject:From:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pN720aajgdFrIykoJ+Qi4JE3rjsj5ePFnTN9TJyPK4Q=; b=hqSaBwN/Hn9O07YpVleY1mTedv
 U3XVdhFMFQu1K5EOpF6dd7iAnPuTtBD9m/hOKQQDpwvJvSNR4Ffypq5JH2LJESWgycoySf8pcDoOf
 Rfe/iex0UNqjxR84AJHuH6Jxk2rL97ahT8nY2cYGbVzPpRq72U79gA0SkdDsRjgrLEmY=;
Received: from mail-eastasiaazon11022011.outbound.protection.outlook.com
 ([52.101.128.11] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWUVN-0002du-Cq for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 04:53:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ad07c3fF/tQJOlG7my/vDKZDs+FrAgocJynBNHtXbuprilmtPlMclHvne7q+KBMI9csmd0UlOnbEEkxgY7bqGMnfyX0p58mdDLLf8E1NkO9xP/+id7mJm0D75vtOcCaAVuje2Su+DmCPGkJQLTEJTfAuaH9sGT68pnS6h0OCIAbbxN3P8YaBtJa+uI4Bxdn2M4RUZfylkuLMK0ax5QpokvG8A9fpt7MjHJ4/J/qjg/gHC8CVvTyAkeV9B1K6BUNrDYo+3sSU/Lz7hyGVXRgVr1gyS7JvSNm2eXMBjnuGWzU2AN6JF3f7bTtslQYwJ1oSF2wGP3TQPE3cjIPGyxCz6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pN720aajgdFrIykoJ+Qi4JE3rjsj5ePFnTN9TJyPK4Q=;
 b=fGxx62V6VlD8zxfukT/CH83bKzETs67VB7n1r83UzzGXG/vwM5xSHTxt4Nl3nE/t11HojXBAC4d59/+iqbF4fUViAGZNS/DFz0wKSnjv1rgjlhkY71T4Sl6rc/pd2V+Smi+95EaFnwJE+vXuvqp8aGUgTb7rP3IHT0tBsdXwHiYWWt6UBMkBdyOQswzzdmsTmEE+nIPZgtxAFtn4ALpDMD6cSzS2nFNov8N6T73E4magRz7FBQyUZyt+HMd3BWRGd4eHBI3S7DX51/HJRe9tAlpbJp5vWqOlyRiDz8szYJu8tZN5D1brT7ti0h+mkE+kretnT8I8OwdOGw3N7yZ9uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pN720aajgdFrIykoJ+Qi4JE3rjsj5ePFnTN9TJyPK4Q=;
 b=t1ZECBAY5uluRjbR7O1rZAerZoLPn0lxBOIUF3PHSOgFMW1xA3JUvn9rbI6WHKyccIaw/46rCXPC3satd1eSCsaCDDaJ6zJEYGoKDYm6koFCZVjmxxC0gFhhjykCRiAlIzlaaBi74WJCa+KVduhMzI37Fixy+LyA9FTQi4NUt74=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by TYZPR02MB4655.apcprd02.prod.outlook.com (2603:1096:405:5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.31; Sun, 4 Feb
 2024 04:53:07 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a815:49db:df99:5461]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::a815:49db:df99:5461%5]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 04:53:07 +0000
Message-ID: <e6cffb6e-3228-415d-890c-76fe0a9ac08b@oppo.com>
Date: Sun, 4 Feb 2024 12:53:02 +0800
User-Agent: Mozilla Thunderbird
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240204031022.1189-1-qwjhust@gmail.com>
Content-Language: en-US
In-Reply-To: <20240204031022.1189-1-qwjhust@gmail.com>
X-ClientProxiedBy: SG2PR01CA0177.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::33) To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|TYZPR02MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d385430-0fec-4eb0-3889-08dc253d2d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nEgkRVdoBIoP9ztUq7gE230QzwENlE5ldV61B+Tm2CsdoM298UNAhjxJqcSVfMF0IPEmWLOy0g8nm84qp8Ka1GNo1RRDDSdn+42ufgfhh3mhetMKTM2ExtH2qFEVIYHA9IVPtofoHhZfSB6nw7Hm3T4GYvkRCrBywNsjRCGr/19DDUTfXlEoDcdOn9FJtVu2WdKOMbjvVxdkz8ngnZ9C9AwEy3rC5/ZiVq1/dtzCKDpENiivIaLImx5A6JTYXslZBnkMv4mEXR2qB10jLlHV159Qg7C8diB6T8sTl5CavPrC7sVqE0sFoISsjj+vUC/JNudnBo9k8EskRcstNzJSItcsKln4/FndQwgsqaMoMtjHm4l76o2JH8pkd5S0uIfp4dnHhGo38XcpRxx15OvLWbbcIE5cq/CJYvVJbSRKrCbrCQGQsgDt16Ralnfmxl5416BfITIJ3JjlT6AiOlOMd0L+NhYsnjubmseINkq3waWh3VRbTudFhjc2zODWSv+3TxsNSBSv0VeiL3cejW8GKqztXyD3SL7RLZZZ/cT/+V6zy+HgsMul3BsBEDQaoi4vVL5tJ5baDgWCfPDPMRX5e8gNCDk2E3YGMxMlP+GoRvGU76xWfOuPKyTKfxsExIaQy6bIlCPM3iPvQOGgNJ8mdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(39860400002)(376002)(136003)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8936002)(4326008)(8676002)(2906002)(5660300002)(36756003)(41300700001)(31696002)(86362001)(6486002)(478600001)(2616005)(83380400001)(26005)(6512007)(6506007)(38100700002)(66946007)(53546011)(316002)(66556008)(6666004)(66476007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0pCaWZ3V01CVjFRNm54RnNJZlN0WFpuTDhPd3grbGF0VGNxcEkrc010ZGlt?=
 =?utf-8?B?dHcxZjRGb0ZRWHVqNkQrN1VmL293NXR3S0xNUTRtNTlMODdxTDJZTlNibGRz?=
 =?utf-8?B?dTB4aXJPSitpWHp2OTVXYXlGWWVkUWwzdXZuQndpc1Fod0sxdDlHWW9Yc3U4?=
 =?utf-8?B?cERQZjJoWGpIVFFZdWhFbkVVT0xrRlhhaEF2U1FuSHRvckR1MjZ0V2d3TWFi?=
 =?utf-8?B?eUZ2YytMd1FIVUU3dHFlWndEekRIVlFIMHFyMnNoK29sbkJtYW9NYlh1YnpJ?=
 =?utf-8?B?VFdXU1RBa3NKb0o2QUdVMHVOWHY4UmxUaU9hQkNyTVdKcUdTWW05eE1VWUIr?=
 =?utf-8?B?c0dnMnBFcGNOcnQ5ZHJ0U1AvaUVjNG42bEdJeVZGZXp3WEpiME1zdU1HUElq?=
 =?utf-8?B?SlRIY2pFM2dsR1FFQ2tmWFUvL3dCQXEzUUJBelpFSi9NSzMxTXR1VkRrVzE2?=
 =?utf-8?B?VlRDUjZTNVh3d003TTZPeDg5WUpPTEFzbFd5c2pwNUlZUjZwbFkwWVVPVFl2?=
 =?utf-8?B?KzZVRjlTK0p6YkFjeXF4MUFQdEFtaExiVFJqaFM4aWJFVFJjb1ppaFE1KzQ0?=
 =?utf-8?B?RkQxVVJKTnkwc0h4cWx5VUhTbFNadVBwbEVaL3hUSGFsRS9GaTNWN0tQM3gw?=
 =?utf-8?B?Uy9mTk5RWkpBV01lV0RJNVFZcWorV3RRWXlQZ0ZtRmhFTmw3MTVIc0dselJl?=
 =?utf-8?B?NVZmWVNMQ1ZwZUR6bWFhWVlnWmN1TkVGRnMrTi9WaEFaQWNIb2RZblRrQWow?=
 =?utf-8?B?TGhYWFR6WFdXS3dCb2lBVmJaTTIvMXlZVk44bk14aTdvRnNDNDJIaytQUWNl?=
 =?utf-8?B?aVNWNVI4L3VybHJoUHVXai8xeHdHQi8rQm1MYUtDMzJzTWZVbEROa2JLVEww?=
 =?utf-8?B?VzBKTDhtQ2NscUxRSVB6OHo0bVU3c1JGRDZGUzExTm52MW1pMWxmbFNpbE9a?=
 =?utf-8?B?ME10NFJDODA4ay9Wb1lLMUNDcUsxT1B0RFkyU1RaTmZyUEdkTy9jRVhjVDcz?=
 =?utf-8?B?L0dUOERHc0JlV2w2aHdENFU5dmdDSDdjS1hCcytTZzdiTXRwMU9XczltdWZS?=
 =?utf-8?B?U003QlVzdGsyS0Fubzkrd1VFbmliKzBPbUdBN3Q4Y0JJc0VvUWV1bmUyYXA5?=
 =?utf-8?B?cE52Yml4RXMyaW41SFNPZmNsVUZjT01aVVgzam4waWpONXhoZFA0bG11Wi8y?=
 =?utf-8?B?dDJkdjEyWmZXLzU5V2NrTUpUbFpFZW1laHFYSS9jWWg5b1ViRU0yNGxkYUl4?=
 =?utf-8?B?SExaTjR2S1ZuNnhURTlhQmVIVmVYcFVZTjVJV3NJQmtDcXhqNXlIalI0ejMz?=
 =?utf-8?B?MmZTTEhMcmxaM2ZZWUVHdHdwNng5K1hsc0lLdGJNR3VpZWRzS3FMamE0bDZk?=
 =?utf-8?B?STU5WGVWYnp1QUxpZnJVU1RrdHdoWmxtMGJDZW5vZnl3VmYwc21GOXZ3QWhx?=
 =?utf-8?B?NW1EcE9telcvamxQVW5nbDZwR29XNXFiL29WNHhUZGJRVytLY2NML3NPRFlo?=
 =?utf-8?B?VFdra0JhQmVpMjdUOTNOWDllNklRYS9vaWFqVngrV3JHRzB6R3l3Q29IS01O?=
 =?utf-8?B?VzV6Rnk5Rk9zQ3VmRmRFNkZJYTh1cG1Pa1pXOWJHMjAxTzdTRDQ2NG81Uysx?=
 =?utf-8?B?UVpDREd6dVkwUFNuQUw3ZXNVWmI3YXRKSk9MRFB1UGpiRm9EWENtS1Y2MTZC?=
 =?utf-8?B?RHVvdDh5VlpLTkc2MUd0SjVRL0hTUERJQldYdkFncUE0TVlBeWZYa2JQOCtK?=
 =?utf-8?B?MHVzSnNiMnFyZWFoZlJJcUE1bHVpa1V3V1UwakNaZmEzejN5VHhnTncyaTlR?=
 =?utf-8?B?R3JvSUZ3clh6aUduemJjOVM3WWlIRStVS0NJcVJ4bkFaWVAwcWRobjUrUkRq?=
 =?utf-8?B?UFZxWThsR2Y1eTUyS21rMGRtTU14NmdHNUVCSWY1NmJhUFY0RWZ5Y0tCdmFm?=
 =?utf-8?B?WGliZ1JzQ2hBdGovTmNoZ3JLSGJCeVQxZHRzbXNRa2lNUG1MZDdZQzBtRkxZ?=
 =?utf-8?B?THZBUElHYmFpdnNPQWNCYStyZEg0ZnRBQ1RaMGdHZnNvVDFMUWxwVWJQSWZv?=
 =?utf-8?B?WkFCZDQvVUs3OUZEQm5Da0sxWGxaSjIyU29EemtDb0dzcVkrbjc5T2dYbjRV?=
 =?utf-8?B?TUI5d2dLZVV1QnhNN0xzV29RZzVnVk9LaFM5SjNiWFJqYmVkMU5CZkV5VFho?=
 =?utf-8?B?ekE9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d385430-0fec-4eb0-3889-08dc253d2d96
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 04:53:06.9803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxpKjjowoLjxrQkwEqZUcytB0BLK5mvsQ8lh1Fwv2Paa3SJ5prX8Hvpb5md76l2S+ZZoNxow3GaXWLfc3kV9eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4655
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. f2fs_scan_devices call init_blkz_info for each zoned
 device, 
 is it reasonable that every device need to have 6 open zones at least? 2.
 we should add all open_zones of every zoned device to sbi->max [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.11 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWUVN-0002du-Cq
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix zoned block device information
 initialization
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: hustqwj@hust.edu.cn
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. f2fs_scan_devices call init_blkz_info for each zoned device, is it 
reasonable that every device need to have 6 open zones at least?
2. we should add all open_zones of every zoned device to 
sbi->max_open_zones, sbi->max_open_zones will be UINT_MAX or accumulated 
open_zones. Is it more reasonable?


On 2/4/2024 11:10 AM, Wenjie Qi wrote:
> If the max open zones of zoned devices are less than
> the active logs of F2FS, the device may error due to
> insufficient zone resources when multiple active logs
> are being written at the same time.
> 
> Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
> ---
>   fs/f2fs/f2fs.h  |  1 +
>   fs/f2fs/super.c | 24 ++++++++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 543898482f8b..161107f2d3bd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1558,6 +1558,7 @@ struct f2fs_sb_info {
>   
>   #ifdef CONFIG_BLK_DEV_ZONED
>   	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
> +	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
>   #endif
>   
>   	/* for node-related operations */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 1b718bebfaa1..c6709efbc294 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2388,6 +2388,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
>   	if (err)
>   		goto restore_opts;
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		err = -EINVAL;
> +		goto restore_opts;
> +	}
> +#endif
> +
>   	/* flush outstanding errors before changing fs state */
>   	flush_work(&sbi->s_error_work);
>   
> @@ -3930,11 +3940,22 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
>   	sector_t nr_sectors = bdev_nr_sectors(bdev);
>   	struct f2fs_report_zones_args rep_zone_arg;
>   	u64 zone_sectors;
> +	unsigned int max_open_zones;
>   	int ret;
>   
>   	if (!f2fs_sb_has_blkzoned(sbi))
>   		return 0;
>   
> +	max_open_zones = bdev_max_open_zones(bdev);
> +	if (max_open_zones && (max_open_zones < sbi->max_open_zones))
> +		sbi->max_open_zones = max_open_zones;
> +	if (sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
> +		f2fs_err(sbi,
> +			"zoned: max open zones %u is too small, need at least %u open zones",
> +				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
> +		return -EINVAL;
> +	}
> +
>   	zone_sectors = bdev_zone_sectors(bdev);
>   	if (!is_power_of_2(zone_sectors)) {
>   		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
> @@ -4253,6 +4274,9 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>   
>   	logical_blksize = bdev_logical_block_size(sbi->sb->s_


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
