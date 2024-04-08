Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FC289C40D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Apr 2024 15:46:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtpK8-00031X-Tx;
	Mon, 08 Apr 2024 13:46:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1rtpK8-00031Q-2a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 13:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4ef6Qs+MgQU01AyF/1unbzUGNktf3nrRet2cY5bmrjA=; b=i72xmoMfik+7xKug3gSVL6aBFA
 z0kxoHD2t+KZm58YI9XH376gCGFISWO4fHfoytvjjU4gAE+B5VyTJeRwWT1489ajLShaHcIUCK9TG
 q5JLqJ9I5qX8tsskJ4dOS5Pty/1xes+OXiIteYDmhvhr1wgxfHuHIzxAEekGvnSFTUrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4ef6Qs+MgQU01AyF/1unbzUGNktf3nrRet2cY5bmrjA=; b=L
 0rPIV519L9+YgBLOxUFSrdTfvi2VoiGm6tQlYk6qqe/wQd16uxh0F0Y5FbOBtl1hMOLNPd62L3qPy
 +yftB2AiMvHx1EmU/58BvcCoeS0pemcIZmPL7fNIwW+MsSnL7KlhIpwq3OW+ebLEtmwQPoIghDjtf
 WARtjazl6ZhJui6w=;
Received: from mail-eastasiaazon11021006.outbound.protection.outlook.com
 ([52.101.128.6] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtpK5-000538-Cz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 13:46:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=layJQbL4zmkGx09NIIFiK9ZXLaGgs1h/O/r5JvIuOAPP7TSBtqMptgm7bTSU+DT6XXqlC5PYiDVz0AQCo4m4ulaI9ujQLDr4/oM7/SsF+FP4l5f2VP6es5gtT2SUC19gzkE+wrjaLt2dnBw2G2RqgFwKzqmdjwdHrHbsBe0yw3yhBVsyV7+6rZuPCq4CNofaF3BHKgKBhmbVq05uHyBGVYJI/UBWC79nC89vMW/OPShhDGp58deySUE9t4wwORaL8TzJ0ysITyB+46yjgxAT8g9DENWuu+htuNiCsVoT9YtXabUHTzsyM6pv54Yt+Rshbg9yTLI/QrXN4VEBBMyQ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ef6Qs+MgQU01AyF/1unbzUGNktf3nrRet2cY5bmrjA=;
 b=fLhXwZgTLIZgyMBRdyMsTJBj27/+kOuYZQJFcQ/PazpluwTc2LAOxBwF79uJNAN2mVHa2tVXoMt3pH0R448a/oQXgqPIaJDa0nAXTaOq6J3e/EXQoJ6W9t4Alx4bOn3pZJmxe+kRZHngxp9bsdKufHrMPsRNXq1+dXsK40lzu3C56zy2X00u5UZIzsUkMvCzdQb78ZZLns2JIwoWY05vK0WHW0K9+1koGauuLER3k7kiKDLQHKbQJ15pJcf91eH4uDlrjJAEvt7P8wjyIRlQuXARTX7UPC9OFIVEnMoGA9Uh67avlCnCxs1hnwRaj0lsppiTUmC3rcU1IjaCw3xekw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ef6Qs+MgQU01AyF/1unbzUGNktf3nrRet2cY5bmrjA=;
 b=HdJ9bl3HmA6P12QmYGEG42PALY4eMMSfxi3sPDskZj3okK0hQjQL51K+EYNoysLmf/Hm7kXZvP0OTc7xX6EBvIVT1+YcSEvMuAfkdvM5JKoeCgDWLjaHM0b3CIkd+uQtnEfVizLRleySR3ks4//9V19b6a40J19NWoeZs46qwmA=
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by KL1PR02MB6141.apcprd02.prod.outlook.com (2603:1096:820:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 13:12:08 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc%4]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 13:12:07 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  8 Apr 2024 21:11:57 +0800
Message-Id: <20240408131157.4100204-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|KL1PR02MB6141:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H2H70DPOvD25uYR2GrRWlh9IE+TZZLp7NCRcrXQBNZUGJr8wCG7fUvqNaM+AkVBqkpo44EapNFzn8ULxoRUuPCTwzhbHmjTshaK6gEhrxMGb1ZdGhC5L4jl9kr7atQE077MCuxd+UepHfXlY4b1unInsZKwRn4zLbh7w5TdSkkDMH38oDF8zE66rLSyOtdfFuHLMfRbtJU2kC0yLcwkIGw/W67UJbtLKaAatgkPMP3JdWty0JG3ojB51Z0nRNb2FStdm4VZFIKoRQ3vWp/3U09C/Pn3W+EGBMAnIiVCbJoDI1CuudpI07hZaYh0Sl5Y6lXsxWjjijynUfGBzZRbowCs1o01/vclxuRWynOC/aF2fszcm0gfCvn0m8IGrIWALIWvijVRLBVSKYsWPK9Vtlm+O3gd25WXxymssOWfUZXwIggFZz0SWiPwMf7TsUntSwsgdS6GZHdakBJuhbue5kh6HBWe8C2LBiYhniXtk4KB13E9HcdEV4XQna+uJ4kruf9GKXFSGVus0X+DNIrIZw8RaFxxgyUegsp7ttNklDdaVEi59+2/yH4ewCEiAMdMSyKp9Kou2rN/arb0aUr8t2JqQaJse7EHGVkY+Qpw9DBg2EZTQMfSA2JgcePrvq40a0WJo1N2pua/WZ0Dio9VZxPj3gq/ebD1k0q8DJ9xUb3GZ00BbbY2FDZocn1QWFudq9hI2vGB1aGEEuesL9Bnpmq3o2XENGStGZ940kzpjhUk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uUVssdhgRimZZKzvhsuswLniwrk0Hd8CINBhhFf+JecE50xtKNKK5FYEaC/Z?=
 =?us-ascii?Q?XS/2UHW0KxNyR4JayM4yWCiWQAURXlG2NrTpZfXC8ZA1YJ1DKIzpVfrH5xCh?=
 =?us-ascii?Q?KXV9oFHdO/C++i3lwKEly9Y6xkWAF9vO7fE5G49Kr/S6CxowgZ/7kdv+Nzvf?=
 =?us-ascii?Q?qQzfqwm+qnkAfdD0lUdSuJ6EKYqOzh1sb0TP0giHaMZcl1LbdcUlhDZIJdsO?=
 =?us-ascii?Q?vCUDZys6ODPNatRTBeisNUi8RGI1QK+eoFKfNtQOD/M4hIEVIhckthGV5fNw?=
 =?us-ascii?Q?cwhdhrAsZ2hYyO1Z2VWaHoA/EOSvZeDtRiF9aUQMGGbeWBLH6XhakIzLwbzy?=
 =?us-ascii?Q?VdR/rAcN56DNV6irVH2Q9EDjw3HUa27e1/PlL6fVPLn/1zlk4NXzJgMGHUH0?=
 =?us-ascii?Q?jHVRwWKFgtSc/qkuU/utmL0SSxmzlgkfhLYUn9l93lfRPBXcTh9k11a7j1Td?=
 =?us-ascii?Q?oA2tKiHVK/6A4P/Qhizkm7152tGGNoPClBEoA4MDQnGODm2D0yw68iK82dhB?=
 =?us-ascii?Q?0ZW3cgBw6/lZV3FZeC6MpC8/3ttBUN8GWWxBC/VaxWTXGeEhwt8AbmgYo5ad?=
 =?us-ascii?Q?hfC/EOO1MY5LYD1JhSLNW5AzCdKsCWda0dsIN5npW0GwLI7skoGh9d68pKzp?=
 =?us-ascii?Q?MgCKZDL+i20t5BiPrA5IUB6XTU2LHlDyn/PjI/zw10X4YrwPLJ4/BGh6Hd19?=
 =?us-ascii?Q?vMa6Imw96Rp00DiU9JfwwFBHHmBh/P3iFOxzcqrw8RiqNrnoCsInTQOjPt1N?=
 =?us-ascii?Q?0aSiE6LeIRo9iELregfpJhSCEUXFjtTM4OtsUM+Wfglhdq9Ux6TGFJZPgfU7?=
 =?us-ascii?Q?ciNecuxyjajv6HWxn5MkKyvxtBWaPXAHoT+glouepiIQieHHhPI7HAL2xXdE?=
 =?us-ascii?Q?uzxhLR1FoT72taJnq21pVTubugf5umCMeDIvgKkTH0ywAgj7Yl/+YMza10B5?=
 =?us-ascii?Q?1QtMHksDlgWxSazEHpYGgL5g1kvNio8opv0matRBRDZ1oFBPyUVqIJaWbqPX?=
 =?us-ascii?Q?RkRI+9MNAy6iUwVRBy74UXIhorMxfSuVpGLWadE3+5lMsp2ZUpIKZyVWIXGy?=
 =?us-ascii?Q?qmt3fvQzNDE6VH6RMmGdcQAhmVDP9ITR0/SvCw+QjuXAmqJifp54hVfQEI8h?=
 =?us-ascii?Q?SXoAWQ8mpAvM3S7Rq6Wt4rS7ZeAX5ggX4STAwuDeOecydXCWqf0d3u8EE8qZ?=
 =?us-ascii?Q?X5Hsrb6mpE4x4TMu1gmRQc37/DycwF9ZJKpiPmr3ziD/P13JVTszjT/5NIGC?=
 =?us-ascii?Q?7ghlFcnMzOUYfwqhNwDCVmT8f0lI/TPsxxkFvH1cOLT6lE02SP2VhK6TGCRb?=
 =?us-ascii?Q?7UnYRYIspb+rBYiZ8T8qhybWj03azmjRW0iajyJLBuRFnZQA+4QDFO+HqpWt?=
 =?us-ascii?Q?4yVOfxwdH2kcpQ1eQBZuvIa7JSzar3zlrcpfdnRH9xX8FITbBCPpvHgMO6wB?=
 =?us-ascii?Q?CFvEF1YZUBdytn6fuNgxwun7itjweVpMpagtCBryc0j2kblSmejIv9PdRtve?=
 =?us-ascii?Q?vf3CZz3f5Z99xASPX4q9zb04iFc6OuzUxQTjagrzDs5BrlhYhNLYw6QRqzkh?=
 =?us-ascii?Q?aUtEJE5Z9rVPa9OLT/u2lQ9Okhgk2AD7VOiI04bI?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e118c3-b925-4ba4-1d1d-08dc57cd7e30
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 13:12:07.8631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfgTno7mxSHPybXZiZ0gkUkvxo51/epKg6e0/BqjWAxDfPFJX56xkayXuFFnyaoa3WOqXVdhIx9DaL3C2BlWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6141
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Althrough old and new sb have the same value for now,
 it would
 be better to build new checkpoint according to new sb. Signed-off-by: Sheng
 Yong <shengyong@oppo.com> --- fsck/resize.c | 7 ++++--- 1 file changed, 4
 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.6 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.6 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rtpK5-000538-Cz
Subject: [f2fs-dev] [PATCH] resize.f2fs: get value from new sb during
 rebuilding cp
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

Althrough old and new sb have the same value for now, it would be better
to build new checkpoint according to new sb.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/resize.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 049ddd3..1b4ae85 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -481,7 +481,7 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
 
 	set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-						2 * get_sb(segs_per_sec));
+						2 * get_newsb(segs_per_sec));
 
 	DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
 	DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
@@ -551,11 +551,12 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
 							cpu_to_le32(crc);
 
 	/* Write a new checkpoint in the other set */
-	new_cp_blk_no = old_cp_blk_no = get_sb(cp_blkaddr);
+	old_cp_blk_no = get_sb(cp_blkaddr);
+	new_cp_blk_no = get_newsb(cp_blkaddr);
 	if (sbi->cur_cp == 2)
 		old_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
 	else
-		new_cp_blk_no += 1 << get_sb(log_blocks_per_seg);
+		new_cp_blk_no += 1 << get_newsb(log_blocks_per_seg);
 
 	/* write first cp */
 	ret = dev_write_block(new_cp, new_cp_blk_no++);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
