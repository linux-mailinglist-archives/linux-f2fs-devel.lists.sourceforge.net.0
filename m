Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9E0AFD466
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBAbJ1DXrYTlQuub3f0bj81RTw6q9ig5t7s/3Q+JMuE=; b=KKmxmWlig4+LdgWo8nl7ypPjT7
	t/Mj2T6lHRemvAtm7/TsxQlektZdwfFzkjzdKVUaN/wbxZaHUubUTAqNwnMmIQRi3TakPqaQBo2tH
	N25+WwZNNLyE6D9MQdPyNRoeIMeR3Cj6nxQZkWtBKHP9iXYiGE9leGI3sGxEJddnvPzo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBky-0005l3-Cv;
	Tue, 08 Jul 2025 17:05:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjw-0005Wj-EK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tg8flFG/R7mPcJG61rsjZ0as2UhBiSO5iyIUWySHP6M=; b=nL1wcxoNjqSmE3vffJytEGd8mK
 EQ2a8d42YTumt7XV7xy9ESGOBYDT7cSnkBgIGMmw6e+E45m+/8dVwSJ+q0TsaljShD25UUIuSHiv6
 ZjYtFcZyrlZsAp4pvdXzXQ0B+r5Gadre0O9kQUnl2iPD6mmuv6ihPz3Q1D3cf6cCV9do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tg8flFG/R7mPcJG61rsjZ0as2UhBiSO5iyIUWySHP6M=; b=ebTyLGG1Q6ZoO2IwM5lezSmEGP
 nF0VcnnyA23BKuLMRWMduuAeBP4ebeCcdsZzP9o+hfV8KVBf/DJxPtJ60SRik/+ZkpyYoD2ugprIu
 OBtbZ4VG3DeeDMwAfJ7uhXYpFB2wOy2Q88unipMFdxlUx2EqyV0n7MHW49124mhepIsQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjv-0006Gd-Sx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Tg8flFG/R7mPcJG61rsjZ0as2UhBiSO5iyIUWySHP6M=; b=U5jp7kF3efevELQiIOJAEfjl9Z
 ihfnJmATH95lyjX3og5/45IVEwidQE8j4jzYxLR5s1QuERwg/mAoZXrQ6IY3r8Jbw3gjNEefqHBy+
 r3Fj3OQQqn7STOU0+9npXKk3IEeCfTqhTx3yoarkH2dH9s6MReiCbMZ73Q40DGQPCvPp651Y8oIOw
 IEalKwVcgxEMfipFHxlOWtx8eKiGIaVEOUZCskRs9rh8FWZkEr5iWjWnDdC32DC9QH2Pt9YTotPS+
 T7CxCpTbN+gtbqmlIpzagNXV6Xu+Q6tdl00QQ0JHg0FLRkW2J0tIr/akZoKiJm+/U/Me9Dw69adhs
 mv6u4rIQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T8C-1bYB;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:45 +0100
Message-ID: <20250708170359.111653-49-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZBjv-0006Gd-Sx
Subject: [f2fs-dev] [PATCH 48/60] f2fs: Use a folio iterator in
 f2fs_verify_bio()
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
index ccf410ef9b70..cf2c146944bf 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -181,14 +181,13 @@ static void f2fs_verify_bio(struct work_struct *work)
 	 * as those were handled separately by f2fs_end_read_compressed_page().
 	 */
 	if (may_have_compressed_pages) {
-		struct bio_vec *bv;
-		struct bvec_iter_all iter_all;
+		struct folio_iter fi;
 
-		bio_for_each_segment_all(bv, bio, iter_all) {
-			struct page *page = bv->bv_page;
+		bio_for_each_folio_all(fi, bio) {
+			struct folio *folio = fi.folio;
 
-			if (!f2fs_is_compressed_page(page) &&
-			    !fsverity_verify_page(page)) {
+			if (!f2fs_is_compressed_page(&folio->page) &&
+			    !fsverity_verify_page(&folio->page)) {
 				bio->bi_status = BLK_STS_IOERR;
 				break;
 			}
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
