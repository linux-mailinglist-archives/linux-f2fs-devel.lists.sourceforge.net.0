Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AB49B4944
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4n-00040L-7K;
	Tue, 29 Oct 2024 12:11:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4i-0003zv-1e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gWldwuJBCpQvptNjiclGUM1IsFPz45aBP3Agxu1j2Wg=; b=VzWEJ0CGaRwhgUBDQMW2RVJlj2
 LdkY1I96f0SKdKxX5pTNw7FfCQA78vlgk4XGSJGWmdmYI+K+QJH+0wByT3nlZrwRonddwYwg6UBCb
 nQJBs/iWRibx7yDsUn6knADu10QZzcCbhyFkbc5Yvyjy9Hp5d7sJ4nvpYn/XWrhFkB48=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gWldwuJBCpQvptNjiclGUM1IsFPz45aBP3Agxu1j2Wg=; b=lrQlQqi1U2NCbfQMvIynZa9ynl
 aaxATP+5gPJVKKopbSLqmepHkC0JtbAT2KPieF+ttsHSydQxfy23TZUvdJAcgG5ZrtJCVDGsygs0a
 K1LHiBFzxs5HRsqlbd9yjV+kLsELKI4c5rcV9zyZDo/MqOKZO+rdD4wAyYWS1wP3XPYg=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4h-0007R0-PH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BH2bo6jikxIHJmlWWwLb/avnuNzBqJAktdUQkkArY6T39dTkKlwyJJzlGkxdJ4BHwIlYZ9n1fu5IHkiWGeQEZ2dYu4OcOCp0QY5mHXdwxyxVjZ6VGstOPHxjbW3De9ZxS+FYwJwZsynPMcl60oCFDZnbWQSqZdKfylb3DhsPRhzEUWgN/hLDPtrqH8xRkv5fg2kIXC2I/ds1KtCbRGIePiDBEP0t8vPH5ASwXCjZ4ZaBy1gb36eYlgsPKQFrGbJjJBgWRbCXMaHcZ/FD8SISqPfnNtYQ+8Qjzj7u1UFlKzovwAVAwsnbAka1S8N0k0UsGnKVPxnS7x3iqfzOjlqoVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gWldwuJBCpQvptNjiclGUM1IsFPz45aBP3Agxu1j2Wg=;
 b=jNmdD1bhV7lJH5Ctz0AAPmIyyBUrWeIywGSLmItvetoER33iMUy5Z7CGdqq49QvtGM6WJvHwhigV1MhYSM7OEDAfPMdsbhZbvBrXxVzuRg6EKINL1buGicmxUiah6xEQdQgTdFAcLOJt97YxyBpNLrKHmM67Jm7SXp7ls2/dS8nYjSe2KvOpjB7qhCgrskFLzOAv5fZk4V+av/pcMcwYVHntsV8+o+x1GZT24GkVM2cT8eBC9laN+5yBLtPoeYYD3469oJNucKlNIHl5J4CoKFIW0Le9F4scr8+QKDhaFTYLbozaUDfHISfTYR7BWnuSxD4YKHFjBp28oE2YjC0dAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gWldwuJBCpQvptNjiclGUM1IsFPz45aBP3Agxu1j2Wg=;
 b=A5Hn0QAI3O3/bKlzmtZu07qtLVMaYpvNzFHZ76ww8ENM/kj4jLtbWzIBIOAg74xtZ0+oKQo4dn7ZdblzxJ5mD9m2PaOZLvNwJDgz3og0Z842TqHbYMf7Hd0190BXCqifucdI2/obu12GjkuG5tU/3NUQ2Z6mma6env+o7N4FZ+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:36 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:36 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:39 +0800
Message-Id: <20241029120956.4186731-8-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c823bc-b42a-4b73-cd42-08dcf812d5a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bE6SDPwbnZG1oAUil8bd+yoBjwIAIuYrvxDZKSf6U5g8/zHgtKKdanUMls96?=
 =?us-ascii?Q?YK3wyFW6Lqv7RavCVT8AlcgK/ZNUl4fkItnw4bFqoKcDrQ4YZlorJRZ1bx6Y?=
 =?us-ascii?Q?1mbr7gPHF+aLlOKEhQvVwOUbbh4QLItmuiJwy8fL4Vr0Gososb1heeiw3ALu?=
 =?us-ascii?Q?Szfkd0wvcAifUh4cBdI0QdtUs0jsNWvE4Ax1jG9Qw3rviK5sb8TPc2WdVawE?=
 =?us-ascii?Q?rDxWR3OB09dr/QrlQunn5uV1W8L8ZVXimIvVJgNT8yaBGPtoQ34H0sdZ0MPz?=
 =?us-ascii?Q?YHwDVtZRD5khBHMwUDy+BGq9GBWJcmJCcfwPwH4Q/WtSqqXHuivJf3UL2d3x?=
 =?us-ascii?Q?u7L6vKTKOHIgUJZeqSXA4Am9uiVQLsUoERDiy+6/9fYW5VwfOtw4fZJkUkD3?=
 =?us-ascii?Q?P5cwJ3pxzs5/YzKff1IPv+h7ruRdTHfAMm8wRA+AQ+cnVrFRdoRwnI3RHlmq?=
 =?us-ascii?Q?YlrndaCIh3Da4B9sPWrAnLVV5uLBwjUjhX2M+32IM47CCGLegT4yO1r9+qTF?=
 =?us-ascii?Q?BgxmXGfZ8l1936ROG6xrMN8CwZNuQmsWcHf+x7N6TwbVcoDido752/Iq8y44?=
 =?us-ascii?Q?stB/UBoLTQwoLnp8ulN87O8yhh9K40fsQFGfEk3fSi6NRq+/gIuew6vjzuWi?=
 =?us-ascii?Q?QJs5Lpex8cBIdq2f5skgNOs+DBq4pZTgnlNBLX63nhVXUAsS990GerBYkXEP?=
 =?us-ascii?Q?rm8Wgkp64gs1N1E5owm6DZbfcqvpErgtMxJsgtTrvy5SC0/7PMLd/8OOGxLA?=
 =?us-ascii?Q?46zN+RkaV8z+/zPrimbMD1TpkjZY50u1zJ3GYlRxFmYUWJbeWx8wNKf3MxBV?=
 =?us-ascii?Q?ONoOvxBh/ClePH+x6PLntV/ylUire+eieMIuD7CaELwSvBRSxycH0brylYpp?=
 =?us-ascii?Q?wbNDTrz41EE0XNiqAQGJGIjtiGAYLk7jus+ZAOSjgzfHop4sGqgbC+0zoEed?=
 =?us-ascii?Q?Ky9o97riNr0vJKne/RNY0Y+c2p9QwbyrinLOVdbYFIY9zWJo65gyGR/bX9am?=
 =?us-ascii?Q?KKIqQTr/3uBq5uh10Cfv8uBO6aUKnzB4nS4hyMf+8B5vuJmBjPpfuSI4Fl9f?=
 =?us-ascii?Q?ngGGL9PE2H44on11NtIrxhqZKowro7sgIOKK9eCvVYR0R5mM2R0+Us9rqY5q?=
 =?us-ascii?Q?t2nvvbCGnig6hFk8H70I6Qk9C1B99u46ulXJrKnxl8Cg87eWuOCKcyozqDs7?=
 =?us-ascii?Q?5LSBhTkIx5cC0NdMsikdWqalhSgP20BkWTWF6ZJq/x57m88w+OWvMIu6LZIG?=
 =?us-ascii?Q?Wg6n+s13jkwjSjTI4br2NID5vyUGJYKKHxz78T8XakYxjkr0tuvnNIjirClK?=
 =?us-ascii?Q?rUYnHx6iKffFNxLU/y2N+sx9TJNcNUJ+AJ8HZ12tZTqmDeqU1rxEVD/UDuDp?=
 =?us-ascii?Q?ULrw0PQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2bYNssBQ04Y3iY19p48TfAfmOCoaAA4IruOcIESyJpHly8u2u/I7tbnOVY59?=
 =?us-ascii?Q?z/A9HTeA7kSv48SX2/+V7hSw1ag426wY/5UpNkUsAzQchtFRyee13KUEURvN?=
 =?us-ascii?Q?6BChJlDWT2tY3tTYTYPkARP/dp9VhRDmiJGnVfngfC99b7TXoeu33Lvfl5MV?=
 =?us-ascii?Q?LN9RAPancomEajkuqKKEykUfqpEC5WOeuDaAy7cM1qACJi8fFfr67eYOfbNr?=
 =?us-ascii?Q?nDaVNgYnMPqSWBFf5Gh7gsCnKRo5EgU9Jigq8q2rmCCeKk51ceCtP4VBgSp6?=
 =?us-ascii?Q?BapVAOnrsJ3Z6AUoH8DOLrqr8HoJYPkErlc/eDA2MCkUJh1AVdsHl2YFNyGc?=
 =?us-ascii?Q?XwzaLUS0vOe4k7WpkbKAZadT/+vMxXU5RZYB7WWmxVs7VkuTDCNBolUlc1Qd?=
 =?us-ascii?Q?z4t7hdPMIcCziAl0MuUr0LnkALgHSCvrfZIihknU/ZaOkOOOv+4JG7kGW6J8?=
 =?us-ascii?Q?stJwkRE/GMWRlQM4dWttHdQyDuSiJvZ8Kj8KfzFcE+IrghJsoeUOfU8EePuI?=
 =?us-ascii?Q?kS5GiseCdVoG+NuIYZa06N+g0Wp0+pCBQMsgnIhpYyXhu4rFk7KsJVFYVLL0?=
 =?us-ascii?Q?V3WlP/APFv2GRbyNGOI43vPw8cjaZ5H7H3eAJ5j7jCqIqLQyTaRWM00UpmWb?=
 =?us-ascii?Q?Njwb04CqjmWinvVIFkf377xUTF4ok+fM+bJ6ORcNtBu27j1ShnwRzrbfbU2F?=
 =?us-ascii?Q?31yr5lD+faGDQOkJ4//7DaiRlnt067m7mIfVR0fblcFfebVH8olwRasW0sM9?=
 =?us-ascii?Q?rZmBYnvz56/atMLgsQpjZQwWELFZoyfI4bAYgX4LaKHccyBF2cddVyGTFg8C?=
 =?us-ascii?Q?JVkhwhS1s3+TBFPw2nzAXiIoK75HlN7iils2CtkN1bhlCl2FJd/6zGBWFAfY?=
 =?us-ascii?Q?vAcNBGG37fK0WMKAF+jynP5wqvS1reYjKzymlMeNhMZqgd8+AqSOXBhT6r3O?=
 =?us-ascii?Q?7t7EGtwBCRuXhUhWaMUZQ+l5GRMsGRzPcl7KL/Q+HzA//SGZ+574VTvlg4Sl?=
 =?us-ascii?Q?ZeG99AYrvkv8GxuAyCczteofBVEu0+WQ4zhMlgodD7hETGdDZq5dIBpCIMd7?=
 =?us-ascii?Q?GmQh1gaWuO3UdI2oaxBYMJUdv0xBT2jzBcrHVm5+Hs275XEpE1aRyGW3v/Vf?=
 =?us-ascii?Q?DhgejVyWaWGUm0WAuKrKqAe2HJM+OuOzNCwBgrm93lip5XtAqVecqbbv3Jgx?=
 =?us-ascii?Q?BOdYHtpX9vA5h+G/L4x7sP/d5pGu/v2Og6InXjHIubZf3MbvO0Xx3kkIsltw?=
 =?us-ascii?Q?T4P/5d8320Of17gz91wXKzgjdJo1bUmFn4Ui/+MHaa5sG7iqMXcbXuYEFmgC?=
 =?us-ascii?Q?GoPTU0vQrGrgsEX8nspp4B43c5RH9IViMXilR6bZUr8IeOQT0LrLQhPGYZAg?=
 =?us-ascii?Q?yAgErwaxBfZd5GhT+ulutr1LE33bgQSoPEXuVRWD4FtXDU4uKTjTzri+WeWO?=
 =?us-ascii?Q?8ahKnJeEQYJ2l/zAxX4kpIET7MoTzDLbRve90v0VC8tm5bqBrqVtTQJwAstB?=
 =?us-ascii?Q?TXTtVRAuCWWfhzy8Ki6ZcGMzytTbl/LpEya+tyz9GpzMIWaFNfLy1/HklMB2?=
 =?us-ascii?Q?U2HsfmqHzvHo6pJjzxEAcmE46gNfF92gQb6/kfll?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c823bc-b42a-4b73-cd42-08dcf812d5a0
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:35.9952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQDm0KvOc5On7WNU6tFU0Nwu6E+Dcju15eLD+Husp7najqS3kcTCrA672MRZWm6XjhKS8FErdjhQfBCIB71unA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new member `filename' in inject_dentry to
 inject dentry filename. The dentry is specified by nid option. Note that
 `.' and `..' dentries are special, because they are not in the parent directory
 of nid. So this patch also adds a new option `--dots' to inject these two
 dentries. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4h-0007R0-PH
Subject: [f2fs-dev] [RFC PATCH 07/24] inject.f2fs: add member `filename' in
 inject_dentry
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a new member `filename' in inject_dentry to inject
dentry filename. The dentry is specified by nid option.

Note that `.' and `..' dentries are special, because they are not in the
parent directory of nid. So this patch also adds a new option `--dots'
to inject these two dentries.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c     | 94 ++++++++++++++++++++++++++++++++++++++++-------
 fsck/inject.h     |  1 +
 man/inject.f2fs.8 | 13 ++++++-
 3 files changed, 93 insertions(+), 15 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index 4a811b3a3302..bc8f09a67c1a 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -104,7 +104,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
-	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--dots <1|2>] --val/str <value/string> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -211,12 +211,16 @@ static void inject_node_usage(void)
 
 static void inject_dent_usage(void)
 {
-	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--dots <1|2>] --val/str <value/string> inject dentry\n");
+	MSG(0, "[dots]:\n");
+	MSG(0, "  1: inject \".\" in directory which is specified by nid\n");
+	MSG(0, "  2: inject \"..\" in directory which is specified by nid\n");
 	MSG(0, "[mb]:\n");
 	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
 	MSG(0, "  d_hash: inject dentry hash\n");
 	MSG(0, "  d_ino: inject dentry ino\n");
 	MSG(0, "  d_ftype: inject dentry ftype\n");
+	MSG(0, "  filename: inject dentry filename, its hash and len are updated implicitly\n");
 }
 
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
@@ -240,6 +244,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
 		{"dent", no_argument, 0, 14},
+		{"dots", required_argument, 0, 15},
 		{0, 0, 0, 0}
 	};
 
@@ -336,6 +341,14 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->dent = true;
 			MSG(0, "Info: inject dentry\n");
 			break;
+		case 15:
+			opt->dots = atoi(optarg);
+			if (opt->dots != TYPE_DOT &&
+			    opt->dots != TYPE_DOTDOT)
+				return -ERANGE;
+			MSG(0, "Info: inject %s dentry\n",
+			    opt->dots == TYPE_DOT ? "dot" : "dotdot");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -368,6 +381,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->dent) {
 				inject_dent_usage();
 				exit(0);
+			} else {
+				MSG(0, "\tError: Wrong option -%c (%d) %s\n",
+					o, o, optarg);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -1056,12 +1072,12 @@ static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
 		}
 
 		de = &d->dentry[slot];
-		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
-			return slot;
 		if (de->name_len == 0) {
 			slot++;
 			continue;
 		}
+		if (le32_to_cpu(de->ino) == ino)
+			return slot;
 		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
 	}
 
@@ -1074,14 +1090,15 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	struct f2fs_node *node_blk = NULL;
 	struct f2fs_inode *inode;
 	struct f2fs_dentry_ptr d;
-	void *inline_dentry;
+	void *buf = NULL, *inline_dentry;
 	struct f2fs_dentry_block *dent_blk = NULL;
 	block_t addr = 0;
-	void *buf = NULL;
 	struct f2fs_dir_entry *dent = NULL;
 	struct dnode_of_data dn;
 	nid_t pino;
-	int slot = -ENOENT, ret;
+	int slot = -ENOENT, namelen, namecap, ret;
+	unsigned int dentry_hash;
+	char *name;
 
 	node_blk = malloc(F2FS_BLKSIZE);
 	ASSERT(node_blk != NULL);
@@ -1090,12 +1107,25 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	get_node_info(sbi, opt->nid, &ni);
 	ret = dev_read_block(node_blk, ni.blk_addr);
 	ASSERT(ret >= 0);
-	pino = le32_to_cpu(node_blk->i.i_pino);
 
-	/* get parent inode */
-	get_node_info(sbi, pino, &ni);
-	ret = dev_read_block(node_blk, ni.blk_addr);
-	ASSERT(ret >= 0);
+	if (opt->dots) {
+		if (!LINUX_S_ISDIR(le16_to_cpu(node_blk->i.i_mode))) {
+			ERR_MSG("ino %u is not a directory, cannot inject "
+				"its %s\n", opt->nid,
+				opt->dots == TYPE_DOT ? "." : "..");
+			ret = -EINVAL;
+			goto out;
+		}
+		/* pino is itself */
+		pino = opt->nid;
+	} else {
+		pino = le32_to_cpu(node_blk->i.i_pino);
+
+		/* get parent inode */
+		get_node_info(sbi, pino, &ni);
+		ret = dev_read_block(node_blk, ni.blk_addr);
+		ASSERT(ret >= 0);
+	}
 	inode = &node_blk->i;
 
 	/* find child dentry */
@@ -1105,7 +1135,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		addr = ni.blk_addr;
 		buf = node_blk;
 
-		slot = find_dir_entry(&d, opt->nid);
+		if (opt->dots == TYPE_DOTDOT)
+			slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+		else
+			slot = find_dir_entry(&d, opt->nid);
 		if (slot >= 0)
 			dent = &d.dentry[slot];
 	} else {
@@ -1141,7 +1174,10 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 			ASSERT(ret >= 0);
 
 			make_dentry_ptr(&d, node_blk, dent_blk, 1);
-			slot = find_dir_entry(&d, opt->nid);
+			if (opt->dots == TYPE_DOTDOT)
+				slot = find_dir_entry(&d, le32_to_cpu(node_blk->i.i_pino));
+			else
+				slot = find_dir_entry(&d, opt->nid);
 			if (slot >= 0) {
 				dent = &d.dentry[slot];
 				buf = dent_blk;
@@ -1175,6 +1211,36 @@ static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		    "%d -> %d\n", opt->nid, dent->file_type,
 		    (u8)opt->val);
 		dent->file_type = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "filename")) {
+		if (!opt->str) {
+			ERR_MSG("option str is needed\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		namecap = ALIGN_UP(le16_to_cpu(dent->name_len), F2FS_SLOT_LEN);
+		namelen = strlen(opt->str);
+		if (namelen > namecap) {
+			ERR_MSG("option str too long\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		name = (char *)d.filename[slot];
+		MSG(0, "Info: inject dentry filename of nid %u: "
+		    "%.*s -> %s\n", opt->nid, le16_to_cpu(dent->name_len),
+		    name, opt->str);
+		memcpy(name, opt->str, namelen);
+		MSG(0, "Info: inject dentry namelen of nid %u: "
+		    "%d -> %d\n", opt->nid, le16_to_cpu(dent->name_len),
+		    namelen);
+		dent->name_len = cpu_to_le16(namelen);
+		dentry_hash = f2fs_dentry_hash(get_encoding(sbi),
+						IS_CASEFOLDED(inode),
+						(unsigned char *)name,
+						namelen);
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    dentry_hash);
+		dent->hash_code = cpu_to_le32(dentry_hash);
 	} else {
 		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
 		ret = -EINVAL;
diff --git a/fsck/inject.h b/fsck/inject.h
index 43c21b56a7eb..706a211bc645 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	int dots;		/* . or .. dentry */
 	bool ssa;
 	bool node;
 	bool dent;
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 691a40c889a0..3db3f4ecf85e 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -211,12 +211,20 @@ inode i_nid array specified by \fIidx\fP.
 .RE
 .TP
 .BI \-\-dent
-Inject dentry block or dir entry specified \fInid\fP.
+Inject dentry block or dir entry specified by \fInid\fP.
+.RS 1.2i
+.TP
+.BI \-\-dots " 1 or 2"
+The option means the "." or ".." directory entry of \fInid\fP is going to be injected.
+.RE
+.TP
+.BI ""
 The available \fImb\fP of \fIdent\fP are:
 .RS 1.2i
 .TP
 .BI d_bitmap
 dentry block d_bitmap.
+dentry block d_bitmap.
 .TP
 .BI d_hash
 dentry hash.
@@ -226,6 +234,9 @@ dentry ino.
 .TP
 .BI d_ftype
 dentry ftype.
+.TP
+.BI filename
+dentry filename, and corresponding d_hash and namelen are updated implicitly.
 .RE
 .TP
 .BI \-\-dry\-run
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
