Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5097831CAA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:23:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3yt-0001Eg-0E; Sat, 01 Jun 2019 13:23:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3yr-0001EG-Bv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UeNtLSfOWo6JU2/HcxMFrkO3Op/uOUMkfK3rN/w6NPI=; b=XzmHFidMbJzxFzm4C7Kl2hRUtw
 I1EsneDq02ecEq7sL3XJrM88hCVOGCnRVdsIxbzztomvkQfnw2vKs+SFEgzdzuM9G5VDq5JxcoLPU
 lnEYCN5AbJkZUBbhc+OP7hISwu0rXBryu9f9bBrJU/zI5/n+cQCuzYPgibwred1ly4/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UeNtLSfOWo6JU2/HcxMFrkO3Op/uOUMkfK3rN/w6NPI=; b=hA2RmXGzTtX+lGj+uk7Oojetge
 e5HARjk7TRmRa/2JBfW5pqpdfllvYSBahD+etatib26T5rvbcRMATIuPvHVwfmNTKwaGR6SdOCNK0
 jqvLS2uBpkkMGLTcZAl9lPxELZ7sV55uJKqAzJ99hMh0PKdmTNA1i7wkXDthJhTj8xLw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3yp-00EcSP-LX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:28 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E8F827359;
 Sat,  1 Jun 2019 13:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395401;
 bh=IJgCsnCscmaIOUw0lpzQ4vvjmabqAz71RYqBpOX1BwY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IKsB+gV0bft1YBQ6Mk+MdmQwT3USMdMVy4VpDxK4arhL/80k4ThetaFxsSGynvk5p
 h1XLAEw1pUNvDqk36Ii8zCbv5f0mMDO7NtLINsGvzBqrAoQoTp1mdP4qxWyFHiDTXH
 1rZs++QlBrG+XLDLZBy7Q4CIX9VWzyQ6DH3NwXnM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:20:17 -0400
Message-Id: <20190601132158.25821-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132158.25821-1-sashal@kernel.org>
References: <20190601132158.25821-1-sashal@kernel.org>
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
X-Headers-End: 1hX3yp-00EcSP-LX
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 041/141] f2fs: fix to do sanity
 check on valid block count of segment
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

[ Upstream commit e95bcdb2fefa129f37bd9035af1d234ca92ee4ef ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203233

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
cc poc_13.c
mkdir test
mount -t f2fs tmp.img test
cp a.out test
cd test
sudo ./a.out
sync

- Kernel messages
 F2FS-fs (sdb): Bitmap was wrongly set, blk:4608
 kernel BUG at fs/f2fs/segment.c:2102!
 RIP: 0010:update_sit_entry+0x394/0x410
 Call Trace:
  f2fs_allocate_data_block+0x16f/0x660
  do_write_page+0x62/0x170
  f2fs_do_write_node_page+0x33/0xa0
  __write_node_page+0x270/0x4e0
  f2fs_sync_node_pages+0x5df/0x670
  f2fs_write_checkpoint+0x372/0x1400
  f2fs_sync_fs+0xa3/0x130
  f2fs_do_sync_file+0x1a6/0x810
  do_fsync+0x33/0x60
  __x64_sys_fsync+0xb/0x10
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

sit.vblocks and sum valid block count in sit.valid_map may be
inconsistent, segment w/ zero vblocks will be treated as free
segment, while allocating in free segment, we may allocate a
free block, if its bitmap is valid previously, it can cause
kernel crash due to bitmap verification failure.

Anyway, to avoid further serious metadata inconsistence and
corruption, it is necessary and worth to detect SIT
inconsistence. So let's enable check_block_count() to verify
vblocks and valid_map all the time rather than do it only
CONFIG_F2FS_CHECK_FS is enabled.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index b3d9e317ff0c1..5079532cb176b 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -660,7 +660,6 @@ static inline void verify_block_addr(struct f2fs_io_info *fio, block_t blk_addr)
 static inline int check_block_count(struct f2fs_sb_info *sbi,
 		int segno, struct f2fs_sit_entry *raw_sit)
 {
-#ifdef CONFIG_F2FS_CHECK_FS
 	bool is_valid  = test_bit_le(0, raw_sit->valid_map) ? true : false;
 	int valid_blocks = 0;
 	int cur_pos = 0, next_pos;
@@ -687,7 +686,7 @@ static inline int check_block_count(struct f2fs_sb_info *sbi,
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		return -EINVAL;
 	}
-#endif
+
 	/* check segment usage, and check boundary of a given segment number */
 	if (unlikely(GET_SIT_VBLOCKS(raw_sit) > sbi->blocks_per_seg
 					|| segno > TOTAL_SEGS(sbi) - 1)) {
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
