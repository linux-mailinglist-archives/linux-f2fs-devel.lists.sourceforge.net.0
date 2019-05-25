Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 637B62A507
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 17:08:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUYHb-0007ja-ME; Sat, 25 May 2019 15:08:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1hUYHb-0007jU-9w
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 15:08:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5Vo0VtdC9mme6NkAkSbFzW1bK5WTtBzoT+t6NVcR1Gk=; b=ExaCe+wLYHTzUL4njDjoQxVQ/0
 1pS6rMA1G3QTn/rAFxAFg61ViMBuqbLNsEey5UWpmr1PFsiLtKBFZ4ZWVyOWXqw2VaSWeAXcyCyxX
 ENl4ZKUcxMYsLgfao5apAA9tcX+peMShLNSqXO2/H6Smdp8oTTyAAaZVFf6ULDlQUQxo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5Vo0VtdC9mme6NkAkSbFzW1bK5WTtBzoT+t6NVcR1Gk=; b=IyM+VTanaTDCU2eRFxm9hVZw4D
 6EdF1gDR2qH3I1UMbiuDnOeTYOvjd34L/DGRvCzJ+QrpyH/dvw3y4rM1RiyzvntIllzZuQ4XEpjUN
 oroLZqLOkXUk5+k7trwKLs6CsSC+dfuzQrMbGbQAQiLs+fyv1ahO6dt9EGVvnwmFP/yk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUYHY-00Gkdt-VQ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 25 May 2019 15:08:26 +0000
Received: from localhost.localdomain (unknown [58.212.135.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7B8FB2075E;
 Sat, 25 May 2019 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558796896;
 bh=8+q4Zssz7rb0t6IthvndGsVaCVXTKJumxhD/Z4lonK4=;
 h=From:To:Cc:Subject:Date:From;
 b=ddTPviWhU2UKgUAASn8DJn9XZdQeiBJBaupbdkbL4hJMnWJ/DV/GbDpKMt6XDF/at
 zlkG9gsCIVGlgSwnZXEXEowNHpEVvgC2p4bt8JOgxsAKjuuuBfN00Gjf+lc6k0pDam
 A7fE0gd95YmLpIaCoSYUwB4nfhst2rPz29KGzPJI=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 25 May 2019 23:07:25 +0800
Message-Id: <20190525150725.3113-1-chao@kernel.org>
X-Mailer: git-send-email 2.18.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: run.sh]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hUYHY-00Gkdt-VQ
Subject: [f2fs-dev] [PATCH v3] f2fs: fix to do sanity check on segment
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

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
v3:
- make sanity_check_curseg() static.
 fs/f2fs/segment.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 5f6e4cd2eff2..a034e0da004a 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4239,6 +4239,41 @@ static int build_dirty_segmap(struct f2fs_sb_info *sbi)
 	return init_victim_secmap(sbi);
 }
 
+static int sanity_check_curseg(struct f2fs_sb_info *sbi)
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
@@ -4334,6 +4369,10 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
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
2.18.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
