Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B631413A6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 22:49:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WC18eNWerqHfmJVRtmCmFgyOtP5Jx8uN+VeCsXA6Gjk=; b=Wcgqphc31ZoP6B0Uxhu/9Gogp
	9J7BB76ynsM3+liWIUmTCIo+ZhMnuJVfiHQYzGCFXa441gBnoTNHoEzstVPdBr420IpHYo7vCro1S
	7/XuomfLmdRkMLyrVJhzZY9xUOjcbcfSBSzzSBnZwzhwTXM42cBEHr3FI6OlVo0LVpYHA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isZUE-0002EA-8z; Fri, 17 Jan 2020 21:49:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3ZioiXgYKADsaolpbkdlldib.Zlj@flex--drosen.bounces.google.com>)
 id 1isZU6-0002Dm-TI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ukTX292U+2VcVX5ngLn2LgkUWhDOBHnzjPplbC8odDM=; b=Ifx65AiDVk57XRTe1KsofG90N
 YiNcAAcuMCwBmtgnLDoLwfbPoG8MCzwKNOdPAgOiL2OjGnAxSwm4qIsM6GhAf3+2AYu2LPi/+pvoU
 9j9TqulBIvhO+kL0oW11hP5u4d1kONX/ODGWk3NG6VRXAsgeL8vujTD8pq+0yp2laKRCo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ukTX292U+2VcVX5ngLn2LgkUWhDOBHnzjPplbC8odDM=; b=h1EhYdQd9txtPzg2GrXZtn8OYc
 KPtVxriaumfL7Jp2ao9QzlXRm/TgVQ7tQsG2toTAwYHxYRikqHfPNgL8t0hJe5DWjdPVdwTpGwI9/
 gy0xpzJp70bXH67uxO0BwwuvrDkI/0Ys/Dy9AKGKi7/4hj3HBAjPxJXNzxsIjCOrsjqo=;
Received: from mail-il1-f202.google.com ([209.85.166.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1isZU5-00BhaD-3N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 21:48:54 +0000
Received: by mail-il1-f202.google.com with SMTP id v13so19827000ili.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 Jan 2020 13:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ukTX292U+2VcVX5ngLn2LgkUWhDOBHnzjPplbC8odDM=;
 b=uUGq+dc35nudg9nEj9wkdY75EkHIlMAOQp3BY9tAtNK/JDHb5DAWYXPTwUS/roBJCR
 xXe6HO2KZq4nLBRLO5j86lxp9jblxQM9vm4shX1tHojuISVnnfhYmhXwY4UmhwcsBsDs
 8/H0Lhbj3YFL6+kpKl8xE/yu1qaMCb3LQ19JuX06TnkLtnBMzSmS+a1A3EQpxeCPcSPf
 QmP2QHmtvBNU6aSm9hMxdGG59kQN/3GnvwR8N7xIXsulJPq5dIriD+9yQcckGMHPSwQc
 Y5Gy4gb2+j9pMxqEzLoqV0fdXV9bK+/fXPc/zpU/sCp5u+KkUcvXbchMuEzPd4qOymRK
 mkJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ukTX292U+2VcVX5ngLn2LgkUWhDOBHnzjPplbC8odDM=;
 b=pd0xywvx7pIHJc6jVaxjWpvZO/Ei8vAjiQNC7m/qFCVYyPACujjfYIR5xVQkholuuK
 AsR1FOAa9PiEzRjiNMi23b91AJPBWKZMlBcGkBniPKnN40Dl5icRyNaMJKrMj2gh5s7p
 1WBRkPJCYrs8N0Cr2a0s0jvWK38n2Wg9oXTTSkoLa7Br6WkSqfk1fBR6HcBJIM0N4sOS
 e7EYnDdI0/QqDLDeWMqhbfpILMcKnHrIPNLmTdpChcGA6SMEINJ3I6gzEPV4mQLnaiNz
 /ggNzTGzTnTvkyrqIxR1uWda6gb3fPw0gBZvKBJQFkkKiKIG0w8RQrs/8LWp03jQa3hc
 LWGQ==
X-Gm-Message-State: APjAAAXNTuW43eLjUA+PQv3DcVA9Uw5n5U+ygTnHiBpqe7xwWcfNALqR
 i4bxvQMmXY+DxuZEtWuLtQXJcgpEdvM=
X-Google-Smtp-Source: APXvYqx0s4/S1nosUCZqXwcnzu7Uy3VUsmtnOzvlBPwX50rAlj2OpUolq89j4/3k42aMspaeactl7QKiIas=
X-Received: by 2002:a63:2bcd:: with SMTP id r196mr46570787pgr.65.1579297382526; 
 Fri, 17 Jan 2020 13:43:02 -0800 (PST)
Date: Fri, 17 Jan 2020 13:42:40 -0800
In-Reply-To: <20200117214246.235591-1-drosen@google.com>
Message-Id: <20200117214246.235591-4-drosen@google.com>
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
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: disk_name.name]
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
X-Headers-End: 1isZU5-00BhaD-3N
Subject: [f2fs-dev] [PATCH v3 3/9] fscrypt: Change format of no-key token
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

Fscrypt supplies a no-key token in place of file names when the name is
encrypted and the key is not present. In the current scheme, the no-key
token is the base64 encoded ciphertext of the name, unless the name is
longer than a certain amount, after which it uses an alternative scheme
which includes the directory hash of the file name and an abbreviated
form of the ciphertext. Encrypted and casefolded names always require a
dirtree hash, since their values cannot be generated without the key.

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
 fs/crypto/fname.c       | 210 ++++++++++++++++++++++++++++++----------
 include/linux/fscrypt.h |  75 +-------------
 3 files changed, 162 insertions(+), 124 deletions(-)

diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
index 02df95b44331d..8046d7c7a3e9c 100644
--- a/fs/crypto/Kconfig
+++ b/fs/crypto/Kconfig
@@ -21,5 +21,6 @@ config FS_ENCRYPTION_ALGS
 	select CRYPTO_CTS
 	select CRYPTO_ECB
 	select CRYPTO_HMAC
+	select CRYPTO_SHA256
 	select CRYPTO_SHA512
 	select CRYPTO_XTS
diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 371e8f01d1c8e..4006ffd59ffa2 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -13,9 +13,69 @@
 
 #include <linux/namei.h>
 #include <linux/scatterlist.h>
+#include <crypto/hash.h>
+#include <crypto/sha.h>
 #include <crypto/skcipher.h>
 #include "fscrypt_private.h"
 
+/**
+ * fscrypt_nokey_name - identifier for on-disk filenames when key is not present
+ *
+ * When userspace lists an encrypted directory without access to the key, we
+ * must present them with a unique identifier for the file. base64 encoding will
+ * expand the space, so we use this format to avoid most collisions.
+ *
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
+ */
+
+#define FSCRYPT_FNAME_UNDIGESTED_SIZE 149
+struct fscrypt_nokey_name {
+	u32 dirtree_hash[2];
+	u8 bytes[FSCRYPT_FNAME_UNDIGESTED_SIZE];
+	u8 sha256[SHA256_DIGEST_SIZE];
+};
+
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
@@ -208,8 +268,7 @@ int fscrypt_fname_alloc_buffer(const struct inode *inode,
 			       struct fscrypt_str *crypto_str)
 {
 	const u32 max_encoded_len =
-		max_t(u32, BASE64_CHARS(FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE),
-		      1 + BASE64_CHARS(sizeof(struct fscrypt_digested_name)));
+		      BASE64_CHARS(sizeof(struct fscrypt_nokey_name));
 	u32 max_presented_len;
 
 	max_presented_len = max(max_encoded_len, max_encrypted_len);
@@ -242,9 +301,9 @@ EXPORT_SYMBOL(fscrypt_fname_free_buffer);
  *
  * The caller must have allocated sufficient memory for the @oname string.
  *
- * If the key is available, we'll decrypt the disk name; otherwise, we'll encode
- * it for presentation.  Short names are directly base64-encoded, while long
- * names are encoded in fscrypt_digested_name format.
+ * If the key is available, we'll decrypt the disk name;
+ * otherwise, we'll encode it for presentation in fscrypt_nokey_name format.
+ * See struct fscrypt_nokey_name for details.
  *
  * Return: 0 on success, -errno on failure
  */
@@ -254,7 +313,9 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 			      struct fscrypt_str *oname)
 {
 	const struct qstr qname = FSTR_TO_QSTR(iname);
-	struct fscrypt_digested_name digested_name;
+	struct fscrypt_nokey_name nokey_name;
+	u32 size;
+	int err = 0;
 
 	if (fscrypt_is_dot_dotdot(&qname)) {
 		oname->name[0] = '.';
@@ -269,25 +330,29 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 	if (fscrypt_has_encryption_key(inode))
 		return fname_decrypt(inode, iname, oname);
 
-	if (iname->len <= FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE) {
-		oname->len = base64_encode(iname->name, iname->len,
-					   oname->name);
-		return 0;
-	}
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
+	if (iname->len <= FSCRYPT_FNAME_UNDIGESTED_SIZE) {
+		memcpy(nokey_name.bytes, iname->name, iname->len);
+		size = offsetof(struct fscrypt_nokey_name, bytes[iname->len]);
+	} else {
+		memcpy(nokey_name.bytes, iname->name,
+		       FSCRYPT_FNAME_UNDIGESTED_SIZE);
+		/* compute sha256 of remaining name */
+		err = fscrypt_do_sha256(nokey_name.sha256,
+				&iname->name[FSCRYPT_FNAME_UNDIGESTED_SIZE],
+				iname->len - FSCRYPT_FNAME_UNDIGESTED_SIZE);
+		if (err)
+			return err;
+		size = offsetofend(struct fscrypt_nokey_name, sha256);
+	}
+	oname->len = base64_encode((const u8 *)&nokey_name, size, oname->name);
+	return err;
 }
 EXPORT_SYMBOL(fscrypt_fname_disk_to_usr);
 
@@ -307,8 +372,7 @@ EXPORT_SYMBOL(fscrypt_fname_disk_to_usr);
  * get the disk_name.
  *
  * Else, for keyless @lookup operations, @iname is the presented ciphertext, so
- * we decode it to get either the ciphertext disk_name (for short names) or the
- * fscrypt_digested_name (for long names).  Non-@lookup operations will be
+ * we decode it to get the fscrypt_nokey_name. Non-@lookup operations will be
  * impossible in this case, so we fail them with ENOKEY.
  *
  * If successful, fscrypt_free_filename() must be called later to clean up.
@@ -318,8 +382,8 @@ EXPORT_SYMBOL(fscrypt_fname_disk_to_usr);
 int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
 			      int lookup, struct fscrypt_name *fname)
 {
+	struct fscrypt_nokey_name *nokey_name;
 	int ret;
-	int digested;
 
 	memset(fname, 0, sizeof(struct fscrypt_name));
 	fname->usr_fname = iname;
@@ -359,41 +423,29 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
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
-			    fname->crypto_buf.name);
-	if (ret < 0) {
+	if (iname->len > BASE64_CHARS(sizeof(struct fscrypt_nokey_name))) {
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
+	ret = base64_decode(iname->name, iname->len, fname->crypto_buf.name);
+	if ((int)ret < offsetof(struct fscrypt_nokey_name, bytes[1]) ||
+	    (ret > offsetof(struct fscrypt_nokey_name, sha256) &&
+	     ret != offsetofend(struct fscrypt_nokey_name, sha256))) {
+		ret = -ENOENT;
+		goto errout;
 	}
+
+	nokey_name = (void *)fname->crypto_buf.name;
+	fname->crypto_buf.len = ret;
+
+	fname->hash = nokey_name->dirtree_hash[0];
+	fname->minor_hash = nokey_name->dirtree_hash[1];
 	return 0;
 
 errout:
@@ -402,6 +454,62 @@ int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
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
+ * if we don't have the key for an encrypted directory we'll instead need to
+ * match against the fscrypt_nokey_name.
+ *
+ * Return: %true if the name matches, otherwise %false.
+ */
+bool fscrypt_match_name(const struct fscrypt_name *fname,
+				      const u8 *de_name, u32 de_name_len)
+{
+	BUILD_BUG_ON(BASE64_CHARS(offsetofend(struct fscrypt_nokey_name,
+					      sha256)) > NAME_MAX);
+	if (unlikely(!fname->disk_name.name)) {
+		const struct fscrypt_nokey_name *n =
+			(const void *)fname->crypto_buf.name;
+
+		if (fname->crypto_buf.len ==
+			    offsetofend(struct fscrypt_nokey_name, sha256)) {
+			u8 sha256[SHA256_DIGEST_SIZE];
+
+			if (de_name_len <= FSCRYPT_FNAME_UNDIGESTED_SIZE)
+				return false;
+			if (memcmp(de_name, n->bytes,
+				   FSCRYPT_FNAME_UNDIGESTED_SIZE) != 0)
+				return false;
+			fscrypt_do_sha256(sha256,
+				&de_name[FSCRYPT_FNAME_UNDIGESTED_SIZE],
+				de_name_len - FSCRYPT_FNAME_UNDIGESTED_SIZE);
+			if (memcmp(sha256, n->sha256, sizeof(sha256)) != 0)
+				return false;
+		} else {
+			u32 len = fname->crypto_buf.len -
+				offsetof(struct fscrypt_nokey_name, bytes);
+
+			if (de_name_len != len)
+				return false;
+
+			if (memcmp(de_name, n->bytes, len) != 0)
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
index 2c292f19c6b94..14a727759a81a 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -179,79 +179,8 @@ extern int fscrypt_fname_disk_to_usr(const struct inode *inode,
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
-/**
- * fscrypt_digested_name - alternate identifier for an on-disk filename
- *
- * When userspace lists an encrypted directory without access to the key,
- * filenames whose ciphertext is longer than FSCRYPT_FNAME_MAX_UNDIGESTED_SIZE
- * bytes are shown in this abbreviated form (base64-encoded) rather than as the
- * full ciphertext (base64-encoded).  This is necessary to allow supporting
- * filenames up to NAME_MAX bytes, since base64 encoding expands the length.
- *
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
- */
-struct fscrypt_digested_name {
-	u32 hash;
-	u32 minor_hash;
-	u8 digest[FSCRYPT_FNAME_DIGEST_SIZE];
-};
-
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
-
-	if (de_name_len != fname->disk_name.len)
-		return false;
-	return !memcmp(de_name, fname->disk_name.name, fname->disk_name.len);
-}
+extern bool fscrypt_match_name(const struct fscrypt_name *fname,
+				      const u8 *de_name, u32 de_name_len);
 
 /* bio.c */
 extern void fscrypt_decrypt_bio(struct bio *);
-- 
2.25.0.341.g760bfbb309-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
