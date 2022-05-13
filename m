Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A204D526D73
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:21:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npear-0008Dc-3a; Fri, 13 May 2022 23:21:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npeap-0008DP-EP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YLCnHa5IAru5FhfTMAG5DvLWEuu844BOemDx9edQipI=; b=HFXzhbqyWVJyw5j5G1VZ0PrlfO
 fBuHdqWObSq02heMbxeI/zLLYkWYK/0YdgE1pHJhTLbnKr7v4u2q6A8X+0YUFx5+qRe2GcfCJ33aM
 91KMfplclcChF45NuTRTtk1QQ0beJG/D7fQSnw+aEzzKDpi9x2Ebf961uVwuVANyOs7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YLCnHa5IAru5FhfTMAG5DvLWEuu844BOemDx9edQipI=; b=diVe9g4r3PNYx448SXlFId6oRP
 v8jAxiFi4szCqDPvrI6WF6bLQxpVBbaq9L9yvyqZfPBKNJStbgDmiH0WyiqJ76qIaQ7ItX5N+YCAa
 uD0B0bVo4T7G2CeiitDD+z8bSwhJTG0ewFriaNIIX4iH58a4rw+IE84kfDYgPy2jy5v4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npeak-00BPOt-3w
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AAC7E6191D;
 Fri, 13 May 2022 23:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5815C3411D;
 Fri, 13 May 2022 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484056;
 bh=6PYFSk+ZCTnV4papt77rNmEZVWO4yuL5/bDwq92FS1k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gM3in2QdxnPEAFLJrsi4qmsFXiFIj44JlS7p9zJ0E7pRTi+OU0LvEfxr7qOFCKrKt
 4DiaZZMs+UeTTeuLglB3o+1QmupAr80zG/2CKvwEiUuu7wl1gzDWipjcysOeASBsmf
 s5D7N8mujU3eYWVGhb/wcUQHGTZ3DsRvDf0TG9TQljdsgOmTDS5UxtIEOSsnEvlRRO
 T/6iGUhoMPhBLynxJRk0iPR6mdx+bzDgM7QbDdqpBlRaGLBVoWCTyI/4i/4avwALsO
 f4rDDAUC+iN9If/2Bn7y9+KNAwUN+pXo4E4tpg6F+UsFs5vsFJcLjK2Bbqc+bqvDG/
 qBcFEuJiopdIw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 16:16:03 -0700
Message-Id: <20220513231605.175121-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513231605.175121-1-ebiggers@kernel.org>
References: <20220513231605.175121-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Since ext4 was
 converted
 to the new mount API, the test_dummy_encryption mount option isn't being
 handled entirely correctly,
 because the needed fscrypt_set_test_dummy_encryption()
 helper function com [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1npeak-00BPOt-3w
Subject: [f2fs-dev] [PATCH v3 3/5] ext4: fix up test_dummy_encryption
 handling for new mount API
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
Cc: Lukas Czerner <lczerner@redhat.com>, Jeff Layton <jlayton@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Since ext4 was converted to the new mount API, the test_dummy_encryption
mount option isn't being handled entirely correctly, because the needed
fscrypt_set_test_dummy_encryption() helper function combines
parsing/checking/applying into one function.  That doesn't work well
with the new mount API, which split these into separate steps.

This was sort of okay anyway, due to the parsing logic that was copied
from fscrypt_set_test_dummy_encryption() into ext4_parse_param(),
combined with an additional check in ext4_check_test_dummy_encryption().
However, these overlooked the case of changing the value of
test_dummy_encryption on remount, which isn't allowed but ext4 wasn't
detecting until ext4_apply_options() when it's too late to fail.
Another bug is that if test_dummy_encryption was specified multiple
times with an argument, memory was leaked.

Fix this up properly by using the new helper functions that allow
splitting up the parse/check/apply steps for test_dummy_encryption.

Fixes: cebe85d570cf ("ext4: switch to the new mount api")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/ext4.h  |   6 ---
 fs/ext4/super.c | 133 ++++++++++++++++++++++++++----------------------
 2 files changed, 71 insertions(+), 68 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index a743b1e3b89ec..f6d6661817b63 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1440,12 +1440,6 @@ struct ext4_super_block {
 
 #ifdef __KERNEL__
 
-#ifdef CONFIG_FS_ENCRYPTION
-#define DUMMY_ENCRYPTION_ENABLED(sbi) ((sbi)->s_dummy_enc_policy.policy != NULL)
-#else
-#define DUMMY_ENCRYPTION_ENABLED(sbi) (0)
-#endif
-
 /* Number of quota types we support */
 #define EXT4_MAXQUOTAS 3
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 001915df62c07..5a75da164418c 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -87,7 +87,7 @@ static struct inode *ext4_get_journal_inode(struct super_block *sb,
 static int ext4_validate_options(struct fs_context *fc);
 static int ext4_check_opt_consistency(struct fs_context *fc,
 				      struct super_block *sb);
-static int ext4_apply_options(struct fs_context *fc, struct super_block *sb);
+static void ext4_apply_options(struct fs_context *fc, struct super_block *sb);
 static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param);
 static int ext4_get_tree(struct fs_context *fc);
 static int ext4_reconfigure(struct fs_context *fc);
@@ -1989,31 +1989,12 @@ ext4_sb_read_encoding(const struct ext4_super_block *es)
 }
 #endif
 
-static int ext4_set_test_dummy_encryption(struct super_block *sb, char *arg)
-{
-#ifdef CONFIG_FS_ENCRYPTION
-	struct ext4_sb_info *sbi = EXT4_SB(sb);
-	int err;
-
-	err = fscrypt_set_test_dummy_encryption(sb, arg,
-						&sbi->s_dummy_enc_policy);
-	if (err) {
-		ext4_msg(sb, KERN_WARNING,
-			 "Error while setting test dummy encryption [%d]", err);
-		return err;
-	}
-	ext4_msg(sb, KERN_WARNING, "Test dummy encryption mode enabled");
-#endif
-	return 0;
-}
-
 #define EXT4_SPEC_JQUOTA			(1 <<  0)
 #define EXT4_SPEC_JQFMT				(1 <<  1)
 #define EXT4_SPEC_DATAJ				(1 <<  2)
 #define EXT4_SPEC_SB_BLOCK			(1 <<  3)
 #define EXT4_SPEC_JOURNAL_DEV			(1 <<  4)
 #define EXT4_SPEC_JOURNAL_IOPRIO		(1 <<  5)
-#define EXT4_SPEC_DUMMY_ENCRYPTION		(1 <<  6)
 #define EXT4_SPEC_s_want_extra_isize		(1 <<  7)
 #define EXT4_SPEC_s_max_batch_time		(1 <<  8)
 #define EXT4_SPEC_s_min_batch_time		(1 <<  9)
@@ -2030,7 +2011,7 @@ static int ext4_set_test_dummy_encryption(struct super_block *sb, char *arg)
 
 struct ext4_fs_context {
 	char		*s_qf_names[EXT4_MAXQUOTAS];
-	char		*test_dummy_enc_arg;
+	struct fscrypt_dummy_policy dummy_enc_policy;
 	int		s_jquota_fmt;	/* Format of quota to use */
 #ifdef CONFIG_EXT4_DEBUG
 	int s_fc_debug_max_replay;
@@ -2072,7 +2053,7 @@ static void ext4_fc_free(struct fs_context *fc)
 	for (i = 0; i < EXT4_MAXQUOTAS; i++)
 		kfree(ctx->s_qf_names[i]);
 
-	kfree(ctx->test_dummy_enc_arg);
+	fscrypt_free_dummy_policy(&ctx->dummy_enc_policy);
 	kfree(ctx);
 }
 
@@ -2148,6 +2129,29 @@ static int unnote_qf_name(struct fs_context *fc, int qtype)
 }
 #endif
 
+static int ext4_parse_test_dummy_encryption(const struct fs_parameter *param,
+					    struct ext4_fs_context *ctx)
+{
+	int err;
+
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION)) {
+		ext4_msg(NULL, KERN_WARNING,
+			 "test_dummy_encryption option not supported");
+		return -EINVAL;
+	}
+	err = fscrypt_parse_test_dummy_encryption(param,
+						  &ctx->dummy_enc_policy);
+	if (err == -EINVAL) {
+		ext4_msg(NULL, KERN_WARNING,
+			 "Value of option \"%s\" is unrecognized", param->key);
+	} else if (err == -EEXIST) {
+		ext4_msg(NULL, KERN_WARNING,
+			 "Conflicting test_dummy_encryption options");
+		return -EINVAL;
+	}
+	return err;
+}
+
 #define EXT4_SET_CTX(name)						\
 static inline void ctx_set_##name(struct ext4_fs_context *ctx,		\
 				  unsigned long flag)			\
@@ -2410,29 +2414,7 @@ static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->spec |= EXT4_SPEC_JOURNAL_IOPRIO;
 		return 0;
 	case Opt_test_dummy_encryption:
-#ifdef CONFIG_FS_ENCRYPTION
-		if (param->type == fs_value_is_flag) {
-			ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
-			ctx->test_dummy_enc_arg = NULL;
-			return 0;
-		}
-		if (*param->string &&
-		    !(!strcmp(param->string, "v1") ||
-		      !strcmp(param->string, "v2"))) {
-			ext4_msg(NULL, KERN_WARNING,
-				 "Value of option \"%s\" is unrecognized",
-				 param->key);
-			return -EINVAL;
-		}
-		ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
-		ctx->test_dummy_enc_arg = kmemdup_nul(param->string, param->size,
-						      GFP_KERNEL);
-		return 0;
-#else
-		ext4_msg(NULL, KERN_WARNING,
-			 "test_dummy_encryption option not supported");
-		return -EINVAL;
-#endif
+		return ext4_parse_test_dummy_encryption(param, ctx);
 	case Opt_dax:
 	case Opt_dax_type:
 #ifdef CONFIG_FS_DAX
@@ -2623,7 +2605,8 @@ static int parse_apply_sb_mount_options(struct super_block *sb,
 	if (s_ctx->spec & EXT4_SPEC_JOURNAL_IOPRIO)
 		m_ctx->journal_ioprio = s_ctx->journal_ioprio;
 
-	ret = ext4_apply_options(fc, sb);
+	ext4_apply_options(fc, sb);
+	ret = 0;
 
 out_free:
 	if (fc) {
@@ -2794,9 +2777,9 @@ static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
 {
 	const struct ext4_fs_context *ctx = fc->fs_private;
 	const struct ext4_sb_info *sbi = EXT4_SB(sb);
+	int err;
 
-	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION) ||
-	    !(ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION))
+	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy))
 		return 0;
 
 	if (!ext4_has_feature_encrypt(sb)) {
@@ -2810,13 +2793,46 @@ static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
 	 * needed to allow it to be set or changed during remount.  We do allow
 	 * it to be specified during remount, but only if there is no change.
 	 */
-	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
-	    !DUMMY_ENCRYPTION_ENABLED(sbi)) {
+	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE) {
+		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
+						 &ctx->dummy_enc_policy))
+			return 0;
 		ext4_msg(NULL, KERN_WARNING,
-			 "Can't set test_dummy_encryption on remount");
+			 "Can't set or change test_dummy_encryption on remount");
 		return -EINVAL;
 	}
-	return 0;
+	/* Also make sure s_mount_opts didn't contain a conflicting value. */
+	if (fscrypt_is_dummy_policy_set(&sbi->s_dummy_enc_policy)) {
+		if (fscrypt_dummy_policies_equal(&sbi->s_dummy_enc_policy,
+						 &ctx->dummy_enc_policy))
+			return 0;
+		ext4_msg(NULL, KERN_WARNING,
+			 "Conflicting test_dummy_encryption options");
+		return -EINVAL;
+	}
+	/*
+	 * fscrypt_add_test_dummy_key() technically changes the super_block, so
+	 * technically it should be delayed until ext4_apply_options() like the
+	 * other changes.  But since we never get here for remounts (see above),
+	 * and this is the last chance to report errors, we do it here.
+	 */
+	err = fscrypt_add_test_dummy_key(sb, &ctx->dummy_enc_policy);
+	if (err)
+		ext4_msg(NULL, KERN_WARNING,
+			 "Error adding test dummy encryption key [%d]", err);
+	return err;
+}
+
+static void ext4_apply_test_dummy_encryption(struct ext4_fs_context *ctx,
+					     struct super_block *sb)
+{
+	if (!fscrypt_is_dummy_policy_set(&ctx->dummy_enc_policy) ||
+	    /* if already set, it was already verified to be the same */
+	    fscrypt_is_dummy_policy_set(&EXT4_SB(sb)->s_dummy_enc_policy))
+		return;
+	EXT4_SB(sb)->s_dummy_enc_policy = ctx->dummy_enc_policy;
+	memset(&ctx->dummy_enc_policy, 0, sizeof(ctx->dummy_enc_policy));
+	ext4_msg(sb, KERN_WARNING, "Test dummy encryption mode enabled");
 }
 
 static int ext4_check_opt_consistency(struct fs_context *fc,
@@ -2903,11 +2919,10 @@ static int ext4_check_opt_consistency(struct fs_context *fc,
 	return ext4_check_quota_consistency(fc, sb);
 }
 
-static int ext4_apply_options(struct fs_context *fc, struct super_block *sb)
+static void ext4_apply_options(struct fs_context *fc, struct super_block *sb)
 {
 	struct ext4_fs_context *ctx = fc->fs_private;
 	struct ext4_sb_info *sbi = fc->s_fs_info;
-	int ret = 0;
 
 	sbi->s_mount_opt &= ~ctx->mask_s_mount_opt;
 	sbi->s_mount_opt |= ctx->vals_s_mount_opt;
@@ -2943,11 +2958,7 @@ static int ext4_apply_options(struct fs_context *fc, struct super_block *sb)
 #endif
 
 	ext4_apply_quota_options(fc, sb);
-
-	if (ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION)
-		ret = ext4_set_test_dummy_encryption(sb, ctx->test_dummy_enc_arg);
-
-	return ret;
+	ext4_apply_test_dummy_encryption(ctx, sb);
 }
 
 
@@ -4669,9 +4680,7 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 	if (err < 0)
 		goto failed_mount;
 
-	err = ext4_apply_options(fc, sb);
-	if (err < 0)
-		goto failed_mount;
+	ext4_apply_options(fc, sb);
 
 #if IS_ENABLED(CONFIG_UNICODE)
 	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
