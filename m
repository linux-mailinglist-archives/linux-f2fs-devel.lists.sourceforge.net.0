Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38150A76E9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWB-0001Jq-7S;
	Mon, 31 Mar 2025 20:14:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVm-00014c-Gh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=exu0DX3gMwxTwpzAUjNdoszcYjUuGZJncK4yrlRbkUw=; b=hxeNt6Ygl+SSz4LUNwvUGpoZig
 9zJ2geWRW4TA4buBdEqQMbU0N/258V6q56lkWefAEUlHYSuIctN3W8R63apfsb1y1lKGuvKI2ydou
 bN78t1KOE2pkQsfiWaiDZ3atcycli0Tub7EF1xGuZoWq3KhP3QeH982uiJdx/trzv9sI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=exu0DX3gMwxTwpzAUjNdoszcYjUuGZJncK4yrlRbkUw=; b=bCyWAZmb+zEoKJw5B3LPtSJtuo
 +H65lL5jEaNKl6FmNMgJcBCsW+A0LBiHD3JPfw/AXJyQu3CvV9Qd5bjIU6wZzvreuF/ugmt80OTRU
 wddT5ARKqrh0Mj6HTK4WCJ+SJ5p9PJWOz+D0ZWQTyYnrFrwR2XmzAUsQOjAwKPC6mdpU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVc-0003cG-GC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=exu0DX3gMwxTwpzAUjNdoszcYjUuGZJncK4yrlRbkUw=; b=h9UcSw6ta/2ZxlbdDdNV6j7cQ2
 J7KwokD3SdlWV7t+ExTBshYhu4lw+ARTCVaFb57Vku5rBHh5gZjZPuqLsajxLiPjygYAgwwE0oWXS
 lERqo+w6iygTZK7GKkLH40puK9aFCjy5PTL84Vg8KE3z8VAcComQLe07/+SW3ZT9ObCdC9gzskCoM
 I3Ce8mqPxnzVGhPXWHCv/1fUtYXGGFDwNbyTFPde+OvC8+rsV38IcoBohxXW7Wq+sjBp62AKfOOvS
 BAFEThUc9jnw1es/gtH7S4dyox25ICyE6KPAZBkdFCbZ1cROBCKNWgFo8IjbsM34tY0xa/V3Xn7wb
 IIlpuocQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVR-00000004Rxf-0Twd;
 Mon, 31 Mar 2025 20:13:13 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:38 +0100
Message-ID: <20250331201256.1057782-79-willy@infradead.org>
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
 Content preview:  Removes a call to compound_head(). Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-) diff --git a/fs/f2fs/node.c
 b/fs/f2fs/node.c index e29828c2f7b5..5df3065c18ea 100644 --- a/fs/f2fs/node.c
 +++ b/fs/f2fs/node.c @@ -623, 9 +623,
 9 @@ int f2fs_get_node_info(struct f2fs_sb_info
 *sbi, nid_ [...] 
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
X-Headers-End: 1tzLVc-0003cG-GC
Subject: [f2fs-dev] [PATCH 078/153] f2fs: Pass a folio to
 f2fs_ra_node_pages()
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

Removes a call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e29828c2f7b5..5df3065c18ea 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -623,9 +623,9 @@ int f2fs_get_node_info(struct f2fs_sb_info *sbi, nid_t nid,
 /*
  * readahead MAX_RA_NODE number of node pages.
  */
-static void f2fs_ra_node_pages(struct page *parent, int start, int n)
+static void f2fs_ra_node_pages(struct folio *parent, int start, int n)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
+	struct f2fs_sb_info *sbi = F2FS_F_SB(parent);
 	struct blk_plug plug;
 	int i, end;
 	nid_t nid;
@@ -636,7 +636,7 @@ static void f2fs_ra_node_pages(struct page *parent, int start, int n)
 	end = start + n;
 	end = min(end, (int)NIDS_PER_BLOCK);
 	for (i = start; i < end; i++) {
-		nid = get_nid(parent, i, false);
+		nid = get_nid(&parent->page, i, false);
 		f2fs_ra_node_page(sbi, nid);
 	}
 
@@ -1005,7 +1005,7 @@ static int truncate_nodes(struct dnode_of_data *dn, unsigned int nofs,
 		return PTR_ERR(folio);
 	}
 
-	f2fs_ra_node_pages(&folio->page, ofs, NIDS_PER_BLOCK);
+	f2fs_ra_node_pages(folio, ofs, NIDS_PER_BLOCK);
 
 	rn = F2FS_NODE(&folio->page);
 	if (depth < 3) {
@@ -1086,7 +1086,7 @@ static int truncate_partial_nodes(struct dnode_of_data *dn,
 		nid[i + 1] = get_nid(&folios[i]->page, offset[i + 1], false);
 	}
 
-	f2fs_ra_node_pages(&folios[idx]->page, offset[idx + 1], NIDS_PER_BLOCK);
+	f2fs_ra_node_pages(folios[idx], offset[idx + 1], NIDS_PER_BLOCK);
 
 	/* free direct nodes linked to a partial indirect node */
 	for (i = offset[idx + 1]; i < NIDS_PER_BLOCK; i++) {
@@ -1505,7 +1505,7 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	}
 
 	if (parent)
-		f2fs_ra_node_pages(&parent->page, start + 1, MAX_RA_NODE);
+		f2fs_ra_node_pages(parent, start + 1, MAX_RA_NODE);
 
 	folio_lock(folio);
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
