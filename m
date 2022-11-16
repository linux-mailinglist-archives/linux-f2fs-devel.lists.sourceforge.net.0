Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C4162B13A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Nov 2022 03:21:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ov83a-00076n-L4;
	Wed, 16 Nov 2022 02:21:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ov83Z-00076h-BT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 02:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yF6GnglNterILY4gdokeb8Ay+jQGKNwfA0xazURVmQU=; b=B1q863omCMehJEi049yOAddJGQ
 y7jWa5oG7EOpoIIynsQs+nPCiXrHyAzxy6ajvCwMWLBuhUan5UCxgxGapc9hXIWttu9TtzSlwwCqG
 lOH/yUsLDqscJ5C6nEaIW6Vr3gDBTBsMJAISw2C4SprDeOGt8WVdQRx26d7qhg1T0wsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yF6GnglNterILY4gdokeb8Ay+jQGKNwfA0xazURVmQU=; b=cPiuFu5ZYQeUgY1cCFwhW1PeNe
 PmVQBWoZvcZQuH2TDQtsjAtb6c3aIJcqLBI+n28rS06ecTQZmdEIZvMfU4lOiXDYaG/cM2p0KIbuG
 MSWrWtZQwjzMKQhDomRO0xQs5N9OoCsqtBVRHPWm+Tao8FH8H233h2cDiJrllQEeJyuY=;
Received: from mail-sgaapc01on2058.outbound.protection.outlook.com
 ([40.107.215.58] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ov83U-009v2P-Ob for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 16 Nov 2022 02:21:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ijcQBhuBdBZwvP1QwCH22bpkiFLDgg4U/ilHqKGG+Tm4z0UDVk9Wc6E2xGAKqs68soHAejC3Jft8FET4a5DP9kHgcEmoSe4+jO9J/C7Mdd6fbFMkJEvKAUZwFiJ7tIRkPOYp3A5A4e9QkQKiynU2mYUt2xbgERwdiskF8fs7yzuoyWJ6gxdSxhl4ZJ+EWwRay41cDnuVN9SS0yDr4p24tIRxhX3SupaCUn+5j6yaKARxKmJmddknEItAN+T6bBRn3Y6z2Mkk57S7gjtlcpmNm+RwS6k4JAFb8Hs0F7r5uHYT8g5yYqrIE5peaT9xgDRub+SvISW0cRwp4knHWBdZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yF6GnglNterILY4gdokeb8Ay+jQGKNwfA0xazURVmQU=;
 b=Jg/V1TGcwLG3F2iu+pk1kX1j19JTGHHf380sUae2a1ZYbqVi+hgMy7Chct7vEkIUre19AWOGt2GSed4z/QYb+B+Wv0PxePzCY7SkbXrzYPX5q2UyFaYyBmgW85VZ2+jEM6Rr7aRCRy6rFcHx5NtkyO9OlujBj8VsS47gbwb4MiEQACJpby5v0gJxcjKz4Qm7V6i5giuPfigo9Y1POEqOSHwEEp7KrnynXEBFTnHCqrh3V3ZVyECmRFLmtdQ6dcdu3rMJzd7Z07ZxgzC2AxV60NzA/P+BnHzEKVVh6pUFV30h8V4zpXv3oo1KTQ5d7Nx0CQR5KQQTec/jxVvFULid+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yF6GnglNterILY4gdokeb8Ay+jQGKNwfA0xazURVmQU=;
 b=msQTwL2TfhZbemEYvI0HGsYMSL38rmsLVhj6CFieAbr2JgkrvbC2fdRK4+oDF2wUdZSajDl4mCkAVeTIgssOjYKTvhTc6Z3+2fdMmseKkU97AhQHydHp4DNJpoKEEQ63HcJSHZBwaHqDUpMYe9kmXDn/ERLD8BYdG5c9UqBxN5U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TYZPR02MB4928.apcprd02.prod.outlook.com (2603:1096:400:54::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Wed, 16 Nov 2022 02:21:28 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.018; Wed, 16 Nov 2022
 02:21:27 +0000
Message-ID: <07dfc677-eecf-ed92-5f82-4753b1f2ba6b@oppo.com>
Date: Wed, 16 Nov 2022 10:21:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <f508dea8-5dc3-e29e-0d8b-4d64735817ac@kernel.org>
 <20221115160155.1037163-1-shengyong@oppo.com> <Y3QaDU2n34nmPaiD@google.com>
In-Reply-To: <Y3QaDU2n34nmPaiD@google.com>
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TYZPR02MB4928:EE_
X-MS-Office365-Filtering-Correlation-Id: fa91f89b-a57a-4932-f703-08dac7794453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LNz+Mt11DR7G26ALgsD6bZ+/1xulRhS4SS50w49kmaUhZRSdUHW0oblT54dOfyZV3lP/Sd8UmdCePDk9+duK0cn85X5eC30r396romybZnYlNVqcDQMbbM3KR2t/viXxbWBk9e/OMVpQt0vUhOUqv3Aa40XYPsb7VNyOJlzSXVOJbyvhQ8Mz3QcpxtDyHDtOxvuRFHyuYtMGa2BkuugbwiZnQriFfzuCSW7oVoNo+w3VipU3CbGnqzDnwtTC7hIH7M7IjqguoDtixkLU5hWsrJ9U+qwSyNhWntP+SXBnjPvEr1nC+p8sl5imGaR2G44CX5h4FQkv5iGnVUFIU39Gno2yOUcjJ5LK7GbhnIOASD6BmE16BFaUxgKTyp/XyBvYE/hZ+iLddQGqonJHPfzz9XxqXwCzBzu+s4QiNtTkivjxmKyd3AcdJe5pLggre2w+yBSNUIRHftNlumyuCoe6AsOaT6OfSjwyeSe9ZAhgsOK3aiYwZuM8yyJNt6lIpfkETSXxuZ3X6o4U6Cs/9LYjTVb7ySpKw43MDUwPDu9R/dD20QVxRXda04VJnWYKd8EKqnO4iZLHdXvFkwuryHjvkM9iFplCpd2K5tO/6okF3ZDJbNAX6Lh6ytmotX38U0QK32VUK/PErcXul+885RdB+DEklwa7Xne5VPZxngChgHCbaTepGR+qo9o/u66+raQVqUKJmOzqk6KpRieObvSDBBuOI1ZKuNkEEuwd8IuEngiPtaGDwh4kbfqVH7Zx7ZGCaSw5lLEk8BjiJbC4/zBZD5CKiFS95GNYZcIsYZCX3r8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(316002)(31686004)(8936002)(5660300002)(30864003)(66556008)(41300700001)(4326008)(8676002)(66476007)(66946007)(6916009)(36756003)(6486002)(478600001)(6512007)(53546011)(6506007)(86362001)(31696002)(26005)(2906002)(2616005)(186003)(83380400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2Q2Sm93d0pRMGRld3JCZHJiNTFnR1Jad3FOMm13a1J5WkZHUHdSZzBRa0lq?=
 =?utf-8?B?SzJrVEdrbElhWFU2ZHg3NTZxcnU5VXZ1ZGNFb3dQMFR4d3dYM3U1R1ZIQUFL?=
 =?utf-8?B?SG9DNFE2Y1Y2eEJLOHg2VnZ2cGtlY01tMHoyUWxXblZoWlEzUzVLcjF4OTFJ?=
 =?utf-8?B?MGlGMFRYUUV5M1FheEJyL1h1V2dBb2EyRkpHWWtiMGxHYWRjaWRYNThTYkE3?=
 =?utf-8?B?VlFFQWNQWWVsWDhhVTdHdEs5QUlEbTVzTXN1YVpuZEgwK2k5R3U1RlVwOU9V?=
 =?utf-8?B?d3JpMUd1VEtkbmVjQVN0SXNEai9zNG1ybjg3M3JhYUorcFc5b2RFQklSVzhv?=
 =?utf-8?B?VHAwQzV3MXhldjMweFVBM1hSNm9ucXJKcnI5c1RkelVVUVgvMm9PU0J1Mlhy?=
 =?utf-8?B?TzZuc0xjNHp3V20yeitPQiswQTdiZGVZY3FkVDJwU0tHZ1NGMmUyYVNPQmU2?=
 =?utf-8?B?alZqcDVqbTM5YzNXdmFoNzczcUt5dWx0VkdiWjFod2tDSkVUZlo0R0pIQUw2?=
 =?utf-8?B?VUttd2NMb0MxbW1YWWFDWTdHN3ZIRUxOeXFMVktXeE03aTdJNWtucVFSV2ha?=
 =?utf-8?B?S2w4cCtTVDNTVHNadUxobllRR3hkb0Noeno0M0E3NHR5bW0rZlo2V3NtdGhz?=
 =?utf-8?B?ZkMvdytLRnlNT1YzdjZmNkNpOXlDYmlNY01ZZkRtdnJvOFdGRmlkcjI5a3ky?=
 =?utf-8?B?QmR4NDRwRTcya3BRM2tTMFFPZS9DYlVza3g5MHVmb0JCU3dwbmtNR0UzclBM?=
 =?utf-8?B?Ri9XVlQzMGZINS9pUFY2S1JVckc1ZWZmK1hkSTV1Z0U0SlRsREJ5VkVVNS9C?=
 =?utf-8?B?eVIvR0JaSUJUQndydVN6UVJKQWthV0w2UjdjR2dDLzNqRkhDdnZXREkxL1l4?=
 =?utf-8?B?L3RLUUxZdDVDNVpjZlh1eGtOZXJVMVZBMUFMMTdrZlRYcUNLRFNQd0MraDl4?=
 =?utf-8?B?OWZiN1BsNDFIc0E4b2o2ZHBVejFkVHVCT1hqRkxpNS9iRDlzYzAyNUtZUC9o?=
 =?utf-8?B?OTJZUWJ4U0lHMDlyUUNEWGltOFE4QnR4V0s2QXdHOE95L2RqLzdXYTJsVi9r?=
 =?utf-8?B?Sjl4ZGpaMTA0Z3laQVJsNCtLNGY4L3FubFBiSFdzWGkrRzNTUnZ4THdYL1px?=
 =?utf-8?B?Z3o3TUVwWm9qd1BGMDk4UTljZjIxYXF4ck1wLzZRbmNCVVllVmZBUDRyNzBR?=
 =?utf-8?B?QUZSZ3l6TGdpT3ZkMDFuTHNXazVBRDdIdHl2Z3dLV2ZWdExnaEtUSG1nTFlj?=
 =?utf-8?B?aWR1bjFTekxQc1FyZGdpSCtzZFVwOU9xMGxiNlpnQXhpTnpRcVk3bVluN3Fw?=
 =?utf-8?B?SWtabTFGSGh0aVZESm53b3JDVHV3U3Yya0loMHFuYnIzNk1kZFU3ZTFkTkZF?=
 =?utf-8?B?d1JPSFdkWnk2TlcwQ3BGY1ZkZ0hoQkFTckFTS1NiSlN1VmphNUpQUFRmT04x?=
 =?utf-8?B?UWoyaE1CNnRteXF3TU0rY3NDUWpGa3VDVDRWNzRxL25JTWY0Q0MrNnRXQlFw?=
 =?utf-8?B?Y0paS2ZtSXFSb3c3K29EL0VZWmdtVTdOMnI4ZUJDamkxY1Z3RDFTNW5kY3R5?=
 =?utf-8?B?VWJRWU9OMXo5eXg3bnFnRUJMaDFmakFpaUJ4OFFrOVVyN2paemwvMmhQQWlp?=
 =?utf-8?B?b052eDdSSjY2dGhPT0hZZHJXbW9oT0ExSTU3b1hZMXlTVTVlZmcxd2FBN1NR?=
 =?utf-8?B?VWptV1hsQ0JkaUpDeGZlQzVmNm4vVE0xV1p5WjVxMWt6blJPYWMwcDl2bDJV?=
 =?utf-8?B?UHN1eDJnVEI2TWk1ckwyZnR1OW5raVczRVZqYmR0ai9LSktMNG9EWHM3dlZQ?=
 =?utf-8?B?VDZCWmllYytyRjg3SUE3UWFiZ2U0QVB5UjFzMGh2aHF5NXkyREpMYkxKVjQz?=
 =?utf-8?B?RWh3c3NQVHBzb2sxWnpka0FYZzRMU01RaFJuWEN0aFl4c2xxZVlCSW10V0dy?=
 =?utf-8?B?ZVFhdkt1SXkxcTZ3cythSlZvTU0zRTJvUUVRQjdEVjR0WVNLY2s2UGE1L0xN?=
 =?utf-8?B?aXB5cys5QytDZEdtMG9Qb2s4TWs2YmtoSE1VaGVVcTRXbFZIS2hBcjBXOXpR?=
 =?utf-8?B?Z01NZURLRTd3RmpCNDh1YTJpWGhGcWJZUnR0RUlsekxSU3dmTldwMGE4ZFQ1?=
 =?utf-8?Q?DGUgqpmjMAaQkoMJbpxUCj5Sg?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa91f89b-a57a-4932-f703-08dac7794453
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 02:21:27.8920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZtlScUJIFaJoOz492ThJKPRGNfdQE8gKSEPoqADcnx0GjDcwDYMSfGaDLaJVqRyZHbRYACDtLskEYMGrKv/1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB4928
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/16 7:00,
 Jaegeuk Kim wrote: > If compress_extension
 is set, and a newly created file matches the > extension, the file could
 be marked as compression file. However, > if inline_data is also [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.58 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.58 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ov83U-009v2P-Ob
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to enable compress for newly
 created file if extension matches
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/11/16 7:00, Jaegeuk Kim wrote:
> If compress_extension is set, and a newly created file matches the
> extension, the file could be marked as compression file. However,
> if inline_data is also enabled, there is no chance to check its
> extension since f2fs_should_compress() always returns false.
> 
> This patch moves set_compress_inode(), which do extension check, in
> f2fs_should_compress() to check extensions before setting inline
> data flag.
> 
> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
>   Checking this version.
> 
>   fs/f2fs/f2fs.h  |   2 +-
>   fs/f2fs/namei.c | 328 ++++++++++++++++++++++++------------------------
>   2 files changed, 163 insertions(+), 167 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b89b5d755ce0..dedac413bf64 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -2980,7 +2980,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
>   /* Flags that should be inherited by new inodes from their parent. */
>   #define F2FS_FL_INHERITED (F2FS_SYNC_FL | F2FS_NODUMP_FL | F2FS_NOATIME_FL | \
>   			   F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
> -			   F2FS_CASEFOLD_FL | F2FS_COMPR_FL | F2FS_NOCOMP_FL)
> +			   F2FS_CASEFOLD_FL)
>   
>   /* Flags that are appropriate for regular files (all but dir-specific ones). */
>   #define F2FS_REG_FLMASK		(~(F2FS_DIRSYNC_FL | F2FS_PROJINHERIT_FL | \
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index e104409c3a0e..cb7441a19d22 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -22,8 +22,161 @@
>   #include "acl.h"
>   #include <trace/events/f2fs.h>
>   
> +static inline int is_extension_exist(const unsigned char *s, const char *sub,
> +						bool tmp_ext)
> +{
> +	size_t slen = strlen(s);
> +	size_t sublen = strlen(sub);
> +	int i;
> +
> +	if (sublen == 1 && *sub == '*')
> +		return 1;
> +
> +	/*
> +	 * filename format of multimedia file should be defined as:
> +	 * "filename + '.' + extension + (optional: '.' + temp extension)".
> +	 */
> +	if (slen < sublen + 2)
> +		return 0;
> +
> +	if (!tmp_ext) {
> +		/* file has no temp extension */
> +		if (s[slen - sublen - 1] != '.')
> +			return 0;
> +		return !strncasecmp(s + slen - sublen, sub, sublen);
> +	}
> +
> +	for (i = 1; i < slen - sublen; i++) {
> +		if (s[i] != '.')
> +			continue;
> +		if (!strncasecmp(s + i + 1, sub, sublen))
> +			return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
> +							bool hot, bool set)
> +{
> +	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> +	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> +	int hot_count = sbi->raw_super->hot_ext_count;
> +	int total_count = cold_count + hot_count;
> +	int start, count;
> +	int i;
> +
> +	if (set) {
> +		if (total_count == F2FS_MAX_EXTENSION)
> +			return -EINVAL;
> +	} else {
> +		if (!hot && !cold_count)
> +			return -EINVAL;
> +		if (hot && !hot_count)
> +			return -EINVAL;
> +	}
> +
> +	if (hot) {
> +		start = cold_count;
> +		count = total_count;
> +	} else {
> +		start = 0;
> +		count = cold_count;
> +	}
> +
> +	for (i = start; i < count; i++) {
> +		if (strcmp(name, extlist[i]))
> +			continue;
> +
> +		if (set)
> +			return -EINVAL;
> +
> +		memcpy(extlist[i], extlist[i + 1],
> +				F2FS_EXTENSION_LEN * (total_count - i - 1));
> +		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
> +		if (hot)
> +			sbi->raw_super->hot_ext_count = hot_count - 1;
> +		else
> +			sbi->raw_super->extension_count =
> +						cpu_to_le32(cold_count - 1);
> +		return 0;
> +	}
> +
> +	if (!set)
> +		return -EINVAL;
> +
> +	if (hot) {
> +		memcpy(extlist[count], name, strlen(name));
> +		sbi->raw_super->hot_ext_count = hot_count + 1;
> +	} else {
> +		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
> +
> +		memcpy(buf, &extlist[cold_count],
> +				F2FS_EXTENSION_LEN * hot_count);
> +		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
> +		memcpy(extlist[cold_count], name, strlen(name));
> +		memcpy(&extlist[cold_count + 1], buf,
> +				F2FS_EXTENSION_LEN * hot_count);
> +		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
> +	}
> +	return 0;
> +}
> +
> +static void set_compress_new_inode(struct f2fs_sb_info *sbi, struct inode *dir,
> +				struct inode *inode, const unsigned char *name)
> +{
> +	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> +	unsigned char (*noext)[F2FS_EXTENSION_LEN] =
> +						F2FS_OPTION(sbi).noextensions;
> +	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
> +	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> +	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
> +	int i, cold_count, hot_count;
> +
> +	/* Caller should give the name of regular file or directory. */
> +	if (!f2fs_sb_has_compression(sbi) || !name)
> +		return;
> +
> +	if (S_ISDIR(inode->i_mode))
> +		goto inherit_comp;
> +
> +	/* Don't compress hot files. */
> +	f2fs_down_read(&sbi->sb_lock);
> +	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> +	hot_count = sbi->raw_super->hot_ext_count;
> +	for (i = cold_count; i < cold_count + hot_count; i++)
> +		if (is_extension_exist(name, extlist[i], false))
> +			break;
> +	f2fs_up_read(&sbi->sb_lock);
> +	if (i < (cold_count + hot_count))
> +		return;
> +
> +	/* Don't compress unallowed extension. */
> +	for (i = 0; i < noext_cnt; i++)
> +		if (is_extension_exist(name, noext[i], false))
> +			return;
> +inherit_comp:
> +	/* Inherit the {no-}compression flag in directory */
> +	if (F2FS_I(dir)->i_flags & F2FS_NOCOMP_FL) {
> +		F2FS_I(inode)->i_flags |= F2FS_NOCOMP_FL;
> +		return;

Hi, Jaegeuk,
It should not return immediately here. The scenario here is:

   mount -o compress_extension=txt,compress_mode=user
   mkdir dir
   f2fs_io setflags nocompression dir # set dir nocompression
   touch dir/file.txt
   f2fs_io getflags compression dir/file.txt # file.txt should have 
compression flag

According to f2fs.rst, if dir is set as nocompression, but file's
extension hit compress_extension, then the file should be compressed.
And before set_compress_context later, F2FS_NOCOMP_FL should be
cleared first.

thanks,
shengyong

> +	} else if (F2FS_I(dir)->i_flags & F2FS_COMPR_FL) {
> +		set_compress_context(inode);
> +		return;
> +	}
> +
> +	/* Compress wanting extension. */
> +	for (i = 0; i < ext_cnt; i++) {
> +		if (is_extension_exist(name, ext[i], false)) {
> +			set_compress_context(inode);
> +			return;
> +		}
> +	}
> +}
> +
>   static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
> -						struct inode *dir, umode_t mode)
> +						struct inode *dir, umode_t mode,
> +						const char *name)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>   	nid_t ino;
> @@ -114,12 +267,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>   	if (F2FS_I(inode)->i_flags & F2FS_PROJINHERIT_FL)
>   		set_inode_flag(inode, FI_PROJ_INHERIT);
>   
> -	if (f2fs_sb_has_compression(sbi)) {
> -		/* Inherit the compression flag in directory */
> -		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
> -					f2fs_may_compress(inode))
> -			set_compress_context(inode);
> -	}
> +	/* Check compression first. */
> +	set_compress_new_inode(sbi, dir, inode, name);
>   
>   	/* Should enable inline_data after compression set */
>   	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> @@ -153,40 +302,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>   	return ERR_PTR(err);
>   }
>   
> -static inline int is_extension_exist(const unsigned char *s, const char *sub,
> -						bool tmp_ext)
> -{
> -	size_t slen = strlen(s);
> -	size_t sublen = strlen(sub);
> -	int i;
> -
> -	if (sublen == 1 && *sub == '*')
> -		return 1;
> -
> -	/*
> -	 * filename format of multimedia file should be defined as:
> -	 * "filename + '.' + extension + (optional: '.' + temp extension)".
> -	 */
> -	if (slen < sublen + 2)
> -		return 0;
> -
> -	if (!tmp_ext) {
> -		/* file has no temp extension */
> -		if (s[slen - sublen - 1] != '.')
> -			return 0;
> -		return !strncasecmp(s + slen - sublen, sub, sublen);
> -	}
> -
> -	for (i = 1; i < slen - sublen; i++) {
> -		if (s[i] != '.')
> -			continue;
> -		if (!strncasecmp(s + i + 1, sub, sublen))
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> -
>   /*
>    * Set file's temperature for hot/cold data separation
>    */
> @@ -217,124 +332,6 @@ static inline void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *
>   		file_set_hot(inode);
>   }
>   
> -int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
> -							bool hot, bool set)
> -{
> -	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> -	int cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> -	int hot_count = sbi->raw_super->hot_ext_count;
> -	int total_count = cold_count + hot_count;
> -	int start, count;
> -	int i;
> -
> -	if (set) {
> -		if (total_count == F2FS_MAX_EXTENSION)
> -			return -EINVAL;
> -	} else {
> -		if (!hot && !cold_count)
> -			return -EINVAL;
> -		if (hot && !hot_count)
> -			return -EINVAL;
> -	}
> -
> -	if (hot) {
> -		start = cold_count;
> -		count = total_count;
> -	} else {
> -		start = 0;
> -		count = cold_count;
> -	}
> -
> -	for (i = start; i < count; i++) {
> -		if (strcmp(name, extlist[i]))
> -			continue;
> -
> -		if (set)
> -			return -EINVAL;
> -
> -		memcpy(extlist[i], extlist[i + 1],
> -				F2FS_EXTENSION_LEN * (total_count - i - 1));
> -		memset(extlist[total_count - 1], 0, F2FS_EXTENSION_LEN);
> -		if (hot)
> -			sbi->raw_super->hot_ext_count = hot_count - 1;
> -		else
> -			sbi->raw_super->extension_count =
> -						cpu_to_le32(cold_count - 1);
> -		return 0;
> -	}
> -
> -	if (!set)
> -		return -EINVAL;
> -
> -	if (hot) {
> -		memcpy(extlist[count], name, strlen(name));
> -		sbi->raw_super->hot_ext_count = hot_count + 1;
> -	} else {
> -		char buf[F2FS_MAX_EXTENSION][F2FS_EXTENSION_LEN];
> -
> -		memcpy(buf, &extlist[cold_count],
> -				F2FS_EXTENSION_LEN * hot_count);
> -		memset(extlist[cold_count], 0, F2FS_EXTENSION_LEN);
> -		memcpy(extlist[cold_count], name, strlen(name));
> -		memcpy(&extlist[cold_count + 1], buf,
> -				F2FS_EXTENSION_LEN * hot_count);
> -		sbi->raw_super->extension_count = cpu_to_le32(cold_count + 1);
> -	}
> -	return 0;
> -}
> -
> -static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> -						const unsigned char *name)
> -{
> -	__u8 (*extlist)[F2FS_EXTENSION_LEN] = sbi->raw_super->extension_list;
> -	unsigned char (*noext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).noextensions;
> -	unsigned char (*ext)[F2FS_EXTENSION_LEN] = F2FS_OPTION(sbi).extensions;
> -	unsigned char ext_cnt = F2FS_OPTION(sbi).compress_ext_cnt;
> -	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
> -	int i, cold_count, hot_count;
> -
> -	if (!f2fs_sb_has_compression(sbi) ||
> -			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
> -			!f2fs_may_compress(inode) ||
> -			(!ext_cnt && !noext_cnt))
> -		return;
> -
> -	f2fs_down_read(&sbi->sb_lock);
> -
> -	cold_count = le32_to_cpu(sbi->raw_super->extension_count);
> -	hot_count = sbi->raw_super->hot_ext_count;
> -
> -	for (i = cold_count; i < cold_count + hot_count; i++) {
> -		if (is_extension_exist(name, extlist[i], false)) {
> -			f2fs_up_read(&sbi->sb_lock);
> -			return;
> -		}
> -	}
> -
> -	f2fs_up_read(&sbi->sb_lock);
> -
> -	for (i = 0; i < noext_cnt; i++) {
> -		if (is_extension_exist(name, noext[i], false)) {
> -			f2fs_disable_compressed_file(inode);
> -			return;
> -		}
> -	}
> -
> -	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
> -		return;
> -
> -	for (i = 0; i < ext_cnt; i++) {
> -		if (!is_extension_exist(name, ext[i], false))
> -			continue;
> -
> -		/* Do not use inline_data with compression */
> -		stat_dec_inline_inode(inode);
> -		clear_inode_flag(inode, FI_INLINE_DATA);
> -		set_compress_context(inode);
> -		return;
> -	}
> -}
> -
>   static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
>   		       struct dentry *dentry, umode_t mode, bool excl)
>   {
> @@ -352,15 +349,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
>   	if (err)
>   		return err;
>   
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
>   	if (IS_ERR(inode))
>   		return PTR_ERR(inode);
>   
>   	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
>   		set_file_temperature(sbi, inode, dentry->d_name.name);
>   
> -	set_compress_inode(sbi, inode, dentry->d_name.name);
> -
>   	inode->i_op = &f2fs_file_inode_operations;
>   	inode->i_fop = &f2fs_file_operations;
>   	inode->i_mapping->a_ops = &f2fs_dblock_aops;
> @@ -689,7 +684,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
>   	if (err)
>   		return err;
>   
> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
>   	if (IS_ERR(inode))
>   		return PTR_ERR(inode);
>   
> @@ -760,7 +755,8 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>   	if (err)
>   		return err;
>   
> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode,
> +						dentry->d_name.name);
>   	if (IS_ERR(inode))
>   		return PTR_ERR(inode);
>   
> @@ -817,7 +813,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>   	if (err)
>   		return err;
>   
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>   	if (IS_ERR(inode))
>   		return PTR_ERR(inode);
>   
> @@ -856,7 +852,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
>   	if (err)
>   		return err;
>   
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>   	if (IS_ERR(inode))
>   		return PTR_ERR(inode);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
