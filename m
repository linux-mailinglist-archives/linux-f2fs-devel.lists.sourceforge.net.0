Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 455DCA76E23
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVY-0003lF-Fk;
	Mon, 31 Mar 2025 20:13:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVP-0003kN-VX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eewOO5MdDaINIG870LNZy7ghhnwCLEVQalhgq5caK8Q=; b=NFEI1nEFmWW1i15HVE1TfDK/Zs
 n23RgPSYCSI9Tez5ynZNT2WavJh0lv+Yec18bMfKIoQSD57mvXoeeXDuqTRuxyMMu1/T1BWdFc73D
 IaD5cjlfpT3euizL4FZs8OvV0EGSFJWbX7dwDjWpQ3+FPzDjr24mWHysBxtZVXj9ahKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eewOO5MdDaINIG870LNZy7ghhnwCLEVQalhgq5caK8Q=; b=D9zY+HR3QLYpUkMlSzJImmmvWt
 Q79u9HCtpkip3ZL/2EVDUP9F+6j/X/67NSV0XH9xxrknuGB5ZGyOGEAUfzO9vfqLolmKGKs2qq4yj
 vGCVF68hxfoZL1HXniHGElocwJERraLyY26O0iLb+tIZuWGyaRdosbaaUYILsjmpJPfc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVP-0003Ya-Ba for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=eewOO5MdDaINIG870LNZy7ghhnwCLEVQalhgq5caK8Q=; b=FumxA9hb+hHhdfG9P7gq5ERwCX
 QAfV+gzRM50pPvQdtx0vB3juYW4mfrqJh5ESgx8TW9Uvc9l7NvX5Ihtj1IIoi6aOpQeHlPM1drMXD
 uc3RKrh6uR2dpsti0W2UDEPlNTTOxO46eirw9TuRQFQstYGiAXiZforNMK/2PjE/7fotgFwZnTk3X
 sLUoyuWovGDsDka5k32pQare0P4Gsr0/vw+HSKiEhu5ftR7T9OHgoCTRJY0NzWUFbNaUdy2M//UFY
 yP7yTYy2OEuA+oULwQQGsuNiogCVKkrCBk6ymVa3z8AYMs+2Tu9wT5WKEDVXsmB+XPjC90jt0Va1o
 Xf286nqg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004Rb3-008i;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:48 +0100
Message-ID: <20250331201256.1057782-29-willy@infradead.org>
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
 Content preview:  Convert get_current_sit_page() to get_current_sit_folio()
 and then use the folio in build_sit_entries(). Saves a hidden call to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/segment.c
 | 16 ++++++++-------- 1 file changed, 8 insertions(+), 8 deletions(-) 
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
X-Headers-End: 1tzLVP-0003Ya-Ba
Subject: [f2fs-dev] [PATCH 028/153] f2fs: Use a folio in build_sit_entries()
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

Convert get_current_sit_page() to get_current_sit_folio() and then
use the folio in build_sit_entries().  Saves a hidden call to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index baf24d29ed44..aa0f2f243dba 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4491,10 +4491,10 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 	return -1;
 }
 
-static struct page *get_current_sit_page(struct f2fs_sb_info *sbi,
+static struct folio *get_current_sit_folio(struct f2fs_sb_info *sbi,
 					unsigned int segno)
 {
-	return f2fs_get_meta_page(sbi, current_sit_addr(sbi, segno));
+	return f2fs_get_meta_folio(sbi, current_sit_addr(sbi, segno));
 }
 
 static struct folio *get_next_sit_folio(struct f2fs_sb_info *sbi,
@@ -4916,15 +4916,15 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
 
 		for (; start < end && start < MAIN_SEGS(sbi); start++) {
 			struct f2fs_sit_block *sit_blk;
-			struct page *page;
+			struct folio *folio;
 
 			se = &sit_i->sentries[start];
-			page = get_current_sit_page(sbi, start);
-			if (IS_ERR(page))
-				return PTR_ERR(page);
-			sit_blk = (struct f2fs_sit_block *)page_address(page);
+			folio = get_current_sit_folio(sbi, start);
+			if (IS_ERR(folio))
+				return PTR_ERR(folio);
+			sit_blk = folio_address(folio);
 			sit = sit_blk->entries[SIT_ENTRY_OFFSET(sit_i, start)];
-			f2fs_put_page(page, 1);
+			f2fs_folio_put(folio, true);
 
 			err = check_block_count(sbi, start, &sit);
 			if (err)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
