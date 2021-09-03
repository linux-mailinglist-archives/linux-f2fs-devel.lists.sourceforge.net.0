Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94D4000DB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 15:58:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mM9iI-0007r8-Pn; Fri, 03 Sep 2021 13:58:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1mM9iF-0007qX-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 13:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6/tFAYrQBdM/axq+G1OY6lmAqIcyejc71u54ON7pqM4=; b=RTK6cmEebWqJ8i/4XMR7WpPgV/
 0buwiARfGK3zt6mw+OAZjTWwXU8EEQVBWeAEyLgGNtjeQaIl6lBCDjPdAZW+W4bTbrB2ASmEMUMPY
 50mi5QfbZy1htPt/PPulKJJMq5dujptpy3lEm1VcvDI8FmnzZGwcsOaVVxAWFKr9+DJg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6/tFAYrQBdM/axq+G1OY6lmAqIcyejc71u54ON7pqM4=; b=lB3gH21cA7mMYKvhH2hxS0byaN
 NHdU5OU8j8nhdoRFbMka9Ps7BdYfMS8Wow0wOZav9hrlSpEoiw8vN8IfFQdtRRInRgPCNAgB5QFkp
 NMrMGvG0nCo5JfupQ7i1ktJdID7LABag8QdFz90XHg3IYxNDmS0xqoNagEkCDRqBLJyA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mM9iF-00D7os-5q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Sep 2021 13:58:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3597E610CE;
 Fri,  3 Sep 2021 13:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1630677509;
 bh=Vqg7yBvwxauUW5EmL46VZawUP/qFNnVXLQ6C7kO/his=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=gmuKitD4OlzWHvCl4S4JtIDFvGgR33+msO3cfBy3U6r4KmYm6J7gy+balOwz1xwLM
 o5gpJcErl6Ys8WkMgU3EuzPNV4MM27PlkNZ/LYOrQWN7vXW30fufSP+ridi68qZdk2
 0m6Oh7w3OCMhZf0z7ovss7Jh3EXfv3SXQzZSM8RY=
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 toybox@lists.landley.net
From: <gregkh@linuxfoundation.org>
Date: Fri, 03 Sep 2021 15:58:16 +0200
In-Reply-To: <20210901164041.176238-2-ebiggers@kernel.org>
Message-ID: <1630677496120@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled fscrypt: add fscrypt_symlink_getattr() for computing st_size to the
 5.4-stable tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mM9iF-00D7os-5q
Subject: [f2fs-dev] Patch "fscrypt: add fscrypt_symlink_getattr() for
 computing st_size" has been added to the 5.4-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


This is a note to let you know that I've just added the patch titled

    fscrypt: add fscrypt_symlink_getattr() for computing st_size

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-add-fscrypt_symlink_getattr-for-computing-st_size.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Fri Sep  3 03:56:23 PM CEST 2021
From: Eric Biggers <ebiggers@kernel.org>
Date: Wed,  1 Sep 2021 09:40:38 -0700
Subject: fscrypt: add fscrypt_symlink_getattr() for computing st_size
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20210901164041.176238-2-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit d18760560593e5af921f51a8c9b64b6109d634c2 upstream.

Add a helper function fscrypt_symlink_getattr() which will be called
from the various filesystems' ->getattr() methods to read and decrypt
the target of encrypted symlinks in order to report the correct st_size.

Detailed explanation:

As required by POSIX and as documented in various man pages, st_size for
a symlink is supposed to be the length of the symlink target.
Unfortunately, st_size has always been wrong for encrypted symlinks
because st_size is populated from i_size from disk, which intentionally
contains the length of the encrypted symlink target.  That's slightly
greater than the length of the decrypted symlink target (which is the
symlink target that userspace usually sees), and usually won't match the
length of the no-key encoded symlink target either.

This hadn't been fixed yet because reporting the correct st_size would
require reading the symlink target from disk and decrypting or encoding
it, which historically has been considered too heavyweight to do in
->getattr().  Also historically, the wrong st_size had only broken a
test (LTP lstat03) and there were no known complaints from real users.
(This is probably because the st_size of symlinks isn't used too often,
and when it is, typically it's for a hint for what buffer size to pass
to readlink() -- which a slightly-too-large size still works for.)

However, a couple things have changed now.  First, there have recently
been complaints about the current behavior from real users:

- Breakage in rpmbuild:
  https://github.com/rpm-software-management/rpm/issues/1682
  https://github.com/google/fscrypt/issues/305

- Breakage in toybox cpio:
  https://www.mail-archive.com/toybox@lists.landley.net/msg07193.html

- Breakage in libgit2: https://issuetracker.google.com/issues/189629152
  (on Android public issue tracker, requires login)

Second, we now cache decrypted symlink targets in ->i_link.  Therefore,
taking the performance hit of reading and decrypting the symlink target
in ->getattr() wouldn't be as big a deal as it used to be, since usually
it will just save having to do the same thing later.

Also note that eCryptfs ended up having to read and decrypt symlink
targets in ->getattr() as well, to fix this same issue; see
commit 3a60a1686f0d ("eCryptfs: Decrypt symlink target for stat size").

So, let's just bite the bullet, and read and decrypt the symlink target
in ->getattr() in order to report the correct st_size.  Add a function
fscrypt_symlink_getattr() which the filesystems will call to do this.

(Alternatively, we could store the decrypted size of symlinks on-disk.
But there isn't a great place to do so, and encryption is meant to hide
the original size to some extent; that property would be lost.)

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20210702065350.209646-2-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/hooks.c       |   44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h |    7 +++++++
 2 files changed, 51 insertions(+)

--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -305,3 +305,47 @@ err_kfree:
 	return ERR_PTR(err);
 }
 EXPORT_SYMBOL_GPL(fscrypt_get_symlink);
+
+/**
+ * fscrypt_symlink_getattr() - set the correct st_size for encrypted symlinks
+ * @path: the path for the encrypted symlink being queried
+ * @stat: the struct being filled with the symlink's attributes
+ *
+ * Override st_size of encrypted symlinks to be the length of the decrypted
+ * symlink target (or the no-key encoded symlink target, if the key is
+ * unavailable) rather than the length of the encrypted symlink target.  This is
+ * necessary for st_size to match the symlink target that userspace actually
+ * sees.  POSIX requires this, and some userspace programs depend on it.
+ *
+ * This requires reading the symlink target from disk if needed, setting up the
+ * inode's encryption key if possible, and then decrypting or encoding the
+ * symlink target.  This makes lstat() more heavyweight than is normally the
+ * case.  However, decrypted symlink targets will be cached in ->i_link, so
+ * usually the symlink won't have to be read and decrypted again later if/when
+ * it is actually followed, readlink() is called, or lstat() is called again.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fscrypt_symlink_getattr(const struct path *path, struct kstat *stat)
+{
+	struct dentry *dentry = path->dentry;
+	struct inode *inode = d_inode(dentry);
+	const char *link;
+	DEFINE_DELAYED_CALL(done);
+
+	/*
+	 * To get the symlink target that userspace will see (whether it's the
+	 * decrypted target or the no-key encoded target), we can just get it in
+	 * the same way the VFS does during path resolution and readlink().
+	 */
+	link = READ_ONCE(inode->i_link);
+	if (!link) {
+		link = inode->i_op->get_link(dentry, inode, &done);
+		if (IS_ERR(link))
+			return PTR_ERR(link);
+	}
+	stat->size = strlen(link);
+	do_delayed_call(&done);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fscrypt_symlink_getattr);
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -298,6 +298,7 @@ extern int __fscrypt_encrypt_symlink(str
 extern const char *fscrypt_get_symlink(struct inode *inode, const void *caddr,
 				       unsigned int max_size,
 				       struct delayed_call *done);
+int fscrypt_symlink_getattr(const struct path *path, struct kstat *stat);
 static inline void fscrypt_set_ops(struct super_block *sb,
 				   const struct fscrypt_operations *s_cop)
 {
@@ -585,6 +586,12 @@ static inline const char *fscrypt_get_sy
 	return ERR_PTR(-EOPNOTSUPP);
 }
 
+static inline int fscrypt_symlink_getattr(const struct path *path,
+					  struct kstat *stat)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline void fscrypt_set_ops(struct super_block *sb,
 				   const struct fscrypt_operations *s_cop)
 {


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/ubifs-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/ext4-report-correct-st_size-for-encrypted-symlinks.patch
queue-5.4/fscrypt-add-fscrypt_symlink_getattr-for-computing-st_size.patch
queue-5.4/f2fs-report-correct-st_size-for-encrypted-symlinks.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
