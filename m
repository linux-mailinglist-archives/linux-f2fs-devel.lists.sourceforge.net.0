Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B577CA76EC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWW-0006Di-V0;
	Mon, 31 Mar 2025 20:14:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVt-0005mw-TS
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0MYYyVODyuFvf3KyUdmugoNOriOJft5n8iecoUnEHBU=; b=iY1xusJh5EialoG1OWuK+zdy44
 ImKHqskpqlydFY+JtgEdevf0Od/AoSMKoqJtamOOu5ivtBFhnqayXBY5eIzffuXR/5FdPE/pBGkra
 r4oE8XF6bokfvQjUcLcl7vI8/ceKxomMUct0K0UOF4T7UAUbLhqoRBuLuHm8dfNrRAJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0MYYyVODyuFvf3KyUdmugoNOriOJft5n8iecoUnEHBU=; b=gZGWmT8Bt0t530sZ49lW4FHd+Z
 XS4sQYre7wuMZlalwdzfZvK1jwT7zQ3B9mkXz7xZj/9+ChAdr5AWHkLNdm9SRjlIs5L5aZTHiT0jQ
 DYsew6nibWUhkB4GGt9FG4TyiyL6YUVszEJN+nJ4HYR7mlYWwQ4LTdfWuR4IhFL4jN94=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVi-0003f7-Nh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=0MYYyVODyuFvf3KyUdmugoNOriOJft5n8iecoUnEHBU=; b=XezDgZgPsNEXHuZiefhObxfae8
 RWwZMusOfE3N5XroSQ5PMPkmaBCyzmEodzIAAi8TVTgGqqNtJZCBBn/OUEms+biKwmHUI+1zA9qxa
 DZMkM2kJGhtJqcYYjhON7JRGnhPyoixXpBFYd0vfkMgRxqR8nWwd4xyhUxnFKm1Y+MxFhnh/JNnTc
 rNY0n+m9br7kRVWW4a6FVed5gqOE8v/sskGzHeec5BDrhAlm+XDcY8X+vOHVS8hOdM4gl38JrH0lz
 +rnY15QQzOLFqWfMXk4QQLwL/ivLplwxqNJUKWyb5ZVtGSUqEc3aUiNCYinuibnH/OtLSTAvNfD5b
 Bvf2TnYA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVX-00000004SIW-1RSt;
 Mon, 31 Mar 2025 20:13:19 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:06 +0100
Message-ID: <20250331201256.1057782-107-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove a call to compound_head(). Signed-off-by: Matthew
 Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/inode.c | 12 ++++++------ 1 file
 changed, 6 insertions(+),
 6 deletions(-) diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
 index 38512f2d4b28..c122761eaa86 100644 --- a/fs/f2fs/inode.c +++
 b/fs/f2fs/inode.c
 @@ -752,12 +752,12 @@ void f2fs_update_inode(struct inode *inode, str [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVi-0003f7-Nh
Subject: [f2fs-dev] [PATCH 106/153] f2fs: Use a folio in
 f2fs_update_inode_page()
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

Remove a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/inode.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 38512f2d4b28..c122761eaa86 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -752,12 +752,12 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
 void f2fs_update_inode_page(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct page *node_page;
+	struct folio *node_folio;
 	int count = 0;
 retry:
-	node_page = f2fs_get_inode_page(sbi, inode->i_ino);
-	if (IS_ERR(node_page)) {
-		int err = PTR_ERR(node_page);
+	node_folio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(node_folio)) {
+		int err = PTR_ERR(node_folio);
 
 		/* The node block was truncated. */
 		if (err == -ENOENT)
@@ -772,8 +772,8 @@ void f2fs_update_inode_page(struct inode *inode)
 		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_UPDATE_INODE);
 		return;
 	}
-	f2fs_update_inode(inode, node_page);
-	f2fs_put_page(node_page, 1);
+	f2fs_update_inode(inode, &node_folio->page);
+	f2fs_folio_put(node_folio, true);
 }
 
 int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
