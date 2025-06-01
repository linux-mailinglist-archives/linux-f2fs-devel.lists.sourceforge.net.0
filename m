Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0AAC9D6B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  1 Jun 2025 02:27:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4qnrPL5B50OVJwIchSaLlcPmiN9Y42Vp7sjWVM4ToYU=; b=aEzjwOfQe6CoeDpvOcIN65Eo6c
	0TWhBrIAbBnMSTuwbwGRdAGjKZ3qw2A/ABVSLmPRkrVKAJo6J/TPUmcBa7TWYbyQd2BTUOR8AGTe1
	/CCXB9+R06SUSRcXO4KYZiDDc6h0gT6TwEA+GEZsQcBUmASkG1k3t8x8mNtEPTdtRGU0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uLWXv-0007Pt-MH;
	Sun, 01 Jun 2025 00:27:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uLWXu-0007Pn-G9
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Jun 2025 00:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dJ73w8fLMRnc9WwrkETVXIt20fRxZ2OdwHbOXHE1IX8=; b=UIH4vaqEwNY9IBGx3jqnZwPg9K
 /2lINNtuTwij3NqAbg/SP1Ts3AFQSKm8MSVqkemtkVl/rz794qp1Wtjlu+8D4TB+iG/AWpj7OsNie
 2ZVtAcfYcA0M/WTlb7J7zhl05n13X4+RdusYC+xAPIg/ImFZ8bUr5kNd/ZZs/rbOv6Xo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dJ73w8fLMRnc9WwrkETVXIt20fRxZ2OdwHbOXHE1IX8=; b=U
 iIq4pX5gvjxnbENr4FuRefgQ6KiulVs/A5/uD7sAHa6YK0TnZ56x6lh7Z308+Tc94BByKmZO1M/pq
 rqusR60O5XFfnN9K+BuOHDwqCexzj2oPswTsKrzoPzJdiwmlwRDFyBYK6CiDyXw4kcdTJr4cfObdv
 S+BIEd+dvX+3uoXc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uLWXt-0000mI-Um for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Jun 2025 00:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=dJ73w8fLMRnc9WwrkETVXIt20fRxZ2OdwHbOXHE1IX8=; b=ttPlAFWF/PQAuDqGB1ab+Oi6on
 uc1bj1glNlrKuwbDED39eam8A+RST2oOAcW2RX+jKMx6abDzHPjiEFxsqjWWXhOE/sROXV0//kWXN
 LasZSBQdC8HLzP8dZIJuIQruaiNxcFqlebRPycEpNADXdkZASmskhEyvGFrpUJ1PNIaUkKzGvXib5
 E+NMePC6UqtsvlYix8bRkqSS7yTMjaKQzL2UmE9n3y4M1PBxOn7zAC65Ky+Ogg5SL/vkPgfYnWCkI
 JEaM2TTh+rArWIVBCVgqeOyQvJfh3QfuCj0AP3FQ3qp+ySOX1Ck5PhsFWx+Gx6iXnUeJ9UWqCwiYi
 FWkSZ7QA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uLWXi-0000000HB9q-2XDj;
 Sun, 01 Jun 2025 00:27:14 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org
Date: Sun,  1 Jun 2025 01:26:54 +0100
Message-ID: <20250601002709.4094344-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Headers-End: 1uLWXt-0000mI-Um
Subject: [f2fs-dev] [PATCH] f2fs: Fix __write_node_folio() conversion
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This conversion moved the folio_unlock() to inside __write_node_folio(),
but missed one caller so we had a double-unlock on this path.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Reported-by: syzbot+c0dc46208750f063d0e0@syzkaller.appspotmail.com
Fixes: 80f31d2a7e5f (f2fs: return bool from __write_node_folio)
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1cb4cba7f961..bfe104db284e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2078,7 +2078,6 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 
 			if (!__write_node_folio(folio, false, &submitted,
 					wbc, do_balance, io_type, NULL)) {
-				folio_unlock(folio);
 				folio_batch_release(&fbatch);
 				ret = -EIO;
 				goto out;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
