Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A201FAFD43B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lPcXC72Ge8bNDJGSvgkn5YnWSizf7D0oDTGEvUcPR10=; b=CKiXJ1p9NdwcC07mlAQGJjILNI
	AgVBpk+gTVDqsG9yiU6V1HjNbNdT4kJFHuOU9ARk1usmPDFe83SQdqxckQshkA99k6Hj7Kv5yiu4g
	Vi4g2BL7CylIctMXR6iNSVxIu90Psxukcur2pDnLKyzYLN3vvVN9k6FSWeIfLs+tPBOY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjx-0007NL-FW;
	Tue, 08 Jul 2025 17:04:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBju-0007LK-7w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RoX0fYw/HWHK5vMG2ttGSrxBsZqpXeYqFk0TXTZWKz8=; b=FGCw3GeYx9VI8omPOHsxJay8SU
 6BIOro9nQhvYusT6RhbUxW8xyxPVqvPrb9icXEk+D/cLmRmbw81sj4sRAecihaYSCdI+FaJ4TkcmW
 XoqzrHtca2idHn0URBT58xlITo+/5Jf16N0zA8TZzeddZw1haFP5r0gwj9zTqF3TA1h8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RoX0fYw/HWHK5vMG2ttGSrxBsZqpXeYqFk0TXTZWKz8=; b=HmcLH1q/alkRFTeNxkfafqr5Zo
 tc9BGMLhefryYNYudRARQTWi7B5YuS1o+Nh0ByTxTRuBClbKyhQM7fPwKSPN/CPqcaKv/mCToXZ2e
 yCw+rTeeOyq4CbMXRWFtW35e0Gmd1YrZ7qIsOrlBbPkmcT6uAkeAqI/DVr7vGhM01/Rg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006Ex-St for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=RoX0fYw/HWHK5vMG2ttGSrxBsZqpXeYqFk0TXTZWKz8=; b=N8576PcoslpB02/gpqw3DBhi7Q
 gqpunRYS/6i9Il+xRwb73qBa6V9pQ02XT0l0McUdmaDGr76Ctke6qALK29kOAyNqLB8ErabhAaLtV
 MWATu5vx40qAU0tiYAklHYsEYZ/LABoVjPE1h9tPDJRMPsEE0/FSknwn8POgCob9ftC3P/y4QpzqJ
 19qWaNz+aP62OaPgeJP24/ySHyP+CbflONTsxOb6+5/AQa3WMRxlPynkpJcdsY8pxgmUp1EBWUOEL
 r/X8G+eTFh6A4ZXeVLbGUnGiVg6Yc2kzogdktUirzt6/u8JhbYvELbsWlbETbiLpJyWM0ejqBqY8g
 SCEhxsSA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjl-00000000T98-1qan;
 Tue, 08 Jul 2025 17:04:09 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:52 +0100
Message-ID: <20250708170359.111653-56-willy@infradead.org>
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
 Content preview: Get the folio from the bio instead of the page.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/data.c | 2 +- 1
 file changed, 1 insertion(+),
 1 deletion(-) diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
 index 116482adf591..942aaf10b78b 100644 --- a/fs/f2fs/data.c +++
 b/fs/f2fs/data.c
 @@ -278,7 +278,7 @@ static void f2fs_post_read_work(struct work_struct *w
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjr-0006Ex-St
Subject: [f2fs-dev] [PATCH 55/60] f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
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

Get the folio from the bio instead of the page.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 116482adf591..942aaf10b78b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -278,7 +278,7 @@ static void f2fs_post_read_work(struct work_struct *work)
 
 static void f2fs_read_end_io(struct bio *bio)
 {
-	struct f2fs_sb_info *sbi = F2FS_P_SB(bio_first_page_all(bio));
+	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
 	struct bio_post_read_ctx *ctx;
 	bool intask = in_task();
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
