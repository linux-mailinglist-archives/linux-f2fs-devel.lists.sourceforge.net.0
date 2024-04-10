Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 885B289F277
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 14:39:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruXER-0005vy-N7;
	Wed, 10 Apr 2024 12:39:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ruXER-0005vr-0s
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 12:39:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uebJnwGPMFuzJkWdsTeZ6spREWfXShLiiPg/TwV8BHk=; b=Dv9N1bHKrmHkB04qI0L4mDHAZZ
 1gIYU1f2Ej8+GVpZuftyrNI74NCCcgP4tk6c/h6iF/DUh0d5QeUG4xm4Z6gW4jCG1HxAPsOsK+X4g
 FZCOSBwIP1IMJnVlC1ZrKk/7oYoZoTSvGRNb7Ii0eOsgBsP8za/aN0eAjWrLxvglFe6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uebJnwGPMFuzJkWdsTeZ6spREWfXShLiiPg/TwV8BHk=; b=k
 pC5QS3YBXjcMNTiLxZJM0X+907PTM/g1iMdIOg4bbXfoD3MP4kBmI3s2r1SdmI6grYKPtKe305t4Z
 /vrNDTM2zvQpXALuMiZIkDMjoqrneuTpMmUauGnySdc7mp5rwIWcEqaPtO/c9XtcnarV54pVLIT72
 QQMa6BG4OGepxDnk=;
Received: from mail-tyzapc01on2135.outbound.protection.outlook.com
 ([40.107.117.135] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ruXEP-0002P3-Ve for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Apr 2024 12:39:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xc2JW/6hkb5kkJxUOGPspcrEfGNChCmdCrMq74p/ehRvTCF1vWIxFfmFGpSzpeAZfP8N3qQBLdEKmKFID243w6CtlDb7o2Edwa79ybM/SkweboOYF8KAU/Eyh+TUF2N+jFWJukuHKd2vh4gE77Xyb/+wvR6qF09eaS//1QlPGtJVaITLi4t++X7F0V3bgQbwzFciKrplvN36oI7QE7U8rf85Ma/ZQAXbV+ihjGE14MfQKUmL+eKmaItQCDqMWydfiCp25hcq9Wp+nb8fiAAhKQuZT8IziNEavcKUhkX3rA8KfDo9kNOgki1AMFyPUOyl2aEUzzx6AmmL2eVbSlPLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uebJnwGPMFuzJkWdsTeZ6spREWfXShLiiPg/TwV8BHk=;
 b=Hw2zb2OXFgK2GC3FVmcT/NTnGxfGZJCS+hH3/hou6JKlF3Xk/NR7BHmQ58F0uD0WjigmFNNIUiA6d/uDljB0EIwh0G3ewvw4MsGiw+vcnd6RreKmvUnxrMacOZQjyFLTTdrMCNFrZLPUjViCKxNI4d7y9krzPfXlAFhoUWXM7X/uMPDtOnCZ6TOXs5eImJox32+aDbm3EQz/riXmu1LnmP0dxlAvnkx27s9gJ1Tg/rA2q8Gb8PMR1RsLyZzYAQlcKJ4se1OwwprDJNTuLBRbWGS9dS5bG6ZdzhkNQgKbE/WQgP54Zh8X1psTufWxgibsGUv5e2zw05fBbWAeQcANdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uebJnwGPMFuzJkWdsTeZ6spREWfXShLiiPg/TwV8BHk=;
 b=UMc4bxdI8tF6ELwKpLYiUoTKZuaRgWW1lD2DwbtkiTxzg2zgMYPatx+8muTAiTUAYQcdoQwtin2ilpt+x2PdjAlUPPBor4OU2igWynnuGUFSTr7dHIjlpIjHwgbKvD3fFUysgtekZK9z8XOB+ve4ZPwpxCHezUxQxUXtG9FAL7A=
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6882.apcprd02.prod.outlook.com (2603:1096:405:29::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 12:39:05 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc%4]) with mapi id 15.20.7409.042; Wed, 10 Apr 2024
 12:39:05 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 10 Apr 2024 20:38:48 +0800
Message-Id: <20240410123848.1291821-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6882:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGFmJ51ubQ7CKstPfnfMYi1Prdr9ye2Y+iPSOXMYIQpd9UoutkWDbC3jFF4HDmh62vgjON6CLpIOBXuWkYR9VadWoq4/Pa3fLzjg7Ra2XH6zANdF+fbqLEdGML3wlOLPA4KNkoQ5k1kQSTC9XfulcM4MGIWtl9vpqxIAXXO0R2dPTjhMAlxevBnYUSWiSySFP7fjS5n5EADLEoeRmI4XzQrbzzxkAZHU1uDScaivQbdOViWRhZBOynf0HcaZRi9mGvDDuR7GTYoB3V9aqaqOqWl53xIJr+nX4woiOHnhRyCJByC70eUYsA0xg6IAGnUTc2SqnpdMIamElg2Q+AYQcFzUk0c89ImYSiCOhXHxhP+kF1KzKqVTsJYlnHNtKzL1/NjlmIgNGtQh171xnk+iXCVMCOF0SAiCU/E3gq+4ttC2NgxuqFnkcNt4TYAWr81k4LYp1wYedP0LA7JJHqauhfvXLz3fkZ4zWyyUGF9laOxqQNQy61LuNCiKPT7sRgWcs9Ni6gQeQT6gtUrsAhgJjnKfTkR/zF5fEVSR7RD2oZK3blkDRpO04QclegSwlacAib2eQuZGAeCsJwEjU8lZLL/29Stmv7fPEHViqB0WY3phwJVlmEd5rsFgfencxe/IagltRvKSjt21V5R6HWtnhoTw1JjWpdIkeOPjhCOxNAeV4KAe33DWmiaFqtvwfw515lhCXsoAazHzUvckO/9jlw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(52116005)(1800799015)(376005)(366007)(38350700005); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?utNwIwiSJwwhDji/rsznXhCDPSdvC/2J9gmWmbyfaVcecLB0Tzvm0kcLOLRr?=
 =?us-ascii?Q?REF4z9Rz2wwt/VIASF3C8+XeQaMJkUanhKF/7L4eQfhbIOq/C74RCy9vwZ1o?=
 =?us-ascii?Q?d1F86pd392ZJ51TXpeRShNwO5TSqUeLoAZhx6yAqGafExnDluFENR+q3A0vD?=
 =?us-ascii?Q?JPkgvSfWJbx4CSqpCZAQl4kEFO38h7/dNmOiSAXX2S+E2ek40lLFYTtNqGXC?=
 =?us-ascii?Q?qSSI1qDNlQNzVClsvqBet0h2ZwrP57lr0CHSwDWdqllx4KoUCFMc8I2CMSoO?=
 =?us-ascii?Q?NWyvYRlT4ROj/8NLNUdfx2xTiVxdRb24JRg/2CaAygb3aHrfbZleldef91vB?=
 =?us-ascii?Q?uprMbCIXMQAbwXwyG1Jkdy8jdXwcovCRqewqozetswu6zwvmLit/Yv7ekECZ?=
 =?us-ascii?Q?47rRqDcdqxp/2BsxX3AOzOMboMpgGDuIIjgvhkN3D8ermsAGr0vpGV+5QZ8y?=
 =?us-ascii?Q?jUOBRfXH8dvisi5IODJD53iA9lAskacwBd+HV4OpK6m66l7hwGe+65TeJsZW?=
 =?us-ascii?Q?CYsiu+QCWs6AAS0cdf1AumPzmW+HfzcsdPXpdKk30cYua+oImnt7Y3hupMV4?=
 =?us-ascii?Q?fxNCHEg/L8b3tvmo3pv4uSOFI2WH90EhurN64bP+ebnRK5Jb4hwyxbJBC9s1?=
 =?us-ascii?Q?RFW+zSefRRWtqCZ9sBgPr/D80lwz98wmjaMFC56znEkDNcUCyxi9YJjcB15P?=
 =?us-ascii?Q?nSOeNxe3FQoCuoVK94TILFe3ngcCwHbI+aWnramvkJPqYIwBNm566oDaUCUM?=
 =?us-ascii?Q?hX8AseIK9F/d3Rx9luGh+t0FG2al7vhT1u0Th7EI8FzY8j7NOmJyJs40rFwU?=
 =?us-ascii?Q?RJNOSqEZGH15d03lgUF97P9pvrfhqIY0MoCS2A4WLi5lDFBp8kGKUMrj9tvF?=
 =?us-ascii?Q?yHNEmfv++6NuLO7MjuKPnUgLMXAxnKGZ3Y6XeH4GQnhK5b6NyBmKFNfiGW+y?=
 =?us-ascii?Q?pbjkj+gDb6U1+H3g6v2/lb9WR9nx1Ljls8qN1jZFhYFO8rf+cH52PtzmSRF1?=
 =?us-ascii?Q?K8qQLOqDZBDnmtPK4PqbIV2RNJ5VZrVjEJ6Kd7lGu6hCYiglj06A9nUT6WSb?=
 =?us-ascii?Q?p2AfumrmyLvgS8WbKp5ORfWok88HS6q7j5yJouHDw5dMdUQgdKN9ryUoymm1?=
 =?us-ascii?Q?MM9n2ATEQ0/PTueZUQ+wsQitDXFrN+pHl8bSVZtC16gKBCRKvCWV/+0E1pOo?=
 =?us-ascii?Q?C9SnxGxkkbWiXX6pR323X55fj3PxoFoJl5aY0wy91KKpRdN63iLTHXa5B8VL?=
 =?us-ascii?Q?WP1REQbG2wmP61Mtgl/sNRjyGNl6BztN8QYdFOZSmXtmNxCwkldoRAZit+ry?=
 =?us-ascii?Q?AFhFVKnzGkx1nNUo5pKYMB8CSJV2vE14vqnnejiEMe9tKEcy31xU07SR9mFd?=
 =?us-ascii?Q?phZl7yFPZ5N+KeRQpW12AG1ueHQAZGMI9suHY7glz4xSeJTQk1iTDJHX/1qV?=
 =?us-ascii?Q?N/ZLU5ihGByAWyYnxax/O7y4FjFPt5tkmlwo6r00oOGQZJXrTHN76seJYVm9?=
 =?us-ascii?Q?26PVhmkSR67FarBWgO1qzpMNM3LsYRPwN837k29l098zYVUI7Gho5VMGbFWr?=
 =?us-ascii?Q?2Uo2yEZv/Fkvz9KYshYtK5XGy1e7XzYSHLkW3dtq?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7265a883-3554-4aaa-df6a-08dc595b352b
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 12:39:05.0508 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gk50CO9Dz0fhiV+Inf1KO3A8cY8fN8AbkTmg8gdmHrnzYs2xPQEawr45SIXwgLuo9KDp0kd+BxCaCkQRn36RIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6882
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For multiple device, each device should be aligned to zone
 size,
 instead of aligning the total size. Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 --- mkfs/f2fs_format.c | 13 +++++++------ 1 file changed, 7 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.135 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.135 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ruXEP-0002P3-Ve
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: align each device to zone size
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

For multiple device, each device should be aligned to zone size, instead
of aligning the total size.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 mkfs/f2fs_format.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 8f632f8..9e1b0d6 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -296,17 +296,19 @@ static int f2fs_prepare_super_block(void)
 	for (i = 0; i < c.ndevs; i++) {
 		if (i == 0) {
 			c.devices[i].total_segments =
-				(c.devices[i].total_sectors *
+				((c.devices[i].total_sectors *
 				c.sector_size - zone_align_start_offset) /
-				segment_size_bytes;
+				segment_size_bytes) / c.segs_per_zone *
+				c.segs_per_zone;
 			c.devices[i].start_blkaddr = 0;
 			c.devices[i].end_blkaddr = c.devices[i].total_segments *
 						c.blks_per_seg - 1 +
 						sb->segment0_blkaddr;
 		} else {
 			c.devices[i].total_segments =
-				c.devices[i].total_sectors /
-				(c.sectors_per_blk * c.blks_per_seg);
+				(c.devices[i].total_sectors /
+				(c.sectors_per_blk * c.blks_per_seg)) /
+				c.segs_per_zone * c.segs_per_zone;
 			c.devices[i].start_blkaddr =
 					c.devices[i - 1].end_blkaddr + 1;
 			c.devices[i].end_blkaddr = c.devices[i].start_blkaddr +
@@ -321,8 +323,7 @@ static int f2fs_prepare_super_block(void)
 
 		c.total_segments += c.devices[i].total_segments;
 	}
-	set_sb(segment_count, (c.total_segments / c.segs_per_zone *
-						c.segs_per_zone));
+	set_sb(segment_count, c.total_segments);
 	set_sb(segment_count_ckpt, F2FS_NUMBER_OF_CHECKPOINT_PACK);
 
 	set_sb(sit_blkaddr, get_sb(segment0_blkaddr) +
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
