Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C9188BB8C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 08:43:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rp1TE-00085N-Oq;
	Tue, 26 Mar 2024 07:43:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1rp1TD-00085G-6n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 07:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dg6s/n9S0NLaQ41H+TYPrV0Z6ZBiV5D8O+IQcycU0LU=; b=Okx0pdvaIGAfGpyCyZiBSbQjPM
 sfbKaNLpR1J8X06qeGq/nFHKKyDizfQVEeKziTHDhTFJPhf1PyIiaovYhV9BbXQ4NymRym1usFeBS
 WZD07LCOjkoX45aqTudY4XnBIZo9eNIAwX8xkBNab5CW+mVBmTa7ix9K13Bjs14y4maM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dg6s/n9S0NLaQ41H+TYPrV0Z6ZBiV5D8O+IQcycU0LU=; b=c
 ImsKqR0krrG7IqfT2cZO9Y0/msgAfJGzWESj8/XCJs0l9vvf02uib6fW3zP1eFY7X7djfRkgsnidY
 g3B7q77/belG7aBdbrJxjihVrjZTH8gAngO8B9NuPPAU/i0a+9pWIVM2DSI+yag8EdQdpnLV/vSnf
 2VUs7dUl+ht7O80U=;
Received: from mail-tyzapc01on2093.outbound.protection.outlook.com
 ([40.107.117.93] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rp1TB-0002gx-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 07:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M7ueRckr9kKqWcXtOWnUQTn2t2ZTU7ot2AjQhPHV8VDs5G0zUqU6CxU7TnE8t4YWs6AexCohQ9tcOje+OPnY4l0SI6vDa/c3j9GZdcfwdx3IZamtv2p51k5QZaptBttMBYycdRVsaZoYxb2C/Af6P7y78Q53cUIaTbgiFG2h2Q2gpxJVGo7hf6QAO7A4wEenmEyoXb6n0p+wPlnKJqzgfsvsYcN4c0WVkGCec15iZl5/mmx3WEHDcVQyN928yH9fUiZQVnx/Q5gUuLlbyDTE+tiH0nR0hzex6HqwG/bxvmTXg9Og8CoY9/GHalf+cVO3OZDgOeMxqPMG7N91ORWa+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dg6s/n9S0NLaQ41H+TYPrV0Z6ZBiV5D8O+IQcycU0LU=;
 b=EypTH1mpdprQnn7rO+EdoLlPhAiDEIQRZIsQC4pARwv0BrSwPgC+LsUmYIoQmoeo/s6PS85EsX7Bf9cCjlOCSrRK/IQf5TKjdBa5oH3QZjsiAgUnK5tWzJDVlgRxMqWmta81VsqX1784CW5rtMHt9Q6kZ+mr1FlJDQzUfVWPRSdyZG0tLqUswC9AEv7sYNcM8rCyTNMs19692WrT9B5EhREBuJJ9sVtwQszDo7iJpYNaJ80MzVQxAzqH5Jr8xVqwcupD5uHVOAyWp+OTdYTUfAx9TIekac7sMd2mCu6DHzQJyqWWX4lD06nHa103qqWIclkGgzvELNQ0IhohoQL5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dg6s/n9S0NLaQ41H+TYPrV0Z6ZBiV5D8O+IQcycU0LU=;
 b=J7NNfCTgz+XyHP+o7jwz9dR0kccBmNfPkMFaG+F9JkvpJjeB/6aOch+C5YMOHnMRydw20eJ4i+8yf6dmO4V1upAbhcfMI194nxsUvw9VGD1T6WCGm7fVdT8FIettjE0+qctrOqSGQHQVkHOU2HP/qInsFBsqo9hC3unQzG0wGMA=
Received: from SEYPR02MB6403.apcprd02.prod.outlook.com (2603:1096:101:139::6)
 by SEYPR02MB7625.apcprd02.prod.outlook.com (2603:1096:101:1d3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 26 Mar
 2024 06:11:01 +0000
Received: from SEYPR02MB6403.apcprd02.prod.outlook.com
 ([fe80::69c0:f570:c133:21a3]) by SEYPR02MB6403.apcprd02.prod.outlook.com
 ([fe80::69c0:f570:c133:21a3%4]) with mapi id 15.20.7409.028; Tue, 26 Mar 2024
 06:11:00 +0000
To: linux-f2fs-devel@lists.sourceforge.net, chao@kernel.org, jaegeuk@kernel.org
Date: Tue, 26 Mar 2024 14:10:43 +0800
Message-Id: <20240326061043.1348968-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR06CA0249.apcprd06.prod.outlook.com
 (2603:1096:4:ac::33) To SEYPR02MB6403.apcprd02.prod.outlook.com
 (2603:1096:101:139::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6403:EE_|SEYPR02MB7625:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gtxwfBRvTdcvAPAjYUOq/WrglXWOSQQQ/qvjGWUUBq2WdCSgzVKbE/qVkTXEijlUuybiTKnIBKEwGqRGc+VwW+sdR4EELmS2YL8Kow69Yed8d3dwlTv01EIGj95eNbzyOHcr7Cs+LlLc6DbzRwVvO0D3cpDWQ5E48CYGNPl9KBuEHVBUQpOwFnL+wPc33aBxXaIBDXVUdIT8I1FT+qpzhjmG4hb/Qrayz6Dr4TEhNZKJy9mR5485ggZ9fD4cFLIjYz88ptYdx7d0RTruhR41LZ2v2+OJ7eERdnNEYxk9x3Pr52AiuLTDmrfdcx5J3QYDQ1uEluHmIayrakRe1J3LeMcTFIR1VFn+K+liDNUgZ0JAuayDp4R8jeptH195jGAHWEgiY5hMa2lFj0MllFYVxb8lgavdlAFL042oXFURFVUE2irNi+LfsnaxG3MXO6sQi1UDV/flzAA0CsUEtF4tJ6PaBGqeta0aLpgkHIU23O/Rt1VXlQAbvIjpDQkrg8ah7NmXqkG5pKZwBEVRnmUf93w0Xa1obCh+6ZGwT0eOAAbO7SOcCZTog5vgJFqNgxfiTmYK4TMyoF4HtlbPGonA8ynObmjCvNpHGootoSTWxm7/qSJJdmRvv5jhNqp1dYfVJG519mZZipLPXAwi503B0/w0Nw69Io9f8zHv+U2wGg/f5OgPiGhhhYiLeASfrRS7X/B1QacdIGH23wTabN2sWTnyq0zzlNp0ItdX5fU1XPY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6403.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YVVz633sAYUWebBXqRogTuH0JOcydsKwh7rpQORpol+vHIDY1hkpwTbMwiLj?=
 =?us-ascii?Q?d1y1xc6Ai1WJHkWgiaTfW0C1P1dfEHvAoMX6/iR+4gfLa1xz6M+xvs5w1Ycj?=
 =?us-ascii?Q?+81rm7qA0N1E+dfVDGuRDHUK4vkbD27hhSLUVAPdAE8u+2ckD1Ijvjf56oKW?=
 =?us-ascii?Q?jFCjxpWROmgE9bgYXxkWE/puYt13X7O7CbXyTI1OC7B1Yt85JvMhIMqGnyYY?=
 =?us-ascii?Q?+1MGCUJRK8Zd3wbCnmRSkoU8CW9pAN/DA3+uJPNBhhuklGm8HVlhu3/LRETQ?=
 =?us-ascii?Q?iB3md9feFC6RIbyr+orgyfMgS+l+rqyEYohZnwilajNw+R8wH3hlnjFHtG5Z?=
 =?us-ascii?Q?P6FsjZXAfZo6H01ZHK9fRaAHjCCSKekmp+QbVc/5HXzMeLd7/bNDiCr/IeKe?=
 =?us-ascii?Q?tPmDTP7d2yeqoGR1RfGtFjSAXy8qKIScCCDFx6Wes9G6i5vwwqWQCu4Oy+Be?=
 =?us-ascii?Q?o2Mfng/hCzC9LX7Q6YKtTNDRJ4VXqSVV/QEIqo6oXzeOPSiVvhuV/vId6Xo2?=
 =?us-ascii?Q?wZMdHeSYiMeV652Xxaq7xFAoyQl9TixB0SO4ogohMPaKoCnICAILrAFZW+wU?=
 =?us-ascii?Q?j0/gfcTh/+n1OKxL8//LSSghvz4+VMVCkXAvAlKDuSEJ6LU+BEdw3F05MA7V?=
 =?us-ascii?Q?XKObIeso5xVQxyEsctG6iMKzU2raQwC2zaSSqqhJS5cqyanB+vsBB/pCkR45?=
 =?us-ascii?Q?CVxRvqSuaqiP17nx2rcZbxkZfP5LpijyRx6t2SYW912Lm4z7DHbkD8AE5oCE?=
 =?us-ascii?Q?JLy0kgUR9N/bYkEW/GBcWZg8ilE4Ll+yWu9fFqUx6E+bgjyhgP60KaT/B6XY?=
 =?us-ascii?Q?4xQYZhGqXSvu1C9mL1XeIA85kouPFizpYrOsWHwr19y1ENqUVfkgM9uuLDmP?=
 =?us-ascii?Q?OJ88OdG6FuKyLaj+iXOKkB/8j0E+es9FbwCee2LNBnH0TsolWO+uKWzRkHrj?=
 =?us-ascii?Q?GUD8VPgRsHIAV7fgMh7h8YJnWhyDWzWrRPjltSPCbz0PqzEQZFYuTJQddSI2?=
 =?us-ascii?Q?Drfi5uU6gsm9D4puVb701JFuWjeBDFr7QQoCSpcyWDQRJheZQu57s9Wr+soy?=
 =?us-ascii?Q?qWlYrKNQFr9/XEXpJUZmM0j9sSBkMRjV7E0dSk97EXQzEwj3xRkxPR5/6ocI?=
 =?us-ascii?Q?FaIovTRIDlm96tYHUxj22pGype/3C8JIuDl3TNo9Ikcghn5RdVYas+P4Cu1v?=
 =?us-ascii?Q?b/qAmkAwHkP5RoRUxVk05xyJgpCBNcO+O+ilQMR6yNIR1eT9mNudDb4+rcnf?=
 =?us-ascii?Q?rhY2jJ8W6YkcQ63qaWXdEkpDwOZtaHa5bg3xVFQTFKJngFFTA+YoxC4OjgEn?=
 =?us-ascii?Q?+LbNdF5TqSauYNX5+bbF9znjPMptgXt6sBEORtnxcm4PX/PI91gtL9a0x4zT?=
 =?us-ascii?Q?ySaRPuDHnPz5HXsmh/ergjQd0GLXIU9Me5bPaqBevKKuOum/BxkSW9CkFrxC?=
 =?us-ascii?Q?9PgwlTR+9UybWSPrMxDfPKnSl1SMKiHzneQT4klTU5JGNlEftHWIXX7KGo6R?=
 =?us-ascii?Q?BHqtif87RJiveXHENmwYmHPNo5/ZyI8iM0dQWH/GOma5eLwJbcWwL8DlF5p6?=
 =?us-ascii?Q?jdMoUt4Y/5GpJABL4l3pTMdTbkK6U1Xm8T5SzVIv?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e6938f-c714-4722-60ae-08dc4d5b8238
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6403.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 06:11:00.4519 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XM0VWqIRomRqeksgbIL3wLcuG78eiA4cdNJ3HXtc1R+7EFyLO969PEiRO61J1zOP79D1pMaZK+0mWjPx4XN+Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7625
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In f2fs_remount,
 SB_INLINECRYPT flag will be clear and re-set.
 If create new file or open file during this gap, these files will not use
 inlinecrypt. Worse case, it may lead to data corruption if wrap [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.93 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.93 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rp1TB-0002gx-C2
Subject: [f2fs-dev] [PATCH] f2fs: remove clear SB_INLINECRYPT flag in
 default_options
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In f2fs_remount, SB_INLINECRYPT flag will be clear and re-set.
If create new file or open file during this gap, these files
will not use inlinecrypt. Worse case, it may lead to data
corruption if wrappedkey_v0 is enable.

Thread A:                               Thread B:

-f2fs_remount				-f2fs_file_open or f2fs_new_inode
  -default_options
	<- clear SB_INLINECRYPT flag

                                          -fscrypt_select_encryption_impl

  -parse_options
	<- set SB_INLINECRYPT again

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/super.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a6867f26f141..164eed42503b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2132,8 +2132,6 @@ static void default_options(struct f2fs_sb_info *sbi, bool remount)
 	F2FS_OPTION(sbi).memory_mode = MEMORY_MODE_NORMAL;
 	F2FS_OPTION(sbi).errors = MOUNT_ERRORS_CONTINUE;
 
-	sbi->sb->s_flags &= ~SB_INLINECRYPT;
-
 	set_opt(sbi, INLINE_XATTR);
 	set_opt(sbi, INLINE_DATA);
 	set_opt(sbi, INLINE_DENTRY);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
