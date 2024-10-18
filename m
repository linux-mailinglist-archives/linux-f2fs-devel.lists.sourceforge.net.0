Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 718B29A461B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Oct 2024 20:45:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t1ryQ-00010h-UG;
	Fri, 18 Oct 2024 18:45:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1t1ryP-00010Y-6P
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kwj7QRIGHVZFemsl+DsYOf6RtRUQ0d5V3K0+370kME8=; b=CFiskibwinbZVGbyMwYE7vkyLp
 tGU5AVOc6eq4C2V2hM0CQNGWwHvuCje3nL8kbeIX69MY1NedwyyrIsmqJxOfuT4Y45Ln5HBCpFn87
 Xc4pH/QWIrB2wFTfGRTsNIBqhVXx8uDn7zisWTNj9ZaweXVC1ICinOTstD+BlsphB9Xw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kwj7QRIGHVZFemsl+DsYOf6RtRUQ0d5V3K0+370kME8=; b=EInwxJ74OUpJT9a4TiwpQ5ylKM
 +MW895WY/fK//e2qd+AxdxpfroP72y0DxI4vYwXjjKvedNiHv5DcIIXcPaO7cgWH7cWQshL46tf//
 z+TLxQGydHIYz3y97uPSwxe243wTDV1FghL2fMrnTzItyts9KS4LdIPJH3QeK7WSBN9w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t1ryP-00013r-3y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Oct 2024 18:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D04C5C3D84;
 Fri, 18 Oct 2024 18:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0401DC4CED2;
 Fri, 18 Oct 2024 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729277106;
 bh=CJqMmKGmlMC1ZgTSvCsZDhV/pMMcxUr0PbmDF9R/3J8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Tb8QNDbBm1c5jVfWGHeTX79arz2h6WihIiGeGNIT1wKOvl2SnsoxQny2qbD9K1FS5
 97IPTYhanx0dVA/KlRGXyEAFlT3qZc5C3vmIG1rDfkSH2LyQaUiCnmtuIj6YD37F5h
 g4WCzHrK0wC5FDmW5iezMTH7eAeEg/CHLKAH4Qp9fiamrAYfzwxlebwnZvFSKbxHAk
 yiQDNBYnN+xJV0CVw+2R+YJrgal7feu2DQYXE0AETmCZ4+krXjiiwSrmpxVeK46w6g
 MrU3gjK5ZqSFodlQJ5Ej0BiLUESxaSHZ8BqiviYFBDcr65dFbbHe+Yxb9T66VX434g
 9ZMlF7J4BWWWg==
To: dm-devel@lists.linux.dev
Date: Fri, 18 Oct 2024 11:43:39 -0700
Message-ID: <20241018184339.66601-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241018184339.66601-1-ebiggers@kernel.org>
References: <20241018184339.66601-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Set the
 bi_skip_dm_default_key
 flag on bios that are targeting the contents of an encrypted file and
 therefore
 should not be en/decrypted by dm-default-key. Signed-off-by: Eric Biggers
 <ebiggers@google.com> --- fs/crypto/inline_crypt.c | 14 +++++++++++++-
 fs/f2fs/data.c
 | 6 +++++- include/linux/fscrypt.h | 14 ++++++++++++++ 3 files changed, 32
 insertions( [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t1ryP-00013r-3y
Subject: [f2fs-dev] [RFC PATCH 4/4] ext4,
 f2fs: support metadata encryption via dm-default-key
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Israel Rukshin <israelr@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Mikulas Patocka <mpatocka@redhat.com>,
 Adrian Vovk <adrianvovk@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 linux-ext4@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Set the bi_skip_dm_default_key flag on bios that are targeting the
contents of an encrypted file and therefore should not be en/decrypted
by dm-default-key.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/inline_crypt.c | 14 +++++++++++++-
 fs/f2fs/data.c           |  6 +++++-
 include/linux/fscrypt.h  | 14 ++++++++++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 40de69860dcf9..b75c69c09500b 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -261,17 +261,22 @@ static void fscrypt_generate_dun(const struct fscrypt_inode_info *ci,
  *
  * Normally the bio should be newly allocated (i.e. no pages added yet), as
  * otherwise fscrypt_mergeable_bio() won't work as intended.
  *
  * The encryption context will be freed automatically when the bio is freed.
+ *
+ * This function also handles setting bi_skip_dm_default_key when needed.
  */
 void fscrypt_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 			       u64 first_lblk, gfp_t gfp_mask)
 {
 	const struct fscrypt_inode_info *ci;
 	u64 dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 
+	if (fscrypt_inode_should_skip_dm_default_key(inode))
+		bio_set_skip_dm_default_key(bio);
+
 	if (!fscrypt_inode_uses_inline_crypto(inode))
 		return;
 	ci = inode->i_crypt_info;
 
 	fscrypt_generate_dun(ci, first_lblk, dun);
@@ -342,20 +347,26 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
  *
  * This function isn't required in cases where crypto-mergeability is ensured in
  * another way, such as I/O targeting only a single file (and thus a single key)
  * combined with fscrypt_limit_io_blocks() to ensure DUN contiguity.
  *
+ * This function also returns false if the next part of the I/O would need to
+ * have a different value for the bi_skip_dm_default_key flag.
+ *
  * Return: true iff the I/O is mergeable
  */
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 			   u64 next_lblk)
 {
 	const struct bio_crypt_ctx *bc = bio->bi_crypt_context;
 	u64 next_dun[BLK_CRYPTO_DUN_ARRAY_SIZE];
 
 	if (!!bc != fscrypt_inode_uses_inline_crypto(inode))
 		return false;
+	if (bio_should_skip_dm_default_key(bio) !=
+	    fscrypt_inode_should_skip_dm_default_key(inode))
+		return false;
 	if (!bc)
 		return true;
 
 	/*
 	 * Comparing the key pointers is good enough, as all I/O for each key
@@ -385,11 +396,12 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 {
 	const struct inode *inode;
 	u64 next_lblk;
 
 	if (!bh_get_inode_and_lblk_num(next_bh, &inode, &next_lblk))
-		return !bio->bi_crypt_context;
+		return !bio->bi_crypt_context &&
+		       !bio_should_skip_dm_default_key(bio);
 
 	return fscrypt_mergeable_bio(bio, inode, next_lblk);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 94f7b084f6016..a413508210994 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -484,10 +484,12 @@ static void f2fs_set_bio_crypt_ctx(struct bio *bio, const struct inode *inode,
 	 * The f2fs garbage collector sets ->encrypted_page when it wants to
 	 * read/write raw data without encryption.
 	 */
 	if (!fio || !fio->encrypted_page)
 		fscrypt_set_bio_crypt_ctx(bio, inode, first_idx, gfp_mask);
+	else if (fscrypt_inode_should_skip_dm_default_key(inode))
+		bio_set_skip_dm_default_key(bio);
 }
 
 static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 				     pgoff_t next_idx,
 				     const struct f2fs_io_info *fio)
@@ -495,11 +497,13 @@ static bool f2fs_crypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 	/*
 	 * The f2fs garbage collector sets ->encrypted_page when it wants to
 	 * read/write raw data without encryption.
 	 */
 	if (fio && fio->encrypted_page)
-		return !bio_has_crypt_ctx(bio);
+		return !bio_has_crypt_ctx(bio) &&
+			(bio_should_skip_dm_default_key(bio) ==
+			 fscrypt_inode_should_skip_dm_default_key(inode));
 
 	return fscrypt_mergeable_bio(bio, inode, next_idx);
 }
 
 void f2fs_submit_read_bio(struct f2fs_sb_info *sbi, struct bio *bio,
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 772f822dc6b82..eac1917db79a9 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -890,10 +890,24 @@ static inline u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk,
 {
 	return nr_blocks;
 }
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
+#if IS_ENABLED(CONFIG_FS_ENCRYPTION) && IS_ENABLED(CONFIG_DM_DEFAULT_KEY)
+static inline bool
+fscrypt_inode_should_skip_dm_default_key(const struct inode *inode)
+{
+	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
+}
+#else
+static inline bool
+fscrypt_inode_should_skip_dm_default_key(const struct inode *inode)
+{
+	return false;
+}
+#endif
+
 /**
  * fscrypt_inode_uses_inline_crypto() - test whether an inode uses inline
  *					encryption
  * @inode: an inode. If encrypted, its key must be set up.
  *
-- 
2.47.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
