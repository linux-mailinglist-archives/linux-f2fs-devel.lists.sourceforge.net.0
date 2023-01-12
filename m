Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A64667340
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 14:35:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pFxjm-000315-Fy;
	Thu, 12 Jan 2023 13:35:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pFxje-00030s-Jn
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 13:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3N4McwBBwJ0Ldq/+E3XFv5A9Voxj2W4Wxj5SJvVUCxw=; b=i0rkHEZ5+jWfoYQrP9EfYSU0jU
 B2IxF58pZbbndVevAYYMPcTAOYOpJzKp4ge+5s3J2lxu9h7kbTO/OcQaxgh5o4KNYQ5l4gJ3Bu3Mr
 9+YnS1ihO0T+DOJ/lRGlDRvufK+xcsIKQYidXAASI4aTvCNdIo2hK15KZ6BGMS5tdSMY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3N4McwBBwJ0Ldq/+E3XFv5A9Voxj2W4Wxj5SJvVUCxw=; b=c
 puRdesDTvHIrHEwoLX9cOl8FFuQXZ+Rls6OcqJdhJeOKtI7VQzio04ld3vZWyIpplPxvInnFxBVjk
 jPU/Z7fBw3SLug+xFTbGM8zpsaMbXnDNkcz6sSDn0/rSPfyk6LjkieHMse1bVbJI+dDOahPp8wBub
 K5SHysxy5i6QhWTY=;
Received: from mail-tyzapc01on2106.outbound.protection.outlook.com
 ([40.107.117.106] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pFxja-0007IG-EW for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 13:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KvN1nBL+dp4hTSC5Vnvv/ZRDGBs6TtWZYS5jWo2P2Qod4IqXXmgxNeYY7UAhA7ZA02Sp1tcECglEVyivFDIxzRJv8ACSrAdUYlrbToEOjr/JPV1lDrj3ewWn6o66hZtb1/d5195i0C6nK/FqfTaqsL0KVOPemWgfMrNQVoDdnwum5K1p1VAPczyZw/VQz68RmAlDmTbruu2iiIgAnH7MLzys9nX9Bhq4N6bqRHWG8Nfpgfl04Zmc0tiV3ftNG88OhfAMYOST472HDfClUobO82tUdO2eivpundgMfY6ZtZzvHA6AP8JY2l82Ks0wQoF6BMnr5y+kzeGsv2Wt6rFdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3N4McwBBwJ0Ldq/+E3XFv5A9Voxj2W4Wxj5SJvVUCxw=;
 b=ZULkDeR5qOJHTlC6d9hdW/zs1lABqVZ3yLillmerl/zr0lRmeUfcRLQ/CR0ERTv7kt3h3DcJmrxNuQ8Iz2AIOXPkqz5FRngVbS+hUGrBdeoFTs6eqmSkPEjEfduE4b4rf+Q5+W4sYg32zU+s5NrYLXoHKm2pnumHKYjiIIe5PR/kmlBlM55Vx8mY1Y7hbiPeBzbF3PrDn7Ys1qcvYAhc3ZxVpo9H76L9peiPB0fpsun/c1KJqxRfwv0evZHeR4gOm7XzvCBFCZYLFS5VDlxhu7huBfgHegCl07t6zBmkOeWHAXk1qSQT52N8zyv6eiHAPmqcSSqOelwzw4+1Jc8L0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3N4McwBBwJ0Ldq/+E3XFv5A9Voxj2W4Wxj5SJvVUCxw=;
 b=lYycNaoo460Z1eixrgdlHrlkyZqMsuTyNngOkc7q00ilAUrRgryERMJpz0qTMYRuH4bN3Hxh0SlMraDRu5DV4ElTsvbSF9mX2tJxIvKAbCiKTYIPeyw9w00ScR3XfZqL3oSo0blWDJEJm57bpOBL4giuyBrP/vka7cIdt3GCl49ooEGYBxmDi9Vn+O/rdEAqbS6Psz3NebSXrI8Samx9PL6g1fbJ0EtKjEvKGFKQ/byxCuZJJQ14Q717BTRYui7AReJ128aSSzkXNngGn73aBuVwSJsh3iAbXsbsCKnpSsqmZ4iV+Oji6OwYzcH94wqZeJpOIFgbMFmVmFSGSp4POg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5072.apcprd06.prod.outlook.com (2603:1096:101:38::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 12 Jan
 2023 13:34:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 13:34:57 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 12 Jan 2023 21:34:43 +0800
Message-Id: <20230112133443.16713-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5072:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bb7626b-d84e-4f6c-50e1-08daf4a1cbba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ck69Y/AaFtOjv3GRmblzQpZZmQpKlmn1ofr947F+WDyfnQYUmQ0DOeavRZAc2AOMtVin5BZmLsGKvYQhV1JRJHoRQNBLHKFs9hyBvdNw5YOhGXYFnj0SkF1rvxR1aeoo+X9V3eeDrQgYkhX6Djm4PZw2kzmghECDrND6z8K7gm2g9lGL4dHTgpsx6JJayF827Ei0YqivXxOnrK+Xm7kSlEzdqf0pAvTJuuPjUd4FtqSg50pxj7/apZOZQJNxOzg/YFnmV2D6DCbtKjB78x1rhevumAviuJhEqPx2qGuJakbNIF2In7NMuwNr5iYX8K+1izjodNZE2yW5Vy7kUHtewkAikLmEt1v6hbvHxzufAzDrDf/3CF0B0vFZzL7gKPo08IJQpYAO8JTfEALa4GuXFuymONFp04aIZ9fHmgp8gxsExq/OGXIg9RV3pN6UQz7To4jvnTBDNrq5KrZxdZG8FO5qhHC6gl+WfeHgUFfwwlDl/htVh6ejmYq271QYKYBAbinZdBDbQ6greNlQZ9kWPHzPBWBHCrrk56SBga9PtuiKTUksZlKHudMIh1MEv6Bi+ZKCqGc/nTRqFdEFzInw1WNKpHpCn+j7yd+p0K4hrVhwQytPnDIdEes/qp01U3dZo833izAj3ySABXujNaNj3PendxV9VUCU8TnApXlz/v6VPLSXXNZlxWFL0W27cH3p+nV7jannCagdshpn+J00CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199015)(107886003)(6666004)(478600001)(6506007)(6486002)(86362001)(2616005)(38100700002)(6512007)(186003)(52116002)(38350700002)(36756003)(83380400001)(26005)(1076003)(66946007)(8676002)(8936002)(66476007)(4326008)(66556008)(5660300002)(316002)(41300700001)(4744005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4gS8VeUaxomS43b7xGK7DKBgm1WYmumFXdaZQ/ynaZ7KpON8ZiVGDMywo53b?=
 =?us-ascii?Q?E45Cg1aJXrq7vyNWz2yNhI+PyB/8MpfSo3fY1rmJSphdt2cTXqWCme24hQTt?=
 =?us-ascii?Q?FNzElBnK03svavEw5j5E9onqt9XYYsomOvSyGNcvFZ16UhjPLxFcngtNqVeZ?=
 =?us-ascii?Q?3og5otQgKiOnPWvetiHRHguZRaSGbU4eEpEZR8HuBM6+KBE1NZE+CNZrTrhN?=
 =?us-ascii?Q?RgePBcE98GPkpgb2199lNBJ78k7B8PeKBs0JEXBAwrOQMY5BEKDhRQnFbfDP?=
 =?us-ascii?Q?0Q0IxFUBa5iEYmFwXykS0voBzjA1ygKMzgd6u3I/0NmFK1fNsqstpkJSIffm?=
 =?us-ascii?Q?BVnJJU/fVr4IKh1NdJvy/Urolw9HQ0smuJNHyGlDagxlGC70+AKjBPmjbvFu?=
 =?us-ascii?Q?QAuUwUAinmFiDyIMSV3WyrTqmwXdigB7EASNwTrAmhqsfSKG3z+1gBErjxH+?=
 =?us-ascii?Q?x24aYgd/lqYkop06sJUzyOV4waaAOh6nkJSvQdYPC0cGm0leIA7Xzz321gDV?=
 =?us-ascii?Q?yFRKjkdeAKKvXUNTWi23X2zmvf91NDnQn2aFqcVmkwEjaDCSDCKaCQvdVi1J?=
 =?us-ascii?Q?otco3h2R/qmkRUZ/AoXQNuN7pvdRvomLLklc4n0k5GBHBuuxuLQiBRezepRW?=
 =?us-ascii?Q?my1hRnHJdGX+ovhIwAoDUISYKaCWedMlCQS6Vddn8VAbu78H503zK+2/F+Wd?=
 =?us-ascii?Q?yAyj7EcfsRMiz9Om45vFuDLBirf7InQ+puMU4FZI3/G9ZoOVZtb+Ik9oC1C0?=
 =?us-ascii?Q?oobkiYWOwCbIahPy9P6I0+g9jinujMAy0ZIiTZ1HmPWuGQ4zAKDctMMtrVx1?=
 =?us-ascii?Q?9Ib7kRVfPNhpAaMU/ZO8alN6C9NavPUF1BUYGBlb1YWMYSN20x/ga/sEfu/M?=
 =?us-ascii?Q?JNQE3bGz11HDjS7KMpxJyR/gCZQAe0OmWD6gmCbjA71jfmNg4uTyIDILI3L8?=
 =?us-ascii?Q?zHQQZ/dxuX0N50qALCq7R/PsoVRjwM+bQTQxCFm8hXN/LsAwM7b2h4Lma8Oj?=
 =?us-ascii?Q?KXLQPUzppeJ02XFkEceuyuWPUQ05cewogVM60Xqx/JNB1/AgR4YG8RjNlbTR?=
 =?us-ascii?Q?MGJdE4oPC642/ZhJBw4DjHHpDaGwRcDvoEpx1xEmeQQ7pGjiwXJUS1vhnV+X?=
 =?us-ascii?Q?o2COEsxgEJJLK71c+mAZ68PPvlU1c+m13RyY27PMGR4Z0NmQkw/VgROCFmbx?=
 =?us-ascii?Q?aQ+nJDuYF8Ew2lql51VpuSiP9MjLDQn+x3pLeNQJhZzWuvSc0bRT1mSFJOo4?=
 =?us-ascii?Q?Hlk8MdRjIz5dX16/foTIP8lD8qQcifWaT8f//YbWw5MlKOtMP64Lg6JPgqTT?=
 =?us-ascii?Q?FrExFcDghAyRMfuzXsoE5KTPZpchzH8jAPfujgXXJGoN/RnPUNzk5ZlK3l5E?=
 =?us-ascii?Q?8X7vXD7XhyKjYOE6qFHAGE+a1rJbsT9u63wBbzkAsGt64oN3HENR8/Rc8ItD?=
 =?us-ascii?Q?eGLmMufuwM/YH8Gj7yx+FFRFuMdFNgHSEiWOTsGQEha5yK+gINRBmLiQo+ZF?=
 =?us-ascii?Q?I1sTqQ4m1wGN4V1tGi9F7GIxnCWIc7atbd96uGqdjVW0wPilvPaUwJ2Axh9G?=
 =?us-ascii?Q?jjWxCq4C+N9rF7W9If35MXIX3Ldl6B1W4oIcHurN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb7626b-d84e-4f6c-50e1-08daf4a1cbba
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 13:34:57.3587 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPsJbmsM8YOnS46uJ8CYs58XJnectd30NnljRCUWcuSodbgI5nmmxZAD/slvVec6lFzUOe/lap98/go96r/x5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5072
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: commit 3fde13f817e2 ("f2fs: compress: support compress
 level")
 introduce compress level, which macro(COMPRESS_LEVEL_OFFSET) is 8, But use
 wrong comment about compress level. Let's fix it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- include/linux/f2fs_fs.h | 2 +- 1 file changed,
 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.106 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.106 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pFxja-0007IG-EW
Subject: [f2fs-dev] [PATCH 1/3] f2fs: clarify compress level bit offset
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

commit 3fde13f817e2 ("f2fs: compress: support compress level") introduce
compress level, which macro(COMPRESS_LEVEL_OFFSET) is 8, But use wrong
comment about compress level.

Let's fix it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 include/linux/f2fs_fs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index ee0d75d9a302..1701f25117ea 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -315,7 +315,7 @@ struct f2fs_inode {
 			__u8 i_log_cluster_size;	/* log of cluster size */
 			__le16 i_compress_flag;		/* compress flag */
 						/* 0 bit: chksum flag
-						 * [10,15] bits: compress level
+						 * [8,15] bits: compress level
 						 */
 			__le32 i_extra_end[0];	/* for attribute size calculation */
 		} __packed;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
