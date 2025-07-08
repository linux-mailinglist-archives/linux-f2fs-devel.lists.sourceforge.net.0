Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2144AAFD468
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hOvNokoDYZnKba3MHS4dctV7vA6OoW/FnwCVzFSN2Q=; b=goCfq9pRhUhXIOva8bKIVhCGkK
	JOf1czKhwhZJNEQFE9FZyZ49PcudDBHRBH5NvOtwDJxdXocJNfepieuGeF/w2Nr4sPdpCBg4dZQ1/
	1y9EBMzmEHXORhJJ9Jhqsspebpy8Su3Ddcou708d23uYxM9RXixB8VaxSeMPxagWmgHU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBky-0005lH-O3;
	Tue, 08 Jul 2025 17:05:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0005WR-Lb
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yy3lWcPBxzPVxs5OAMkD0ZG1kDwjS6i89gbNSQbEZA0=; b=HG9+46uky9ghx43fRFH897DdVL
 X9sySnDg/FZanC2XffiZs1r4yEUBopCXvhE/FOQ+H55Qq1my0Zk6pIuk6kAYFNikNJkNyNT4OR68b
 BXXNPS1eHO/4yVEzejvRx5IxL1TW74hhhfm3sYWLieEcikWXkoERH4NOWOvPeVdj6fDw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yy3lWcPBxzPVxs5OAMkD0ZG1kDwjS6i89gbNSQbEZA0=; b=Ap7yuNsIZXnbgXJ5rkDyEp1Nut
 PyuZ7pVhHlTn90EcYxoLImwhgIWiu6769a1TdA9dlTiG8BVCRzoK/fojzo8hPqzdUn/UkoFcp1gwx
 ubLgcZWGsH5tQAnmdkOX9Ptro3L+pvxD/jRxoMnO+Hj0DE8d4H4daFoWGfkO6ZxtOVoA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjt-0006FL-Bp for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Yy3lWcPBxzPVxs5OAMkD0ZG1kDwjS6i89gbNSQbEZA0=; b=Sjfq6F+Xa4IEDGcmVjVZstUYiR
 Tcy/Px33/BLUSHoNvFtOqWoNGzym/G597IVM2/6poAbyCGtKwp60ARLOaVY6EnRPTONjlaWfi6xun
 RehNwMh5tLj/Zoe0d/KBOi6UZss5/gQYNAXZ/tZ917AiTH8vZDKbwiIDVjKK/XSmo9HwCnjU0Dv9/
 6f8Wlprvl4MA0ZoLbEYlII8MWHPoUUNTLnCJnPcvQCFuBNgqoPhoaQSvxMCqBrYSDj2g4G5KbkDIX
 4AevejwJCH8u2xwP9SLwpNUZATYROv6z05MGJD7DRHTuhyt4CvZjSH/h/o0XoutBcQnsX6YBhsris
 rlZKVDlA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjh-00000000T6C-3Dtw;
 Tue, 08 Jul 2025 17:04:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:27 +0100
Message-ID: <20250708170359.111653-31-willy@infradead.org>
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
 Content preview: Remove a call to compound_head() by replacing a call to
 unlock_page()
 with a call to folio_unlock(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/compress.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
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
X-Headers-End: 1uZBjt-0006FL-Bp
Subject: [f2fs-dev] [PATCH 30/60] f2fs: Use folio_unlock() in
 f2fs_write_compressed_pages()
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

Remove a call to compound_head() by replacing a call to unlock_page()
with a call to folio_unlock().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 8cbb8038bc72..5be1a4396f80 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1419,7 +1419,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		(*submitted)++;
 unlock_continue:
 		inode_dec_dirty_pages(cc->inode);
-		unlock_page(fio.page);
+		folio_unlock(fio.folio);
 	}
 
 	if (fio.compr_blocks)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
