Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808814C36F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jan 2020 00:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQlhAVolDLbQMl30YA3pumkc2dDFQ851mn56kC9M70k=; b=N7yyOUBpBy0zEG8pCde7gqjio
	Jwbbj2ltqUYpbWKcRp3yaf4lko2kcJ/QCz6pRNA81eGAbZGGw54flWsb4ERPTKNtsn5ls7Zf13ySV
	2ug41GNkftH3129QihULcSVo/nhVB45uxWSthlPgEBC70hP/Cf5RCOfwND/L/gxdPMpx0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iwa1h-0006JE-N2; Tue, 28 Jan 2020 23:12:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3-L0wXgYKAC8OcZdPYRZZRWP.NZX@flex--drosen.bounces.google.com>)
 id 1iwa1f-0006Iu-7A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pINL0HO+nJObZ5TbcW6esU1PR8RvkfGKC5Yq2whqHX0=; b=l2pmtlkk02+uXNTO56pbewdmO
 5c1peqlDLpfZDDIajV+M8ecudQ79E0xwEyrPQoBRt7R4dADMq769sb9/x1CqIZOoGTZs9f+2uEkiK
 efrrAZMmN+aCz/DFm8fHUo1IDf+H2G8TzR4PJwQXZ7en1lM7p5uO9keIVauSMOEQeH60M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pINL0HO+nJObZ5TbcW6esU1PR8RvkfGKC5Yq2whqHX0=; b=exiItFTs3mlfmTez1XI2n+9Rd8
 Q42802M5YaQhVkywxphPiLRsjgOvu8meunYNho4hu5gax/tlrJsfYfSFg6wRQ4pZCclS3evnKWvDS
 90gfEtELVSclxraxM93FSK7IdPsriQzMCR56/wDd5WH+qlpuMPVsK5OWxLhR7hKefxQI=;
Received: from mail-pg1-f202.google.com ([209.85.215.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iwa1d-008g7w-9S
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 28 Jan 2020 23:12:07 +0000
Received: by mail-pg1-f202.google.com with SMTP id o21so9558841pgm.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 28 Jan 2020 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=pINL0HO+nJObZ5TbcW6esU1PR8RvkfGKC5Yq2whqHX0=;
 b=AoFeMGTRwbbGCx6v824jnS6htYaziypb1tNQAiqBtoVTlaZleykYenVrP2JnDfuVcY
 OxG5//g6Wl4Kq9uJ8mfxdTDF7gZw0Bh5yAJxtRCL0Y69Z4y8z4BAhi7WwJXh0u/cfgWc
 deHWpDZ4UuAKD+MHgGUKxSaB8CvoRnPHoW8BqeS4j9a6RpYtsl198u6RJ+kTQ7T77mWI
 6ZxhyNP/glTPR66QRsTwhIxJ55PXGKEzEXXVno93O/wsznFs5W30mbRc7ovBO82L9TeV
 PURODZtKNm89Ml+io61tluZ1FJsirLE5SIhHUtA6Ob3rl8lyNDzoqMFbNmrBNHrO4sph
 ckag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=pINL0HO+nJObZ5TbcW6esU1PR8RvkfGKC5Yq2whqHX0=;
 b=Riu23TbWF2592poDan6SnY0KMjFpebw8cq44cHaClkiO7nVYl7H/UzgEylU6Z9ESne
 dlkTkUiyUSl0z5VOSASsxOjfZx1eY9v5Lu15CanzFOkTCbL6/WDLwpvoMsQSLDGYR4KL
 CslTlttgVTlS88ScNeKhL5ScAFaiCQQ3apPxTUyZVggjnN5AqBkChs+Rg3ypwvXaz+q7
 mup5elVWosAT8XmoBazKK/sNeTy1sEaqO+4B08D9S089MrZkBMvsZzZPWa9+QkD7sr8a
 d1+JpUL4UVVPo/z7xxL83gf3X/ajEqLIFCtu7ZRrmPAnNDsBczbaMXpR8atjQ74dA9MM
 hAZg==
X-Gm-Message-State: APjAAAVH/6ATwdA7xzAbkCzAKQdLmF0BwKQeno36IGY3MvxJiL/TFUEh
 TYZA+MBSvcLcIQkRbfWK1FrZ/KVxnv8=
X-Google-Smtp-Source: APXvYqy11+dEOxjeLTisd07FIsi9hsfyVDU5TNEnzu/Q8nsPbrsCCHLzlAbYRru0TQSFm5eepDrXW32qe1M=
X-Received: by 2002:a63:313:: with SMTP id 19mr26848366pgd.7.1580252664382;
 Tue, 28 Jan 2020 15:04:24 -0800 (PST)
Date: Tue, 28 Jan 2020 15:03:24 -0800
In-Reply-To: <20200128230328.183524-1-drosen@google.com>
Message-Id: <20200128230328.183524-2-drosen@google.com>
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
 for more information. [URIs: entry.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iwa1d-008g7w-9S
Subject: [f2fs-dev] [PATCH v6 1/5] unicode: Add standard casefolded d_ops
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

This adds dentry_operations implementations for d_hash and d_compare
which can be used by any filesystem using utf8 casefolding, unifying the
existing ext4 and f2fs functions.
In order to do this, we add new variables to struct super_block and
switch ext4 and f2fs over to those instead of maintaining their own
versions.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/ext4/dir.c           | 45 ++----------------------------
 fs/ext4/ext4.h          |  4 ---
 fs/ext4/hash.c          |  2 +-
 fs/ext4/namei.c         | 20 ++++++--------
 fs/ext4/super.c         | 10 +++----
 fs/f2fs/dir.c           | 60 +++++++---------------------------------
 fs/f2fs/f2fs.h          |  4 ---
 fs/f2fs/hash.c          |  2 +-
 fs/f2fs/super.c         | 10 +++----
 fs/f2fs/sysfs.c         |  8 +++---
 fs/unicode/utf8-core.c  | 61 +++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h      | 10 +++++++
 include/linux/unicode.h | 17 ++++++++++++
 13 files changed, 124 insertions(+), 129 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 4e093277c8bfb..e9f7c32089dfc 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -668,49 +668,8 @@ const struct file_operations ext4_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-static int ext4_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-	struct inode *inode = dentry->d_parent->d_inode;
-
-	if (!IS_CASEFOLDED(inode) || !EXT4_SB(inode->i_sb)->s_encoding) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return ext4_ci_compare(inode, name, &qstr, false);
-}
-
-static int ext4_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	const struct ext4_sb_info *sbi = EXT4_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!IS_CASEFOLDED(dentry->d_inode) || !um)
-		return 0;
-
-	norm = kmalloc(PATH_MAX, GFP_ATOMIC);
-	if (!norm)
-		return -ENOMEM;
-
-	len = utf8_casefold(um, str, norm, PATH_MAX);
-	if (len < 0) {
-		if (ext4_has_strict_mode(sbi))
-			ret = -EINVAL;
-		goto out;
-	}
-	str->hash = full_name_hash(dentry, norm, len);
-out:
-	kfree(norm);
-	return ret;
-}
-
 const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = ext4_d_hash,
-	.d_compare = ext4_d_compare,
+	.d_hash = utf8_ci_d_hash,
+	.d_compare = utf8_ci_d_compare,
 };
 #endif
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index f8578caba40d5..3162ef2e53d46 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1430,10 +1430,6 @@ struct ext4_sb_info {
 	struct kobject s_kobj;
 	struct completion s_kobj_unregister;
 	struct super_block *s_sb;
-#ifdef CONFIG_UNICODE
-	struct unicode_map *s_encoding;
-	__u16 s_encoding_flags;
-#endif
 
 	/* Journaling */
 	struct journal_s *s_journal;
diff --git a/fs/ext4/hash.c b/fs/ext4/hash.c
index 3e133793a5a34..143b0073b3f46 100644
--- a/fs/ext4/hash.c
+++ b/fs/ext4/hash.c
@@ -275,7 +275,7 @@ int ext4fs_dirhash(const struct inode *dir, const char *name, int len,
 		   struct dx_hash_info *hinfo)
 {
 #ifdef CONFIG_UNICODE
-	const struct unicode_map *um = EXT4_SB(dir->i_sb)->s_encoding;
+	const struct unicode_map *um = dir->i_sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr qstr = {.name = name, .len = len };
diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 1cb42d9407847..7f4e625ab2f9b 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1282,8 +1282,8 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		    const struct qstr *entry, bool quick)
 {
-	const struct ext4_sb_info *sbi = EXT4_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
 	int ret;
 
 	if (quick)
@@ -1295,7 +1295,7 @@ int ext4_ci_compare(const struct inode *parent, const struct qstr *name,
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (ext4_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sb))
 			return -EINVAL;
 
 		if (name->len != entry->len)
@@ -1312,7 +1312,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 {
 	int len;
 
-	if (!IS_CASEFOLDED(dir) || !EXT4_SB(dir->i_sb)->s_encoding) {
+	if (!needs_casefold(dir)) {
 		cf_name->name = NULL;
 		return;
 	}
@@ -1321,7 +1321,7 @@ void ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 	if (!cf_name->name)
 		return;
 
-	len = utf8_casefold(EXT4_SB(dir->i_sb)->s_encoding,
+	len = utf8_casefold(dir->i_sb->s_encoding,
 			    iname, cf_name->name,
 			    EXT4_NAME_LEN);
 	if (len <= 0) {
@@ -1358,7 +1358,7 @@ static inline bool ext4_match(const struct inode *parent,
 #endif
 
 #ifdef CONFIG_UNICODE
-	if (EXT4_SB(parent->i_sb)->s_encoding && IS_CASEFOLDED(parent)) {
+	if (needs_casefold(parent)) {
 		if (fname->cf_name.name) {
 			struct qstr cf = {.name = fname->cf_name.name,
 					  .len = fname->cf_name.len};
@@ -2164,9 +2164,6 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	struct buffer_head *bh = NULL;
 	struct ext4_dir_entry_2 *de;
 	struct super_block *sb;
-#ifdef CONFIG_UNICODE
-	struct ext4_sb_info *sbi;
-#endif
 	struct ext4_filename fname;
 	int	retval;
 	int	dx_fallback=0;
@@ -2183,9 +2180,8 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 		return -EINVAL;
 
 #ifdef CONFIG_UNICODE
-	sbi = EXT4_SB(sb);
-	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
-	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
+	if (sb_has_enc_strict_mode(sb) && IS_CASEFOLDED(dir) &&
+	    sb->s_encoding && utf8_validate(sb->s_encoding, &dentry->d_name))
 		return -EINVAL;
 #endif
 
diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 2937a8873fe13..b7e9f0310ec23 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -1056,7 +1056,7 @@ static void ext4_put_super(struct super_block *sb)
 	kfree(sbi->s_blockgroup_lock);
 	fs_put_dax(sbi->s_daxdev);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kfree(sbi);
 }
@@ -3850,7 +3850,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount;
 
 #ifdef CONFIG_UNICODE
-	if (ext4_has_feature_casefold(sb) && !sbi->s_encoding) {
+	if (ext4_has_feature_casefold(sb) && !sb->s_encoding) {
 		const struct ext4_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3881,8 +3881,8 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sb->s_encoding = encoding;
+		sb->s_encoding_flags = encoding_flags;
 	}
 #endif
 
@@ -4684,7 +4684,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		crypto_free_shash(sbi->s_chksum_driver);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index d9ad842945df5..a1dd9939e20bf 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -114,8 +114,8 @@ static struct f2fs_dir_entry *find_in_block(struct inode *dir,
 int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 				const struct qstr *entry, bool quick)
 {
-	const struct f2fs_sb_info *sbi = F2FS_SB(parent->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
 	int ret;
 
 	if (quick)
@@ -127,7 +127,7 @@ int f2fs_ci_compare(const struct inode *parent, const struct qstr *name,
 		/* Handle invalid character sequence as either an error
 		 * or as an opaque byte sequence.
 		 */
-		if (f2fs_has_strict_mode(sbi))
+		if (sb_has_enc_strict_mode(sb))
 			return -EINVAL;
 
 		if (name->len != entry->len)
@@ -154,7 +154,7 @@ static void f2fs_fname_setup_ci_filename(struct inode *dir,
 	if (!cf_name->name)
 		return;
 
-	cf_name->len = utf8_casefold(sbi->s_encoding,
+	cf_name->len = utf8_casefold(dir->i_sb->s_encoding,
 					iname, cf_name->name,
 					F2FS_NAME_LEN);
 	if ((int)cf_name->len <= 0) {
@@ -173,7 +173,7 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 {
 #ifdef CONFIG_UNICODE
 	struct inode *parent = d->inode;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(parent);
+	struct super_block *sb = parent->i_sb;
 	struct qstr entry;
 #endif
 
@@ -184,7 +184,7 @@ static inline bool f2fs_match_name(struct f2fs_dentry_ptr *d,
 	entry.name = d->filename[bit_pos];
 	entry.len = de->name_len;
 
-	if (sbi->s_encoding && IS_CASEFOLDED(parent)) {
+	if (sb->s_encoding && IS_CASEFOLDED(parent)) {
 		if (cf_str->name) {
 			struct qstr cf = {.name = cf_str->name,
 					  .len = cf_str->len};
@@ -357,8 +357,8 @@ struct f2fs_dir_entry *f2fs_find_entry(struct inode *dir,
 	int err;
 
 #ifdef CONFIG_UNICODE
-	if (f2fs_has_strict_mode(F2FS_I_SB(dir)) && IS_CASEFOLDED(dir) &&
-			utf8_validate(F2FS_I_SB(dir)->s_encoding, child)) {
+	if (sb_has_enc_strict_mode(dir->i_sb) && IS_CASEFOLDED(dir) &&
+			utf8_validate(dir->i_sb->s_encoding, child)) {
 		*res_page = ERR_PTR(-EINVAL);
 		return NULL;
 	}
@@ -1065,48 +1065,8 @@ const struct file_operations f2fs_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
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
 const struct dentry_operations f2fs_dentry_ops = {
-	.d_hash = f2fs_d_hash,
-	.d_compare = f2fs_d_compare,
+	.d_hash = utf8_ci_d_hash,
+	.d_compare = utf8_ci_d_compare,
 };
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5a888a063c7f1..9f302de477022 100644
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
diff --git a/fs/f2fs/hash.c b/fs/f2fs/hash.c
index 5bc4dcd8fc03f..28acb24e7a7a8 100644
--- a/fs/f2fs/hash.c
+++ b/fs/f2fs/hash.c
@@ -110,7 +110,7 @@ f2fs_hash_t f2fs_dentry_hash(const struct inode *dir,
 {
 #ifdef CONFIG_UNICODE
 	struct f2fs_sb_info *sbi = F2FS_SB(dir->i_sb);
-	const struct unicode_map *um = sbi->s_encoding;
+	const struct unicode_map *um = dir->i_sb->s_encoding;
 	int r, dlen;
 	unsigned char *buff;
 	struct qstr folded;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5111e1ffe58ab..5de587f20ed35 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1144,7 +1144,7 @@ static void f2fs_put_super(struct super_block *sb)
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kvfree(sbi);
 }
@@ -3136,7 +3136,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 {
 #ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+	if (f2fs_sb_has_casefold(sbi) && !sbi->sb->s_encoding) {
 		const struct f2fs_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3167,8 +3167,8 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sbi->sb->s_encoding = encoding;
+		sbi->sb->s_encoding_flags = encoding_flags;
 		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
@@ -3637,7 +3637,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kvfree(sbi->write_io[i]);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 70945ceb9c0ca..7fd37c8c9733a 100644
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
diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 2a878b739115d..129a9e3fa91a4 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -6,6 +6,7 @@
 #include <linux/parser.h>
 #include <linux/errno.h>
 #include <linux/unicode.h>
+#include <linux/stringhash.h>
 
 #include "utf8n.h"
 
@@ -212,4 +213,64 @@ void utf8_unload(struct unicode_map *um)
 }
 EXPORT_SYMBOL(utf8_unload);
 
+int utf8_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name)
+{
+	const struct dentry *parent = READ_ONCE(dentry->d_parent);
+	const struct inode *inode = READ_ONCE(parent->d_inode);
+	const struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct qstr entry = QSTR_INIT(str, len);
+	int ret;
+
+	if (!inode || !needs_casefold(inode))
+		goto fallback;
+
+	ret = utf8_strncasecmp(um, name, &entry);
+	if (ret >= 0)
+		return ret;
+
+	if (sb_has_enc_strict_mode(sb))
+		return -EINVAL;
+fallback:
+	if (len != name->len)
+		return 1;
+	return !!memcmp(str, name->name, len);
+}
+EXPORT_SYMBOL(utf8_ci_d_compare);
+
+int utf8_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+{
+	const struct inode *inode = READ_ONCE(dentry->d_inode);
+	struct super_block *sb = dentry->d_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	int ret = 0;
+	unsigned long hash;
+	const struct utf8data *data;
+	struct utf8cursor cur;
+	int c;
+
+	if (!inode || !needs_casefold(inode))
+		return 0;
+
+	hash = init_name_hash(dentry);
+	data = utf8nfdicf(um->version);
+	if (utf8ncursor(&cur, data, str->name, str->len) < 0)
+		goto err;
+
+	while ((c = utf8byte(&cur))) {
+		if (c < 0)
+			goto err;
+		hash = partial_name_hash((unsigned char)c, hash);
+	}
+
+	str->hash = end_name_hash(hash);
+	return 0;
+err:
+	if (sb_has_enc_strict_mode(sb))
+		ret = -EINVAL;
+	return ret;
+}
+EXPORT_SYMBOL(utf8_ci_d_hash);
+
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 98e0349adb526..9a7092449e94f 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1382,6 +1382,12 @@ extern int send_sigurg(struct fown_struct *fown);
 #define SB_ACTIVE	(1<<30)
 #define SB_NOUSER	(1<<31)
 
+/* These flags relate to encoding and casefolding */
+#define SB_ENC_STRICT_MODE_FL	(1 << 0)
+
+#define sb_has_enc_strict_mode(sb) \
+	(sb->s_encoding_flags & SB_ENC_STRICT_MODE_FL)
+
 /*
  *	Umount options
  */
@@ -1449,6 +1455,10 @@ struct super_block {
 #endif
 #ifdef CONFIG_FS_VERITY
 	const struct fsverity_operations *s_vop;
+#endif
+#ifdef CONFIG_UNICODE
+	struct unicode_map *s_encoding;
+	__u16 s_encoding_flags;
 #endif
 	struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
 	struct list_head	s_mounts;	/* list of mounts; _not_ for fs use */
diff --git a/include/linux/unicode.h b/include/linux/unicode.h
index 990aa97d80496..5de313abeaf98 100644
--- a/include/linux/unicode.h
+++ b/include/linux/unicode.h
@@ -4,6 +4,8 @@
 
 #include <linux/init.h>
 #include <linux/dcache.h>
+#include <linux/fscrypt.h>
+#include <linux/fs.h>
 
 struct unicode_map {
 	const char *charset;
@@ -30,4 +32,19 @@ int utf8_casefold(const struct unicode_map *um, const struct qstr *str,
 struct unicode_map *utf8_load(const char *version);
 void utf8_unload(struct unicode_map *um);
 
+int utf8_ci_d_hash(const struct dentry *dentry, struct qstr *str);
+int utf8_ci_d_compare(const struct dentry *dentry, unsigned int len,
+			  const char *str, const struct qstr *name);
+#ifdef CONFIG_UNICODE
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return IS_CASEFOLDED(dir) && dir->i_sb->s_encoding &&
+			(!IS_ENCRYPTED(dir) || fscrypt_has_encryption_key(dir));
+}
+#else
+static inline bool needs_casefold(const struct inode *dir)
+{
+	return 0;
+}
+#endif
 #endif /* _LINUX_UNICODE_H */
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
