Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB99E4CCE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 15:55:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iO04J-0004Ur-I9; Fri, 25 Oct 2019 13:55:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iO04J-0004Ud-24
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 13:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i47yBoLtEX5OHDXGnj9It8MhyX0drEdmEAtxxJwRr1Y=; b=ZPl/+NLoTwIFLfKJnyXtkmvvtG
 88nb8xlVXjtBQiDUzU8qPRofJEo67HvSxob1wxfhDcBYz8+yHrFvByZIY0TWboafP6XSDQ4FarGrf
 bM7o3+xGp5SPuzB49zdGmGw7K2HE0T8a47FIdfu1qWnh7BdIOXRmFFCztS92wnDfgBZ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i47yBoLtEX5OHDXGnj9It8MhyX0drEdmEAtxxJwRr1Y=; b=BsIY0NkMZcOc3NgZtzsCvQ+jgo
 2rsoDP2GzWGcS4VnU3uKeILcZELvVF/bnNa5QrLWyCxSwJfatoo1ZpvB0VFE1E+xiFGXUWaJnUi2Z
 xUpXZ4Acm6xHYrmanzZLPLgB6nhhGVRY7QgERutDRTv5lHHDbQvoz478MWeHzyQi5xx4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iO046-003Hj0-D2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 13:55:48 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D928222C4;
 Fri, 25 Oct 2019 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572011736;
 bh=XjpNedrwZm6KtqHu3SS4Z9mz31dwRV9Q1vG0fT5cI7Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=g+06tVg8qtEvGaobNrvB6aQuPinvMrBur0gt91D/UmjnIqIvMi3j2iAHhWXiG13GS
 LCLjbDRV0a8dIf57g2ju/mGlt0lpG/zOTmuIo3c69CbKtJ7tOY+W+Iyw2ImJGdGC8d
 zewv9umZZ7kSKMfpaRk57Kd3+VAs3UyTyPoEl+xs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 25 Oct 2019 09:54:50 -0400
Message-Id: <20191025135505.24762-18-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025135505.24762-1-sashal@kernel.org>
References: <20191025135505.24762-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iO046-003Hj0-D2
Subject: [f2fs-dev] [PATCH AUTOSEL 5.3 18/33] f2fs: fix to avoid discard
 command leak
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 04f9287ab395a5a279db44fb39de69b23640abb9 ]

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
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a661ac32e829e..a1ece0caad788 100644
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
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
