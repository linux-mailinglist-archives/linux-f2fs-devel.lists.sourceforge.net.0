Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5193C1A9DAC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Apr 2020 13:47:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jOgVa-0003q1-59; Wed, 15 Apr 2020 11:47:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1jOgVY-0003pn-DN
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:47:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jbd1RCsL0q3yaYtLXyJxL7sf5g/LsjH/jHXGkj7GhZo=; b=mFUKBHHuN0BpRDOLNaBKKRVM0R
 jiCKIUL3bipnDXZfq+hmyWInkTYYyyRKZ6Qnv2t3r02gJz/1b7lgnTdwbTgHE0IQ0176khshKJ/I5
 Isy3yb4L9/ZctoLsvMAwxqwYHsj3NyhDTDdbhITSHHE/rdkQewiaj5rr0U+es+ExwVjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jbd1RCsL0q3yaYtLXyJxL7sf5g/LsjH/jHXGkj7GhZo=; b=SF4W0kD6LlUekLhhLlioaxpKWB
 JUXS7nXZGQBWzPIbVsgJFUzpp+dsPPwcys0/Y+xf5Hqy7NOUGDm5wARhP1FEhoXTlcvHW3bekuJ8u
 ynjULE4nmqDm+LHdS6HDYyo2plGLwX5oXV+N/Z28yvy98bza+sWIwpHDWLIlYCa1p+/E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jOgVU-000H16-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Apr 2020 11:47:08 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6828D21582;
 Wed, 15 Apr 2020 11:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586951219;
 bh=J2Tscg0fW3pcCyob+6YGj5QCeCv1qdJ+BxsxnfTJYBA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k1x68miR8+PVvj5NLAWUSdsuP7Dw5TMFzxtFDlS6In6dgAMhxqK+ECefGAItwNfqf
 jdd9wXoVaWi9VWnA95y50aZFwK4uDwEKa0kNuCTaSO8RXH3v3AgFhfvnXfctxAsVy2
 LfMqHiBn9ornQwXhVYjMXeRxLoh6r8914i2aq/Nk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 15 Apr 2020 07:46:13 -0400
Message-Id: <20200415114623.14972-30-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415114623.14972-1-sashal@kernel.org>
References: <20200415114623.14972-1-sashal@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jOgVU-000H16-Ir
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 30/40] f2fs: fix NULL pointer
 dereference in f2fs_write_begin()
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

[ Upstream commit 62f63eea291b50a5677ae7503ac128803174698a ]

BUG: kernel NULL pointer dereference, address: 0000000000000000
RIP: 0010:f2fs_write_begin+0x823/0xb90 [f2fs]
Call Trace:
 f2fs_quota_write+0x139/0x1d0 [f2fs]
 write_blk+0x36/0x80 [quota_tree]
 get_free_dqblk+0x42/0xa0 [quota_tree]
 do_insert_tree+0x235/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 do_insert_tree+0x26e/0x4a0 [quota_tree]
 qtree_write_dquot+0x70/0x190 [quota_tree]
 v2_write_dquot+0x43/0x90 [quota_v2]
 dquot_acquire+0x77/0x100
 f2fs_dquot_acquire+0x2f/0x60 [f2fs]
 dqget+0x310/0x450
 dquot_transfer+0x7e/0x120
 f2fs_setattr+0x11a/0x4a0 [f2fs]
 notify_change+0x349/0x480
 chown_common+0x168/0x1c0
 do_fchownat+0xbc/0xf0
 __x64_sys_fchownat+0x20/0x30
 do_syscall_64+0x5f/0x220
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

Passing fsdata parameter to .write_{begin,end} in f2fs_quota_write(),
so that if quota file is compressed one, we can avoid above NULL
pointer dereference when updating quota content.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index da348cf4ff56a..45f8f6ec22a55 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1648,6 +1648,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 	int offset = off & (sb->s_blocksize - 1);
 	size_t towrite = len;
 	struct page *page;
+	void *fsdata = NULL;
 	char *kaddr;
 	int err = 0;
 	int tocopy;
@@ -1657,7 +1658,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 								towrite);
 retry:
 		err = a_ops->write_begin(NULL, mapping, off, tocopy, 0,
-							&page, NULL);
+							&page, &fsdata);
 		if (unlikely(err)) {
 			if (err == -ENOMEM) {
 				congestion_wait(BLK_RW_ASYNC, HZ/50);
@@ -1672,7 +1673,7 @@ static ssize_t f2fs_quota_write(struct super_block *sb, int type,
 		flush_dcache_page(page);
 
 		a_ops->write_end(NULL, mapping, off, tocopy, tocopy,
-						page, NULL);
+						page, fsdata);
 		offset = 0;
 		towrite -= tocopy;
 		off += tocopy;
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
