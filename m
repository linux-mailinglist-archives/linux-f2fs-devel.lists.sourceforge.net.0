Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DB431C5F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3wr-00010X-Py; Sat, 01 Jun 2019 13:21:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3wq-00010D-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t7UX95jx11THNa1pOj7vN0vE9OaHxNXTUowBgZSEZRM=; b=EmXShzUZjLLMD1pv9ytbUpE/Zd
 pUUKzi/ZUHudLfdYmUSRwufLpNGwat9IHIVBBq5347cceRDB8YWf7KBOhF5y5Yezw+WSTDlACUCgJ
 s+aFN/GYCp+I9p1z7lN5IfsCpoAHE3Rdsf06K6dKVsOzqJ4rdHkvwPCmODi/dWv/BkJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t7UX95jx11THNa1pOj7vN0vE9OaHxNXTUowBgZSEZRM=; b=azr9jbtXxX/chNWK8GzOJutJlU
 fYCJ+ZkCJwIndgjVUN1U4N94IT5cyr2qliirEA2GaGUZ7ZH21C0SKGA5/tWvcD6rugBf1xCG9QbJJ
 1nirJaXM/F3BXqlFgH1bMsozKiyD1xUuJC0VgZ5K/koW2SQeIsY5lqPc3wxIxabcvQnc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3wp-0058I5-7s
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0BFDC27306;
 Sat,  1 Jun 2019 13:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395277;
 bh=lto4uKj0I1kt3M2FNnSTn8NQADKxrJcUxNIx3W2cx/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M1sbpqkvTDub9T6L5LbTeiR9EHq5zKGL2ivr12y2ST02BYi+DZ8hRsmEGB8mZKJO9
 wE25hzSqWmNaY9eHnSjIg4EGyQaJpFsMnfWeCPGFupK0hnB2PXH9nTRUuTpbg27h91
 rHfwns2E20bcgt5jyvRm4e2bOvoL4hX4kyMQE1oo=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:13 -0400
Message-Id: <20190601131934.25053-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3wp-0058I5-7s
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 041/173] f2fs: fix to avoid panic in
 f2fs_inplace_write_data()
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

[ Upstream commit 05573d6ccf702df549a7bdeabef31e4753df1a90 ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203239

- Overview
When mounting the attached crafted image and running program, following errors are reported.
Additionally, it hangs on sync after running program.

The image is intentionally fuzzed from a normal f2fs image for testing.
Compile options for F2FS are as follows.
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_CHECK_FS=y

- Reproduces
cc poc_15.c
./run.sh f2fs
sync

- Kernel messages
 ------------[ cut here ]------------
 kernel BUG at fs/f2fs/segment.c:3162!
 RIP: 0010:f2fs_inplace_write_data+0x12d/0x160
 Call Trace:
  f2fs_do_write_data_page+0x3c1/0x820
  __write_data_page+0x156/0x720
  f2fs_write_cache_pages+0x20d/0x460
  f2fs_write_data_pages+0x1b4/0x300
  do_writepages+0x15/0x60
  __filemap_fdatawrite_range+0x7c/0xb0
  file_write_and_wait_range+0x2c/0x80
  f2fs_do_sync_file+0x102/0x810
  do_fsync+0x33/0x60
  __x64_sys_fsync+0xb/0x10
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

The reason is f2fs_inplace_write_data() will trigger kernel panic due
to data block locates in node type segment.

To avoid panic, let's just return error code and set SBI_NEED_FSCK to
give a hint to fsck for latter repairing.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2b809b54d81bb..b3f1f75af05cc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3170,13 +3170,18 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 {
 	int err;
 	struct f2fs_sb_info *sbi = fio->sbi;
+	unsigned int segno;
 
 	fio->new_blkaddr = fio->old_blkaddr;
 	/* i/o temperature is needed for passing down write hints */
 	__get_segment_type(fio);
 
-	f2fs_bug_on(sbi, !IS_DATASEG(get_seg_entry(sbi,
-			GET_SEGNO(sbi, fio->new_blkaddr))->type));
+	segno = GET_SEGNO(sbi, fio->new_blkaddr);
+
+	if (!IS_DATASEG(get_seg_entry(sbi, segno)->type)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		return -EFAULT;
+	}
 
 	stat_inc_inplace_blocks(fio->sbi);
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
