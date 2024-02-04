Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0639848AE7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 04:36:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWTIe-0005lH-Ac;
	Sun, 04 Feb 2024 03:36:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rWTId-0005lB-0N
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 03:36:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ALOFvIP/ZydO4BnG6xiCEGvjUtrqwcdwFcWZfrg9TA=; b=jyLdDMLWMaELP0LcIdo9iBVxAB
 xtO8ornLOO4w3dCG6+QOwk0+PoTCFK8REW6TgGCSPcvgASx2/eTu0NqXdupwxzuVrvSN9zACzq0uQ
 S6SPd48mCacfYEMqKImzZkUIjyz2K7UsNCYUoTq0VNE3x1b48X4YIUXUN6dgzNoTckV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ALOFvIP/ZydO4BnG6xiCEGvjUtrqwcdwFcWZfrg9TA=; b=OvkA6AILNMzXBSE8oTSK5BGLaK
 jmHx2pklZsc69+DceqELgIdIIeeXWTCW513KORueAE6ZukhA38bn5i19sacMXf9jgovrsFfMdlgO/
 dzet1Mz6BDm8yZ4OL8mEKiyV+vuKGwbclcGxnIYxEZpjdl0bURMD2afNWbHDt3asXFPU=;
Received: from mail-psaapc01on2110.outbound.protection.outlook.com
 ([40.107.255.110] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rWTIY-0007t5-PU for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 03:36:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BNwj8kj48rOR5aNsOwjUF+XpIXqpRr6+9qwtZpgsRsNQen3YrcRibku+H3QErTxWYYw4MxBEl8rPqlAZ+I1aUTjxwZft7rueWJMPpZtARg1ea0Vi8genb8BbgX7NjYrf3FaHz4mhg1PZv3a/pMcwXE/LQ3wWETGz3GGj/llAfFHbNYMg4e97GFFI9QSWsRtimNk4/EuizhnVPh6OqNPeX04k3sR0rTOCkWSz0JKZNOVXh7lbzwJVX5ZBdWovNzDCOqgoR9S6/BtJ8kTkE87crcAkZXVk7QH7vJxqdBgbKO7D8xlO14T+1px5YxIPiwr1xYUbpd3fAaAvT3TIpIVGxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ALOFvIP/ZydO4BnG6xiCEGvjUtrqwcdwFcWZfrg9TA=;
 b=V8ATcbKIkO0zul+0RJpejWEXyFRG7wY/iNE8iwA/YVt3VVjuCaJD7SVIVn4FST4BtoI45bvVBrGdVwQl3l+uFTlRxavrdERTE5U4OwZdnY44VgaUKxwWEixWk7fJKT69cfABdi1rwf3LLEJYoN+RO186TvVAa8GNzooZC0X6T2PEgDKGUg95nhLVlVCjErUpRU2CcjDjfuEjWUw2yUYu5rRSUomUsE1pEpCxZgP53gVhp1iWbIxmB2hAnLC7ttKuBQQ/2o1e7bAM+uZ+jLtB8sDNYFRpeE+jjOfZMVWo78ybstdfIXVqgjyvBNwehy6eQwwPBDysve+OFUVbY+wnQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ALOFvIP/ZydO4BnG6xiCEGvjUtrqwcdwFcWZfrg9TA=;
 b=O5Mym+bdI72Rvc7QmQKU1BHOEUuxXP7HZPxbF086lsrhPYBcI5whoJLdZUFh+6B7rjVzVKjur3+3UWLc01Hg/VH5SZelZKjT0QOW2HuRx3B7BqgLlU2q5bVJuG4N0Q32P27CCyYqSAlnN7FTfLPZhsG+9jxxDrFazbxFY0yujlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB4730.apcprd02.prod.outlook.com (2603:1096:4:12a::11)
 by TYZPR02MB7411.apcprd02.prod.outlook.com (2603:1096:405:4a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.33; Sun, 4 Feb
 2024 03:35:48 +0000
Received: from SI2PR02MB4730.apcprd02.prod.outlook.com
 ([fe80::4868:549f:f355:f4fb]) by SI2PR02MB4730.apcprd02.prod.outlook.com
 ([fe80::4868:549f:f355:f4fb%4]) with mapi id 15.20.7249.032; Sun, 4 Feb 2024
 03:35:47 +0000
Message-ID: <8c51d0d8-ae3d-418c-b6ac-5a164b40a8c5@oppo.com>
Date: Sun, 4 Feb 2024 11:35:45 +0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240204031022.1189-1-qwjhust@gmail.com>
In-Reply-To: <20240204031022.1189-1-qwjhust@gmail.com>
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To SI2PR02MB4730.apcprd02.prod.outlook.com
 (2603:1096:4:12a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB4730:EE_|TYZPR02MB7411:EE_
X-MS-Office365-Filtering-Correlation-Id: c84e6913-cef3-4073-9593-08dc2532607a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFhSaKc676NCqsgl9GUFkecYVTy4nyfkos/Nfur1JIYAQ7Lx19ZSoSjtXk3ChOMKfsAHRHt6JG+OKOoGkb4UJAmF6vjkWa+/Xhf24c+oCadoAdL5xuGpzunViHORQeyr1tgUzrmW7aaRufuI1BmOQORzUc1hzGSKMVAfuE1JXPyeRu5heMZ9wTk26eFb2w9nUezXDB4+FSF8aekdivgHlVB//YD6gyMsZM1/ssGVRIdWCnq4VhbuqAQssHbRNuSocug89XWIdHmtgeFa4wTb2K0HxLHBYfXsR4z/X+ItiQhUYCLYPvpekQlsUsb6IYqCSNLhWHX+Q1dKzKUJqFy8/ZuhIYLzNf+/HilbiAUODRhL0tf7S7MaRsOOBfS4DIZwbvx0/3NUi/MWaV1NzVK9YX1UqJuYFFzUTtZCb2NsZ0/xLnV2mGv7DDfcI/46rwnCifKXsS2xIddlVJ2XJ+PAckx1M+0pjeZS2ydtBeWyYd1O+t9kTk3EUjeoNwqOTaONQj+8g9TNjbEIwDpNEuGHnad0h+89eWo719uSF0DZRPDAxYrLj9sAPt2CW+h5y3jXa/bhodTqzUotLfbO61uln4KDjMhsBIU1KDimBuQju0yNx8rA1dY7uUXBuzuWwH/bke1iqj84nPL7C+3CdYefSg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB4730.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(346002)(39860400002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(2616005)(53546011)(36756003)(6512007)(6506007)(86362001)(26005)(31696002)(38100700002)(41300700001)(478600001)(6486002)(4326008)(8676002)(8936002)(2906002)(31686004)(5660300002)(4744005)(66556008)(66476007)(66946007)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVZOaFlVdjRDVUliOUJTNmVWTW1iYVJMb21JYlQ4MFprSFphYjJLYVhyWEJI?=
 =?utf-8?B?VTNTMHhVVW5peEJHdEE5ZjQ0b05Bc0lsTktnNVFQaXRCbndnUFUyVmt0QlJY?=
 =?utf-8?B?WkdkT2FSOGJ0eXdGeDhiMFprZzEvUExaTVIvZUJYN001WERWZzJWdWRDZjlw?=
 =?utf-8?B?OUdJc3g0VkNPZWN0VmI1QkcyTXR6aHZsL2xhY3Z0UkY0Nmh1TThXZXpsbHlr?=
 =?utf-8?B?YmVmcGRiR3M5dzJWTDM4QkhUWG1XYlB6UGphaDlnbU9kYUJaMVN4bmd1MHlm?=
 =?utf-8?B?dlhncVVYUlQ5ckt0RjBTQ0UwV2pqV04vWnUxc3U1bHdkYjNqbjk3ZGloRmlM?=
 =?utf-8?B?Z3Frd2E1WmhYcmx1d0IxSFpZSnc0bzVrSkEvWTJvRUNGbWFsWFR3VHBHUk45?=
 =?utf-8?B?clM1N01xdVlBNk9heG9kWk9SMXJueGJvZFBoejhjeE42Znpla0ZZdjk5Z09N?=
 =?utf-8?B?dEVQSURib0VOY0FabkVJWHBzZmxQcGJEN2F1M0hrcjZGR0ZoamVCcHFYelpj?=
 =?utf-8?B?dXhZNXN1OVVoMnE3MUoxRGtBZDkxYVpwWGlOWFZHc09sa0QvTHhBa0VHTGlj?=
 =?utf-8?B?UFd3WjhYOWNMWTdVZTdjSlhET01lcmJXVjdHU1pnR05ad0VKNnB3NlRON3Ix?=
 =?utf-8?B?TXpiTmoyNmV5S3JpczFQWVRVa25iQ0thSU1wSmJ6T2dqOVZOY0NRajRzZ0ZP?=
 =?utf-8?B?eXN2MzlpTW9FbU4rYURzWVI5QzhaM3ZVRXpReDQ4MlR5aDc4MS9CNGZtVU9T?=
 =?utf-8?B?WFB4c1JTdlZDaU9MeTUzelB0Z2FsekdPeFNvL1A2TlhQWmRrT2pCWG9NWndz?=
 =?utf-8?B?a2ljWGRveTNEZ0JGT2JtalNnWlh0MzNMWmhDeG9Cd3F5U3NmQVRudlNVWWJJ?=
 =?utf-8?B?d1J3am9aMGdzV0VOVGN1ZkE2d2F5Smd2ZmlTM3B0ZVR1bFpuUlkwQ1lVeE56?=
 =?utf-8?B?M1krSC9hRUQ5TGVydGw4MVAzT0czT1Z2M0RnZzE5NWRETmw5Y09zald1dFJB?=
 =?utf-8?B?WkJ0KzVCY3dIbk1VSnVYZVJMVmE0ZUloZFRWSUlabStvSVNvRUwyUW12R2ZS?=
 =?utf-8?B?WUxmbWlrdmcrSThOWXZ1TnRvcWJIVlNXYi9qQmhRZWtYZGphdmovSkk3Yzdk?=
 =?utf-8?B?UnRrbDJCRmZyL1dlLzExVHhiZDQzdmJQNXJtOWk4L2UwRVNkdGEvdnVrbG83?=
 =?utf-8?B?TFNpNmtWSlJpVUkyUU5xcG85M2hwWm9ZaUJ4V0RFSXlUeGwzZ3ZvSGxab0c0?=
 =?utf-8?B?c0l5dXdJdmtpb0J5WFkyeEFUMWtuTytiblVxK3NxMFI0ZVh1YkpMY3haNy91?=
 =?utf-8?B?VUxrSGVlUEkwUHJwZW9QYjVwZ3dxRFFsMmwwM1k3YkQvcEFnY3hsUXFDRjFu?=
 =?utf-8?B?bFJCcytRWEhjVWE5c25aVXdyMENrRndsSXdKcVU4aUY4TS81UXZLRDBCWHZE?=
 =?utf-8?B?MmM2ZHN5RkJwV0Nla0Q4Q21YRmZWZlpKQlJyMW53aHVYZ0QxNGJtYUNSR2VS?=
 =?utf-8?B?OVEzdFc5dzBUSWxPbUVNWUpodVNPNGlNY3ZuSXpzRVZYOXVUVndNODRIMXlq?=
 =?utf-8?B?V3FUYkpVdzE2dlZVT1Rta0FnRDVhKzFzcjhoaHhTNkthT1lFZjBCOHVrcUcr?=
 =?utf-8?B?VGloMUxIYkVPeTd6dkgxZklhVzA0U0U2ZS91SzF1USs5UTQxMERaK1hQQ3BN?=
 =?utf-8?B?b2k1YWxQMnBGTVBXQ1YzdFVSVld6N3YwVTlyc1h6eUwwejBwMlR3U1hKVDd0?=
 =?utf-8?B?SUdDT3QwOU01RldiOUNlQ3VBenVjVkx6WVZBczBDZVM0V20zbkozaUp1elE2?=
 =?utf-8?B?YStTNTBra2JqNjBlKy9QOUtsa0Eyek8vem41dzcxVUI5aTJoMW1GdEFpR2pJ?=
 =?utf-8?B?T1hYSW5nK3p3NTlRaVFhUlIyU3ZwTWczTHloQTlyVXJTWVZPd2JrZXQ0blV0?=
 =?utf-8?B?QlpCT3pOQ25QdllYN1JBbTdveWN4NENHclJmUDN4eWs0SVE1bXByZ3hNVEhn?=
 =?utf-8?B?L2dwSEgrQW5nRzNpZVdVOW1hQWJNd0h2bFE2bmpiZy8vU0JBdDFQSmpLZTF0?=
 =?utf-8?B?SGlNREd0aDY1Yk9Ga1dRdUIwN1I4V1FWem1KWi96eWJia2Z5Q29uZ1lIYjBG?=
 =?utf-8?B?cFJzV3QxYnd5cXduTzVoV2hhMG8zTGprQkcxK1k1NHlPUnUva3d6aEJVTXlZ?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84e6913-cef3-4073-9593-08dc2532607a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB4730.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2024 03:35:47.7945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/3N5BiKXN4Qj3BOYUaHWi7QmLQH00GlTnESrlOa1Gh96hFOj9gI8YDQkexSHkw+WARDcRq0st4ZSfS/9u/bkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB7411
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Wenjie,
 "max_open_zones < sbi->max_open_zones" seems meaningless, 
 this condition is false only if "max_open_zones == UINT_MAX"(rarely happen).
 Although it doesn't affect the correctness, I think le [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.110 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWTIY-0007t5-PU
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

Hi Wenjie,
"max_open_zones < sbi->max_open_zones" seems meaningless, this condition 
is false only if "max_open_zones == UINT_MAX"(rarely happen). Although 
it doesn't affect the correctness, I think less jmp instruction is better.

On 2/4/2024 11:10 AM, Wenjie Qi wrote:
> max_open_zones < sbi->max_open_zones


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
