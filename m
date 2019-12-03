Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8010F762
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2019 06:38:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eIXGisp27utoccHpcOW7WgWRJ4wMiu41rdMLZPigyb8=; b=A0vtZ0ZeJlOzx4WtElr8so9H6
	lq7D09k835atK5XA0yd0vIMk9WdwqzqfcDK9Sco+sgjvhqy2Ht/cHL8ZCcN47kfPTEcym5+sGRu9z
	SUt6uBVMLBuarChDQc46nw03G0JvNWEdGKBIHQDr/YQo5U6lPhbpOWCWh/LQP60H2pCis=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ic0tB-0001Av-9V; Tue, 03 Dec 2019 05:38:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3fe7lXQYKAOYLZWaMVOWWOTM.KWU@flex--drosen.bounces.google.com>)
 id 1ic0tA-0001An-TU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fjDzYP4akxITglcH3eYkmUeETy7YJmWTmEYTLRKX/0M=; b=cmLbgtcvgKw6N/t7T9zwha09j
 7/YHM03E/ViBDwvsNFD8npt06dOo5kUUq4rWh512qPK/UIa11c2dvrBYYYPy9I7eWtS5xQTvEGdiv
 R0SyZumaJbZH9EnQ8C5WY31ubROJmb9CGEOBkT0ePla0rx5nd7GBHWsHPKRDCC5Wd99CY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fjDzYP4akxITglcH3eYkmUeETy7YJmWTmEYTLRKX/0M=; b=HEIDGGgj/RvJGesThLI9qfVwOr
 HwqJVjbwe7hrOH+wY4J/9aXjC8z4lnbXZwaFnLBCblKVD3yP5BTGherjz+bLeviHx4WYgEyzLy9Lc
 vvUYWbQrZ6YGPMT30ycLJ/HaD/eXAJOml/DJ0ULWTadhXUDrNarZ6bS0y5tookylLH4o=;
Received: from mail-qt1-f201.google.com ([209.85.160.201])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1ic0t8-001gUW-JO
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Dec 2019 05:38:20 +0000
Received: by mail-qt1-f201.google.com with SMTP id z7so1624500qto.23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Dec 2019 21:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=fjDzYP4akxITglcH3eYkmUeETy7YJmWTmEYTLRKX/0M=;
 b=hbPWGUEtK2jN8yaTm9Zv+Q/61kQAWMlhNlq+s6pZOiY+aFGPsX1qPRakzazbIbIsvF
 N/P7H7X7ZllbDi/doW4qa/0i6iICr7x8vzkZgvbJ8vMGfLDGek2/+uxlmyNrsQwDqZAA
 igtYjR2XLx0uk3QUms4Fpzr9e4mz5AA9LDbpMETCTg1g9eY0MqIUWO2Bqh9HUXM4fnqz
 hj+Cdj5X+Y25MqFEqWP8FaX9TmhL5DiUTp77pcLil21Fumc8/X4otJkPZ241kPtzxUad
 LXEkMTZ+oMtXBpp1lOVs3P4tkvgn/UuW0lFyAsk6aIVqdYPFnO9eLBPjc7OzeJmfNH7z
 yFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=fjDzYP4akxITglcH3eYkmUeETy7YJmWTmEYTLRKX/0M=;
 b=Oz7bvANSTqdfKN8eKrHVgLbAas55WETjClV+b3gElk8mrI5vI0j+ah7PW5Aa6r0lYy
 AnAxMSqJesTHGgtzwAsRXMaBq9uQnV8qIgUfVChS59Hu1sudIPJ7roeyoOl2oWqpWjVe
 Ckk3g2dHtrlocZl4+QuRQ2IbGaxubDLzUUHqpx9z1yUPVdcQnG/MLhQ3VZtPbjNTa+tq
 JlUcF3J+mfeQtKy4+Jl+LYGM1LFq/Xyh7YjqY6KCPR4YyAAsuWiWFCSA22RYLjDLSyJV
 jlK8vLzWW8w30v+HO4OI6KMpK5Z+VoRms4O8gbAjhoE/hY7FwF3lr49tP4VzFqHc7uqz
 oexA==
X-Gm-Message-State: APjAAAVK3ZbdBAw9k5WdNsIgRlBFYzn53D1d77EbWoy1zDQJR9TwGImQ
 BAFQMwGSeReAz3Een2aijHHf0ALWDCY=
X-Google-Smtp-Source: APXvYqwN6Ss7aRyiPUKI0kGpB0NmUeDfnOPXypeRPMIQb/7yTu5lxeNLysIa1CsoGdNc1/LgcJZ1XDTsCiA=
X-Received: by 2002:a65:5281:: with SMTP id y1mr1916819pgp.327.1575349885592; 
 Mon, 02 Dec 2019 21:11:25 -0800 (PST)
Date: Mon,  2 Dec 2019 21:10:44 -0800
In-Reply-To: <20191203051049.44573-1-drosen@google.com>
Message-Id: <20191203051049.44573-4-drosen@google.com>
Mime-Version: 1.0
References: <20191203051049.44573-1-drosen@google.com>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
To: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>, 
 linux-fscrypt@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: disk_name.name]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.201 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.201 listed in wl.mailspike.net]
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
X-Headers-End: 1ic0t8-001gUW-JO
Subject: [f2fs-dev] [PATCH 3/8] fscrypt: Change format of no-key token
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

Encrypted and casefolded names always require a dirtree hash, since
their hash values cannot be generated without the key.

In the new format, we always base64 encode the same structure. For names
that are less than 149 characters, we concatenate the provided hash and
ciphertext. If the name is longer than 149 characters, we also include
the sha256 of the remaining parts of the name. We then base64 encode the
resulting data to get a representation of the name that is at most 252
characters long, with a very low collision rate. We avoid needing to
compute the sha256 apart from in the case of a very long filename, and
then only need to compute the sha256 of possible matches if their
ciphertext is also longer than 149.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
---
 fs/crypto/Kconfig       |   1 +
 fs/crypto/fname.c       | 182 +++++++++++++++++++++++++++++-----------
 include/linux/fscrypt.h |  92 ++++++--------------
 3 files changed, 160 insertions(+), 115 deletions(-)

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index ff5a1746cbae..6e0d56f0b993 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -9,6 +9,7 @@ config FS_ENCRYPTION
 	select CRYPTO_CTS
 	select CRYPTO_SHA512
 	select CRYPTO_HMAC
+	select CRYPTO_SHA256
 	select KEYS
 	help
 	  Enable encryption of files and directories.  This
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index b33f03b9f892..03c837c461f2 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -14,8 +14,46 @@
 #include <linux/scatterlist.h>
 #include <linux/siphash.h>
 #include <crypto/skcipher.h>
+#include <crypto/hash.h>
 #include "fscrypt_private.h"
 
+static struct crypto_shash *sha256_hash_tfm;
+
+static int fscrypt_do_sha256(unsigned char *result,
+	     const u8 *data, unsigned int data_len)
+{
+	struct crypto_shash *tfm = READ_ONCE(sha256_hash_tfm);
+
+	if (unlikely(!tfm)) {
+		struct crypto_shash *prev_tfm;
+
+		tfm = crypto_alloc_shash("sha256", 0, 0);
+		if (IS_ERR(tfm)) {
+			if (PTR_ERR(tfm) == -ENOENT) {
+				fscrypt_warn(NULL,
+					     "Missing crypto API support for SHA-256");
+				return -ENOPKG;
+			}
+			fscrypt_err(NULL,
+				    "Error allocating SHA-256 transform: %ld",
+				    PTR_ERR(tfm));
+			return PTR_ERR(tfm);
+		}
+		prev_tfm = cmpxchg(&sha256_hash_tfm, NULL, tfm);
+		if (prev_tfm) {
+			crypto_free_shash(tfm);
+			tfm = prev_tfm;
+		}
+	}
+	{
+		SHASH_DESC_ON_STACK(desc, tfm);
+
+		desc->tfm = tfm;
+
+		return crypto_shash_digest(desc, data, data_len, result);
+	}
+}
+
 static inline bool fscrypt_is_dot_dotdot(const struct qstr *str)
 {
 	if (str->len == 1 && str->name[0] == '.')
@@ -208,8 +246,7 @@ int fscrypt_fname_alloc_buffer(const struct inode *inode,
 			       struct fscrypt_str *crypto_str)
 {
 	const u32 max_encoded_len =
-		max_t(u32, BASE64_CHARS(FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE),
-		      1 + BASE64_CHARS(sizeof(struct fscrypt_digested_name)));
+		      BASE64_CHARS(sizeof(struct fscrypt_nokey_name));
 	u32 max_presented_len;
 
 	max_presented_len = max(max_encoded_len, max_encrypted_len);
@@ -243,8 +280,9 @@ EXPORT_SYMBOL(fscrypt_fname_free_buffer);
  * The caller must have allocated sufficient memory for the @oname string.
  *
  * If the key is available, we'll decrypt the disk name; otherwise, we'll encode
- * it for presentation.  Short names are directly base64-encoded, while long
- * names are encoded in fscrypt_digested_name format.
+ * it for presentation.  The usr name is the base64 encoding of the dirtree hash
+ * value, the first 149 characters of the name, and the sha256 of the rest of
+ * the name, if longer than 149 characters.
  *
  * Return: 0 on success, -errno on failure
  */
@@ -254,7 +292,9 @@ int fscrypt_fname_disk_to_usr(struct inode *inode,
 			struct fscrypt_str *oname)
 {
 	const struct qstr qname = FSTR_TO_QSTR(iname);
-	struct fscrypt_digested_name digested_name;
+	struct fscrypt_nokey_name nokey_name;
+	u32 size;
+	int err = 0;
 
 	if (fscrypt_is_dot_dotdot(&qname)) {
 		oname->name[0] = '.';
@@ -269,25 +309,29 @@ int fscrypt_fname_disk_to_usr(struct inode *inode,
 	if (fscrypt_has_encryption_key(inode))
 		return fname_decrypt(inode, iname, oname);
 
-	if (iname->len <= FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE) {
-		oname->len = base64_encode(iname->name, iname->len,
-					   oname->name);
-		return 0;
-	}
+	size = min_t(u32, iname->len, FSCRYPT_FNAME_UNDIGESTED_SIZE);
+		memcpy(nokey_name.bytes, iname->name, size);
+
 	if (hash) {
-		digested_name.hash = hash;
-		digested_name.minor_hash = minor_hash;
+		nokey_name.dirtree_hash[0] = hash;
+		nokey_name.dirtree_hash[1] = minor_hash;
 	} else {
-		digested_name.hash = 0;
-		digested_name.minor_hash = 0;
+		nokey_name.dirtree_hash[0] = 0;
+		nokey_name.dirtree_hash[1] = 0;
 	}
-	memcpy(digested_name.digest,
-	       FSCRYPT_FNAME_DIGEST(iname->name, iname->len),
-	       FSCRYPT_FNAME_DIGEST_SIZE);
-	oname->name[0] = '_';
-	oname->len = 1 + base64_encode((const u8 *)&digested_name,
-				       sizeof(digested_name), oname->name + 1);
-	return 0;
+	size += sizeof(nokey_name.dirtree_hash);
+
+	if (iname->len > FSCRYPT_FNAME_UNDIGESTED_SIZE) {
+		/* compute sha256 of remaining name */
+		err = fscrypt_do_sha256(nokey_name.sha256,
+				&iname->name[FSCRYPT_FNAME_UNDIGESTED_SIZE],
+				iname->len - FSCRYPT_FNAME_UNDIGESTED_SIZE);
+		if (err)
+			return err;
+		size += sizeof(nokey_name.sha256);
+	}
+	oname->len = base64_encode((const u8 *)&nokey_name, size, oname->name);
+	return err;
 }
 EXPORT_SYMBOL(fscrypt_fname_disk_to_usr);
 
@@ -319,7 +363,6 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 			      int lookup, struct fscrypt_name *fname)
 {
 	int ret;
-	int digested;
 
 	memset(fname, 0, sizeof(struct fscrypt_name));
 	fname->usr_fname = iname;
@@ -359,42 +402,32 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 	 * We don't have the key and we are doing a lookup; decode the
 	 * user-supplied name
 	 */
-	if (iname->name[0] == '_') {
-		if (iname->len !=
-		    1 + BASE64_CHARS(sizeof(struct fscrypt_digested_name)))
-			return -ENOENT;
-		digested = 1;
-	} else {
-		if (iname->len >
-		    BASE64_CHARS(FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE))
-			return -ENOENT;
-		digested = 0;
-	}
 
 	fname->crypto_buf.name =
-		kmalloc(max_t(size_t, FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE,
-			      sizeof(struct fscrypt_digested_name)),
-			GFP_KERNEL);
+			kmalloc(sizeof(struct fscrypt_nokey_name), GFP_KERNEL);
 	if (fname->crypto_buf.name == NULL)
 		return -ENOMEM;
 
-	ret = base64_decode(iname->name + digested, iname->len - digested,
+	ret = base64_decode(iname->name, iname->len,
 			    fname->crypto_buf.name);
 	if (ret < 0) {
 		ret = -ENOENT;
 		goto errout;
 	}
-	fname->crypto_buf.len = ret;
-	if (digested) {
-		const struct fscrypt_digested_name *n =
-			(const void *)fname->crypto_buf.name;
-		fname->hash = n->hash;
-		fname->minor_hash = n->minor_hash;
-	} else {
-		fname->disk_name.name = fname->crypto_buf.name;
-		fname->disk_name.len = fname->crypto_buf.len;
+	if (ret > (int)offsetofend(struct fscrypt_nokey_name, sha256)) {
+		ret = -EINVAL;
+		goto errout;
+	}
+
+	{
+		struct fscrypt_nokey_name *n =
+				(void *)fname->crypto_buf.name;
+		fname->crypto_buf.len = ret;
+
+		fname->hash = n->dirtree_hash[0];
+		fname->minor_hash = n->dirtree_hash[1];
+		return 0;
 	}
-	return 0;
 
 errout:
 	kfree(fname->crypto_buf.name);
@@ -402,6 +435,61 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 }
 EXPORT_SYMBOL(fscrypt_setup_filename);
 
+/**
+ * fscrypt_match_name() - test whether the given name matches a directory entry
+ * @fname: the name being searched for
+ * @de_name: the name from the directory entry
+ * @de_name_len: the length of @de_name in bytes
+ *
+ * Normally @fname->disk_name will be set, and in that case we simply compare
+ * that to the name stored in the directory entry.  The only exception is that
+ * if we don't have the key for an encrypted directory and a filename in it is
+ * very long, then we won't have the full disk_name and we'll instead need to
+ * match against the fscrypt_digested_name.
+ *
+ * Return: %true if the name matches, otherwise %false.
+ */
+bool fscrypt_match_name(const struct fscrypt_name *fname,
+				      const u8 *de_name, u32 de_name_len)
+{
+	if (unlikely(!fname->disk_name.name)) {
+		const struct fscrypt_nokey_name *n =
+			(const void *)fname->crypto_buf.name;
+		u32 len;
+		bool check_sha256 = false;
+		u8 sha256[SHA256_DIGEST_SIZE];
+
+		if (fname->crypto_buf.len ==
+			    offsetofend(struct fscrypt_nokey_name, sha256)) {
+			len = FSCRYPT_FNAME_UNDIGESTED_SIZE;
+			check_sha256 = true;
+		} else {
+			len = fname->crypto_buf.len -
+				offsetof(struct fscrypt_nokey_name, bytes);
+		}
+		if (!check_sha256 && de_name_len != len)
+			return false;
+		if (check_sha256 && de_name_len <= len)
+			return false;
+		if (memcmp(de_name, n->bytes, len) != 0)
+			return false;
+		if (check_sha256) {
+			fscrypt_do_sha256(sha256,
+				&de_name[FSCRYPT_FNAME_UNDIGESTED_SIZE],
+				de_name_len - FSCRYPT_FNAME_UNDIGESTED_SIZE);
+			if (memcmp(sha256, n->sha256, sizeof(sha256)) != 0)
+				return false;
+		}
+
+		return true;
+	}
+
+	if (de_name_len != fname->disk_name.len)
+		return false;
+	return !memcmp(de_name, fname->disk_name.name, fname->disk_name.len);
+}
+EXPORT_SYMBOL(fscrypt_match_name);
+
 /**
  * fscrypt_fname_siphash() - Calculate the siphash for a file name
  * @dir: the parent directory
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 028aed925e51..ddb7245ba92b 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -16,6 +16,7 @@
 #include <linux/fs.h>
 #include <linux/mm.h>
 #include <linux/slab.h>
+#include <crypto/sha.h>
 #include <uapi/linux/fscrypt.h>
 
 #define FS_CRYPTO_BLOCK_SIZE		16
@@ -160,79 +161,34 @@ extern int fscrypt_fname_disk_to_usr(struct inode *, u32, u32,
 extern u64 fscrypt_fname_siphash(const struct inode *dir,
 					const struct qstr *name);
 
-#define FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE	32
-
-/* Extracts the second-to-last ciphertext block; see explanation below */
-#define FSCRYPT_FNAME_DIGEST(name, len)	\
-	((name) + round_down((len) - FS_CRYPTO_BLOCK_SIZE - 1, \
-			     FS_CRYPTO_BLOCK_SIZE))
-
-#define FSCRYPT_FNAME_DIGEST_SIZE	FS_CRYPTO_BLOCK_SIZE
-
 /**
- * fscrypt_digested_name - alternate identifier for an on-disk filename
+ * fscrypt_nokey_name - identifier for on-disk filenames when key is not present
  *
- * When userspace lists an encrypted directory without access to the key,
- * filenames whose ciphertext is longer than FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE
- * bytes are shown in this abbreviated form (base64-encoded) rather than as the
- * full ciphertext (base64-encoded).  This is necessary to allow supporting
- * filenames up to NAME_MAX bytes, since base64 encoding expands the length.
+ * When userspace lists an encrypted directory without access to the key, we
+ * must present them with a unique identifier for the file. base64 encoding will
+ * expand the space, so we use this format to avoid most collisions.
  *
- * To make it possible for filesystems to still find the correct directory entry
- * despite not knowing the full on-disk name, we encode any filesystem-specific
- * 'hash' and/or 'minor_hash' which the filesystem may need for its lookups,
- * followed by the second-to-last ciphertext block of the filename.  Due to the
- * use of the CBC-CTS encryption mode, the second-to-last ciphertext block
- * depends on the full plaintext.  (Note that ciphertext stealing causes the
- * last two blocks to appear "flipped".)  This makes accidental collisions very
- * unlikely: just a 1 in 2^128 chance for two filenames to collide even if they
- * share the same filesystem-specific hashes.
- *
- * However, this scheme isn't immune to intentional collisions, which can be
- * created by anyone able to create arbitrary plaintext filenames and view them
- * without the key.  Making the "digest" be a real cryptographic hash like
- * SHA-256 over the full ciphertext would prevent this, although it would be
- * less efficient and harder to implement, especially since the filesystem would
- * need to calculate it for each directory entry examined during a search.
+ * Filesystems may rely on the hash being present to look up a file on disk.
+ * For filenames that are both casefolded and encrypted, it is not possible to
+ * calculate the hash without the key. Additionally, if the ciphertext is longer
+ * than what we can base64 encode, we cannot generate the hash from the partial
+ * name. For simplicity, we always store the hash at the front of the name,
+ * followed by the first 149 bytes of the ciphertext, and then the sha256 of the
+ * remainder of the name if the ciphertext was longer than 149 bytes. For the
+ * usual case of relatively short filenames, this allows us to avoid needing to
+ * compute the sha256. This results in an encoded name that is at most 252 bytes
+ * long.
  */
-struct fscrypt_digested_name {
-	u32 hash;
-	u32 minor_hash;
-	u8 digest[FSCRYPT_FNAME_DIGEST_SIZE];
-};
 
-/**
- * fscrypt_match_name() - test whether the given name matches a directory entry
- * @fname: the name being searched for
- * @de_name: the name from the directory entry
- * @de_name_len: the length of @de_name in bytes
- *
- * Normally @fname->disk_name will be set, and in that case we simply compare
- * that to the name stored in the directory entry.  The only exception is that
- * if we don't have the key for an encrypted directory and a filename in it is
- * very long, then we won't have the full disk_name and we'll instead need to
- * match against the fscrypt_digested_name.
- *
- * Return: %true if the name matches, otherwise %false.
- */
-static inline bool fscrypt_match_name(const struct fscrypt_name *fname,
-				      const u8 *de_name, u32 de_name_len)
-{
-	if (unlikely(!fname->disk_name.name)) {
-		const struct fscrypt_digested_name *n =
-			(const void *)fname->crypto_buf.name;
-		if (WARN_ON_ONCE(fname->usr_fname->name[0] != '_'))
-			return false;
-		if (de_name_len <= FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE)
-			return false;
-		return !memcmp(FSCRYPT_FNAME_DIGEST(de_name, de_name_len),
-			       n->digest, FSCRYPT_FNAME_DIGEST_SIZE);
-	}
+#define FSCRYPT_FNAME_UNDIGESTED_SIZE 149
+struct fscrypt_nokey_name {
+	u32 dirtree_hash[2];
+	u8 bytes[FSCRYPT_FNAME_UNDIGESTED_SIZE];
+	u8 sha256[SHA256_DIGEST_SIZE];
+};
 
-	if (de_name_len != fname->disk_name.len)
-		return false;
-	return !memcmp(de_name, fname->disk_name.name, fname->disk_name.len);
-}
+extern bool fscrypt_match_name(const struct fscrypt_name *fname,
+				      const u8 *de_name, u32 de_name_len);
 
 /* bio.c */
 extern void fscrypt_decrypt_bio(struct bio *);
@@ -448,7 +404,7 @@ static inline void fscrypt_fname_free_buffer(struct fscrypt_str *crypto_str)
 }
 
 static inline int fscrypt_fname_disk_to_usr(struct inode *inode,
-					    u32 hash, u32 minor_hash,
+					    u32 dirtree_hash, u32 minor_hash,
 					    const struct fscrypt_str *iname,
 					    struct fscrypt_str *oname)
 {
-- 
2.24.0.393.g34dc348eaf-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
