Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A588082B762
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 23:59:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rO40u-0001qo-8g;
	Thu, 11 Jan 2024 22:59:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1rO40r-0001qi-ET
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=; b=QCn7Rt+EYX167mqMFk3ZvL62lS
 U37lJNevrSmnD7I7QCUGoak/9ELi+RXtpYzHCS9X3pRoKLiMsfz/IwnueeB3GoIv8+DinAILvsPgO
 l43yksjrTZwXdFAauMN7Eus+HDqH6IjR9oyDXJlOibGbecHUPkDh1cu+QuUJHbhcYXFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=; b=LMwIj/QoTzm1cdmiqlolTqwOew
 9ZAyen9IJegLzd0g8RA4Gf2ufH1pFU0BpcEupu1+GoP0cJbAbpe6/B1WTd8/yFJ9QY7hB8uHlIkat
 gwjgsGCI+PnlZ2KZWmOq/8H14DChXl4HcmVZS7xsO8wHoqwU6Rm8KUMipCFVuVp9iU3c=;
Received: from smtp-out2.suse.de ([195.135.223.131])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rO40m-0005wz-9g for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 22:59:01 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 574BC1FB69;
 Thu, 11 Jan 2024 22:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=;
 b=prJXXoapVansQQZSZbvjqyRzFzrwc+KDOrOKUgP9OwnHEFSsCEzhy8x6n+XY0JmKgOl22i
 h0+ETA78g6SqESx/0Wz3eJ9Xr+sou+iaoFCv8Pw/2lAqexJ9XEPx1fz2Hzn4TZeJa4MNfJ
 3BrvsMcuPIQA+xa/v7xHjbLq6Gi8cns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=;
 b=PJkK3BuVUTJnJxcSx+wCa3IUrIrFMj5fkHp1TOsNUQUtY2S0OEjgPeL3UWygGVBX6XEGbO
 hIUZZpZE77ioP3Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705013930; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=;
 b=prJXXoapVansQQZSZbvjqyRzFzrwc+KDOrOKUgP9OwnHEFSsCEzhy8x6n+XY0JmKgOl22i
 h0+ETA78g6SqESx/0Wz3eJ9Xr+sou+iaoFCv8Pw/2lAqexJ9XEPx1fz2Hzn4TZeJa4MNfJ
 3BrvsMcuPIQA+xa/v7xHjbLq6Gi8cns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705013930;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2QPSkguP3TJ/9OXXk7UjvrT0AFnjUupiXPinkoZssY=;
 b=PJkK3BuVUTJnJxcSx+wCa3IUrIrFMj5fkHp1TOsNUQUtY2S0OEjgPeL3UWygGVBX6XEGbO
 hIUZZpZE77ioP3Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D75E413946;
 Thu, 11 Jan 2024 22:58:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 469cJ6lyoGVaLwAAD6G6ig
 (envelope-from <krisman@suse.de>); Thu, 11 Jan 2024 22:58:49 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: viro@zeniv.linux.org.uk, ebiggers@kernel.org, jaegeuk@kernel.org,
 tytso@mit.edu
Date: Thu, 11 Jan 2024 19:58:08 -0300
Message-ID: <20240111225816.18117-3-krisman@suse.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240111225816.18117-1-krisman@suse.de>
References: <20240111225816.18117-1-krisman@suse.de>
MIME-Version: 1.0
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.70
X-Spamd-Result: default: False [0.70 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 TO_DN_SOME(0.00)[]; R_MISSING_CHARSET(2.50)[];
 BROKEN_CONTENT_TYPE(1.50)[]; RCVD_COUNT_THREE(0.00)[3];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; RCPT_COUNT_SEVEN(0.00)[9];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MID_CONTAINS_FROM(1.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[lists.sourceforge.net,vger.kernel.org,gmail.com,suse.de];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Right now, we have two functions that can be called by the
 filesystem during lookup to set up fscrypt internal state for the dentry
 and inode under lookup: 1) fscrypt_prepare_lookup_dentry_partial: used only
 by ceph. It sets encryption information in the inode and sets the dentry
 flag if the key is not available. 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.223.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rO40m-0005wz-9g
Subject: [f2fs-dev] [PATCH v3 02/10] fscrypt: Share code between functions
 that prepare lookup
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
Cc: linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@suse.de>,
 linux-ext4@vger.kernel.org, amir73il@gmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Right now, we have two functions that can be called by the filesystem
during lookup to set up fscrypt internal state for the dentry and
inode under lookup:

  1) fscrypt_prepare_lookup_dentry_partial: used only by ceph. It sets
  encryption information in the inode and sets the dentry flag if the
  key is not available.

  2) fscrypt_prepare_lookup: used by everything else. Does all the
  above, plus also sets struct fname.

This patch refactors the code to implement the later using the former.
This way, we'll have a single place where we set DCACHE_NOKEY_NAME, in
preparation to add more churn to that condition in the following patch.

To make the patch simpler, we now call fscrypt_get_encryption_info twice
for fscrypt_prepare_lookup, once inside fscrypt_setup_filename and once
inside fscrypt_prepare_lookup_dentry.  It seems safe to do, and
considering it will bail early in the second lookup and most lookups
should go to the dcache anyway, it doesn't seem problematic for
performance.  In addition, we add a function call for the unencrypted
case, also during lookup.

Apart from the above, it should have no behavior change.

I tested ext4/f2fs manually and with fstests, which yielded no regressions.

Signed-off-by: Gabriel Krisman Bertazi <krisman@suse.de>
---
 fs/ceph/dir.c           |  2 +-
 fs/ceph/file.c          |  2 +-
 fs/crypto/hooks.c       | 53 ++++++++++++++++++-----------------------
 include/linux/fscrypt.h | 40 +++++++++++++++++--------------
 4 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/fs/ceph/dir.c b/fs/ceph/dir.c
index 91709934c8b1..835421e2845d 100644
--- a/fs/ceph/dir.c
+++ b/fs/ceph/dir.c
@@ -813,7 +813,7 @@ static struct dentry *ceph_lookup(struct inode *dir, struct dentry *dentry,
 	if (IS_ENCRYPTED(dir)) {
 		bool had_key = fscrypt_has_encryption_key(dir);
 
-		err = fscrypt_prepare_lookup_partial(dir, dentry);
+		err = fscrypt_prepare_lookup_dentry(dir, dentry);
 		if (err < 0)
 			return ERR_PTR(err);
 
diff --git a/fs/ceph/file.c b/fs/ceph/file.c
index 3b5aae29e944..5c9206670533 100644
--- a/fs/ceph/file.c
+++ b/fs/ceph/file.c
@@ -812,7 +812,7 @@ int ceph_atomic_open(struct inode *dir, struct dentry *dentry,
 	ihold(dir);
 	if (IS_ENCRYPTED(dir)) {
 		set_bit(CEPH_MDS_R_FSCRYPT_FILE, &req->r_req_flags);
-		err = fscrypt_prepare_lookup_partial(dir, dentry);
+		err = fscrypt_prepare_lookup_dentry(dir, dentry);
 		if (err < 0)
 			goto out_req;
 	}
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index 52504dd478d3..41df986d1230 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -94,52 +94,45 @@ int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_rename);
 
-int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
-			     struct fscrypt_name *fname)
-{
-	int err = fscrypt_setup_filename(dir, &dentry->d_name, 1, fname);
-
-	if (err && err != -ENOENT)
-		return err;
-
-	if (fname->is_nokey_name) {
-		spin_lock(&dentry->d_lock);
-		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
-	}
-	return err;
-}
-EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);
-
 /**
- * fscrypt_prepare_lookup_partial() - prepare lookup without filename setup
+ * fscrypt_prepare_lookup_dentry() - prepare lookup without filename setup
  * @dir: the encrypted directory being searched
  * @dentry: the dentry being looked up in @dir
  *
- * This function should be used by the ->lookup and ->atomic_open methods of
- * filesystems that handle filename encryption and no-key name encoding
- * themselves and thus can't use fscrypt_prepare_lookup().  Like
- * fscrypt_prepare_lookup(), this will try to set up the directory's encryption
- * key and will set DCACHE_NOKEY_NAME on the dentry if the key is unavailable.
- * However, this function doesn't set up a struct fscrypt_name for the filename.
+ * This function should be used by the ->lookup and ->atomic_open
+ * methods of filesystems that handle filename encryption and no-key
+ * name encoding themselves and thus can't use fscrypt_prepare_lookup()
+ * directly.  This will try to set up the directory's encryption key and
+ * will set DCACHE_NOKEY_NAME on the dentry if the key is unavailable.
+ * However, this function doesn't set up a struct fscrypt_name for the
+ * filename.
  *
  * Return: 0 on success; -errno on error.  Note that the encryption key being
  *	   unavailable is not considered an error.  It is also not an error if
  *	   the encryption policy is unsupported by this kernel; that is treated
  *	   like the key being unavailable, so that files can still be deleted.
  */
-int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry)
+int fscrypt_prepare_lookup_dentry(struct inode *dir,
+				  struct dentry *dentry)
 {
-	int err = fscrypt_get_encryption_info(dir, true);
+	bool nokey_name = false;
+	int err = 0;
 
-	if (!err && !fscrypt_has_encryption_key(dir)) {
-		spin_lock(&dentry->d_lock);
+	if (IS_ENCRYPTED(dir)) {
+		err = fscrypt_get_encryption_info(dir, true);
+		if (!err && !fscrypt_has_encryption_key(dir))
+			nokey_name = true;
+	}
+
+	spin_lock(&dentry->d_lock);
+	if (nokey_name) {
 		dentry->d_flags |= DCACHE_NOKEY_NAME;
-		spin_unlock(&dentry->d_lock);
 	}
+	spin_unlock(&dentry->d_lock);
+
 	return err;
 }
-EXPORT_SYMBOL_GPL(fscrypt_prepare_lookup_partial);
+EXPORT_SYMBOL_GPL(fscrypt_prepare_lookup_dentry);
 
 int __fscrypt_prepare_readdir(struct inode *dir)
 {
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 12f9e455d569..3801c5c94fb6 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -382,9 +382,7 @@ int __fscrypt_prepare_link(struct inode *inode, struct inode *dir,
 int __fscrypt_prepare_rename(struct inode *old_dir, struct dentry *old_dentry,
 			     struct inode *new_dir, struct dentry *new_dentry,
 			     unsigned int flags);
-int __fscrypt_prepare_lookup(struct inode *dir, struct dentry *dentry,
-			     struct fscrypt_name *fname);
-int fscrypt_prepare_lookup_partial(struct inode *dir, struct dentry *dentry);
+int fscrypt_prepare_lookup_dentry(struct inode *dir, struct dentry *dentry);
 int __fscrypt_prepare_readdir(struct inode *dir);
 int __fscrypt_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 int fscrypt_prepare_setflags(struct inode *inode,
@@ -704,14 +702,7 @@ static inline int __fscrypt_prepare_rename(struct inode *old_dir,
 	return -EOPNOTSUPP;
 }
 
-static inline int __fscrypt_prepare_lookup(struct inode *dir,
-					   struct dentry *dentry,
-					   struct fscrypt_name *fname)
-{
-	return -EOPNOTSUPP;
-}
-
-static inline int fscrypt_prepare_lookup_partial(struct inode *dir,
+static inline int fscrypt_prepare_lookup_dentry(struct inode *dir,
 						 struct dentry *dentry)
 {
 	return -EOPNOTSUPP;
@@ -975,14 +966,27 @@ static inline int fscrypt_prepare_lookup(struct inode *dir,
 					 struct dentry *dentry,
 					 struct fscrypt_name *fname)
 {
-	if (IS_ENCRYPTED(dir))
-		return __fscrypt_prepare_lookup(dir, dentry, fname);
+	int ret, err = 0;
+
+	if (IS_ENCRYPTED(dir)) {
+		err = fscrypt_setup_filename(dir, &dentry->d_name, 1, fname);
+		if (err && err != -ENOENT)
+			return err;
+	} else {
+		memset(fname, 0, sizeof(*fname));
+		fname->usr_fname = &dentry->d_name;
+		fname->disk_name.name = (unsigned char *)dentry->d_name.name;
+		fname->disk_name.len = dentry->d_name.len;
+	}
 
-	memset(fname, 0, sizeof(*fname));
-	fname->usr_fname = &dentry->d_name;
-	fname->disk_name.name = (unsigned char *)dentry->d_name.name;
-	fname->disk_name.len = dentry->d_name.len;
-	return 0;
+	/*
+	 * fscrypt_prepare_lookup_dentry will succeed even if the
+	 * directory key is unavailable but the filename isn't a valid
+	 * no-key name (-ENOENT). Thus, propagate the previous
+	 * error, if any.
+	 */
+	ret = fscrypt_prepare_lookup_dentry(dir, dentry);
+	return err ? err : ret;
 }
 
 /**
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
