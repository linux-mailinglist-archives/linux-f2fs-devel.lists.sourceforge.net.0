Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CB73D88D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 09:32:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDghu-0006BZ-3y;
	Mon, 26 Jun 2023 07:32:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1qDghs-0006BS-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 07:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ha1uwDE6m2GtN8FjyYsy4vFa2EaLQJteSvuBLj2Gz9U=; b=K0TnzeRlPyYgUxaddvAGYbqSmP
 I8UU9HwPnkbfahb9gf+P/AEVl0LKwlFIC8RWKNt2N4MF8f0SL89S4lu6CkTQ2BUfVaqCRnGG4TKia
 p8DrY6HjIWcgQjzzTIHE/6+148ZVuYTaY8c9Mexs+FairwuVXZSccOwBujQVtdj3OMDo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ha1uwDE6m2GtN8FjyYsy4vFa2EaLQJteSvuBLj2Gz9U=; b=J5mptupfbJx3iQLutRkcvB2o4n
 RAyI/CVHkMuB9O4xZE+iRCmMSwapJF+mBnhMU/fgC+kjzPYeVmNGPQn6LRbWr3yzZBsiB+AUndfLE
 G1nXhinP8XK4PuJrefhqr9RXq9mdQlsCzlri6+mFfXcD+3uXEQBckYUbDpFS0tFc6UOg=;
Received: from mail-psaapc01on2106.outbound.protection.outlook.com
 ([40.107.255.106] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDghn-0006eR-L8 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 07:32:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkDIKHvB1J7RNVbMriFiJ31nj2Vc03cXOFa1oos77HW3kzOQZZrMHzHUPQLLKZo9ElRoiT/dRxnjkLrsPuh+ryPgUtEEA3MWsf73D5LZK+ZzwKcg73o3l/wyH25PHsmWrn6j9UrHvxdJhd6QVvTsMhyyhJpZLUxc1P6UJEPZKcMSrYS+sSU/db6M/BdsVuqKER3Oo7h0fkY2zmJFARcnVcEyyXh4Fs3xhk5VdEMA4WDW3M7G7OlFN32AToUInSNVLrYpExp3Mm32BGyok8wjYf1vbbFTp4M2KUMRuG60yo4W5LW5h2p3VQQNp8uTIRWpbafUnDeAZ8eZpNjuYi0B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ha1uwDE6m2GtN8FjyYsy4vFa2EaLQJteSvuBLj2Gz9U=;
 b=jwY3UK16ALV4tvhngamGQjU/u667ESsAACTW991BfPxErB62kHAuYjHUAK3NW2w4m03Ec9fETaoWHw1aba7YCBE/abDCfAxg8YV2okhYLQ+kHEMT5MiOdw2dC+G+QwHh1PMeaO+MWBbwh+Og0NCdnYuuOLfDLbl4aQvcVaVcipnqdse/uuptkwR3ayans7y52hGos2VXqnMnNdu2uLdkt3EzLqQe2fiBFioRucTfwHeJpw9hCeyuItkcLzWFVsG2gx5U7Z7BRg4bVS4ayAcYyke5v27bQyoKAbxC+jSNGc8/89q349lw6lHpTQo3NlmEI8v1Wk0z/1WRw4cLzbwQwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ha1uwDE6m2GtN8FjyYsy4vFa2EaLQJteSvuBLj2Gz9U=;
 b=GXAbZFFG0z4uIZDi0FDyk8QDEspai7t+8/YnsoUqbNWYpgf4nzNpos3YtKovHUd1Emr5qkKyhQnKFDfxvLMy7322zu+F6qjgrUxbmZxFMSGbdJUAYcuxOEHGLw+cpMJYr8xuEwVHRXlTxNvMJIYTn+5KrwWDRq4yvcMJR6k8VWi2E8I7Oy/BfXRz23KmNKp1Ha8JQNtMaZTNZhRfFe54Ks7gm8aKKzJqQbB7ImU3aCuSJ6BMQjoD58PamWJz2R+rjyRkXME92vyYtDzZErHe27esTsAO904mgPuMLJKdEBv64NNrfuVkhvZeB2qUpZzMv+hQ8yne29boSujGATXrZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5078.apcprd06.prod.outlook.com (2603:1096:400:1ba::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Mon, 26 Jun
 2023 07:32:03 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6521.023; Mon, 26 Jun 2023
 07:32:03 +0000
Message-ID: <953510c3-4bcd-1426-3527-09d5cbdcf8cc@vivo.com>
Date: Mon, 26 Jun 2023 15:31:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
To: Jens Axboe <axboe@kernel.dk>, willy@infradead.org
References: <1dc1a0f2-9be4-8ae0-da26-3c00c8a71b41@kernel.dk>
In-Reply-To: <1dc1a0f2-9be4-8ae0-da26-3c00c8a71b41@kernel.dk>
X-ClientProxiedBy: SI2PR04CA0001.apcprd04.prod.outlook.com
 (2603:1096:4:197::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: b6129108-fc14-47a2-6928-08db76176f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLx6O7bxKs5ZYsswArxeFERYRfMFiCGOMP+DyrtbHU4JC0vjgTYlzUcsv3Z9cUIAGSqTqbIZ0dTW9kBLG8d0ofJ1j42BsNWPppQ+k+1qc7c+iKJ5afbed5uDbHetHelieK/g0RgSPFdGjd5EJy8Hr0PjFaS3YG5Kqs3uxlmmPmlkpA89Elac3FSPqY8aaXd75f0COUtTV7vPbeGj6+NlfhzrGEwgigluQZcYddPVhTVcgzhPA97UJI9JJpugBkgy28H5G28N5w/XsChV00Zb/1caYJhXV/Whan6cqS45tBCZkUx662MEQOpMiccmBrtJOTSaWtsEHM/MCtEZ47vyAiiSboNkeSLGNx+xn8qjbAMqOzQfd1wuKJJQb7S1grVXYS4DsG0+XBh9MyEVwgV3AKSNkgshvqUpSuuBMNTDCODI2MOtnexNdH3Wx4bmnmWn6asiGVD/G+w93mAox8wvbuOYD/3EbrF7nGIzstdqD35frXPbvhXEUWlbOa50m5QLQmHBvihSKbhzh+cTvd84haFm4Qnv4jZtMmaQ8z/bOj2bdqix/wNdzAcClIKvbrNuHEpz5iwWV3xCsVapyJb2sORusSPjEG8SCZUsu7uCUa0acX9hrvoqaECSc0p7FF6TcAcnnH/82Z/Ya7mcLCnVT0YMkdGo4TVxGWFBTsXc1PYsJTEfhLZROky0Lr9JNjE3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199021)(31686004)(6666004)(6486002)(966005)(54906003)(478600001)(52116002)(83380400001)(2616005)(86362001)(31696002)(66476007)(53546011)(186003)(26005)(6506007)(2906002)(6512007)(4326008)(36756003)(316002)(66556008)(66946007)(38350700002)(38100700002)(8936002)(5660300002)(8676002)(41300700001)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXJyNHlobHpQbmY3NzFvZVplSUt6T3dxRno2QWkvRjFyQnYrQk1uNHlOSUhZ?=
 =?utf-8?B?bkJ4MnVaV05tb2Y4alJLNjF3NGFub1p4MXE3YW5pVXpHMHhSbHZ3YzV5R2hq?=
 =?utf-8?B?NnpIZG45VlBRSjI3VUUrZTRFQlJxQ3VpWkVTejY1QTZLTWpxZ2NPUUFhOEZQ?=
 =?utf-8?B?Ni95L3plL05CZ0YyWXRBK0doREdlNkVDWU4rRGlMbS9tTVM1cTd6ejFqbm9k?=
 =?utf-8?B?RlZBQmcwdjFKUkZnaWlhdVBGQjZiL2tsUkVucVN5MFNZWmx4TjM0NlZoRGdh?=
 =?utf-8?B?TzFxZkM5RVYrcnpNVGVwTW1USE04R0RTVTFuT2pWWk1VaU1mb2xqZEVETVc3?=
 =?utf-8?B?eHpWZWZZOS9YMnF6bDg2NGpGcE54WFhDMjR4L1B2YkdOMDNHK2dPMmovbW52?=
 =?utf-8?B?ZE1RTnFkbW5kbDExRnVBcTdldUtiSExILzF6Rk01WmU0UjJZRGh5SjN0RjVl?=
 =?utf-8?B?QTZpdnJvRjhoUW05WmRQTHI0bVNsT1hSY25EQXBIS3VNU0lydDJtWXg0Rms1?=
 =?utf-8?B?cVZ0M2dXTjZCUEdlTC9LQTRocDR1a1VqSUNlUmNmc3FzdnVHMHJqUEhXeGN5?=
 =?utf-8?B?OEdVZjBGT3VzVndqcG1YTWxqVW40dkN5N09ZcVdBOXJOdEVuN29SWGhOUmdm?=
 =?utf-8?B?dnpzNTN4MmRzbGladlg3Z2VQcTZJOTNWOVppVFJzWjdJNnBVQlRIWGN5bC90?=
 =?utf-8?B?STZVSGVkcDREYXdYUkVoZ1dySGliVlFMa0VaZWlIMUp2cENBOGtTSWtuY2JR?=
 =?utf-8?B?TzFTTzJXRVFkc0JSTVdRbzVCbzRyZ2RIWDF0LzlSYzh1R2o3RWQ1RzNQRmhV?=
 =?utf-8?B?ajFmV2JFenVHMEdJM2NqalBJUW5YbWVYck51U3d3VTNtTE9ySUlnV2szcjg1?=
 =?utf-8?B?ZEtKM3RBNng0amt0N1JYNUJpZFFGN1RsSGFxSG85SFV1QW05Ui8zbXA3bTlN?=
 =?utf-8?B?dzFhOWFzZUdvRE1RdzQreWo0ZTl1UFZqT0pVZERmOUZBSlh1bDVPUXZuVkkx?=
 =?utf-8?B?eXpLWG12YiswdjRYdkdSRXNqU2wrRWNqSjBEUkpjU3l2TnRXZ0w5MC9pMlRm?=
 =?utf-8?B?bFpOczJINzZqQm5laHIvak9yck1BaitmSDgwdmF2M0M4TTlidnlpSXVjVWdx?=
 =?utf-8?B?a0RaMjYyVkNoUkdpMUtDRVMvR2NqNkNlNHZQclZJaTZKc21GTkEvdXNFZU9z?=
 =?utf-8?B?OXUzYzhqVDFqcW9Gd1VsVlgrTzNqWEpWcmVqQVNzS21HR0V3T0lWbllSRWhD?=
 =?utf-8?B?YzhxTjZDYWl1NjdXQW5aYXJMTFdFQ3JuTUZsOUVGTytjSVJwWEJWd2E2U0xQ?=
 =?utf-8?B?U0FjTk9PR1BCK2pabWV4MmlSZkZ4RzNzSmZIVmhMT0lNUzR1TVo0Nm1yL01p?=
 =?utf-8?B?M0F3a1NmTmk0ZWhXR0ZmVm5JY0RtSURLSnVrejlhYWIvcis4U0tQOEJTNmhG?=
 =?utf-8?B?V0QvdDVWK0NsNEpjd3VYYWRwTkJxbm9tNUE3bEZSaFdyMkdDQWtOTjVSalZM?=
 =?utf-8?B?ME1wTVo2bDNqVXd5M0VNdmhreEVTNzJyKzMwSEEwWlY2R0U2SU9lZTNyUnUw?=
 =?utf-8?B?R3p5Rjc1SStINGhQS2Z2YU54THYrS3dBWEtyeEZNeDJMdUg0TjcwbzA0Wkd6?=
 =?utf-8?B?a2lSbHBYUmIrRVpNR1pYRkJiNnhHSndnVDZmZFdDS2xzams3eHB2dU1vcU5J?=
 =?utf-8?B?NVRqdHBLRWRnU2FUOUw4Ym9PTkdLbmlSSGlxUGR5ZUtoNHoycWExZDZvZ0Zr?=
 =?utf-8?B?c3NlMHBkcUo1d2hXaXNleEhZMVNxdUV2YjU2MzRRTS9CbVk2Tmp1OG80WW5i?=
 =?utf-8?B?WExzelVQSVFoYk5jOHhsYkRjbE11WVIydnIvdElxZ1BKeEdsVThkN2Q3YmJD?=
 =?utf-8?B?UWczREYwdnRJbnJDdWxlK0ozUzYydGVHNzNKVFY2MnZ3dTRLMEdwcHRwWjZj?=
 =?utf-8?B?Ykl4ZGVCeUJZQ2czOEhnU1doZlVIVDh4UUw1OEtSL2owRk5xM2FPcXpZdzJs?=
 =?utf-8?B?aG1YK3VoaS9SUU1QTTRlNGthR1VPZjBKWk0xVE5JYlpwN0xKT0UxbWVpdjlz?=
 =?utf-8?B?My9SRExwU1VKKzVoQ1RNUzNWRVBOZWNNbXR3V25rdGd4SytmNjZQOTBxNWd6?=
 =?utf-8?Q?4hcwr1mSXx5b9iI4wjQd4kyv9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6129108-fc14-47a2-6928-08db76176f2d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 07:32:02.8186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVEPbQWFXli0rPmlLs5xJTE8ieVRa5ipgrkNjzJsCuDPL4mCLIzV5Ony5sNGsBbEwXa3UbDieuJMHZUJQmqJ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5078
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +cc willy@infradead.org On 2023/6/20 4:43, Jens Axboe wrote:
 > Hi, > > I came across this patch in a news posting: > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d618126911829523e35a61f4a5a4ad159b1b2c8d
 > > which has me a [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.106 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.106 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qDghn-0006eR-L8
Subject: Re: [f2fs-dev] f2fs async buffered write patch
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Lu Hongfei <luhongfei@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

K2NjIHdpbGx5QGluZnJhZGVhZC5vcmcKCgpPbiAyMDIzLzYvMjAgNDo0MywgSmVucyBBeGJvZSB3
cm90ZToKCj4gSGksCj4KPiBJIGNhbWUgYWNyb3NzIHRoaXMgcGF0Y2ggaW4gYSBuZXdzIHBvc3Rp
bmc6Cj4KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9q
YWVnZXVrL2YyZnMuZ2l0L2NvbW1pdC8/aD1kZXYmaWQ9ZDYxODEyNjkxMTgyOTUyM2UzNWE2MWY0
YTVhNGFkMTU5YjFiMmM4ZAo+Cj4gd2hpY2ggaGFzIG1lIGEgYml0IHdvcnJpZWQuIEFzIGZhciBh
cyBJIGNhbiB0ZWxsLCBhbGwgdGhhdCBwYXRjaCBkb2VzIGlzCj4gc2V0IEZNT0RFX0JVRl9XQVNZ
TkMsIGFuZCB0aGVuIGp1c3QgaG9wZSB0aGF0IHRoZSBsb3dlciBsYXllcnMgaGFuZGxlCj4gdGhl
IHJlc3Q/Cj4KPiBXaGF0IGhhcHBlbnMgaWYgaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX05PV0FJVCBp
cyB0cnVlLCBhbmQgbm93IHdlIGRvOgo+Cj4gZ2VuZXJpY19wZXJmb3JtX3dyaXRlKGlvY2IsIGZy
b20pCj4gCS4uLgo+IAktPndyaXRlX2JlZ2luKCkgPC0gZG9lcyB0aGlzIGJsb2NrPwoKTW9zdCBm
aWxlIHN5c3RlbXMgaGF2ZSBub3QgYmVlbiBjaGFuZ2VkIHRvIHRoZSBpb21hcCBtZXRob2QsCgph
bmQgdGhlIGdlbmVyaWNfcGVyZm9ybV93cml0ZSBtZXRob2QgaXMgc3RpbGwgdXNlZC4gU28gaXQg
c2VlbXMKCiDCoHJlYXNvbmFibGUgdG8gbWFrZSBJT0NCX05PV0FJVCBiZSBoYW5kbGVkIGNvcnJl
Y3RseSBieSB0aGUKCiDCoGdlbmVyaWNfcGVyZm9ybV93cml0ZSBmdW5jdGlvbi4gVGhpcyBtZWFu
cyB0aGF0IHdlIG5lZWQgdG8gbW9kaWZ5CgogwqBzZXZlcmFsIHBsYWNlcyBtZW50aW9uZWQgYnkg
SmVucyBpbiB0aGUgZ2VuZXJpY19wZXJmb3JtX3dyaXRlIGZ1bmN0aW9uLAoKIMKgYW5kIG5lZWQg
dG8gcGFzcyBBT1BfRkxBR194eHggb3IgaW9jYiBpbnRvIHdyaXRlX2JlZ2luLgoKCkkgbm90aWNl
ZCB0aGF0IE1hdHRoZXcgV2lsY294IHJlbW92ZWQgdGhlIGZsYWdzIHBhcmFtZXRlciBpbiB3cml0
ZV9iZWdpbgoKaW4gYSBwcmV2aW91cyBjb21taXQsIG1heWJlIHdlIGNhbiBhZGQgaXQgYmFjaz8K
CgpUaHgKCj4gCS4uLgo+IAktPndyaXRlX2VuZCgpIDwtIG9yIHRoaXMgb25lPwo+IAkuLi4KPiAJ
YmFsYW5jZV9kaXJ0eV9wYWdlc19yYXRlbGltaXRlZCgpIDwtIHRoaXMgb25lIHN1cmVseSBkb2Vz
Li4uCj4KPiBJZiB5b3UgbG9vayBqdXN0IG9uZSBsZXZlbCBkb3duIHRoZSBsYXR0ZXIgdG8KPiBi
YWxhbmNlX2RpcnR5X3BhZ2VzX3JhdGVsaW1pdGVkX2ZsYWdzKCksIHlvdSdsbCBldmVuIHNlZSB0
aGUgJ2ZsYWdzJwo+IGFyZ3VtZW50IGRvY3VtZW50ZWQgdGhlcmUuCj4KPiBUaGlzIGxvb2tzIHBy
ZXR0eSBoYXBoYXphcmQgYW5kIGNhbm5vdCBwb3NzaWJseSB3b3JrIGFzLWlzLCBzbyBwbGVhc2UK
PiBnZXQgdGhpcyByZXZlcnRlZCB1bnRpbCBmMmZzIGlzIGNvbnZlcnRlZCB0byBpb21hcCwgb3Ig
SU9DQl9OT1dBSVQgaXMKPiBoYW5kbGVkIGJ5IGdlbmVyaWNfcGVyZm9ybV93cml0ZSgpIGFuZCBi
ZWxvdy4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
