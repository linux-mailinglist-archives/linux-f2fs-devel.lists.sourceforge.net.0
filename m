Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4428310F760
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:37:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A+5Boi9r/ScB6+BPykEnSro25IH5iG0E9g7kjc5c3m8=; b=ZDbwlb3uu3s8tDTjbfFl2gEzW
	bxE4fHeVFgxie+XtZg71+UxEImGECr//bgx3cTTvMYtMp1dZdts7r3jvJv+rOZFUGpEd6tIsQpZif
	ZYdHSLjSx+X9ocwsNAsBz2TMwdNuqWn9vemRYH2FOvh6dzMEE9EtjGVKN4aiAuDeWQKtg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0rz-00012Z-3l; Tue, 03 Dec 2019 05:37:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3gu7lXQYKAOsQebfRaTbbTYR.PbZ@flex--drosen.bounces.google.com>)
 id 1ic0ry-00012O-AU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X8XWw+Y8uchsia3FAe+I/uTU/LaChMWb6jtx0p+dIuo=; b=SE4YzjAhaYQEJWFpQ2x4F8jpw
 c6faRokQbWFGcQ2B5w+KJ+N0OBRuuIHDGJ1ir94XX9BNh1tyTaJnfTB9oO/WIQ83hVicZ0VKw7jnt
 3b1B6dTmnxNR92FEunLNQN+r1SommF/EGDylS/0JjxTgYfUDzz72+GIvi64qFLwIfc6ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X8XWw+Y8uchsia3FAe+I/uTU/LaChMWb6jtx0p+dIuo=; b=VTJ+CLeCQa4K7Xa4J2nKyO7mwr
 nDIrtY/5GwAVe26ZDRMvalIpYg/9VoEqZvjmu6azHq04GJndgwuHtHtU/YvbtaRhZNBuzCk+6adt8
 Jzvs4VuW4xojxaEYaUwMHL2+nKd3ilIbUIBVGQhcVMdramM7o4xw/5W2EJ+XUhnQnQ4Y=;
Received: from mail-io1-f73.google.com ([209.85.166.73])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0ru-005VCb-LV
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:37:06 +0000
Received: by mail-io1-f73.google.com with SMTP id a13so1657034iol.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=X8XWw+Y8uchsia3FAe+I/uTU/LaChMWb6jtx0p+dIuo=;
 b=fI7GXMVDEMsaYoQnHbY1FDEdanHfg6yxmvIajzQqfkmELIeeTDU24cUNKIgu7ixk1B
 W1cMbVVzHeNvdM4xipShTAhXiPW35UbQKmnIWmjIkNnic1tcxMDZPBj1h0nxkinOfhP6
 tNaNzXB2WXYBCyJHQGXXfdEJJbjX+s4BPR3jIVVyxvG3IOc9Kkf/X2nMRoaxx86xjQTF
 Vkx0hbbwVgdUqrCM7HkUDWh9UYikaRSMngR98kyIj3stE6Nd6/wvvh1fs0MQ5nlKeYJ8
 bWLH0vQATgCpv9wObuSbWBRBr4ByiZ0iq4r5mVcFRxLnGvj0QPnT8aJ+NDY1M4ynYa6q
 fMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=X8XWw+Y8uchsia3FAe+I/uTU/LaChMWb6jtx0p+dIuo=;
 b=B++KRTPqPDq3rILZp4PugkDdukZtTNsyH1UnW/QBvOI0r9hGOdqLgIVRojuMnjIFfY
 dcvlDewcng9PNFUTyBfRcCryj5c0H0fN3O0LTOPk4+JxNRpmELulrg1LMbIntiJzeWRf
 Ibsoyo/3xpjg5tVHCPpjQYzTpCOuVYT7Ut/GgUZ6Jh2o7Xn2L/Z7kj3Ew1SCEtPgDEpl
 x1NNdEE+tfcrFERysL49snippKLV4TUbF+XxFnzt9PhiPCRKaSkhZ1lDXZxqA9YUK6nr
 2u9Cj5GKAyQS4kD637kNyZQ722DquTTWFouHlb6DsqC79GQFayXtc2Qn7p1fofoVaDVk
 9+RQ==
X-Gm-Message-State: APjAAAWedBilql678SrQkAG90nB+QKBv9k/Ax24B0pnmt8GuHKlDXK+w
 V4mvRPJeMfyeMvQ8jsL2jJ+/b187tbc=
X-Google-Smtp-Source: APXvYqz9zhR2TN2hqnywLAJcvdaujxv2NBjvcQ3xFrMjaX2DWsWnJb7rF+xpTP913IfCGgciFOBrtYR2Lq4=
X-Received: by 2002:a63:fd48:: with SMTP id m8mr3498900pgj.76.1575349890731;
 Mon, 02 Dec 2019 21:11:30 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:46 -0800
In-Reply-To: <20191203051049.44573-1-drosen@google.com>
Message-Id: <20191203051049.44573-6-drosen@google.com>
Mime-Version: 1.0
References: <20191203051049.44573-1-drosen@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: decrypted.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.73 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic0ru-005VCb-LV
Subject: [f2fs-dev] [PATCH 5/8] f2fs: Handle casefolding with Encryption
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Daniel Rosenberg <drosen@google.com>, linux-doc@vger.kernel.org,
 kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This expands f2fs's casefolding support to include encrypted
directories. For encrypted directories, we use the siphash of the
casefolded name. This ensures there is no direct way to go from an
unencrypted name to the stored hash on disk without knowledge of the
encryption policy keys.

Additionally, we switch to using the vfs layer's casefolding support
instead of storing this information inside of f2fs's private data.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/dir.c    | 115 +++++++++++++++++++----------------------------
 fs/f2fs/f2fs.h   |  14 +++---
 fs/f2fs/hash.c   |  25 +++++++----
 fs/f2fs/inline.c |   9 ++--
 fs/f2fs/super.c  |  17 +++----
 fs/f2fs/sysfs.c  |   8 ++--
 6 files changed, 81 insertions(+), 107 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index c967cacf979e..1cc2995fee84 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -111,31 +111,50 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
  * Returns: 0 if the directory entry matches, more than 0 if it
  * doesn't match or less than zero on error.
  */
-int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
-				const struct qstr *entry, bool quick)
+int f2fs_ci_compare(struct inode *parent, const struct qstr *name,
+		    unsigned char *name2, size_t len, bool quick)
 {
 	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct unicode_map *um = sbi->sb->s_encoding;
+	const struct fscrypt_str crypt_entry = FSTR_INIT(name2, len);
+	struct fscrypt_str decrypted_entry;
+	struct qstr decrypted;
+	struct qstr entry = QSTR_INIT(name2, len);
 	int ret;
 
+	decrypted_entry.name = NULL;
+
+	if (IS_ENCRYPTED(parent) && fscrypt_has_encryption_key(parent)) {
+		decrypted_entry.name = kmalloc(len, GFP_ATOMIC);
+		decrypted.name = decrypted_entry.name;
+		decrypted_entry.len = len;
+		decrypted.len = len;
+		if (!decrypted.name)
+			return -ENOMEM;
+		fscrypt_fname_disk_to_usr(parent, 0, 0, &crypt_entry,
+							&decrypted_entry);
+	}
+
 	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, entry);
+		ret = utf8_strncasecmp_folded(um, name, decrypted_entry.name ?
+							&decrypted : &entry);
 	else
-		ret = utf8_strncasecmp(um, name, entry);
-
+		ret = utf8_strncasecmp(um, name, decrypted_entry.name ?
+							&decrypted : &entry);
 	if (ret < 0) {
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (f2fs_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sbi->sb))
 			return -EINVAL;
 
-		if (name->len != entry->len)
+		if (name->len != len)
 			return 1;
 
-		return !!memcmp(name->name, entry->name, name->len);
+		ret = !!memcmp(name->name,
+				decrypted_entry.name ?: name2, name->len);
 	}
-
+	kfree(decrypted_entry.name);
 	return ret;
 }
 
@@ -154,7 +173,7 @@ static void f2fs_fname_setup_ci_filename(struct inode *dir,
 	if (!cf_name->name)
 		return;
 
-	cf_name->len = utf8_casefold(sbi->s_encoding,
+	cf_name->len = utf8_casefold(dir->i_sb->s_encoding,
 					iname, cf_name->name,
 					F2FS_NAME_LEN);
 	if ((int)cf_name->len <= 0) {
@@ -173,24 +192,25 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 {
 #ifdef CONFIG_UNICODE
 	struct inode *parent = d->inode;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(parent);
-	struct qstr entry;
+	struct super_block *sb = parent->i_sb;
+	unsigned char *name;
+	int len;
 #endif
 
 	if (de->hash_code != namehash)
 		return false;
 
 #ifdef CONFIG_UNICODE
-	entry.name = d->filename[bit_pos];
-	entry.len = de->name_len;
+	name = d->filename[bit_pos];
+	len = de->name_len;
 
-	if (sbi->s_encoding && IS_CASEFOLDED(parent)) {
+	if (sb->s_encoding && needs_casefold(parent)) {
 		if (cf_str->name) {
 			struct qstr cf = {.name = cf_str->name,
 					  .len = cf_str->len};
-			return !f2fs_ci_compare(parent, &cf, &entry, true);
+			return !f2fs_ci_compare(parent, &cf, name, len, true);
 		}
-		return !f2fs_ci_compare(parent, fname->usr_fname, &entry,
+		return !f2fs_ci_compare(parent, fname->usr_fname, name, len,
 					false);
 	}
 #endif
@@ -357,8 +377,8 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 	int err;
 
 #ifdef CONFIG_UNICODE
-	if (f2fs_has_strict_mode(F2FS_I_SB(dir)) && IS_CASEFOLDED(dir) &&
-			utf8_validate(F2FS_I_SB(dir)->s_encoding, child)) {
+	if (sb_has_enc_strict_mode(dir->i_sb) && IS_CASEFOLDED(dir) &&
+			utf8_validate(dir->i_sb->s_encoding, child)) {
 		*res_page = ERR_PTR(-EINVAL);
 		return NULL;
 	}
@@ -602,13 +622,13 @@ void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
 
 int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 				const struct qstr *orig_name,
+				f2fs_hash_t dentry_hash,
 				struct inode *inode, nid_t ino, umode_t mode)
 {
 	unsigned int bit_pos;
 	unsigned int level;
 	unsigned int current_depth;
 	unsigned long bidx, block;
-	f2fs_hash_t dentry_hash;
 	unsigned int nbucket, nblock;
 	struct page *dentry_page = NULL;
 	struct f2fs_dentry_block *dentry_blk = NULL;
@@ -618,7 +638,6 @@ int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
 
 	level = 0;
 	slots = GET_DENTRY_SLOTS(new_name->len);
-	dentry_hash = f2fs_dentry_hash(dir, new_name, NULL);
 
 	current_depth = F2FS_I(dir)->i_current_depth;
 	if (F2FS_I(dir)->chash == dentry_hash) {
@@ -704,17 +723,19 @@ int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
 				struct inode *inode, nid_t ino, umode_t mode)
 {
 	struct qstr new_name;
+	f2fs_hash_t dentry_hash;
 	int err = -EAGAIN;
 
 	new_name.name = fname_name(fname);
 	new_name.len = fname_len(fname);
 
 	if (f2fs_has_inline_dentry(dir))
-		err = f2fs_add_inline_entry(dir, &new_name, fname->usr_fname,
+		err = f2fs_add_inline_entry(dir, &new_name, fname,
 							inode, ino, mode);
+	dentry_hash = f2fs_dentry_hash(dir, &new_name, fname);
 	if (err == -EAGAIN)
 		err = f2fs_add_regular_entry(dir, &new_name, fname->usr_fname,
-							inode, ino, mode);
+						dentry_hash, inode, ino, mode);
 
 	f2fs_update_time(F2FS_I_SB(dir), REQ_TIME);
 	return err;
@@ -1064,49 +1085,3 @@ const struct file_operations f2fs_dir_operations = {
 #endif
 };
 
-#ifdef CONFIG_UNICODE
-static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-
-	if (!IS_CASEFOLDED(dentry->d_parent->d_inode)) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name, len);
-	}
-
-	return f2fs_ci_compare(dentry->d_parent->d_inode, name, &qstr, false);
-}
-
-static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!IS_CASEFOLDED(dentry->d_inode))
-		return 0;
-
-	norm = f2fs_kmalloc(sbi, PATH_MAX, GFP_ATOMIC);
-	if (!norm)
-		return -ENOMEM;
-
-	len = utf8_casefold(um, str, norm, PATH_MAX);
-	if (len < 0) {
-		if (f2fs_has_strict_mode(sbi))
-			ret = -EINVAL;
-		goto out;
-	}
-	str->hash = full_name_hash(dentry, norm, len);
-out:
-	kvfree(norm);
-	return ret;
-}
-
-const struct dentry_operations f2fs_dentry_ops = {
-	.d_hash = f2fs_d_hash,
-	.d_compare = f2fs_d_compare,
-};
-#endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f..a4864ed76dd8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1184,10 +1184,6 @@ struct f2fs_sb_info {
 	int valid_super_block;			/* valid super block no */
 	unsigned long s_flag;				/* flags for sbi */
 	struct mutex writepages;		/* mutex for writepages() */
-#ifdef CONFIG_UNICODE
-	struct unicode_map *s_encoding;
-	__u16 s_encoding_flags;
-#endif
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
@@ -2969,9 +2965,9 @@ int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set);
 struct dentry *f2fs_get_parent(struct dentry *child);
 
-extern int f2fs_ci_compare(const struct inode *parent,
+extern int f2fs_ci_compare(struct inode *parent,
 			   const struct qstr *name,
-			   const struct qstr *entry,
+			   unsigned char *name2, size_t len,
 			   bool quick);
 
 /*
@@ -3005,7 +3001,7 @@ void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
 			const struct qstr *name, f2fs_hash_t name_hash,
 			unsigned int bit_pos);
 int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+			const struct qstr *orig_name, f2fs_hash_t dentry_hash,
 			struct inode *inode, nid_t ino, umode_t mode);
 int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
@@ -3038,7 +3034,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
  * hash.c
  */
 f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname);
+		const struct qstr *name_info, const struct fscrypt_name *fname);
 
 /*
  * node.c
@@ -3517,7 +3513,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct page *ipage);
 int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+			const struct fscrypt_name *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
 				struct page *page, struct inode *dir,
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 5bc4dcd8fc03..954d03dee450 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -68,8 +68,9 @@ static void str2hashbuf(const unsigned char *msg, size_t len,
 		*buf++ = pad;
 }
 
-static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
-				struct fscrypt_name *fname)
+static f2fs_hash_t __f2fs_dentry_hash(const struct inode *dir,
+				const struct qstr *name_info,
+				const struct fscrypt_name *fname)
 {
 	__u32 hash;
 	f2fs_hash_t f2fs_hash;
@@ -85,6 +86,11 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 	if (is_dot_dotdot(name_info))
 		return 0;
 
+	if (IS_CASEFOLDED(dir) && IS_ENCRYPTED(dir)) {
+		f2fs_hash = fscrypt_fname_siphash(dir, name_info);
+		return f2fs_hash;
+	}
+
 	/* Initialize the default seed for the hash checksum functions */
 	buf[0] = 0x67452301;
 	buf[1] = 0xefcdab89;
@@ -106,35 +112,38 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 }
 
 f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname)
+		const struct qstr *name_info, const struct fscrypt_name *fname)
 {
 #ifdef CONFIG_UNICODE
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct unicode_map *um = sbi->sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr folded;
+	const struct qstr *name = fname ? fname->usr_fname : name_info;
 
 	if (!name_info->len || !IS_CASEFOLDED(dir))
 		goto opaque_seq;
 
+	if (IS_ENCRYPTED(dir) && !fscrypt_has_encryption_key(dir))
+		goto opaque_seq;
+
 	buff = f2fs_kzalloc(sbi, sizeof(char) * PATH_MAX, GFP_KERNEL);
 	if (!buff)
 		return -ENOMEM;
-
-	dlen = utf8_casefold(um, name_info, buff, PATH_MAX);
+	dlen = utf8_casefold(um, name, buff, PATH_MAX);
 	if (dlen < 0) {
 		kvfree(buff);
 		goto opaque_seq;
 	}
 	folded.name = buff;
 	folded.len = dlen;
-	r = __f2fs_dentry_hash(&folded, fname);
+	r = __f2fs_dentry_hash(dir, &folded, fname);
 
 	kvfree(buff);
 	return r;
 
 opaque_seq:
 #endif
-	return __f2fs_dentry_hash(name_info, fname);
+	return __f2fs_dentry_hash(dir, name_info, fname);
 }
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 896db0416f0e..3c3772094153 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -465,8 +465,8 @@ static int f2fs_add_inline_entries(struct inode *dir, void *inline_dentry)
 		ino = le32_to_cpu(de->ino);
 		fake_mode = f2fs_get_de_type(de) << S_SHIFT;
 
-		err = f2fs_add_regular_entry(dir, &new_name, NULL, NULL,
-							ino, fake_mode);
+		err = f2fs_add_regular_entry(dir, &new_name, NULL,
+					de->hash_code, NULL, ino, fake_mode);
 		if (err)
 			goto punch_dentry_pages;
 
@@ -540,7 +540,7 @@ static int f2fs_convert_inline_dir(struct inode *dir, struct page *ipage,
 }
 
 int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
-				const struct qstr *orig_name,
+				const struct fscrypt_name *fname,
 				struct inode *inode, nid_t ino, umode_t mode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
@@ -551,6 +551,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 	struct f2fs_dentry_ptr d;
 	int slots = GET_DENTRY_SLOTS(new_name->len);
 	struct page *page = NULL;
+	const struct qstr *orig_name = fname->usr_fname;
 	int err = 0;
 
 	ipage = f2fs_get_node_page(sbi, dir->i_ino);
@@ -581,7 +582,7 @@ int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
 
 	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
 
-	name_hash = f2fs_dentry_hash(dir, new_name, NULL);
+	name_hash = f2fs_dentry_hash(dir, new_name, fname);
 	f2fs_update_dentry(ino, mode, &d, new_name, name_hash, bit_pos);
 
 	set_page_dirty(ipage);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5111e1ffe58a..5e4e76332c4c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1144,7 +1144,7 @@ static void f2fs_put_super(struct super_block *sb)
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sbi->sb->s_encoding);
 #endif
 	kvfree(sbi);
 }
@@ -3136,17 +3136,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 {
 #ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+	if (f2fs_sb_has_casefold(sbi) && !sbi->sb->s_encoding) {
 		const struct f2fs_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
 
-		if (f2fs_sb_has_encrypt(sbi)) {
-			f2fs_err(sbi,
-				"Can't mount with encoding and encryption");
-			return -EINVAL;
-		}
-
 		if (f2fs_sb_read_encoding(sbi->raw_super, &encoding_info,
 					  &encoding_flags)) {
 			f2fs_err(sbi,
@@ -3167,9 +3161,8 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
-		sbi->sb->s_d_op = &f2fs_dentry_ops;
+		sbi->sb->s_encoding = encoding;
+		sbi->sb->s_encoding_flags = encoding_flags;
 	}
 #else
 	if (f2fs_sb_has_casefold(sbi)) {
@@ -3637,7 +3630,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kvfree(sbi->write_io[i]);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sbi->sb->s_encoding);
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 70945ceb9c0c..7fd37c8c9733 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -88,10 +88,10 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 #ifdef CONFIG_UNICODE
 	if (f2fs_sb_has_casefold(sbi))
 		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sbi->s_encoding->charset,
-			(sbi->s_encoding->version >> 16) & 0xff,
-			(sbi->s_encoding->version >> 8) & 0xff,
-			sbi->s_encoding->version & 0xff);
+			sbi->sb->s_encoding->charset,
+			(sbi->sb->s_encoding->version >> 16) & 0xff,
+			(sbi->sb->s_encoding->version >> 8) & 0xff,
+			sbi->sb->s_encoding->version & 0xff);
 #endif
 	return snprintf(buf, PAGE_SIZE, "(none)");
 }
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
