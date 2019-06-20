Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A93CF4D081
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 16:38:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdyCd-0001iB-1E; Thu, 20 Jun 2019 14:38:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>) id 1hdyCa-0001he-SP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SUanXXN536RfU0n2xDVJxWjxXdMJsAYrWC2IuBtDTGY=; b=CWG+UgPrztbUmImLNUH4hMp4Ji
 7bTEZ05e40W/maf7DDkE2SAOdGWUHLrRO0Op2ykeM7pk/q8X0Q6ziVnbPeNSbrevKLUQAgKVscgV3
 YHhsvmIdQiPTxFskraJfN8w9oWoTegW0U/JYmrDuNKn2PuS4ZdIC4Jewk1Ri2S86THGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SUanXXN536RfU0n2xDVJxWjxXdMJsAYrWC2IuBtDTGY=; b=GWKMYOOQcEZH4phR/DBlVeP5XR
 OSrk9phEt4a6DvpVgj2SOdf8rRmQzOo/3P8wJrpMRdkfVdn1WlBFRnXP60h5ouZQfMXmB/ALp3Q6m
 nABFAoWzybt/OfrkzP2GeJ9THhD/DO3lcrxZ1lo8hG1M++cXLOTmyS1Cl78OrXK8B5cI=;
Received: from xavier.telenet-ops.be ([195.130.132.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hdyCY-001WBy-RC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:38:14 +0000
Received: from ramsan ([84.194.111.163]) by xavier.telenet-ops.be with bizsmtp
 id T2e3200063XaVaC012e3bi; Thu, 20 Jun 2019 16:38:03 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hdyCR-0000xm-0o; Thu, 20 Jun 2019 16:38:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hdyCQ-0005Ng-VN; Thu, 20 Jun 2019 16:38:02 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Qiuyang Sun <sunqiuyang@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <yuchao0@huawei.com>
Date: Thu, 20 Jun 2019 16:38:00 +0200
Message-Id: <20190620143800.20640-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hdyCY-001WBy-RC
Subject: [f2fs-dev] [PATCH -next] f2fs: Use div_u64*() for 64-bit divisions
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
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 32-bit (e.g. m68k):

    fs/f2fs/gc.o: In function `f2fs_resize_fs':
    gc.c:(.text+0x3056): undefined reference to `__umoddi3'
    gc.c:(.text+0x30c4): undefined reference to `__udivdi3'

Fix this by using div_u64_rem() and div_u64() for 64-by-32 modulo resp.
division operations.

Reported-by: noreply@ellerman.id.au
Fixes: d2ae7494d043bfaf ("f2fs: ioctl for removing a range from F2FS")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
This assumes BLKS_PER_SEC(sbi) is 32-bit.

    #define BLKS_PER_SEC(sbi)                                       \
	    ((sbi)->segs_per_sec * (sbi)->blocks_per_seg)

Notes:
  1. f2fs_sb_info.segs_per_sec and f2fs_sb_info.blocks_per_seg are both
     unsigned int,
  2. The multiplication is done in 32-bit arithmetic, hence the result
     is of type unsigned int.
  3. Is it guaranteed that the result will always fit in 32-bit, or can
     this overflow?
  4. fs/f2fs/debug.c:update_sit_info() assigns BLKS_PER_SEC(sbi) to
     unsigned long long blks_per_sec, anticipating a 64-bit value.
---
 fs/f2fs/gc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 5b1076505ade9f84..c65f87f11de029f4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1438,13 +1438,15 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	unsigned int secs;
 	int gc_mode, gc_type;
 	int err = 0;
+	__u32 rem;
 
 	old_block_count = le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count);
 	if (block_count > old_block_count)
 		return -EINVAL;
 
 	/* new fs size should align to section size */
-	if (block_count % BLKS_PER_SEC(sbi))
+	div_u64_rem(block_count, BLKS_PER_SEC(sbi), &rem);
+	if (rem)
 		return -EINVAL;
 
 	if (block_count == old_block_count)
@@ -1463,7 +1465,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	freeze_bdev(sbi->sb->s_bdev);
 
 	shrunk_blocks = old_block_count - block_count;
-	secs = shrunk_blocks / BLKS_PER_SEC(sbi);
+	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
 	spin_lock(&sbi->stat_lock);
 	if (shrunk_blocks + valid_user_blocks(sbi) +
 		sbi->current_reserved_blocks + sbi->unusable_block_count +
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
