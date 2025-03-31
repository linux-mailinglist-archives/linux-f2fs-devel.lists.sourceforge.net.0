Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE12A76E51
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVn-0005iL-O4;
	Mon, 31 Mar 2025 20:13:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVd-0005b5-7n
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ypPI3Dgyg5kYQr4x0mgtv71TfL6vWr6j0MLQRbex0Dw=; b=WHrOM0olM6g0PDILNDIhPAWIWq
 qwoW+FABoJtKJSaCkYIXWnqL2HqM7DImSVzhB2DWk/F8ZkLzzd7sDJHpDh/SBBISGksZb9cTua6D0
 veyOBHGZnyiWvS2jUkX1dFBqaL5J7+Y/GMrql7dCaUavpPeUNTIb2SHq0LurloPC+QlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ypPI3Dgyg5kYQr4x0mgtv71TfL6vWr6j0MLQRbex0Dw=; b=ZzIbiUcGoYMheAJ39/h3dsVSUW
 t0HGv2yPZdG7gVBrOjdDCoSCmrwl4X8hELkwveFcTAqLLS4KJvevdyLzqguZi477TP0HPivT6yoaP
 DU5hjtE2OCYNUyJAMlvS6BkmT1CN/VT/bQE5C+5NUfeS3cwWEXb8Zn1i0SLes4hobHR8=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Ym-PK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ypPI3Dgyg5kYQr4x0mgtv71TfL6vWr6j0MLQRbex0Dw=; b=odWDm1RMegjmjHyvEH7Umiuedp
 QFidp2FvU9XO4q/9KnwZ/cplsX/gVOINpdUpePiTa3hNH7k2jY3TvRigSi3gWdCcJC08jfObossbn
 vCRPvlH3bwdY9RHHEEvKDlL6wfQESbhCQ6M7vRdK51S+BA2HmFCt4srZ7+DhWt7UQbM5PUths5+nk
 RqADZKhlnGk+F4Q0otlFOthWoTfv0QRPqLWxjx8cNkeWGG9qIaMkH5HDruGGMuRGdo16gvNaUiANQ
 weWID4+aFPrLqmirvaIo20/EM1+K72qr4bc1qcSnRR1aVkOP7sVarmLoWRnHLN6w3M/zOqNTgzUjH
 kcJp6BWQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVL-00000004RfP-1583;
 Mon, 31 Mar 2025 20:13:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:03 +0100
Message-ID: <20250331201256.1057782-44-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All callers have now been converted to call
 f2fs_get_sum_folio()
 instead. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/f2fs.h | 6 ------ 1 file changed,
 6 deletions(-) diff --git a/fs/f2fs/f2fs.h
 b/fs/f2fs/f2fs.h index 55a161d39e4a..b6ca1e5a721e 100644 --- a/fs/f2fs/f2fs.h
 +++ b/fs/f2fs/f2fs.h @@ -3863, 12 +3863,
 6 @@ static inline struct inode *fio_inode(struct f2fs_ [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVR-0003Ym-PK
Subject: [f2fs-dev] [PATCH 043/153] f2fs: Remove f2fs_get_sum_page()
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

All callers have now been converted to call f2fs_get_sum_folio()
instead.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 55a161d39e4a..b6ca1e5a721e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3863,12 +3863,6 @@ static inline struct inode *fio_inode(struct f2fs_io_info *fio)
 	return page_folio(fio->page)->mapping->host;
 }
 
-static inline
-struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
-{
-	return &f2fs_get_sum_folio(sbi, segno)->page;
-}
-
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
 #define MAX_FRAGMENT_SIZE	512
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
