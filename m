Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0E552C94E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 03:41:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrVAD-0007Zg-DN; Thu, 19 May 2022 01:41:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <krisman@collabora.com>) id 1nrVAB-0007ZZ-Kt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gj5jynOopSFp7jmesz4ae1H3HpfvOPHF/gzWgrtRSpk=; b=TZHhXJ0Uw1XtuFyJvZqbXLjGNe
 kuddEQFu25mH+ddsMU0EPQoVlrSpzmxxa3GG7R610Erzb+jR6ORkN2BPwix5I+qV3TYNu2rdJGj+a
 +eSDNTgRtPhEmIAlwpEkfhrZ1ILDF2Zzc0txxIGvbZl21JtzAFGY5dujv3qmynxfFqI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gj5jynOopSFp7jmesz4ae1H3HpfvOPHF/gzWgrtRSpk=; b=bL08BWnVN+7iZG6z35Ikl3cGss
 fFtMB2EmdgbjKr4p4gz+DvownbFH8W+8Ax4vMJRFtHGbyuJ53ekrBb5fA9F1CRljW+YwZjwKxKDPO
 FNKd2mg2PJvsxWX6AIUdkMoK8An5tGO9L2Dt1/dgmEcUEL1sC16QN1eWUUMxps+tgias=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrVA9-0001Tn-3S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 01:41:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id B79361F45433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652924467;
 bh=cH2M2NLBeHvcqRIeoQaGz+EW7WmyDnXYuZYPpQ77+Cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=X3IcEcmCwaDTQqsSYD6IAenZPuun+atpIlNcdo/CVQGwX9HBgKXtonaD/50Q6nFRq
 thJyDvEDNv/IIxgZTgfY7XR1KpZe1x7xDqZpjsrip7LFjHJjOTqnbf+5Ryk6ta6bsS
 NjxlBHpxkYxXGn5FEDy3F8o94KulwkwebaZs827EB1N3gK5Tff7qMz04mwuHpOBA//
 roEbKQadO4UQSDkG6BqXxONhnrNtADIcZ1/OE36Edg0sgjaynawcNPsBAF9X5bt8uA
 HQ0TrEYhcEgdx91q4bGudwcifwteq8CSOzDlWRDBYoKrGTQm3Nz+oduTAWaENhiurH
 L9f2q0usa19xQ==
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 ebiggers@kernel.org
Date: Wed, 18 May 2022 21:40:38 -0400
Message-Id: <20220519014044.508099-3-krisman@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519014044.508099-1-krisman@collabora.com>
References: <20220519014044.508099-1-krisman@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Keeping it as qstr avoids the unnecessary conversion in
 f2fs_match
 Reviewed-by: Eric Biggers <ebiggers@google.com> Signed-off-by: Gabriel Krisman
 Bertazi <krisman@collabora.com> --- Changes since v4: - Fix inconsistent
 return on error (eric) --- fs/f2fs/dir.c | 51 ++++++++++++++++++++++++++
 fs/f2fs/f2fs.h
 | 15 +++++++++++++- fs/f2fs/recovery.c | 5 +---- 3 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 UNPARSEABLE_RELAY      Informational: message has unparseable relay
 lines -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nrVA9-0001Tn-3S
Subject: [f2fs-dev] [PATCH v6 2/8] f2fs: Simplify the handling of cached
 insensitive names
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

Keeping it as qstr avoids the unnecessary conversion in f2fs_match

Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

---
Changes since v4:
  - Fix inconsistent return on error (eric)
---
 fs/f2fs/dir.c      | 51 ++++++++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     | 15 +++++++++++++-
 fs/f2fs/recovery.c |  5 +----
 3 files changed, 44 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 166f08623362..167a04074a2e 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -75,34 +75,48 @@ unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de)
 	return DT_UNKNOWN;
 }
 
+#if IS_ENABLED(CONFIG_UNICODE)
 /* If @dir is casefolded, initialize @fname->cf_name from @fname->usr_fname. */
 int f2fs_init_casefolded_name(const struct inode *dir,
 			      struct f2fs_filename *fname)
 {
-#if IS_ENABLED(CONFIG_UNICODE)
 	struct super_block *sb = dir->i_sb;
+	unsigned char *buf;
+	int len;
 
 	if (IS_CASEFOLDED(dir)) {
-		fname->cf_name.name = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
+		buf = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
 					GFP_NOFS, false, F2FS_SB(sb));
-		if (!fname->cf_name.name)
+		if (!buf)
 			return -ENOMEM;
-		fname->cf_name.len = utf8_casefold(sb->s_encoding,
-						   fname->usr_fname,
-						   fname->cf_name.name,
-						   F2FS_NAME_LEN);
-		if ((int)fname->cf_name.len <= 0) {
-			kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
-			fname->cf_name.name = NULL;
+
+		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
+				    buf, F2FS_NAME_LEN);
+		if (len <= 0) {
+			kmem_cache_free(f2fs_cf_name_slab, buf);
 			if (sb_has_strict_encoding(sb))
 				return -EINVAL;
 			/* fall back to treating name as opaque byte sequence */
+			return 0;
 		}
+		fname->cf_name.name = buf;
+		fname->cf_name.len = len;
 	}
-#endif
+
 	return 0;
 }
 
+void f2fs_free_casefolded_name(struct f2fs_filename *fname)
+{
+	unsigned char *buf = (unsigned char *)fname->cf_name.name;
+
+	if (buf) {
+		kmem_cache_free(f2fs_cf_name_slab, buf);
+		fname->cf_name.name = NULL;
+	}
+}
+#endif /* CONFIG_UNICODE */
+
 static int __f2fs_setup_filename(const struct inode *dir,
 				 const struct fscrypt_name *crypt_name,
 				 struct f2fs_filename *fname)
@@ -174,12 +188,7 @@ void f2fs_free_filename(struct f2fs_filename *fname)
 	kfree(fname->crypto_buf.name);
 	fname->crypto_buf.name = NULL;
 #endif
-#if IS_ENABLED(CONFIG_UNICODE)
-	if (fname->cf_name.name) {
-		kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
-		fname->cf_name.name = NULL;
-	}
-#endif
+	f2fs_free_casefolded_name(fname);
 }
 
 static unsigned long dir_block_index(unsigned int level,
@@ -267,11 +276,9 @@ static inline int f2fs_match_name(const struct inode *dir,
 	struct fscrypt_name f;
 
 #if IS_ENABLED(CONFIG_UNICODE)
-	if (fname->cf_name.name) {
-		struct qstr cf = FSTR_TO_QSTR(&fname->cf_name);
-
-		return f2fs_match_ci_name(dir, &cf, de_name, de_name_len);
-	}
+	if (fname->cf_name.name)
+		return f2fs_match_ci_name(dir, &fname->cf_name,
+					  de_name, de_name_len);
 #endif
 	f.usr_fname = fname->usr_fname;
 	f.disk_name = fname->disk_name;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 68b44015514f..5eb88be507e7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -497,7 +497,7 @@ struct f2fs_filename {
 	 * NULL.  In all these cases we fall back to treating the name as an
 	 * opaque byte sequence.
 	 */
-	struct fscrypt_str cf_name;
+	struct qstr cf_name;
 #endif
 };
 
@@ -3343,8 +3343,21 @@ struct dentry *f2fs_get_parent(struct dentry *child);
  * dir.c
  */
 unsigned char f2fs_get_de_type(struct f2fs_dir_entry *de);
+#if IS_ENABLED(CONFIG_UNICODE)
 int f2fs_init_casefolded_name(const struct inode *dir,
 			      struct f2fs_filename *fname);
+void f2fs_free_casefolded_name(struct f2fs_filename *fname);
+#else
+static inline int f2fs_init_casefolded_name(const struct inode *dir,
+					    struct f2fs_filename *fname)
+{
+	return 0;
+}
+static inline void f2fs_free_casefolded_name(struct f2fs_filename *fname)
+{
+}
+#endif /* CONFIG_UNICODE */
+
 int f2fs_setup_filename(struct inode *dir, const struct qstr *iname,
 			int lookup, struct f2fs_filename *fname);
 int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 79773d322c47..3c3a8abf6953 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -149,11 +149,8 @@ static int init_recovered_filename(const struct inode *dir,
 		if (err)
 			return err;
 		f2fs_hash_filename(dir, fname);
-#if IS_ENABLED(CONFIG_UNICODE)
 		/* Case-sensitive match is fine for recovery */
-		kmem_cache_free(f2fs_cf_name_slab, fname->cf_name.name);
-		fname->cf_name.name = NULL;
-#endif
+		f2fs_free_casefolded_name(fname);
 	} else {
 		f2fs_hash_filename(dir, fname);
 	}
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
