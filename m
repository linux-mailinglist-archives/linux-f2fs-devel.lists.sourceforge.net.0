Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0DDA55D67
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 02:59:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqN03-0006IE-M7;
	Fri, 07 Mar 2025 01:59:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tqN02-0006I8-NE
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 01:59:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zJWaFfgZ96ZQ4M0LEXSTVBzOALO1krZgLxb4xALCmrY=; b=O8fp9iVVNL39855Szr59Ssdx25
 0CFTp8KbcVoCriv5ljTCHHUG/CFTCVkaCVR2VQBRNhIKh4/CMVPaIC5M0JmGnmQL1lQFtzINUr98Q
 TO0+WbmJwPy9E0ctALCnPUIkvCM7ANNF/HdJBRYI1UHTcvFUg0c6GoIYn2Lp+ijfSCjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zJWaFfgZ96ZQ4M0LEXSTVBzOALO1krZgLxb4xALCmrY=; b=h
 XO2hFTSi4EDMm6kQKnlvEHzZtPt0LdiiONNHLrJymLQYWEBB32QTZWvwXOe2fgmQqcOfM+kMiImch
 9LF7YIG5oa6A1jKEd5Eqa6m2DF87G63kVD8CVGOtwIfl5nb++szS+wMUs1Zo7EJXBwc5HrwRwFny5
 jr0Mq+r7JSm9xowU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqN01-0002ak-9G for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 01:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7036A453B6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Mar 2025 01:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 912CFC4CEE0;
 Fri,  7 Mar 2025 01:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741312775;
 bh=y1TeRT/xJwOgfkIvXjd1ognWa6hRM/GXzy+JGbaOE6E=;
 h=From:To:Cc:Subject:Date:From;
 b=RpXmXqWP9UWU/QL611ul9JWrYlwsARc4THWNSOMNqQF+Yj3H3LSavfPK/iXpO2qJi
 NdV9/Yx8ZHiJlRjhS512wgLlkOUubzsJPMEooKyueFG8wvWeep9eS4GU0E5IpMd8Dn
 OYiPIpLWMBCqUFt50zeApNmY8atVS0GzUYBWaaL9uSktVdyVK+iiD9a7Mrw1QsVEqz
 mCIvcjM2KkediB8e022chCH6cfSHeDA2SbLko+ClUeYBU0EJjOsxXdFhtIgJtub/vj
 1CSxJGXMcCgSaWg6su2zUoBRNMs+gZ+rEEcIh4YzKK7E9RuTe2p3KWHi01+cH603Mg
 wqAo2/VeWFDFA==
To: jaegeuk@kernel.org
Date: Fri,  7 Mar 2025 09:59:25 +0800
Message-Id: <20250307015925.9077-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch turns off nat_bits feature by default in Android, 
 for other scenario, keep it on and keep an eye on it. Signed-off-by: Chao
 Yu <chao@kernel.org> --- v2: - fix to disable nat_bits feature in fsck tool.
 fsck/main.c | 3 +++ fsck/mount.c | 3 ++- include/f2fs_fs.h | 6 ++++++
 mkfs/f2fs_format.c | 3 ++- mkfs/f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqN01-0002ak-9G
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: disable nat_bits by default in
 Android
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch turns off nat_bits feature by default in Android,
for other scenario, keep it on and keep an eye on it.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to disable nat_bits feature in fsck tool.
 fsck/main.c             | 3 +++
 fsck/mount.c            | 3 ++-
 include/f2fs_fs.h       | 6 ++++++
 mkfs/f2fs_format.c      | 3 ++-
 mkfs/f2fs_format_main.c | 1 +
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 25d50e2..9e0f94e 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -219,6 +219,9 @@ static void __add_fsck_options(void)
 {
 	/* -a */
 	c.auto_fix = 1;
+
+	/* disable nat_bits feature by default */
+	c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
 }
 
 static void add_default_options(void)
diff --git a/fsck/mount.c b/fsck/mount.c
index e493f22..0b05f00 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1713,7 +1713,8 @@ u32 update_nat_bits_flags(struct f2fs_super_block *sb,
 	nat_bits_bytes = get_sb(segment_count_nat) << 5;
 	nat_bits_blocks = F2FS_BYTES_TO_BLK((nat_bits_bytes << 1) + 8 +
 						F2FS_BLKSIZE - 1);
-	if (get_cp(cp_pack_total_block_count) <=
+	if (!(c.disabled_feature & F2FS_FEATURE_NAT_BITS) &&
+			get_cp(cp_pack_total_block_count) <=
 			(1 << get_sb(log_blocks_per_seg)) - nat_bits_blocks)
 		flags |= CP_NAT_BITS_FLAG;
 	else
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 0cb9228..bb40adc 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1471,6 +1471,11 @@ enum {
 
 #define MAX_CACHE_SUMS			8
 
+/* feature list in Android */
+enum {
+	F2FS_FEATURE_NAT_BITS = 0x0001,
+};
+
 struct f2fs_configuration {
 	uint32_t conf_reserved_sections;
 	uint32_t reserved_segments;
@@ -1537,6 +1542,7 @@ struct f2fs_configuration {
 	int large_nat_bitmap;
 	int fix_chksum;			/* fix old cp.chksum position */
 	unsigned int feature;			/* defined features */
+	unsigned int disabled_feature;	/* disabled feature, used for Android only */
 	unsigned int quota_bits;	/* quota bits */
 	time_t fixed_time;
 	int roll_forward;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 6635eed..c28ebb0 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -893,7 +893,8 @@ static int f2fs_write_check_point_pack(void)
 	/* cp page (2), data summaries (1), node summaries (3) */
 	set_cp(cp_pack_total_block_count, 6 + get_sb(cp_payload));
 	flags = CP_UMOUNT_FLAG | CP_COMPACT_SUM_FLAG;
-	if (get_cp(cp_pack_total_block_count) <=
+	if (!(c.disabled_feature & F2FS_FEATURE_NAT_BITS) &&
+			get_cp(cp_pack_total_block_count) <=
 			(1 << get_sb(log_blocks_per_seg)) - nat_bits_blocks)
 		flags |= CP_NAT_BITS_FLAG;
 
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index 9407f5b..5b4569d 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -143,6 +143,7 @@ static void add_default_options(void)
 		force_overwrite = 1;
 		c.wanted_sector_size = F2FS_BLKSIZE;
 		c.root_uid = c.root_gid = 0;
+		c.disabled_feature |= F2FS_FEATURE_NAT_BITS;
 
 		/* RO doesn't need any other features */
 		if (c.feature & F2FS_FEATURE_RO)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
