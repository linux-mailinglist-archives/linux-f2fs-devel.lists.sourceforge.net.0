Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B70F6E195
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Jul 2019 09:19:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hoNAb-0006T4-6c; Fri, 19 Jul 2019 07:19:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hoNAa-0006Sp-3E
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 07:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBLKs1xVtjXEZvk8GMueoMbYM7n5TKRPyTEPK3lz+jg=; b=AnVMGVT+bXiQYawy2Zor6AUs1s
 6cJdOz6LP21d0mWeTontVS5TTal2O0bVSPidrBIqhd0a1HawQ3G9kwuIUGVs8F+gA3vGbWNA2Dy1E
 /HSGD6VYORuaQAg1GNVGfk9ORBMo4Jj/lP3l7HOwhYZLVjSG36KwoZX+Ka/CbSoeHDFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DBLKs1xVtjXEZvk8GMueoMbYM7n5TKRPyTEPK3lz+jg=; b=m
 q30Q9z8QFGW4idLOJhd+xHT3PfG09omdtiUGlFwSCnjLPE4l3H9oPIqT1jHzoTnYJ+GFFurSIZyFI
 55tfVyKCSiZW2kapscztTW0TGtUsjvwFjA1NPYLlpOUUdrzyA+/NvroGp9VxbZ3mfzaqnY3Q3Hff4
 0iyEjjfY00qslevU=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hoNAY-0087WH-5P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 19 Jul 2019 07:19:08 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 64A8F54C5AA7980B1836;
 Fri, 19 Jul 2019 15:18:58 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 19 Jul 2019 15:18:48 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 19 Jul 2019 15:18:44 +0800
Message-ID: <20190719071844.5690-1-yuchao0@huawei.com>
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
X-Headers-End: 1hoNAY-0087WH-5P
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid discard command leak
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

 =============================================================================
 BUG discard_cmd (Tainted: G    B      OE  ): Objects remaining in discard_cmd on __kmem_cache_shutdown()
 -----------------------------------------------------------------------------

 INFO: Slab 0xffffe1ac481d22c0 objects=36 used=2 fp=0xffff936b4748bf50 flags=0x2ffff0000000100
 Call Trace:
  dump_stack+0x63/0x87
  slab_err+0xa1/0xb0
  __kmem_cache_shutdown+0x183/0x390
  shutdown_cache+0x14/0x110
  kmem_cache_destroy+0x195/0x1c0
  f2fs_destroy_segment_manager_caches+0x21/0x40 [f2fs]
  exit_f2fs_fs+0x35/0x641 [f2fs]
  SyS_delete_module+0x155/0x230
  ? vtime_user_exit+0x29/0x70
  do_syscall_64+0x6e/0x160
  entry_SYSCALL64_slow_path+0x25/0x25

 INFO: Object 0xffff936b4748b000 @offset=0
 INFO: Object 0xffff936b4748b070 @offset=112
 kmem_cache_destroy discard_cmd: Slab cache still has objects
 Call Trace:
  dump_stack+0x63/0x87
  kmem_cache_destroy+0x1b4/0x1c0
  f2fs_destroy_segment_manager_caches+0x21/0x40 [f2fs]
  exit_f2fs_fs+0x35/0x641 [f2fs]
  SyS_delete_module+0x155/0x230
  do_syscall_64+0x6e/0x160
  entry_SYSCALL64_slow_path+0x25/0x25

Recovery can cache discard commands, so in error path of fill_super(),
we need give a chance to handle them, otherwise it will lead to leak
of discard_cmd slab cache.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 57a83a68ae03..449ef70d99cc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2084,6 +2084,13 @@ static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
 
 	f2fs_stop_discard_thread(sbi);
 
+	/*
+	 * Recovery can cache discard commands, so in error path of
+	 * fill_super(), it needs to give a chance to handle them.
+	 */
+	if (unlikely(atomic_read(&dcc->discard_cmd_cnt)))
+		f2fs_issue_discard_timeout(sbi);
+
 	kvfree(dcc);
 	SM_I(sbi)->dcc_info = NULL;
 }
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
