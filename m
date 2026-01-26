Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKOkARrzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 372EE83F4D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICVt2+24ScmMvvBOqfYwW5so3gHd09QBsWRQh8VW244=; b=LsYmLxbEJB+hXcIIdkXsj6/8bW
	7tjwAVB1bWe/uJz2TB9FlGt9FQchj1CtUIkUnjnegiGGmvNr/9Gi9KYD1sdbzIYBDiSWx1Tsy+eTr
	1dHOAkjETrmaUSITB2OqLoiAt13q4pCANOG9xnthUawYL8d0/yqFuson+RBcxXQSOpbI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEaa-0003at-JJ;
	Mon, 26 Jan 2026 04:52:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEaZ-0003am-B6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gh5GuGmf/AXxGu0R5TgdSlBmSwdaW+LSsVCkKK3WNTk=; b=krelG2Eb/xgD+nB3oihvjfE8NJ
 WA2X9lRqLWuAE3BDoWdpP/e/yeVFs+O8/s9wSs9DPS58NUc63WBbetUtvZt411wgO7QRz/4ExbMgJ
 NHT85CPl4bTUPLGXGE9rmDtjd/huQ6/xWRmomJ9HAUftkGjRMKiqB9YwfFeXGjdQsB+k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gh5GuGmf/AXxGu0R5TgdSlBmSwdaW+LSsVCkKK3WNTk=; b=cF9wL3V5sD0zSHF4dU2TkaBQ09
 JiSaxd/ejL5Bqx2pqDBs59y+JiMRSjStuiA2Z98CCGbyz3V9iHJj3Oy/uf7BzRnoceWNrNjdX3cxV
 n3fIUJyi+YFTZPRdXZtCPmQtWo2QAFFbgCRvPVRxZjBsEMN9x39vdMseJT1C1t3ZWouE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEaZ-0001oR-Iu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Gh5GuGmf/AXxGu0R5TgdSlBmSwdaW+LSsVCkKK3WNTk=; b=v9U5kwUmSrl28Znsmv21bLm2Fb
 QL7WF87qj7R6QpXbgwk7Yeg0lTpbTZFwIQb9znABOq9/ess4Gw6+Do4TdeKvyuLpQg/z+CbVD6Tbq
 dPMLMCzdqIJRCQNf9LNBrdbJRSXm7AP3UxRD/qN0VWBn5jaPe43mSAon09DroaCCrIo350JWW3oqx
 jWOUDl2r0hovZRu8NgGgCoPPwX2ehavkV7dHzkGs+SF0I/7Y1/2yeNCZ7J35qCvKTtzYb2zcVTRal
 VQVOV6rWyWNuJaav9dIyish4jW8YrC4NK+04Sk8lf/+KArF8AJr2KJ77+z5aetltUFjlWpGOh6Gqc
 ZpsvZ4ew==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEaQ-0000000BuP3-0uO0; Mon, 26 Jan 2026 04:52:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:47 +0100
Message-ID: <20260126045212.1381843-2-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126045212.1381843-1-hch@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add the check to reject truncates of fsverity files directly
 to setattr_prepare instead of requiring the file system to handle it. Besides
 removing boilerplate code, this also fixes the complete lack [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEaZ-0001oR-Iu
Subject: [f2fs-dev] [PATCH 01/16] fs,
 fsverity: reject size changes on fsverity files in setattr_prepare
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 372EE83F4D
X-Rspamd-Action: no action

Add the check to reject truncates of fsverity files directly to
setattr_prepare instead of requiring the file system to handle it.
Besides removing boilerplate code, this also fixes the complete lack of
such check in btrfs.

Fixes: 146054090b08 ("btrfs: initial fsverity support")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/attr.c                | 12 +++++++++++-
 fs/ext4/inode.c          |  4 ----
 fs/f2fs/file.c           |  4 ----
 fs/verity/open.c         |  8 --------
 include/linux/fsverity.h | 25 -------------------------
 5 files changed, 11 insertions(+), 42 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index b9ec6b47bab2..e7d7c6d19fe9 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -169,7 +169,17 @@ int setattr_prepare(struct mnt_idmap *idmap, struct dentry *dentry,
 	 * ATTR_FORCE.
 	 */
 	if (ia_valid & ATTR_SIZE) {
-		int error = inode_newsize_ok(inode, attr->ia_size);
+		int error;
+
+		/*
+		 * Verity files are immutable, so deny truncates.  This isn't
+		 * covered by the open-time check because sys_truncate() takes a
+		 * path, not an open file.
+		 */
+		if (IS_ENABLED(CONFIG_FS_VERITY) && IS_VERITY(inode))
+			return -EPERM;
+
+		error = inode_newsize_ok(inode, attr->ia_size);
 		if (error)
 			return error;
 	}
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 0c466ccbed69..8c2ef98fa530 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -5835,10 +5835,6 @@ int ext4_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (error)
 		return error;
 
-	error = fsverity_prepare_setattr(dentry, attr);
-	if (error)
-		return error;
-
 	if (is_quota_modification(idmap, inode, attr)) {
 		error = dquot_initialize(inode);
 		if (error)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d7047ca6b98d..da029fed4e5a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1074,10 +1074,6 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
-	err = fsverity_prepare_setattr(dentry, attr);
-	if (err)
-		return err;
-
 	if (unlikely(IS_IMMUTABLE(inode)))
 		return -EPERM;
 
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 77b1c977af02..2aa5eae5a540 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -384,14 +384,6 @@ int __fsverity_file_open(struct inode *inode, struct file *filp)
 }
 EXPORT_SYMBOL_GPL(__fsverity_file_open);
 
-int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr)
-{
-	if (attr->ia_valid & ATTR_SIZE)
-		return -EPERM;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(__fsverity_prepare_setattr);
-
 void __fsverity_cleanup_inode(struct inode *inode)
 {
 	struct fsverity_info **vi_addr = fsverity_info_addr(inode);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 5bc7280425a7..86fb1708676b 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -179,7 +179,6 @@ int fsverity_get_digest(struct inode *inode,
 /* open.c */
 
 int __fsverity_file_open(struct inode *inode, struct file *filp);
-int __fsverity_prepare_setattr(struct dentry *dentry, struct iattr *attr);
 void __fsverity_cleanup_inode(struct inode *inode);
 
 /**
@@ -251,12 +250,6 @@ static inline int __fsverity_file_open(struct inode *inode, struct file *filp)
 	return -EOPNOTSUPP;
 }
 
-static inline int __fsverity_prepare_setattr(struct dentry *dentry,
-					     struct iattr *attr)
-{
-	return -EOPNOTSUPP;
-}
-
 static inline void fsverity_cleanup_inode(struct inode *inode)
 {
 }
@@ -338,22 +331,4 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 	return 0;
 }
 
-/**
- * fsverity_prepare_setattr() - prepare to change a verity inode's attributes
- * @dentry: dentry through which the inode is being changed
- * @attr: attributes to change
- *
- * Verity files are immutable, so deny truncates.  This isn't covered by the
- * open-time check because sys_truncate() takes a path, not a file descriptor.
- *
- * Return: 0 on success, -errno on failure
- */
-static inline int fsverity_prepare_setattr(struct dentry *dentry,
-					   struct iattr *attr)
-{
-	if (IS_VERITY(d_inode(dentry)))
-		return __fsverity_prepare_setattr(dentry, attr);
-	return 0;
-}
-
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
