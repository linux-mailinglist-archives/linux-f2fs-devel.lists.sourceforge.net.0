Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84487131F0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Jan 2020 06:23:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/j7hrg1gabfkAr1pzg9kN2YVSFVqCYZXIGzbqL9xP0o=; b=J8vT9OR0nsoHnZBWS2h6lBpZz
	AqhMFO3I7pWvb8GhwoO/cI3rZ/FJdmLLTiUNOX5faSoY1KBp05k+zqjRYkOP+xlKgSZ18WD4FUNuT
	IpqEDQ5rDPyt5ISNV21If7eexTFMFLSCE6gr357Cxej24rQiJ86SwIg0ezPFGC/AHFF1E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iohKk-0002zE-5C; Tue, 07 Jan 2020 05:23:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3SRQUXgYKALgbpmqclemmejc.amk@flex--drosen.bounces.google.com>)
 id 1iohKd-0002yR-NP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZKTiM0GgbzZ03KCdWEEy+bquFa7svd20YuVXdrJ9Jc=; b=mhM6LtIZwkAk2qp/N+6DkP1HX
 ANyU4ywhTvKsttlkCWpHukf8+KfBG2y3kZNwR9JRYiEMGCukuvKaBcSgyB77zZP1zCxfa24RWWXao
 AC68j2bKiDFIXHTJbzRxafJpVa77FkseWcs9vZx4+Go3jP58U6+bdmepgEFEHmTpnPgoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qZKTiM0GgbzZ03KCdWEEy+bquFa7svd20YuVXdrJ9Jc=; b=cSRhzb+B8miKPoGmSman1I6sZ8
 uVqyrFLg+lRAJlvNCIOqqpqYpwKEW1IOkKL/53ZKenD3p5VdBDzWVceFOGf6hfSYyl1chWcm+yA44
 IMLkg5jcT+XpKub1OaDsJlAoh5o0sWfaJJSq6BOaK0rsy9fawvA4p5hMbmrMdJ2dOUz8=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iohKU-00C1i9-3I
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Jan 2020 05:23:07 +0000
Received: by mail-il1-f202.google.com with SMTP id l13so44557129ils.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 06 Jan 2020 21:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=qZKTiM0GgbzZ03KCdWEEy+bquFa7svd20YuVXdrJ9Jc=;
 b=gmGSXP1sDv+b5gDsfsxnX0ArY8xw7Iuo9GKFryzLErAWxPPnWfJzLTmPmTHOHRO8BZ
 h7zRbQCPKhorVfCsy8RHuG5WcY7hdOSLhTohP5kA2kTl28Zy8/xjzx6ftH3rAfL6nz1T
 BWzXYE0UQCuSHeGMonUw9RwG2xIF9xcT+LHY9asuyyUoYBTenPAg+GeyPn0PdcfjAE7R
 bQffCDlG6+YC5yKmcD6Kos4zeYNRpXIpND059lUluxw6j8Iw6AxNcScbXTeP470V654i
 R5Dbr7Xk6ShjOgi/2QOYlY3uKnmHdARiIEG3wn9hWdLilv1NpKMk4zlotV45zTQMCAXt
 GlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=qZKTiM0GgbzZ03KCdWEEy+bquFa7svd20YuVXdrJ9Jc=;
 b=niHjDIS2l/Qj75NvAMca/pCaDLgXbTOiq9ZUNIZWJePdQn5/43DKhRg3LVgbuKhL0h
 53QXnDlTL+DzpJX1xxOzldlsC4oqFIdG17/cc64cC9qRRdouYx+4BxSrhgEOE6mpZnEf
 Af5ivxb/eGQi3Zzdyit+JcdqEtuzwGRHV86Yz9SlSW5zOceJImHgYdnA2/NBvoYaZXke
 1pa5y7d3Wxpfi4cqKEdV9GBcGDE/uYIPC7oGYtTOQ9nnOJemq9uSTP1hmeB3nJpGqpql
 HQlyYAAAqo1O27o2vM+MHCB++Wn/pOv1YVQH4fO0hSjdPfZv1REHJsCuz2eXzld8KvVT
 nWDg==
X-Gm-Message-State: APjAAAVHLZ49RuT7m7/4GUq/knO7IQOMmpS7ECE8D9Nu0BMYVJgbTWdg
 R/zvDkBz4GaRMBOLB86on6AO+DxSHMw=
X-Google-Smtp-Source: APXvYqwri5zPKZ9xGUrAZ7jmFUidYrANr8unDkP8dJbTZ/IMR9jp15B7J+8QxkR8zUhYRCbjJIqyp/WA0q4=
X-Received: by 2002:a63:b4d:: with SMTP id a13mr111634235pgl.388.1578374217613; 
 Mon, 06 Jan 2020 21:16:57 -0800 (PST)
Date: Mon,  6 Jan 2020 21:16:36 -0800
In-Reply-To: <20200107051638.40893-1-drosen@google.com>
Message-Id: <20200107051638.40893-5-drosen@google.com>
Mime-Version: 1.0
References: <20200107051638.40893-1-drosen@google.com>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.202 listed in list.dnswl.org]
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
X-Headers-End: 1iohKU-00C1i9-3I
Subject: [f2fs-dev] [PATCH v2 4/6] ext4: Use struct super_blocks' casefold
 data
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

Switch over to using the struct entries added to the VFS

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/ext4/dir.c   | 47 -----------------------------------------------
 fs/ext4/ext4.h  |  4 ----
 fs/ext4/hash.c  |  2 +-
 fs/ext4/namei.c | 20 ++++++++------------
 fs/ext4/super.c | 15 +++++----------
 5 files changed, 14 insertions(+), 74 deletions(-)

diff --git a/fs/ext4/dir.c b/fs/ext4/dir.c
index 9f00fc0bf21d2..f70b3bb57c48c 100644
--- a/fs/ext4/dir.c
+++ b/fs/ext4/dir.c
@@ -667,50 +667,3 @@ const struct file_operations ext4_dir_operations = {
 	.release	= ext4_release_dir,
 };
 
-#ifdef CONFIG_UNICODE
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
-const struct dentry_operations ext4_dentry_ops = {
-	.d_hash = ext4_d_hash,
-	.d_compare = ext4_d_compare,
-};
-#endif
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
index 2937a8873fe13..11584bdc3e237 100644
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
 
@@ -4497,11 +4497,6 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		goto failed_mount4;
 	}
 
-#ifdef CONFIG_UNICODE
-	if (sbi->s_encoding)
-		sb->s_d_op = &ext4_dentry_ops;
-#endif
-
 	sb->s_root = d_make_root(root);
 	if (!sb->s_root) {
 		ext4_msg(sb, KERN_ERR, "get root dentry failed");
@@ -4684,7 +4679,7 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
 		crypto_free_shash(sbi->s_chksum_driver);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 
 #ifdef CONFIG_QUOTA
-- 
2.24.1.735.g03f4e72817-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
