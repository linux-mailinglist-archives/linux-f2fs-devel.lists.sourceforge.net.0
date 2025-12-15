Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3BCBDCC0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 13:28:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YhWzav8h0cDdQUQ9/5Y0g3RJt/pbCnSmI+uCqWSKChY=; b=DeHZGWqhsi4BBWVejyoqy/EUGf
	nxfuONxw65C7/pM3qgv8REYNZHixsZZ1+DHOwAvdKVZaHk1bNobficfOU3l4QpF0xIVJlR7JwU74O
	/FZasKzyYoSaESGZ9d85OwYsXbwEUR3+drImsqDKn6rTN/AMhqr8HttsapXmt3n6/f4c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vV7gb-0001sW-BM;
	Mon, 15 Dec 2025 12:28:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vV7ga-0001sQ-0f
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 12:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8beonnivaQqwkL0PgUOuCGqkqxdm9wIPt17bR7roUp8=; b=Er/Pqk3wfFjZqDzWZReDmWUxw8
 ktZTpMhKDB34/e6EvqlJwcYZPSJBoOj3RJ2IE7T4XDGPpZIrYsAGvJCkak2TaSHmiWnNWCxdv61/H
 R6pWn6HcAjTmyBuVE4oTr2zgMUSFqogkWpAvMkD6cmD1V/N2t1oIgRutk56nshkfVN0E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8beonnivaQqwkL0PgUOuCGqkqxdm9wIPt17bR7roUp8=; b=k
 AT0J++eGu6XzmNKezJ8ere8SvR3E7FL2lZU5KcJ7zqV+irlOefHIWhm1QPc2+f6iAUdHOokHMpgzG
 BH86KWWrozBLifRdxTs4ljY3BFSlXIc+iTQao/eWwiPpgOKqG5DIiaczC+oJt87fq7D5iOJhV/30X
 8HlOvMbE14Dw9mc8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vV7gZ-0000IB-Bm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 12:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B30FE60156
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Dec 2025 12:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67328C4CEF5;
 Mon, 15 Dec 2025 12:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765801688;
 bh=xCHv3jDd0xIUUhHnza2mxbQ9yRogBBb/zo+UHWiiASY=;
 h=From:To:Cc:Subject:Date:From;
 b=cvVj3Tk+rA1KnCnd2k/xrA1Ea9QUJRMe1UX202Chc2CmZ/s4prAgk4dp7r9N1dllP
 xeaGkT9gFosP5XOKS8EC0ToIdgAqkBZ6ASawMpJNyis2B83XtVoNOwJcUHbbL9DepA
 MP+wZ+FjCTPTEE2eupOeuN6YenfuGi7nbDeyaHuI0kw/cPIwLbFcuEaJ/fHMT4PnjF
 SREot8u2hVczCoUOyfy4yS6mojRa19mshp4SDeoca/v0x2avgJmVxdUhnkeCUiaO8G
 EJrCbZ0TKRci4l1Ri1xe8EJZPsYtKGJoPIy90YMpbRxgb/2hPRgERIFXrHElFLhmMZ
 lOfESAR58roJw==
To: jaegeuk@kernel.org
Date: Mon, 15 Dec 2025 20:28:03 +0800
Message-ID: <20251215122803.3495320-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.239.gd5f0c6e74e-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: __blkdev_issue_discard() in __submit_discard_cmd() will never
 fail, so let's make FAULT_DISCARD fault injection obsolete. Signed-off-by:
 Chao Yu <chao@kernel.org> --- Documentation/ABI/testing/sysfs-fs-f2fs | 2
 +- Documentation/filesystems/f2fs.rst | 2 +- fs/f2fs/f2fs.h | 2 +-
 fs/f2fs/segment.c | 18 +++ 4 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vV7gZ-0000IB-Bm
Subject: [f2fs-dev] [PATCH] f2fs: make FAULT_DISCARD obsolete
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

__blkdev_issue_discard() in __submit_discard_cmd() will never fail, so
let's make FAULT_DISCARD fault injection obsolete.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  2 +-
 Documentation/filesystems/f2fs.rst      |  2 +-
 fs/f2fs/f2fs.h                          |  2 +-
 fs/f2fs/segment.c                       | 18 +++---------------
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 770470e0598b..7920c233d8ec 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -732,7 +732,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_TRUNCATE                   0x00000400
 		FAULT_READ_IO                    0x00000800
 		FAULT_CHECKPOINT                 0x00001000
-		FAULT_DISCARD                    0x00002000
+		FAULT_DISCARD                    0x00002000 (obsolete)
 		FAULT_WRITE_IO                   0x00004000
 		FAULT_SLAB_ALLOC                 0x00008000
 		FAULT_DQUOT_INIT                 0x00010000
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 9b3b835a174e..27aa4032c7cd 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -206,7 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			     FAULT_TRUNCATE                   0x00000400
 			     FAULT_READ_IO                    0x00000800
 			     FAULT_CHECKPOINT                 0x00001000
-			     FAULT_DISCARD                    0x00002000
+			     FAULT_DISCARD                    0x00002000 (obsolete)
 			     FAULT_WRITE_IO                   0x00004000
 			     FAULT_SLAB_ALLOC                 0x00008000
 			     FAULT_DQUOT_INIT                 0x00010000
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d7600979218e..65ca1a5eaa88 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -54,7 +54,7 @@ enum {
 	FAULT_TRUNCATE,
 	FAULT_READ_IO,
 	FAULT_CHECKPOINT,
-	FAULT_DISCARD,
+	FAULT_DISCARD,		/* it's obsolete due to __blkdev_issue_discard() will never fail */
 	FAULT_WRITE_IO,
 	FAULT_SLAB_ALLOC,
 	FAULT_DQUOT_INIT,
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c26424f47686..5168026b2960 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1286,7 +1286,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 					&(dcc->fstrim_list) : &(dcc->wait_list);
 	blk_opf_t flag = dpolicy->sync ? REQ_SYNC : 0;
 	block_t lstart, start, len, total_len;
-	int err = 0;
 
 	if (dc->state != D_PREP)
 		return 0;
@@ -1327,7 +1326,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 	dc->di.len = 0;
 
-	while (total_len && *issued < dpolicy->max_requests && !err) {
+	while (total_len && *issued < dpolicy->max_requests) {
 		struct bio *bio = NULL;
 		unsigned long flags;
 		bool last = true;
@@ -1343,17 +1342,6 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		dc->di.len += len;
 
-		err = 0;
-		if (time_to_inject(sbi, FAULT_DISCARD)) {
-			err = -EIO;
-			spin_lock_irqsave(&dc->lock, flags);
-			if (dc->state == D_PARTIAL)
-				dc->state = D_SUBMIT;
-			spin_unlock_irqrestore(&dc->lock, flags);
-
-			break;
-		}
-
 		__blkdev_issue_discard(bdev, SECTOR_FROM_BLOCK(start),
 				SECTOR_FROM_BLOCK(len), GFP_NOFS, &bio);
 		f2fs_bug_on(sbi, !bio);
@@ -1392,11 +1380,11 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 		len = total_len;
 	}
 
-	if (!err && len) {
+	if (len) {
 		dcc->undiscard_blks -= len;
 		__update_discard_tree_range(sbi, bdev, lstart, start, len);
 	}
-	return err;
+	return 0;
 }
 
 static void __insert_discard_cmd(struct f2fs_sb_info *sbi,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
