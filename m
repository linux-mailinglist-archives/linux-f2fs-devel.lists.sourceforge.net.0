Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD35156260
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  8 Feb 2020 02:36:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=joztVKrNFu5EGyzy3AJiyXqLwOksEI9BjwdII2aZBOk=; b=gvNmcF0eRmp4i0rhFLPbxESxC
	Mbjz9I0oIAF3DqTj8eCiQEfqpIE7nGLzv04wzT2s6bhHeG/ufRv27Bc9SOM9hJ8YdG9YxTXKsREWO
	UD/A5YxjHzKkSOGxid31c0F0tZKd9xENjLccKGyftH3WIkEb/0kque40ZHTavpBITb1xo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j0F2g-0007uW-CP; Sat, 08 Feb 2020 01:36:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3gxA-XgYKAJQ1FCG2B4CC492.0CA@flex--drosen.bounces.google.com>)
 id 1j0F2d-0007u8-Pf
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=; b=DcGV+hML4noHPWPKNbv3kp7UO
 i7WyjXI976ftGFMWJ4aagnvXZcLFe7kY17m7DIO/TXafi6+iBB4vCmIBDjDpS0fgn++cJyb7rC/7b
 ijs3WE17vHfE62ZwNcLbkidI/V5YUxWlDX36SXGizCLQA8WnbkAASnYWl2YS7YLnqeRlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=; b=QnxKUfQJyhdiNhniZ/dsxlsp6f
 5FvbWhHJhkK08VmwhXW26I2wp2MzYx/9ca+RylWs6Ym2iZLyIklnLTeKuseGwL11oWgfSU9Iz2hHF
 hz3/mOvDkfrfrVqDFz7tXZgNl46rh+gq7o06zNITinFVzF68qjH9pYDdDX5MI3Nq93Jg=;
Received: from mail-pl1-f201.google.com ([209.85.214.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1j0F2X-00DrPi-9U
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 08 Feb 2020 01:36:10 +0000
Received: by mail-pl1-f201.google.com with SMTP id t12so631982plo.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 07 Feb 2020 17:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=;
 b=V3VcPrxamqIGePPcOphX6Ppi9D/2lyuNTKI6LvAaJ4b/jlpXpVuJf6GC+d7px1c66X
 Clu6R3PyBOUsLaUyLI3CVLvy5pnfD5x79m3H9q1fx3DIEqQaP12b+R/RMnz00HjsdeAT
 oCAUjTSd8frT/tuS3Wb9ovqKq7Ucsic/oekES7XEy4LVJIzKIE3vNVUJfnTGYgFFb9Hz
 c+lc+UADgfq3xifpfchhpkGdwUslMfpqK9KIUPYnbKjq7KLnTAHZ34Ozf61WXS+2cCEr
 P7vj2/DSDm6OZuDFoQOK3/fLUlbxn8ag0qRgpxwfacjiHOvtzFK+L8RZfB0ers/r+ABJ
 LmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=PM3tD4njKzZSFOsXtyEHPKTwa9poqnCvBDMtgLJDiYs=;
 b=fTiGgfPB5u9LxG+HmBW9M+kZpkwkDRH+4NWO0KA5evGzO8k7n7X188xXTmcA+NmweH
 hpLcxSlHiF8HIN/FdyLLBQG2g0t2Z1tmcR6VXLupChi/QFXziChYNV8GU8pFuxDSPCPa
 kmCeINoU1GqH70dLVe4k0yUFfTTOuRIvIHGo+ThRapkKOL5LMoPys84ijCzBo4tfohEy
 vvCjA6SUbEEVFnkdi/ekgfSV0AlPGbYTGNEgGVhIF1rYAdfpc16IgJlVil3T9nZC9L0Q
 AQwhLpV0slkWKtwiJ2F3qbOD3V1DclvuqBgXDNreODsiXyioON4qu1PfGV2WCoabPR+Y
 kUNw==
X-Gm-Message-State: APjAAAWssxZwiMw2cDW9TzYBI7MOO06bR+qeJhFBZ/kvA4jn/dt58TOl
 UFRCi5Vu9OE5BrE6LX+UwEi89FZ2HR0=
X-Google-Smtp-Source: APXvYqwl/lEcrrKeOu3wI/xiA2znsv59CFCVINP/2YnIluASYc5rk9Vt0U0ykTANljRsYmxUE/5QlMNKY5s=
X-Received: by 2002:a63:ab04:: with SMTP id p4mr2169862pgf.37.1581125763416;
 Fri, 07 Feb 2020 17:36:03 -0800 (PST)
Date: Fri,  7 Feb 2020 17:35:47 -0800
In-Reply-To: <20200208013552.241832-1-drosen@google.com>
Message-Id: <20200208013552.241832-4-drosen@google.com>
Mime-Version: 1.0
References: <20200208013552.241832-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Richard Weinberger <richard@nod.at>
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.201 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: entry.name]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j0F2X-00DrPi-9U
Subject: [f2fs-dev] [PATCH v7 3/8] f2fs: Use generic casefolding support
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

This switches f2fs over to the generic support provided in
commit 65832afbeaaf ("fs: Add standard casefolding support")

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/f2fs/dir.c           | 63 +++++++----------------------------------
 fs/f2fs/f2fs.h          |  4 ---
 fs/f2fs/hash.c          |  2 +-
 fs/f2fs/super.c         | 10 +++----
 fs/f2fs/sysfs.c         | 10 ++++---
 include/linux/f2fs_fs.h |  3 --
 6 files changed, 22 insertions(+), 70 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 27d0dd7a16d6d..d822c0d5eb182 100644
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
@@ -1079,51 +1079,8 @@ const struct file_operations f2fs_dir_operations = {
 };
 
 #ifdef CONFIG_UNICODE
-static int f2fs_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
-{
-	struct qstr qstr = {.name = str, .len = len };
-	const struct dentry *parent = READ_ONCE(dentry->d_parent);
-	const struct inode *inode = READ_ONCE(parent->d_inode);
-
-	if (!inode || !IS_CASEFOLDED(inode)) {
-		if (len != name->len)
-			return -1;
-		return memcmp(str, name->name, len);
-	}
-
-	return f2fs_ci_compare(inode, name, &qstr, false);
-}
-
-static int f2fs_d_hash(const struct dentry *dentry, struct qstr *str)
-{
-	struct f2fs_sb_info *sbi = F2FS_SB(dentry->d_sb);
-	const struct unicode_map *um = sbi->s_encoding;
-	const struct inode *inode = READ_ONCE(dentry->d_inode);
-	unsigned char *norm;
-	int len, ret = 0;
-
-	if (!inode || !IS_CASEFOLDED(inode))
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
+	.d_hash = generic_ci_d_hash,
+	.d_compare = generic_ci_d_compare,
 };
 #endif
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5355be6b6755c..e73b8752f9c8d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1284,10 +1284,6 @@ struct f2fs_sb_info {
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
index 65a7a432dfee2..89b52629bd437 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1213,7 +1213,7 @@ static void f2fs_put_super(struct super_block *sb)
 	for (i = 0; i < NR_PAGE_TYPE; i++)
 		kvfree(sbi->write_io[i]);
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 	kvfree(sbi);
 }
@@ -3223,7 +3223,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 {
 #ifdef CONFIG_UNICODE
-	if (f2fs_sb_has_casefold(sbi) && !sbi->s_encoding) {
+	if (f2fs_sb_has_casefold(sbi) && !sbi->sb->s_encoding) {
 		const struct f2fs_sb_encodings *encoding_info;
 		struct unicode_map *encoding;
 		__u16 encoding_flags;
@@ -3254,8 +3254,8 @@ static int f2fs_setup_casefold(struct f2fs_sb_info *sbi)
 			 "%s-%s with flags 0x%hx", encoding_info->name,
 			 encoding_info->version?:"\b", encoding_flags);
 
-		sbi->s_encoding = encoding;
-		sbi->s_encoding_flags = encoding_flags;
+		sbi->sb->s_encoding = encoding;
+		sbi->sb->s_encoding_flags = encoding_flags;
 		sbi->sb->s_d_op = &f2fs_dentry_ops;
 	}
 #else
@@ -3742,7 +3742,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		kvfree(sbi->write_io[i]);
 
 #ifdef CONFIG_UNICODE
-	utf8_unload(sbi->s_encoding);
+	utf8_unload(sb->s_encoding);
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 91d649790b1bc..4e8aae03f26c1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -175,12 +175,14 @@ static ssize_t encoding_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
 #ifdef CONFIG_UNICODE
+	struct super_block *sb = sbi->sb;
+
 	if (f2fs_sb_has_casefold(sbi))
 		return snprintf(buf, PAGE_SIZE, "%s (%d.%d.%d)\n",
-			sbi->s_encoding->charset,
-			(sbi->s_encoding->version >> 16) & 0xff,
-			(sbi->s_encoding->version >> 8) & 0xff,
-			sbi->s_encoding->version & 0xff);
+			sb->s_encoding->charset,
+			(sb->s_encoding->version >> 16) & 0xff,
+			(sb->s_encoding->version >> 8) & 0xff,
+			sb->s_encoding->version & 0xff);
 #endif
 	return sprintf(buf, "(none)");
 }
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index ac3f4888b3dfa..e8763a955f90d 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -38,9 +38,6 @@
 #define F2FS_MAX_QUOTAS		3
 
 #define F2FS_ENC_UTF8_12_1	1
-#define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
-#define f2fs_has_strict_mode(sbi) \
-	(sbi->s_encoding_flags & F2FS_ENC_STRICT_MODE_FL)
 
 #define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
 #define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
