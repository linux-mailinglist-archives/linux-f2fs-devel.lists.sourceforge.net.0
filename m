Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CCD85B5EF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 09:53:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcLsC-0000rz-Jd;
	Tue, 20 Feb 2024 08:53:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rcLsA-0000rh-Qk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bBiQr8qNHBW/dz9Wqw2B0oF7xd6Dni/RQbz5CqxkgSU=; b=B6GSU2sGoZWbrVXvmNlX9LoEtE
 4AHMkD+uVAKLzXj9yYauYVyyOtuoeYkgfTi3dbdF/wmHA/xt+qjpvuN20XO7/AKIHvoPXWbqUzhPD
 sLywLza6zwzge5GOz6bJfSCKfpwRMX5p1rv0ykvij9FGcQz9vuS4Jjv2fcmdhPbZ7UJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bBiQr8qNHBW/dz9Wqw2B0oF7xd6Dni/RQbz5CqxkgSU=; b=Is47n4VwjdShkG83UL2bidNKZC
 YYc3LpX0Gaa6XsLFYMyUyTy8JqoIzRObX5LzPxDgAcwq+L8UyixM5cc3P7Kev55wW223aqwBOqcgx
 gVFHkhfJNxM1fBmW95k2fF6cBv2zDgrp3nNnYyXQG4+GMP9n8vcqx3gY6wKgz1qKQkZE=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcLs9-0004EX-3l for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 08:53:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1708419180;
 bh=qz8S7xFJa6xuAqtF97SRmEiApDWkUqTqYZBa3wZStlw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r2FsOhsDV17dEdnUaHnl/6eCD3lZQNMyYpTmVh7wY+kByukIJ+krZQnvAHwBs/nC2
 hckAqCDGtOlKWbPUsChcJyVNIrEiUxOV80Co77FyxiTP6IDYTirX6pMp4f/x0rYgUj
 TyNCw4MB8BQ1g7I3MjTGPNrHPwoXQmNf17aCnPqCOD7A/LeenllTgTE1S6uBmoEXLp
 r5YDLgvlukcY/BLfm1sazLzwHxnH4U/B4bT2lU9TRj8efvtQK6RnHNEG52gz+oSSJG
 WiyFBDLqIq8LULh8LULBfDFx9LHff/d+NnQeFPNoobQnvC/cs2wLaGcQkNh3BuW7P+
 Y2u2jQ8oVcOcg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 91313378208D;
 Tue, 20 Feb 2024 08:52:56 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org,
 jaegeuk@kernel.org, chao@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Date: Tue, 20 Feb 2024 10:52:30 +0200
Message-Id: <20240220085235.71132-4-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240220085235.71132-1-eugen.hristev@collabora.com>
References: <20240220085235.71132-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com>
 generic_ci_match
 can be used by case-insensitive filesystems to compare strings under lookup
 with dirents in a case-insensitive way. This function is currently
 reimplemented by each filesystem support [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcLs9-0004EX-3l
Subject: [f2fs-dev] [PATCH v12 3/8] libfs: Introduce case-insensitive string
 comparison helper
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

generic_ci_match can be used by case-insensitive filesystems to compare
strings under lookup with dirents in a case-insensitive way.  This
function is currently reimplemented by each filesystem supporting
casefolding, so this reduces code duplication in filesystem-specific
code.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
[eugen.hristev@collabora.com: rework to first test the exact match]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
 fs/libfs.c         | 85 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  4 +++
 2 files changed, 89 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index bb18884ff20e..65e2fb17a2b6 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1773,6 +1773,91 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
 };
+
+/**
+ * generic_ci_match() - Match a name (case-insensitively) with a dirent.
+ * This is a filesystem helper for comparison with directory entries.
+ * generic_ci_d_compare should be used in VFS' ->d_compare instead.
+ *
+ * @parent: Inode of the parent of the dirent under comparison
+ * @name: name under lookup.
+ * @folded_name: Optional pre-folded name under lookup
+ * @de_name: Dirent name.
+ * @de_name_len: dirent name length.
+ *
+ * Test whether a case-insensitive directory entry matches the filename
+ * being searched.  If @folded_name is provided, it is used instead of
+ * recalculating the casefold of @name.
+ *
+ * Return: > 0 if the directory entry matches, 0 if it doesn't match, or
+ * < 0 on error.
+ */
+int generic_ci_match(const struct inode *parent,
+		     const struct qstr *name,
+		     const struct qstr *folded_name,
+		     const u8 *de_name, u32 de_name_len)
+{
+	const struct super_block *sb = parent->i_sb;
+	const struct unicode_map *um = sb->s_encoding;
+	struct fscrypt_str decrypted_name = FSTR_INIT(NULL, de_name_len);
+	struct qstr dirent = QSTR_INIT(de_name, de_name_len);
+	int res, match = 0;
+
+	if (IS_ENCRYPTED(parent)) {
+		const struct fscrypt_str encrypted_name =
+			FSTR_INIT((u8 *) de_name, de_name_len);
+
+		if (WARN_ON_ONCE(!fscrypt_has_encryption_key(parent)))
+			return -EINVAL;
+
+		decrypted_name.name = kmalloc(de_name_len, GFP_KERNEL);
+		if (!decrypted_name.name)
+			return -ENOMEM;
+		res = fscrypt_fname_disk_to_usr(parent, 0, 0, &encrypted_name,
+						&decrypted_name);
+		if (res < 0)
+			goto out;
+		dirent.name = decrypted_name.name;
+		dirent.len = decrypted_name.len;
+	}
+
+	/*
+	 * Attempt a case-sensitive match first. It is cheaper and
+	 * should cover most lookups, including all the sane
+	 * applications that expect a case-sensitive filesystem.
+	 *
+	 * This comparison is safe under RCU because the caller
+	 * guarantees the consistency between str and len. See
+	 * __d_lookup_rcu_op_compare() for details.
+	 */
+	if (folded_name->name) {
+		if (dirent.len == folded_name->len &&
+		    !memcmp(folded_name->name, dirent.name, dirent.len)) {
+			match = 1;
+			goto out;
+		}
+		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
+	} else {
+		if (dirent.len == name->len &&
+		    !memcmp(name->name, dirent.name, dirent.len) &&
+		    (!sb_has_strict_encoding(sb) || !utf8_validate(um, name))) {
+			match = 1;
+			goto out;
+		}
+		res = utf8_strncasecmp(um, name, &dirent);
+	}
+
+out:
+	kfree(decrypted_name.name);
+	if (match) /* matched by direct comparison */
+		return 1;
+	else if (!res) /* matched by utf8 comparison */
+		return 1;
+	else if (res < 0) /* error on utf8 comparison */
+		return res;
+	return 0; /* no match */
+}
+EXPORT_SYMBOL(generic_ci_match);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 820b93b2917f..7af691ff8d44 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3296,6 +3296,10 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
+extern int generic_ci_match(const struct inode *parent,
+			    const struct qstr *name,
+			    const struct qstr *folded_name,
+			    const u8 *de_name, u32 de_name_len);
 
 static inline bool sb_has_encoding(const struct super_block *sb)
 {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
