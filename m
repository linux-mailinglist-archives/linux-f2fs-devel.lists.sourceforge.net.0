Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241CA76E8F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW6-0004FA-4W;
	Mon, 31 Mar 2025 20:13:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVq-0003xd-MC
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bwhiE38cZibfKBGS+ew4zVO+LfmUgMIriBSXQ3LvEkU=; b=lah364aiQPbZ8g3oVzOUKyXhZf
 DYbQHJgkIBFfVOvGMI4bzWghJDP71iyLg0ljVVf34+Hts0RY6M93Etu3KAEpHI1mYy8SNhx/XeHVA
 Pm1cjNAu1kBmAkvMoQDH83D6iIEgPqS96kJFbJRCd/aTAxv06bCwUmyEVk0rZkd39lXg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bwhiE38cZibfKBGS+ew4zVO+LfmUgMIriBSXQ3LvEkU=; b=dPlOdpsBj+9Cf6jxI1Ez/aWgQa
 EDFlr+Ewf5t/03KdSxU221m5n1daozG2Y2vFQx6O6wUCxgI+vxCxKppw4etqfA87wD7+p673/R0D+
 Ehq+1Za6Wihtd8ksPAr6wNT7wWpHstgnISYfBzXWToX57o4A9/AvwAAx+7IEz7t2wV7g=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVl-0003gM-1u for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=bwhiE38cZibfKBGS+ew4zVO+LfmUgMIriBSXQ3LvEkU=; b=Fti9zR3QQsvqET9/Qc5yxglx0c
 7CPJjHW90nVxFscy/wGVb5c51DYWt+KsWv1yHo0uVHp1NlZBjyvoe537uMYPds5qhqGH4188PT/to
 4B7cNunX+eqFWqiyaL+iRbJ7Du8Nh2yn8QweIZi5ytJueZwY2h4hmPLipm2iIxzONeA6M52ea3haR
 6QmpWc1IYYWUWC1CgVhtyPDuwzUTC47O+zpXbNx9sYtboLrpKLdI+31JVyZW5yVVvzVK3jZTQASHP
 8wy9Kv2QVZ43Kj1Y+//FmfECtj6QCM4xRspfqlam8LsgBhOL1dyfwNBSvPIgnHI69ApKalz6E1T71
 f18rs00g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVZ-00000004SSj-2nos;
 Mon, 31 Mar 2025 20:13:21 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:20 +0100
Message-ID: <20250331201256.1057782-121-willy@infradead.org>
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
 Content preview:  The only caller has a folio,
 so pass it in. Removes two hidden
 calls to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/dir.c | 12 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-)
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
X-Headers-End: 1tzLVl-0003gM-1u
Subject: [f2fs-dev] [PATCH 120/153] f2fs: Pass a folio to init_dent_inode()
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

The only caller has a folio, so pass it in.  Removes two hidden calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/dir.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 4decec1800bf..85e42df34c99 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -443,17 +443,17 @@ void f2fs_set_link(struct inode *dir, struct f2fs_dir_entry *de,
 
 static void init_dent_inode(struct inode *dir, struct inode *inode,
 			    const struct f2fs_filename *fname,
-			    struct page *ipage)
+			    struct folio *ifolio)
 {
 	struct f2fs_inode *ri;
 
 	if (!fname) /* tmpfile case? */
 		return;
 
-	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 
-	/* copy name info. to this inode page */
-	ri = F2FS_INODE(ipage);
+	/* copy name info. to this inode folio */
+	ri = F2FS_INODE(&ifolio->page);
 	ri->i_namelen = cpu_to_le32(fname->disk_name.len);
 	memcpy(ri->i_name, fname->disk_name.name, fname->disk_name.len);
 	if (IS_ENCRYPTED(dir)) {
@@ -474,7 +474,7 @@ static void init_dent_inode(struct inode *dir, struct inode *inode,
 				file_lost_pino(inode);
 		}
 	}
-	set_page_dirty(ipage);
+	folio_mark_dirty(ifolio);
 }
 
 void f2fs_do_make_empty_dir(struct inode *inode, struct inode *parent,
@@ -557,7 +557,7 @@ struct page *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 			return &folio->page;
 	}
 
-	init_dent_inode(dir, inode, fname, &folio->page);
+	init_dent_inode(dir, inode, fname, folio);
 
 	/*
 	 * This file should be checkpointed during fsync.
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
