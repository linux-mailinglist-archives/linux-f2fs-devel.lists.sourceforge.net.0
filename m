Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FBC07799
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Oct 2025 19:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DVDERAEBusMzrf942wPUQUTcKmGYQd+revp9Ovivfwg=; b=Bx8maS3DTtRkq5nHNTkQPw1mQX
	1pC4Hm4K1gl9pFgGSVwo4DGGNMB7QCJd80NbIf7z18zeEY4Q3jgTj8lz3PeyBpbtyQvzavXFZsfrz
	p7xZlW6fp7h1A2lc+hkmZieMXwc1j1jt/xWhQJU/lpqGeE5GrBti7pW0fZN/F02pk1NI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCLHJ-00043m-S2;
	Fri, 24 Oct 2025 17:08:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1vCLHH-00043g-QB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 17:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+8hZqJctSF26P38xr9kbPElhutn46n+QzGOEa8OjEo0=; b=LqqjDNK/7s+ibbfQQbFA8usaEd
 JNAAXdPRrJ/48A81empPJ5nfVUZrCkqE2emhqAXl8KtmWDrVVi/eKscGGkxa0J9fs2VVcDu2FvV8b
 Afyg5Y1DtjPuqfr69wIkS+++g6QUa6M8tH/B/GaxDq4nvNlIKU/AVlrZT+YtbRUie258=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+8hZqJctSF26P38xr9kbPElhutn46n+QzGOEa8OjEo0=; b=TBPzPOIMpXh+FqSi7vHQINmM25
 hxsTw+u9XsGHrYU5bxBT+t7AADdrYWDsFslkjg8Ng9A1SmQ6+Zkh2H6QlhfPanbMIt7IVDws8dKtH
 ilOt8bSg4A5eOKnySRz1FxzQ4KukG/6p9tv2QEiYjJylMUrn9IhAdcjx1qdofcwVvthI=;
Received: from [90.155.50.34] (helo=casper.infradead.org)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vCLHG-0003rT-OU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 17:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+8hZqJctSF26P38xr9kbPElhutn46n+QzGOEa8OjEo0=; b=JTVy/EQeEPKaB2OWVNfWy1LLO/
 2YvL7yNm0p8x+sSdxFvYAOCbfDfica7QiNPYIoZ2SgBTyrLuf+iG1qrvgwqGnHMqj2SnVw38zaKcG
 xP2B/17suVGU2eoWQ5pomRvDUuQAkSgjI282sqwxeima5a/tRegASeR8LU2GOpL6cq1aNGdYerDuQ
 bcM0h87PeF2mYEgluehwO8axZfr1DxT9iDxGNQehyDRgGL67W1yH19jok96K1I0/tcuH0eweZpRxz
 gLiH6ZLvvXK2I5+NTeq3r6D3smRxiG0lVcAU6/1whfFVtFVJQ2lVl/GY3K4C6hMDkOVLZAM8dT7vj
 B25M1gxw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vCLH7-00000005zLP-0eAf;
 Fri, 24 Oct 2025 17:08:25 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Date: Fri, 24 Oct 2025 18:08:13 +0100
Message-ID: <20251024170822.1427218-6-willy@infradead.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251024170822.1427218-1-willy@infradead.org>
References: <20251024170822.1427218-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is one instruction more efficient than open-coding
 folio_pos()
 + folio_size(). It's the equivalent of (x + y) << z rather than x << z +
 y << z. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> Cc:
 Jaegeuk
 Kim <jaegeuk@kernel.org> Cc: Chao Yu <chao@kernel.org> Cc:
 linux-f2fs-devel@lists.sourceforge.net
 --- fs/f2fs/compress.c | 2 +- [...] 
 Content analysis details:   (1.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1vCLHG-0003rT-OU
Subject: [f2fs-dev] [PATCH 05/10] f2fs: Use folio_next_pos()
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is one instruction more efficient than open-coding folio_pos() +
folio_size().  It's the equivalent of (x + y) << z rather than
x << z + y << z.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/compress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6ad8d3bc6df7..be53e06caf3d 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1329,7 +1329,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	}
 
 	folio = page_folio(cc->rpages[last_index]);
-	psize = folio_pos(folio) + folio_size(folio);
+	psize = folio_next_pos(folio);
 
 	err = f2fs_get_node_info(fio.sbi, dn.nid, &ni, false);
 	if (err)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
