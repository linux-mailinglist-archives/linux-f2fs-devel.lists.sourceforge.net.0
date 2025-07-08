Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BFAFD42C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BLP+s/gOqE6aF/svnhTb1tUAQTWNOCF6KlZPOYZ9mRA=; b=L5KSEDfsMWoXPzy+/C//I8WDu0
	GBa9dR2i/ul9sNpvieg9WmkjUtw26NK1tBBMpX1pVv9lkaIByWib6vGZ2AZFMEktpS9KJtPtQ1g95
	UhH5PQ+TBRFOMjfPiUYMi+VBAaLVaPzWuzsfG3XCQGlY0hF/CgAQmlNd4BWu1JbsyLao=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjs-0005EL-TH;
	Tue, 08 Jul 2025 17:04:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjp-0005D1-Db
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/9yYmNGnZ0LDYn8Nq6i3Fue1cB6j3aI53c/YugxF33A=; b=fyyybv1ikkhLI/P4ts8g1SrS8r
 Pk6D3WBR6aKlWlvFRn3sZp4w/o0YSFe2VKJ6wVWECXsrq2iThvkryjHxr60soiFIrrPs3XhLL1sOh
 T7VkMccClExKE1maRLBjbahASNS9CocdeQEBV01XtLm9E9hZCObKwu1HQUFzbG7KVFbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/9yYmNGnZ0LDYn8Nq6i3Fue1cB6j3aI53c/YugxF33A=; b=O5oqdHh4gSmnBPr0xy8xmVFHXB
 C5f737GrEjtuuptopfmxP5ZExLc0ZiZ6/ZYC2R2aT8F5wZ+mOFKnBErWu8FA4iD7Ycdh2Out8DflQ
 soKmQtr716bRtkeO+0IAGlJglzxwRRMujOsntXCrp4iNoicEuMN0Z67cWeD3QLAYf9eQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjk-0006Do-Ka for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=/9yYmNGnZ0LDYn8Nq6i3Fue1cB6j3aI53c/YugxF33A=; b=ofDCBi8IryZOB4lqOGngB63f2R
 73q6jegzEjZ4rVfg5FUFdEx6rfMNqjikMVV2KemRYU6FJAB4j6Wmn+Cz3re68U5sqcZJKq8R+tjZU
 SUzqqFd5aqPlTI/YrKi6SjJD2qG8heV4wPMwExgHABThF2T/ihbECZFwqzKCds7szHcOVWEqw+//P
 vwRNP10Pjesri6OE1iNNTxGfBhk9PXoJHh+px6TughLkXKWmMRAArWIeejA6cTpMMVf27WtTdn6BV
 um2AzKBaW+uqCB0vlWZawXK25o9g5oKdZ5/ZN1Pra4H+qWfumdgQ8dmKsz2VsQQTC8vnhBqFRD7tt
 ihE/F6jg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjd-00000000T3E-365E;
 Tue, 08 Jul 2025 17:04:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:02:59 +0100
Message-ID: <20250708170359.111653-3-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in. Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/recovery.c | 12
 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-) diff --git a/fs/f2fs/recovery.c
 b/fs/f2fs/recovery.c index f84a96deaa07..dacfe7c1cbe5 100644 ---
 a/fs/f2fs/recovery.c +++ b/fs/f2fs/recovery.c @@ -277, 16 +277,
 16 @@ static void recover_inline_flags(st [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjk-0006Do-Ka
Subject: [f2fs-dev] [PATCH 02/60] f2fs: Pass a folio to recover_inode()
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
 fs/f2fs/recovery.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index f84a96deaa07..dacfe7c1cbe5 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -277,16 +277,16 @@ static void recover_inline_flags(struct inode *inode, struct f2fs_inode *ri)
 		clear_inode_flag(inode, FI_DATA_EXIST);
 }
 
-static int recover_inode(struct inode *inode, struct page *page)
+static int recover_inode(struct inode *inode, struct folio *folio)
 {
-	struct f2fs_inode *raw = F2FS_INODE(page);
+	struct f2fs_inode *raw = F2FS_INODE(&folio->page);
 	struct f2fs_inode_info *fi = F2FS_I(inode);
 	char *name;
 	int err;
 
 	inode->i_mode = le16_to_cpu(raw->i_mode);
 
-	err = recover_quota_data(inode, page);
+	err = recover_quota_data(inode, &folio->page);
 	if (err)
 		return err;
 
@@ -333,10 +333,10 @@ static int recover_inode(struct inode *inode, struct page *page)
 	if (file_enc_name(inode))
 		name = "<encrypted>";
 	else
-		name = F2FS_INODE(page)->i_name;
+		name = F2FS_INODE(&folio->page)->i_name;
 
 	f2fs_notice(F2FS_I_SB(inode), "recover_inode: ino = %x, name = %s, inline = %x",
-		    ino_of_node(page), name, raw->i_inline);
+		    ino_of_node(&folio->page), name, raw->i_inline);
 	return 0;
 }
 
@@ -810,7 +810,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		 * So, call recover_inode for the inode update.
 		 */
 		if (IS_INODE(&folio->page)) {
-			err = recover_inode(entry->inode, &folio->page);
+			err = recover_inode(entry->inode, folio);
 			if (err) {
 				f2fs_folio_put(folio, true);
 				break;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
