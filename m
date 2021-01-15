Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 692722F8405
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Jan 2021 19:21:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l0TiY-0004LO-Pe; Fri, 15 Jan 2021 18:21:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l0ThL-0004Ck-C4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y6sdQJdF513KNJfP+oyLvdOAMfnwYeD5PMT9sV42o0M=; b=PZMZjeWHdq7TLC7lVa6oE2I8b5
 KDEPsuzmxC0doVnRjQyyn0b9RvyO/HjJymV5Ov0dBbefJaSJc5VKWIMMyit14wFlJyWrxiv1nr+Y/
 1IVdGgsorUXI9XisDo3O4vJWvSBhsFHF5WOlMhkm5Oc0Qfng7wzQ8h4niwpHMG7OdUE4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y6sdQJdF513KNJfP+oyLvdOAMfnwYeD5PMT9sV42o0M=; b=VzymoB73qXWyHmwVa8Y4QrFsZh
 Le4zy2YBZzpkqZWIQTITzwczsBAPmpuddJgwpF6CpUr7OpI9kK+Z7BeB6fh77s/za0pjmnuDsIw7Q
 P3zA+qbCQwlorfT/d6NOlmBkRUQo8KEhRSRQ/gCVRDETPnZlceympEvdGGa20w+fA3zg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l0ThC-00GNJk-LF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 Jan 2021 18:19:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F176023AAA;
 Fri, 15 Jan 2021 18:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610734773;
 bh=Jel0jSfxzz6JC5YFbmX2zBvLW5g+Ng3wqiU7Ogpwi0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nV+PbKlE4fejFkAJT2QUpw8lFuA/9WiIzVOwQWxZ8m42b+BxHOeac7Nv6YlEjicfq
 9NSow62EK+Kce5qwM4tuIP2FNmGnI6wXaQpgyE3Oi2QZgObDE4cHU0EwJKw7W+7QI3
 juUYfw9Dd7eoWLJIeQpui6nAsYH85pO3czfkCYC/8+ei411Yaq6owCWkqVqFFI5m9S
 aVfh9Vxwm+x/hpT6nvN2QvoQIcFbjV8dhTFfs7RVUpxYhzHusxOnMS75ZVuA+qNssB
 DjCldKSxFgNoSAhvqz23SuCDosGmeRCT+VaVBego5uOG/vv9IgcpB8VIPQrt/BO3RZ
 Mx374CmaajuLg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 15 Jan 2021 10:18:15 -0800
Message-Id: <20210115181819.34732-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210115181819.34732-1-ebiggers@kernel.org>
References: <20210115181819.34732-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l0ThC-00GNJk-LF
Subject: [f2fs-dev] [PATCH 2/6] fs-verity: don't pass whole descriptor to
 fsverity_verify_signature()
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that fsverity_get_descriptor() validates the sig_size field,
fsverity_verify_signature() doesn't need to do it.

Just change the prototype of fsverity_verify_signature() to take the
signature directly rather than take a fsverity_descriptor.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  6 ++----
 fs/verity/open.c             |  3 ++-
 fs/verity/signature.c        | 20 ++++++--------------
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 6c9caccc06021..a7920434bae50 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -140,15 +140,13 @@ void __init fsverity_exit_info_cache(void);
 
 #ifdef CONFIG_FS_VERITY_BUILTIN_SIGNATURES
 int fsverity_verify_signature(const struct fsverity_info *vi,
-			      const struct fsverity_descriptor *desc,
-			      size_t desc_size);
+			      const u8 *signature, size_t sig_size);
 
 int __init fsverity_init_signature(void);
 #else /* !CONFIG_FS_VERITY_BUILTIN_SIGNATURES */
 static inline int
 fsverity_verify_signature(const struct fsverity_info *vi,
-			  const struct fsverity_descriptor *desc,
-			  size_t desc_size)
+			  const u8 *signature, size_t sig_size)
 {
 	return 0;
 }
diff --git a/fs/verity/open.c b/fs/verity/open.c
index a987bb785e9b0..60ff8af7219fe 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -181,7 +181,8 @@ struct fsverity_info *fsverity_create_info(const struct inode *inode,
 		 vi->tree_params.hash_alg->name,
 		 vi->tree_params.digest_size, vi->file_digest);
 
-	err = fsverity_verify_signature(vi, desc, desc_size);
+	err = fsverity_verify_signature(vi, desc->signature,
+					le32_to_cpu(desc->sig_size));
 out:
 	if (err) {
 		fsverity_free_info(vi);
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index 012468eda2a78..143a530a80088 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -29,21 +29,19 @@ static struct key *fsverity_keyring;
 /**
  * fsverity_verify_signature() - check a verity file's signature
  * @vi: the file's fsverity_info
- * @desc: the file's fsverity_descriptor
- * @desc_size: size of @desc
+ * @signature: the file's built-in signature
+ * @sig_size: size of signature in bytes, or 0 if no signature
  *
- * If the file's fs-verity descriptor includes a signature of the file digest,
- * verify it against the certificates in the fs-verity keyring.
+ * If the file includes a signature of its fs-verity file digest, verify it
+ * against the certificates in the fs-verity keyring.
  *
  * Return: 0 on success (signature valid or not required); -errno on failure
  */
 int fsverity_verify_signature(const struct fsverity_info *vi,
-			      const struct fsverity_descriptor *desc,
-			      size_t desc_size)
+			      const u8 *signature, size_t sig_size)
 {
 	const struct inode *inode = vi->inode;
 	const struct fsverity_hash_alg *hash_alg = vi->tree_params.hash_alg;
-	const u32 sig_size = le32_to_cpu(desc->sig_size);
 	struct fsverity_formatted_digest *d;
 	int err;
 
@@ -56,11 +54,6 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 		return 0;
 	}
 
-	if (sig_size > desc_size - sizeof(*desc)) {
-		fsverity_err(inode, "Signature overflows verity descriptor");
-		return -EBADMSG;
-	}
-
 	d = kzalloc(sizeof(*d) + hash_alg->digest_size, GFP_KERNEL);
 	if (!d)
 		return -ENOMEM;
@@ -70,8 +63,7 @@ int fsverity_verify_signature(const struct fsverity_info *vi,
 	memcpy(d->digest, vi->file_digest, hash_alg->digest_size);
 
 	err = verify_pkcs7_signature(d, sizeof(*d) + hash_alg->digest_size,
-				     desc->signature, sig_size,
-				     fsverity_keyring,
+				     signature, sig_size, fsverity_keyring,
 				     VERIFYING_UNSPECIFIED_SIGNATURE,
 				     NULL, NULL);
 	kfree(d);
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
