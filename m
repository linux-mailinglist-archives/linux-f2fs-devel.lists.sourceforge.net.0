Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AF821FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqy-0001yj-Ah; Mon, 05 Aug 2019 16:28:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqu-0001xw-9q
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=21QHliEyJ/uv1JkOD03lawVg0Er9JEsRtd/6FITtA0g=; b=Ah+lxX0TUiUil1ZEJ2y9KkwIVC
 gwbPyKRN1wctWQBaRaY2va4saxWniXv367EcSGcC1pJjlfn7p1zLhS40dwqL0PK1KilGzcTYE+wBQ
 H6jo7d/NK/gz8ftrk1koaQU2mAFSIuewAeKYqZ8z7qV37b9SJa/TCWIjheDPo+xVG5gU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=21QHliEyJ/uv1JkOD03lawVg0Er9JEsRtd/6FITtA0g=; b=UskTfXKYkfeLVIormANc0dLW0G
 c1ekcgN2wnnTwAwNTatiqmoG2Q2jKz69xY3NMT+e9cpTn0BkIxZISsJQqZZZReZ/TbhoV4zXFJXrQ
 UPlkZdW3mtO6quXRVhcXASosDB/AtVBDW2OHhRUillzpS1drxxf9ZSu9cGw4lBU9o4mg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufqs-00BqGb-Vs
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:52 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 13E732189E;
 Mon,  5 Aug 2019 16:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022518;
 bh=xy1t3rSvYnShOxZuTt8ak8auiaMk1xeeLO3ak4sGGW4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=D1aJJBldcpGb18JN2NarCFynGXoY9FVW3evN3jgQMOVasyEEIjksnWi5vY21TAqKF
 0Zudz6mVyQYLEwUzT7qMRIArco1zLZx7hxpFHw1UogyLGZdCa6GPil1gmxIoANw6wv
 UZmddSgC/pTRdUphRX+kvHBgBP96moWKmIRKolug=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:17 -0700
Message-Id: <20190805162521.90882-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufqs-00BqGb-Vs
Subject: [f2fs-dev] [PATCH v8 16/20] fscrypt: require that key be added when
 setting a v2 encryption policy
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

By looking up the master keys in a filesystem-level keyring rather than
in the calling processes' key hierarchy, it becomes possible for a user
to set an encryption policy which refers to some key they don't actually
know, then encrypt their files using that key.  Cryptographically this
isn't much of a problem, but the semantics of this would be a bit weird.
Thus, enforce that a v2 encryption policy can only be set if the user
has previously added the key, or has capable(CAP_FOWNER).

We tolerate that this problem will continue to exist for v1 encryption
policies, however; there is no way around that.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fscrypt_private.h |  3 +++
 fs/crypto/keyring.c         | 47 +++++++++++++++++++++++++++++++++++++
 fs/crypto/policy.c          | 14 ++++++++++-
 3 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/fs/crypto/fscrypt_private.h b/fs/crypto/fscrypt_private.h
index d0e23823423416..e84efc01512e4e 100644
--- a/fs/crypto/fscrypt_private.h
+++ b/fs/crypto/fscrypt_private.h
@@ -431,6 +431,9 @@ extern struct key *
 fscrypt_find_master_key(struct super_block *sb,
 			const struct fscrypt_key_specifier *mk_spec);
 
+extern int fscrypt_verify_key_added(struct super_block *sb,
+				    const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE]);
+
 extern int __init fscrypt_init_keyring(void);
 
 /* keysetup.c */
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 86bfcc02b31fcf..6ea71c2e18f0e7 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -562,6 +562,53 @@ int fscrypt_ioctl_add_key(struct file *filp, void __user *_uarg)
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_add_key);
 
+/*
+ * Verify that the current user has added a master key with the given identifier
+ * (returns -ENOKEY if not).  This is needed to prevent a user from encrypting
+ * their files using some other user's key which they don't actually know.
+ * Cryptographically this isn't much of a problem, but the semantics of this
+ * would be a bit weird, so it's best to just forbid it.
+ *
+ * The system administrator (CAP_FOWNER) can override this, which should be
+ * enough for any use cases where encryption policies are being set using keys
+ * that were chosen ahead of time but aren't available at the moment.
+ *
+ * Note that the key may have already removed by the time this returns, but
+ * that's okay; we just care whether the key was there at some point.
+ *
+ * Return: 0 if the key is added, -ENOKEY if it isn't, or another -errno code
+ */
+int fscrypt_verify_key_added(struct super_block *sb,
+			     const u8 identifier[FSCRYPT_KEY_IDENTIFIER_SIZE])
+{
+	struct fscrypt_key_specifier mk_spec;
+	struct key *key, *mk_user;
+	struct fscrypt_master_key *mk;
+	int err;
+
+	mk_spec.type = FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER;
+	memcpy(mk_spec.u.identifier, identifier, FSCRYPT_KEY_IDENTIFIER_SIZE);
+
+	key = fscrypt_find_master_key(sb, &mk_spec);
+	if (IS_ERR(key)) {
+		err = PTR_ERR(key);
+		goto out;
+	}
+	mk = key->payload.data[0];
+	mk_user = find_master_key_user(mk);
+	if (IS_ERR(mk_user)) {
+		err = PTR_ERR(mk_user);
+	} else {
+		key_put(mk_user);
+		err = 0;
+	}
+	key_put(key);
+out:
+	if (err == -ENOKEY && capable(CAP_FOWNER))
+		err = 0;
+	return err;
+}
+
 /*
  * Try to evict the inode's dentries from the dentry cache.  If the inode is a
  * directory, then it can have at most one dentry; however, that dentry may be
diff --git a/fs/crypto/policy.c b/fs/crypto/policy.c
index 0141d338c1fdb2..4072ba644595b9 100644
--- a/fs/crypto/policy.c
+++ b/fs/crypto/policy.c
@@ -233,11 +233,13 @@ static int set_encryption_policy(struct inode *inode,
 {
 	union fscrypt_context ctx;
 	int ctxsize;
+	int err;
 
 	if (!fscrypt_supported_policy(policy, inode))
 		return -EINVAL;
 
-	if (policy->version == FSCRYPT_POLICY_V1) {
+	switch (policy->version) {
+	case FSCRYPT_POLICY_V1:
 		/*
 		 * The original encryption policy version provided no way of
 		 * verifying that the correct master key was supplied, which was
@@ -251,6 +253,16 @@ static int set_encryption_policy(struct inode *inode,
 		 */
 		pr_warn_once("%s (pid %d) is setting deprecated v1 encryption policy; recommend upgrading to v2.\n",
 			     current->comm, current->pid);
+		break;
+	case FSCRYPT_POLICY_V2:
+		err = fscrypt_verify_key_added(inode->i_sb,
+					       policy->v2.master_key_identifier);
+		if (err)
+			return err;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
 	}
 
 	ctxsize = fscrypt_new_context_from_policy(&ctx, policy);
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
