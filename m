Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EFC287A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Oct 2020 19:02:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQZJ3-0003NE-4O; Thu, 08 Oct 2020 17:02:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kQZJ1-0003N7-Lj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 17:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y0Y5ANEHX4O2TK0JPgz3k8ynUBSSnrN/f8R94XC0hzI=; b=kab8h1GGPJtPjhAv2jeSnnxz1a
 6Ya9JWclQFAPUvr0bo3wR5QbXekfOYZwksxwb67JlPeUaDkY9dJuNFTpduAf/I58cWOlYeWl26itl
 FGE/e2iiRiFnhEgn2a9ih6Mfef/CgwXnwexAzPu9qgV3MrIXj+aqFfvKje5lk+ALhSSU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y0Y5ANEHX4O2TK0JPgz3k8ynUBSSnrN/f8R94XC0hzI=; b=EIllsMvvb7/CmZjufeC4OKZLyj
 m+rb0uu4LleSAqKiYcTBB/HRZeJxA2GgjXtpiY7Eo7FFhRFLOsg2e1OShCy7j5e0RhJa1i3WBFBjH
 tyAzP2d/7Tf/FOxQfnaPrakJHIy89hU2bEx43oqyuYUxerX0l0bgIbMLEQd7eN25iJHY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQZIp-007QBO-D4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Oct 2020 17:02:15 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8145D21D7D;
 Thu,  8 Oct 2020 17:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602176505;
 bh=IPIHUhKQTR3oZFKgHCq4nhhn7A6xUIlzms8OzsEuF28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PwrHuqX4aQSTqSAKewP9aeFPjJKYJek1v/w0zHl5hesP93nf3Qq/+9wpPpItYfTVT
 TywQzt6+BOMyVmqgM67Juk77N/liRX2fjSxNRftNvRQoOG94cVzvYcIo6pgq96Z/Ff
 zqzPxj3RQDPuMVNOFqyaD7D55D1P5KvjrNxM8oEs=
Date: Thu, 8 Oct 2020 10:01:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20201008170143.GA1869638@gmail.com>
References: <20201005073606.1949772-1-satyat@google.com>
 <20201007210040.GB1530638@gmail.com>
 <20201007220500.GA2544297@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007220500.GA2544297@google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kQZIp-007QBO-D4
Subject: Re: [f2fs-dev] [PATCH 0/3] add support for metadata encryption to
 F2FS
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 07, 2020 at 10:05:00PM +0000, Satya Tangirala wrote:
> > I notice this is missing the step I suggested to include the metadata encryption
> > key in the HKDF application-specific info string when deriving subkeys from the
> > fscrypt master keys.
> > 
> > The same effect could also be achieved by adding an additional level to the key
> > hierarchy: each HKDF key would be derived from a fscrypt master key and the
> > metadata encryption key.
> > 
> > We need one of those, to guarantee that the file contents encryption is at least
> > as strong as the "metadata encryption".
> >
> Yes - I didn't get around to that in the first version, but I'll add
> that too in the next version. I was going to go with the first approach
> before I saw your comment - is there one method you'd recommend going
> with over the other?

I'm not entirely sure, but I'm now leaning towards the second approach because
it would avoid adding additional work (another SHA-512 block) to all later key
derivations.  Also it would avoid having to add a super_block argument to
fscrypt_hkdf_expand().  But please ask Paul Crowley for his suggestion too.

Here's a quick untested patch to consider:

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index dca254590a70..67f8ba3098d3 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -319,6 +319,7 @@ int fscrypt_init_hkdf(struct fscrypt_hkdf *hkdf, const u8 *master_key,
 #define HKDF_CONTEXT_DIRHASH_KEY	5 /* info=file_nonce		*/
 #define HKDF_CONTEXT_IV_INO_LBLK_32_KEY	6 /* info=mode_num||fs_uuid	*/
 #define HKDF_CONTEXT_INODE_HASH_KEY	7 /* info=<empty>		*/
+#define HKDF_CONTEXT_MIX_METADATA_KEY	8 /* info=metadata_key		*/
 
 int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 			const u8 *info, unsigned int infolen,
@@ -600,6 +601,20 @@ int fscrypt_setup_v1_file_key(struct fscrypt_info *ci,
 
 int fscrypt_setup_v1_file_key_via_subscribed_keyrings(struct fscrypt_info *ci);
 
+/* metadata_crypt.c */
+
+#ifdef CONFIG_FS_ENCRYPTION_METADATA
+int fscrypt_mix_in_metadata_key(struct super_block *sb,
+				struct fscrypt_master_key_secret *secret);
+#else
+static inline int
+fscrypt_mix_in_metadata_key(struct super_block *sb,
+			    struct fscrypt_master_key_secret *secret)
+{
+	return 0;
+}
+#endif
+
 /* policy.c */
 
 bool fscrypt_policies_equal(const union fscrypt_policy *policy1,
diff --git a/fs/crypto/hkdf.c b/fs/crypto/hkdf.c
index 0cba7928446d..61d1f0aa802e 100644
--- a/fs/crypto/hkdf.c
+++ b/fs/crypto/hkdf.c
@@ -174,4 +174,5 @@ int fscrypt_hkdf_expand(const struct fscrypt_hkdf *hkdf, u8 context,
 void fscrypt_destroy_hkdf(struct fscrypt_hkdf *hkdf)
 {
 	crypto_free_shash(hkdf->hmac_tfm);
+	hkdf->hmac_tfm = NULL;
 }
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index e74f239c4428..43453a7f77b1 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -494,6 +494,10 @@ static int add_master_key(struct super_block *sb,
 		 */
 		memzero_explicit(secret->raw, secret->size);
 
+		err = fscrypt_mix_in_metadata_key(sb, secret);
+		if (err)
+			return err;
+
 		/* Calculate the key identifier */
 		err = fscrypt_hkdf_expand(&secret->hkdf,
 					  HKDF_CONTEXT_KEY_IDENTIFIER, NULL, 0,
diff --git a/fs/crypto/metadata_crypt.c b/fs/crypto/metadata_crypt.c
index 5e16df130509..233e68c35504 100644
--- a/fs/crypto/metadata_crypt.c
+++ b/fs/crypto/metadata_crypt.c
@@ -13,6 +13,32 @@
 
 #include "fscrypt_private.h"
 
+/* TODO: add comment */
+int fscrypt_mix_in_metadata_key(struct super_block *sb,
+				struct fscrypt_master_key_secret *secret)
+{
+	u8 real_key[FSCRYPT_MAX_KEY_SIZE];
+	int err;
+
+	if (WARN_ON(secret->size > sizeof(real_key)))
+		return -EINVAL;
+
+	if (!sb->s_metadata_key)
+		return 0;
+
+	err = fscrypt_hkdf_expand(&secret->hkdf, HKDF_CONTEXT_MIX_METADATA_KEY,
+				  sb->s_metadata_key->raw,
+				  sb->s_metadata_key->size,
+				  real_key, secret->size);
+	if (err)
+		return err;
+
+	fscrypt_destroy_hkdf(&secret->hkdf);
+	err = fscrypt_init_hkdf(&secret->hkdf, real_key, secret->size);
+	memzero_explicit(real_key, secret->size);
+	return err;
+}
+
 /* TODO: mostly copied from keysetup_v1.c - maybe refactor this function */
 static int fscrypt_metadata_get_key_from_id(const char *prefix,
 					    char *descriptor_hex,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
