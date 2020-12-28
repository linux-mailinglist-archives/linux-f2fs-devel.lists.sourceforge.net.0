Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E112E6C7F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Dec 2020 00:26:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ku1to-00054b-G3; Mon, 28 Dec 2020 23:26:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1ku1tn-00054N-5i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 23:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ocxz2ihL/o6nJe+H8YhNv4P+y5w/KNbycG620Jpltf8=; b=X+AfMlhIzSW/oCSScS4O4RosGL
 PloXs3XaWslHCF9m6hGevDE/VgN79ERuQ04kWMkm/5Xqs3T8sJwsVkkrnDd+zxyx693WJVQaK4/eO
 9Hn9HOxoKjE6TgdcGMrtHvQJKqzWgs/7GwHkj5rD48UmT6LL5PDdQx4uVQJdyvGTjzZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ocxz2ihL/o6nJe+H8YhNv4P+y5w/KNbycG620Jpltf8=; b=b
 4OviFySNpru6jlbyvQNGEWkfrUWaInyEx/vcoWQ9N3hjvHyl9dLP9UmMz0ZkEKQJCPrQyBCXQaeHk
 vb7OrtdOQilEk/9uTNX9As+EDcYffn0Ek2SxNfG0RquBmbhVoecZ1lkhnhybOsgp1uuVeGvNYJMr6
 tmh7A7DvVljna1SU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ku1tf-0044cw-Aq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Dec 2020 23:25:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4712207A6;
 Mon, 28 Dec 2020 23:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609197945;
 bh=XexadEGIGMK8fTqIyWmcxjIb63KnYpJCztV+y0Etza4=;
 h=From:To:Cc:Subject:Date:From;
 b=Ior1RgNwd0kdZSKEy4Y6f7pSHKkDQO3Ypor5fkuIgDhz62CcOoNYxeVsZQMP61Yrv
 ORfvNS+OKKzYju0w2QfjUhpN5DPIhhoLa9DpsqNAjeAgX9nN3yx5RxoYIxClizHrQR
 EM3rYqlrH28VuhbYjAmXlfotleQU2InQtdo8a2VGTsFYlw8qn/hfrpAvAmLV4LHg3K
 Wnu612+Aa6uIFG7VQU49h5qP26sJArzaqdOdS7vzxZPX8SQjbXQ3Ml45/GAyGllIxS
 +hSXeVun8V4XohYCyuChO2BluUVnC/JlxWPNv2TKHDEZujm8M4DfNukfVMVJcdZRws
 QzSFXOS4nyvyg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 28 Dec 2020 15:25:29 -0800
Message-Id: <20201228232529.45365-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1ku1tf-0044cw-Aq
Subject: [f2fs-dev] [PATCH RESEND] libfs: unexport generic_ci_d_compare()
 and generic_ci_d_hash()
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
Cc: linux-fsdevel@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Now that generic_set_encrypted_ci_d_ops() has been added and ext4 and
f2fs are using it, it's no longer necessary to export
generic_ci_d_compare() and generic_ci_d_hash() to filesystems.

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/libfs.c         | 8 +++-----
 include/linux/fs.h | 5 -----
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index d1c3bade9f30d..79721571e014e 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -1388,8 +1388,8 @@ static bool needs_casefold(const struct inode *dir)
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
@@ -1426,7 +1426,6 @@ int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
 		return 1;
 	return !!memcmp(str, name->name, len);
 }
-EXPORT_SYMBOL(generic_ci_d_compare);
 
 /**
  * generic_ci_d_hash - generic d_hash implementation for casefolding filesystems
@@ -1435,7 +1434,7 @@ EXPORT_SYMBOL(generic_ci_d_compare);
  *
  * Return: 0 if hash was successful or unchanged, and -EINVAL on error
  */
-int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
+static int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 {
 	const struct inode *dir = READ_ONCE(dentry->d_inode);
 	struct super_block *sb = dentry->d_sb;
@@ -1450,7 +1449,6 @@ int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str)
 		return -EINVAL;
 	return 0;
 }
-EXPORT_SYMBOL(generic_ci_d_hash);
 
 static const struct dentry_operations generic_ci_dentry_ops = {
 	.d_hash = generic_ci_d_hash,
diff --git a/include/linux/fs.h b/include/linux/fs.h
index fd47deea7c176..6d8b1e7337e48 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -3192,11 +3192,6 @@ extern int generic_file_fsync(struct file *, loff_t, loff_t, int);
 
 extern int generic_check_addressable(unsigned, u64);
 
-#ifdef CONFIG_UNICODE
-extern int generic_ci_d_hash(const struct dentry *dentry, struct qstr *str);
-extern int generic_ci_d_compare(const struct dentry *dentry, unsigned int len,
-				const char *str, const struct qstr *name);
-#endif
 extern void generic_set_encrypted_ci_d_ops(struct dentry *dentry);
 
 #ifdef CONFIG_MIGRATION
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
