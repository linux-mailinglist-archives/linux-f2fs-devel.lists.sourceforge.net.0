Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 440F5A76E37
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVg-0005cB-IJ;
	Mon, 31 Mar 2025 20:13:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVU-0005ZR-On
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XV14/1qWsjw9HgejyxxRt8DubdJqptbjN3p95lRPJ/I=; b=Z8nZJVm07UtSq422W+isl2nRat
 dMt+KHYxjhmR2Y951T80GoE/vWQnnUclkHN9yqQzId3lqRohTE4+NzgCzdNU+pfIlhHzmIBrROCgJ
 5DmVf0jugW+dqgNJyH1xev9BY5cPjt0fhqXh8rkEYo/mU3Lw3Fgiel4p9oLHG5awlcQQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XV14/1qWsjw9HgejyxxRt8DubdJqptbjN3p95lRPJ/I=; b=idYc/cQvnjGnUMB6KHdko64MWy
 td2AMqwh0m0h6EzluBFUHTmZTMoHplT186nM2ZxKJSUEZjMIUI11sWsjS1AQ+1ZvhpvMrXSYeow4T
 uiYgrRccghArcpJOSnwoh8sibCXum86tlZwkgj/ToIU0zghwOl9QTGu9gwGPXEIShggs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVO-0003YU-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XV14/1qWsjw9HgejyxxRt8DubdJqptbjN3p95lRPJ/I=; b=JM/eRplDAPUKiwjtCoX1mXM2Dj
 g1dJkQ6Np9kcLBXLE7PAJt2+uDtZEsYGPcVLtMDilyrQLNfLrLa/CUMEX4zIamwoJgEuJTzd88hXG
 vF57wk06Om6OaHdLdRS+HCOm6nekiM39cSIiPqnhBhQfCWZnCUV1nSOZ5UpzY1h0HrWb0RnomlSDb
 ZpKNCs8hB8yULRaI3gRgu/kTcxPKmc68nwt56hxvlEC4ia1bT/W8tfoWAPz8RTHnltJmfQ2trdOIf
 GdqYL+IOA88K+B62sEwDd4/zmTA4AfYTI3STSAWguCG6ejeZaB8cU1g70b6O980MevCzoxG2BafdV
 etCLF1nA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVI-00000004RYR-09ZY;
 Mon, 31 Mar 2025 20:13:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:41 +0100
Message-ID: <20250331201256.1057782-22-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Call f2fs_grab_meta_folio() instead of f2fs_grab_meta_page().
 Saves a hidden call to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/node.c | 10 +++++----- 1 file changed,
 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVO-0003YU-Ct
Subject: [f2fs-dev] [PATCH 021/153] f2fs: Use a folio in get_next_nat_page()
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

Call f2fs_grab_meta_folio() instead of f2fs_grab_meta_page().
Saves a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 0b2e24ad620d..7c42dd5cd68b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -138,7 +138,7 @@ static struct page *get_current_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 {
 	struct page *src_page;
-	struct page *dst_page;
+	struct folio *dst_folio;
 	pgoff_t dst_off;
 	void *src_addr;
 	void *dst_addr;
@@ -150,18 +150,18 @@ static struct page *get_next_nat_page(struct f2fs_sb_info *sbi, nid_t nid)
 	src_page = get_current_nat_page(sbi, nid);
 	if (IS_ERR(src_page))
 		return src_page;
-	dst_page = f2fs_grab_meta_page(sbi, dst_off);
+	dst_folio = f2fs_grab_meta_folio(sbi, dst_off);
 	f2fs_bug_on(sbi, PageDirty(src_page));
 
 	src_addr = page_address(src_page);
-	dst_addr = page_address(dst_page);
+	dst_addr = folio_address(dst_folio);
 	memcpy(dst_addr, src_addr, PAGE_SIZE);
-	set_page_dirty(dst_page);
+	folio_mark_dirty(dst_folio);
 	f2fs_put_page(src_page, 1);
 
 	set_to_next_nat(nm_i, nid);
 
-	return dst_page;
+	return &dst_folio->page;
 }
 
 static struct nat_entry *__alloc_nat_entry(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
