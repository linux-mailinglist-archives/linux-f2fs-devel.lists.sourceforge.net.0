Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7169931C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2019 14:18:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0m32-0008Cz-4Y; Thu, 22 Aug 2019 12:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i0m31-0008Ct-6R
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 12:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lY620PS17mMCqHGApUahUSKjiM3vUg9G8MCjkPqQGzg=; b=cBq7ekV1oWTExUbnX6FiS1Owvc
 dU6wPDNInyUPVVNBbksg8N8EFXsSdzwjjKBNRJMv9RQcROKXIanseFt/BBTrltpNToFk+WwucLOe8
 zex3aySZK3Hd1n9+ywSD5kEvjIKC0oAxbe9Phbds/aje+uzfokOX4fw0H0NLh0RtT9NQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lY620PS17mMCqHGApUahUSKjiM3vUg9G8MCjkPqQGzg=; b=P
 ct8ZSkBONFUCnmpms2ZZ/Zp0bQvkkvjsPEIup7Cseckp2Fr4vziV0ezOpDX4v5K0Xj9HppeBuYkaz
 1BE63mlWixQQVtvJHXJ82dFxyc68qfuRq/L1+gjNkTGlvEOdGhlY7UUxlVePtGJLV8K/wwqJ7axui
 XjB/gkMnglWtDtzE=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0m2y-00FmMR-PW
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Aug 2019 12:18:35 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id B70F94066537A04BD966;
 Thu, 22 Aug 2019 20:18:23 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.439.0; Thu, 22 Aug 2019 20:18:16 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 22 Aug 2019 20:17:56 +0800
Message-ID: <20190822121756.107187-1-yuchao0@huawei.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0m2y-00FmMR-PW
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to writeout dirty inode during node
 flush
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

As Eric reported:

On xfstest generic/204 on f2fs, I'm getting a kernel BUG.

 allocate_segment_by_default+0x9d/0x100 [f2fs]
 f2fs_allocate_data_block+0x3c0/0x5c0 [f2fs]
 do_write_page+0x62/0x110 [f2fs]
 f2fs_do_write_node_page+0x2b/0xa0 [f2fs]
 __write_node_page+0x2ec/0x590 [f2fs]
 f2fs_sync_node_pages+0x756/0x7e0 [f2fs]
 block_operations+0x25b/0x350 [f2fs]
 f2fs_write_checkpoint+0x104/0x1150 [f2fs]
 f2fs_sync_fs+0xa2/0x120 [f2fs]
 f2fs_balance_fs_bg+0x33c/0x390 [f2fs]
 f2fs_write_node_pages+0x4c/0x1f0 [f2fs]
 do_writepages+0x1c/0x70
 __writeback_single_inode+0x45/0x320
 writeback_sb_inodes+0x273/0x5c0
 wb_writeback+0xff/0x2e0
 wb_workfn+0xa1/0x370
 process_one_work+0x138/0x350
 worker_thread+0x4d/0x3d0
 kthread+0x109/0x140

The root cause of this issue is, in a very small partition, e.g.
in generic/204 testcase of fstest suit, filesystem's free space
is 50MB, so at most we can write 12800 inline inode with command:
`echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX > $SCRATCH_MNT/$i`,
then filesystem will have:
- 12800 dirty inline data page
- 12800 dirty inode page
- and 12800 dirty imeta (dirty inode)

When we flush node-inode's page cache, we can also flush inline
data with each inode page, however it will run out-of-free-space
in device, then once it triggers checkpoint, there is no room for
huge number of imeta, at this time, GC is useless, as there is no
dirty segment at all.

In order to fix this, we try to recognize inode page during
node_inode's page flushing, and update inode page from dirty inode,
so that later another imeta (dirty inode) flush can be avoided.

Reported-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2: fix potential deadlock
 fs/f2fs/node.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index d9ba1db2d01e..e5044eec8097 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1762,6 +1762,47 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
 	return ret ? -EIO: 0;
 }
 
+static int f2fs_match_ino(struct inode *inode, unsigned long ino, void *data)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	bool clean;
+
+	if (inode->i_ino != ino)
+		return 0;
+
+	if (!is_inode_flag_set(inode, FI_DIRTY_INODE))
+		return 0;
+
+	spin_lock(&sbi->inode_lock[DIRTY_META]);
+	clean = list_empty(&F2FS_I(inode)->gdirty_list);
+	spin_unlock(&sbi->inode_lock[DIRTY_META]);
+
+	if (clean)
+		return 0;
+
+	inode = igrab(inode);
+	if (!inode)
+		return 0;
+	return 1;
+}
+
+static bool flush_dirty_inode(struct page *page)
+{
+	struct f2fs_sb_info *sbi = F2FS_P_SB(page);
+	struct inode *inode;
+	nid_t ino = ino_of_node(page);
+
+	inode = find_inode_nowait(sbi->sb, ino, f2fs_match_ino, NULL);
+	if (!inode)
+		return false;
+
+	f2fs_update_inode(inode, page);
+	unlock_page(page);
+
+	iput(inode);
+	return true;
+}
+
 int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				struct writeback_control *wbc,
 				bool do_balance, enum iostat_type io_type)
@@ -1785,6 +1826,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 		for (i = 0; i < nr_pages; i++) {
 			struct page *page = pvec.pages[i];
 			bool submitted = false;
+			bool may_dirty = true;
 
 			/* give a priority to WB_SYNC threads */
 			if (atomic_read(&sbi->wb_sync_req[NODE]) &&
@@ -1832,6 +1874,13 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
 				goto lock_node;
 			}
 
+			/* flush dirty inode */
+			if (IS_INODE(page) && may_dirty) {
+				may_dirty = false;
+				if (flush_dirty_inode(page))
+					goto lock_node;
+			}
+
 			f2fs_wait_on_page_writeback(page, NODE, true, true);
 
 			if (!clear_page_dirty_for_io(page))
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
