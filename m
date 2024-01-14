Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2E382F084
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jan 2024 15:24:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPkMl-00068g-BR;
	Tue, 16 Jan 2024 14:24:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rPkMh-00068W-PJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:24:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1+8e+VhLSXmkdEXvwI7ZG0C5ZaayLAYYGE5p3kIL0y0=; b=bqhZecw0Bqic7PZ7NG14HRnZV+
 3to9Orm5n20GBjYt1rFMUWWQIiCnoAHX5RoETGGa5wl2E/Dwcy+Lrx7/mvMCv6bgHpJbRp+z7zEFU
 iE7gLrWoIvZrLQOwakngMGW5YVnpm5Q0gykbq8z0VWj8ZAWft7ajSW6/e1bC47hR2hm4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1+8e+VhLSXmkdEXvwI7ZG0C5ZaayLAYYGE5p3kIL0y0=; b=n
 MpkB1ebhxFG7z6ZIP4BELOK4CQZp1NnFqoXyLmgiyW07okK1Uo/vx8jadSBa0P6PfJ/+jL5BpNdxt
 cJVMI8wjuJ5xR0J09DaaXQspt5TSNVqeQSRT6Mg5Dn4LzrzgJoIv2/xubv4wkBJUec9TAlya6+1qe
 atfwCNHNrG/+8WQ4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rPkMg-0001ih-RA for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jan 2024 14:24:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F3753CE19B2;
 Tue, 16 Jan 2024 14:24:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EDB3C433F1;
 Tue, 16 Jan 2024 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705415050;
 bh=VZJTPGfILjf+cNF1UZaQjhGTPWGf48SxG/O+ibMRJvo=;
 h=From:To:Cc:Subject:Date:From;
 b=Hxgfm2FavourMrxlmO1xyRBDpXaraB/ZGD9ZmOaWqJ4GGwc9F7cq4YMFgGzAdjH8B
 oiygj/hJRapv2rvxDbxBSr6hQdGCcQeRPbJzkS4Tnwl4rwV0iR8lLBD5vktI7JGJsK
 He7O04aTDJWykYDSAdzk58Xh6zMJNRLDyzCVbyAgOS/Yyn3CqrUJymASvRrKnMG51m
 a+qP+kDFJmXK65/uS11ZQycSjIv+DIwW0h7BF1hOC+gSfCpLZEHKbuFhXa+t5iWXbP
 6biSI4aWNg1ps/06XReoDgz+qUs3vCJ82tGVothM4ar/aIecYA/rd4xFdHWYxf3hYf
 a1uV1oiAHBC2g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 15 Jan 2024 02:21:18 +0800
Message-Id: <20240114182118.38596-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Kane Ch'in reported in bugzilla [1] I am using some Debian
 VMs with f2fs root partition for development. My host machine crashed for
 some reason and this caused the f2fs partitions in the VMs to become
 corrupted. I tried to boot from De [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.5 DATE_IN_PAST_24_48     Date: is 24 to 48 hours before Received: date
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rPkMg-0001ih-RA
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix to avoid assert in
 do_record_fsync_data()
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
Cc: Kane Ch'in <qinfd2023@lzu.edu.cn>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Kane Ch'in reported in bugzilla [1]

I am using some Debian VMs with f2fs root partition for development.
My host machine crashed for some reason and this caused the f2fs
partitions in the VMs to become corrupted. I tried to boot from Debian
Live and repair the partitions but failed.

do_record_fsync_data: [node] ino = 24573, nid = 0, blkaddr = 2063580
recover_data: ino = 24573, nid = 0, recorded = 0, err = 0
do_record_fsync_data: [node] ino = 471286, nid = 0, blkaddr = 2063581
recover_data: ino = 471286, nid = 0, recorded = 0, err = 0
[ASSERT] (do_record_fsync_data:3475) 0

During do_record_fsync_data(), if dnode in warm node chain is valid in
SIT table, it's better to continue checking rather than triggering
assert().

[1] https://bugzilla.kernel.org/show_bug.cgi?id=218349

Reported-by: Kane Ch'in <qinfd2023@lzu.edu.cn>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/mount.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 30c6228..345556d 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3811,14 +3811,11 @@ static int do_record_fsync_data(struct f2fs_sb_info *sbi,
 	se = get_seg_entry(sbi, segno);
 	offset = OFFSET_IN_SEG(sbi, blkaddr);
 
-	if (f2fs_test_bit(offset, (char *)se->cur_valid_map)) {
-		ASSERT(0);
-		return -1;
-	}
-	if (f2fs_test_bit(offset, (char *)se->ckpt_valid_map)) {
-		ASSERT(0);
-		return -1;
-	}
+	if (f2fs_test_bit(offset, (char *)se->cur_valid_map))
+		return 1;
+
+	if (f2fs_test_bit(offset, (char *)se->ckpt_valid_map))
+		return 1;
 
 	if (!se->ckpt_valid_blocks)
 		se->ckpt_type = CURSEG_WARM_NODE;
@@ -3912,8 +3909,11 @@ static int traverse_dnodes(struct f2fs_sb_info *sbi,
 			goto next;
 
 		err = do_record_fsync_data(sbi, node_blk, blkaddr);
-		if (err)
+		if (err) {
+			if (err > 0)
+				err = 0;
 			break;
+		}
 
 		if (entry->blkaddr == blkaddr)
 			del_fsync_inode(entry);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
