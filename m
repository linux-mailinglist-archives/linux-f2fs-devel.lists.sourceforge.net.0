Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB363204BB
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Feb 2021 10:36:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lDOgT-0008UK-Cs; Sat, 20 Feb 2021 09:36:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lDOgQ-0008Tn-Om
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:36:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zafii94NULn0362N5yv+tj8AXCFTcHJKEwKo4m99SmQ=; b=Cx1lwL2nt2/Eud1TwVAYLJ+KIm
 Gq/zNORi2nl+ctvW/fx84C+aRqTf37Ip8n8TkBgOERN5ot+odMELGj4It6zl2PQuwNYSGI4liPjSD
 5jF3ctf/0VcRvTnCBCx400IhOPYpBE1rD6Gfehovyy8Oosa1UDmWWa81K/c6gYK7PbvI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zafii94NULn0362N5yv+tj8AXCFTcHJKEwKo4m99SmQ=; b=BUTRzDZSuqpsENjBUG8cX476VG
 FVLuqwBpxuYwGsJe3xUXw7/n1XPdQITf2c+IdkoHuyMCAjtzBw2yBk6ZVcXMuP69osOBJAZeNldWE
 cgLuMPTDOsYcMoE9kUuDKKnve2KSpszh0T9fdcF4DmxqmNxeDzQeyTJFPArfWSq1IaO8=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lDOgF-00GNsr-49
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Feb 2021 09:36:08 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DjNZR21CWzjPMh;
 Sat, 20 Feb 2021 17:34:39 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 20 Feb 2021 17:35:44 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 20 Feb 2021 17:35:41 +0800
Message-ID: <20210220093541.63899-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210220093541.63899-1-yuchao0@huawei.com>
References: <20210220093541.63899-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lDOgF-00GNsr-49
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix panic during f2fs_resize_fs()
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

f2fs_resize_fs() hangs in below callstack with testcase:
- mkfs 16GB image & mount image
- dd 8GB fileA
- dd 8GB fileB
- sync
- rm fileA
- sync
- resize filesystem to 8GB

kernel BUG at segment.c:2484!
Call Trace:
 allocate_segment_by_default+0x92/0xf0 [f2fs]
 f2fs_allocate_data_block+0x44b/0x7e0 [f2fs]
 do_write_page+0x5a/0x110 [f2fs]
 f2fs_outplace_write_data+0x55/0x100 [f2fs]
 f2fs_do_write_data_page+0x392/0x850 [f2fs]
 move_data_page+0x233/0x320 [f2fs]
 do_garbage_collect+0x14d9/0x1660 [f2fs]
 free_segment_range+0x1f7/0x310 [f2fs]
 f2fs_resize_fs+0x118/0x330 [f2fs]
 __f2fs_ioctl+0x487/0x3680 [f2fs]
 __x64_sys_ioctl+0x8e/0xd0
 do_syscall_64+0x33/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The root cause is we forgot to check that whether we have enough space
in resized filesystem to store all valid blocks in before-resizing
filesystem, then allocator will run out-of-space during block migration
in free_segment_range().

Fixes: b4b10061ef98 ("f2fs: refactor resize_fs to avoid meta updates in progress")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index b3af76340026..86ba8ed0b8a7 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1977,7 +1977,20 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 
 	/* stop CP to protect MAIN_SEC in free_segment_range */
 	f2fs_lock_op(sbi);
+
+	spin_lock(&sbi->stat_lock);
+	if (shrunk_blocks + valid_user_blocks(sbi) +
+		sbi->current_reserved_blocks + sbi->unusable_block_count +
+		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
+		err = -ENOSPC;
+	spin_unlock(&sbi->stat_lock);
+
+	if (err)
+		goto out_unlock;
+
 	err = free_segment_range(sbi, secs, true);
+
+out_unlock:
 	f2fs_unlock_op(sbi);
 	up_write(&sbi->gc_lock);
 	if (err)
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
