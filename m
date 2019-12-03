Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B31EA10F75D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:36:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vDa8bMokJ4rf+qSHmoEdhVhninu1bdqng3az43pH1kc=; b=cvueYx2vC5W+0Dg0aS+Itxl3i
	zak8/oyMrxfKAdMLLMlDUItLMYqdFKMz8mOE5j+7MCurbORNO5IsTStNxVt05du7R3sAVBqF+KqR/
	PrG15WediwG70H9I7oJcV+KJSnTSifn/Ci+d6CCkwHQ9HaremLZkcrufqaM907MF0fAoQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0qs-0000ti-UX; Tue, 03 Dec 2019 05:35:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3eO7lXQYKAOEGURVHQJRRJOH.FRP@flex--drosen.bounces.google.com>)
 id 1ic0qr-0000tV-QN
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X28bmit6Be5wFiUFdwriYdO4L8/Cn/Z12Z6gifJOjMo=; b=U1nXPYtEJjjhST2GK4twL9/Sx
 CAZHNAPVy1h2CE2uHbBfzuEy6E0qRy8pjUTPhx+XC4TfO2N3uPnJvRvwpuH0q2n53jH7fPxsc2IJz
 4Nhp35l8CKMHaJiU+XmiZfmtdzf3tQKTrEuv/unxIebr3bK2Eyq/r/jNdUrU6UfJ534bo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X28bmit6Be5wFiUFdwriYdO4L8/Cn/Z12Z6gifJOjMo=; b=cgJ8cI6o2DEWWxIcUmqLq5YV7N
 lyBEVt6FaCeBKUnXAVEiJ9ohiwLChV5X25HlUe5i64OXaQXmjmVCBwAWYr38tgSBMktD6GugyVUYA
 SiE7nWoNcE46MvWXS+2a7jGF+zXiOcOEJ0qLd+S7xq4HCNC2I49EWCKhrl2YR9Bfuyk8=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0qq-005KBr-Ab
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:35:57 +0000
Received: by mail-pf1-f202.google.com with SMTP id r2so1494672pfl.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=X28bmit6Be5wFiUFdwriYdO4L8/Cn/Z12Z6gifJOjMo=;
 b=GeQWV+Hew/MeVg47Uuz8+iKIcCNgCTGqrULNjSd2AOgRyQdM21/0tJjtCou0yKGVnk
 VdNMfs4hIpZggMPbQmkwXYt7o52uE2kG6iyZK+beerTnQuywpiFFaBX7VsPFkjs4krus
 WOa0Bf54YOjdZFMJNg4LYBzCzBa5O79c1ni892XDm+iQP/Jc/SNJzZDRQzV1cO+t4xP2
 qgHtRbdkJuBDtL9489Wy//Z0yO18nFo2ztPmg7fAdq5zkm4brRLHitdjJPbFEzFuEBMS
 aBrY8+h1A+VjMRK4TaLOxHFJ1EVlxFF2WZ0aLY40wj7/CDF3S8x6mxFPHjrxfZJ7g1Ka
 vPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=X28bmit6Be5wFiUFdwriYdO4L8/Cn/Z12Z6gifJOjMo=;
 b=KIOp7dTYU7aRrsIxh7pbMVG1bf5LJixKuazG9yj2sLqHNyvuQJh+ku5a/9zGJRmXUq
 qbgI7LLekwRvtrjynAvqJAcmf6IgtgmomBIFQW3pI/+pIozBN2eEOog8J/ilske4zYEB
 kcSm3c0Ejb5l+XYYwg85xt2WPdODSEUv1x1Mw1H5nWp5yummNGvwyvcROPQTwipaHcot
 a8GuId5pXHLuvqn5hjc3aBckXIkkYn+At0dpqV9MV+C2tZcRn8fErs1uH6m4un2uL4/n
 P604IZWjNyO4RJ+JeV5lQRrTNK+3lJGS+nndwsWP9eo0cPluc4f8jYEV4EGYnBNstBAW
 xE9g==
X-Gm-Message-State: APjAAAUraXKOEl3CfeQxb63W6bx/HUgTzpIfYpusLRfZN8tVXGQ4ED9p
 aRQnkxLAzNo2+BlJsZLR9ld7lWQvKr8=
X-Google-Smtp-Source: APXvYqz49G120pKr37YRflHcPM7os/XBxfAQfpuY8yX9OSMFUZRcod/ZVumGfhaJZhB2fZ7weRrm88eVT2c=
X-Received: by 2002:a63:d153:: with SMTP id c19mr3375088pgj.78.1575349880315; 
 Mon, 02 Dec 2019 21:11:20 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:42 -0800
In-Reply-To: <20191203051049.44573-1-drosen@google.com>
Message-Id: <20191203051049.44573-2-drosen@google.com>
Mime-Version: 1.0
References: <20191203051049.44573-1-drosen@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -8.0 (--------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ic0qq-005KBr-Ab
Subject: [f2fs-dev] [PATCH 1/8] fscrypt: Add siphash and hash key for policy
 v2
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

When using casefolding along with encryption, we need to use a
cryptographic hash to allow fast filesystem operations while not knowing
the case of the name stored on disk while not revealing extra
information about the name if the key is not present.

When a v2 policy is used on a directory, we derive a key for use with
siphash.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c           | 22 ++++++++++++++++++++++
 fs/crypto/fscrypt_private.h |  9 +++++++++
 fs/crypto/keysetup.c        | 29 ++++++++++++++++++++---------
 include/linux/fscrypt.h     |  8 ++++++++
 4 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 3da3707c10e3..b33f03b9f892 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/scatterlist.h>
+#include <linux/siphash.h>
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
@@ -400,3 +401,24 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 	return ret;
 }
 EXPORT_SYMBOL(fscrypt_setup_filename);
+
+/**
+ * fscrypt_fname_siphash() - Calculate the siphash for a file name
+ * @dir: the parent directory
+ * @name: the name of the file to get the siphash of
+ *
+ * Given a user-provided filename @name, this function calculates the siphash of
+ * that name using the hash key stored with the directory's policy.
+ *
+ *
+ * Return: the siphash of @name using the hash key of @dir
+ */
+u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name)
+{
+	struct fscrypt_info *ci = dir->i_crypt_info;
+
+	WARN_ON(!ci || !ci->ci_hash_key_initialized);
+
+	return siphash(name->name, name->len, &ci->ci_hash_key);
+}
+EXPORT_SYMBOL(fscrypt_fname_siphash);
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index 130b50e5a011..f0dfef9921de 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -12,6 +12,7 @@
 #define _FSCRYPT_PRIVATE_H
 
 #include <linux/fscrypt.h>
+#include <linux/siphash.h>
 #include <crypto/hash.h>
 
 #define CONST_STRLEN(str)	(sizeof(str) - 1)
@@ -194,6 +195,13 @@ struct fscrypt_info {
 	 */
 	struct fscrypt_direct_key *ci_direct_key;
 
+	/*
+	 * With v2 policies, this can be used with siphash
+	 * When the key has been set, ci_hash_key_initialized is set to true
+	 */
+	siphash_key_t ci_hash_key;
+	bool ci_hash_key_initialized;
+
 	/* The encryption policy used by this inode */
 	union fscrypt_policy ci_policy;
 
@@ -286,6 +294,7 @@ extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 #define HKDF_CONTEXT_PER_FILE_KEY	2
 #define HKDF_CONTEXT_DIRECT_KEY		3
 #define HKDF_CONTEXT_IV_INO_LBLK_64_KEY	4
+#define HKDF_CONTEXT_FNAME_HASH_KEY     5
 
 extern int fscrypt_hkdf_expand(struct fscrypt_hkdf *hkdf, u8 context,
 			       const u8 *info, unsigned int infolen,
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index f577bb6613f9..e6c7ec04cd25 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -192,7 +192,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 				     ci->ci_mode->friendly_name);
 			return -EINVAL;
 		}
-		return setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
+		err = setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
 					  HKDF_CONTEXT_DIRECT_KEY, false);
 	} else if (ci->ci_policy.v2.flags &
 		   FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) {
@@ -202,20 +202,31 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 		 * the IVs.  This format is optimized for use with inline
 		 * encryption hardware compliant with the UFS or eMMC standards.
 		 */
-		return setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
+		err = setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
 					  HKDF_CONTEXT_IV_INO_LBLK_64_KEY,
 					  true);
-	}
-
-	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
+	} else {
+		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
 				  HKDF_CONTEXT_PER_FILE_KEY,
 				  ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE,
 				  derived_key, ci->ci_mode->keysize);
-	if (err)
-		return err;
+		if (err)
+			return err;
+
+		err = fscrypt_set_derived_key(ci, derived_key);
+		memzero_explicit(derived_key, ci->ci_mode->keysize);
+		if (err)
+			return err;
+	}
 
-	err = fscrypt_set_derived_key(ci, derived_key);
-	memzero_explicit(derived_key, ci->ci_mode->keysize);
+	if (S_ISDIR(ci->ci_inode->i_mode)) {
+		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
+			  HKDF_CONTEXT_FNAME_HASH_KEY,
+			  ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE,
+			  (u8 *)&ci->ci_hash_key, sizeof(ci->ci_hash_key));
+		if (!err)
+			ci->ci_hash_key_initialized = true;
+	}
 	return err;
 }
 
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 1a7bffe78ed5..e13ff68a99f0 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -155,6 +155,8 @@ extern int fscrypt_fname_alloc_buffer(const struct inode *, u32,
 extern void fscrypt_fname_free_buffer(struct fscrypt_str *);
 extern int fscrypt_fname_disk_to_usr(struct inode *, u32, u32,
 			const struct fscrypt_str *, struct fscrypt_str *);
+extern u64 fscrypt_fname_siphash(const struct inode *dir,
+					const struct qstr *name);
 
 #define FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE	32
 
@@ -446,6 +448,12 @@ static inline int fscrypt_fname_disk_to_usr(struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
+static inline u64 fscrypt_fname_siphash(const struct inode *inode,
+					const struct qstr *name)
+{
+	return 0;
+}
+
 static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 				      const u8 *de_name, u32 de_name_len)
 {
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
