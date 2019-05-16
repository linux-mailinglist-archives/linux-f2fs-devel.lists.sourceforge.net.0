Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 876432029A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2019 11:32:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hRCkg-0002Xr-Ps; Thu, 16 May 2019 09:32:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hRCke-0002Xg-Qd
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 09:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RPmL3byAOU06CRhzzvDiOhhq1cRNk3HySEFcD7HoULU=; b=gPJhEqhyLVwI41QpFeOFWxviwf
 OiqTXqrwOXOAG+NwdAhJtV6nU2xUVqjQrNxh7540nC+9qxaxTdsZB+xHvefAJ3zOKyshLoyluGTXs
 vABPF3m+TxEfGLv4gNL9Ri99+TdR55Wl07aS2qw55g8vMdgyEt1Vobdw1gC3W88x0GRA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RPmL3byAOU06CRhzzvDiOhhq1cRNk3HySEFcD7HoULU=; b=j
 LlyTnk/hS9YRKLUQW88rxxPAYvuKJgYeIeskI1WX6bHI9x5OZyN0h1yCL4EO4jZ1hWeRqoTV4tPPF
 DexTHy+54deERwFuNOcwTGLF0IbvG63xJcztjeHShoDrYYRWqRE2VE5T7lUunuQVoD9IrGRmmAywG
 2yX5Yd9L1vVyqon8=;
Received: from szxga08-in.huawei.com ([45.249.212.255] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hRCkb-000aFH-45
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 May 2019 09:32:36 +0000
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.55])
 by Forcepoint Email with ESMTP id 15CE6A6871E7863AB5C8;
 Thu, 16 May 2019 17:32:24 +0800 (CST)
Received: from dggeme763-chm.china.huawei.com (10.3.19.109) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 May 2019 17:32:23 +0800
Received: from szvp000201624.huawei.com (10.120.216.130) by
 dggeme763-chm.china.huawei.com (10.3.19.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 16 May 2019 17:32:23 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 16 May 2019 17:32:13 +0800
Message-ID: <20190516093213.72645-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggeme763-chm.china.huawei.com (10.3.19.109)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hRCkb-000aFH-45
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check on segment
 bitmap of LFS curseg
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Jungyeon Reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203233

- Reproduces
gcc poc_13.c
./run.sh f2fs

- Kernel messages
 F2FS-fs (sdb): Bitmap was wrongly set, blk:4608
 kernel BUG at fs/f2fs/segment.c:2133!
 RIP: 0010:update_sit_entry+0x35d/0x3e0
 Call Trace:
  f2fs_allocate_data_block+0x16c/0x5a0
  do_write_page+0x57/0x100
  f2fs_do_write_node_page+0x33/0xa0
  __write_node_page+0x270/0x4e0
  f2fs_sync_node_pages+0x5df/0x670
  f2fs_write_checkpoint+0x364/0x13a0
  f2fs_sync_fs+0xa3/0x130
  f2fs_do_sync_file+0x1a6/0x810
  do_fsync+0x33/0x60
  __x64_sys_fsync+0xb/0x10
  do_syscall_64+0x43/0x110
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The testcase fails because that, in fuzzed image, current segment was
allocated with LFS type, its .next_blkoff should point to an unused
block address, but actually, its bitmap shows it's not. So during
allocation, f2fs crash when setting bitmap.

Introducing sanity_check_curseg() to check such inconsistence of
current in-used segment.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- check .next_blkoff for SSR curseg.
 fs/f2fs/segment.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8dee063c833f..b5f21909356f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4232,6 +4232,41 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
 	return init_victim_secmap(sbi);
 }
 
+int sanity_check_curseg(struct f2fs_sb_info *sbi)
+{
+	int i;
+
+	/*
+	 * In LFS/SSR curseg, .next_blkoff should point to an unused blkaddr;
+	 * In LFS curseg, all blkaddr after .next_blkoff should be unused.
+	 */
+	for (i = 0; i < NO_CHECK_TYPE; i++) {
+		struct curseg_info *curseg = CURSEG_I(sbi, i);
+		struct seg_entry *se = get_seg_entry(sbi, curseg->segno);
+		unsigned int blkofs = curseg->next_blkoff;
+
+		if (f2fs_test_bit(blkofs, se->cur_valid_map))
+			goto out;
+
+		if (curseg->alloc_type == SSR)
+			continue;
+
+		for (blkofs += 1; blkofs < sbi->blocks_per_seg; blkofs++) {
+			if (!f2fs_test_bit(blkofs, se->cur_valid_map))
+				continue;
+out:
+			f2fs_msg(sbi->sb, KERN_ERR,
+				"Current segment's next free block offset is "
+				"inconsistent with bitmap, logtype:%u, "
+				"segno:%u, type:%u, next_blkoff:%u, blkofs:%u",
+				i, curseg->segno, curseg->alloc_type,
+				curseg->next_blkoff, blkofs);
+			return -EINVAL;
+		}
+	}
+	return 0;
+}
+
 /*
  * Update min, max modified time for cost-benefit GC algorithm
  */
@@ -4327,6 +4362,10 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 	if (err)
 		return err;
 
+	err = sanity_check_curseg(sbi);
+	if (err)
+		return err;
+
 	init_min_max_mtime(sbi);
 	return 0;
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
