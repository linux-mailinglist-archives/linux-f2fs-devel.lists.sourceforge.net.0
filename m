Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BB46FA76E95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW8-0004IE-42;
	Mon, 31 Mar 2025 20:13:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVw-00041k-3I
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3tnbPlSrEIPTDpUIdfP0RUA/zrE/Atj3MxHYqa75ynw=; b=UAspyd10OB5Ig/2DXCKGld/Ir4
 NmTDmCcXT6+LoI5Fn3ExHU4RKfuNDsdffQfcSq34bMsecARwoVG7jfJnV7EZ4mNR0L8qbkXJW5B3k
 8r/NUpDeoAwpOKcc/zIz53PcMxXc9wns9EbWt8JE/WlC0gSJGxhqjHLMYjLddcCc4lHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3tnbPlSrEIPTDpUIdfP0RUA/zrE/Atj3MxHYqa75ynw=; b=Om3uFXjXXUsuVEioRuM7TNitkX
 SZvxqzF1QTTvv4B9iXo2q7RoZt870giGdVnxEPEN5JQdurSmMV1843reiMjSNFnSf0BJ1DvQ5lKSO
 VN5yjp+1XEPrRaMhqKAWpOGZCTfqxbtlqwUly/3tIErUuSpLW49snmCRIzuUnZ3RI/uo=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVq-0003iY-GM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=3tnbPlSrEIPTDpUIdfP0RUA/zrE/Atj3MxHYqa75ynw=; b=N0N48k0V+ZXt4pACs3eoxx6JmQ
 jrURja7SbtZuxbHUD+NdBA0OoGsyaxcOpbObwzMzy4ppvsVsMwdPxgY7BGxUoY4sEUuZ8rUpxau1r
 7UEBoUF2bIiboL8FtAaA2mST4+aHBohDi6cm8Buzw755QtaeERL6Ft7L5GyjFj1LslLhWWbVFUqrf
 TbiH/x88kEs885nLuksstEyQSIBiQBBgsPgRz8ZuMBCq/DYidlNByc6di5dsLiRv55iZ6UmrXUiNB
 XfGcGsbDo1Q+b1ysHk0jB3friv+Fz65+HEHVr7k/aevAyYf0T94UnOxr+Z4wVMgVrZP/i1cDbItre
 Jsx853Vw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVf-00000004Sf0-0DLZ;
 Mon, 31 Mar 2025 20:13:27 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:12:53 +0100
Message-ID: <20250331201256.1057782-154-willy@infradead.org>
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
 Content preview:  Both callers have a folio so pass it in, removing five calls
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/node.c | 16 ++++++++-------- 1 file changed, 8 insertions(+),
 8 deletions(-) 
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
X-Headers-End: 1tzLVq-0003iY-GM
Subject: [f2fs-dev] [PATCH 153/153] f2fs: Convert clear_node_page_dirty() to
 clear_node_folio_dirty()
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

Both callers have a folio so pass it in, removing five calls to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 753ecca6d511..5232e43db779 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -120,14 +120,14 @@ bool f2fs_available_free_memory(struct f2fs_sb_info *sbi, int type)
 	return res;
 }
 
-static void clear_node_page_dirty(struct page *page)
+static void clear_node_folio_dirty(struct folio *folio)
 {
-	if (PageDirty(page)) {
-		f2fs_clear_page_cache_dirty_tag(page_folio(page));
-		clear_page_dirty_for_io(page);
-		dec_page_count(F2FS_P_SB(page), F2FS_DIRTY_NODES);
+	if (folio_test_dirty(folio)) {
+		f2fs_clear_page_cache_dirty_tag(folio);
+		folio_clear_dirty_for_io(folio);
+		dec_page_count(F2FS_F_SB(folio), F2FS_DIRTY_NODES);
 	}
-	ClearPageUptodate(page);
+	folio_clear_uptodate(folio);
 }
 
 static struct folio *get_current_nat_folio(struct f2fs_sb_info *sbi, nid_t nid)
@@ -930,7 +930,7 @@ static int truncate_node(struct dnode_of_data *dn)
 		f2fs_inode_synced(dn->inode);
 	}
 
-	clear_node_page_dirty(&dn->node_folio->page);
+	clear_node_folio_dirty(dn->node_folio);
 	set_sbi_flag(sbi, SBI_IS_DIRTY);
 
 	index = dn->node_folio->index;
@@ -1381,7 +1381,7 @@ struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs)
 		inc_valid_inode_count(sbi);
 	return folio;
 fail:
-	clear_node_page_dirty(&folio->page);
+	clear_node_folio_dirty(folio);
 	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
