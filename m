Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9E72D75F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 04:29:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8tmL-0001f7-Ad;
	Tue, 13 Jun 2023 02:29:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8tmE-0001eL-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 02:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qTld24b0sm8PbxCjVjiYms5LKcrxg48u2KgHyqr5rsY=; b=hiddKcdNXkKNFDQuyqvmIo75ke
 uUJOPh/pktVQRoPDL/Y+HJzLblZ96GrbfJ9Aa8r3YP7KgiCTAX7992Kg5LXB35fJSDXOI11A3qnGZ
 ayTLZj8KFYFZyvrVJbFHt9dPkLFL+beOYpf7eV/PhOO0sK93kCohl6AgGQxLLJX/5K+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qTld24b0sm8PbxCjVjiYms5LKcrxg48u2KgHyqr5rsY=; b=AeIpDhmpeO2f0o6EF8nfl70Pg4
 NfyPltgzxp8zoiQWlV4GCPtiyvtDcD6KfbW5Vb/clyeoqYOPtL17cB9Y+9elzWzgS0HijLPqZc/1V
 nrAUg+HIWgY35x6UzjtcK+B8d68cCvMY4rqXA8e03t1DNU2pIihATf1zj2pqckCmmRAs=;
Received: from mail-sgaapc01on2045.outbound.protection.outlook.com
 ([40.107.215.45] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8tmC-001GwS-Oz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 02:28:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBOItTmzJl1t2OtC9hWzm2MF/l9ngAaGr/0ZUHFYCsPGLfSPL2J4HLKiKWDENlSqoYLMNZAALmZcLvyXWOjCs/JeeY9qmDsL6W8kkP/eziW0TkjCm5J90jg1+39lvnQ8Nyt/vvMw7plGavDqKFpfEStN/vlC5zEFtgOM69XSLC63Ueilq/7ZEDF6SW0aYVfBRL75ep+kxVe0D/sRot6CugxEVTcnydEAujgazxyWtgmkdLNzBkx4biij5JYoHnWkX3UaaA3ywiA10gkkF4DxllZ9yVrQbCKMQOlpf/za523XZQ12ObNqvRtQfwrEIT4XyKxazQP/Lesl5w8tce5/ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTld24b0sm8PbxCjVjiYms5LKcrxg48u2KgHyqr5rsY=;
 b=M79oFWc36P9nlCx7Yvc6LImwMiYNPKGHNhvuCPAYRwAdaFjZB6pzyp18s9FnY2WWitS5Xb14MPibAg67N4ziaJBlIa/S3M1Kfgb31g755yibmbZ1OkkLmp4mVH978ejh0kiyiILiIQRxfEo9lYc4QpEcCZrejNR8XAdEmj/zR/tBFEFQsT8VjhG20TgXMcagjxrtAAA8KMm35BseS0KZw0d7a2TKBByvS3IBS40kIUVYh+cuRht3Py6n8VgKGxLQjfgesqOxDvY6+ZA3/96yrLZrBuR2D6I3lRReZ8w+5Tv2NiDT78XE5eo63LuFQVThs3w7VYNyyuFsk9QAy5KpVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTld24b0sm8PbxCjVjiYms5LKcrxg48u2KgHyqr5rsY=;
 b=RZ7+GmpF56eY9xUJgpIIpj1fCRTn1gIu6xoB3yu6g4tc9FpBSqYs6LKA7WMjCnVaCNVp8CPrapV5CAzUfbPvaRPCgmH0RndpwyJLUa8FvcUu/lj6sODG15dWNYmexinkU2bubaifRMCdB/PzZ9ZY6P2hj7Y4ubdBhUW86GDCT0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SEYPR02MB5871.apcprd02.prod.outlook.com (2603:1096:101:8a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.19; Tue, 13 Jun 2023 02:28:36 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 02:28:35 +0000
Message-ID: <44e2c24a-c94c-a991-d029-c0997a1db5d2@oppo.com>
Date: Tue, 13 Jun 2023 10:28:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230612030121.2393541-1-shengyong@oppo.com>
 <20230612030121.2393541-2-shengyong@oppo.com> <ZIeY0qNjXgx419NZ@google.com>
In-Reply-To: <ZIeY0qNjXgx419NZ@google.com>
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SEYPR02MB5871:EE_
X-MS-Office365-Filtering-Correlation-Id: ff512804-b03a-45d6-30a4-08db6bb5e3d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1ft8mqH6YIb3yYpbF0X8Kixgyb/Pufsp8OMgT9x+Lwhiy0cBBdmGufq6WI5XmbGtZ5/u4qYkEj/DSAtr/SOGTvDz+/wXsQB822bwoa0E279EaMqmcLtjBtGPPEdtrbb92pji/igt5rR6LiSLX9t648CuUbJ5Yvg2ymORwHObUfQAdo6HGYg1pm6ly56U6kVAxkFDY4glFbwmB0nHkNxZa2u4V+il0MTRUrmL53tBjOLXCb4144WzxSqHcotUNxuzs7E0PoAhvgjTHdyA1eJ6jTsGd5TUintGnGtySO/H9QYAu7hyTeO266ZG0Nz/kavsYXbHwKQk0DE1eSqrodLFxxXMLMRHkhrdHMOn5HyVFgaJxkbRy7cq03Ov02t79KOcgxax9naOD9oUL4YKBT7qs+5YWT43i7iDLtu76B/KaggjhTdZSY+BSLi4CNS0WvNVbcv9vtxb3RQ3XrnWhtUM+Il4OxEt3zR13vO1c+gPaR9y1RhGnzJkKHKp2z2UMCjmBo6TEChsx01FnZQsBolMvrL5aYJ5Wx4AO/9+HVEx6YIeP2rOHYyU0XR4wURsQkPQqFYUGp8Nl8XrSHf2jZPGw8Au+7hZckBesJQKcDTJLFNmsXiW60Ttllu64APqdjuxFnMKj7x/ptOm7KbXrJX0rw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(451199021)(966005)(6666004)(6486002)(478600001)(6512007)(6506007)(186003)(83380400001)(36756003)(86362001)(31696002)(38100700002)(26005)(53546011)(2616005)(4326008)(6916009)(66476007)(66556008)(66946007)(316002)(8936002)(8676002)(31686004)(5660300002)(2906002)(41300700001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnVMNGl0Qzg1bXNQWGRzbkl1Z2dCZjhUYnBGb1JYZkwxRUpxWUFIZnR4UXZ3?=
 =?utf-8?B?eGZhMkxpV2FVbzRud3hCczNVdTBrWTFFSnZvOGF5V28yTGloaFIyTVFlUVVL?=
 =?utf-8?B?TEYzYWJ5TCt6Q0l2SmJnZWtBMUNpWmhDTDd1Y0JDUmpMd0tDOFdadHFFOWxx?=
 =?utf-8?B?UGZMeTl3NXRTVyszTE1FenZIS2JmM2daTkl0bzZyV2xWckwrSVdKdU54OHBw?=
 =?utf-8?B?RTd5dFRaM2locnNZWC9FVzMwVm85dlV4d3JMcExYU0hjeVlzS0FWcVFOaU16?=
 =?utf-8?B?Y1djWVRIS1hDWkNVYWNHL2VqUUF1YWIrTWRWT2ZwSEhYeXh6RlVrMXdzeEc5?=
 =?utf-8?B?cGQwaHRTWG90UGhIYWJYVTlkQTZiUS9HU0Q4YTYraURaZUZSUEF0RGtlbFEx?=
 =?utf-8?B?aVpXYk9UZnZQRjlqdEx6UmE2WGU5Zk53ZTNVc1Fsck9EczFkUElSblQvUDBX?=
 =?utf-8?B?YUkvMU5UOVFIeXZmUWJBSDFXVHVDNDF4MmZRSzNLNUhidHUwTXVRcTNDcXJw?=
 =?utf-8?B?NnlQditUQU0zV2J5SXBHM05CVVhMcTYyaDU0cWF2eHJyQjROZkszcWZOTEdz?=
 =?utf-8?B?VlYyZkxlNnU4aUl4TTcwZElzMHNCNUVpM3RMYkJZTlBELzUyOE9XdStpUzVY?=
 =?utf-8?B?dk1LeDhyM3cvQ0EzUnE3OXh0UDgrVm1Wam5pUVdSbnNrQWUxSXdpY2RBcURE?=
 =?utf-8?B?T1lJV213SUltR09mdHJNciswU0lnSnloSnZ5ckEwdnNjUkFQQWcrV1RyQlpI?=
 =?utf-8?B?VXQ3Zk5oMGdFSWJuam5EV3dhcm5taWtsd2krK1lSa2Nqbm5UWFU2NzR0OGY5?=
 =?utf-8?B?Q2pSNXFpTlNjSFZOTGxKL1RJUGE3VFhqT09wTmkzcUxiejhPT01zWUpmVGhr?=
 =?utf-8?B?NnluRElDWFMzdUNsSVNMMjJhSXErdUtGckhpVzZjbDZyZEJuRFNyNUlvd3Nt?=
 =?utf-8?B?enNNUEdwU2tSQWN0dDFoOHYrbXMwUEF1T09kMHlLbCtDOWxZVXBhUlpuVVpv?=
 =?utf-8?B?SW5oa1dVckJJVTkzM0RsV0hxeitoZzlvYTdLNnZsV2pQcFkxbDNEZ25TNmg2?=
 =?utf-8?B?OEJvellyenl5UDFCWVZud1c3QUNoZjN0WmxKODNwUE1RSy9peHg1ZzU0ZlJ1?=
 =?utf-8?B?VXJVZkdvTml0WTM3Ui9xUFRhWVF1SExXQ3pIemRHZ1RSSEpGWERNRGhxMWJk?=
 =?utf-8?B?VkpKM1p0dDBSN1lwWldWa1o2Nml4cFl1emJWWHh0ZEoxcEdFOStZRmVBeXdI?=
 =?utf-8?B?bXVnQVBnVXZ3WVlvU1ExUVg4M2dSQ2xFMWNMMEJhTm5TWDlpczN2OTNxcXhs?=
 =?utf-8?B?QlBWSTZrNWdkcFdPb1IyYzQwbE9hb0swakFkZ3FrRzRQWngyVHhsQXNtSmpH?=
 =?utf-8?B?dTArWmhmTnVzS0pueEM4STFTSTYrSUNPQURZNWxabStjY1RQajdhbS9UTThv?=
 =?utf-8?B?ZHBqek1mVkhSakkrU3gvQzRMUllVV2dIMHAwY2E5RWdwWDRzaW1VcWZQYjBq?=
 =?utf-8?B?eFUvcUNEMDRrNWF3ZnFOMGdESFl3VlBtVkdJbDJjOUlYdmxXL1JISVZaUHk5?=
 =?utf-8?B?VUtnVnB0QzYzNjdldjVVY3JvanArdEJiOU8xWURTZGhhcWs1bmF3SWRMcXlm?=
 =?utf-8?B?M01hdi9mU3A3bkp4QWJlZTdwL3FyV01RL0ZjK0IxOWZmc0V2eGVwM0g2K3hE?=
 =?utf-8?B?Z0hFaHFSa1FnQ2tnMURZRVhnckwxNHJLVFRXYm9YdnMwSnFhdEYwaWVwMVRu?=
 =?utf-8?B?VHpkRndHZGM5MWZEcTJXUVNqR1hPc0VXSDkwUmhGWVV0c1EvZWg5TUphZ1J5?=
 =?utf-8?B?K1Z0T1MrU3oxVFFKUCtWT3pZVndhZ1A5SXpKY1ZxSHFOMmNQMW1sZlVsVGRL?=
 =?utf-8?B?OXBPMnBydW45R1FnRm01N2FBSDdDUmhpVHRGcXBSWUhiMEIrYmxjejhzRjRs?=
 =?utf-8?B?UVlndFgwSVVGWFRldGVNaXJ5L0RKREJyNEx6K0N3WkRzK3FUT0g3clhkYzBq?=
 =?utf-8?B?eG5zMnBGVlJSZEtoZVhQQ25ZRmxJd2ZLSjduYndVV2VUNHRoT00rZnNOWDY2?=
 =?utf-8?B?YW5aZnN3Q3lkWlNZZVdLaGsxVVBLbUlvcDlWVVdieWlCRE9DRXJqOVJ5RzJl?=
 =?utf-8?Q?NFVzHVCgZuXsOTyCCeHICSfz6?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff512804-b03a-45d6-30a4-08db6bb5e3d1
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 02:28:35.9271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMEw63aTQIVhaUtcDoE9JVo3Xpp6DB1VtdXKVCAKWF49pSvUdjX3eGruo4+XK1XGsu1itFuCWOeM5q/BeYei4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB5871
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/13 6:14,
 Jaegeuk Kim wrote: > Could you please check this version? > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=9c84aad379019a0d86655bb50bd7b4bc
 [...] Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.45 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q8tmC-001GwS-Oz
Subject: Re: [f2fs-dev] [PATCH v4 1/6] f2fs: add helper to check compression
 level
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 2023/6/13 6:14, Jaegeuk Kim wrote:
> Could you please check this version?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=9c84aad379019a0d86655bb50bd7b4bc92683c4b

Hi, Jaegeuk,

Thanks for cleaning it up. This version looks good to me. I tested it
with my testcases, and all are passed.

thanks,
shengyong
> 
> On 06/12, Sheng Yong wrote:
>> This patch adds a helper function to check if compression level is
>> valid.
>>
>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>> ---
>>   fs/f2fs/compress.c | 31 +++++++++++++++++++++++++++++++
>>   fs/f2fs/f2fs.h     |  2 ++
>>   fs/f2fs/super.c    |  4 ++--
>>   3 files changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index 1132d3cd8f337..63a496137ebe7 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -55,6 +55,7 @@ struct f2fs_compress_ops {
>>   	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
>>   	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
>>   	int (*decompress_pages)(struct decompress_io_ctx *dic);
>> +	bool (*is_level_valid)(int level);
>>   };
>>   
>>   static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
>> @@ -308,11 +309,23 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
>>   	return 0;
>>   }
>>   
>> +static bool lz4_is_level_valid(int lvl)
>> +{
>> +	if (lvl == 0)
>> +		return true;
>> +#ifdef CONFIG_F2FS_FS_LZ4HC
>> +	if (lvl >= LZ4HC_MIN_CLEVEL && lvl <= LZ4HC_MAX_CLEVEL)
>> +		return true;
>> +#endif
>> +	return false;
>> +}
>> +
>>   static const struct f2fs_compress_ops f2fs_lz4_ops = {
>>   	.init_compress_ctx	= lz4_init_compress_ctx,
>>   	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
>>   	.compress_pages		= lz4_compress_pages,
>>   	.decompress_pages	= lz4_decompress_pages,
>> +	.is_level_valid		= lz4_is_level_valid,
>>   };
>>   #endif
>>   
>> @@ -477,6 +490,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
>>   	return 0;
>>   }
>>   
>> +static bool zstd_is_level_valid(int lvl)
>> +{
>> +	if (lvl < zstd_min_clevel() || lvl > zstd_max_clevel())
>> +		return false;
>> +	return true;
>> +}
>> +
>>   static const struct f2fs_compress_ops f2fs_zstd_ops = {
>>   	.init_compress_ctx	= zstd_init_compress_ctx,
>>   	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
>> @@ -484,6 +504,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
>>   	.init_decompress_ctx	= zstd_init_decompress_ctx,
>>   	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
>>   	.decompress_pages	= zstd_decompress_pages,
>> +	.is_level_valid		= zstd_is_level_valid,
>>   };
>>   #endif
>>   
>> @@ -542,6 +563,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>>   	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>>   }
>>   
>> +bool f2fs_is_compress_level_valid(int alg, int lvl)
>> +{
>> +	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
>> +
>> +	if (cops->is_level_valid)
>> +		return cops->is_level_valid(lvl);
>> +
>> +	return lvl == 0;
>> +}
>> +
>>   static mempool_t *compress_page_pool;
>>   static int num_compress_pages = 512;
>>   module_param(num_compress_pages, uint, 0444);
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 80c783215b5a3..1b17bbe7e8656 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4236,6 +4236,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>>   int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>>   void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>>   bool f2fs_is_compress_backend_ready(struct inode *inode);
>> +bool f2fs_is_compress_level_valid(int alg, int lvl);
>>   int __init f2fs_init_compress_mempool(void);
>>   void f2fs_destroy_compress_mempool(void);
>>   void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
>> @@ -4300,6 +4301,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>>   	/* not support compression */
>>   	return false;
>>   }
>> +static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
>>   static inline struct page *f2fs_compress_control_page(struct page *page)
>>   {
>>   	WARN_ON_ONCE(1);
>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>> index 8fd23caa1ed99..023981824d240 100644
>> --- a/fs/f2fs/super.c
>> +++ b/fs/f2fs/super.c
>> @@ -606,7 +606,7 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
>>   	if (kstrtouint(str + 1, 10, &level))
>>   		return -EINVAL;
>>   
>> -	if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
>> +	if (!f2fs_is_compress_level_valid(COMPRESS_LZ4, level)) {
>>   		f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
>>   		return -EINVAL;
>>   	}
>> @@ -640,7 +640,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
>>   	if (kstrtouint(str + 1, 10, &level))
>>   		return -EINVAL;
>>   
>> -	if (!level || level > zstd_max_clevel()) {
>> +	if (!f2fs_is_compress_level_valid(COMPRESS_ZSTD, level)) {
>>   		f2fs_info(sbi, "invalid zstd compress level: %d", level);
>>   		return -EINVAL;
>>   	}
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
