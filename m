Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A47880D7C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Mar 2024 09:47:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmrbC-0002Is-52;
	Wed, 20 Mar 2024 08:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rmrbA-0002IU-Uc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 08:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uGz6ub0tyrhl62fRAM9pzJuAVWv4QkSa8sE258B78mI=; b=F/nDl/PfdAnw/MbaOenPi/9D3N
 ycoaaBNLsfxocmeHD9WdMpxMcxcrgqDHzj8hHm/hJQZ6UEAztyaPxWhi41DNeoitUY9jB2MGR2ejM
 ZTZvxOf49MgWgq8SnE0NqqpEWawYtw8qJj2VX5P0lqnqqzDVNhU6FY1YN9qYunWg0Y6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uGz6ub0tyrhl62fRAM9pzJuAVWv4QkSa8sE258B78mI=; b=UHS7/5Khte+0YnCdjs/gRlxQd5
 wKDiQeTcrBPmaNsKrd/wDALi4Rv8oQdkPFe0s9MJ6Zat4+8BGGe/oxCjFE3fTiDqfnGzwq9r1lZGE
 knWjwmmTCaxHKvYopPhfpSBTGtz779mMR6dg77jZL2UA1u6MpWl/cn42RVd3pruYa3lU=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rmrb2-0007e6-Hi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Mar 2024 08:47:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710924413;
 bh=R1/+HaF4cG0WpYkql7KCqL1uI+mSGR4QJb8GzGhRh2s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zS2Kk3jfTvk3qzn3wJRM0w7ukFVVwDm8VQ+66By0s2V1eSoNj7yRIcepUn8OS9qtn
 AFIXJM7zgkpw8DM9aEMUjoTHmlIiaUn1FSc2/o3Y4BQbFI0tUv5usCC7XaKUb2Pagc
 3joFoipVte903quL2oy4f8u0svSbcjw93lkBWVumK0QAVYKRtWId+n/uISRXZsXhs8
 88LAuOIuj/HS2yhJ1znM7HlZZOsYTjB168l9D9axdFfJZ/gGwOraFO0arOCoPBn7Ll
 KSFlJhISum/B/hfQhviVpH53BIb3ZutsK0AOCICq5pT2Sg8swnE4WmeWXmPvaYPrue
 xoat+W3UTkQBA==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F98437820EE;
 Wed, 20 Mar 2024 08:46:51 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Wed, 20 Mar 2024 10:46:21 +0200
Message-Id: <20240320084622.46643-9-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240320084622.46643-1-eugen.hristev@collabora.com>
References: <20240320084622.46643-1-eugen.hristev@collabora.com>
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
 where possible, as requested by Torvalds. Signed-off-by: Gabriel Krisman
 Bertazi <krisman@collabora.com> [eugen.hristev@collabora.com: port to 6.8-rc3]
 Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com> ---
 fs/ext4/crypto.c | 19 +++-- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmrb2-0007e6-Hi
Subject: [f2fs-dev] [PATCH v14 8/9] ext4: Move CONFIG_UNICODE defguards into
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
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com,
 viro@zeniv.linux.org.uk, kernel@collabora.com,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Instead of a bunch of ifdefs, make the unicode built checks part of the
code flow where possible, as requested by Torvalds.

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
index 4061d11b9763..c68f48f706cd 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2740,8 +2740,25 @@ ext4_fsblk_t ext4_inode_to_goal_block(struct inode *);
 
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
@@ -2764,16 +2781,11 @@ static inline int ext4_fname_setup_filename(struct inode *dir,
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
@@ -2785,10 +2797,7 @@ static inline int ext4_fname_prepare_lookup(struct inode *dir,
 
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
index 3268cf45d9db..a5d9e5b01015 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1834,8 +1834,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		}
 	}
 
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (!inode && IS_CASEFOLDED(dir)) {
+	if (IS_ENABLED(CONFIG_UNICODE) && !inode && IS_CASEFOLDED(dir)) {
 		/* Eventually we want to call d_add_ci(dentry, NULL)
 		 * for negative dentries in the encoding case as
 		 * well.  For now, prevent the negative dentry
@@ -1843,7 +1842,7 @@ static struct dentry *ext4_lookup(struct inode *dir, struct dentry *dentry, unsi
 		 */
 		return NULL;
 	}
-#endif
+
 	return d_splice_alias(inode, dentry);
 }
 
@@ -3173,16 +3172,14 @@ static int ext4_rmdir(struct inode *dir, struct dentry *dentry)
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
@@ -3284,16 +3281,15 @@ static int ext4_unlink(struct inode *dir, struct dentry *dentry)
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
index 215b4614eb15..179083728b4b 100644
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
