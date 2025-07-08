Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE71BAFD46A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rv0QIRjff7V+pbQULDRTeWfx3NgfXc+CYO39GIaKf/k=; b=QPCPWAYgMLX+QB3ePiFzV/qywc
	T7NoRZIWcZVSRc0jGxT2sv5yI90VNsSii/I8QjXbMa6gQbG1qJpTJWDFompw7ID0LAZmvUYvq0Kwt
	zVAayh69mJRhsaT3VnbveXktmm2YXCpOkXZou2YTXLD+Yan7nUenqrS4rvHhoeENKgnY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBkz-0005mA-KH;
	Tue, 08 Jul 2025 17:05:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjy-0005X6-4I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UtdQKp3KPv5DtVrtenTFsPDTQ/3FUnzoQRxI/3fCb8I=; b=NnQqvIlTU9rv/pbFda+lXfggzZ
 pLtaBQSmaL0zUX1Nbk5JUD4ALU6p5z3b4MARPBaaiKUDz1K8quQzfjFywyzwKHiB25lahWY6xwrSS
 L7aICpWgH9Ha9gCxzFSjxuE6KEd7BzdDYV7d50eMHNVRBeaT60xkaglF+MyOv2ZQ94Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UtdQKp3KPv5DtVrtenTFsPDTQ/3FUnzoQRxI/3fCb8I=; b=VdIOV6TGPK4LTd13auP841gu4r
 7CgaZivfW0BausgaHja5uciwUDR9tjt79GfAjUCyA9lpbpMFWi7lcyFnZsLC/QF6ZkBs+wTUx1e4q
 vd0TMbF8ehG6hwHZzbogaML2SBJ9i+5GbhsAU+IHLm987GbRfevdBiInuX3VT9BFpVhM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjv-0006GS-Lw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UtdQKp3KPv5DtVrtenTFsPDTQ/3FUnzoQRxI/3fCb8I=; b=tAQbO+QopMK2dAwi841dE8Xnsp
 vA0NSCInaPWdUmfmEcWWKzAVnXSgKEJf908CysWHMNtSfkjEoLbul8fkKcyE+sSXmiI94ug/URsAO
 DrVR5TPstTHBL7co9dknE2ra5pKFtMbrCCSlOb+bKmPa9QdfMlMx4PCalZJt17yzK4jNGvFXdiLkq
 EVip1w8t7TIY0+UPqEq1vdTceAg3jaHYQbdymbptlhAovNP1VB0bRUKo6nCsJ6av/dAUTZr7dYK6G
 wTytBXdqZoX9DmoZJDL2jhBwfpO3pzOaK76nqSn7BQQYVhjEIJceCbh8cWPblunqswP50CMsgiUUl
 eUM9wt7Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T80-0QiE;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:43 +0100
Message-ID: <20250708170359.111653-47-willy@infradead.org>
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
 Content preview: Change from bio_for_each_segment_all() to
 bio_for_each_folio_all()
 to iterate over each folio instead of each page. Signed-off-by: Matthew Wilcox
 (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 11 +++++------ 1 file
 changed, 5 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1uZBjv-0006GS-Lw
Subject: [f2fs-dev] [PATCH 46/60] f2fs: Use a folio iterator in
 f2fs_handle_step_decompress()
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

Change from bio_for_each_segment_all() to bio_for_each_folio_all()
to iterate over each folio instead of each page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 067270f9486b..a3f231d47bdd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -233,16 +233,15 @@ static void f2fs_verify_and_finish_bio(struct bio *bio, bool in_task)
 static void f2fs_handle_step_decompress(struct bio_post_read_ctx *ctx,
 		bool in_task)
 {
-	struct bio_vec *bv;
-	struct bvec_iter_all iter_all;
+	struct folio_iter fi;
 	bool all_compressed = true;
 	block_t blkaddr = ctx->fs_blkaddr;
 
-	bio_for_each_segment_all(bv, ctx->bio, iter_all) {
-		struct page *page = bv->bv_page;
+	bio_for_each_folio_all(fi, ctx->bio) {
+		struct folio *folio = fi.folio;
 
-		if (f2fs_is_compressed_page(page))
-			f2fs_end_read_compressed_page(page, false, blkaddr,
+		if (f2fs_is_compressed_page(&folio->page))
+			f2fs_end_read_compressed_page(&folio->page, false, blkaddr,
 						      in_task);
 		else
 			all_compressed = false;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
