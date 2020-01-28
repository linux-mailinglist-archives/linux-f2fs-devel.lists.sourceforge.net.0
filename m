Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8563914C33F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 00:04:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IRRn3+P5p3N2EFqIRVMrkbPdx6/qsEUOzSI4fye7ITM=; b=ZeR0ZxDIFAyS5PWzOHnKxzv6O
	Ql9XzDG/yu16bKza8FWc0OWJw1ufS8ts/gSyAzyJL/3jAaiSU32otRfYI3lI+vXs30pItZiXSEzsK
	eVd/x6xcsSo//saGpTRqe0l1KscyNsHKVcmeNjmnuHd9sSKSk6z0HKmRqKJZxw/6kXgc8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwZuQ-0002xr-Io; Tue, 28 Jan 2020 23:04:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3_b0wXgYKADQTheiUdWeeWbU.Sec@flex--drosen.bounces.google.com>)
 id 1iwZuP-0002xj-I6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cg+p28p3lmv7E3eB3YMTQU8uH+tVKE4bLGkbNnqxRPo=; b=OEUxg1rACWYX3l07NoEygTvKc
 IJe3aX8W4GOyUHqHUzEOtfBvfjbPFs2kVAzSIS3n44m1LNEr5L9x6tXEySCrpzga2m5/Cf1BZxi7l
 5NLtLVndbRTD+hB2jxS5rOjpyOBlBKVmmxscPSq2J1GCdJn06iV1GRXpnMnRVS1nyj4JQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cg+p28p3lmv7E3eB3YMTQU8uH+tVKE4bLGkbNnqxRPo=; b=NU4TMwxxzFqMjWp2koq6LV06ko
 F8WQnizfeFYQwGYxWYWahfOyYf8Bs0GmXa3namTGZ3kNsp2WugTIzvn08l4/fLhdAAoZWT99bEQDP
 4aJUAYcISonQ3t2JCRYIx5XUYrBz6KYMu8Qe8lDIGgqJ37pdLd/uZjbwBXo+Q8ofmkOA=;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iwZuN-008fmT-QO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:04:37 +0000
Received: by mail-yb1-f201.google.com with SMTP id g11so11403087ybc.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jan 2020 15:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cg+p28p3lmv7E3eB3YMTQU8uH+tVKE4bLGkbNnqxRPo=;
 b=VRJiaQW//BdQYFnedTlOgNj1yBpfjG7GgonD2chym1o/iC6kp9Yfseqf6odk1EnXKR
 rlXNLkLN23E8B96K7QMTs1rSRTfvhDqAuXtoFnztLkJpdAQf/EdVgsYMmwb0u0glntvE
 EvHFjBf2jmgLlF2oEHZQZQ97/Js+bU01ra+zwcpKlTgf3fnEufzQw+Lb+VkuXOWE0e5X
 QZyBx52kybEpkW0C9tAAK9EsuKoo82Dko6nFcra3Zbyc/NyzPrvLXBRU2hFKtU7xO0lt
 ocs19NcGagSdhb7QVJqCInoDQPdGMvSFcMRAtgtwoU0tYyFIn1fhso+arJIqusdkp1AD
 2flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cg+p28p3lmv7E3eB3YMTQU8uH+tVKE4bLGkbNnqxRPo=;
 b=Ja6ssynl0IZypNb8gnCG7tz3HP0SfJXtVbbcCuIb9xwgZUAkj+O/4jN2Ym2phtRc8l
 pQtZI074PDpNEr/NC34HMPTeOQy3p9Wq7BrYzwEByVeAjsGGktV57DRq8ya96B1fILY9
 MK5JdRFaMqjlSXd0kxwPUHkcUkzcm8pJWNEiXekUhvUnLqvJABYNFNB2ja2uTaPIrKWi
 472Ov0UFq1t1lq7JihAaZ/yAmOsT1HIXc8K3g6RfWPoLjOrEy16HAvky/qcWvMb3f8Md
 cW+crQFo7U3IrcXOCLrlE/EzFEPUOOHbEO5K4JKBzWlPnp00YG06VO7LaYLw1jExkI3W
 NK5w==
X-Gm-Message-State: APjAAAUttJGdsoqN4t20GB266a89q7ejERBERtSNN25xGwy0LR+h6yU6
 g319DlhGvwnVjpa3/RHFLDLoNP/1J4c=
X-Google-Smtp-Source: APXvYqwpW0Tpk462JzA9CZtA0KStwBPFB3Mas6/mtMAvRgvlymwW+SDBo7MDXCzegAjl5OLfyGvUBhRH/q4=
X-Received: by 2002:a81:a190:: with SMTP id
 y138mr17051836ywg.343.1580252669634; 
 Tue, 28 Jan 2020 15:04:29 -0800 (PST)
Date: Tue, 28 Jan 2020 15:03:26 -0800
In-Reply-To: <20200128230328.183524-1-drosen@google.com>
Message-Id: <20200128230328.183524-4-drosen@google.com>
Mime-Version: 1.0
References: <20200128230328.183524-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: folded.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.201 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iwZuN-008fmT-QO
Subject: [f2fs-dev] [PATCH v6 3/5] f2fs: Handle casefolding with Encryption
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
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
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
 fs/f2fs/dir.c    | 65 ++++++++++++++++++++++++++++++++----------------
 fs/f2fs/f2fs.h   |  8 +++---
 fs/f2fs/hash.c   | 23 +++++++++++------
 fs/f2fs/inline.c |  9 ++++---
 fs/f2fs/super.c  |  6 -----
 5 files changed, 68 insertions(+), 43 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index f1e7dc4ae5256..70daae4a16ed8 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -112,30 +112,50 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
  * doesn't match or less than zero on error.
  */
 int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
-				const struct qstr *entry, bool quick)
+		    unsigned char *name2, size_t len, bool quick)
 {
 	const struct super_block *sb = parent->i_sb;
 	const struct unicode_map *um = sb->s_encoding;
+	const struct fscrypt_str crypt_entry = FSTR_INIT(name2, len);
+	struct fscrypt_str decrypted_entry;
+	struct qstr decrypted;
+	struct qstr entry = QSTR_INIT(name2, len);
+	struct qstr *tocheck;
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
+		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &crypt_entry,
+							&decrypted_entry);
+		if (ret < 0)
+			goto out;
+	}
+	tocheck = decrypted_entry.name ? &decrypted : &entry;
+
 	if (quick)
-		ret = utf8_strncasecmp_folded(um, name, entry);
+		ret = utf8_strncasecmp_folded(um, name, tocheck);
 	else
-		ret = utf8_strncasecmp(um, name, entry);
-
+		ret = utf8_strncasecmp(um, name, tocheck);
 	if (ret < 0) {
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
 		if (sb_has_enc_strict_mode(sb))
-			return -EINVAL;
-
-		if (name->len != entry->len)
-			return 1;
-
-		return !!memcmp(name->name, entry->name, name->len);
+			ret = -EINVAL;
+		else if (name->len != len)
+			ret = 1;
+		else
+			ret = !!memcmp(name->name, tocheck->name, len);
 	}
-
+out:
+	kfree(decrypted_entry.name);
 	return ret;
 }
 
@@ -173,24 +193,24 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 {
 #ifdef CONFIG_UNICODE
 	struct inode *parent = d->inode;
-	struct super_block *sb = parent->i_sb;
-	struct qstr entry;
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
 
-	if (sb->s_encoding && IS_CASEFOLDED(parent)) {
+	if (needs_casefold(parent)) {
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
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cc767dd4d5352..1d5d9df20cc67 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2967,7 +2967,7 @@ struct dentry *f2fs_get_parent(struct dentry *child);
 
 extern int f2fs_ci_compare(const struct inode *parent,
 			   const struct qstr *name,
-			   const struct qstr *entry,
+			   unsigned char *name2, size_t len,
 			   bool quick);
 
 /*
@@ -3001,7 +3001,7 @@ void f2fs_update_dentry(nid_t ino, umode_t mode, struct f2fs_dentry_ptr *d,
 			const struct qstr *name, f2fs_hash_t name_hash,
 			unsigned int bit_pos);
 int f2fs_add_regular_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+			const struct qstr *orig_name, f2fs_hash_t dentry_hash,
 			struct inode *inode, nid_t ino, umode_t mode);
 int f2fs_add_dentry(struct inode *dir, struct fscrypt_name *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
@@ -3035,7 +3035,7 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
  * hash.c
  */
 f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname);
+		const struct qstr *name_info, const struct fscrypt_name *fname);
 
 /*
  * node.c
@@ -3511,7 +3511,7 @@ struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 int f2fs_make_empty_inline_dir(struct inode *inode, struct inode *parent,
 			struct page *ipage);
 int f2fs_add_inline_entry(struct inode *dir, const struct qstr *new_name,
-			const struct qstr *orig_name,
+			const struct fscrypt_name *fname,
 			struct inode *inode, nid_t ino, umode_t mode);
 void f2fs_delete_inline_entry(struct f2fs_dir_entry *dentry,
 				struct page *page, struct inode *dir,
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 28acb24e7a7a8..6d7ddf2fd308f 100644
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
@@ -106,7 +112,7 @@ static f2fs_hash_t __f2fs_dentry_hash(const struct qstr *name_info,
 }
 
 f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
-		const struct qstr *name_info, struct fscrypt_name *fname)
+		const struct qstr *name_info, const struct fscrypt_name *fname)
 {
 #ifdef CONFIG_UNICODE
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
@@ -114,27 +120,30 @@ f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
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
index 896db0416f0e6..3c37720941539 100644
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
index 0f7ef0896655a..2c6efff50d1c1 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3141,12 +3141,6 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
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
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
