Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE6B48DE1C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jan 2022 20:29:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n85lx-00035N-8y; Thu, 13 Jan 2022 19:28:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1n85lw-00035H-04
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jan 2022 19:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BXi3n6OqhYTvfGJ9A2fzGKpq1T3hlEZIAbF9ey02t08=; b=T5FZ21MXldixPGSZpB396wgPeV
 3uRC1C5kJXlrMoGL9xqgf/tlKepiwviL7Y9hKgziKM+Tdi9d30ZDhWN9weHy5TztuceFiW3FxXTyr
 gpWx2kYkjQ69HYs3ILswfjdl9yFrpZQD1RwGcxq2H2LZDpEvt9TAbN7jWr6VSGRVY2pU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BXi3n6OqhYTvfGJ9A2fzGKpq1T3hlEZIAbF9ey02t08=; b=Z
 Ga2T5zCVtOyKoCUXZpDyrSKkV4TpWp2nEE4wbrRnov7GeUGUJwK4uTqRvjlm651uo+9MjtXRNa2nf
 YPIpseE3RJ8YEiI5C6Ky/KJmrYZ4SV/F5fyfTQKn0UCBAOGptepdvT5Jk8twb0Rf5960y3pOmV4BJ
 /VAeeCSLYgP3veEI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n85mD-00Enhu-UW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jan 2022 19:28:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9045761D9A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Jan 2022 19:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89E7C36AEB;
 Thu, 13 Jan 2022 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642102118;
 bh=KPyKy052zfCgGwXwuvlHkjSisiw26g7A3bod1FJVeSE=;
 h=From:To:Cc:Subject:Date:From;
 b=jpI7pZriUOBgKJj+h9HwHJWGtgX4801IPOBVTUnXgk/Vg8/2fftaQCKH9PUZO87OO
 TG9NL6ZD3krIVTSkZcld7+PLNOaDoBAkTxqQbN8QQDvam1r7FhNBgeYXnXQcwQL5Gg
 3/Nnwv/b7ZG6g1n7kI6DbQ9X83tOAg4t7CSAkL/ngVnLfcKib48PKvCJJXKlXJZTha
 +TMjR/P9a89sh7urh+KXdrcjg9RG2TWM5klpCsmv21a3kXsOCVWAE5d0eqVtXIDhLu
 OKPO9gyo7G04TxhY8WY2PU/+DS55CUr+yICxXc+JLO2II1/8zK9t8m6vjpy22A9sei
 DIVCxGBV0eoKA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 13 Jan 2022 11:28:36 -0800
Message-Id: <20220113192836.636616-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch modifies enabling quota options in which enables
 user/group quotas only if user specifies the "-O quota" especially. 1) -O
 quota : enables usr/grp 2) -O project_quota -O extra_attr : enabled prj 3)
 -O quota -O project_quota -O extra_attr : enables usr/grp/proj 4) -g android
 : enables usr/grp 5) -g android -O project [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n85mD-00Enhu-UW
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: set required quota types only
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch modifies enabling quota options in which enables user/group quotas
only if user specifies the "-O quota" especially.

1) -O quota : enables usr/grp
2) -O project_quota -O extra_attr : enabled prj
3) -O quota -O project_quota -O extra_attr : enables usr/grp/proj
4) -g android : enables usr/grp
5) -g android -O project_quota -O extra_attr : enables usr/grp/proj

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/f2fs_fs.h       |  1 +
 mkfs/f2fs_format.c      | 37 ++++++++++++++-----------------------
 mkfs/f2fs_format_main.c |  9 +++++++++
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 9f918ba8f750..d236437475f5 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -504,6 +504,7 @@ struct f2fs_configuration {
 	int large_nat_bitmap;
 	int fix_chksum;			/* fix old cp.chksum position */
 	__le32 feature;			/* defined features */
+	unsigned int quota_bits;	/* quota bits */
 	time_t fixed_time;
 
 	/* mkfs parameters */
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index d6a92f800513..864d2851bd6a 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -38,8 +38,6 @@ struct f2fs_checkpoint *cp;
 /* Return time fixed by the user or current time by default */
 #define mkfs_time ((c.fixed_time == -1) ? time(NULL) : c.fixed_time)
 
-static unsigned int quotatype_bits = 0;
-
 const char *media_ext_lists[] = {
 	/* common prefix */
 	"mp", // Covers mp3, mp4, mpeg, mpg
@@ -513,14 +511,8 @@ static int f2fs_prepare_super_block(void)
 	set_sb(root_ino, 3);
 	c.next_free_nid = 4;
 
-	if (c.feature & cpu_to_le32(F2FS_FEATURE_QUOTA_INO)) {
-		quotatype_bits = QUOTA_USR_BIT | QUOTA_GRP_BIT;
-		if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA))
-			quotatype_bits |= QUOTA_PRJ_BIT;
-	}
-
 	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (!((1 << qtype) & quotatype_bits))
+		if (!((1 << qtype) & c.quota_bits))
 			continue;
 		sb->qf_ino[qtype] = cpu_to_le32(c.next_free_nid++);
 		MSG(0, "Info: add quota type = %u => %u\n",
@@ -867,7 +859,7 @@ static int f2fs_write_check_point_pack(void)
 			get_cp(cur_node_segno[0]) * c.blks_per_seg);
 
 	for (qtype = 0, i = 1; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (sb->qf_ino[qtype] == 0)
+		if (!((1 << qtype) & c.quota_bits))
 			continue;
 		journal->nat_j.entries[i].nid = sb->qf_ino[qtype];
 		journal->nat_j.entries[i].ne.version = 0;
@@ -958,10 +950,11 @@ static int f2fs_write_check_point_pack(void)
 
 	off = 1;
 	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (sb->qf_ino[qtype] == 0)
-			continue;
 		int j;
 
+		if (!((1 << qtype) & c.quota_bits))
+			continue;
+
 		for (j = 0; j < QUOTA_DATA(qtype); j++) {
 			(sum_entry + off + j)->nid = sb->qf_ino[qtype];
 			(sum_entry + off + j)->ofs_in_node = cpu_to_le16(j);
@@ -992,7 +985,7 @@ static int f2fs_write_check_point_pack(void)
 	sum->entries[0].nid = sb->root_ino;
 	sum->entries[0].ofs_in_node = 0;
 	for (qtype = i = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (sb->qf_ino[qtype] == 0)
+		if (!((1 << qtype) & c.quota_bits))
 			continue;
 		sum->entries[1 + i].nid = sb->qf_ino[qtype];
 		sum->entries[1 + i].ofs_in_node = 0;
@@ -1360,7 +1353,7 @@ static int f2fs_write_default_quota(int qtype, unsigned int blkaddr,
 	return 0;
 }
 
-static int f2fs_write_qf_inode(int qtype)
+static int f2fs_write_qf_inode(int qtype, int offset)
 {
 	struct f2fs_node *raw_node = NULL;
 	u_int64_t data_blk_nor;
@@ -1382,11 +1375,9 @@ static int f2fs_write_qf_inode(int qtype)
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA(qtype));
 
 	data_blk_nor = get_sb(main_blkaddr) +
-		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1;
+		c.cur_seg[CURSEG_HOT_DATA] * c.blks_per_seg + 1
+		+ offset * QUOTA_DATA(i);
 
-	for (i = 0; i < qtype; i++)
-		if (sb->qf_ino[i])
-			data_blk_nor += QUOTA_DATA(i);
 	if (qtype == 0)
 		raw_id = raw_node->i.i_uid;
 	else if (qtype == 1)
@@ -1408,7 +1399,7 @@ static int f2fs_write_qf_inode(int qtype)
 
 	main_area_node_seg_blk_offset = get_sb(main_blkaddr);
 	main_area_node_seg_blk_offset += c.cur_seg[CURSEG_HOT_NODE] *
-					c.blks_per_seg + qtype + 1;
+					c.blks_per_seg + offset + 1;
 
 	DBG(1, "\tWriting quota inode (hot node), %x %x %x at offset 0x%08"PRIu64"\n",
 			get_sb(main_blkaddr),
@@ -1440,7 +1431,7 @@ static int f2fs_update_nat_root(void)
 
 	/* update quota */
 	for (qtype = i = 0; qtype < F2FS_MAX_QUOTAS; qtype++) {
-		if (sb->qf_ino[qtype] == 0)
+		if (!((1 << qtype) & c.quota_bits))
 			continue;
 		nat_blk->entries[sb->qf_ino[qtype]].block_addr =
 				cpu_to_le32(get_sb(main_blkaddr) +
@@ -1678,7 +1669,7 @@ static int f2fs_add_default_dentry_root(void)
 static int f2fs_create_root_dir(void)
 {
 	enum quota_type qtype;
-	int err = 0;
+	int err = 0, i = 0;
 
 	err = f2fs_write_root_inode();
 	if (err < 0) {
@@ -1687,9 +1678,9 @@ static int f2fs_create_root_dir(void)
 	}
 
 	for (qtype = 0; qtype < F2FS_MAX_QUOTAS; qtype++)  {
-		if (sb->qf_ino[qtype] == 0)
+		if (!((1 << qtype) & c.quota_bits))
 			continue;
-		err = f2fs_write_qf_inode(qtype);
+		err = f2fs_write_qf_inode(qtype, i++);
 		if (err < 0) {
 			MSG(1, "\tError: Failed to write quota inode!!!\n");
 			goto exit;
diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index b89efe691a49..8d4dbe1a28b1 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -28,6 +28,7 @@
 #endif
 
 #include "f2fs_fs.h"
+#include "quota.h"
 #include "f2fs_format_utils.h"
 
 #ifdef WITH_ANDROID
@@ -127,9 +128,17 @@ static void add_default_options(void)
 	c.feature |= cpu_to_le32(F2FS_FEATURE_CASEFOLD);
 #endif
 #ifdef CONF_PROJID
+	c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
 	c.feature |= cpu_to_le32(F2FS_FEATURE_PRJQUOTA);
 	c.feature |= cpu_to_le32(F2FS_FEATURE_EXTRA_ATTR);
 #endif
+
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_QUOTA_INO))
+		c.quota_bits = QUOTA_USR_BIT | QUOTA_GRP_BIT;
+	if (c.feature & cpu_to_le32(F2FS_FEATURE_PRJQUOTA)) {
+		c.feature |= cpu_to_le32(F2FS_FEATURE_QUOTA_INO);
+		c.quota_bits |= QUOTA_PRJ_BIT;
+	}
 }
 
 static void f2fs_parse_options(int argc, char *argv[])
-- 
2.34.1.703.g22d0c6ccf7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
