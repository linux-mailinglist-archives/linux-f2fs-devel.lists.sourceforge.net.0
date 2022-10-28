Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE8611874
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 18:58:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooSgr-0006iW-J7;
	Fri, 28 Oct 2022 16:58:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ooSgq-0006iP-Ad
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 16:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kiZjkYC7/X66XR0VnUGYfMhfUN3EGcK8u6bL3q8ME8c=; b=cA19d1dHVoJJqzi/8MF7+GIjNo
 Wd3JHQlYv1/Nu08KgifwRe3Qs6IDFcoJdovOxG7tb7y7theph5UkmxG8gryHhU9AH5lsQIclRLQip
 K+p7SaivFZHyjPbypPpoyUX30/JZtWGqTxMpNiz6Xqynva/admDGDwf+deEQl8uDiCkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kiZjkYC7/X66XR0VnUGYfMhfUN3EGcK8u6bL3q8ME8c=; b=F
 II4By7VkGRzlge1qjVNqueSZiP53K0TpKDBII9wbmOqN9q4/kyYdlaUeFGv74CxyXsNk0U9xsrtwF
 cOAuy7e9tElZbR4FEtm/AGiW2IJvz6/PAxJeS6HcRWOa/0SzD+atIioDknTDc2Qv83ixYooRaZ5yn
 Ts9jtAD+8hx2Dt6g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooSgp-003dpr-IM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 16:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D4CE6297C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 28 Oct 2022 16:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C77C433D6;
 Fri, 28 Oct 2022 16:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666976308;
 bh=NB0C0XzePklNj5LqvcpaBIGZcLpM/zxQPQkwfYE8xes=;
 h=From:To:Cc:Subject:Date:From;
 b=AkIgq6yW2OlEt6AJS7pE04e2O5YRC47NvexFUTDp0DIrugH9DjiNky5t6paHsWK+b
 P1zeRA25HRW5Eb/rJ04l4DFcVgiTTv/3/FQWGqwqBfpCl9UhJfFiZpI02UOOqc3zHN
 Uj4IHScoG28OvoC0va1fHxA/9mQeSPj+vPkN7XxFJryHVn984NHX7rIkpnBVHNgkWf
 v+N3NyYgUbJi7uVmhHSAJB7wzKLVexE4IBiUirgdXMLZLdlF3gwjUYLEAFkpCIVcGH
 GdrLDZ5X2OKj2dfXyAIQOFgaY8ncfouX6/ZmCFwcepQN/c0DCWCj/UPNug+GHayo7r
 3O4tCklE68JGg==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 28 Oct 2022 09:58:27 -0700
Message-Id: <20221028165827.11558-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's use sysfs_emit. Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 --- fs/f2fs/sysfs.c | 36 ++++++++++++++++++ 1 file changed, 18 insertions(+), 
 18 deletions(-) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c index
 66c88220d319..aaf93bb6c64d
 100644 --- a/fs/f2fs/sysfs.c +++ b/fs/f2fs/sysfs.c @@ -95, 28 +95, 28 @@ static
 unsigned char *__struct_ptr(struct f2fs_sb [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooSgp-003dpr-IM
Subject: [f2fs-dev] [PATCH] f2fs: use sysfs_emit instead of sprintf
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

Let's use sysfs_emit.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/sysfs.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 66c88220d319..aaf93bb6c64d 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -95,28 +95,28 @@ static unsigned char *__struct_ptr(struct f2fs_sb_info *sbi, int struct_type)
 static ssize_t dirty_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 			(unsigned long long)(dirty_segments(sbi)));
 }
 
 static ssize_t free_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 			(unsigned long long)(free_segments(sbi)));
 }
 
 static ssize_t ovp_segments_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 			(unsigned long long)(overprovision_segments(sbi)));
 }
 
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 			(unsigned long long)(sbi->kbytes_written +
 			((f2fs_get_sectors_written(sbi) -
 				sbi->sectors_written_start) >> 1)));
@@ -125,13 +125,13 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 static ssize_t sb_status_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%lx\n", sbi->s_flag);
+	return sysfs_emit(buf, "%lx\n", sbi->s_flag);
 }
 
 static ssize_t cp_status_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
+	return sysfs_emit(buf, "%x\n", le32_to_cpu(F2FS_CKPT(sbi)->ckpt_flags));
 }
 
 static ssize_t pending_discard_show(struct f2fs_attr *a,
@@ -139,7 +139,7 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
 {
 	if (!SM_I(sbi)->dcc_info)
 		return -EINVAL;
-	return sprintf(buf, "%llu\n", (unsigned long long)atomic_read(
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)atomic_read(
 				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
 }
 
@@ -205,7 +205,7 @@ static ssize_t features_show(struct f2fs_attr *a,
 static ssize_t current_reserved_blocks_show(struct f2fs_attr *a,
 					struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%u\n", sbi->current_reserved_blocks);
+	return sysfs_emit(buf, "%u\n", sbi->current_reserved_blocks);
 }
 
 static ssize_t unusable_show(struct f2fs_attr *a,
@@ -217,7 +217,7 @@ static ssize_t unusable_show(struct f2fs_attr *a,
 		unusable = sbi->unusable_block_count;
 	else
 		unusable = f2fs_get_unusable_blocks(sbi);
-	return sprintf(buf, "%llu\n", (unsigned long long)unusable);
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)unusable);
 }
 
 static ssize_t encoding_show(struct f2fs_attr *a,
@@ -232,13 +232,13 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 			(sb->s_encoding->version >> 8) & 0xff,
 			sb->s_encoding->version & 0xff);
 #endif
-	return sprintf(buf, "(none)");
+	return sysfs_emit(buf, "(none)");
 }
 
 static ssize_t mounted_time_sec_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "%llu", SIT_I(sbi)->mounted_time);
+	return sysfs_emit(buf, "%llu", SIT_I(sbi)->mounted_time);
 }
 
 #ifdef CONFIG_F2FS_STAT_FS
@@ -247,7 +247,7 @@ static ssize_t moved_blocks_foreground_show(struct f2fs_attr *a,
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 		(unsigned long long)(si->tot_blks -
 			(si->bg_data_blks + si->bg_node_blks)));
 }
@@ -257,7 +257,7 @@ static ssize_t moved_blocks_background_show(struct f2fs_attr *a,
 {
 	struct f2fs_stat_info *si = F2FS_STAT(sbi);
 
-	return sprintf(buf, "%llu\n",
+	return sysfs_emit(buf, "%llu\n",
 		(unsigned long long)(si->bg_data_blks + si->bg_node_blks));
 }
 
@@ -268,7 +268,7 @@ static ssize_t avg_vblocks_show(struct f2fs_attr *a,
 
 	si->dirty_count = dirty_segments(sbi);
 	f2fs_update_sit_info(sbi);
-	return sprintf(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
+	return sysfs_emit(buf, "%llu\n", (unsigned long long)(si->avg_vblocks));
 }
 #endif
 
@@ -363,7 +363,7 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 
 	ui = (unsigned int *)(ptr + a->offset);
 
-	return sprintf(buf, "%u\n", *ui);
+	return sysfs_emit(buf, "%u\n", *ui);
 }
 
 static ssize_t __sbi_store(struct f2fs_attr *a,
@@ -728,7 +728,7 @@ static void f2fs_sb_release(struct kobject *kobj)
 static ssize_t f2fs_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
-	return sprintf(buf, "supported\n");
+	return sysfs_emit(buf, "supported\n");
 }
 
 #define F2FS_FEATURE_RO_ATTR(_name)				\
@@ -741,8 +741,8 @@ static ssize_t f2fs_sb_feature_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
 	if (F2FS_HAS_FEATURE(sbi, a->id))
-		return sprintf(buf, "supported\n");
-	return sprintf(buf, "unsupported\n");
+		return sysfs_emit(buf, "supported\n");
+	return sysfs_emit(buf, "unsupported\n");
 }
 
 #define F2FS_SB_FEATURE_RO_ATTR(_name, _feat)			\
-- 
2.38.1.273.g43a17bfeac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
