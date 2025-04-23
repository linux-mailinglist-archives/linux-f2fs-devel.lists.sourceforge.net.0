Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20256A9AFBB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Apr 2025 15:51:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7wzU-0003Mg-UD;
	Thu, 24 Apr 2025 13:51:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sandeen@redhat.com>) id 1u7wzT-0003MJ-2G
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=content-type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qD/UpRkz2a+d2aIW1RIhEkplQolvjFOHogsVje60F7M=; b=DeqjpWlYbomwxwT+csQTzBr+mR
 x5rQA9HivAID5aJl05txfnc6cu0hXrhw2G4BYftqEK2ePn7WpGco4EocOrasu8e3JDipUs76o6YCt
 AWoXlkl6GETXm31oV8U2svx9HWt9MRVKYbBnldLSYoGAghvjG9mWKtN0yF6hcmD7Zcjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=content-type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qD/UpRkz2a+d2aIW1RIhEkplQolvjFOHogsVje60F7M=; b=j7ZiDSE6mtTXbN6Nh3k4l8F4Gs
 jGcJIY/zQICBn0iC6v4V5KMA/XEgDJ0hW6NImO7q4xnYoKhATTPMDin4LGsoGjNq70ceUP4siQeOM
 Z0/Ga3nmqJIgsDkdC0Nt6ncN6SIDaTe7JNPIoVWcFVQgMHBRr/yzw8M3bPt3gBPxeO8g=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1u7wzD-0000nb-Ml for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Apr 2025 13:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745502675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qD/UpRkz2a+d2aIW1RIhEkplQolvjFOHogsVje60F7M=;
 b=VNi2KJtLGPPy+y+ah5LMAEvmdthfLOQ9zeM1Eg+pVUty8PpVuct50U5QsWWLstyzF7LFzg
 m91TJZ/vUKUPTZPqZm/4kt2bbVxEzXP8SEeSPaB1gBsvsNalOe2T8SyfoGZt16KUPsHT3f
 2i+VivCrhyzSEsOKnhmEo0Gv7UOPavc=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-OsbGlc1SOQKObhgyjm3glg-1; Thu, 24 Apr 2025 09:51:14 -0400
X-MC-Unique: OsbGlc1SOQKObhgyjm3glg-1
X-Mimecast-MFC-AGG-ID: OsbGlc1SOQKObhgyjm3glg_1745502674
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-72ab21098efso713381a34.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Apr 2025 06:51:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745502674; x=1746107474;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qD/UpRkz2a+d2aIW1RIhEkplQolvjFOHogsVje60F7M=;
 b=OGQ2IJScmYoK1Tyft5yqTH5BS2/2tkjqyDu84D98fN18LbVv0aIHHFs7xsvyCCPgE4
 T1B3gpHqf5zSiUTa2iftaEpvtv+7s22y1jLlftPDX7v1jE3EbqsYBmj1Dw7g8cfl5HjO
 pOPIdo5jS9G3h5yVZE1wFx9dG/zzfOkSlWmpvsC9c3ZUCa7vz2gU74NybF8wOfSS53QN
 xfoCSRZDIXJsSMPinF96AYFIOIoE2tP9ZoqV1R2puPFA1MLt/e5/3WfA2cVCh0JZJQN/
 f1A6UqOyP5u/j+p2YaxCpVblyx5g33aaaTCFAWExOvP8/jNUwmOZ5NZxgCTxmAxR0tqF
 8bCA==
X-Gm-Message-State: AOJu0YwBRh7vlspr61Hu9WNZvgfjFwTG/Ij0G7Ta+NNQlwBKO//Z9zjT
 GpoTI5WR8mYyTdzgcNaQGSiqxpi/MkHWJpGYLLm8IAJgKfAwVgKf5MBQcvvPvSRiC0UdqfRRXe1
 aC6UCa/BdGCVWeOdEusUHff7ADLjNyVtJVGp3MUdoSXf6V9d2/cQ9BxH4153WmE17uM80To46OT
 uzZ5OB8mkY8Sa3X4uirGNLJajxqFN2VuOzmogWjT7JsusLTOh7mII83dOa4Txy
X-Gm-Gg: ASbGnctJeS3pZCJgW0W10b7tJIuBYls1WUXeMig5Y2W5QrpWMqIFEEnqH5MjY5ShuRZ
 m88JVCWJkaRQ7urslWrKZZjWnt3M+Ffog0dmvY54cALxnkmeq1Rcjaq321JifndEZPEL8noZtvF
 kzyA2AzzbCCHWwVxEQcR49A/7ydws7iDXsMbUEQQLUgO+qA4fVRodFbNndGPkE75bdInA1ATX/U
 LlV5DVmR3Bpz6ZxFuOLdnSGs8lu2WiPOs10wfzrRpQDObs4WDP6z+vKIKVhY7hIWyNj9LHJeuYZ
 TNvBzAUD2zaHKONZCHipaS/uq/+xI1RIO8d16HsDyiPT04UONymMlks=
X-Received: by 2002:a05:6830:618c:b0:72a:e65:e65c with SMTP id
 46e09a7af769-7304fab5704mr1176362a34.11.1745502673608; 
 Thu, 24 Apr 2025 06:51:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqdp/zmGLzm0p+gVfTAYfpYlsy7eePgp2zekm+QON25Nv3dcA5h2QMfOFAj0V5RY3L0sw/bg==
X-Received: by 2002:a05:6830:618c:b0:72a:e65:e65c with SMTP id
 46e09a7af769-7304fab5704mr1176346a34.11.1745502673151; 
 Thu, 24 Apr 2025 06:51:13 -0700 (PDT)
Received: from localhost.localdomain (nwtn-09-2828.dsl.iowatelecom.net.
 [67.224.43.12]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7304f37b158sm233595a34.49.2025.04.24.06.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 06:51:12 -0700 (PDT)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 23 Apr 2025 12:08:51 -0500
Message-ID: <20250423170926.76007-8-sandeen@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423170926.76007-1-sandeen@redhat.com>
References: <20250423170926.76007-1-sandeen@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cKU1vBNgCnbwuG2NDI760btBIaFhywCbrwfJZeQXtCg_1745502674
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Hongbo Li <lihongbo22@huawei.com> The new mount api
 will execute .parse_param, .init_fs_context, .get_tree and will call .remount
 if remount happened. So we add the necessary functions for the
 fs_context_operations. If .init_fs_contex [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.129.124 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [170.10.129.124 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u7wzD-0000nb-Ml
Subject: [f2fs-dev] [PATCH V3 7/7] f2fs: switch to the new mount api
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
From: Eric Sandeen via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Sandeen <sandeen@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com,
 Eric Sandeen <sandeen@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Hongbo Li <lihongbo22@huawei.com>

The new mount api will execute .parse_param, .init_fs_context, .get_tree
and will call .remount if remount happened. So we add the necessary
functions for the fs_context_operations. If .init_fs_context is added,
the old .mount should remove.

See Documentation/filesystems/mount_api.rst for more information.

Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
[sandeen: forward port]
Signed-off-by: Eric Sandeen <sandeen@redhat.com>
---
 fs/f2fs/super.c | 156 +++++++++++++++++++-----------------------------
 1 file changed, 62 insertions(+), 94 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 37497fd80bb9..041bd6c482a0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1141,47 +1141,6 @@ static int f2fs_parse_param(struct fs_context *fc, struct fs_parameter *param)
 	return 0;
 }
 
-static int parse_options(struct fs_context *fc, char *options)
-{
-	struct fs_parameter param;
-	char *key;
-	int ret;
-
-	if (!options)
-		return 0;
-
-	while ((key = strsep(&options, ",")) != NULL) {
-		if (*key) {
-			size_t v_len = 0;
-			char *value = strchr(key, '=');
-
-			param.type = fs_value_is_flag;
-			param.string = NULL;
-
-			if (value) {
-				if (value == key)
-					continue;
-
-				*value++ = 0;
-				v_len = strlen(value);
-				param.string = kmemdup_nul(value, v_len, GFP_KERNEL);
-				if (!param.string)
-					return -ENOMEM;
-				param.type = fs_value_is_string;
-			}
-
-			param.key = key;
-			param.size = v_len;
-
-			ret = f2fs_parse_param(fc, &param);
-			kfree(param.string);
-			if (ret < 0)
-				return ret;
-		}
-	}
-	return 0;
-}
-
 /*
  * Check quota settings consistency.
  */
@@ -2583,13 +2542,12 @@ static void f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	f2fs_flush_ckpt_thread(sbi);
 }
 
-static int f2fs_remount(struct super_block *sb, int *flags, char *data)
+static int __f2fs_remount(struct fs_context *fc, struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct f2fs_mount_info org_mount_opt;
-	struct f2fs_fs_context ctx;
-	struct fs_context fc;
 	unsigned long old_sb_flags;
+	unsigned int flags = fc->sb_flags;
 	int err;
 	bool need_restart_gc = false, need_stop_gc = false;
 	bool need_restart_flush = false, need_stop_flush = false;
@@ -2635,7 +2593,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 #endif
 
 	/* recover superblocks we couldn't write due to previous RO mount */
-	if (!(*flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
+	if (!(flags & SB_RDONLY) && is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)) {
 		err = f2fs_commit_super(sbi, false);
 		f2fs_info(sbi, "Try to recover all the superblocks, ret: %d",
 			  err);
@@ -2645,21 +2603,11 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	default_options(sbi, true);
 
-	memset(&fc, 0, sizeof(fc));
-	memset(&ctx, 0, sizeof(ctx));
-	fc.fs_private = &ctx;
-	fc.purpose = FS_CONTEXT_FOR_RECONFIGURE;
-
-	/* parse mount options */
-	err = parse_options(&fc, data);
-	if (err)
-		goto restore_opts;
-
-	err = f2fs_check_opt_consistency(&fc, sb);
+	err = f2fs_check_opt_consistency(fc, sb);
 	if (err < 0)
 		goto restore_opts;
 
-	f2fs_apply_options(&fc, sb);
+	f2fs_apply_options(fc, sb);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	if (f2fs_sb_has_blkzoned(sbi) &&
@@ -2678,20 +2626,20 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 * Previous and new state of filesystem is RO,
 	 * so skip checking GC and FLUSH_MERGE conditions.
 	 */
-	if (f2fs_readonly(sb) && (*flags & SB_RDONLY))
+	if (f2fs_readonly(sb) && (flags & SB_RDONLY))
 		goto skip;
 
-	if (f2fs_dev_is_readonly(sbi) && !(*flags & SB_RDONLY)) {
+	if (f2fs_dev_is_readonly(sbi) && !(flags & SB_RDONLY)) {
 		err = -EROFS;
 		goto restore_opts;
 	}
 
 #ifdef CONFIG_QUOTA
-	if (!f2fs_readonly(sb) && (*flags & SB_RDONLY)) {
+	if (!f2fs_readonly(sb) && (flags & SB_RDONLY)) {
 		err = dquot_suspend(sb, -1);
 		if (err < 0)
 			goto restore_opts;
-	} else if (f2fs_readonly(sb) && !(*flags & SB_RDONLY)) {
+	} else if (f2fs_readonly(sb) && !(flags & SB_RDONLY)) {
 		/* dquot_resume needs RW */
 		sb->s_flags &= ~SB_RDONLY;
 		if (sb_any_quota_suspended(sb)) {
@@ -2747,7 +2695,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
-	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
+	if ((flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
 		goto restore_opts;
@@ -2758,7 +2706,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 * or if background_gc = off is passed in mount
 	 * option. Also sync the filesystem.
 	 */
-	if ((*flags & SB_RDONLY) ||
+	if ((flags & SB_RDONLY) ||
 			(F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_OFF &&
 			!test_opt(sbi, GC_MERGE))) {
 		if (sbi->gc_thread) {
@@ -2772,7 +2720,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		need_stop_gc = true;
 	}
 
-	if (*flags & SB_RDONLY) {
+	if (flags & SB_RDONLY) {
 		sync_inodes_sb(sb);
 
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
@@ -2785,7 +2733,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 * We stop issue flush thread if FS is mounted as RO
 	 * or if flush_merge is not passed in mount option.
 	 */
-	if ((*flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
+	if ((flags & SB_RDONLY) || !test_opt(sbi, FLUSH_MERGE)) {
 		clear_opt(sbi, FLUSH_MERGE);
 		f2fs_destroy_flush_cmd_control(sbi, false);
 		need_restart_flush = true;
@@ -2827,7 +2775,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 * triggered while remount and we need to take care of it before
 	 * returning from remount.
 	 */
-	if ((*flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
+	if ((flags & SB_RDONLY) || test_opt(sbi, DISABLE_CHECKPOINT) ||
 			!test_opt(sbi, MERGE_CHECKPOINT)) {
 		f2fs_stop_ckpt_thread(sbi);
 	} else {
@@ -2854,7 +2802,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
 
 	limit_reserve_root(sbi);
-	*flags = (*flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
+	fc->sb_flags = (flags & ~SB_LAZYTIME) | (sb->s_flags & SB_LAZYTIME);
 
 	sbi->umount_lock_holder = NULL;
 	return 0;
@@ -3523,7 +3471,6 @@ static const struct super_operations f2fs_sops = {
 	.freeze_fs	= f2fs_freeze,
 	.unfreeze_fs	= f2fs_unfreeze,
 	.statfs		= f2fs_statfs,
-	.remount_fs	= f2fs_remount,
 	.shutdown	= f2fs_shutdown,
 };
 
@@ -4745,16 +4692,13 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	sbi->readdir_ra = true;
 }
 
-static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
+static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 {
 	struct f2fs_sb_info *sbi;
 	struct f2fs_super_block *raw_super;
-	struct f2fs_fs_context ctx;
-	struct fs_context fc;
 	struct inode *root;
 	int err;
 	bool skip_recovery = false, need_fsck = false;
-	char *options = NULL;
 	int recovery, i, valid_super_block;
 	struct curseg_info *seg_i;
 	int retry_cnt = 1;
@@ -4767,9 +4711,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	raw_super = NULL;
 	valid_super_block = -1;
 	recovery = 0;
-	memset(&fc, 0, sizeof(fc));
-	memset(&ctx, 0, sizeof(ctx));
-	fc.fs_private = &ctx;
 
 	/* allocate memory for f2fs-specific super block info */
 	sbi = kzalloc(sizeof(struct f2fs_sb_info), GFP_KERNEL);
@@ -4820,22 +4761,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 						sizeof(raw_super->uuid));
 
 	default_options(sbi, false);
-	/* parse mount options */
-	options = kstrdup((const char *)data, GFP_KERNEL);
-	if (data && !options) {
-		err = -ENOMEM;
-		goto free_sb_buf;
-	}
-
-	err = parse_options(&fc, options);
-	if (err)
-		goto free_options;
 
-	err = f2fs_check_opt_consistency(&fc, sb);
+	err = f2fs_check_opt_consistency(fc, sb);
 	if (err < 0)
-		goto free_options;
+		goto free_sb_buf;
 
-	f2fs_apply_options(&fc, sb);
+	f2fs_apply_options(fc, sb);
 
 	sb->s_maxbytes = max_file_blocks(NULL) <<
 				le32_to_cpu(raw_super->log_blocksize);
@@ -5160,7 +5091,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		if (err)
 			goto sync_free_meta;
 	}
-	kvfree(options);
 
 	/* recover broken superblock */
 	if (recovery) {
@@ -5255,7 +5185,6 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kfree(F2FS_OPTION(sbi).s_qf_names[i]);
 #endif
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
-	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
@@ -5271,14 +5200,39 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	return err;
 }
 
-static struct dentry *f2fs_mount(struct file_system_type *fs_type, int flags,
-			const char *dev_name, void *data)
+static int f2fs_get_tree(struct fs_context *fc)
 {
-	return mount_bdev(fs_type, flags, dev_name, data, f2fs_fill_super);
+	return get_tree_bdev(fc, f2fs_fill_super);
+}
+
+static int f2fs_reconfigure(struct fs_context *fc)
+{
+	struct super_block *sb = fc->root->d_sb;
+
+	return __f2fs_remount(fc, sb);
+}
+
+static void f2fs_fc_free(struct fs_context *fc)
+{
+	struct f2fs_fs_context *ctx = fc->fs_private;
+	int i;
+
+	if (!ctx)
+		return;
+
+#ifdef CONFIG_QUOTA
+	for (i = 0; i < MAXQUOTAS; i++)
+		kfree(F2FS_CTX_INFO(ctx).s_qf_names[i]);
+#endif
+	fscrypt_free_dummy_policy(&F2FS_CTX_INFO(ctx).dummy_enc_policy);
+	kfree(ctx);
 }
 
 static const struct fs_context_operations f2fs_context_ops = {
 	.parse_param	= f2fs_parse_param,
+	.get_tree	= f2fs_get_tree,
+	.reconfigure = f2fs_reconfigure,
+	.free	= f2fs_fc_free,
 };
 
 static void kill_f2fs_super(struct super_block *sb)
@@ -5322,10 +5276,24 @@ static void kill_f2fs_super(struct super_block *sb)
 	}
 }
 
+static int f2fs_init_fs_context(struct fs_context *fc)
+{
+	struct f2fs_fs_context *ctx;
+
+	ctx = kzalloc(sizeof(struct f2fs_fs_context), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	fc->fs_private = ctx;
+	fc->ops = &f2fs_context_ops;
+
+	return 0;
+}
+
 static struct file_system_type f2fs_fs_type = {
 	.owner		= THIS_MODULE,
 	.name		= "f2fs",
-	.mount		= f2fs_mount,
+	.init_fs_context = f2fs_init_fs_context,
 	.kill_sb	= kill_f2fs_super,
 	.fs_flags	= FS_REQUIRES_DEV | FS_ALLOW_IDMAP,
 };
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
