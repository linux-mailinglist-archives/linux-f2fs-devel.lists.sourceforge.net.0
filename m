Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB6EAD182
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 03:25:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i78RF-0008PQ-SC; Mon, 09 Sep 2019 01:25:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i78RE-0008PG-GV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 01:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UzSKnUF9CZP/jJLR7HNJFYe8k+sRYvpB9urhBh3Nwz4=; b=jpInJwOQdxbWwKjWRl1USFqzuu
 AbuZfX4DrogBh8O5ITNNcs8Wohc6z6lVYm4Gns2gKjb+XTubzEH0OZUW0zbLTKEmMCapulzxfFPA7
 mFihO+jEbaLJAveUCKvw/ViSHS/Ql1j765ZM16NSK6zxKf6txZnJy7vp4SPqVDrbdbOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UzSKnUF9CZP/jJLR7HNJFYe8k+sRYvpB9urhBh3Nwz4=; b=MAtsqMk1kfrH64U3Op6UFw2Oja
 G7Um9lFp7LEyC5c8JADaA+unhJ9VLdXC9lmLr5EAxguYvEqAetAXKhXyg80ZSsg0MXeZR56hMfac1
 kD6+q9SuHl1FkV4tk/64Cc4+oi6Em71eF6izITOqM1wCZD0VTDbVR+rndC8L9Kb+NZ7c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i78R7-00F50D-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 01:25:50 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCB5C216C8;
 Mon,  9 Sep 2019 01:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567992339;
 bh=c5iYQQVsV3m8rZv2AFPoJVLzj+j/X5goBLwITQhY718=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zcBrCtlof5t+yUkGL7CbY5BUnlu6NlVsEr+4tM4lhdyApaccv3hBYGyfrTtKPNXy+
 J21mXiHumY44/sSGKnLEQ3MIy2tXZ6G9TKOwELvnaVuoe5GG6/DKKfdrE2+HVa5XO2
 h4RcmlTjOFQK1+22GS2WSlJmOTPtK73rJWSWSltA=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Sep 2019 02:25:32 +0100
Message-Id: <20190909012532.20454-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20190909012532.20454-1-jaegeuk@kernel.org>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i78R7-00F50D-Ok
Subject: [f2fs-dev] [PATCH 2/2] f2fs: avoid infinite GC loop due to stale
 atomic files
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If committing atomic pages is failed when doing f2fs_do_sync_file(), we can
get commited pages but atomic_file being still set like:

- inmem:    0, atomic IO:    4 (Max.   10), volatile IO:    0 (Max.    0)

If GC selects this block, we can get an infinite loop like this:

f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c
f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c

In that moment, we can observe:

[Before]
Try to move 5084219 blocks (BG: 384508)
  - data blocks : 4962373 (274483)
  - node blocks : 121846 (110025)
Skipped : atomic write 4534686 (10)

[After]
Try to move 5088973 blocks (BG: 384508)
  - data blocks : 4967127 (274483)
  - node blocks : 121846 (110025)
Skipped : atomic write 4539440 (10)

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7ae2f3bd8c2f..68b6da734e5f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1997,11 +1997,11 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
 			goto err_out;
 
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
-		if (!ret) {
-			clear_inode_flag(inode, FI_ATOMIC_FILE);
-			F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
-			stat_dec_atomic_write(inode);
-		}
+
+		/* doesn't need to check error */
+		clear_inode_flag(inode, FI_ATOMIC_FILE);
+		F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
+		stat_dec_atomic_write(inode);
 	} else {
 		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
 	}
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
