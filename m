Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59797E4CE6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Oct 2019 15:56:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iO04w-0002Yx-5n; Fri, 25 Oct 2019 13:56:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iO04u-0002Ya-TG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 13:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uKnnAdS8jK8N50S62+tv6QjRxYJp4yoL7zFYWL+r7Uc=; b=b7OsafEGnEtCbD/Q9OwvPBefDe
 ChAiIrO5KeQq1FN2fNa/fx496rDqqQAqXZc8uwgL8kinIt3zm8XK0viJoQ31j6aG6Q9tcY5wvDzq+
 /pvTFX47i7yXHtfd2O5WdH04AUgUnZ+fxINzgsdSN/tdhYNzVsbuv+h/1zSWUwljgYA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uKnnAdS8jK8N50S62+tv6QjRxYJp4yoL7zFYWL+r7Uc=; b=heAXzSHQsD8mz1X0iAJk7A/Q3H
 dN4/E3c8vDhmioroGzfGYPPuQuipd1+Sp5bgvfSpOdlVmXuPQvaffq9pJA3et4jAZQoMG9uF86yvv
 otFcE9rtc89VFk1E8uusIU8iccN5a8SrXdwDuh0OoIVVlqr2vMbJqFQ7Y8EwlUOVvRK4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iO04g-003Hk3-JV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Oct 2019 13:56:32 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C54B222CB;
 Fri, 25 Oct 2019 13:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572011773;
 bh=NcEaAectkCFyZ7qca4yYHQDM+lDAU9HA63XtClUPuzA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uaeAnNRjOcwx6bnQ73txwedDDJ9HGmaTTkRrYOHXIuIBSiubcSNd2hdphqAbFyBHs
 jA9cq7lMXMb/IJQUUanL9NHZtzV/y1zupgPdB/ZkajETq10a2DxPlAd/bY/LiHrx4r
 aa9WrzqZCwgFMK6YlxDJlWZOkS19nfD/Uao/0a4I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 25 Oct 2019 09:55:29 -0400
Message-Id: <20191025135603.25093-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025135603.25093-1-sashal@kernel.org>
References: <20191025135603.25093-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iO04g-003Hk3-JV
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 05/37] f2fs: fix to do sanity check
 on valid node/block count
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

[ Upstream commit 7b63f72f73af57bb040f03b9713ec9979d8911f4 ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203229

- Overview
When mounting the attached crafted image, following errors are reported.
Additionally, it hangs on sync after trying to mount it.

The image is intentionally fuzzed from a normal f2fs image for testing.
Compile options for F2FS are as follows.
CONFIG_F2FS_FS=y
CONFIG_F2FS_STAT_FS=y
CONFIG_F2FS_FS_XATTR=y
CONFIG_F2FS_FS_POSIX_ACL=y
CONFIG_F2FS_CHECK_FS=y

- Reproduces
mkdir test
mount -t f2fs tmp.img test
sync

- Kernel message
 kernel BUG at fs/f2fs/recovery.c:591!
 RIP: 0010:recover_data+0x12d8/0x1780
 Call Trace:
  f2fs_recover_fsync_data+0x613/0x710
  f2fs_fill_super+0x1043/0x1aa0
  mount_bdev+0x16d/0x1a0
  mount_fs+0x4a/0x170
  vfs_kern_mount+0x5d/0x100
  do_mount+0x200/0xcf0
  ksys_mount+0x79/0xc0
  __x64_sys_mount+0x1c/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

With corrupted image wihch has out-of-range valid node/block count, during
recovery, once we failed due to no free space, it will trigger kernel
panic.

Adding sanity check on valid node/block count in f2fs_sanity_check_ckpt()
to detect such condition, so that potential panic can be avoided.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 6851afc3bf805..3fc96cffe6ac5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2344,7 +2344,8 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 	unsigned int log_blocks_per_seg;
 	unsigned int segment_count_main;
 	unsigned int cp_pack_start_sum, cp_payload;
-	block_t user_block_count;
+	block_t user_block_count, valid_user_blocks;
+	block_t avail_node_count, valid_node_count;
 	int i, j;
 
 	total = le32_to_cpu(raw_super->segment_count);
@@ -2379,6 +2380,24 @@ int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
 		return 1;
 	}
 
+	valid_user_blocks = le64_to_cpu(ckpt->valid_block_count);
+	if (valid_user_blocks > user_block_count) {
+		f2fs_msg(sbi->sb, KERN_ERR,
+			"Wrong valid_user_blocks: %u, user_block_count: %u",
+			valid_user_blocks, user_block_count);
+		return 1;
+	}
+
+	valid_node_count = le32_to_cpu(ckpt->valid_node_count);
+	avail_node_count = sbi->total_node_count - sbi->nquota_files -
+						F2FS_RESERVED_NODE_NUM;
+	if (valid_node_count > avail_node_count) {
+		f2fs_msg(sbi->sb, KERN_ERR,
+			"Wrong valid_node_count: %u, avail_node_count: %u",
+			valid_node_count, avail_node_count);
+		return 1;
+	}
+
 	main_segs = le32_to_cpu(raw_super->segment_count_main);
 	blocks_per_seg = sbi->blocks_per_seg;
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
