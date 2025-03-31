Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B895BA76E29
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVb-0000vA-30;
	Mon, 31 Mar 2025 20:13:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVW-0000sk-3Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1l3AXkl4t/urk6uQWAEf2nuIzpQD17PVje5LR21yMQ=; b=C5QGNPw66f79mSh3F7/0uIlSgy
 bogBlRPguh4rRFiCHOgGj3kxIlzpcieoXy6OutV73piU5j5tg5r45rKoveiy/m+STJ8WeVV2+JLfP
 ZR6bR1jo/mt0iLY7hft0kT2RZoApDoO9lQLN8MqT9qYjDw76Fj72m7/3TsKCCNi3CFTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T1l3AXkl4t/urk6uQWAEf2nuIzpQD17PVje5LR21yMQ=; b=la8rQm+Ue2UC0tsGg6lwU6ZuAi
 klpl/5+UC0lnWqlCABG37kLY0Yo/wujfIaijF/t68A7LIytYpuoAz+A8pABQsTdLX3tFULav221gA
 39JeNS2+RMJ+ANTKNXEsQ6twOmKOSypTBnErxBunuq6B6TX7fyB3OSNEfV/vczQAgWjY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVM-0003Y2-9z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=T1l3AXkl4t/urk6uQWAEf2nuIzpQD17PVje5LR21yMQ=; b=AWU893kcG2oweleaBTn+hck7Hj
 bGqM3ER0zwE3K4PEQQAHM4OKD/ooQtjIl9NIs+UFxbu/zooUHdClayjzEHZ2ustJcHNXX+vp2z0Pb
 Ugk7Pw804xA4BUW2t4b1YGJkYWwZ8evwkHAvih3z3R6Inm5GAX6aTj9obT4hHKEWz9a7jFBH6T/AU
 U6Qa1duIq5uc1PmLsZxgYmByh2fAJFrKM2n7VvrV2mZ05Sxwh/5a8T5jQx75XrCeR7qX2YRPNb5DB
 u/d1Ln42hMGhZJyvP/2zdDfQ5Us/KCM5tJxon46cqoqLIgZjaMA8zQiMpI98Yok/8dIyb5LmNwD13
 WkRj1iuw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVF-00000004RUs-3yM7;
 Mon, 31 Mar 2025 20:13:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:26 +0100
Message-ID: <20250331201256.1057782-7-willy@infradead.org>
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
 Content preview:  Convert the incoming page to a folio at the start, then use
 the folio later in the function. Moves a call to page_folio() earlier, and
 removes an access to page->mapping. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/data.c | 5 +++-- 1 file changed,
 3 insertions(+), 2 deletions(-) 
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
X-Headers-End: 1tzLVM-0003Y2-9z
Subject: [f2fs-dev] [PATCH 006/153] f2fs: Use a folio in add_ipu_page()
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

Convert the incoming page to a folio at the start, then use the
folio later in the function.  Moves a call to page_folio() earlier,
and removes an access to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 70dab1b6fdf4..8d25af7a4cfd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -779,6 +779,7 @@ static void del_bio_entry(struct bio_entry *be)
 static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							struct page *page)
 {
+	struct folio *fio_folio = page_folio(fio->page);
 	struct f2fs_sb_info *sbi = fio->sbi;
 	enum temp_type temp;
 	bool found = false;
@@ -800,8 +801,8 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 							    *fio->last_block,
 							    fio->new_blkaddr));
 			if (f2fs_crypt_mergeable_bio(*bio,
-					fio->page->mapping->host,
-					page_folio(fio->page)->index, fio) &&
+					fio_folio->mapping->host,
+					fio_folio->index, fio) &&
 			    bio_add_page(*bio, page, PAGE_SIZE, 0) ==
 					PAGE_SIZE) {
 				ret = 0;
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
