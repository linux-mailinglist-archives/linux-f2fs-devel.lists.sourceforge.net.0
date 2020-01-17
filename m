Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5B31413AB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 22:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=98ok7cVe+X/AVzy/5XELDlc8CInzyjnQqtiEfzCuP+0=; b=eAsApNTxTk0g1wBpdj0UmO7Rh
	zxBcqDIsRJBXsCZJvqItrUaHIM9T2bVJpqvRgBXJSPtOJ4LT1jecZQXVgZTql62XmraOGOkxXo6ac
	tV/XdtbhJ/Pqveb8UthtGET48Mb8SgNgw+x3wpcKGADM+Coiy3MSQ2NYWh8ade0r5Qwv4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isZV3-0000Gw-TT; Fri, 17 Jan 2020 21:49:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3YSoiXgYKADYVjgkWfYggYdW.Uge@flex--drosen.bounces.google.com>)
 id 1isZV3-0000Gm-4o
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oVzP1lZIn+a9St2ynepuCubjBDmFUsIeC3EfH/4msv0=; b=NeJoN8+B4KzhtD1v0lYSHbSbP
 XzQN6DN9HDevtnQjQ4mPoLvWajuvQMC6jiyirLwXgcd9idE4AXw4YhRDsPIHwT2yQqVYzveHCXtt3
 6I25qwvTw9OAqE8BnZOHqBJFor+p4HAapnqp35Tf3VixstApmHEBwCj/FvrGg8PaEtQpE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oVzP1lZIn+a9St2ynepuCubjBDmFUsIeC3EfH/4msv0=; b=SbgsS2JE1rNIfB8yAd2s3F3phR
 L9SBTnhypAFfMBghVoTKs6bqynpnD9oeF4RbQJsUXHe2Ruy0UUO+8zvQh+NaF0d81gql2jKqERd8L
 cHU1Y2JPe4KSqDdwAkh8MDtRwP42JwlxlM555OxpVUm/N42LimGcANEny3K6BZnt/Eeo=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isZV0-00Bhd6-7l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:49:53 +0000
Received: by mail-il1-f202.google.com with SMTP id k9so19667758ili.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 13:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=oVzP1lZIn+a9St2ynepuCubjBDmFUsIeC3EfH/4msv0=;
 b=RpJE0vRPtcFs+HwS/CjBwBybBr/6ggom40mvJvh3ijp1Iwn3zl70sBx/gr77hKICJW
 Nn+3hy98ID7+xceD3nY1pqc5rDoxEghmYiE44KXjp1v7sduUZaJffqZjavDWKbbW1pj/
 zvMqLu9v53P+kYkQf1EpgyOjfRf8tsQbfxmgAGShQ1s6rZFM4SwNE46oSlcAgkg3Svdr
 ad7rWRKJhiWki92ARxOdBSMv6FVelFEk33fmbCruHpr2B6yfyyI10LPh0QAmz8hu4++A
 65C7CE4mGfBlm9wXLVFLOmGV4Yze3r2BmuwbO/sz0YHYhTB8AqWnQ++5Hr4sN0Yqr88Z
 QNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=oVzP1lZIn+a9St2ynepuCubjBDmFUsIeC3EfH/4msv0=;
 b=r04PvsFfETW+vD913IjUbRJ5CFS/oY4+gSDoAuqT8YhR9kX62I8yCprcb55n/lZfcU
 GCm3aEABXS0C+m00YtWRIK6HggOF0bH+NL/a0u2cffitMy2EwYRXd/GTnmzUGiaTIm+H
 QFJ6uED4g7MHhEnRmyzqmZfQ6fWIM7PDZoaf4H8ORgScZA02Q8cLUEr1MFP2jFr6tmhg
 I85s27JhMQbepgZsDzSvNLct/NChUwA7bik/j4njBopSzJ6Dzv+RG2ikM5tci0hiBfKT
 vNkcLBNsagTubttKsTIBYKqm6ailNWLwivkZddnNbUBWrQB8pBsibSPw+12narSI+v2W
 XxBg==
X-Gm-Message-State: APjAAAWrYtSFPhBe1wOFnNQmx3UDq/c8Vzb+mlsmElW4DjCtW8z/8Ryq
 rnLMFhZCfnf88NUE+jvDDiZ79Efbkxw=
X-Google-Smtp-Source: APXvYqyIgLp3Uf69UUUDJ12oPBO4Pke5blxqDXg302lLv/U33gnMRHUKpFqg0f+AuwAB8CavAzgqN8TQNc0=
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr46768529pgv.55.1579297377257; 
 Fri, 17 Jan 2020 13:42:57 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:38 -0800
In-Reply-To: <20200117214246.235591-1-drosen@google.com>
Message-Id: <20200117214246.235591-2-drosen@google.com>
Mime-Version: 1.0
References: <20200117214246.235591-1-drosen@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.8 (-------)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isZV0-00Bhd6-7l
Subject: [f2fs-dev] [PATCH v3 1/9] fscrypt: Add siphash and hash key for
 policy v2
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

With encryption and casefolding, we cannot simply take the hash of the
ciphertext because of case insensitivity, and we can't take the hash of
the unencrypted name since that would leak information about the
encrypted name. Instead we can use siphash to compute a keyed hash of
the file names.

When a v2 policy is used on a directory, we derive a key for use with
siphash.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/fname.c           | 22 ++++++++++++++++++++++
 fs/crypto/fscrypt_private.h |  9 +++++++++
 fs/crypto/keysetup.c        | 35 +++++++++++++++++++++++++----------
 include/linux/fscrypt.h     |  9 +++++++++
 4 files changed, 65 insertions(+), 10 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 3fd27e14ebdd6..371e8f01d1c8e 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -402,6 +402,28 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 }
 EXPORT_SYMBOL(fscrypt_setup_filename);
 
+/**
+ * fscrypt_fname_siphash() - Calculate the siphash for a file name
+ * @dir: the parent directory
+ * @name: the name of the file to get the siphash of
+ *
+ * Given a user-provided filename @name, this function calculates the siphash of
+ * that name using the directory's hash key.
+ *
+ * This assumes the directory uses a v2 policy, and the key is available.
+ *
+ * Return: the siphash of @name using the hash key of @dir
+ */
+u64 fscrypt_fname_siphash(const struct inode *dir, const struct qstr *name)
+{
+	struct fscrypt_info *ci = dir->i_crypt_info;
+
+	WARN_ON(!ci->ci_hash_key_initialized);
+
+	return siphash(name->name, name->len, &ci->ci_hash_key);
+}
+EXPORT_SYMBOL(fscrypt_fname_siphash);
+
 /*
  * Validate dentries in encrypted directories to make sure we aren't potentially
  * caching stale dentries after a key has been added.
diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index b22e8decebedd..8b37a5eebb574 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -12,6 +12,7 @@
 #define _FSCRYPT_PRIVATE_H
 
 #include <linux/fscrypt.h>
+#include <linux/siphash.h>
 #include <crypto/hash.h>
 
 #define CONST_STRLEN(str)	(sizeof(str) - 1)
@@ -188,6 +189,13 @@ struct fscrypt_info {
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
 
@@ -262,6 +270,7 @@ extern int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 #define HKDF_CONTEXT_PER_FILE_KEY	2
 #define HKDF_CONTEXT_DIRECT_KEY		3
 #define HKDF_CONTEXT_IV_INO_LBLK_64_KEY	4
+#define HKDF_CONTEXT_FNAME_HASH_KEY     5
 
 extern int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 			       const u8 *info, unsigned int infolen,
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 96074054bdbc8..7445ab76e0b32 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -189,7 +189,7 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 		 * This ensures that the master key is consistently used only
 		 * for HKDF, avoiding key reuse issues.
 		 */
-		return setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
+		err = setup_per_mode_key(ci, mk, mk->mk_direct_tfms,
 					  HKDF_CONTEXT_DIRECT_KEY, false);
 	} else if (ci->ci_policy.v2.flags &
 		   FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64) {
@@ -199,21 +199,36 @@ static int fscrypt_setup_v2_file_key(struct fscrypt_info *ci,
 		 * the IVs.  This format is optimized for use with inline
 		 * encryption hardware compliant with the UFS or eMMC standards.
 		 */
-		return setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
+		err = setup_per_mode_key(ci, mk, mk->mk_iv_ino_lblk_64_tfms,
 					  HKDF_CONTEXT_IV_INO_LBLK_64_KEY,
 					  true);
+	} else {
+		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
+					  HKDF_CONTEXT_PER_FILE_KEY,
+					  ci->ci_nonce,
+					  FS_KEY_DERIVATION_NONCE_SIZE,
+					  derived_key, ci->ci_mode->keysize);
+		if (err)
+			return err;
+
+		err = fscrypt_set_derived_key(ci, derived_key);
+		memzero_explicit(derived_key, ci->ci_mode->keysize);
 	}
-
-	err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
-				  HKDF_CONTEXT_PER_FILE_KEY,
-				  ci->ci_nonce, FS_KEY_DERIVATION_NONCE_SIZE,
-				  derived_key, ci->ci_mode->keysize);
 	if (err)
 		return err;
 
-	err = fscrypt_set_derived_key(ci, derived_key);
-	memzero_explicit(derived_key, ci->ci_mode->keysize);
-	return err;
+	if (S_ISDIR(ci->ci_inode->i_mode)) {
+		err = fscrypt_hkdf_expand(&mk->mk_secret.hkdf,
+					  HKDF_CONTEXT_FNAME_HASH_KEY,
+					  ci->ci_nonce,
+					  FS_KEY_DERIVATION_NONCE_SIZE,
+					  (u8 *)&ci->ci_hash_key,
+					  sizeof(ci->ci_hash_key));
+		if (err)
+			return err;
+		ci->ci_hash_key_initialized = true;
+	}
+	return 0;
 }
 
 /*
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 6fe8d0f96a4ac..1dfbed855beeb 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -172,6 +172,8 @@ extern int fscrypt_fname_disk_to_usr(const struct inode *inode,
 				     u32 hash, u32 minor_hash,
 				     const struct fscrypt_str *iname,
 				     struct fscrypt_str *oname);
+extern u64 fscrypt_fname_siphash(const struct inode *dir,
+				 const struct qstr *name);
 
 #define FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE	32
 
@@ -468,6 +470,13 @@ static inline int fscrypt_fname_disk_to_usr(const struct inode *inode,
 	return -EOPNOTSUPP;
 }
 
+static inline u64 fscrypt_fname_siphash(const struct inode *dir,
+					const struct qstr *name)
+{
+	WARN_ON_ONCE(1);
+	return 0;
+}
+
 static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
 				      const u8 *de_name, u32 de_name_len)
 {
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
