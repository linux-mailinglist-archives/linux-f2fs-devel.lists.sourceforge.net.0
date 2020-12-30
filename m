Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 222BA2E78E3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Dec 2020 14:04:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kub9N-0005yt-Sv; Wed, 30 Dec 2020 13:04:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kub9M-0005yH-1F
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=drlyZczFzgum9G7DM+4VIJIIxiOCY58Ww9KZ5iaDhac=; b=O5ygORDHImLklNcbpH7HPBMBoA
 oFltkbNoO44oBANusOFkTMt7cErpsH8euzHUsq7VKuXD1Hrup5I2gX1ZblQhYGp3HTo44TF4bhku4
 HcbO5e+a6UQGvhbnxYE4eayIeAP+wCI0YlGRFK0yMQHZ/Zdzcri1sZuhtLTXLU7btCFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=drlyZczFzgum9G7DM+4VIJIIxiOCY58Ww9KZ5iaDhac=; b=LMT4XNz6YIhmzbb7DqbinY5y4B
 xv0uyPCDXvIePjNs8/u+pTRYXBR+mbZZTBanzyGy5/4KvMNY86ZUmskDlQGS1wrPk6rXJQYpoTlxd
 ieghAkzDCxEg+Mx74URdGtz66su0Mttxnx5E88ERCGlTUvyTsN29o+g23sMm3Mn2li6M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kub9I-00CaIo-7D
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Dec 2020 13:04:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D779522525;
 Wed, 30 Dec 2020 13:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333454;
 bh=WYb2duQZGWjW6kkmZ84OmBHeYyl/2vXnfQl+M/s2Ksw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MXmcl1wmdlaGqrz1tPVEkKNMHrtDueCEHTgTwDXqDaYROR+uvaJ6pMRyEP94yDQXX
 dCTRRAsYu4Ez9SY025TFhGR5GqHQFYWGgbUkxmEago5HPyYdR4ATO5wbV++eZorQs8
 h3VMiqgBkP/7PDSOLNw9fYlZSq7BXxAo++8Yp3mdXC1ltu4w9F4O+ENfoQTFdocpXr
 EuvH5fqX9FSW6jbUSJvt6Feb0hCId6G+EIQkbip+lzUQWCUZJeq7brCkkl0bM8YkvS
 gGP5vGG5nfI9KBHwP8KQ6xYdoGNFPqFxG0fHrtWExFAlgz6JgeLQLLlnup31EwjBHL
 oO1MCyP4wAFCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 30 Dec 2020 08:03:52 -0500
Message-Id: <20201230130357.3637261-12-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130357.3637261-1-sashal@kernel.org>
References: <20201230130357.3637261-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kub9I-00CaIo-7D
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 12/17] f2fs: fix shift-out-of-bounds
 in sanity_check_raw_super()
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
Cc: Sasha Levin <sashal@kernel.org>,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit e584bbe821229a3e7cc409eecd51df66f9268c21 ]

syzbot reported a bug which could cause shift-out-of-bounds issue,
fix it.

Call Trace:
 __dump_stack lib/dump_stack.c:79 [inline]
 dump_stack+0x107/0x163 lib/dump_stack.c:120
 ubsan_epilogue+0xb/0x5a lib/ubsan.c:148
 __ubsan_handle_shift_out_of_bounds.cold+0xb1/0x181 lib/ubsan.c:395
 sanity_check_raw_super fs/f2fs/super.c:2812 [inline]
 read_raw_super_block fs/f2fs/super.c:3267 [inline]
 f2fs_fill_super.cold+0x16c9/0x16f6 fs/f2fs/super.c:3519
 mount_bdev+0x34d/0x410 fs/super.c:1366
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1496
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3227
 do_mount fs/namespace.c:3240 [inline]
 __do_sys_mount fs/namespace.c:3448 [inline]
 __se_sys_mount fs/namespace.c:3425 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3425
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Reported-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fa461db696e79..a9a083232bcfc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2523,7 +2523,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	block_t total_sections, blocks_per_seg;
 	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
 					(bh->b_data + F2FS_SUPER_OFFSET);
-	unsigned int blocksize;
 	size_t crc_offset = 0;
 	__u32 crc = 0;
 
@@ -2557,10 +2556,10 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	}
 
 	/* Currently, support only 4KB block size */
-	blocksize = 1 << le32_to_cpu(raw_super->log_blocksize);
-	if (blocksize != F2FS_BLKSIZE) {
-		f2fs_info(sbi, "Invalid blocksize (%u), supports only 4KB",
-			  blocksize);
+	if (le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE_BITS) {
+		f2fs_info(sbi, "Invalid log_blocksize (%u), supports only %u",
+			  le32_to_cpu(raw_super->log_blocksize),
+			  F2FS_BLKSIZE_BITS);
 		return -EFSCORRUPTED;
 	}
 
-- 
2.27.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
