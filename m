Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F02859D44
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Feb 2024 08:45:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rbyLa-0005xB-Mx;
	Mon, 19 Feb 2024 07:45:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rbyLY-0005wm-MM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:45:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5v8Q4bL+GnyxyGiB/xjpiDsZhBzHuD24kApQSma/P+E=; b=bVaYfwHwnpQS+CK8z+3n+Gz91r
 Vc+PGdbbcS0oHuNRzwLLt83M1CBDdvJNs9sSwvvpWEPRVOusiJDQrTHqqtKSTsYC4+D1IjCi/drlo
 W/qBC+fRxHhyTXl0Vntf/Ud/iNMeettwMznQEA/mBhFoXBcKfrBNg34Lyp2SdYrDq+po=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5v8Q4bL+GnyxyGiB/xjpiDsZhBzHuD24kApQSma/P+E=; b=g3O1EpAupy4gCzs6XAxjLo9j2H
 RRxgl8hUvakcZBlZBVJlJ/nnKAaQ49t7dTMCE+sVeeUSqi/dobkC5kU+Z4fAJdr5KiLNMcDHclF0F
 AwwNhXs8kxjZklRqw7+n4xagYomr/hhwkvcXvPhTG8q2rqQoBmPXv0YXc0fz9pstFtM0=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rbyLW-0008U3-En for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Feb 2024 07:45:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708328740;
 bh=hw/qeTCsLdZ3kYNOmC9Du+A6MQKSFpNKhdzd2/uvICE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KcL9UnAYGbBTKNzvT6BxUG6QLvicpPcx5SATp03gVJeHp/vyGOvEltNhFRh1P0TXO
 Ki2FP3K4usF/Rr+KW2BhfOm/VXp/Mw5DR+RMG80jAPyV8k3LFyBXfPEu0lC52BWFaG
 nhCVPufQUNEi7YWM0OFZSeoH34tE+XjgojUqDCLlzXtSswdjXCCbpB6Pn5Xzn/G0gq
 ga8PY/T1Hf51ghJDFIGs6uNvpaDpGQ2RzFKzrlVCPWU0glz+n5C1KMQmb40Q1Nftxq
 MJ4VD5NbzNBOgGt/H9l891KKVWvV4zn1C7Vg9j1Ygn1SiPEpDywMjJKFietdj+fX3B
 w511E8ipNiLtw==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B9E0337820BD;
 Mon, 19 Feb 2024 07:45:36 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Mon, 19 Feb 2024 09:44:56 +0200
Message-Id: <20240219074457.24578-8-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240219074457.24578-1-eugen.hristev@collabora.com>
References: <20240219074457.24578-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com> Instead
 of a bunch of ifdefs, make the unicode built checks part of the code flow
 where possible,
 as requested by Torvalds. Reviewed-by: Eric Biggers <ebiggers@google.com>
 Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
 [eugen.hristev@collabora.com:
 port to 6.8-rc3] Signed-off-by: Eugen Hristev <eugen.hriste [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rbyLW-0008U3-En
Subject: [f2fs-dev] [PATCH v11 7/8] ext4: Move CONFIG_UNICODE defguards into
 the code flow
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz,
 Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 eugen.hristev@collabora.com, viro@zeniv.linux.org.uk, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Instead of a bunch of ifdefs, make the unicode built checks part of the
code flow where possible, as requested by Torvalds.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
[eugen.hristev@collabora.com: port to 6.8-rc3]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 fs/ext4/crypto.c | 19 +++----------------
 fs/ext4/ext4.h   | 33 +++++++++++++++++++++------------
 fs/ext4/namei.c  | 14 +++++---------
 fs/ext4/super.c  |  4 +---
 4 files changed, 30 insertions(+), 40 deletions(-)

diff --git a/fs/ext4/crypto.c b/fs/ext4/crypto.c
index 7ae0b61258a7..1d2f8b79529c 100644
--- a/fs/ext4/crypto.c
+++ b/fs/ext4/crypto.c
@@ -31,12 +31,7 @@ int ext4_fname_setup_filename(struct inode *dir, const struct qstr *iname,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-	if (err)
-		ext4_fname_free_filename(fname);
-#endif
-	return err;
+	return ext4_fname_setup_ci_filename(dir, iname, fname);
 }
 
 int ext4_fname_prepare_lookup(struct inode *dir, struct dentry *dentry,
@@ -51,12 +46,7 @@ int ext4_fname_prepare_lookup(struct inode *dir, struct dentry *dentry,
 
 	ext4_fname_from_fscrypt_name(fname, &name);
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
-	if (err)
-		ext4_fname_free_filename(fname);
-#endif
-	return err;
+	return ext4_fname_setup_ci_filename(dir, &dentry->d_name, fname);
 }
 
 void ext4_fname_free_filename(struct ext4_filename *fname)
@@ -70,10 +60,7 @@ void ext4_fname_free_filename(struct ext4_filename *fname)
 	fname->usr_fname = NULL;
 	fname->disk_name.name = NULL;
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	kfree(fname->cf_name.name);
-	fname->cf_name.name = NULL;
-#endif
+	ext4_fname_free_ci_filename(fname);
 }
 
 static bool uuid_is_zero(__u8 u[16])
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 932bae88b4a7..18362054b59e 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2742,8 +2742,25 @@ ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
 #if IS_ENABLED(CONFIG_UNICODE)
 extern int ext4_fname_setup_ci_filename(struct inode *dir,
-					 const struct qstr *iname,
-					 struct ext4_filename *fname);
+					const struct qstr *iname,
+					struct ext4_filename *fname);
+
+static inline void ext4_fname_free_ci_filename(struct ext4_filename *fname)
+{
+	kfree(fname->cf_name.name);
+	fname->cf_name.name = NULL;
+}
+#else
+static inline int ext4_fname_setup_ci_filename(struct inode *dir,
+					       const struct qstr *iname,
+					       struct ext4_filename *fname)
+{
+	return 0;
+}
+
+static inline void ext4_fname_free_ci_filename(struct ext4_filename *fname)
+{
+}
 #endif
 
 /* ext4 encryption related stuff goes here crypto.c */
@@ -2766,16 +2783,11 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
 					    int lookup,
 					    struct ext4_filename *fname)
 {
-	int err = 0;
 	fname->usr_fname = iname;
 	fname->disk_name.name = (unsigned char *) iname->name;
 	fname->disk_name.len = iname->len;
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	err = ext4_fname_setup_ci_filename(dir, iname, fname);
-#endif
-
-	return err;
+	return ext4_fname_setup_ci_filename(dir, iname, fname);
 }
 
 static inline int ext4_fname_prepare_lookup(struct inode *dir,
@@ -2787,10 +2799,7 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
 static inline void ext4_fname_free_filename(struct ext4_filename *fname)
 {
-#if IS_ENABLED(CONFIG_UNICODE)
-	kfree(fname->cf_name.name);
-	fname->cf_name.name = NULL;
-#endif
+	ext4_fname_free_ci_filename(fname);
 }
 
 static inline int ext4_ioctl_get_encryption_pwsalt(struct file *filp,
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 7d357c417475..822bd16f76fa 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1835,8 +1835,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -1844,7 +1843,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		 */
 		return NULL;
 	}
-#endif
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3174,16 +3173,14 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
 	ext4_fc_track_unlink(handle, dentry);
 	retval = ext4_mark_inode_dirty(handle, dir);
 
-#if IS_ENABLED(CONFIG_UNICODE)
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at ext4_lookup(), when it is better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
 
 end_rmdir:
 	brelse(bh);
@@ -3285,16 +3282,15 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
 		goto out_trace;
 
 	retval = __ext4_unlink(dir, &dentry->d_name, d_inode(dentry), dentry);
-#if IS_ENABLED(CONFIG_UNICODE)
+
 	/* VFS negative dentries are incompatible with Encoding and
 	 * Case-insensitiveness. Eventually we'll want avoid
 	 * invalidating the dentries here, alongside with returning the
 	 * negative dentries at ext4_lookup(), when it is  better
 	 * supported by the VFS for the CI case.
 	 */
-	if (IS_CASEFOLDED(dir))
+	if (IS_ENABLED(CONFIG_UNICODE) && IS_CASEFOLDED(dir))
 		d_invalidate(dentry);
-#endif
 
 out_trace:
 	trace_ext4_unlink_exit(dentry, retval);
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 0f931d0c227d..933a9218c20c 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -3609,14 +3609,12 @@ int ext4_feature_set_ok(struct super_block *sb, int readonly)
 		return 0;
 	}
 
-#if !IS_ENABLED(CONFIG_UNICODE)
-	if (ext4_has_feature_casefold(sb)) {
+	if (!IS_ENABLED(CONFIG_UNICODE) && ext4_has_feature_casefold(sb)) {
 		ext4_msg(sb, KERN_ERR,
 			 "Filesystem with casefold feature cannot be "
 			 "mounted without CONFIG_UNICODE");
 		return 0;
 	}
-#endif
 
 	if (readonly)
 		return 1;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
