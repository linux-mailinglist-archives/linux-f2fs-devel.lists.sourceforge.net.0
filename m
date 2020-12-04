Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 075AF2CF7A0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 00:40:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klKgw-0006VP-5i; Fri, 04 Dec 2020 23:40:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1klKgu-0006VA-J4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 23:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jp6kYnQeh/Z5eonhDtFbyk5uIVVeFbivHi5ZQH+AuwI=; b=iw3tMVMN3IuD8ZicMEesL232sB
 d3kjl9K8rxsCSK4maRql9FePJPVBgzUdj1vaHJJjKGG37ZOe7ZSkWHV2dxIbBop/KK/UZeQOyFdM1
 szidO+rCsZcpTHFrxvrAb+HEoXzmmGRGT4E1tRvZ9AzW+hxrSFhOea10VIg/fsSztHUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jp6kYnQeh/Z5eonhDtFbyk5uIVVeFbivHi5ZQH+AuwI=; b=h
 wGl8CWD2v8aLFTiW6aZcLikI9vzl7XQYWtNNlflJB/kpAM//uU3tD45OJmTOk6b1trH6BAYng0Vyc
 Ozuu6GdkJE48J6b4kBMelYPjUkKp5CRKBTrzVvjsilFCldrqdpDhOY1ASg1Grmd4v93S5TzqDvQF2
 7bo9DohXp/JdUjf8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1klKgm-00G0v5-Rr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Dec 2020 23:40:44 +0000
From: Eric Biggers <ebiggers@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri,  4 Dec 2020 15:39:40 -0800
Message-Id: <20201204233940.52144-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1klKgm-00G0v5-Rr
Subject: [f2fs-dev] [PATCH] libfs: unexport generic_ci_d_compare() and
 generic_ci_d_hash()
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that generic_set_encrypted_ci_d_ops() has been added and ext4 and
f2fs are using it, it's no longer necessary to export
generic_ci_d_compare() and generic_ci_d_hash() to filesystems.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

This patch applies to f2fs/dev, as it depends on "libfs: Add generic
function for setting dentry_ops" and "fscrypt: Have filesystems handle
their d_ops" which are queued in f2fs/dev.

 fs/libfs.c         | 8 +++-----
 include/linux/fs.h | 5 -----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index bac9186990220..a33bc3451d096 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1386,8 +1386,8 @@ static bool needs_casefold(const struct inode *dir)
  *
  * Return: 0 if names match, 1 if mismatch, or -ERRNO
  */
-int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
-			  const char *str, const struct qstr *name)
+static int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
+				const char *str, const struct qstr *name)
 {
 	const struct dentry *parent = READ_ONCE(dentry->d_parent);
 	const struct inode *dir = READ_ONCE(parent->d_inode);
@@ -1424,7 +1424,6 @@ int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 		return 1;
 	return !!memcmp(str, name->name, len);
 }
-EXPORT_SYMBOL(generic_ci_d_compare);
 
 /**
  * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
@@ -1433,7 +1432,7 @@ EXPORT_SYMBOL(generic_ci_d_compare);
  *
  * Return: 0 if hash was successful or unchanged, and -EINVAL on error
  */
-int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 {
 	const struct inode *dir = READ_ONCE(dentry->d_inode);
 	struct super_block *sb = dentry->d_sb;
@@ -1448,7 +1447,6 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 		return -EINVAL;
 	return 0;
 }
-EXPORT_SYMBOL(generic_ci_d_hash);
 
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 4a25ab4dbd3e9..f000cccaa6ac7 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3181,11 +3181,6 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
-#ifdef CONFIG_UNICODE
-extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
-extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
-				const char *str, const struct qstr *name);
-#endif
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION

base-commit: a7f72973ac2342644fce026e01943ed0f41fcc4a
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
