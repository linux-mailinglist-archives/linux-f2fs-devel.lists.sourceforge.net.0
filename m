Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4BAFD433
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+9TAQp2hZlWWMksak4Dv4rTbumaSTITVR4iyke0Q8o=; b=BGtLk82QHJQm727es+thkH//YZ
	DNYgimiaIGRteH4VXseBPbjCK/Ey4TBjx4U36LAgOVHF4FPsgZQoQzuZiNUFNXAh1AkRLfUAFZlCn
	RZ0yi7zdVBMUPmFor1Ovb5gmOl+OrdSgVT6Asp/PWTwA8bMr6AG8noOXVrw9ZT29TIZk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBju-0002oM-JJ;
	Tue, 08 Jul 2025 17:04:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjt-0002nM-1V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YsdLwA7bx60sDPyH93wYhraV/OHdWYBbAV2QC42hQyI=; b=Ytt4vCriRkO0kVelRNNViJQFBL
 sVvhC5r3reczIJz5Maa2z7om7dogh4zbDoA+3WzfMBHl7rSGyj5vdAuho951w3X+B0H/oiu8iGJtb
 OHebQWDi2PLFERH2bD/P5k1ZM9gffNQTUNiW4hapLDGAYF07OV8TTh3euEcWoxaqHHL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YsdLwA7bx60sDPyH93wYhraV/OHdWYBbAV2QC42hQyI=; b=Pn5mU+/02iPFsk+JWV6ETrDSZK
 szKZSZJlL2MicQvRbPfRRF6TXpOAc0e3fq+E4flYRf4g3JAUF/E9zqQZbODlnVw+/218crDrnCV1H
 ToSoSGXPyDdkm0SRHDtLAAiYFkIw4d0xDeSp0R2DPz05aGGA6zWXOBXAVMFWzdVaAhvI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjr-0006En-7j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=YsdLwA7bx60sDPyH93wYhraV/OHdWYBbAV2QC42hQyI=; b=EDj4rrvCIW9TztIxvCf1LZabkn
 q61nOc9RKEYvvdK6b2K2qfE6XyQ03ZE+9CfB40IZeZNsh5Ny9/O3mFnwnyQH9X3UfB+GPymoRMdit
 Q0d75bvZP+Rzd1Yr5enM1wkmYw9cbkLtPZ0dpGORlbTpnnyqQb07V65gFtQAvzkbjvf40Vlcq/JFm
 +a89VHdIxQWAYxwEMNnr3tWmag+yLhu8v3VqGFxFBMp2CPVRC+65Wx8/EfZXfbwUkWaje7LqhOY0I
 tbpdyjYPfvquZv0GCti8wRu8Q9aokYsP2PIjqCI7l+rpNZzhCK6mOWbO7n4274mc3iUV4ICh+SS+9
 Nzaz3rZA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjk-00000000T8X-3KZa;
 Tue, 08 Jul 2025 17:04:08 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:48 +0100
Message-ID: <20250708170359.111653-52-willy@infradead.org>
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
 Content preview: The page argument is only used to look up the address of the
 nat_blk. Since the caller already has it, pass it in instead. Also mark it
 const as the nat_blk isn't modified by this function. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.c | 5 ++--- 1 file
 changed, 2 insertions(+), 3 deletions(-) 
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
X-Headers-End: 1uZBjr-0006En-7j
Subject: [f2fs-dev] [PATCH 51/60] f2fs: Pass the nat_blk to
 __update_nat_bits()
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

The page argument is only used to look up the address of the nat_blk.
Since the caller already has it, pass it in instead.  Also mark it const
as the nat_blk isn't modified by this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 7c01206bd3d6..17f74e440084 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2969,11 +2969,10 @@ static void __adjust_nat_entry_set(struct nat_entry_set *nes,
 }
 
 static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
-						struct page *page)
+		const struct f2fs_nat_block *nat_blk)
 {
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	unsigned int nat_index = start_nid / NAT_ENTRY_PER_BLOCK;
-	struct f2fs_nat_block *nat_blk = page_address(page);
 	int valid = 0;
 	int i = 0;
 
@@ -3064,7 +3063,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	if (to_journal) {
 		up_write(&curseg->journal_rwsem);
 	} else {
-		__update_nat_bits(sbi, start_nid, &folio->page);
+		__update_nat_bits(sbi, start_nid, nat_blk);
 		f2fs_folio_put(folio, true);
 	}
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
