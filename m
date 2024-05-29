Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5578D312E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 10:27:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCEeE-0001rz-G7;
	Wed, 29 May 2024 08:27:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1sCEeC-0001rm-9Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfdL4DmTTKOcRGA3JuyI6sr+VUPzq5VS2iIYac1Gc3k=; b=enDbQtMl/1jugEoFp9MZHaJZnc
 8BAwjkCM13MvQlPcp0lTdt8v02jsJN3gRSK8BdSBk4ThcVgtjn2NmIEEFM2QyNML/C3Kw5WDUyugO
 PaNcuD23x+MCViTM4QulehLxzM79mLlLzuzxAd2VxglEW23fLkxQY21hsR1pKtHuutJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cfdL4DmTTKOcRGA3JuyI6sr+VUPzq5VS2iIYac1Gc3k=; b=Nwt1ofMB2wycprpqoxSPCBx4p1
 uAUYCipLhwUbGAHB0wYlNnKWKwVLjc+16NmngBaJCdG2l4WhNQO6Qs3uSEV7K/rnAlzkySh0kkSsf
 +NAW235SXaHPNULkqOloLPJzITnSuz3l8CuVd07X+KrIJw8ndYwV2rdN7xrlWHtizS/0=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCEeC-00005B-ED for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 08:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716971208;
 bh=Rsfw/Z1/w9bi5bHJL1wBN1TEmEgG5zrrj+bowQVUnaY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jm3x9aNF+h2RIuPsJql64BUs0tQateJFlRCZba8efSMJiwTN/p+DVqpR678H0OBwv
 /nULqA0CyDFxgpz1InOjm29gu7kvTAtUDftlN8dU4qIG5oFZAygiEjj4sfNUn9OhHc
 lNNPf/MqeuiZfE0O2pQ917PZJSNSHI3U6PZjHNvCPQvZmftZtB6UeDssZGT5fcJbwR
 DimP4+THehgDqoo8J79enI26lkT/yVuiDEzEr7QqntoQuWA4Otz3aMBqKQiWu3RiHJ
 SS71b7sMSqBdn+oTAxoEatBP6jfQrWVE9P/FuFdu5djSitJlLDR1Pd9IpB+A/cthG4
 gQusRwLcXjcPQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 646CD378216B;
 Wed, 29 May 2024 08:26:47 +0000 (UTC)
To: linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, adilger.kernel@dilger.ca, tytso@mit.edu
Date: Wed, 29 May 2024 11:26:29 +0300
Message-Id: <20240529082634.141286-3-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529082634.141286-1-eugen.hristev@collabora.com>
References: <20240529082634.141286-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Gabriel Krisman Bertazi <krisman@collabora.com> Keeping
 it as qstr avoids the unnecessary conversion in f2fs_match Signed-off-by:
 Gabriel Krisman Bertazi <krisman@collabora.com> [eugen.hristev@collabora.com:
 port to 6.10-rc1 and minor changes] Signed-off-by: Eugen Hristev
 <eugen.hristev@collabora.com> Reviewed-by: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [46.235.227.194 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [46.235.227.194 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCEeC-00005B-ED
Subject: [f2fs-dev] [PATCH v17 2/7] f2fs: Simplify the handling of cached
 casefolded names
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
Cc: krisman@suse.de, brauner@kernel.org, jack@suse.cz, ebiggers@google.com,
 Eugen Hristev <eugen.hristev@collabora.com>, viro@zeniv.linux.org.uk,
 kernel@collabora.com, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

Keeping it as qstr avoids the unnecessary conversion in f2fs_match

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
[eugen.hristev@collabora.com: port to 6.10-rc1 and minor changes]
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
Reviewed-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/dir.c      | 53 ++++++++++++++++++++++++++--------------------
 fs/f2fs/f2fs.h     | 16 +++++++++++++-
 fs/f2fs/recovery.c |  9 +-------
 3 files changed, 46 insertions(+), 32 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 02c9355176d3..bdf980e25adb 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -42,35 +42,49 @@ static unsigned int bucket_blocks(unsigned int level)
 		return 4;
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
 
 	if (IS_CASEFOLDED(dir) &&
 	    !is_dot_dotdot(fname->usr_fname->name, fname->usr_fname->len)) {
-		fname->cf_name.name = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
-					GFP_NOFS, false, F2FS_SB(sb));
-		if (!fname->cf_name.name)
+		buf = f2fs_kmem_cache_alloc(f2fs_cf_name_slab,
+					    GFP_NOFS, false, F2FS_SB(sb));
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
@@ -142,12 +156,7 @@ void f2fs_free_filename(struct f2fs_filename *fname)
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
@@ -235,11 +244,9 @@ static inline int f2fs_match_name(const struct inode *dir,
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
index 1974b6aff397..8a9d910aa552 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -531,7 +531,7 @@ struct f2fs_filename {
 	 * internal operation where usr_fname is also NULL.  In all these cases
 	 * we fall back to treating the name as an opaque byte sequence.
 	 */
-	struct fscrypt_str cf_name;
+	struct qstr cf_name;
 #endif
 };
 
@@ -3533,8 +3533,22 @@ int f2fs_get_tmpfile(struct mnt_idmap *idmap, struct inode *dir,
 /*
  * dir.c
  */
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
+
+static inline void f2fs_free_casefolded_name(struct f2fs_filename *fname)
+{
+}
+#endif /* CONFIG_UNICODE */
+
 int f2fs_setup_filename(struct inode *dir, const struct qstr *iname,
 			int lookup, struct f2fs_filename *fname);
 int f2fs_prepare_lookup(struct inode *dir, struct dentry *dentry,
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 496aee53c38a..8712e264071f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -46,10 +46,6 @@
 
 static struct kmem_cache *fsync_entry_slab;
 
-#if IS_ENABLED(CONFIG_UNICODE)
-extern struct kmem_cache *f2fs_cf_name_slab;
-#endif
-
 bool f2fs_space_for_roll_forward(struct f2fs_sb_info *sbi)
 {
 	s64 nalloc = percpu_counter_sum_positive(&sbi->alloc_valid_block_count);
@@ -153,11 +149,8 @@ static int init_recovered_filename(const struct inode *dir,
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
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
