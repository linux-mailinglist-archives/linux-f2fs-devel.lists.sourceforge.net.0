Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C8D64D28C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Dec 2022 23:46:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5aVq-0006QC-29;
	Wed, 14 Dec 2022 22:46:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p5aVa-0006Pf-HR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oTvUMHQsC/qP6tV1pWHYuEAzJkvtS29sZg1VuWI96sw=; b=m+EdNfrNKDh+BYSUveTv3Sr0KI
 E6jEEWSNdHw+0l6eqElNsCbgNQ2rxiZEvC5e772hVMRCinINicNlJ6YfMJxBCF9B3bY0hdI+wCe9o
 dfpTIcJIpMN0zgjgKGOg65gJ6jUUyIqS9kfNzDyBiODEq4jMb75ONKWsj7WoQR72Ifj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oTvUMHQsC/qP6tV1pWHYuEAzJkvtS29sZg1VuWI96sw=; b=TDJgX+jyoHAIPs5MAvD4AJwz/Z
 ArtQzdtQE6YQa9ALFTIhUUt7a1ORhV6bNn1+LTh6VKyvWjcPs0D+Cmcq+JC93h5CKUxanA1lv0Oxe
 bW+DKDdmA+BU0SKxJ1ecAVsk3RVjRug3dXUXIP1bBTC+WgbqurNEaQxKgDZbY7852EfM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5aVY-0007Nc-1q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Dec 2022 22:45:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A5C3E61C3F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 14 Dec 2022 22:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E012AC433D2;
 Wed, 14 Dec 2022 22:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671057942;
 bh=s8dg1vvBSOe1uFDb6X0c7Lo1qJtF6A37tS92++ok0e0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XtUriyDzkRFPg4njwQjjGG6jpMpkutiINigs/Wv2bMtLBVzTvcSX4F5DkYlXNiZOt
 zLA9iiJCMQ3dst+01fJVh6ksPbvnjoWW5M6UXO2N5jNXTZQB2Wb2dC12IRz+7yv0yf
 AywvCVZfvh/7oc0LOlOccnongCuLUyuDFOp/joMg6Yo9JnskD4c6R9CtRAIdUtb79e
 291m10yspAAJpN2MO+vco+K2vsZBOX/bmAIDYE9shLc5qmXFi4PSEfZ2HUeyS5Y0On
 5VGX6RdU1ac8VCy/Lm+g1FHyrRbL4CBEVPNT7GdB2vjS0VkzmVcAohXGzFklXzqf1K
 vLLQDWD25QVPA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 14 Dec 2022 14:43:03 -0800
Message-Id: <20221214224304.145712-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221214224304.145712-1-ebiggers@kernel.org>
References: <20221214224304.145712-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Make
 fsverity_cleanup_inode()
 an inline function that checks for non-NULL ->i_verity_info, then (if needed)
 calls __fsverity_cleanup_inode() to do the real work. This reduces the
 overhead on non-verit [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5aVY-0007Nc-1q
Subject: [f2fs-dev] [PATCH 3/4] fsverity: optimize fsverity_cleanup_inode()
 on non-verity files
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

Make fsverity_cleanup_inode() an inline function that checks for
non-NULL ->i_verity_info, then (if needed) calls
__fsverity_cleanup_inode() to do the real work.  This reduces the
overhead on non-verity files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/open.c         | 10 ++--------
 include/linux/fsverity.h | 14 +++++++++++++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/fs/verity/open.c b/fs/verity/open.c
index e1e531d5e09a..c723a62841db 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -348,18 +348,12 @@ int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
 }
 EXPORT_SYMBOL_GPL(__fsverity_prepare_setattr);
 
-/**
- * fsverity_cleanup_inode() - free the inode's verity info, if present
- * @inode: an inode being evicted
- *
- * Filesystems must call this on inode eviction to free ->i_verity_info.
- */
-void fsverity_cleanup_inode(struct inode *inode)
+void __fsverity_cleanup_inode(struct inode *inode)
 {
 	fsverity_free_info(inode->i_verity_info);
 	inode->i_verity_info = NULL;
 }
-EXPORT_SYMBOL_GPL(fsverity_cleanup_inode);
+EXPORT_SYMBOL_GPL(__fsverity_cleanup_inode);
 
 int __init fsverity_init_info_cache(void)
 {
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 84b498fff7ec..203f4962c54a 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -150,7 +150,19 @@ int fsverity_get_digest(struct inode *inode,
 
 int __fsverity_file_open(struct inode *inode, struct file *filp);
 int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
-void fsverity_cleanup_inode(struct inode *inode);
+void __fsverity_cleanup_inode(struct inode *inode);
+
+/**
+ * fsverity_cleanup_inode() - free the inode's verity info, if present
+ * @inode: an inode being evicted
+ *
+ * Filesystems must call this on inode eviction to free ->i_verity_info.
+ */
+static inline void fsverity_cleanup_inode(struct inode *inode)
+{
+	if (inode->i_verity_info)
+		__fsverity_cleanup_inode(inode);
+}
 
 /* read_metadata.c */
 
-- 
2.38.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
