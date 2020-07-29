Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567F2319FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 09:03:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0g76-0001wO-J9; Wed, 29 Jul 2020 07:02:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k0g74-0001wC-Sh
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 07:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O0Qs6FNPWR3Uw7NQQ64Eec1/TRTmwikPksHxVzrFFaA=; b=PdNX7QsbUqJYZKTQNZw/vca7ZD
 P9yr7KJwnCanZDY2w5r9MkwC+hnO5MzzKXDcmoXN6cOlyB5KnTyi/BAm1y+jKOXc+hlWb8EWd9/Cm
 cbKbZO7rN9rkCobCsbj2e9LQaax8S7ITXxQzRg2mV2au1IrdO2ADeKp7cSYCnxoCMD1E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=O0Qs6FNPWR3Uw7NQQ64Eec1/TRTmwikPksHxVzrFFaA=; b=a
 IdElEoKt18NzmanEZeUKJHyu2UJSmXez82A0mrrLI9af/gDzlyaKwYCOSbP7qbyObHKVB9xfLw0qK
 DL5mt0ICjLypbR7GFe8e/YAO7KDflKe9pjirldhGE5HgUDyVaUqZIovLyuHIv5OIKTrzeWzykohaY
 CP0KR2PeZ0ivMYZA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0g73-002vlP-15
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 07:02:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D99112070B;
 Wed, 29 Jul 2020 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596006166;
 bh=PsG28ZKBgOwqSDbxUyTDDzHrSZ08sLR2QQcOJCPJkbg=;
 h=From:To:Cc:Subject:Date:From;
 b=KlNOKaUxeBPVXLkj+pydQcG5m7sPnUW6DnUrO1n1hlDwdy6+BUgLgBCkM9dPrv6uh
 o6+5xOO/UsOYrvMc97JJNWyz1cNIUoHVG6BIf+NEkzghCrLt81UkA6YZQSWmcmfEZp
 /JJ3LPd10QyBCUSEbkgjBSsvpB+t/zQe3qdvyi/g=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 29 Jul 2020 00:02:44 -0700
Message-Id: <20200729070244.584518-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
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
X-Headers-End: 1k0g73-002vlP-15
Subject: [f2fs-dev] [PATCH] f2fs: fix deadlock between quota writes and
 checkpoint
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_write_data_pages(quota_mapping)
 __f2fs_write_data_pages             f2fs_write_checkpoint
  * blk_start_plug(&plug);
  * add bio in write_io[DATA]
                                      - block_operations
                                      - skip syncing quota by
                                                >DEFAULT_RETRY_QUOTA_FLUSH_COUNT
                                      - down_write(&sbi->node_write);
  - f2fs_write_single_data_page
    - f2fs_do_write_data_page
      - f2fs_outplace_write_data
        - do_write_page
           - f2fs_allocate_data_block
            - down_write(node_write)
                                      - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA);

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 8c782d3f324f0..99c8061da55b9 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1269,6 +1269,8 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 		if (type == F2FS_DIRTY_META)
 			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
 							FS_CP_META_IO);
+		else if (type == F2FS_WB_CP_DATA)
+			f2fs_submit_merged_write(sbi, DATA);
 		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	}
 	finish_wait(&sbi->cp_wait, &wait);
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
