Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8A663A497
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFO-00082n-QY;
	Mon, 28 Nov 2022 09:16:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaF8-00081E-HH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xYxZCTgf87uwmCjS2Ba69FLL+Y03Pvmruegsod2EEzo=; b=ldMUNFPNgALrc5DwYZYTXqAS7T
 KLrGcEfO76lxr8xBtfJRbRMEFGEhj+nGd9Qaf+U1Xwah0KSjSHWRiRJje0nrYKptUzXdb1ENDYUIO
 XCpf35RMUk82rD97dyEhaTMt9Akr3giGNRFy1eoxKObKre1p/e3Ks9hrxu/MnRBaOGBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xYxZCTgf87uwmCjS2Ba69FLL+Y03Pvmruegsod2EEzo=; b=mYkSAmQxqlZ/gFFBGOojsiKG50
 dmpoaNzVpSsMdbC08QIFHaadnShVjPuJeGXDy0KAFSUi4X4113i/g3W4Oot0MyxGaDlPGOzm/zEfv
 n4IgSAwmi4nMMDAqsJboahmWma1C/05j9q60d6Qh7NlSAnFphBHbFmujVUHdwvEhoftw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaF6-00GRRp-Kj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xYxZCTgf87uwmCjS2Ba69FLL+Y03Pvmruegsod2EEzo=; b=zNdu9uh6PQrkcuNZTOn1gn4ndQ
 9ZCktNa6nh8wOq9XxFIIR19uycqMM7w0Q39exBypAVZVK0Gwv4yLNIZUodEZbjRD7vD+8c4yyBh4c
 GTh6e3PZlft0Kly74PIhSGCusBQZelfmYnAMNLI5kNxsa7H6fYj82vcJKvc1u4XMewa0fSsTdqBZ0
 b21MwcA8HpNVMIYqkRS7QMfA0R77/Nb3RZBasmXxnTbkBulNNU75p21v3QtAkBoiX0Im59CCtpgG3
 xrdw5m9Ti3DxAd9nFlrJaZkRxyzePXSZydbIxicptTuWX2IeRTwDede3LM3Zz55ppGDIoUN0v91yI
 vKRPA/UQ==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaF0-000Yy3-Q9; Mon, 28 Nov 2022 09:15:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:18 +0100
Message-Id: <20221128091523.1242584-11-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221128091523.1242584-1-hch@lst.de>
References: <20221128091523.1242584-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Just use a simple if block for the conditional call to
 inc_valid_block_count.
 Signed-off-by: Christoph Hellwig <hch@lst.de> --- fs/f2fs/data.c | 11
 +++++------ 1 file changed, 5 insertions(+), 6 deletions(-) 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1ozaF6-00GRRp-Kj
Subject: [f2fs-dev] [PATCH 10/15] f2fs: simplify __allocate_data_block
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just use a simple if block for the conditional call to
inc_valid_block_count.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/data.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index fc5207859912ce..87c17602a3fdd4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1407,13 +1407,12 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 		return err;
 
 	dn->data_blkaddr = f2fs_data_blkaddr(dn);
-	if (dn->data_blkaddr != NULL_ADDR)
-		goto alloc;
-
-	if (unlikely((err = inc_valid_block_count(sbi, dn->inode, &count))))
-		return err;
+	if (dn->data_blkaddr == NULL_ADDR) {
+		err = inc_valid_block_count(sbi, dn->inode, &count);
+		if (unlikely(err))
+			return err;
+	}
 
-alloc:
 	set_summary(&sum, dn->nid, dn->ofs_in_node, ni.version);
 	old_blkaddr = dn->data_blkaddr;
 	f2fs_allocate_data_block(sbi, NULL, old_blkaddr, &dn->data_blkaddr,
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
