Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D5364D28B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 23:46:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5aVr-0003Ye-U3;
	Wed, 14 Dec 2022 22:46:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p5aVd-0003Xy-03
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N8LR8yaNlzz0tyNZu9QlyE+pTtw5KFHhkCbNA8lwvnc=; b=b3MdDE0TidDD8u3V1n3l6xgRH6
 7RHPHK2E4W4C/35DKj2EZz/acmVRsreSenndVJMp7OLfWigAcTM78w04E5HXUjdRmCbcjFI3Yz8+N
 uNh6COPkVpVJSIv/V/y/gCt3n6rdEBKRCf6+0LJVa1hjJPuqGkR298h7XSnQFi1ObKbQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N8LR8yaNlzz0tyNZu9QlyE+pTtw5KFHhkCbNA8lwvnc=; b=AwV6xMqFHZt9UfPiLRZDA0ZNHk
 HpZu2dFGjmSSMGjhilUXTfhXv6B6XglfsIu8iTmNCWBrFdFQqA+Gclbisn8bhRumklTkdq8xdIM8l
 URCHJXOzLeUckNtQXN11dcity24AyO7FWyHMed81x2UGO0KRKeocJSsxvjpNh1Uu8MKI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5aVY-0007Nd-Tq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A8CD9B81A38
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Dec 2022 22:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46DCBC433EF;
 Wed, 14 Dec 2022 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671057941;
 bh=PpIDTRfGV+7IlKXrZnNL1XI8NOCD138aZ//MeOn5bJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bIxb3U19TdTMW/XjZRbF5iSsWfBW1G2AXMyGoj7Rdb/4gR2zYLH0BcqXN+abh/pRv
 M7fnNFvC1yHuSa/Rvuuild7RK7E4EbaNcmm+Ik+HNTLRUeoW0otySnAkIkZ/vv6vJt
 Jujbk5HQA56SgDMPGaAK7Eg4z8F2fnlagjLJB2zoExMnvKcwnJ4yXR07hZzEVZTVQH
 dgOPGr6mDo4GxlfwomIGxxLJPigyEUCALpmIEEb/mpEXbjGR9ixUq6wOOtWgIzawTk
 zhCMPqNy34vmxw2ZYbKx+2WRBdFtYz3IfQT8BKzOGIRKH1c2VK0ptVVK5UowjlbROW
 s9TwIHGJ4YSbg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 14 Dec 2022 14:43:01 -0800
Message-Id: <20221214224304.145712-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214224304.145712-1-ebiggers@kernel.org>
References: <20221214224304.145712-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make
 fsverity_file_open()
 an inline function that does the IS_VERITY() check, then (if needed) calls
 __fsverity_file_open() to do the real work. This reduces the overhead on
 non-verity files. 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5aVY-0007Nd-Tq
Subject: [f2fs-dev] [PATCH 1/4] fsverity: optimize fsverity_file_open() on
 non-verity files
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Make fsverity_file_open() an inline function that does the IS_VERITY()
check, then (if needed) calls __fsverity_file_open() to do the real
work.  This reduces the overhead on non-verity files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/open.c         | 20 ++------------------
 include/linux/fsverity.h | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index 81ff94442f7b..673d6db9abdf 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -325,24 +325,8 @@ static int ensure_verity_info(struct inode *inode)
 	return err;
 }
 
-/**
- * fsverity_file_open() - prepare to open a verity file
- * @inode: the inode being opened
- * @filp: the struct file being set up
- *
- * When opening a verity file, deny the open if it is for writing.  Otherwise,
- * set up the inode's ->i_verity_info if not already done.
- *
- * When combined with fscrypt, this must be called after fscrypt_file_open().
- * Otherwise, we won't have the key set up to decrypt the verity metadata.
- *
- * Return: 0 on success, -errno on failure
- */
-int fsverity_file_open(struct inode *inode, struct file *filp)
+int __fsverity_file_open(struct inode *inode, struct file *filp)
 {
-	if (!IS_VERITY(inode))
-		return 0;
-
 	if (filp->f_mode & FMODE_WRITE) {
 		pr_debug("Denying opening verity file (ino %lu) for write\n",
 			 inode->i_ino);
@@ -351,7 +335,7 @@ int fsverity_file_open(struct inode *inode, struct file *filp)
 
 	return ensure_verity_info(inode);
 }
-EXPORT_SYMBOL_GPL(fsverity_file_open);
+EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
 /**
  * fsverity_prepare_setattr() - prepare to change a verity inode's attributes
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 40f14e5fed9d..326bf2e2b903 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -148,7 +148,7 @@ int fsverity_get_digest(struct inode *inode,
 
 /* open.c */
 
-int fsverity_file_open(struct inode *inode, struct file *filp);
+int __fsverity_file_open(struct inode *inode, struct file *filp);
 int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 void fsverity_cleanup_inode(struct inode *inode);
 
@@ -193,9 +193,9 @@ static inline int fsverity_get_digest(struct inode *inode,
 
 /* open.c */
 
-static inline int fsverity_file_open(struct inode *inode, struct file *filp)
+static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
 {
-	return IS_VERITY(inode) ? -EOPNOTSUPP : 0;
+	return -EOPNOTSUPP;
 }
 
 static inline int fsverity_prepare_setattr(struct dentry *dentry,
@@ -254,4 +254,24 @@ static inline bool fsverity_active(const struct inode *inode)
 	return fsverity_get_info(inode) != NULL;
 }
 
+/**
+ * fsverity_file_open() - prepare to open a verity file
+ * @inode: the inode being opened
+ * @filp: the struct file being set up
+ *
+ * When opening a verity file, deny the open if it is for writing.  Otherwise,
+ * set up the inode's ->i_verity_info if not already done.
+ *
+ * When combined with fscrypt, this must be called after fscrypt_file_open().
+ * Otherwise, we won't have the key set up to decrypt the verity metadata.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+static inline int fsverity_file_open(struct inode *inode, struct file *filp)
+{
+	if (IS_VERITY(inode))
+		return __fsverity_file_open(inode, filp);
+	return 0;
+}
+
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
