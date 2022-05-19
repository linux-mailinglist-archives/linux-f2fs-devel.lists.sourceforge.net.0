Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A78852DE9D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 22:47:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrn37-0000yU-MH; Thu, 19 May 2022 20:47:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrn36-0000yI-MX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 20:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JwBRujFCrvhEr0m+QCqDT7QAWT9ghEEbK544DO4Gw8Y=; b=J3LTNVE5LCFaP+sM+1w2yq0HdN
 ewpfXmPs9mqQpVVXwnIy2yIWTYoDm0rN2exwyfYtqQDGWqkX31iCnTkgR+hDfNYILGnq4mDMZK5nD
 yawkl+duPWUAhB4b5k6PO2pSEpcCPR1QTjyDENvtVgSz+MIvTCzuGhchPj0YPInmZbnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JwBRujFCrvhEr0m+QCqDT7QAWT9ghEEbK544DO4Gw8Y=; b=hxE3sIF1oT99N9aRgIloOlOi4Q
 TbIVS7361HoXK0Zi1hPhzxt6+qvwgDgUI8kCX3LrWFoyKiNYfQloh9dgiAtRoJycweegB3cdGDWIm
 0tkmD6xgvVhbr3hQRBR23tksa/yW4DQPBrAAcydbYk0uGJgaVcXd9Zuu2+I/mZ1orBBg=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrn34-0004Yt-TA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 20:47:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 85D151F4541F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652993220;
 bh=Yy1A6Vts7piejGKGGyulGEO3LNJA5px4YK35G29ueMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L7pvKsAddjXO2/q7c/0Cwsx2EHKVeP4DPPC1rL+sHARFbYA5b+xxOQ3aKSkwPJvOg
 ln/N5rK9ZOkOqMLZjbfmacv13/GyP8Cq67KKf9HfrbpDzs98X1HANgWT8rnsMh3esi
 c4d8DOGRWhiYvc39SJCaL7Hde5fexWPsrTZvybhkT6wwMCU9yVQaP034uhQksm/m0k
 Wwq/2KfDQ2lrszHVPnN1UVpR8UIiE+FIwKxR02pI/RgeMZuz9Yf8x4FI/ozFVL78El
 JrM7WZTueDnsWDnASDONYfIcbDl+m9eZES/vWV7+AstBEL0B9b58M/SIwkotSjGrTu
 yipWUBABSjEzA==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Thu, 19 May 2022 16:46:40 -0400
Message-Id: <20220519204645.16528-4-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519204645.16528-1-krisman@collabora.com>
References: <20220519204645.16528-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic_ci_match can be used by case-insensitive filesystems
 to compare strings under lookup with dirents in a case-insensitive way. This
 function is currently reimplemented by each filesystem support [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrn34-0004Yt-TA
Subject: [f2fs-dev] [PATCH v7 3/8] libfs: Introduce case-insensitive string
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
Cc: linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>,
 kernel@collabora.com, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic_ci_match can be used by case-insensitive filesystems to compare
strings under lookup with dirents in a case-insensitive way.  This
function is currently reimplemented by each filesystem supporting
casefolding, so this reduces code duplication in filesystem-specific
code.

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v5:
  (eric)
  - Rename variable err -> res
  - Retype de_name_len from size_t to u32
  - Bring WARN_ON_ONCE(!fscrypt_has_encryption_key) from f2fs implementation
---
 fs/libfs.c         | 68 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  4 +++
 2 files changed, 72 insertions(+)

diff --git a/fs/libfs.c b/fs/libfs.c
index 974125270a42..f1d88cd903f8 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1465,6 +1465,74 @@ static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
 	.d_compare = generic_ci_d_compare,
 };
+
+/**
+ * generic_ci_match() - Match a name (case-insensitively) with a dirent.
+ * @parent: Inode of the parent of the dirent under comparison
+ * @name: name under lookup.
+ * @folded_name: Optional pre-folded name under lookup
+ * @de_name: Dirent name.
+ * @de_name_len: dirent name length.
+ *
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
+	int res, match = false;
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
+	if (folded_name->name)
+		res = utf8_strncasecmp_folded(um, folded_name, &dirent);
+	else
+		res = utf8_strncasecmp(um, name, &dirent);
+
+	if (!res)
+		match = true;
+	else if (res < 0 && !sb_has_strict_encoding(sb)) {
+		/*
+		 * In non-strict mode, fallback to a byte comparison if
+		 * the names have invalid characters.
+		 */
+		res = 0;
+		match = ((name->len == dirent.len) &&
+			 !memcmp(name->name, dirent.name, dirent.len));
+	}
+
+out:
+	kfree(decrypted_name.name);
+	return (res >= 0) ? match : res;
+}
+EXPORT_SYMBOL(generic_ci_match);
 #endif
 
 #ifdef CONFIG_FS_ENCRYPTION
diff --git a/include/linux/fs.h b/include/linux/fs.h
index e2d892b201b0..4c2b781f667a 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3359,6 +3359,10 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 extern int generic_check_addressable(unsigned, u64);
 
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
+extern int generic_ci_match(const struct inode *parent,
+			    const struct qstr *name,
+			    const struct qstr *folded_name,
+			    const u8 *de_name, u32 de_name_len);
 
 #ifdef CONFIG_MIGRATION
 extern int buffer_migrate_page(struct address_space *,
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
