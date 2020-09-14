Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E573B268BB1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Sep 2020 15:05:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHoAU-0004pw-Oh; Mon, 14 Sep 2020 13:05:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kHoAT-0004pY-NV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 13:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IdrC10Ysn4Q+qUIPxl8Uennx7yQmj2fbiZqHtzpsrgw=; b=jX5cEJcuxI8ELOzKuHwQEJfFfs
 V4JuWn1XkuO+ft+MsEsHNiWhh2j+Lg64PihTbS80eC+EU6k7/uxJ55A0b6YTuDolvcd3kYcDUITW6
 38CEVgL35ckkdkbVAbNAyz9PoFKY4+Yu7s380GuAjfV2KMvyMUJVKjkGrmEkCslFN8JE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IdrC10Ysn4Q+qUIPxl8Uennx7yQmj2fbiZqHtzpsrgw=; b=N1HbXp6yRRwl0avZ7Q1jSDcMh7
 MuThVDU+yfsg/bV1Ca+ZUdkfjy616LAXIIOvPZYXAVBawBUZKlZQXHt2n7Sg7zPyDpXSy7NTYsQyY
 IJxFxsxNLynBSbeZtVGIPwdi5xU3Cl11PSKjGgUVbiMHjE3FCvahmUNV/tIBG0UFlapc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHoAP-009A4Z-E4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 13:05:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0916F22249;
 Mon, 14 Sep 2020 13:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600088696;
 bh=hcg0xITRDx7PJvaz4JYlC8n1jzqkFTy22dae6DGDrbI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1/kp7RtJeLWo0vLBDkBZZU69C2h1e/BjBShpl01TSKfPfKNwmcy3ojWoYabnGUpXz
 ybXtKI6UTlBhnoRWlZukRy+DsQj9CWhJ9CXQ61FCXDPI7DBoCZ7WdFmNBNcLz+EdzC
 BhoIKTnetwGU14shSRhaNICH129Qz8BqE2V9qurw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 14 Sep 2020 09:04:30 -0400
Message-Id: <20200914130434.1804478-18-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200914130434.1804478-1-sashal@kernel.org>
References: <20200914130434.1804478-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: collabora.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kHoAP-009A4Z-E4
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 18/22] f2fs: Return EOF on unaligned
 end of file DIO read
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
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Gabriel Krisman Bertazi <krisman@collabora.com>

[ Upstream commit 20d0a107fb35f37578b919f62bd474d6d358d579 ]

Reading past end of file returns EOF for aligned reads but -EINVAL for
unaligned reads on f2fs.  While documentation is not strict about this
corner case, most filesystem returns EOF on this case, like iomap
filesystems.  This patch consolidates the behavior for f2fs, by making
it return EOF(0).

it can be verified by a read loop on a file that does a partial read
before EOF (A file that doesn't end at an aligned address).  The
following code fails on an unaligned file on f2fs, but not on
btrfs, ext4, and xfs.

  while (done < total) {
    ssize_t delta = pread(fd, buf + done, total - done, off + done);
    if (!delta)
      break;
    ...
  }

It is arguable whether filesystems should actually return EOF or
-EINVAL, but since iomap filesystems support it, and so does the
original DIO code, it seems reasonable to consolidate on that.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ec9a1f9ce2dd6..68be334afc286 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2753,6 +2753,9 @@ static int check_direct_IO(struct inode *inode, struct iov_iter *iter,
 	unsigned long align = offset | iov_iter_alignment(iter);
 	struct block_device *bdev = inode->i_sb->s_bdev;
 
+	if (iov_iter_rw(iter) == READ && offset >= i_size_read(inode))
+		return 1;
+
 	if (align & blocksize_mask) {
 		if (bdev)
 			blkbits = blksize_bits(bdev_logical_block_size(bdev));
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
