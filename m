Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E5B5153A9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 20:28:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkVLY-0000KC-G7; Fri, 29 Apr 2022 18:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nkVLW-0000Jc-Hy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cHu8Q2KFeL7usQh9cYm+0L+Vvhdx0hJlG5PSkIctc0w=; b=SXbTlvDHYK7OOYq8OWj7bbarSg
 Nv7QibXf1iGYEZK9/1FNJGeg+F+xJaEfVjzbCx22OV3sIhzySBB6Ji2l2iGOFZ97G6UFv4oXvwP4A
 2NGDLbE0Bsx02/OiyJgpcbmVX2zH4Yp78AgV9cJpucQwhUKP9rWgRNknE7U+TiIXEkX8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cHu8Q2KFeL7usQh9cYm+0L+Vvhdx0hJlG5PSkIctc0w=; b=ESUEGtUDm88JFf+JiABoqIz0D6
 DTTIblZkSJlR/QNpW7QkAFAsiJL+qs7qbHNCzqtru0ORdoPKbU85aICN8NtchVCFcuVLxFGoDu/RY
 U5Cmr3k9I1tpAQwQE9W1HosRlJL/hpX3+FZhWk5yOBB8BEX/k7Hh6P5n4jQZZxWYvy8s=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkVLV-0001rX-Rs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 18:28:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 89A801F4690E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651256875;
 bh=N4xE+tP+/xJwSBLiGEgC0LQSqlTfjK6uguGhjdBx16g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gEoUJ/Jk8z8Z5h1gNcH3rwAmo/SEAAjZgpSzxoTOr7pi5cQMuv36mzv1sGBfA3DT3
 4thtfV1pPzffoedES70Yi9hdPHsIUVBENC6+M3IpONvUX+8BWW39Nk73sO2dJ93z+V
 moqqHdXHhygfkWfN5HR7GkkN2TgA4NnZHw+6EOSencP2w4b+Zw6nrYKUnctnLOqYkp
 5ZaO734rjVnLYr6nOB1Ltlg/D7ZkXJv3BS1YCDkjXfsrJi7AcAZdunmYPUFuM6Fhse
 6bHjvWBERHX+NoFi+rbHPx9zwOhwCN7TQQIuG3MvM70PRy/KdroSfvegGkLkg1fIkM
 md/k6edUMgEnw==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	jaegeuk@kernel.org
Date: Fri, 29 Apr 2022 14:27:27 -0400
Message-Id: <20220429182728.14008-7-krisman@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429182728.14008-1-krisman@collabora.com>
References: <20220429182728.14008-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: 1.5 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Matching case-insensitive names is a generic operation and
 can be shared with f2fs. Move it next to the rest of the shared casefold
 fs code. Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com> ---
 fs/ext4/namei.c | 62 + fs/libfs.c | 61
 +++++++++++++++++++++++++++++++++++++++++++++ inc [...] 
 Content analysis details:   (1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.7 URIBL_BLACK            Contains an URL listed in the URIBL blacklist
 [URIs: entry.name]
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines
X-Headers-End: 1nkVLV-0001rX-Rs
Subject: [f2fs-dev] [PATCH v3 6/7] ext4: Move ext4_match_ci into libfs
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
Cc: ebiggers@kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>, kernel@collabora.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Matching case-insensitive names is a generic operation and can be shared
with f2fs.  Move it next to the rest of the shared casefold fs code.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 fs/ext4/namei.c    | 62 +---------------------------------------------
 fs/libfs.c         | 61 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  3 +++
 3 files changed, 65 insertions(+), 61 deletions(-)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index d53c8d101099..df44ea626fad 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -1318,66 +1318,6 @@ static void dx_insert_block(struct dx_frame *frame, u32 hash, ext4_lblk_t block)
 }
 
 #if IS_ENABLED(CONFIG_UNICODE)
-/**
- * ext4_match_ci() - Match (case-insensitive) a name with a dirent.
- * @parent: Inode of the parent of the dentry.
- * @uname: name under lookup.
- * @de_name: Dirent name.
- * @de_name_len: dirent name length.
- *
- * Test whether a case-insensitive directory entry matches the filename
- * being searched.
- *
- * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
- * < 0 on error.
- */
-static int ext4_match_ci(const struct inode *parent,
-			 const struct unicode_name *uname,
-			 u8 *de_name, size_t de_name_len)
-{
-	const struct super_block *sb = parent->i_sb;
-	const struct unicode_map *um = sb->s_encoding;
-	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
-	struct qstr entry = QSTR_INIT(de_name, de_name_len);
-	int ret, match = false;
-
-	if (IS_ENCRYPTED(parent)) {
-		const struct fscrypt_str encrypted_name =
-				FSTR_INIT(de_name, de_name_len);
-
-		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
-		if (!decrypted_name.name)
-			return -ENOMEM;
-		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
-						&decrypted_name);
-		if (ret < 0)
-			goto out;
-		entry.name = decrypted_name.name;
-		entry.len = decrypted_name.len;
-	}
-
-	if (uname->folded_name->name)
-		ret = utf8_strncasecmp_folded(um, uname->folded_name, &entry);
-	else
-		ret = utf8_strncasecmp(um, uname->usr_name, &entry);
-
-	if (!ret)
-		match = true;
-	else if (ret < 0 && !sb_has_strict_encoding(sb)) {
-		/*
-		 * In non-strict mode, fallback to a byte comparison if
-		 * the names have invalid characters.
-		 */
-		ret = 0;
-		match = ((uname->usr_name->len == entry.len) &&
-			 !memcmp(uname->usr_name->name, entry.name, entry.len));
-	}
-
-out:
-	kfree(decrypted_name.name);
-	return (ret >= 0) ? match : ret;
-}
-
 int ext4_fname_setup_ci_filename(struct inode *dir, const struct qstr *iname,
 				  struct ext4_filename *name)
 {
@@ -1450,7 +1390,7 @@ static bool ext4_match(struct inode *parent,
 		u.folded_name = &fname->cf_name;
 		u.usr_name = fname->usr_fname;
 
-		ret = ext4_match_ci(parent, &u, de->name, de->name_len);
+		ret = generic_ci_match(parent, &u, de->name, de->name_len);
 		if (ret < 0) {
 			/*
 			 * Treat comparison errors as not a match.  The
diff --git a/fs/libfs.c b/fs/libfs.c
index 974125270a42..c14b3fa615f5 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1465,6 +1465,67 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
 };
+
+/**
+ * generic_ci_match() - Match (case-insensitive) a name with a dirent.
+ * @parent: Inode of the parent of the dentry.
+ * @uname: name under lookup.
+ * @de_name: Dirent name.
+ * @de_name_len: dirent name length.
+ *
+ * Test whether a case-insensitive directory entry matches the filename
+ * being searched.
+ *
+ * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
+ * < 0 on error.
+ */
+int generic_ci_match(const struct inode *parent,
+		     const struct unicode_name *uname,
+		     u8 *de_name, size_t de_name_len)
+{
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
+	struct qstr entry = QSTR_INIT(de_name, de_name_len);
+	int ret, match = false;
+
+	if (IS_ENCRYPTED(parent)) {
+		const struct fscrypt_str encrypted_name =
+			FSTR_INIT(de_name, de_name_len);
+
+		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		if (!decrypted_name.name)
+			return -ENOMEM;
+		ret = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
+						&decrypted_name);
+		if (ret < 0)
+			goto out;
+		entry.name = decrypted_name.name;
+		entry.len = decrypted_name.len;
+	}
+
+	if (uname->folded_name->name)
+		ret = utf8_strncasecmp_folded(um, uname->folded_name, &entry);
+	else
+		ret = utf8_strncasecmp(um, uname->usr_name, &entry);
+
+	if (!ret)
+		match = true;
+	else if (ret < 0 && !sb_has_strict_encoding(sb)) {
+		/*
+		 * In non-strict mode, fallback to a byte comparison if
+		 * the names have invalid characters.
+		 */
+		ret = 0;
+		match = ((uname->usr_name->len == entry.len) &&
+			 !memcmp(uname->usr_name->name, entry.name, entry.len));
+	}
+
+out:
+	kfree(decrypted_name.name);
+	return (ret >= 0) ? match : ret;
+}
+EXPORT_SYMBOL(generic_ci_match);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 3f76a18a5f40..6a750b8704c9 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3364,6 +3364,9 @@ struct unicode_name {
 };
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
+extern int generic_ci_match(const struct inode *parent,
+			    const struct unicode_name *uname, u8 *de_name,
+			    size_t de_name_len);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
