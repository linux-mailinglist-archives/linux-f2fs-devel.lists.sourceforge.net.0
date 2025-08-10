Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB209B1F908
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Aug 2025 10:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlfReYFjXQjRVkTWOPCOfz/HivKwc75Bl7AFb2PFDCI=; b=YbJ5Qrpnir9Q7Xy6uEHLIkI5R0
	HuPkm6263cw9VFkm3woa6cImY6oSwVrLfM/NFoSKF75VnnhBgZYQRUrHYGutdbrMqVvVixVQb7pck
	2wLl9HoFAQ9ogeUBatODdmUk6GwAgSlV1XABCkjwmGQq2f7MMvh4M2H42qnmhKxJwefE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ul0yd-0003Ui-9D;
	Sun, 10 Aug 2025 08:00:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1ul0yb-0003UR-IS
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=an/Nm0YyxhaeNBwQIVRjaENL/kJQbhVoPBR/IBOTgcs=; b=Oosk5MMVVPkzPBipNeOFxZnG0b
 TNSlQ3SjgCmPpUnOrm+gMNc7M7FI/wZwM/yvOYZylFUu0sZhCk6z+b7s1l8O5Ivy1vhw0balD9UX5
 KbBfR//h4+ZlmRIuic2NovQrBVZzZ1TdyY5GWhxQvlj+IxeNYthSp1SK19HunDGK3jnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=an/Nm0YyxhaeNBwQIVRjaENL/kJQbhVoPBR/IBOTgcs=; b=SGNxPxpSm1r8Lgi25/ztBe/z+j
 s5dz0EXxQ0OnJEH7pGfa7+GGxSQo/EckYiJzdiPq1GtB4mm/WUrTdwqRwoqzvRSAwQuVZW0m3rdna
 BwaQHVGKN6XLvupIKc2d9DkFHzTcaJOoqOP7tXjPyKdOQ7pz9VkFDSUSpwsVRJ+hbW1A=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ul0yb-00011T-Ok for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Aug 2025 08:00:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 188EDA55134;
 Sun, 10 Aug 2025 08:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FAB9C4CEEB;
 Sun, 10 Aug 2025 08:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754812810;
 bh=hTLksDqAG7iJZbJnGqd8JyQQhFVP3K3qP+WNZUyThvI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SLFlFAFYjVyvx9ggNdb5bWTXUqjDAUbaAo7N9/6UnJmEJtn+vKgzQPSAsWKAsRRRL
 So3V9vSSaOSZ6Ds6ARu8XEUs1FVfS4QUCRq4ZHQrfPc+rBVQhL3v9wIQaxwh3+aQXB
 k2ubttllOoJvrh7zV/bz9kqO1TlYZEs1y0/O8Oyc1IkXRMPZ74rzJNYA4fyBXPEpMJ
 /brqN4ToKmH+IcQQqnwa6y3VbfRNfVQosWIZdaAiMRv8+lLvNNZA8f1nmW1uL0/aTx
 NURcg6NCqctDVHUqEvUCetLBqq3zGe3Ta/k9LE0yd/xaBpAv3jwBpD7nQrShG7pq1M
 V6O2XmUIE9Lsg==
To: linux-fscrypt@vger.kernel.org,
	fsverity@lists.linux.dev
Date: Sun, 10 Aug 2025 00:57:00 -0700
Message-ID: <20250810075706.172910-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810075706.172910-1-ebiggers@kernel.org>
References: <20250810075706.172910-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that all fscrypt-capable filesystems store the pointer
 to fscrypt_inode_info in the filesystem-specific part of the inode structure, 
 inode::i_crypt_info is no longer needed. Update fscrypt_inode_i [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ul0yb-00011T-Ok
Subject: [f2fs-dev] [PATCH v5 07/13] fs: remove inode::i_crypt_info
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
Cc: Christian Brauner <brauner@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now that all fscrypt-capable filesystems store the pointer to
fscrypt_inode_info in the filesystem-specific part of the inode
structure, inode::i_crypt_info is no longer needed.  Update
fscrypt_inode_info_addr() to no longer support the fallback to
inode::i_crypt_info.  Finally, remove inode::i_crypt_info itself along
with the now-unnecessary forward declaration of fscrypt_inode_info.

The end result of the migration to the filesystem-specific pointer is
memory savings on CONFIG_FS_ENCRYPTION=y kernels for all filesystems
that don't support fscrypt.  Specifically, their in-memory inodes are
now smaller by the size of a pointer: either 4 or 8 bytes.

Co-developed-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/fs.h      | 5 -----
 include/linux/fscrypt.h | 8 ++++++--
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index d7ab4f96d7051..1dafa18169be6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -70,11 +70,10 @@ struct vfsmount;
 struct cred;
 struct swap_info_struct;
 struct seq_file;
 struct workqueue_struct;
 struct iov_iter;
-struct fscrypt_inode_info;
 struct fscrypt_operations;
 struct fsverity_info;
 struct fsverity_operations;
 struct fsnotify_mark_connector;
 struct fsnotify_sb_info;
@@ -778,14 +777,10 @@ struct inode {
 	__u32			i_fsnotify_mask; /* all events this inode cares about */
 	/* 32-bit hole reserved for expanding i_fsnotify_mask */
 	struct fsnotify_mark_connector __rcu	*i_fsnotify_marks;
 #endif
 
-#ifdef CONFIG_FS_ENCRYPTION
-	struct fscrypt_inode_info	*i_crypt_info;
-#endif
-
 #ifdef CONFIG_FS_VERITY
 	struct fsverity_info	*i_verity_info;
 #endif
 
 	void			*i_private; /* fs or device private pointer */
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index d7ff53accbfef..516aba5b858b5 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -199,15 +199,19 @@ struct fscrypt_operations {
 };
 
 int fscrypt_d_revalidate(struct inode *dir, const struct qstr *name,
 			 struct dentry *dentry, unsigned int flags);
 
+/*
+ * Returns the address of the fscrypt info pointer within the
+ * filesystem-specific part of the inode.  (To save memory on filesystems that
+ * don't support fscrypt, a field in 'struct inode' itself is no longer used.)
+ */
 static inline struct fscrypt_inode_info **
 fscrypt_inode_info_addr(const struct inode *inode)
 {
-	if (inode->i_sb->s_cop->inode_info_offs == 0)
-		return (struct fscrypt_inode_info **)&inode->i_crypt_info;
+	VFS_WARN_ON_ONCE(inode->i_sb->s_cop->inode_info_offs == 0);
 	return (void *)inode + inode->i_sb->s_cop->inode_info_offs;
 }
 
 /*
  * Load the inode's fscrypt info pointer, using a raw dereference.  Since this
-- 
2.50.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
