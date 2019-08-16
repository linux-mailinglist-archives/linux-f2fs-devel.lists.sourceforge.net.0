Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF628F95B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 05:04:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hySXL-0007vq-Sj; Fri, 16 Aug 2019 03:04:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hySXK-0007vT-6P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 03:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lBaRpNg3I4FFT/oJc2BBHj+ZoDhPks0+8rMA3I520E0=; b=Ku4VU15j8HwQcFmUuKZLUEMZD5
 1EnhppOymjni9P9B0SGR+D56GwgVZrD1Nb1xpisTTzulquA1i4jhS93OXRB+rCIlhqOoUPqcyuNrb
 rsg3DLvwt7UrDgvyJ3xr0SjKrhBigjg+8uHMXWLWzgcLT0NUYVeaNKfmhiQq+Tv8BFfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lBaRpNg3I4FFT/oJc2BBHj+ZoDhPks0+8rMA3I520E0=; b=D
 D5OTqFxLwg43/U01PIVNMAAHo1v6H2mnhTzJQJ4Ft4QMF6el+0ygn79TlPiD3qaszHSX9/q5zXcXJ
 LYW6FZN8ay4D6Io1S9cm5uAMEDIOfGjAgTE6z26DFfeZt88xgGVkMtjHSbxn2EUkj42mfoGmNEOkq
 fAQyBS1kylWJ+luE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hySX6-005QZj-86
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 03:04:17 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 22A01A017554AFE3FD6A;
 Fri, 16 Aug 2019 11:03:57 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 16 Aug 2019 11:03:50 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 16 Aug 2019 11:03:34 +0800
Message-ID: <20190816030334.81035-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
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
X-Headers-End: 1hySX6-005QZj-86
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid data corruption by forbidding
 SSR overwrite
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

There is one case can cause data corruption.

- write 4k to fileA
- fsync fileA, 4k data is writebacked to lbaA
- write 4k to fileA
- kworker flushs 4k to lbaB; dnode contain lbaB didn't be persisted yet
- write 4k to fileB
- kworker flush 4k to lbaA due to SSR
- SPOR -> dnode with lbaA will be recovered, however lbaA contains fileB's
data

One solution is tracking all fsynced file's block history, and disallow
SSR overwrite on newly invalidated block on that file.

However, during recovery, no matter the dnode is flushed or fsynced, all
previous dnodes until last fsynced one in node chain can be recovered,
that means we need to record all block change in flushed dnode, which
will cause heavy cost, so let's just use simple fix by forbidding SSR
overwrite directly.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9d9d9a050d59..69b3b553ee6b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2205,9 +2205,11 @@ static void update_sit_entry(struct f2fs_sb_info *sbi, block_t blkaddr, int del)
 		if (!f2fs_test_and_set_bit(offset, se->discard_map))
 			sbi->discard_blks--;
 
-		/* don't overwrite by SSR to keep node chain */
-		if (IS_NODESEG(se->type) &&
-				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
+		/*
+		 * SSR should never reuse block which is checkpointed
+		 * or newly invalidated.
+		 */
+		if (!is_sbi_flag_set(sbi, SBI_CP_DISABLED)) {
 			if (!f2fs_test_and_set_bit(offset, se->ckpt_valid_map))
 				se->ckpt_valid_blocks++;
 		}
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
