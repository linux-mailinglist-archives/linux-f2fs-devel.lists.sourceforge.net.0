Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AABBCDA1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2019 18:48:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iCnzk-0006Ds-MS; Tue, 24 Sep 2019 16:48:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iCnzj-0006Dh-GQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Sep 2019 16:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZjTlSqjjQWB2/N6MeMHrPkkVffTqzdoLXrQtlwyrSSI=; b=iffzdLD/bEl5c78B3lGfGM+IR6
 +tvmxMmYJ3O8YIJrgzb4sG8WsJES2DmbiBpCAGYhiIFk+MoH4I3TMfaHV0hP+HHwSH7QevodkLnBQ
 De33BujOOcFYk7wt6rhqqUDltH1tBdV4O/3udD6PNbR3NE7R9s8D8swJHDC3OZaRtm+Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZjTlSqjjQWB2/N6MeMHrPkkVffTqzdoLXrQtlwyrSSI=; b=FAa6rVgwJT8M8OHBa//VonPgaw
 5v/rW4esX+q5C4wBVPMgPAA8AVR3ELSfZO/xvC0eWT9G5/ZbcJJEpLHSCIGfFqeEwlPzDm+sSpCED
 FgdoMjwb/2DYEx0ggwTarbAF+xplfYa1nznD3Bi/e9ZW1WmbRaZVcRu62j+BseISY5Bg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iCnzd-007H9m-Dm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 24 Sep 2019 16:48:55 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D7F5217D9;
 Tue, 24 Sep 2019 16:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343723;
 bh=IGfnI1Dz+xQEv9yvrsskBlt8PEIQaCUQmgO4pJ6/vH4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qwYqKnmR6gao9y/wKOx/aHYyjTA7CiGF0QTzAqk4dn4+ZTjGm4lsczjHSZvep9puk
 ZuA8emMSvpHbvV/uQB/6q1Snum8MEChFr4eFoHpAA7xeE6yQZbIxtAnAsRMqJjCb00
 xD+FARNY8WkvTavQ/bukshNfQs+HR0CnG6AERev0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 24 Sep 2019 12:45:48 -0400
Message-Id: <20190924164549.27058-69-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164549.27058-1-sashal@kernel.org>
References: <20190924164549.27058-1-sashal@kernel.org>
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iCnzd-007H9m-Dm
Subject: [f2fs-dev] [PATCH AUTOSEL 5.2 69/70] f2fs: fix to drop meta/node
 pages during umount
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

[ Upstream commit a8933b6b68f775b5774e7b075447fae13f4d01fe ]

As reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=204193

A null pointer dereference bug is triggered in f2fs under kernel-5.1.3.

 kasan_report.cold+0x5/0x32
 f2fs_write_end_io+0x215/0x650
 bio_endio+0x26e/0x320
 blk_update_request+0x209/0x5d0
 blk_mq_end_request+0x2e/0x230
 lo_complete_rq+0x12c/0x190
 blk_done_softirq+0x14a/0x1a0
 __do_softirq+0x119/0x3e5
 irq_exit+0x94/0xe0
 call_function_single_interrupt+0xf/0x20

During umount, we will access NULL sbi->node_inode pointer in
f2fs_write_end_io():

	f2fs_bug_on(sbi, page->mapping == NODE_MAPPING(sbi) &&
				page->index != nid_of_node(page));

The reason is if disable_checkpoint mount option is on, meta dirty
pages can remain during umount, and then be flushed by iput() of
meta_inode, however node_inode has been iput()ed before
meta_inode's iput().

Since checkpoint is disabled, all meta/node datas are useless and
should be dropped in next mount, so in umount, let's adjust
drop_inode() to give a hint to iput_final() to drop all those dirty
datas correctly.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/super.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 4b47ac994daf5..afca410fa7094 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -894,7 +894,21 @@ static struct inode *f2fs_alloc_inode(struct super_block *sb)
 
 static int f2fs_drop_inode(struct inode *inode)
 {
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int ret;
+
+	/*
+	 * during filesystem shutdown, if checkpoint is disabled,
+	 * drop useless meta/node dirty pages.
+	 */
+	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
+		if (inode->i_ino == F2FS_NODE_INO(sbi) ||
+			inode->i_ino == F2FS_META_INO(sbi)) {
+			trace_f2fs_drop_inode(inode, 1);
+			return 1;
+		}
+	}
+
 	/*
 	 * This is to avoid a deadlock condition like below.
 	 * writeback_single_inode(inode)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
