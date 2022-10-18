Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B28602616
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 09:46:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okhJL-0003mM-5H;
	Tue, 18 Oct 2022 07:46:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1okhJH-0003mB-VV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 07:46:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A7ulRy0s/oUODbUjSm4inAeZIy1XgU44aubn9hGnGZI=; b=T1JUgqsuBgpYm5ewpVjP18ZdYF
 cm1vTYJQL3thbiTwc2xIOdbSn2NhFumvEcbsnIFgfa7Y/cz3wetlkIIsZupNodUyHDA7L4ZSlrsj+
 +O7bvYp9x8REp5VvhQz5wd5vo8bns9BasTv5NdzrOepd5wawkpgTOrspDz7Xtw+tCyfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=A7ulRy0s/oUODbUjSm4inAeZIy1XgU44aubn9hGnGZI=; b=Y
 Tj77Jp+DV5FzkrJqPlQ8q3HiiR/7AIj+cjV3jgLcxgQQcpJwTeFIvHNjAaC5/1bLJ5t9S6FCZ066p
 /OBDZ1Mvi1dmKNUtuFCR+4MrQrqli5Ne6niAlYaAhj63bbCJMjGAOSHauZExktnJwsc41bUHKBTe/
 FpJKcMiPWVLVSyv8=;
Received: from mail-psaapc01on2091.outbound.protection.outlook.com
 ([40.107.255.91] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okhJA-00008U-4M for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 07:46:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fGijX5cdBsLQ0HeqsyUFr+ZTLOsSbMngAp9fWtmvay+4S0STDXWMYg/nj7+zij2x6pCFGD0+cteH3oyrJeY0dJ3Qr7/ftImaXu8T9fbGRHwYwyNKEVS1ZxLgPudguPq7YEVZWyc2gIlG1V4+gTmFLSDR2sojrwFFWpkwlzWkhKzmDyj9HW9nBKUB0O8hXAUwP1Q68d5WSYeRy/b40fiXDC0tE4f3kGBBruRHfUSwsl6HW1ppWq92qeFMg4JrAPtTim58Pwccn2Jigtsc2A9G3HRXIKSWOpk8I/yi8mSl6NVUfboPRHpAAYTJC+WfFWZNUXAmXurCXs7t3ME5Vgy1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7ulRy0s/oUODbUjSm4inAeZIy1XgU44aubn9hGnGZI=;
 b=kIeFdXFFJa0qn4WkIGX8I4t/SAqrHrimx3RjQZgc1m4u2MSqOWVjA/o/7QARWNiV5Z0lZNaBL+dnpMpiyy7SPfSEKGuOz77hmjbg+SM1U2HA8ajWWaD2C1Xcv3lmmsRdFvsUiin5YW27eV3d8dCcTOzgbX9VVTJ5/xwLLao4s/VuHtG1XxiNhx7ANV91PMNUVBtuilD6cM2ovtaXr6ppM+SxVgn5PfJVQz9Lr5Qfd+IyPL+Aqc4kD4YLbZWPZOUVDJK2cZVuqNWsbJgvV3mNl3ttVTrkpuS97OrJ6bPxsc+qbbaigqS4O0wSPctoSByuZDYgAVWvdTW7LrYigCHu9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7ulRy0s/oUODbUjSm4inAeZIy1XgU44aubn9hGnGZI=;
 b=hqvQGb8nTl2LGWv1udgWy1ZeVu7CP5HJDDtPvwjMUnFEkcRVEXMHUgq0C8jUuVFyPO20eOYSguDskbwXL9OiA/7zZAlmnoqsJvlK5YGHPATVEHSijuX5X2lrexu+hmwwAeL1eshxK68XM/S+dX0aVq+Kn61ELtDeA667lWaCBHChyNePt6WH4rCwQ38L/K+PzhE1SAHg5QbHhlOB5d1KE5DXlVnButo5MN5Ax6Bmcs8KZsPCIOK6IAqotd4S6pdun1XPLkGuOonNcgi/sgIigce7APlptSTXpbdTGSj+PH+ReHJ8wFJTnbf2UtMS7jV2kgeC1jx79L0TlUDrcXHMjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB4604.apcprd06.prod.outlook.com (2603:1096:301:b0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Tue, 18 Oct
 2022 07:46:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 07:46:30 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 18 Oct 2022 15:46:21 +0800
Message-Id: <20221018074621.16019-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB4604:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd70b47-acd1-4e80-eafb-08dab0dcde6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SvZdx3/BtJV/oLFYcrqj1AjVGpdNJXkWx3fF24F/uOHXgDjkkNJNxsNMUhbTpG/DSpkiAvQy/R8Xh3k2PVbJbJgKgEneJB41r5vFo+DCC4u/92lNHfLe07hlZ/6tug8BHDCtmhYO4xq0pIcSJl8Oa6JK1mvcCUIH2gGZ4I/cokN5qIOCUrbMPKe5JTDFirD+Inczb0HAa/f6qJcGFRc+ZegwtAT/OOEJIXNSyNhfpof2X42rLbTBJ6jb9OD0s0J820jEaWv1OV6sgGPo7e3GoxaghmggkzhSTlk09laug9guoMS0G9xj2JfsTgyJ+xREApGL8n2KTIHjeVzi1fmq8enStqzuPsbakFdHI9xB67QvMhlHj4ikkhjMJ9g4dAN0Iw7giD+PBzNCl9MnaSwlnEr+SzSUD5mLuL5evSrY29Z86ZdFzTWIePurRmuiF097EFEQxf4T/rR4JFnM7jphAc3VS5zeLd1q4+dSM565+57Gkto5bLmP505PRni+7l79wP2HkPxTa4V7NFsK6iLEVKml1Kv4DPng3rx7/+0fO4a/nvaZ5pTQIuQLVnTvGSp6asl2uP+csgvkgvrAWfrlUADNPQ/i2QQKXVOH9Y+/mO9vBZQHoRWxcEA6ULOooa4Y91JYNqXXysLzPfP0lq5oSXBOq40Pr85wqMfTHHVgUhHQ1R2ie+lSLj4CjdvOC1u/hcFUDfmpKkeKd+aad4xT6i1PeuM1h07GmA0KyMy2cc676vFeT0FadtlXT2roHv+TWLvKMdO3TuN15bAquv/15hRTUxTIS0HbIDUlYx6iiN0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199015)(36756003)(38350700002)(38100700002)(5660300002)(83380400001)(86362001)(8936002)(26005)(6512007)(6666004)(107886003)(186003)(19627235002)(2616005)(1076003)(478600001)(6486002)(316002)(66556008)(4326008)(41300700001)(66946007)(8676002)(52116002)(6506007)(66476007)(2906002)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gu4kY60G462yfkhw37aRxn221NxKb0w7UuQrF67bs+z+hBLD7f3TJO4qWZ2J?=
 =?us-ascii?Q?c67bhdrCfgy7KLPGVGNgZEQo3+RvefKurz4LDYZyH+uVAKLpuynFY7cx/zN6?=
 =?us-ascii?Q?hFnMXhlp3S/dIC0MJIobFXSQaXtgepdw2TLArfDYxRx10SPTnyB2NIUh/JHr?=
 =?us-ascii?Q?Pxq/jKzdx4R56W/tHeJNOQrPUP1zvFujAojYGHptUUnSjY6hwn60SMumxqk2?=
 =?us-ascii?Q?FSAGVGe+dpWhZAt6V1RA62LfDPaCrR79ro9+VnMqNEXMJDvWA3z2kY+vHdqc?=
 =?us-ascii?Q?FmqoRA54GXo5usJC5syfZCt2jwcVSjAbFEoP+hAqKiLM4B44l2dc6/eE1IhJ?=
 =?us-ascii?Q?u2TOFGtGLKfOl4TTIE8hX7j0PJD2k0Lo5qWu6IUk8i48BSHNxFzTajA8sipJ?=
 =?us-ascii?Q?mVHGsPTrI3XXzpwa70euiOWhD1Oep0ISOzkFJmzSmW+Ng/NqsTz8AKaFdqpC?=
 =?us-ascii?Q?WkxgdbcNS2uqDTb7wVGrzQPsokQQQ6VzaKKqz0egkSgBnDrnXNnu/m7/usDd?=
 =?us-ascii?Q?ClOuzHSdFMH7bAWJGDyLWdKvnNg3CIrkkTcEu0Fny0S710JsrdSTzauN9A0s?=
 =?us-ascii?Q?M3f0w/WiYY13pokfDeMi3rhahqkju4Pk/FwoB4NZSQsx/paDghR5B4mLHRb0?=
 =?us-ascii?Q?Frl5vlYRqihvKd/GQSexNKwp5DFrD+cd2X9bD4owIQVhcslD8L3Wsm2W2sup?=
 =?us-ascii?Q?0z0DV5teCGBn+a9HUeXxnKBK1Go1n1XH/5ae6QZ+dfAMxOEhOXwd5EoR1bxf?=
 =?us-ascii?Q?Dn5+juNgYW6DtU+lJdyWL8FBqJB5TQGx6RZrXxYiV/Bxzk0oL5S7GA+hmDk+?=
 =?us-ascii?Q?gscNJi6dS4OyBQyVPxApAjRVtB7VksVsOYYdz41MHZa5cS6vKqBqtQ8ZCBPt?=
 =?us-ascii?Q?+PCkXvad4NY1CppyCahi2XU2rNa622kyPrI10jxW8N3J4pEv7Fm7mSrfr9PG?=
 =?us-ascii?Q?hbbHGMjS5mQnoTYswewH2yBOsvvgbqkNd5Ss8qRXeGXZ8zFkPLLJtm2s/+31?=
 =?us-ascii?Q?uOYdhcbLdrWJ17DmYr5Vj2nfDqpzObDrmtYYfum71AgiP0AjKBadmzi/9Ftb?=
 =?us-ascii?Q?Y+svm3WR7LUUlwtJxg/0TClw8HSW1TDZivpps5fl7eKlbccAA3cKGTsmORRR?=
 =?us-ascii?Q?bofMDylOsJg2qpjdF1qLGXD2C+rg2p2hvagRCgpaGPD4UQOBKljlI12A3xv8?=
 =?us-ascii?Q?dmgjLY4B1qtWpnv83NZC0g2Ur1zOhMO3ov+gqvGkKiSG6Bw5z5H716R09vb9?=
 =?us-ascii?Q?R8/FQFj8+SIhxAsq0DPoW29kOgw3XEDiZmhZIbPQI9M7SMps4IYjDjiFGHVr?=
 =?us-ascii?Q?FMIaDpuMxdHLAHxtuvrO8htzEd33MP2GK2ItH0yUwtPKiyP063a41BHRxOSB?=
 =?us-ascii?Q?r8zvhBUCSleqq6YNT/ZffD64yM6uZj9L9qpwahdrLu3jKenMGLSVF2iNErHy?=
 =?us-ascii?Q?KXjeBjG7XmEbljfWhIjwgeIVKjomLQRPdNqEOu3seuY6V9jdRK58l5O+kjE9?=
 =?us-ascii?Q?Md1CLn1Cocos7V6+WJk8TxxUjwTES2Hj5GOgExhp2KA7mmtrtkZp6nyTb3D6?=
 =?us-ascii?Q?pV+9+/VFhHv5Zuoy41P6Uf/jlsftNNMMc89s6FCO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd70b47-acd1-4e80-eafb-08dab0dcde6c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 07:46:29.9363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57Xz/shAH9wqkKCNv2S4rmEVaLPnJFi5l7y7HfSWtX8r8rCwysuahHL6ho8uxx2k3geYTGueg+dHI6z8e1lpeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4604
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Added a new sysfs node called gc_urgent_mid_remaining. The
 user can set the trial count limit for GC urgent mid mode with this value.
 If GC thread gets to the limit, the mode will turn back to GC norm [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.91 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.91 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1okhJA-00008U-4M
Subject: [f2fs-dev] [PATCH] f2fs: introduce gc_urgent_mid_remaining sysfs
 node
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Added a new sysfs node called gc_urgent_mid_remaining. The user can
set the trial count limit for GC urgent mid mode with this value. If
GC thread gets to the limit, the mode will turn back to GC normal mode.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  7 +++++++
 fs/f2fs/f2fs.h                          |  2 ++
 fs/f2fs/gc.c                            |  8 ++++++++
 fs/f2fs/super.c                         |  1 +
 fs/f2fs/sysfs.c                         | 10 ++++++++++
 5 files changed, 28 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..11ce4a8bdacd 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -599,6 +599,13 @@ Description:	You can set the trial count limit for GC urgent high mode with this
 		If GC thread gets to the limit, the mode will turn back to GC normal mode.
 		By default, the value is zero, which means there is no limit like before.
 
+What:		/sys/fs/f2fs/<disk>/gc_urgent_mid_remaining
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	You can set the trial count limit for GC urgent mid mode with this value.
+		If GC thread gets to the limit, the mode will turn back to GC normal mode.
+		By default, the value is zero.
+
 What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
 Date:		January 2022
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..2f33d6f23a26 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1736,6 +1736,8 @@ struct f2fs_sb_info {
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
 	spinlock_t gc_urgent_high_lock;
 	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
+	spinlock_t gc_urgent_mid_lock;
+	unsigned int gc_urgent_mid_remaining;	/* remaining trial count for GC_URGENT_MID */
 
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..39d794b33d27 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -104,6 +104,14 @@ static int gc_thread_func(void *data)
 					sbi->gc_mode = GC_NORMAL;
 			}
 			spin_unlock(&sbi->gc_urgent_high_lock);
+		} else if (sbi->gc_mode == GC_URGENT_MID) {
+			spin_lock(&sbi->gc_urgent_mid_lock);
+			if (sbi->gc_urgent_mid_remaining) {
+				sbi->gc_urgent_mid_remaining--;
+				if (!sbi->gc_urgent_mid_remaining)
+					sbi->gc_mode = GC_NORMAL;
+			}
+			spin_unlock(&sbi->gc_urgent_mid_lock);
 		}
 
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..13919ad152b7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3617,6 +3617,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
 	spin_lock_init(&sbi->gc_urgent_high_lock);
+	spin_lock_init(&sbi->gc_urgent_mid_lock);
 	atomic64_set(&sbi->current_atomic_write, 0);
 
 	sbi->dir_level = DEF_DIR_LEVEL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..b4476adea776 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -539,6 +539,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "gc_urgent_mid_remaining")) {
+		spin_lock(&sbi->gc_urgent_mid_lock);
+		sbi->gc_urgent_mid_remaining = t;
+		spin_unlock(&sbi->gc_urgent_mid_lock);
+
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
@@ -826,6 +834,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_mid_remaining, gc_urgent_mid_remaining);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -953,6 +962,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
 	ATTR_LIST(gc_urgent_high_remaining),
+	ATTR_LIST(gc_urgent_mid_remaining),
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
