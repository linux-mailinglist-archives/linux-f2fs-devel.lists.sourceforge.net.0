Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF48402B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jan 2024 11:23:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rUOnL-0001GL-NO;
	Mon, 29 Jan 2024 10:23:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rUOnK-0001GD-Gb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FOokTu0s+bVReKHVSYa0qE6gIQjcvqYd+nCqBdDRciw=; b=lvNY0xfZDei2ceFRyg79Z0rYah
 Zu7ureNliYGzsTJy1JNChOLmY/PzjIBrGq7nmVrFffRtOvlft2zS42R49h8ueInEkiQj2OGdk8yCp
 RpaGpy2gpxZFaIUAB+XtFylHk6gK27bD9cwtz8a47XXLQaAhjRg8khuvoS0VTEskZ6a4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FOokTu0s+bVReKHVSYa0qE6gIQjcvqYd+nCqBdDRciw=; b=V
 EvatOHu4Tx2t0fMI4j90dMTDomgoGT72jLJaxKQzJMsB/ez0o3GnvubUiFfmFFLoXLm2FRofhzZA8
 cBEOxqz+uAZmH5WhmYo0H3zYQHMljumHQJ0RJJuFZCGK/m9iqs52TLnCAIfbpgCxGRWu58kgKfcMP
 phYnbzxCqX0ncn/s=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rUOnJ-0005Ev-GF for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jan 2024 10:23:15 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 40TAMIU1022567;
 Mon, 29 Jan 2024 18:22:18 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4TNkgT6m5Qz2R5Td1;
 Mon, 29 Jan 2024 18:14:45 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Mon, 29 Jan 2024 18:22:17 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 29 Jan 2024 18:22:01 +0800
Message-ID: <1706523721-24657-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 40TAMIU1022567
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When CONFIG_F2FS_CHECK_FS is not enabled, f2fs_bug_on just
 printing warning, get_new_segment may get an out-of-bounds segment when there
 is no free segments. Then a block is allocated from this invali [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rUOnJ-0005Ev-GF
Subject: [f2fs-dev] [PATCH 2/3] f2fs: fix panic issue in update_sit_entry
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When CONFIG_F2FS_CHECK_FS is not enabled, f2fs_bug_on just printing
warning, get_new_segment may get an out-of-bounds segment when there
is no free segments. Then a block is allocated from this invalid
segment, update_sit_entry will access the invalid bitmap address,
cause system panic. Just as below call stack:

f2fs_allocate_data_block get a block address with 0x4000 and
partition size is 64MB

[   13.401997] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[   13.402003] Mem abort info:
[   13.402006]   ESR = 0x96000005
[   13.402009]   EC = 0x25: DABT (current EL), IL = 32 bits
[   13.402015]   SET = 0, FnV = 0
[   13.402018]   EA = 0, S1PTW = 0
[   13.402021]   FSC = 0x05: level 1 translation fault
[   13.402025] Data abort info:
[   13.402027]   ISV = 0, ISS = 0x00000005
[   13.402030]   CM = 0, WnR = 0
[   13.402034] user pgtable: 4k pages, 39-bit VAs, pgdp=00000001066ab000
[   13.402038] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
[   13.402052] Internal error: Oops: 96000005 [#1] PREEMPT SMP
[   13.489854] pc : update_sit_entry+0x128/0x420
[   13.490497] lr : f2fs_allocate_data_block+0x6b0/0xc2c
[   13.491218] sp : ffffffc00e023440
[   13.501530] Call trace:
[   13.501930]  update_sit_entry+0x128/0x420
[   13.502523]  f2fs_allocate_data_block+0x6b0/0xc2c
[   13.503203]  do_write_page+0xf0/0x1d4
[   13.503752]  f2fs_outplace_write_data+0x68/0xfc
[   13.504408]  f2fs_do_write_data_page+0x3a8/0x65c
[   13.505076]  move_data_page+0x294/0x7a8
[   13.505647]  gc_data_segment+0x4b8/0x800
[   13.506229]  do_garbage_collect+0x354/0x674
[   13.506843]  f2fs_gc+0x280/0x68c
[   13.507340]  f2fs_balance_fs+0x104/0x144
[   13.507921]  f2fs_create+0x310/0x3d8
[   13.508458]  path_openat+0x53c/0xc28
[   13.508997]  do_filp_open+0xbc/0x16c
[   13.509535]  do_sys_openat2+0xa0/0x2a0

So sanity check should be add in update_sit_entry.
Also remove some redundant judgment code.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/segment.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ad6511f..f373ff7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2399,6 +2399,8 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 #endif
 
 	segno = GET_SEGNO(sbi, blkaddr);
+	if (segno == NULL_SEGNO)
+		return;
 
 	se = get_seg_entry(sbi, segno);
 	new_vblocks = se->valid_blocks + del;
@@ -3464,8 +3466,7 @@ void f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
 	 * since SSR needs latest valid block information.
 	 */
 	update_sit_entry(sbi, *new_blkaddr, 1);
-	if (GET_SEGNO(sbi, old_blkaddr) != NULL_SEGNO)
-		update_sit_entry(sbi, old_blkaddr, -1);
+	update_sit_entry(sbi, old_blkaddr, -1);
 
 	/*
 	 * If the current segment is full, flush it out and replace it with a
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
