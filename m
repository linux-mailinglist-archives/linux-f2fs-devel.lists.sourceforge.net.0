Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0875A71A056
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 16:37:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4jQw-0000ts-SY;
	Thu, 01 Jun 2023 14:37:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q4jQv-0000tm-BB
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dqNw+Pw8Pc/qPdLXNgzyXTTWBPNjQes+YJGdDqgr6k8=; b=bTMe0LyAw4e/1WeeK/It6OECAe
 GGWV3DJI7+MRRIW/JregMSsVGABjUPqWcrH6If2DJ6ywPEIRrxix8bPX4FsRl6yaR4dxzCmlNUdUC
 zQd+A49gwl1iZJDree9xPOouphA3q9YdML2lvIEKderN6TDvV4lSrCPWdVIJTa3qUNUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dqNw+Pw8Pc/qPdLXNgzyXTTWBPNjQes+YJGdDqgr6k8=; b=W/4XikKpfKEYmq+Nx2R74Mv1yF
 CNb+2wrbR7BlbSF6ae2Jq1Kil9M/VVSo/lBZwIDkwD00o5eJ/nKYV1ZNIa9l2FeeQ0ibAfJd36m+q
 phey81JHMNht6qtNXAVfo7qIezYBhobqgxljm9PQ7tcIaAYvqKUHteLI0kOAj4EMiM1E=;
Received: from mail-tyzapc01on2084.outbound.protection.outlook.com
 ([40.107.117.84] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4jQq-008RTk-Pu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 14:37:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+0llvVMveDchMehDCntivXtGiT/gwbQrlRz97QRJuYkIYJQCWvhVDYyNI0aPHF7f+oDRGbW8to/jRBnhJ+7y7HGazx31HBdEK2x4GGfhGN6n9KuSoMJnCfeN8ebUoq475AVAacMk1Cw4p0xefd8rv3nJjbc6oOh0FdcOO39TRZTwT9ttehu6Iq37tXR3lyaXgo0TNISGzX5RbbJ6SqNp4bHDDbx2Gs/yAF1kfXThfLQpEXeUAyJ+D5HbemxVqnfIPxUUOAuIGBmp7KOuSpppFLaadMWeNpfZxI2PmQVAC/nKmYfcmnktouiklpSWXhZmSosuuDG1NLYjI7SlMGxFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqNw+Pw8Pc/qPdLXNgzyXTTWBPNjQes+YJGdDqgr6k8=;
 b=ZggXdcVi4gtwKdrf6lMIxMlR1XdYNh+Bsix8PEfFRRHxl5p+mqDAuf9BND5BoVdviwwejBJitSTOHGTNULmS10u1wKYeK6XbjdSl5zgTpUzkMAvI0xhDDLTLR/GPkQYvbKIpXTgkhRiQZvtYwzNM2FLZw+3wuObeDqwSu0A8c3sw14JGMIsT3oV2zwLu+llBHQtp2bXEz3i1LpP2doYFU1z+Vphw0d5nPGI9YoV9x2SEh4jj0yYC/eyzEtNmGWtXhlDgPk28Fi0/LxdRcoJ2TSw/Aiv4tIR1I9a/JxdVsWYRy6FnM31GsSdss1mSbNb7chLYxonq6F72CHwrUkRmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqNw+Pw8Pc/qPdLXNgzyXTTWBPNjQes+YJGdDqgr6k8=;
 b=i1jDort5Bk1gTafB9WbC64LpZbZn1tyantIFNZHHSQTK46zxNEiIqgX5/VPg5gEFJgSrOPauSXlqDpOqopw9u9YiJArBPoQoXLeOT6yRSpysex/CoZD88NYOTC+7VfFTs7cFmR12Qnjh8uPYDlZ2rlvoErlKg/PxesypteoJ5vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TYZPR02MB5988.apcprd02.prod.outlook.com (2603:1096:400:1f3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.8; Thu, 1 Jun 2023 14:37:27 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 14:37:27 +0000
Message-ID: <d156c532-3531-c1ca-7d9f-fd77df47242a@oppo.com>
Date: Thu, 1 Jun 2023 22:37:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>
References: <20230529013502.2230810-1-shengyong@oppo.com>
 <20230601031658.GA728@quark.localdomain>
In-Reply-To: <20230601031658.GA728@quark.localdomain>
X-ClientProxiedBy: SG2PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:3:18::13) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TYZPR02MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: f03563c0-ea3a-4d08-7f30-08db62adb8cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /sE5GZyGlCuI9c7m4aIp+wteo9yO5T8EmjFPqcM5X8g+tl6HeME65eQCYFjVb3ghnoOX0WhZVlXtwAtoRnZ3LRpE+4dvYppBMydIrFt6LW0F+JUMZHvFfnJBPfqMJnPH8LyQlmWs8EXDrCadByo7pmxSqSI0p5zMD4rVL7tenM4VV09IYnY/AolGUEHaZ0duMCe9VjvhcC4v2R4rODRRABa7AWLfBfj0ZyUhsJiA4oYRO9jV5XIROR7tnbB+gTU9AupkjSFBsqyw6Cpn9sqZ5ZaWkPFmVAbzV1qFWu5LU7OslUdmtKYdA3M8RHx6Qjwb2yn4LskzuhneyZwp4D80DS/GXJpZC6wuIztgWGbpJ8xS5Yr2DASJvKyUuKifYdEQNr8P2wu+v37Z3/TlWP0mOJyaZSfCQsiBIRAwK6FdORiWff0EKoG5XVrYdtSv2SvTbKkLoJGTl5fBV3JqPD05JQEWG0NC5tHkLi7i8nMq8m2LjRwvTfVEGRiHW1JTE0TMXIvSnIFmMmE5E2OcSXJ5bcvXgQ4HKsxix3Jro/gYt/0M9vWesVpAfgYUGCHZSk4wcY4Go38CXoSpBPZyvKluXQdrrZf1FUFmdL1S89ULSSMthAenqxYp1PuESbJpUW1B1hiaL/ArTiEfpe0IUMsTpA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199021)(478600001)(8676002)(8936002)(5660300002)(36756003)(2906002)(31696002)(86362001)(6916009)(4326008)(66946007)(66476007)(316002)(66556008)(38100700002)(41300700001)(83380400001)(31686004)(186003)(6506007)(26005)(6512007)(53546011)(2616005)(6486002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SkV2Tjg0NXVrT253Vy8vam54bXcrOXcvVVZhWW5pSjFUL0ZuZTRNU0JULyt3?=
 =?utf-8?B?TDR2TzJybHlIbHcwUXYwOGZOSDhXWlNkQUo5Wjh3K1V6OUdaZnVoTDdTUXpq?=
 =?utf-8?B?QUtPMWd0RXYzc0s1d0dFRVl4ZkpCUlR0ZmdHSG1EQ0RFZ2FrVWh0amovYk8x?=
 =?utf-8?B?Z3dCbk8weEdjeUtDYU9Sb09vbTZjcFY1UkNnTk9YUVFMU2habXpTd3huaExN?=
 =?utf-8?B?Rk9aNHlFZGI2bE1jY2pucHJRWmRyRXhpcjNlYUJOeUxoNWpRbGllOWI2NStJ?=
 =?utf-8?B?UmcweWJ2MkFGeGNzNW41K1pmZk5lTzVnNFpLV0NJM1lsbS9pRFBKM0VLUm4w?=
 =?utf-8?B?S0JUYXloRmpaSC9CWVdFV1R0VERQOGl3TXNzVmh0T2I0am9YT0hFT1FSZmt3?=
 =?utf-8?B?Mm9Ub29ZYU43TlIyaXRZZFM4cG13ckJETGVuTU44UnhDekxsTE4rS1pia1Bn?=
 =?utf-8?B?ak4vMkdyRmduS2dQTm9kVmJLQTlCTGg3T0JrUFNHcDZ6M1ZsMUZoakpRdHpZ?=
 =?utf-8?B?QW5hbEhGbVRZcEFGYUx5SmJnYklod3RjdmhwSlVLbWZmTU9RWW92ZjVtT1h2?=
 =?utf-8?B?UGdNekJwTE9UU1hndHlJdDdBV1YzSFg2dEJETldYS3BrTUNRWnRoRGxtRTZp?=
 =?utf-8?B?d2JDRXFnaUxmZmw5L25kVWppdHhFMS9udi9oTTNOMmdhSXgrcFA3WWR4Nm5p?=
 =?utf-8?B?NGF2WXdIM2hURWtoaVZVM2NoNUFVV1MvemJuWFRaeHJ1Vm0rRjgxVWxFcUJ4?=
 =?utf-8?B?RlMraGhZTGQ1aU1HcTk0d3E0RVI3NlBNcDlhVjBPOTRjOVo3dGhKV0NCQmFT?=
 =?utf-8?B?bytJZVNMOXd5cUhzQ2Q3NElUdGljUW16TkJ3M243K1dVaXFUQ3BoWjVSWE9F?=
 =?utf-8?B?THNsZHdXa1M2YVIxY0xpV1YvbUxVMXNsekRtZmwvQzBOdlVVc3YrSThBdzJJ?=
 =?utf-8?B?OU5WMkwxQklqQ2RDSjIxeWs0T1Vpbk9Nb2RzTllmRDRZSXFQbzdGekVCTmNV?=
 =?utf-8?B?TTllSm1wRjkwT2pNV2E5MVNsR3ZYVFVWVU9FSmRTazArU3FQd1A1Z1NEZm5R?=
 =?utf-8?B?WFNUZHhORXVzMDE3SUFVNHZ6aGNUR0V3LzZvczNBVlZaV1hQRllnOXNESUdx?=
 =?utf-8?B?UHNjUTFtSVdOZldEVlpxN2JaZ0lnQ3VCeE1JYzQvb3h2OFdQQUNEQ2w3TGFr?=
 =?utf-8?B?R2t1YnFSRENvSkd3bStYSXNuaEpObERjUmZlcnY4M3RtcGpEcVNLMDhBZitJ?=
 =?utf-8?B?OEpWZXJQSHY3OHhoUU12S3JvMTFtTHpwQUt1cVpjZGZ3Tmp1UVdBSVc3aUM5?=
 =?utf-8?B?eEk1SmFRRHZLY1R4aGxnYUtIV3RZNFpyNDg0MmJpRnhoUnRjMnVBbndOQWRK?=
 =?utf-8?B?THZEaGJmbXFYUEZwTWVQcDJJcDZoRnBLNXRYODRIL084VkRlVzZyMVlGK3l4?=
 =?utf-8?B?c0pTWGpoRjZEOExBd24rcWZmNmNTYU9GUjlwb1NhbXoxWVQxWk5FTzlrb3RZ?=
 =?utf-8?B?bHhvUURrVFdPM3dFYnNuM21LY2FJTkdEUnZobW5EQWJnYXR4S1Z4UDlEWXAy?=
 =?utf-8?B?cWUrZDkwaTg5di9TQmM4akRaUlZvK2V4eXNlT0RnUkVvdE9ycFJzbUR5c29r?=
 =?utf-8?B?WFlyem9rblZjMEM0MGIrQWJZR0xjb2VJM1B4ZDliSlVVSk1KYkNXczhCUEpz?=
 =?utf-8?B?T0VVSitsQmU2RzZlL0JUbFJFak5DUFluL2xQV1dzTTZZNHdKVVdrUUdQeFNL?=
 =?utf-8?B?SCt2azBDTHFzb01DMjRoMHdhSjVOU2p0SmpSM1Y2RzJ1WVMvZWdwNDhXd3J1?=
 =?utf-8?B?V2RXalNzMFVQMTdZNkhneG1GZzZoR3JNbmpNQ2JmQUY0OTFqSjFxM241Tzdi?=
 =?utf-8?B?WTFPaG9zeEErR1M0ZWlJUzI2MHJvMXU3QkU3bisxclp0TFAxZmJUN2srK3dz?=
 =?utf-8?B?bE5VQlB6T3ZjMVVLcy9pUlA1VGdzNjBnVnI0MjM5SDZKckZCb0krSUxFWTBJ?=
 =?utf-8?B?THZ5RkZVWGRidGVyeFNSQnBhM3RqRDZqbHNpc011S3hRSk5sTmQzLytPOGpF?=
 =?utf-8?B?a05EUlVLdWZoV1ltczZNTzhwMFdjTlFwZ3NlT1p0WjdKZUZYMm9rZER1OFJy?=
 =?utf-8?Q?vSFA8kWdb0ajBdQHddBvww0dJ?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03563c0-ea3a-4d08-7f30-08db62adb8cc
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 14:37:27.3301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HcCrOxbCvnGvHMUJUGJlIeD5oDKvVGZU62yo/Nu4n7zUNGEY2g2Ev6tyDsRydepRI2YuBPKyfm47GeAGIl4/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5988
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/1 11:16, Eric Biggers wrote: > On Mon, May 29, 2023
 at 09:35:00AM +0800, Sheng Yong via Linux-f2fs-devel wrote: >> This patch
 introduces two ioctls: >> * f2fs_ioc_get_extra_attr >> * f2fs_io [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.84 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.84 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q4jQq-008RTk-Pu
Subject: Re: [f2fs-dev] [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2023/6/1 11:16, Eric Biggers wrote:
> On Mon, May 29, 2023 at 09:35:00AM +0800, Sheng Yong via Linux-f2fs-devel wrote:
>> This patch introduces two ioctls:
>>    * f2fs_ioc_get_extra_attr
>>    * f2fs_ioc_set_extra_attr
>> to get or modify values in extra attribute area.
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
> 
> Aren't there enough things called extra or extended attributes already?  Besides
> the standard "extended attributes" retrievable with the getxattr() system call,
> there is already the FS_IOC_FSGETXATTR ioctl too.
Hi, Eric,

The name extra_attr is a bit confusing :-(
But f2fs usually extends new features through extra_attr, like compression, inode
chksum. Since this area is easy to extend, new features could also be added here
in the future. To avoid adding new ioctls for new features, these two could help
integrate with all extra_attr related ioctls. And it seems not appropriate to add
new fields or get/set f2fs-only attributes by FS_IOC_FSGETXATTR/FS_IOC_FSGETXATTR.
xattrs could not be accessed through these two, only inline xattr size is allowed
to be modified for an empty file.

thanks,
shengyong

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
