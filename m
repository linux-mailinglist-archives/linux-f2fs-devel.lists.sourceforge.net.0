Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C7F1CE3EF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 May 2020 21:22:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jYE0W-00061G-LZ; Mon, 11 May 2020 19:22:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jYE0T-00060k-L6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xS7H9gTOHmUqrrlgGHJwL7yOgoFxTCunorrKA1diJ/4=; b=BfPk1Gxr2Iz6T5Dm9ULGmZ0bX4
 bWOXOZHzN7gSCeSlu2bcQYSNSvkV0UqHWIl2OfnK4Ferzj0IeQp7Ku5ggeY6U/3YnPtNRBqHCY09p
 SOzwh0S1xOJpVmLmPasWT/vzYFcA1XBYGR+MD+W/IaEMXkM6G3Ib/L+W5zCb9+9R3hEk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xS7H9gTOHmUqrrlgGHJwL7yOgoFxTCunorrKA1diJ/4=; b=jDP4WjzGPJsO3CXl1zVQL3OUQR
 KS4j8/ZUeyUe7y4JB6C8+fm07AKpRMdTJiJ3JyqCgZ9Dqso2uaHiSp3+/IknalhuJP5bSH7J0jI0d
 tMxPVXvMGGHu9NzTd4kceUANkRWCArdbDcfnki63VPbxcAvYnspA4p2JWyr0pi/7yeWM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jYE0R-004pAu-QP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 May 2020 19:22:29 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 216DB20882;
 Mon, 11 May 2020 19:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589224942;
 bh=WDO+wTU5z2N1q8uR2/RvSI6cZVBi4fXWIwtCAyalDqg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICUV1do+0NBdYn0xx6KQ+B0rpXr4wRdt1K6Uco4pSoClI9wReBqPvE/onAWi2ctel
 +8H9Io5PQIuP71/uM2U3jz5rRCdViJ13RBDONq2zoLDQrqB3U2N9udr6m1bsT4r0xO
 1NQPEOjScHFSq7nuER/pHjhAipMYsfP/SLenozV8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 11 May 2020 12:21:18 -0700
Message-Id: <20200511192118.71427-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511192118.71427-1-ebiggers@kernel.org>
References: <20200511192118.71427-1-ebiggers@kernel.org>
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
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jYE0R-004pAu-QP
Subject: [f2fs-dev] [PATCH 2/2] fs-verity: remove unnecessary extern keywords
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Remove the unnecessary 'extern' keywords from function declarations.
This makes it so that we don't have a mix of both styles, so it won't be
ambiguous what to use in new fs-verity patches.  This also makes the
code shorter and matches the 'checkpatch --strict' expectation.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  2 +-
 include/linux/fsverity.h     | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 8788f3a5035c2a..e96d99d5145e1d 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -134,7 +134,7 @@ void __init fsverity_check_hash_algs(void);
 
 /* init.c */
 
-extern void __printf(3, 4) __cold
+void __printf(3, 4) __cold
 fsverity_msg(const struct inode *inode, const char *level,
 	     const char *fmt, ...);
 
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 5ac30198e03201..78201a6d35f66d 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -121,23 +121,23 @@ static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 
 /* enable.c */
 
-extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
+int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
 
 /* measure.c */
 
-extern int fsverity_ioctl_measure(struct file *filp, void __user *arg);
+int fsverity_ioctl_measure(struct file *filp, void __user *arg);
 
 /* open.c */
 
-extern int fsverity_file_open(struct inode *inode, struct file *filp);
-extern int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
-extern void fsverity_cleanup_inode(struct inode *inode);
+int fsverity_file_open(struct inode *inode, struct file *filp);
+int fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
+void fsverity_cleanup_inode(struct inode *inode);
 
 /* verify.c */
 
-extern bool fsverity_verify_page(struct page *page);
-extern void fsverity_verify_bio(struct bio *bio);
-extern void fsverity_enqueue_verify_work(struct work_struct *work);
+bool fsverity_verify_page(struct page *page);
+void fsverity_verify_bio(struct bio *bio);
+void fsverity_enqueue_verify_work(struct work_struct *work);
 
 #else /* !CONFIG_FS_VERITY */
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
