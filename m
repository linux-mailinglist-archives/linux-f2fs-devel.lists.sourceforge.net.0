Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D27AFD44C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hUOpGewt84umxfH8quVmXGwtDZeEw+tHsOAdbTzdcTY=; b=AbrsXsWW4Gjz4S4r+QOVcrYtZX
	LdXFpw3OrgIeZsT7fTU0u90F7a7IEbd425fJjqBErYtBNrunUPviybrC61rmysmu1QADeY5Izj/qz
	OZaXPdZKluYPRjiojkboQmJgP5nAZnn7HcLxopg+4VdfoCrnmOggCcmHYbTsdPFu2/Ug=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBk1-0005Kj-6K;
	Tue, 08 Jul 2025 17:04:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjx-0005Hp-Si
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5j/y0oT1RJuP9TVEjBGxwrieiDNGCHp5oRP2fk5bolM=; b=lFf9p0GwNqOU4r6wNEXcfWuDcE
 mLylKKrk2fj3r98tEMyrD+DP1CvdLkEXa+PcEVMnbLc1CQH1bIsS1lpmOopqnYSX4SOIOR6Akpxmf
 gXVyzY5sAhL1/Ya5khPg48Gc+qqKN33KhVW+rBbfG5Jyhs0rb1Zg6502XsNcN9yoK0t8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5j/y0oT1RJuP9TVEjBGxwrieiDNGCHp5oRP2fk5bolM=; b=gQyTOrC8FkZsMXMKfGsKqAdLJ8
 LLUUOhABc2Jn8xyPd/gIOFG9YH5rwMQXrUb11PyrzTvG7VfX1WJpE874yWAJWnvF+TUtDwKBQ5l6k
 PcvQ/la8YoMX4r18VFpd7/yIluETkmVQHYgdFqTtPptpKf0S6w6MJU5eFOlLeWJBQhJM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjt-0006FQ-KH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5j/y0oT1RJuP9TVEjBGxwrieiDNGCHp5oRP2fk5bolM=; b=gwVzvJUNQF4BEyDA9EUHdZp7E4
 8xGBymX1ILx0V5w2WqNQyY1zd8IudarbcJExJ+G4tAb284f24a1FDWbf/crXXpsxOGErsOJ79gaNw
 Pq1pFkz17CbsIFuTaSSyjJB/ttdybzj5KJk7cHSNU5K6LlxysV6QdMsTtnsDTLxL5dZkgwuJvuPYc
 bSfZSG1Nnk9G+gBaZjxbSLKRm5scejcUg2PXwSF5t3fU3biiw5WIoktCZ4uK1tPW1/VjDXAU3LJwW
 omJ8eknW1FOT2ksXRtKPXxfId2eupu4SA0MOADx/JPNbPEl0vDRmdxXbs2da3o0Z3KoMl8Yf3WKZ0
 EWGMDc6w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBji-00000000T6T-0JUr;
 Tue, 08 Jul 2025 17:04:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:29 +0100
Message-ID: <20250708170359.111653-33-willy@infradead.org>
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
 Content preview: All three callers now have a folio so pass it in.
 Signed-off-by:
 Matthew Wilcox (Oracle) <willy@infradead.org> --- fs/f2fs/node.h | 10
 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-) diff --git a/fs/f2fs/node.h
 b/fs/f2fs/node.h index a03e30a1b8c2..657f9a2d4b05 100644 --- a/fs/f2fs/node.h
 +++ b/fs/f2fs/node.h @@ -397,15 +397,15 @@ static inline nid_t get_nid(const
 struct folio *fol [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjt-0006FQ-KH
Subject: [f2fs-dev] [PATCH 32/60] f2fs: Pass a folio to is_node()
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

All three callers now have a folio so pass it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index a03e30a1b8c2..657f9a2d4b05 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -397,15 +397,15 @@ static inline nid_t get_nid(const struct folio *folio, int off, bool i)
  *  - Mark cold data pages in page cache
  */
 
-static inline int is_node(const struct page *page, int type)
+static inline int is_node(const struct folio *folio, int type)
 {
-	struct f2fs_node *rn = F2FS_NODE(page);
+	struct f2fs_node *rn = F2FS_NODE(&folio->page);
 	return le32_to_cpu(rn->footer.flag) & BIT(type);
 }
 
-#define is_cold_node(folio)	is_node(&folio->page, COLD_BIT_SHIFT)
-#define is_fsync_dnode(folio)	is_node(&folio->page, FSYNC_BIT_SHIFT)
-#define is_dent_dnode(folio)	is_node(&folio->page, DENT_BIT_SHIFT)
+#define is_cold_node(folio)	is_node(folio, COLD_BIT_SHIFT)
+#define is_fsync_dnode(folio)	is_node(folio, FSYNC_BIT_SHIFT)
+#define is_dent_dnode(folio)	is_node(folio, DENT_BIT_SHIFT)
 
 static inline void set_cold_node(const struct folio *folio, bool is_dir)
 {
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
