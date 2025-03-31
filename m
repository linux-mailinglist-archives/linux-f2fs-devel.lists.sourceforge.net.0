Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56600A76E2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVd-0003nu-30;
	Mon, 31 Mar 2025 20:13:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVY-0003l8-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R64l87c0qpc5q3PgOcIUGe9r+5fDzSd4O7jmU7743vA=; b=lXMa8e0GtWJvljv0MygfMmnHjQ
 /u2nQImTFjts4iblJXy9aHUEQFsPXr0PpWa7y82P1XQPQgCTrHH9MIXSKqsnykoXghfBUXoz7U4vy
 YvRKs8F7qryQiARUrUUuEv9dhkykNCa1QfqU6y3yGqJevBAkPAJ7HZt1/PMWEr4IBMjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R64l87c0qpc5q3PgOcIUGe9r+5fDzSd4O7jmU7743vA=; b=aNNp9E2zvO23A70Y/h8XIZsXZ0
 nxbKK72ZOoI3d/ANYsvloDndfnxwNRlYIHmsCLROAEDY0w36LgYYYbJRB0eOdMpbEZUqQOn5jtDmT
 xciWZw9XozI49JYhqFaRRHw+f4asKhXTJHAYPiwO18HVy4QeqcTCiyBLCBTf8B7ZVRso=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVS-0003Yz-EU for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=R64l87c0qpc5q3PgOcIUGe9r+5fDzSd4O7jmU7743vA=; b=XbW0BuA7eY+PBdTR/YNLgCrfZo
 DnAItsPZTApz9kaNXSoSXmXtsOsuNzVmT/bYKnT21QxpqblCbgxkO5PtFyW+VxX7fLEuIMffeDXfr
 aFOwo82EfwmkNscXa2Qrxa5exVSae9AbBa6pStTbhAemOvQBtI0CfzBu/cMPMYTmn1vXBSWF3gLzy
 xY1X+wVe2zLhgsKbVnMefkGnYWXMNNBf7ZWIbzNh+bJ20/iUxe9qkFSIlf9e6pBiZrfRHiH3CwcPb
 cjtOWBJsC3QOjQ829kTuIzFu5SYhlJHPNLSS8fPdCq1mCF1cQEeIak4jio/60tY+CQfmKJMDv5O0d
 4hwTvtdw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVH-00000004RWj-0Wqe;
 Mon, 31 Mar 2025 20:13:03 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:34 +0100
Message-ID: <20250331201256.1057782-15-willy@infradead.org>
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
 Content preview:  The only caller which passes a page already has a folio, so
 pass it in. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
 --- fs/f2fs/data.c | 8 ++++---- fs/f2fs/f2fs.h | 2 +- fs/f2fs/segment.c |
 2 +- 3 files changed, 6 insertions(+), 6 deletions(-) 
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
X-Headers-End: 1tzLVS-0003Yz-EU
Subject: [f2fs-dev] [PATCH 014/153] f2fs: Pass a folio to
 f2fs_submit_merged_ipu_write()
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

The only caller which passes a page already has a folio, so pass
it in.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c    | 8 ++++----
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/segment.c | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e6921a53c7a1..23e37207ed90 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -826,13 +826,13 @@ static int add_ipu_page(struct f2fs_io_info *fio, struct bio **bio,
 }
 
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
-					struct bio **bio, struct page *page)
+					struct bio **bio, struct folio *folio)
 {
 	enum temp_type temp;
 	bool found = false;
 	struct bio *target = bio ? *bio : NULL;
 
-	f2fs_bug_on(sbi, !target && !page);
+	f2fs_bug_on(sbi, !target && !folio);
 
 	for (temp = HOT; temp < NR_TEMP_TYPE && !found; temp++) {
 		struct f2fs_bio_info *io = sbi->write_io[DATA] + temp;
@@ -848,7 +848,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 				found = (target == be->bio);
 			else
 				found = __has_merged_page(be->bio, NULL,
-								page, 0);
+							&folio->page, 0);
 			if (found)
 				break;
 		}
@@ -865,7 +865,7 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 				found = (target == be->bio);
 			else
 				found = __has_merged_page(be->bio, NULL,
-								page, 0);
+							&folio->page, 0);
 			if (found) {
 				target = be->bio;
 				del_bio_entry(be);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c8965fdcf3cb..4a30ded147e2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3944,7 +3944,7 @@ void f2fs_submit_merged_write_cond(struct f2fs_sb_info *sbi,
 				struct inode *inode, struct page *page,
 				nid_t ino, enum page_type type);
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
-					struct bio **bio, struct page *page);
+					struct bio **bio, struct folio *folio);
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
 int f2fs_submit_page_bio(struct f2fs_io_info *fio);
 int f2fs_merge_page_bio(struct f2fs_io_info *fio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index d2f2f68da098..8476419db9e4 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4165,7 +4165,7 @@ void f2fs_folio_wait_writeback(struct folio *folio, enum page_type type,
 		/* submit cached LFS IO */
 		f2fs_submit_merged_write_cond(sbi, NULL, &folio->page, 0, type);
 		/* submit cached IPU IO */
-		f2fs_submit_merged_ipu_write(sbi, NULL, &folio->page);
+		f2fs_submit_merged_ipu_write(sbi, NULL, folio);
 		if (ordered) {
 			folio_wait_writeback(folio);
 			f2fs_bug_on(sbi, locked && folio_test_writeback(folio));
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
