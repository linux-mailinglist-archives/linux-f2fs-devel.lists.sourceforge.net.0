Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5729A76EA0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWB-0001KK-KF;
	Mon, 31 Mar 2025 20:14:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-00014j-M4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q3FFKFIIiqf8diO94/U99SeNnQMe8y48UNnHNhYsN44=; b=j6SOom7xEDmPHPzYQP9SzDaFMf
 5cnpn93em16GXvZ7kOCxeP1zWpyzahgv3/FfxNAEPW3AeqteFyS2sdf5oQuCDlEMX63SGd9Ec2IRD
 AohLezBhqxKr07NtKIQqR7kNcFAdGqmP4konkIeRFMkUtEeuT7whsN7Y2nDpH+QnZCcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q3FFKFIIiqf8diO94/U99SeNnQMe8y48UNnHNhYsN44=; b=HQbff5gNUnadxNmyCEUnc7/nRy
 UM3bSIx2kI+CvORxvC4zUQ3oL280NQxw1RdnzQqLmFYGgQMhjhwIMkIdSQcy3eQtFZhLRvYmaTCDP
 FNO34c0C0di5AwT6h1f+EJjNBQ6g7TeRolJe6Z8Or0piGj0WheqZENFUxIyivRFhGYvo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVh-0003ed-PY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=q3FFKFIIiqf8diO94/U99SeNnQMe8y48UNnHNhYsN44=; b=SQAMfF46Lw4O0KscTDeh7dxToI
 AsCEYtH7Evb+cv+PEdUGFCX1/hYL9q0FLlIUET9EEnpKy+Ky3fCimUlR71hpSGrXMH2YA6u091Vdh
 tHLESLePUL8pf59glSqeMDxv4YhKsXqI+4shShmNYWEEyVdKM891n8urRZ3fMs5IhSUJjJGgyPaJm
 u7V614vOMY+E9Exw0eFWLu99OKjBBmUKCbfaHFmVm/u/I6S/S2QAoxzi2HzcFDmlXcEKTQE11dVZn
 wOiVjzesxyDMEmKqXwH/lH06WrU3OCQT+BWk2bTRLNujmD1FVMsI3k/xqUXFA/iHSu1KJrF41aHaY
 dnf/0GTQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVb-00000004SY6-1g9v;
 Mon, 31 Mar 2025 20:13:23 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:31 +0100
Message-ID: <20250331201256.1057782-132-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/inline.c
 | 8 ++++---- fs/f2fs/recovery.c | 2 +- 3 files changed, 6 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVh-0003ed-PY
Subject: [f2fs-dev] [PATCH 131/153] f2fs: Pass a folio to
 f2fs_recover_inline_data()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The only caller has a folio, so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h     | 2 +-
 fs/f2fs/inline.c   | 8 ++++----
 fs/f2fs/recovery.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index dc7463004c75..210f0cf0bc22 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4280,7 +4280,7 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
-int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
+int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 		const struct f2fs_filename *fname, struct folio **res_folio,
 		bool use_hash);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 1c6dc9731f2a..2d2dada85e08 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -291,7 +291,7 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	return 0;
 }
 
-int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
+int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_inode *ri = NULL;
@@ -305,8 +305,8 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 	 *    x       o  -> remove data blocks, and then recover inline_data
 	 *    x       x  -> recover data blocks
 	 */
-	if (IS_INODE(npage))
-		ri = F2FS_INODE(npage);
+	if (IS_INODE(&nfolio->page))
+		ri = F2FS_INODE(&nfolio->page);
 
 	if (f2fs_has_inline_data(inode) &&
 			ri && (ri->i_inline & F2FS_INLINE_DATA)) {
@@ -318,7 +318,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 
 		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
-		src_addr = inline_data_addr(inode, npage);
+		src_addr = inline_data_addr(inode, &nfolio->page);
 		dst_addr = inline_data_addr(inode, &ifolio->page);
 		memcpy(dst_addr, src_addr, MAX_INLINE_DATA(inode));
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 0dfc60ac0f37..bc7041d82dc5 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -640,7 +640,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	}
 
 	/* step 2: recover inline data */
-	err = f2fs_recover_inline_data(inode, &folio->page);
+	err = f2fs_recover_inline_data(inode, folio);
 	if (err) {
 		if (err == 1)
 			err = 0;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
