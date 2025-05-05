Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68FAA8FFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 May 2025 11:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pgnIsQhra7Tfqw97verkPNC8QrafxgRdfuGmcfrR9ZA=; b=b57xi4uDMp8KCaPTFaUNGMb+CB
	6fVJia++x9S45gCyi3gQK4ZffZZOzIW9Ua2yWmZFZSsSjLXbTL0yXKmnZr1YzmCZeP7bhVWp7Rc15
	Bh70O06lZldxj9q8wchyXnf1+Y8pnCoYi61wLh4L6i8VhJGd8D5TqKk1eRVyBkMEEM10=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uBsPt-000734-A2;
	Mon, 05 May 2025 09:47:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9b9d72b124a21f5aaaac+7925+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uBsPq-00072x-Fg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 09:47:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XtTvnTyq5mIhVTRdyBLDrwbTGyjJ80hJmgnWbsqgwSc=; b=VD9ZL02aOe5ETZlO1xkxWGPGDa
 kwhPJPLdHJt/NlqPAY2K7dWL16CfDruv+MIbXk1+WpgBlQOiF9LGKHkdlZr2P5/GA4THaGtxmdIfS
 lE26TKUvPBMpT5vo9zMoVk0ubHCfgpd1Irj/DfQbSQGeBFiKN0EKg+R7riFvdEI3nxas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XtTvnTyq5mIhVTRdyBLDrwbTGyjJ80hJmgnWbsqgwSc=; b=EtPRL4DpnBRHe9V8XDeC8UcPpT
 bmooD+jthoPryVRliO8kE+MoYOkLxAfPUS7MCF8ACja6chpatiSRgPqabflJolSkETUcy0bCfYxPk
 FN+K4V4Qn0yMUNQaF5ao2JjOjQKVKLbZnDefU83nyIDHOkz/GRCU8xvAGkjh/R9BV6HE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uBsPZ-0000UO-56 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 09:47:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XtTvnTyq5mIhVTRdyBLDrwbTGyjJ80hJmgnWbsqgwSc=; b=kDWV0f/Ebjc5oyeTodSvEuRgZP
 0RzVOIhsgExqqR2SiMgTqim7LvqW3PbvbOpDxziSyNEZPXvBmpsO68zuU+YwupjSKfdFgwbujQxan
 w0OpdnV3W37wFiu4DyTW81b8AwzhgHZ5f7gC+YtmwBjs8gBK7okvBMWWCNma5/poIsFGmhne/wZki
 3XuwpoJ77jk5Z2TIeOlgTXb5lRwjmseWGn8x5BWwOtiZAn9kWnNXrkFMIYoRyveyu6oPXmyrqBu0R
 9I6WQPYmcyKFPr+NGqAUBsr/g7l832wO3b0XI2J26PTFQTyNceczZ4J3JzXFHKx8BvNZQMPOpM6cC
 DuemWOIA==;
Received: from
 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uBs5k-00000006unv-1e6s; Mon, 05 May 2025 09:26:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon,  5 May 2025 11:26:01 +0200
Message-ID: <20250505092613.3451524-5-hch@lst.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250505092613.3451524-1-hch@lst.de>
References: <20250505092613.3451524-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __write_node_folio can only return 0 or
 AOP_WRITEPAGE_ACTIVATE.
 As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return instead.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/node.c | 27
 ++++++++++++ 1 file changed, 12 insertions(+), 15 deletions(-) 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uBsPZ-0000UO-56
Subject: [f2fs-dev] [PATCH 4/4] f2f2: return bool from __write_node_folio
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__write_node_folio can only return 0 or AOP_WRITEPAGE_ACTIVATE.
As part of phasing out AOP_WRITEPAGE_ACTIVATE, switch to a bool return
instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/node.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b9d9519c3da4..4008e09c3d58 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1651,7 +1651,7 @@ static struct folio *last_fsync_dnode(struct f2fs_sb_info *sbi, nid_t ino)
 	return last_folio;
 }
 
-static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
+static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 				struct writeback_control *wbc, bool do_balance,
 				enum iostat_type io_type, unsigned int *seq_id)
 {
@@ -1681,7 +1681,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		folio_clear_uptodate(folio);
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
@@ -1712,7 +1712,7 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 		dec_page_count(sbi, F2FS_DIRTY_NODES);
 		f2fs_up_read(&sbi->node_write);
 		folio_unlock(folio);
-		return 0;
+		return true;
 	}
 
 	if (__is_valid_data_blkaddr(ni.blk_addr) &&
@@ -1756,11 +1756,12 @@ static int __write_node_folio(struct folio *folio, bool atomic, bool *submitted,
 
 	if (do_balance)
 		f2fs_balance_fs(sbi, false);
-	return 0;
+	return true;
 
 redirty_out:
 	folio_redirty_for_writepage(wbc, folio);
-	return AOP_WRITEPAGE_ACTIVATE;
+	folio_unlock(folio);
+	return false;
 }
 
 int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
@@ -1783,11 +1784,9 @@ int f2fs_move_node_folio(struct folio *node_folio, int gc_type)
 			goto out_page;
 		}
 
-		if (__write_node_folio(node_folio, false, NULL,
-					&wbc, false, FS_GC_NODE_IO, NULL)) {
+		if (!__write_node_folio(node_folio, false, NULL,
+					&wbc, false, FS_GC_NODE_IO, NULL))
 			err = -EAGAIN;
-			folio_unlock(node_folio);
-		}
 		goto release_page;
 	} else {
 		/* set page dirty and write it */
@@ -1882,11 +1881,10 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 			if (!folio_clear_dirty_for_io(folio))
 				goto continue_unlock;
 
-			if (__write_node_folio(folio, atomic &&
+			if (!__write_node_folio(folio, atomic &&
 						folio == last_folio,
 						&submitted, wbc, true,
 						FS_NODE_IO, seq_id)) {
-				folio_unlock(folio);
 				f2fs_folio_put(last_folio, false);
 				ret = -EIO;
 				goto out;
@@ -2090,10 +2088,9 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 			set_fsync_mark(&folio->page, 0);
 			set_dentry_mark(&folio->page, 0);
 
-			ret = __write_node_folio(folio, false, &submitted,
-						wbc, do_balance, io_type, NULL);
-			if (ret)
-				folio_unlock(folio);
+			if (!__write_node_folio(folio, false, &submitted,
+						wbc, do_balance, io_type, NULL))
+				ret = AOP_WRITEPAGE_ACTIVATE;
 			else if (submitted)
 				nwritten++;
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
