Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D3B72D740
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 04:09:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8tTA-0004ZF-Og;
	Tue, 13 Jun 2023 02:09:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8tT8-0004Z8-VT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 02:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O7BevQuKPCIO62XN8BbzhJPp8Bgri1ZePNMMQ/Gtevw=; b=e6FaBkofzkrVji9fH+7hX7ga+Y
 jswN1DndC+GBZfr0xVMScikaN3Mo0I9JVfStszS4X6QeD+21G2Ja/HpF4tGvvvHzmw4Vxp3no4cPb
 HBynNq6xDiefr1Aps2I0s2Ymmf3PJ8eksTIGobh8XANwfBXIcrt9ZKMrUVkjdgdhnhPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O7BevQuKPCIO62XN8BbzhJPp8Bgri1ZePNMMQ/Gtevw=; b=GfJqk6VXCCC7sACekFIPx7Tm0u
 Tw5zL4Q39E3kadDcQJq8gpL+xiAZAjFZsSu17W2+bs/zfb+WJhGgYYLRKpyA4e/1N7eINKb0ppxN9
 qO2viurCJgYqfrki6hFQm0X0PRg38awBzMrj+AOHY34Z6JGG6BUYQZPKtRk3SitTg1Zs=;
Received: from mail-sgaapc01on2053.outbound.protection.outlook.com
 ([40.107.215.53] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8tT8-001GCp-9s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 02:09:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lw8Ike6KRW2jsB+uEi6RoqG70n2TrC7euEcIW/oSzuq9f0ienib7uXjtIpLXhsv6SPjZAAqviOTP2EdWtAVEii9o2eQQSfw+RPWR0XRXsaWThOfhSVOZkD0t8rO0zTphz3zVq8E2DXiHBFRKkiSEGXhLyiUGyK54tkrIbTTnndUNMm0zdfz/uqWvEt6n7yo2AH9TvfbM4inxxLWq28pdODb7NamjwsjQVg0DBTheyy6f+MUsjTHkOm7Sd8YsrDMLf8+FOaaJ0mN0xa9yjTuFIHyhZ+u8QMsmmHov3JTDOBIiMEzN/NeDd4Ia4RUPsrNDLELi2rIobuImYOiZEdzZOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O7BevQuKPCIO62XN8BbzhJPp8Bgri1ZePNMMQ/Gtevw=;
 b=XFWi4QuPzpsgbN9pPrSGoXoUTHzmpkbWIDIZGI+Hncyal/kbdjUWiflGynzYpp/B7w1bPVg2/BpHzlEWOHSysE+M6NeK5L4gfIDRv7rf8CjA1KZfs/ulzsx+TjJntl7ouhXpAxLVaonZwludmybKGvkWQBjKG7KytpFhlmHyJ8liB8XMCJGqBkZZiiYzflT1Jt+kyKFmHoafFZYxHJOYs8q7HZ3I1gCF95zO93vOxo395JkBEymRSCNy2QaEkmDQFh+bnQAPOqUdtZrWhQxkTZ7WbIk7BnGVhS8KdZk/XDH4U605+3VR4Ou3J8UvjIP4fXlNP/lqgEN0LPk0Idj/1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O7BevQuKPCIO62XN8BbzhJPp8Bgri1ZePNMMQ/Gtevw=;
 b=KVVX36EzK+iELX5Fr7o+yxEC4ULhvss57NhjDYra55CIMCVjxS4rWVrFuetV1FRODdvv7bpURr+N0pqUTQoO8c+k084evuNoJ5isK+fmUKRlpVc1mR7EA9LkLPw6I1MLyPdPFqabmdbPOKQ+2fvQRRJhqWn4Pobb7Zxv3Zob9zQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SEZPR02MB6133.apcprd02.prod.outlook.com (2603:1096:101:a0::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Tue, 13 Jun 2023 01:53:10 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 01:53:10 +0000
Message-ID: <66107ad2-1c1e-7e25-a8f5-167f4d06525c@oppo.com>
Date: Tue, 13 Jun 2023 09:53:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230612030121.2393541-1-shengyong@oppo.com>
 <20230612030121.2393541-6-shengyong@oppo.com> <ZIc9+N2GIQepZcCq@google.com>
Content-Language: en-US
In-Reply-To: <ZIc9+N2GIQepZcCq@google.com>
X-ClientProxiedBy: SI2P153CA0031.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::7)
 To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SEZPR02MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 7388813c-4022-42b7-3f36-08db6bb0f0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nzJxJDUlStB+hQCgYEYueeeto5BtD7pXvmnIInKrCgV15brQWPTCvZSlJg+4Pu/bLl9aLWbomAmE5FhFtREcTBfQVC//m8F5sd7x4y+G9m1cHjM8sS97HsAqeM62HCQrIlfOUdH3YX9EthZegqXZmfIcvZGcI0Hr7d7q0A4+8ZTSX6THsi5gQZkr/YpWjmv7bhLA2m3d4251i7a10vZOS6xPp6U+lllNj8R1wPWz+tcjXPMvcs1wiD2Qvbf4BR/JZOTtAerhwb5bVwVfUf4++PDnbdvTlqIQk695FM5U2HzUKRFDXZFxC4Hv3BIaCCu6KIF1sNfk1YbQMnhrI++mvMwbtoFtL25nieiv3xjhCFbSJ8rmfiBG5V1hnngwxSvgp62goJqXQI6FlOVKTHt1utl5wxZp/U8weoUrYI7PvIhEn45KCBLxHIeOwlePBH+nRh/WDZi7s6I35LJoJ/wGB+N4lhXv7fFbZumymwN7V/20ulq7R/AjiX3LQgqTUc49biAnlxTqz9yO8TSU5iVViXN8qDNmiXKlp9J8vfifhPtizlCH3IOmVv7cICyfAEOXsejK2HdDvBDydfEfJeWzoA5+0IZAXAb0gppJSo7vcb58sZOiegOm2CqFTXJfOdZwYR8FLl9eDLG4690fkjgZmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(39860400002)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(38100700002)(86362001)(31696002)(36756003)(478600001)(4326008)(6666004)(966005)(6486002)(8936002)(8676002)(30864003)(2906002)(5660300002)(66556008)(66946007)(66476007)(31686004)(41300700001)(6916009)(316002)(53546011)(186003)(6512007)(6506007)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVFvRFhoV1ZpKzV0S2ZiU24vUzlxQXlDRjhKL0lNQ3cvUzRISjRhU0orcXZy?=
 =?utf-8?B?ZkFPQkhLRnBCNEpmbE9aZmJvNG5HckFQQTBIQUVkL0l4b0R6dXpFVjU1UmVC?=
 =?utf-8?B?cjMyampOeVM1anFIR243ZEU1TStjWE5Od1MyRHlES0VYVlU4K2JENFF1V0F5?=
 =?utf-8?B?cnBtbkg4QjhUalFhWm5PbXlocU0rTWhXZDg3ajEreTNGNk1iS3ZibFBlVGNW?=
 =?utf-8?B?K1U2NDNrSVF6UmxxUWgrSnJMVFBzWUcyM1I2dlZLZDJqR3pmTXpMZGNNUVlG?=
 =?utf-8?B?OVFickNzWk15bHJicStqTDJ2U0tiVE95L29xbmZJdUhzdjhYWjJlVEQxR2J0?=
 =?utf-8?B?UjRIKzhHSWkrbTFmS2xVYllweUNjYWxONzg0L1dSMlFVY2FOQkJSV3JlQjZH?=
 =?utf-8?B?Wk0vai9WTTR0Q25JVXdIV3hmUUdsWEtpcVl4UE9seEpQblRSckpZdGRUaGRC?=
 =?utf-8?B?VkdhMVJNOC9KL3VXR255VVN5b09tOE9NZTdIOEpFYkJ2UVN2Q051ZFNWclpM?=
 =?utf-8?B?dzVUaW5VRVpUcWtVNDBDOGIrSXE0bWZwMVlERGhRTnhHYWt3ZlBXN2Evb1Js?=
 =?utf-8?B?dzlUVGJGYVpsdFNBSDQrMDFUYWkwcHorbVE4WkY5dWNQNkZGY1B4a1FRVk1Z?=
 =?utf-8?B?bXFzTUF3WXhUL2c4WG9xdWk2a2M5SVUrRElIbU1laENsb1JZV1AyYm1ZY1ZB?=
 =?utf-8?B?UVdMTXZDZmcwak0vYVZKZ0dnZmw0cGFwQ01lU0NEdFZ6TDRnZlpVdVA3aWds?=
 =?utf-8?B?YndGZFp5dzl2L2svcXRRc1pZVE4rcUJOR1p4d1dsU2xwY2pvaWxVQU5icVAx?=
 =?utf-8?B?dkxSem5sMzMydWRBMjBFVmhXZFpKN3lPeDdHVmVMczk5YlgvSDFjNjhZZ2Zm?=
 =?utf-8?B?VzBtdFhUWVAxeHkyTUxocFBGTW1Xc2hQRHJVVzN0elVxYWV4b1JiS1BDeUJT?=
 =?utf-8?B?c2YvYm1raUMzOHNiZWhWcHpzVUtIcUE1ZHRzOHBsenQ5Vno2dUttOHZYVDVX?=
 =?utf-8?B?OUk3KzA1QVMzeEFXY01Qbm1wa0p4MXU1NUFUTzRhZzFhTERUYkhxb25IZE92?=
 =?utf-8?B?ajViNEo1SlMvQ2V2OVF4VVNuTTAzcHdVRmZGRlFpSCtrMllqNlpTaGU4RE1W?=
 =?utf-8?B?d0RaQVpHVVlhQkFaU1JramIzZG02VXJSQ0NzQ0dtQ3AvRWFWL1dCdGU2UHFa?=
 =?utf-8?B?cHdKYzMyQ3drU1E1ZW92NWxvRkFwZ1VhSFA1SUI0WEg0djhyNHRCcSs5N2JQ?=
 =?utf-8?B?NVhUbmorQ0swTmNJWklwYStYQ3dWRXphYmxoaDJIdSsvaGRrWEhUcjM1SXBp?=
 =?utf-8?B?ZG9rY29VbGgxODJRWVFsY0NNRklqTS92dVNJMENUOGJyc1Y4bjJjekNMeGFy?=
 =?utf-8?B?aW9lK0tjZGg4L2ZaYWIzK3RLQXJ5czhJdVV0UmtOT1Q3bVNobmt3WFVHYUI0?=
 =?utf-8?B?WGNQNDBQQ0RxUHE5WUFXRnBRVkNtRktPQTBiQkluK2x4Zm1UYkVpb1lQNzRQ?=
 =?utf-8?B?WE9sNmJaOVo4SUNXRytZZlRiNWZVemxaekFGd0x1dFYyampwaXArV2hETzVO?=
 =?utf-8?B?ZTllZ2lFMmMwSXBiVFVENWVxS3R1d1JZQXFTc0tJTmZZMExkK3dwcUU1bHly?=
 =?utf-8?B?djkrdDh6Nmp4N0NIQWkzcWpUVEx3QXk0ZVRvTlJ5N2I0ejFiUUxyNXVDRHN4?=
 =?utf-8?B?OFdFUFJnTHBzMXhxYk1leUROS2Z4OTZWUkpFbjd4aUtSaE85bHZvK1QrNHhm?=
 =?utf-8?B?aklOZUF4Vk1RcnhVekNPcTZHV284dTVGUlduUUtnbXhtbkhTZnNOSWsrMDNo?=
 =?utf-8?B?RnBnNWlFRkthQ3ZTODRYU0ZKVy9QeTFUdzN5cFJQWXFnTXA0bm4zaGlzSnNL?=
 =?utf-8?B?bXN0NXBWUkl4YUJvVW5TT0k5aWc5QlQ0WDJtRXI2TUxxYUJ1VytnblkyZUpu?=
 =?utf-8?B?NmdvWnM3VnhSNFNHWFhVWEhVU3VNOFNPSWg4bkpxUTZDci9nZVQ4SEVtdjlo?=
 =?utf-8?B?Y0o3cGg0UGl1SWtONnJQeTFoaXJ0cjRiYjEyUXRUak9COVZqWGZpOGhyYnAx?=
 =?utf-8?B?WFQxczRjTEh1NDFVNFBKMFhQVUtSaGczdUxzNHVPR0tqcHpOemhqTFpJRnZl?=
 =?utf-8?Q?I1a/t1RNB+09sibVO8Z7r2TRK?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7388813c-4022-42b7-3f36-08db6bb0f0e2
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 01:53:10.3669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztNKmPQlS0yKSYTddmhH1XUiha6jIy64gG3k82MxYzM2tMI4Mcw03niR1VAmYP7OSo64jHPJLrnjjLZaH24JeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB6133
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/12 23:47, Jaegeuk Kim wrote: > On 06/12, Sheng Yong
 wrote: >> This patch introduces two ioctls: >> * f2fs_ioc_get_extra_attr
 >> * f2fs_ioc_set_extra_attr >> to get or modify values in f2fs_i [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.53 listed in list.dnswl.org]
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
X-Headers-End: 1q8tT8-001GCp-9s
Subject: Re: [f2fs-dev] [PATCH v4 5/6] f2fs: add
 f2fs_ioc_[get|set]_extra_attr
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



On 2023/6/12 23:47, Jaegeuk Kim wrote:
> On 06/12, Sheng Yong wrote:
>> This patch introduces two ioctls:
>>    * f2fs_ioc_get_extra_attr
>>    * f2fs_ioc_set_extra_attr
>> to get or modify values in f2fs_inode's extra attribute area.
> 
> What'd be the main purpose of this new ioctl? Use-cases or examples?

Hi, Jaegeuk,

When a new feature is added, f2fs_inode extra attributes needs to be
extended sometimes to save status or control values, say compression,
inode chksum, inode crtime.

If some of them could be read or modified during runtime, a new ioctl
is required in most cases, like F2FS_IOC_GET_COMPRESS_BLOCKS,
F2FS_IOC_GET_COMPRESS_OPTION...
And Yangtao [1] and I [2] also tried to add new ioctls to allow getting
and settingcompress level and flags.

If new features are added in the future, we may get a verty long and
not-easy-to-extend ioctl list.

So these 2 ioctls could help manage all extra attributes:
   * if a new extra attribute is added, we only need to add a new field type,
     and corresponding get/set functions
   * attr_size can indicate which version of attribute is used
   * besides, ioc_set_extra_attr(i_inline_xattr_size) gives us a chance to
     adjust inline xattr size for an empty file

thanks,
shengyong

Links:
[1] https://lore.kernel.org/linux-f2fs-devel/20230112133503.16802-1-frank.li@vivo.com/
[2] https://sourceforge.net/p/linux-f2fs/mailman/linux-f2fs-devel/?viewmonth=202303
> 
>>
>> The argument of these two ioctls is `struct f2fs_extra_attr', which has
>> three members:
>>    * field: indicates which field in extra attribute area is handled
>>    * attr: value or userspace pointer
>>    * attr_size: size of `attr'
>>
>> The `field' member could help extend functionality of these two ioctls
>> without modify or add new interfaces, if more fields are added into
>> extra attributes ares in the feture.
>>
>> Signed-off-by: Sheng Yong <shengyong@oppo.com>
>> ---
>>   fs/f2fs/file.c            | 205 ++++++++++++++++++++++++++++++++++++++
>>   include/uapi/linux/f2fs.h |  25 +++++
>>   2 files changed, 230 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index f8aa842b5d233..39d04f8f0bb6b 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4179,6 +4179,207 @@ static int f2fs_ioc_compress_file(struct file *filp)
>>   	return ret;
>>   }
>>   
>> +static bool extra_attr_fits_in_inode(struct inode *inode, int field)
>> +{
>> +	struct f2fs_inode_info *fi = F2FS_I(inode);
>> +	struct f2fs_inode *ri;
>> +
>> +	switch (field) {
>> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
>> +	case F2FS_EXTRA_ATTR_ISIZE:
>> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
>> +		return true;
>> +	case F2FS_EXTRA_ATTR_PROJID:
>> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid))
>> +			return false;
>> +		return true;
>> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
>> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
>> +			return false;
>> +		return true;
>> +	case F2FS_EXTRA_ATTR_CRTIME:
>> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime))
>> +			return false;
>> +		return true;
>> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
>> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
>> +		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_compr_blocks))
>> +			return false;
>> +		return true;
>> +	default:
>> +		BUG_ON(1);
>> +		return false;
>> +	}
>> +}
>> +
>> +static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
>> +{
>> +	struct inode *inode = file_inode(filp);
>> +	struct f2fs_inode_info *fi = F2FS_I(inode);
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	struct f2fs_extra_attr attr;
>> +	u32 chksum;
>> +	int ret = 0;
>> +
>> +	if (!f2fs_has_extra_attr(inode))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
>> +		return -EFAULT;
>> +
>> +	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
>> +		return -EINVAL;
>> +
>> +	if (!extra_attr_fits_in_inode(inode, attr.field))
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (attr.field) {
>> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
>> +		attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
>> +		break;
>> +	case F2FS_EXTRA_ATTR_ISIZE:
>> +		attr.attr = fi->i_extra_isize;
>> +		break;
>> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
>> +		if (!f2fs_has_inline_xattr(inode))
>> +			return -EOPNOTSUPP;
>> +		attr.attr = get_inline_xattr_addrs(inode);
>> +		break;
>> +	case F2FS_EXTRA_ATTR_PROJID:
>> +		if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
>> +			return -EOPNOTSUPP;
>> +		attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
>> +		break;
>> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
>> +		ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
>> +		if (ret)
>> +			return ret;
>> +		attr.attr = chksum;
>> +		break;
>> +	case F2FS_EXTRA_ATTR_CRTIME:
>> +		if (!f2fs_sb_has_inode_crtime(sbi))
>> +			return -EOPNOTSUPP;
>> +		if (attr.attr_size == sizeof(struct timespec64)) {
>> +			if (put_timespec64(&fi->i_crtime,
>> +					(void __user *)(uintptr_t)attr.attr))
>> +				return -EFAULT;
>> +		} else if (attr.attr_size == sizeof(struct old_timespec32)) {
>> +			if (put_old_timespec32(&fi->i_crtime,
>> +					(void __user *)(uintptr_t)attr.attr))
>> +				return -EFAULT;
>> +		} else {
>> +			return -EINVAL;
>> +		}
>> +		break;
>> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
>> +		if (attr.attr_size != sizeof(__u64))
>> +			return -EINVAL;
>> +		ret = f2fs_get_compress_blocks(inode, &attr.attr);
>> +		break;
>> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
>> +		ret = f2fs_ioc_get_compress_option(filp, attr.attr);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
>> +		return -EFAULT;
>> +
>> +	return 0;
>> +}
>> +
>> +static int f2fs_ioc_set_extra_attr(struct file *filp, unsigned long arg)
>> +{
>> +	struct inode *inode = file_inode(filp);
>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>> +	struct f2fs_extra_attr attr;
>> +	struct page *ipage;
>> +	void *inline_addr;
>> +	int ret;
>> +
>> +	if (!f2fs_has_extra_attr(inode))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
>> +		return -EFAULT;
>> +
>> +	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
>> +		return -EINVAL;
>> +
>> +	if (!extra_attr_fits_in_inode(inode, attr.field))
>> +		return -EOPNOTSUPP;
>> +
>> +	switch (attr.field) {
>> +	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
>> +	case F2FS_EXTRA_ATTR_ISIZE:
>> +	case F2FS_EXTRA_ATTR_PROJID:
>> +	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
>> +	case F2FS_EXTRA_ATTR_CRTIME:
>> +	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
>> +		/* read only attribtues */
>> +		return -EOPNOTSUPP;
>> +	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
>> +		if (!f2fs_sb_has_flexible_inline_xattr(sbi) ||
>> +		    !f2fs_has_inline_xattr(inode))
>> +			return -EOPNOTSUPP;
>> +		if (attr.attr < MIN_INLINE_XATTR_SIZE ||
>> +		    attr.attr > MAX_INLINE_XATTR_SIZE)
>> +			return -EINVAL;
>> +		inode_lock(inode);
>> +		f2fs_lock_op(sbi);
>> +		f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
>> +		if (i_size_read(inode) || F2FS_I(inode)->i_xattr_nid) {
>> +			/*
>> +			 * it is not allowed to set this field if the inode
>> +			 * has data or xattr node
>> +			 */
>> +			ret = -EFBIG;
>> +			goto xattr_out_unlock;
>> +		}
>> +		ipage = f2fs_get_node_page(sbi, inode->i_ino);
>> +		if (IS_ERR(ipage)) {
>> +			ret = PTR_ERR(ipage);
>> +			goto xattr_out_unlock;
>> +		}
>> +		inline_addr = inline_xattr_addr(inode, ipage);
>> +		if (!IS_XATTR_LAST_ENTRY(XATTR_FIRST_ENTRY(inline_addr))) {
>> +			ret = -EFBIG;
>> +		} else {
>> +			struct f2fs_xattr_header *hdr;
>> +			struct f2fs_xattr_entry *ent;
>> +
>> +			F2FS_I(inode)->i_inline_xattr_size = (int)attr.attr;
>> +			inline_addr = inline_xattr_addr(inode, ipage);
>> +			hdr = XATTR_HDR(inline_addr);
>> +			ent = XATTR_FIRST_ENTRY(inline_addr);
>> +			hdr->h_magic = cpu_to_le32(F2FS_XATTR_MAGIC);
>> +			hdr->h_refcount = cpu_to_le32(1);
>> +			memset(ent, 0, attr.attr - sizeof(*hdr));
>> +			set_page_dirty(ipage);
>> +			ret = 0;
>> +		}
>> +		f2fs_put_page(ipage, 1);
>> +xattr_out_unlock:
>> +		f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
>> +		f2fs_unlock_op(sbi);
>> +		inode_unlock(inode);
>> +		if (!ret)
>> +			f2fs_balance_fs(sbi, true);
>> +		break;
>> +	case F2FS_EXTRA_ATTR_COMPR_OPTION:
>> +		ret = f2fs_ioc_set_compress_option(filp, attr.attr);
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>   {
>>   	switch (cmd) {
>> @@ -4265,6 +4466,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>   		return f2fs_ioc_decompress_file(filp);
>>   	case F2FS_IOC_COMPRESS_FILE:
>>   		return f2fs_ioc_compress_file(filp);
>> +	case F2FS_IOC_GET_EXTRA_ATTR:
>> +		return f2fs_ioc_get_extra_attr(filp, arg);
>> +	case F2FS_IOC_SET_EXTRA_ATTR:
>> +		return f2fs_ioc_set_extra_attr(filp, arg);
>>   	default:
>>   		return -ENOTTY;
>>   	}
>> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
>> index 955d440be1046..2b53e90421bfc 100644
>> --- a/include/uapi/linux/f2fs.h
>> +++ b/include/uapi/linux/f2fs.h
>> @@ -43,6 +43,10 @@
>>   #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
>>   #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
>>   #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
>> +#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
>> +						struct f2fs_extra_attr)
>> +#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
>> +						struct f2fs_extra_attr)
>>   
>>   /*
>>    * should be same as XFS_IOC_GOINGDOWN.
>> @@ -96,4 +100,25 @@ struct f2fs_comp_option {
>>   	__u8 log_cluster_size;
>>   };
>>   
>> +enum {
>> +	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
>> +	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
>> +	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
>> +	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
>> +	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
>> +	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
>> +	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
>> +	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
>> +						 *     i_log_cluster_size
>> +						 */
>> +	F2FS_EXTRA_ATTR_MAX,
>> +};
>> +
>> +struct f2fs_extra_attr {
>> +	__u8 field;		/* F2FS_EXTRA_ATTR_* */
>> +	__u8 rsvd1;
>> +	__u16 attr_size;	/* size of @attr */
>> +	__u32 rsvd2;
>> +	__u64 attr;		/* attr value or pointer */
>> +};
>>   #endif /* _UAPI_LINUX_F2FS_H */
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
