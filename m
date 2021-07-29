Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DB73D9CDA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jul 2021 06:40:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8xq2-0005Bl-PS; Thu, 29 Jul 2021 04:40:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ebiggers@kernel.org>) id 1m8xpz-0005Bc-Pa
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 04:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FN0hq9YvGnOv8XkTfrCYbWHUWFBoKXCsmGbhmhfJVM0=; b=WiKIpQOksJJrM9B1nggjKcbZIx
 9XDdJekw6kKFAH7weHt8cLi5O0ji4uZy3/kd0b62xClhQ57w12aTrPBN3W5g+xVsNi23P1sRqIQub
 h8TX9LFuF/WPhz/XFt9kgI/GTjzRjhcxz9EDfuRUM2n8aBXs/sNX5woUk4yP0eENzDPQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FN0hq9YvGnOv8XkTfrCYbWHUWFBoKXCsmGbhmhfJVM0=; b=W
 CZp+VJCh0aRXeIcwkemTIrWTutZihcUPXpIGKHlgV3c3pliKSzAjSAlpT3UJb2gJ+N+SAkdkhnBZA
 QlOEFIrsBTd+F+doX+UAQMx0bEx+wmoouoObisNbnabROLhusfwoUE/xyEhbgFWXZm7z/9CL0R1N/
 1sHZplW0QQ0JAcnI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8xpw-00668t-I7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Jul 2021 04:40:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24D15604DB;
 Thu, 29 Jul 2021 04:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627533590;
 bh=Py7uHiYvnpaO5x3vt7x+I4Cdzj8pn/J9hAojlQsYNqg=;
 h=From:To:Cc:Subject:Date:From;
 b=Nm4e/Q5NpXZIm8u/BrvQEem3BHJyQgpKF82jQaxsZDTY/c2kOFyFCHPDtavaJlJOm
 +/TeEJdbV944g4NPbg0dfCIDH4vxgPBO+5vfnJWgd2QWYvN/Wkp0apuOJQcmAUeswq
 5TfYmqhfCdJxreb8LJADIB7AuHO3QpuQdkqyUUhq4nFPoP+QaaMc87cc2rBogCAf4A
 bhNS7B3RQnZXgKYGHHDWCGKB18VEhkW78dA958QrIK/LGxNzPWx0bDRRCKWNEf3f5q
 AfskjGmGzdUo1BtsEnAD5mCsPVDqcoEe12Tkbhc4zRTicnWu6Xs6ji9sJ2maIEdXTb
 oL4oDAJO0UMtg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 28 Jul 2021 21:37:28 -0700
Message-Id: <20210729043728.18480-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m8xpw-00668t-I7
Subject: [f2fs-dev] [PATCH] fscrypt: document struct fscrypt_operations
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Document all fields of struct fscrypt_operations so that it's more clear
what filesystems that use (or plan to use) fs/crypto/ need to implement.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/fscrypt.h | 109 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b7bfd0cd4f3e..e912ed9141d9 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -47,27 +47,128 @@ struct fscrypt_name {
 #define FSCRYPT_SET_CONTEXT_MAX_SIZE	40
 
 #ifdef CONFIG_FS_ENCRYPTION
+
 /*
- * fscrypt superblock flags
+ * If set, the fscrypt bounce page pool won't be allocated (unless another
+ * filesystem needs it).  Set this if the filesystem always uses its own bounce
+ * pages for writes and therefore won't need the fscrypt bounce page pool.
  */
 #define FS_CFLG_OWN_PAGES (1U << 1)
 
-/*
- * crypto operations for filesystems
- */
+/* Crypto operations for filesystems */
 struct fscrypt_operations {
+
+	/* Set of optional flags; see above for allowed flags */
 	unsigned int flags;
+
+	/*
+	 * If set, this is a filesystem-specific key description prefix that
+	 * will be accepted for "logon" keys for v1 fscrypt policies, in
+	 * addition to the generic prefix "fscrypt:".  This functionality is
+	 * deprecated, so new filesystems shouldn't set this field.
+	 */
 	const char *key_prefix;
+
+	/*
+	 * Get the fscrypt context of the given inode.
+	 *
+	 * @inode: the inode whose context to get
+	 * @ctx: the buffer into which to get the context
+	 * @len: length of the @ctx buffer in bytes
+	 *
+	 * Return: On success, returns the length of the context in bytes; this
+	 *	   may be less than @len.  On failure, returns -ENODATA if the
+	 *	   inode doesn't have a context, -ERANGE if the context is
+	 *	   longer than @len, or another -errno code.
+	 */
 	int (*get_context)(struct inode *inode, void *ctx, size_t len);
+
+	/*
+	 * Set an fscrypt context on the given inode.
+	 *
+	 * @inode: the inode whose context to set.  The inode won't already have
+	 *	   an fscrypt context.
+	 * @ctx: the context to set
+	 * @len: length of @ctx in bytes (at most FSCRYPT_SET_CONTEXT_MAX_SIZE)
+	 * @fs_data: If called from fscrypt_set_context(), this will be the
+	 *	     value the filesystem passed to fscrypt_set_context().
+	 *	     Otherwise (i.e. when called from
+	 *	     FS_IOC_SET_ENCRYPTION_POLICY) this will be NULL.
+	 *
+	 * i_rwsem will be held for write.
+	 *
+	 * Return: 0 on success, -errno on failure.
+	 */
 	int (*set_context)(struct inode *inode, const void *ctx, size_t len,
 			   void *fs_data);
+
+	/*
+	 * Get the dummy fscrypt policy in use on the filesystem (if any).
+	 *
+	 * Filesystems only need to implement this function if they support the
+	 * test_dummy_encryption mount option.
+	 *
+	 * Return: A pointer to the dummy fscrypt policy, if the filesystem is
+	 *	   mounted with test_dummy_encryption; otherwise NULL.
+	 */
 	const union fscrypt_policy *(*get_dummy_policy)(struct super_block *sb);
+
+	/*
+	 * Check whether a directory is empty.  i_rwsem will be held for write.
+	 */
 	bool (*empty_dir)(struct inode *inode);
+
+	/* The filesystem's maximum ciphertext filename length, in bytes */
 	unsigned int max_namelen;
+
+	/*
+	 * Check whether the filesystem's inode numbers and UUID are stable,
+	 * meaning that they will never be changed even by offline operations
+	 * such as filesystem shrinking and therefore can be used in the
+	 * encryption without the possibility of files becoming unreadable.
+	 *
+	 * Filesystems only need to implement this function if they want to
+	 * support the FSCRYPT_POLICY_FLAG_IV_INO_LBLK_{32,64} flags.  These
+	 * flags are designed to work around the limitations of UFS and eMMC
+	 * inline crypto hardware, and they shouldn't be used in scenarios where
+	 * such hardware isn't being used.
+	 *
+	 * Leaving this NULL is equivalent to always returning false.
+	 */
 	bool (*has_stable_inodes)(struct super_block *sb);
+
+	/*
+	 * Get the number of bits that the filesystem uses to represent inode
+	 * numbers and file logical block numbers.
+	 *
+	 * By default, both of these are assumed to be 64-bit.  This function
+	 * can be implemented to declare that either or both of these numbers is
+	 * shorter, which may allow the use of the
+	 * FSCRYPT_POLICY_FLAG_IV_INO_LBLK_{32,64} flags and/or the use of
+	 * inline crypto hardware whose maximum DUN length is less than 64 bits
+	 * (e.g., eMMC v5.2 spec compliant hardware).  This function only needs
+	 * to be implemented if support for one of these features is needed.
+	 */
 	void (*get_ino_and_lblk_bits)(struct super_block *sb,
 				      int *ino_bits_ret, int *lblk_bits_ret);
+
+	/*
+	 * Return the number of block devices to which the filesystem may write
+	 * encrypted file contents.
+	 *
+	 * If the filesystem can use multiple block devices (other than block
+	 * devices that aren't used for encrypted file contents, such as
+	 * external journal devices), and wants to support inline encryption,
+	 * then it must implement this function.  Otherwise it's not needed.
+	 */
 	int (*get_num_devices)(struct super_block *sb);
+
+	/*
+	 * If ->get_num_devices() returns a value greater than 1, then this
+	 * function is called to get the array of request_queues that the
+	 * filesystem is using -- one per block device.  (There may be duplicate
+	 * entries in this array, as block devices can share a request_queue.)
+	 */
 	void (*get_devices)(struct super_block *sb,
 			    struct request_queue **devs);
 };
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
