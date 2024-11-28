Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB219DB27D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:20:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWxK-00087N-Vf;
	Thu, 28 Nov 2024 05:20:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWxJ-000875-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYR6uma4kwJlUKiQp0bjygTL3evPp9bgyV5eBjOdN58=; b=RzYiYlu3LfoniP6X81WvNDA1Y1
 4xWg8zo2kfAcNXeaNZfkA/G7RXFUKnBXjabptGEwhiE6F5+vN74960J6fqoDkL4mRMgbc0OZBaJbx
 /+u64RGTDHQ6ffqSx5k86vFeI23CRlyqpgJmsEhOvvyPPk2ZWab7f93KYVb/obmSmZqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYR6uma4kwJlUKiQp0bjygTL3evPp9bgyV5eBjOdN58=; b=fjDd+pKuUTLPDJk8N+VBwYKO0y
 J0uYncZbWE5D+Bt+BbQPr0stuxvCl+yL72rzKc1OtLJZxk9cKYAAppM20Tru2MqWf3I3e05/nnCW2
 R9vnPMi0MO+mVGrh0GrrSs1f+bjhIlU7j1FtSprrwUY+bAFYX45O43j0Y3bpyVBEWE78=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWxI-0004lm-Dn for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=FYR6uma4kwJlUKiQp0bjygTL3evPp9bgyV5eBjOdN58=; b=MTy0ThX8PJ/KoBEdjaKb/PaWpv
 HAXst2rDkuqMIOZG0JZ4aHN8jTa9z8ee4aqsliHsb82m711xhBDOFViCrBAxXYMwYe7/64tb8UMda
 GRt1q5CusYbygjUEPi/dbPNaXEVMXpNEy1gG/TvYAA25ZCtq44KJpyzCe9vHjYTbHZbL4a1mCMi/W
 QYOvpjc1hSLxjIDOYhUBEVSgLR0ZYiPXncW0Qzi6qrDbIXJgybXcvm2p/fV/3L2JHRRVmboS0qywD
 wU5zLIYq7GKpReCIsO+By4Rs8iQw49uw4h8in3xZjDh2IvYrroGDdHXMQjhmSShpsu/HUZOTHZcIv
 /EHRcc+A==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbq-00000002DFz-44U0; Thu, 28 Nov 2024 04:58:35 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:22 +0000
Message-ID: <20241128045828.527559-8-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use bio_for_each_folio_all() to iterate over each folio in
 the bio. This lets us use folio_end_read() which saves an atomic operation
 and memory barrier compared to marking the folio uptodate and unlo [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWxI-0004lm-Dn
Subject: [f2fs-dev] [PATCH 07/11] f2fs: Convert f2fs_finish_read_bio() to
 use folios
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

Use bio_for_each_folio_all() to iterate over each folio in the bio.
This lets us use folio_end_read() which saves an atomic operation and
memory barrier compared to marking the folio uptodate and unlocking
it as two separate operations.  This also removes a few hidden calls
to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7cb2272c723e..aa08ab387e58 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -136,27 +136,22 @@ struct bio_post_read_ctx {
  */
 static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
 {
-	struct bio_vec *bv;
-	struct bvec_iter_all iter_all;
+	struct folio_iter fi;
 	struct bio_post_read_ctx *ctx = bio->bi_private;
 
-	bio_for_each_segment_all(bv, bio, iter_all) {
-		struct page *page = bv->bv_page;
+	bio_for_each_folio_all(fi, bio) {
+		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(page)) {
+		if (f2fs_is_compressed_page(&folio->page)) {
 			if (ctx && !ctx->decompression_attempted)
-				f2fs_end_read_compressed_page(page, true, 0,
+				f2fs_end_read_compressed_page(&folio->page, true, 0,
 							in_task);
-			f2fs_put_page_dic(page, in_task);
+			f2fs_put_page_dic(&folio->page, in_task);
 			continue;
 		}
 
-		if (bio->bi_status)
-			ClearPageUptodate(page);
-		else
-			SetPageUptodate(page);
-		dec_page_count(F2FS_P_SB(page), __read_io_type(page));
-		unlock_page(page);
+		dec_page_count(F2FS_F_SB(folio), __read_io_type(&folio->page));
+		folio_end_read(folio, bio->bi_status == 0);
 	}
 
 	if (ctx)
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
