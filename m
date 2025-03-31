Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB8DA76E8E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLW2-0001DP-1e;
	Mon, 31 Mar 2025 20:13:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-00011V-Ma
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XJTnncIy1zCYM2pbQbwm5J/66qwfZJZaZRsXmnrVCeA=; b=a2e8AHpUDjEp1/CUS5lTXqfVLT
 6slYSFEhtNRR5VjZJfLy0A4i7KD28M/FGgO01YePTOmLwqikdm/XQFAIiE8UIMezC0bJnmlIfJ070
 w38CXGwT2sE5zaO1kSBUo2HRryLL+usNFivMWxR86YSSxcJzFhpC1gDaGryZO0jYmG18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XJTnncIy1zCYM2pbQbwm5J/66qwfZJZaZRsXmnrVCeA=; b=TPvruPLOZoUFEccE/H1sTYkJ/6
 5Of84Abv2qJWBU3/bKH/QgnALwGafSUJGGeHU2iHiZ+sjsnd44X1on+bhXqBC3mhYyWKYoRCldutE
 hnDIwTBdSy8gpOH+swDaTGS6VksUv4t5T6DZoSOW/V+83Fjven6oPApdkZXuGtTLpYI4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003a8-O6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=XJTnncIy1zCYM2pbQbwm5J/66qwfZJZaZRsXmnrVCeA=; b=THAp6uGS9ym+YcI8PGDRoo4Gdw
 I3cnGw1BRwdjz0C8GzQLbsLEmbFNoxbdOk+22obG+D12/m/IzIvILhlUx/ZO4TiCJ500nF9oqZx98
 tbBOtdBGgQmqbtFWFI9sjoTlgG0Jd+SWxLRu4+YWvkve4VvgnN6muvw4vUcjACCiFSpYpI+VhdbOe
 suazDfOhZI48ebPD0m/YgNBGZsnVi1aaVJP0AY9zguAw977ermkvamZE7QGlGI7NYAcee7Sv/Utzr
 ajWwxryAB/lnI7Hm6O/QTTxWFKFJHRx9Ug4ZtVkweqI8f6dPjS32zt2HnHTeCOY2D6QEm8E5CEz8s
 8WYlci6w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVQ-00000004Rv3-1orD;
 Mon, 31 Mar 2025 20:13:12 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:33 +0100
Message-ID: <20250331201256.1057782-74-willy@infradead.org>
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
 Content preview: The folio equivalent of f2fs_get_node_page(). Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 5 +++++ 2 files changed,
 6 insertions(+) diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
 index 8b5c81116653..62ae222824e9 100644 --- a/fs/f2fs/f2fs.h +++
 b/fs/f2fs/f2fs.h
 @@ -3729,6 +3729,7 @@ int f2fs_remove_inode_page(struct inode *inode); st
 [...] Content analysis details:   (-2.5 points, 6.0 required)
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
X-Headers-End: 1tzLVW-0003a8-O6
Subject: [f2fs-dev] [PATCH 073/153] f2fs: Add f2fs_get_node_folio()
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

The folio equivalent of f2fs_get_node_page().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h | 1 +
 fs/f2fs/node.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8b5c81116653..62ae222824e9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3729,6 +3729,7 @@ int f2fs_remove_inode_page(struct inode *inode);
 struct page *f2fs_new_inode_page(struct inode *inode);
 struct folio *f2fs_new_node_folio(struct dnode_of_data *dn, unsigned int ofs);
 void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
 struct folio *f2fs_get_inode_folio(struct f2fs_sb_info *sbi, pgoff_t ino);
 struct page *f2fs_get_inode_page(struct f2fs_sb_info *sbi, pgoff_t ino);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ac3fa0147e1e..ef433dce4b05 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1535,6 +1535,11 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 	return ERR_PTR(err);
 }
 
+struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid)
+{
+	return __get_node_folio(sbi, nid, NULL, 0, NODE_TYPE_REGULAR);
+}
+
 struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
 {
 	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
