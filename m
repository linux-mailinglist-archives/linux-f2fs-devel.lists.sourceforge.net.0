Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3AA4FD26
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Mar 2025 12:05:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpmZ7-000819-6u;
	Wed, 05 Mar 2025 11:05:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tpmZ6-000813-47
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 11:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=696eTfI3wzHBFDS8ulpC+SspCgRAhIWnHtJ7HkvI+gE=; b=mJwObgQ0MOWjPb2B8+SPwONxUM
 HlLMXgfgp0kBjMXWiSMoqTriHd+zHesPhV+vWVEO62z+uGqrgXPP4QbE8YbwIfNIFXP5qszrPFHeP
 3PZc23QgN9M4Jq25pOQjadAaeF1M+DNDxXaJ3ImsmrIP25c4piMeBENcvBBVAp1qg6KY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=696eTfI3wzHBFDS8ulpC+SspCgRAhIWnHtJ7HkvI+gE=; b=c
 4bMD0r/0jDTcdEPoLYIG3pHwEagSP9tH1AFya72P9IqYSF/j4k6InuowYicUOBYXdKt1o4r9Phage
 vbud49lm+wwhtggfYrKmY23wjRu2/pgOCAO79WYdOeUm23iwScCPHaDktNlZjHdH0DDqMmxmFPTbo
 LMjm1lPakqr8vVmM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tpmZ4-0000Ys-Qm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Mar 2025 11:05:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 99F605C4BED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  5 Mar 2025 11:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CCBAC4AF09;
 Wed,  5 Mar 2025 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741172721;
 bh=cbnf2Wz08VaaoY4VPV3r2qQqn0Gxg/9gzwltBcOCobA=;
 h=From:To:Cc:Subject:Date:From;
 b=m8C1e4GNyzUgelI2wn1alWkJFohLIZsLgxbMSEQBcmmJLLng3GiL9C5yHaMlDSHmr
 NWQECINZOSYvD9aicpNP+Dxbh3RFnCKdv6Fs+NtVVDE8y8jF9bliUYkQ0/gEAedcW7
 GOdp0GFy7vtmaPf4TJCTbnIrfaXVEEVKjKBZ5+FS+Lynhb7Qy9pF7wLjlRyLl2YZhM
 lHXT6TqAPawlA+l5s3yO/9bKGpXAV2VvkOiCoRMJ++6V7GPu0nAy4czg6VWPjkfZT3
 EwycHJ4MtW3gJA1jpkJuGYJ3NI38k/6GbdxxReAa0SNkzkvPH6vqMqvpRDFHYHXoRW
 LrBQXNNClDF5w==
To: jaegeuk@kernel.org
Date: Wed,  5 Mar 2025 19:05:05 +0800
Message-ID: <20250305110506.2113560-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch turns off nat_bits feature by default in Android, 
 for other scenario, keep it on and keep an eye on it. Signed-off-by: Chao
 Yu <chao@kernel.org> --- fsck/mount.c | 3 ++- include/f2fs_fs.h | 6 ++++++
 mkfs/f2fs_format.c | 3 ++- mkfs/f2fs_format_main.c | 1 + 4 files changed,
 11 insertions(+), 2 deletions(- [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tpmZ4-0000Ys-Qm
Subject: [f2fs-dev] [PATCH] f2fs-tools: disable nat_bits by default in
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
 fsck/mount.c            | 3 ++-
 include/f2fs_fs.h       | 6 ++++++
 mkfs/f2fs_format.c      | 3 ++-
 mkfs/f2fs_format_main.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index a189ba7..2f4c631 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1708,7 +1708,8 @@ u32 update_nat_bits_flags(struct f2fs_super_block *sb,
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
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
