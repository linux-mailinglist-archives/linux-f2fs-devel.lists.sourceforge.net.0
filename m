Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C19A76E5B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVp-00016R-T8;
	Mon, 31 Mar 2025 20:13:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0000yG-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g97wEabHU8gZQEQdy/oLz6nv5fpA1hKhTUeSYZS8p24=; b=foJjJHUIiyayTXB7nViuDZhk7g
 UdChrNsi4BHw4h9Vraxv/36XLPj+1FOVdky+bnk0gVjhwccbcY2LvziQoYjo5veR6/BKdgMe5pKnW
 fkQs9oAmvCsMltEVWbxq7wqkFZT7nL4lqyctKG/Rzzdl4Ht1dYt9ExbIqCCxqjHyOPYE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g97wEabHU8gZQEQdy/oLz6nv5fpA1hKhTUeSYZS8p24=; b=ht/xLct22b50nxM8on1w5fvbf6
 F2PqRKEc7FhoKtnYAGURMJdeJfjnfcRzyKHow8vvxzDCiOFm48KRPI3YJP2C0a3rMtYdg5Qy4AjbN
 r0mcLbTBgFWbDYutWrLU72+lbvz4SOVM2LoPHAgZkYS2uBi5qWirP9mA4On2R5MwpTxo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVZ-0003b2-3v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=g97wEabHU8gZQEQdy/oLz6nv5fpA1hKhTUeSYZS8p24=; b=qhXzgvk+/35UuUPT53wVsM2BX+
 xab5pIeIz3ONfgW8tuDln3znHOEucjMOlEoE9OmZMjEXNomuhsdeHOnm8k+FdWZRWLR3glNnwfxcE
 9n4Ub0MWwQPKai/kpxO9XHg26BWj40rH+a6JcHdfCDHeZWtdnK/e11r0H81Mu/PeXZfdgDTghDob1
 LKpkVsWnP91AKs2grXSdt9G8vuG5hel82TnIDJkhRaObEI12M8/Et5GT75NFo2soukw+vCQnxw2QZ
 KjUIGN1sB/gMtf7vHw0IoNf/diDOTcP/ynB83NmHaslafG5JVHWHdmTAAMoMj9mtzCTuXKYkCgIEJ
 4XcNQAqw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVN-00000004Rnk-2tf2;
 Mon, 31 Mar 2025 20:13:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:18 +0100
Message-ID: <20250331201256.1057782-59-willy@infradead.org>
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
 Content preview: All callers have been converted to call
 f2fs_get_new_data_folio()
 so delete this wrapper. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 7 ------- 2 files changed,
 1 insertion(+), 8 deletions(-) 
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
X-Headers-End: 1tzLVZ-0003b2-3v
Subject: [f2fs-dev] [PATCH 058/153] f2fs: Remove f2fs_get_new_data_page()
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

All callers have been converted to call f2fs_get_new_data_folio()
so delete this wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/f2fs.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 52ca44b3c687..09b440e1dd12 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1258,7 +1258,7 @@ struct folio *f2fs_get_read_data_folio(struct inode *inode, pgoff_t index,
 	 * A new dentry page is allocated but not able to be written, since its
 	 * new inode page couldn't be allocated due to -ENOSPC.
 	 * In such the case, its blkaddr can be remained as NEW_ADDR.
-	 * see, f2fs_add_link -> f2fs_get_new_data_page ->
+	 * see, f2fs_add_link -> f2fs_get_new_data_folio ->
 	 * f2fs_init_inode_metadata.
 	 */
 	if (dn.data_blkaddr == NEW_ADDR) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ca6ad66c9078..5ad799c12ce6 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3983,13 +3983,6 @@ int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
 void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
 extern const struct iomap_ops f2fs_iomap_ops;
 
-static inline
-struct page *f2fs_get_new_data_page(struct inode *inode,
-			struct page *ipage, pgoff_t index, bool new_i_size)
-{
-	return &f2fs_get_new_data_folio(inode, ipage, index, new_i_size)->page;
-}
-
 /*
  * gc.c
  */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
