Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C33D2B6B3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 05:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fmBFqM//QMi6yDenJu1iNZdB6Qu1YtZmg9S1i/0Foko=; b=YszFeRtGhduLOZoKMkCgxBC3uq
	ulzvFCtftYcRFV6VkughwBNENfgzx8jrT5juCwEURT/rB6FJ9z0BGR375ytb6MKHC5IrGfC1oRyeR
	deOXi9igfizw/rhgfhiMkxhUCRCPED/JP1r2Eh5rWhZvCdPC/j/89iyIFV2n7OJuiXZs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgbVN-00053k-RM;
	Fri, 16 Jan 2026 04:32:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vgbVM-00053Y-Q8
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxK/1iyTVF1W8PgnrOe+aQsOcgNnTIe+UV3QNteX52A=; b=QvD2SVnd1d64Pkt68JK5Vh5mF5
 7+mx1UXN+5axF+uFGMUzC5DKtuP00DTJAunWbkXe1wVMJzGB1+y5VdXsy8ZLlKxKvJm9J0McdnEz0
 +5gtdTHDB/Ck20K7sCJk/Nb/DAz6nlaAlD8fyG7bzFsPcCJKNGaGvrKiu6z8An7v1XYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mxK/1iyTVF1W8PgnrOe+aQsOcgNnTIe+UV3QNteX52A=; b=l
 t48JljaCCSoNmn+zXeaNtxJiU4m0BtzaUUFwh6QOJaW520hwfXg0Qw7sVuPr/dEkupXCCxMb9LoOT
 l1H0+kE6e2uZB6ZkloScex0yiz+JvFwuY2TkCtB1FmCFKrN3NxgeYx789ZIG3nlcGYRMJDUDXQ4KY
 FZveq0YVfKkDLWYI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgbVM-0003mT-BC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:32:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8512C60160;
 Fri, 16 Jan 2026 04:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A803C16AAE;
 Fri, 16 Jan 2026 04:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768537926;
 bh=5TUAal/SQPcowwCxO4SkeQZZYh2cbQ1JYWbyKQ3FR14=;
 h=From:To:Cc:Subject:Date:From;
 b=dFZ9fsszekNXTOQHinuM4CkBsB7T8ooxqcH3/H/HNAYxb1Gg+U7IGFGlLsxGA3Y9f
 oirj2V8hqLSBsjT3EyfAPwh1S+7d0+M0j8LmQTTu4n1V4M+GLNmYUDdu+apTxTjrtr
 MDOJxJX2x3KbKUy+7BcPfM1K68tRYvfHo9hVyFrdPxg2Z3gxB1id7xDTyOnKYJjwWI
 huSi0zhbzTZphawM04R/NAJXuNz9mGhHk4tJ3t9BV4ApWoOJ280FhtEGK3lhX7t4nD
 nMM1ZlzJUaPG3zQ5C2RrlkRrl3Yhr54mWbWxGywz8s2rXEcM0Luk3vxTbVwgd4g5xu
 6yQ+UelpScLcQ==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Jan 2026 04:32:02 +0000
Message-ID: <20260116043203.2313943-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: No logic change. Suggested-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/data.c | 10
 +++------- 1 file changed, 3 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgbVM-0003mT-BC
Subject: [f2fs-dev] [PATCH] f2fs: use folio_end_read
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

No logic change.

Suggested-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e2f10bd2b07..5b4832956196 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2566,19 +2566,15 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	}
 	trace_f2fs_read_folio(folio, DATA);
 	if (rac) {
-		if (!folio_in_bio) {
-			folio_mark_uptodate(folio);
-			folio_unlock(folio);
-		}
+		if (!folio_in_bio)
+			folio_end_read(folio, true);
 		folio = readahead_folio(rac);
 		goto next_folio;
 	}
 err_out:
 	/* Nothing was submitted. */
 	if (!bio) {
-		if (!ret)
-			folio_mark_uptodate(folio);
-		folio_unlock(folio);
+		folio_end_read(folio, !ret);
 		return ret;
 	}
 
-- 
2.52.0.457.g6b5491de43-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
