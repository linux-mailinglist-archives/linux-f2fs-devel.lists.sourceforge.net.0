Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DB526D6E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:21:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npeas-0005mK-0p; Fri, 13 May 2022 23:21:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npear-0005m7-8C
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7p72gSrwz+S8tjHmGUnqX6OOQ4Ua9L/k1bzLr/LqCmI=; b=ZyKiEMrl2GtIgGWIBIj62aTa4V
 DCHJ/Hexg+H8EtF4xndV62Tn6mt4pVa892h25oyAarB0qTBiMY7VKuJFLwVwe/GChLMhzJAMkPLpF
 nGNRB6o+3fcdgk24oUAVBRi8O6KMUxb47WR7QLjEaNcP5M7xJ8h0Q2EWrtd7BeO/U2ss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7p72gSrwz+S8tjHmGUnqX6OOQ4Ua9L/k1bzLr/LqCmI=; b=DtPpbzK9NUpM97BMZ/ynjK0zBU
 1PfYCdJWw67nNVmDxAcBrU8BHnR2ONiYv+0yqp/PFwB88qe2BR20nk+vxTJFuS+83vwE4bTRhELgv
 Pon+c6t8v7ELRILuZFP0aMH7CWYYPfFDNfrTrpzaRadQI4XorHVSYCLMgzpQ3tnKtzJA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npeao-0005Jh-3D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:21:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48E15618D6;
 Fri, 13 May 2022 23:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FDDC34119;
 Fri, 13 May 2022 23:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484055;
 bh=L54m2DpaZFpXAxYKzTyDvABljacoQOsNHz9nUaWql/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=B7Pdogt2HrJlcJjISldAkLeknrqxyzeb7upzoE7f3NkzgAd4lTUsay0RnsfJEjhUY
 Ugi//hcKXPO/P/jcpoiwZpbcAnbVxqrkJpREAoY10AEVoj1RW1V0GnPNvBZC6SfQ3v
 XIkiNJR54i87ekcv2tSgl+NYFobFNoJORjsQgVZixcKS5Sn4YAjdTt8ynxXR6imkeq
 /2cKPpDFAT8qyJ6vbbCx41ClbiKm1p8vTzTostWB/Wg9mQfb3AyWl7VYtgAX7vSz77
 7xHoQiR9YOpXTw4qZScXiLmi8oVes88cz9l+8i2rTZKkWBCpVdgI314ADmEpFtglUS
 us3Ku1t7Z4VhQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 13 May 2022 16:16:02 -0700
Message-Id: <20220513231605.175121-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220513231605.175121-1-ebiggers@kernel.org>
References: <20220513231605.175121-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make the
 test_dummy_encryption
 mount option require that the encrypt feature flag be already enabled on
 the filesystem, rather than automatically enabling it. Practically, this means
 that "-O encrypt" [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npeao-0005Jh-3D
Subject: [f2fs-dev] [PATCH v3 2/5] ext4: only allow test_dummy_encryption
 when supported
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

Make the test_dummy_encryption mount option require that the encrypt
feature flag be already enabled on the filesystem, rather than
automatically enabling it.  Practically, this means that "-O encrypt"
will need to be included in MKFS_OPTIONS when running xfstests with the
test_dummy_encryption mount option.  (ext4/053 also needs an update.)

Moreover, as long as the preconditions for test_dummy_encryption are
being tightened anyway, take the opportunity to start rejecting it when
!CONFIG_FS_ENCRYPTION rather than ignoring it.

The motivation for requiring the encrypt feature flag is that:

- Having the filesystem auto-enable feature flags is problematic, as it
  bypasses the usual sanity checks.  The specific issue which came up
  recently is that in kernel versions where ext4 supports casefold but
  not encrypt+casefold (v5.1 through v5.10), the kernel will happily add
  the encrypt flag to a filesystem that has the casefold flag, making it
  unmountable -- but only for subsequent mounts, not the initial one.
  This confused the casefold support detection in xfstests, causing
  generic/556 to fail rather than be skipped.

- The xfstests-bld test runners (kvm-xfstests et al.) already use the
  required mkfs flag, so they will not be affected by this change.  Only
  users of test_dummy_encryption alone will be affected.  But, this
  option has always been for testing only, so it should be fine to
  require that the few users of this option update their test scripts.

- f2fs already requires it (for its equivalent feature flag).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/super.c | 59 +++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 22 deletions(-)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 60fa2f2623e07..001915df62c07 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -2427,11 +2427,12 @@ static int ext4_parse_param(struct fs_context *fc, struct fs_parameter *param)
 		ctx->spec |= EXT4_SPEC_DUMMY_ENCRYPTION;
 		ctx->test_dummy_enc_arg = kmemdup_nul(param->string, param->size,
 						      GFP_KERNEL);
+		return 0;
 #else
 		ext4_msg(NULL, KERN_WARNING,
-			 "Test dummy encryption mount option ignored");
+			 "test_dummy_encryption option not supported");
+		return -EINVAL;
 #endif
-		return 0;
 	case Opt_dax:
 	case Opt_dax_type:
 #ifdef CONFIG_FS_DAX
@@ -2788,12 +2789,43 @@ static int ext4_check_quota_consistency(struct fs_context *fc,
 #endif
 }
 
+static int ext4_check_test_dummy_encryption(const struct fs_context *fc,
+					    struct super_block *sb)
+{
+	const struct ext4_fs_context *ctx = fc->fs_private;
+	const struct ext4_sb_info *sbi = EXT4_SB(sb);
+
+	if (!IS_ENABLED(CONFIG_FS_ENCRYPTION) ||
+	    !(ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION))
+		return 0;
+
+	if (!ext4_has_feature_encrypt(sb)) {
+		ext4_msg(NULL, KERN_WARNING,
+			 "test_dummy_encryption requires encrypt feature");
+		return -EINVAL;
+	}
+	/*
+	 * This mount option is just for testing, and it's not worthwhile to
+	 * implement the extra complexity (e.g. RCU protection) that would be
+	 * needed to allow it to be set or changed during remount.  We do allow
+	 * it to be specified during remount, but only if there is no change.
+	 */
+	if (fc->purpose == FS_CONTEXT_FOR_RECONFIGURE &&
+	    !DUMMY_ENCRYPTION_ENABLED(sbi)) {
+		ext4_msg(NULL, KERN_WARNING,
+			 "Can't set test_dummy_encryption on remount");
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int ext4_check_opt_consistency(struct fs_context *fc,
 				      struct super_block *sb)
 {
 	struct ext4_fs_context *ctx = fc->fs_private;
 	struct ext4_sb_info *sbi = fc->s_fs_info;
 	int is_remount = fc->purpose == FS_CONTEXT_FOR_RECONFIGURE;
+	int err;
 
 	if ((ctx->opt_flags & MOPT_NO_EXT2) && IS_EXT2_SB(sb)) {
 		ext4_msg(NULL, KERN_ERR,
@@ -2823,20 +2855,9 @@ static int ext4_check_opt_consistency(struct fs_context *fc,
 				 "for blocksize < PAGE_SIZE");
 	}
 
-#ifdef CONFIG_FS_ENCRYPTION
-	/*
-	 * This mount option is just for testing, and it's not worthwhile to
-	 * implement the extra complexity (e.g. RCU protection) that would be
-	 * needed to allow it to be set or changed during remount.  We do allow
-	 * it to be specified during remount, but only if there is no change.
-	 */
-	if ((ctx->spec & EXT4_SPEC_DUMMY_ENCRYPTION) &&
-	    is_remount && !sbi->s_dummy_enc_policy.policy) {
-		ext4_msg(NULL, KERN_WARNING,
-			 "Can't set test_dummy_encryption on remount");
-		return -1;
-	}
-#endif
+	err = ext4_check_test_dummy_encryption(fc, sb);
+	if (err)
+		return err;
 
 	if ((ctx->spec & EXT4_SPEC_DATAJ) && is_remount) {
 		if (!sbi->s_journal) {
@@ -5281,12 +5302,6 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 		goto failed_mount_wq;
 	}
 
-	if (DUMMY_ENCRYPTION_ENABLED(sbi) && !sb_rdonly(sb) &&
-	    !ext4_has_feature_encrypt(sb)) {
-		ext4_set_feature_encrypt(sb);
-		ext4_commit_super(sb);
-	}
-
 	/*
 	 * Get the # of file system overhead blocks from the
 	 * superblock if present.
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
