Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCEBA3930F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWn-0000J4-Ga;
	Tue, 18 Feb 2025 05:52:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0000IQ-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7OWCqEQSuyW3YDJH4zlFbHrnNTVKwf50bge0kn69gbA=; b=C4Bvqp5jK6LttUVd4XAzubPjre
 7cWiZg7ez+vFZWXzVWh3r/R9K3fQnuf3g5gAzUz78dy2NCPN6v6sYtXgq9I+rynEiUU/pyBUz3NH6
 9SLWWe25nifyw/An6q3Sy+zpKpWBmNHwR6LYecFU0J2K8Kv+lzyPEGsAjNOJoCg+rj+0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7OWCqEQSuyW3YDJH4zlFbHrnNTVKwf50bge0kn69gbA=; b=WYKvvyHsB/IAUxgPpCavTRxqvu
 /WkTugUPVUTLF5xLsrnKJ/l0acZqWJcd6W3YLXZQvZNBMwryU6TY1WZsq0KRUo4Kvy6BYqMiu0gr1
 DSrwmo0Oa1pznYGG4h6XGc3UyCylBXBgj6lAZDO4qwu7o/BsKEwfFBUatGT4foeg1Wqk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWl-0007bn-AV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7OWCqEQSuyW3YDJH4zlFbHrnNTVKwf50bge0kn69gbA=; b=UE29ImrUER/K1iaAUcim3GyRZV
 RHPVNjrcNdCWjod5wi/ZCG5TvP5uNBu6cXISITlHBRO2HAy9Da3T2tpWKPEGbJIP4lMlUtYg5HSlp
 e3N6ZIs3PDDup+Myl7DOHjSxRcbpbAfrauMmMHo32Vn7uqqm4gn3qUCVxJzGE5WuI/qe1B6c1zojg
 AFvuhzGa0xsdXPeO0lSYok0MmCVoW7ydYc9kdRddzeEfEURIgvEcCXSaHSBoNzvB1KuFGAxmp4VeY
 czD9LgTZxlqaF/pcgfigcdukF2o5fUjCCz7Ld2VTWceXhi2Eh9PZdYG72WM+ZKqkPRH4i8sh7jZn0
 3vHNh99Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWf-00000002Ttl-08jb; Tue, 18 Feb 2025 05:52:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:59 +0000
Message-ID: <20250218055203.591403-26-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use f2fs_get_read_data_folio() instead of
 f2fs_get_read_data_page().
 Saves a hidden call to compound_head() in f2fs_put_page(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/gc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-) 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWl-0007bn-AV
Subject: [f2fs-dev] [PATCH 25/27] f2fs: Convert gc_data_segment() to use a
 folio
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use f2fs_get_read_data_folio() instead of f2fs_get_read_data_page().
Saves a hidden call to compound_head() in f2fs_put_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/gc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index d0fffa2bd9f0..2b8f9239bede 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1542,7 +1542,6 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	entry = sum;
 
 	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
-		struct page *data_page;
 		struct inode *inode;
 		struct node_info dni; /* dnode info for the data */
 		unsigned int ofs_in_node, nofs;
@@ -1585,6 +1584,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		ofs_in_node = le16_to_cpu(entry->ofs_in_node);
 
 		if (phase == 3) {
+			struct folio *data_folio;
 			int err;
 
 			inode = f2fs_iget(sb, dni.ino);
@@ -1635,15 +1635,15 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				continue;
 			}
 
-			data_page = f2fs_get_read_data_page(inode, start_bidx,
+			data_folio = f2fs_get_read_data_folio(inode, start_bidx,
 							REQ_RAHEAD, true, NULL);
 			f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
-			if (IS_ERR(data_page)) {
+			if (IS_ERR(data_folio)) {
 				iput(inode);
 				continue;
 			}
 
-			f2fs_put_page(data_page, 0);
+			f2fs_folio_put(data_folio, false);
 			add_gc_inode(gc_list, inode);
 			continue;
 		}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
