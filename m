Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BCB9D48CF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 09:28:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE2Y1-0000IW-QL;
	Thu, 21 Nov 2024 08:28:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tE2Y0-0000Hq-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 08:28:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71E4341NbUzaGbo8d4OwKtWSrpfxXyAdlYjaKjSuvg4=; b=QrHKW+NQLbEb76EwMbVompji/g
 B+SU93Rh2c+M8w71dTBp08ECeSY54o2mSdk1KmNOfWjGPY8acGsSSp3QOl4JXNHC5LcVGZmB1RT4M
 IkcuctyLHYCY4X69JlHlXvXLXOITblCiSjBjFw5yj+btJfkAU8yFxF99v1cG5mw3MbxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=71E4341NbUzaGbo8d4OwKtWSrpfxXyAdlYjaKjSuvg4=; b=YOx7NKClcLxPAVS+cAv5LM8vx1
 hu/VxktlmUHKj5rPR0y1qXjzCt12TLCZvGMftTdtLAAEbW9Cfe+4lF3m/XZPVuPNYAJ5WTNbAsklo
 qGB8H+5tJ9AG3U5TbXuECsLS7cxmU6b+DMsP1si/LAVWBNgYoXxG8zOV6gaghwkG8KwA=;
Received: from mail-eastasiaazon11010049.outbound.protection.outlook.com
 ([52.101.128.49] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE2Xz-0002QN-Io for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 08:28:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+CorMpfRGNXvnQ92/VEan1sFk+JktUa3joZ4vLQVml9C5ufDrzjMenL36lvi4FBLk5Z8p0ZewYG3zrGkP1OyjCXrP1N92qMmpD7/Gd+z1obT4ofUBBdPq4KJhUNEaEmWniD+0ktgT1fZaiDVu4CwWCFFM+tJUNY3bqtXc0EGJ+0NUt3A7aG0LUWcJcTNUV/tU77D4HaG3+Cem04oLbbnmEdFfbz0urzwFP0/Na4J06fR42iy38jXWoYz/GvwrlxghvUV1oEhs8+YBil8DuvdQ/74NsMSfBCiXYSqBnhUsOGq9s8euKD9GiS7qlFd6t8q2FLEXETuTbN8D1c/1QqyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=71E4341NbUzaGbo8d4OwKtWSrpfxXyAdlYjaKjSuvg4=;
 b=GNJoKofPG4hZ2I/LDcYL6bSRJd2nj9kpWqNs+hsLNJDwpAQV9sEt4Qy09DW764Lj09frQ32uI5YLUq563Epj1SbG727MhHwJZeK1PtfJvXDYfF/vqXx57CCcZYvRmERqRDTs88z3bWNTM4s186NTbbpOCWfs1CEukp7bZdc9giepy5l3ZDQj/CdQnS9k5uCf4gaOo7uQ60MfTMwA0C5wLxHThDjDy7okRolLHNASrbMSojAoaWLHYvvJAXYSVtu9FgV+I8186qCqyuFhhbTZuTH2UuRICylHRK6uDHNsFmjSu9P5VAPojrlsiy9WGg659rVsUgB28s2/S6fe27wvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=71E4341NbUzaGbo8d4OwKtWSrpfxXyAdlYjaKjSuvg4=;
 b=RHbQvUacW3oPBDJkyiEbpqmcht/+dKKnwJYmYebfJ1m9KyYznCvreVRUjxXdNLhR0s+h3SbXfZ6Ndv89lnnLRTttD9iUIc5CWRaC2UnHxgyaabiTL0kOEUWN+nP5oVD3KCBh8/GYzTD1df0bbX4D7UZjVHvRfcWOfxcC/31VDkM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6290.apcprd02.prod.outlook.com (2603:1096:400:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 08:28:11 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 08:28:10 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 Nov 2024 16:26:56 +0800
Message-Id: <20241121082657.2644346-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <202411211538.Tus6kZm1-lkp@intel.com>
References: <202411211538.Tus6kZm1-lkp@intel.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: 910da9b1-d3e6-49f3-fb8e-08dd0a066ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3/p+9KhFQaVBhtg92IFMY0Tbzhqr4YeIMWwh4bR+kGq4Khee6a5oEJx+Gqbg?=
 =?us-ascii?Q?CLrdj88Jd792f8bMau0a0lLxhJOczrfeIU3yWPceTVUjr2iDoJJsARTodL4i?=
 =?us-ascii?Q?xpHW9Sptg2PqLPsjCIwMWKySKEqyu5cQtvtYdJQA9y5tu9eaTs2BByzdeM4p?=
 =?us-ascii?Q?AMF3PFYsl+ZZtB5H9jFCrMTZtNbkgENgSNSspQtwhcD6PqxivlevrQDMo5cp?=
 =?us-ascii?Q?fGgN3lmWgeERHbmdUY8RNZcEOg/MSc1Uv4TvMr/+NNB6fF5dXDX8Std1R/Ce?=
 =?us-ascii?Q?9v/FfuhQFgWNGrMDMYs+p2VyqYl1RYHkhDfUNnCuckysDzIRxDGyHXTZf5u5?=
 =?us-ascii?Q?2vhelQNhkM/LiMod/Q7bap5nJFY1u5PH5TEt5R9wAkuNg09LamUmwfWs+zts?=
 =?us-ascii?Q?rASilPdoCtAsZm76Wev3bs6uu8aMHvPHbMyzKdxNApdtHh3qtBg/typYLoP1?=
 =?us-ascii?Q?itVw/znioEvlnBCqWq2arCtRTBHY+sN+vXihU2hVObvOulwIAAA4hue/pizu?=
 =?us-ascii?Q?SJZmOv3qQJMyeZjZXKv7ZPEm8WkJOxiJqEDYuZ4jFG+y5KKw9unZXCVboMvS?=
 =?us-ascii?Q?O19b7Bl1GHj/Sc+OdRPPp/oRUWxkx6iO6qJxc0E9dsFINbJ1DREo2UtULSHl?=
 =?us-ascii?Q?DSTQTyLFlumvYzvWhtBPTAJq+vSCXQLHxCCdyaKWuQGytRATe5Ekrf1IIqgG?=
 =?us-ascii?Q?GZmNzfA32H+HQpZ2PoRum7qxifqKe6jaXwhC07hr4RVzsXwb37vbqFG5zO0F?=
 =?us-ascii?Q?8q/ONN5116xJUCXyWTG9qL5P9Zc/anzZGnId8rzYknZPdKOYk7yAMl5swmOD?=
 =?us-ascii?Q?lIbyTegTDXyQ5OR65/y7ZwKqiZAwJUk01Xw/KF17/AxJgkTitlDyBiwWuZ4A?=
 =?us-ascii?Q?K1hr2okIqZ8FfUqlQC/BWatXhyhIHCtobI8JecETmHg3VIbHYt8zpZx8sv2R?=
 =?us-ascii?Q?d7Hc5BRa3jF3DEBl6ZnAlDPLb/GxojGoi5X14GMDYRB74a4yNDWjhskJfnAh?=
 =?us-ascii?Q?HcmFpONSAkYzS3O8xXww2No0QvR+0B22gMQIGjUgB1tZ/OIev1ChZenDq+t4?=
 =?us-ascii?Q?bcN09bwF6/rSSf3+lbajeivWBSTW8EmyhW+KUFd82vJeMR1HEFEGMWY/VSHm?=
 =?us-ascii?Q?c96GV9EeM5Q1ujLZB7Y9gM91ocnl3gSvhbm6XkaCnx67fa+wF/sRGbCT30Yo?=
 =?us-ascii?Q?wQtHUD9cQGv38WmstdzDSv8m3JkmmEHRE4h7byCIm/2gPN7aT2YbQQcKzwuV?=
 =?us-ascii?Q?spp4czJIVHTX1BQ1ilGJtF1yqMTe5aTO9rUFcPjI+sHzJcJ7b4iYNaGuTEXY?=
 =?us-ascii?Q?oiiohc0mXTdOEwfOQr/555hgbcB6+7zde7uGNTsxOL0XXbC5b5CQy1cLOidr?=
 =?us-ascii?Q?9EgQJTY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?66fEEOkLRv2UyufzMY1JIxy0P5fmh7aYTMwB2YCKlf3ZMRtQ55rju2ADReQ5?=
 =?us-ascii?Q?SAPQSAgpvysNM578PITyzTzhJHJZHWu4q01GRfzwQFik2ppViWHEZ50hpUp5?=
 =?us-ascii?Q?IIGdFNiJfzf1u4t217OMkNBoT/R48vXyBNo8AknZznIUerwjkRzUT1SmTEmU?=
 =?us-ascii?Q?rMUiWhdOZZNzS0Jx7wAdFQpy0QSX5EL+aJElJNKK7pkRU/sz/Wdy7EsWcBtk?=
 =?us-ascii?Q?sfGqFnrRQSBXBpKX+gRq2THmqOB6j/Ue8FWMTcD+QjsK1pYKCEZDRukpx7dZ?=
 =?us-ascii?Q?D5ITxHYRn9eLkgQAQtReK3zS/ec58XbNIqeT3Hk+HPevbPL2xZ/gE7otUEdG?=
 =?us-ascii?Q?tUBnu5DQp6Ci10nWXoq1auku5zGwlJmHNA0zi4tQpeqmMqrGh1wibJfQNmcN?=
 =?us-ascii?Q?m+1SxhWlajni63y2x4ARe2YO6Hgr1r/dimRU8Z/odbnw3/xCZIM9V6ZpVlD9?=
 =?us-ascii?Q?6BMv8AeWyEs0DMF5D/iSbRoxOgayjM/14Qa1Zw2+wQmh6q4y82s7Um00Xmd1?=
 =?us-ascii?Q?YvZSYyj8Vb8jebDSEyNDl8/Ilhe/uXAAd6PV0cSPWv3IJS/UH08m9f5bioA1?=
 =?us-ascii?Q?9V++cbEo0moJcrgpMr8c/yWD1KCSrb5FtGYXqb0i7cKvofcN8fgDEsrQepkv?=
 =?us-ascii?Q?jLViOi4xis24qNV/3hbmBkY+mGhsuM7p/M1o0+2zvw2pajTfQhHAxL801gn0?=
 =?us-ascii?Q?0EmNU1zLyVL2m7ONjccfdkB6DLG5Cn3qx5gZfw6ZocCNpVT/KmXaHteyHcG0?=
 =?us-ascii?Q?C69stbm62984hu/UMCay1wO8KrIprfldjWGLqIhYzqccFS6563Ms0waFdEP6?=
 =?us-ascii?Q?sR5da41ApgS36rZ1kLXvp1jklJzRtnb1AXY6wiHP/FkwTWzjeZEZNj2vF2il?=
 =?us-ascii?Q?TjF2WmvU1Vom1r4j6LPB0DPlkgVwEFb64L6EOi1h2GuMMV6+oNme7c68xjyE?=
 =?us-ascii?Q?y1TaBW2WXM0VnFpdT/R5pjPXWT70VQyqMiid6KcTJoKTU8oqdKRO5nzHU6LN?=
 =?us-ascii?Q?rzRKAK5wSJQDx8+wCUik+goDJ4dHJ7WHMrmpTO5wKeK6aXDaTJpsOY1Nkuro?=
 =?us-ascii?Q?z+PELnrj1HByGjQnq268F7BC8ib8YXhiRZPFprbv2YrVZEnovm9bsyJqyTbf?=
 =?us-ascii?Q?9dYvs1iQQe0nwh+49DJC5Wpei4D3FOS8f25uG4LMiBEc9dlv9Nmhp7EWJwKS?=
 =?us-ascii?Q?3TRXUZAiOPde23Uhk6t7f0myoStjGJo1tzzO0LRyaj9qerrBoR7JR9ABP4pD?=
 =?us-ascii?Q?T005PpblN0j9WXr/thzI5RyJf+Ipu1W0o8WX6ZGFX9AV07LWh6yoS6LiHiVP?=
 =?us-ascii?Q?uLxbpWpcRL4C9ZU3jmdVUjuvmpDDDSkPzipLSWI1oJHNKZk96WXvT3IfN0uG?=
 =?us-ascii?Q?f4uEy6dy8Icgz7uV/Y0xXFxw6SJJZuJz1EotIUXmedyywTsBwtA5V6r4M4j8?=
 =?us-ascii?Q?Anm5j8wq5YA35h2F150cERvFSCDxgi8JmB7BeY3U+zAEbEegh1pvDEUlcYyP?=
 =?us-ascii?Q?DYK9ZvDuxpNng5+fu9AzFp82qMcbBRiQRm3BjUYVb8abbPkLYykk5kALWevT?=
 =?us-ascii?Q?pHYzoBEuLvPhVXVynZdXj5OCZZVA/P3sGMDDh1kM?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910da9b1-d3e6-49f3-fb8e-08dd0a066ed6
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:28:10.4643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiFhBzU2oyL+pQfRCoD2VKKZTysJgXfr0ByhFtiPaltaHc+5N4DmzkyooIg6dNBRdr67ItD5p+s3BDtYNuP+Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6290
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fsync data recovery attempts to check and fix write pointer
 consistency of cursegs and all other zones. If the write pointers of cursegs
 are unaligned, cursegs are changed to new sections. If recovery fails, zone
 write pointers are still checked and fixed, but the latest checkpoint cannot
 be written back. Additionally, retry- mount skips recovery and rolls back
 to reuse the old cursegs [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.49 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.49 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tE2Xz-0002QN-Io
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: fix changing cursegs if recovery
 fails on zoned device
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

Fsync data recovery attempts to check and fix write pointer consistency
of cursegs and all other zones. If the write pointers of cursegs are
unaligned, cursegs are changed to new sections.

If recovery fails, zone write pointers are still checked and fixed,
but the latest checkpoint cannot be written back. Additionally, retry-
mount skips recovery and rolls back to reuse the old cursegs whose
zones are already finished. This can lead to unaligned write later.

This patch addresses the issue by leaving writer pointers untouched if
recovery fails. When retry-mount is performed, cursegs and other zones
are checked and fixed after skipping recovery.

Signed-off-by: Song Feng <songfeng@oppo.com>
Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v3: * fix compiling error when CONFIG_BLK_DEV_ZONED disabled
v2: * add wrapper to contain f2fs_fix_curseg_write_pointer and
      f2fs_check_write_pointer
    * make f2fs_fix_curseg_write_pointer and f2fs_check_write_pointer
      static and remove their f2fs_ prefix
---
 fs/f2fs/f2fs.h     |  3 +--
 fs/f2fs/recovery.c |  9 ++-------
 fs/f2fs/segment.c  | 29 +++++++++++++++++++----------
 fs/f2fs/super.c    | 15 ++++++---------
 4 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 119706dbaefa..b65b023a588a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3775,8 +3775,7 @@ void f2fs_write_node_summaries(struct f2fs_sb_info *sbi, block_t start_blk);
 int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			unsigned int val, int alloc);
 void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc);
-int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi);
-int f2fs_check_write_pointer(struct f2fs_sb_info *sbi);
+int f2fs_check_and_fix_write_pointer(struct f2fs_sb_info *sbi);
 int f2fs_build_segment_manager(struct f2fs_sb_info *sbi);
 void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_segment_manager_caches(void);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e4d81b8705d1..f35be2c48e3c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -899,13 +899,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	 * and the f2fs is not read only, check and fix zoned block devices'
 	 * write pointer consistency.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
-		int err2 = f2fs_fix_curseg_write_pointer(sbi);
-
-		if (!err2)
-			err2 = f2fs_check_write_pointer(sbi);
-		if (err2)
-			err = err2;
+	if (!err) {
+		err = f2fs_check_and_fix_write_pointer(sbi);
 		ret = err;
 	}
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index edf2a74207b3..4236040e3994 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5246,7 +5246,7 @@ static int report_one_zone_cb(struct blk_zone *zone, unsigned int idx,
 	return 0;
 }
 
-static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
+static int do_fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *cs = CURSEG_I(sbi, type);
 	struct f2fs_dev_info *zbd;
@@ -5351,12 +5351,12 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	return 0;
 }
 
-int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
+static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
 {
 	int i, ret;
 
 	for (i = 0; i < NR_PERSISTENT_LOG; i++) {
-		ret = fix_curseg_write_pointer(sbi, i);
+		ret = do_fix_curseg_write_pointer(sbi, i);
 		if (ret)
 			return ret;
 	}
@@ -5379,7 +5379,7 @@ static int check_zone_write_pointer_cb(struct blk_zone *zone, unsigned int idx,
 	return check_zone_write_pointer(args->sbi, args->fdev, zone);
 }
 
-int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+static int check_write_pointer(struct f2fs_sb_info *sbi)
 {
 	int i, ret;
 	struct check_zone_write_pointer_args args;
@@ -5399,6 +5399,20 @@ int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
 	return 0;
 }
 
+int f2fs_check_and_fix_write_pointer(struct f2fs_sb_info *sbi)
+{
+	int ret;
+
+	if (!f2fs_sb_has_blkzoned(sbi) || f2fs_readonly(sbi->sb))
+		return 0;
+
+	f2fs_notice(sbi, "Checking entire write pointers");
+	ret = fix_curseg_write_pointer(sbi);
+	if (!ret)
+		ret = check_write_pointer(sbi);
+	return ret;
+}
+
 /*
  * Return the number of usable blocks in a segment. The number of blocks
  * returned is always equal to the number of blocks in a segment for
@@ -5435,12 +5449,7 @@ static inline unsigned int f2fs_usable_zone_blks_in_seg(
 	return BLKS_PER_SEG(sbi);
 }
 #else
-int f2fs_fix_curseg_write_pointer(struct f2fs_sb_info *sbi)
-{
-	return 0;
-}
-
-int f2fs_check_write_pointer(struct f2fs_sb_info *sbi)
+int f2fs_check_and_fix_write_pointer(struct f2fs_sb_info *sbi)
 {
 	return 0;
 }
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 35c4394e4fc6..0db3fb47ff6f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4766,16 +4766,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 reset_checkpoint:
 	/*
 	 * If the f2fs is not readonly and fsync data recovery succeeds,
-	 * check zoned block devices' write pointer consistency.
+	 * write pointer consistency of cursegs and other zones are already
+	 * checked and fixed during recovery. However, if recovery fails,
+	 * write pointers are left untouched, and retry-mount should check
+	 * them here.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
-		int err2;
-
-		f2fs_notice(sbi, "Checking entire write pointers");
-		err2 = f2fs_check_write_pointer(sbi);
-		if (err2)
-			err = err2;
-	}
+	if (skip_recovery)
+		err = f2fs_check_and_fix_write_pointer(sbi);
 	if (err)
 		goto free_meta;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
