Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A935C628477
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 16:55:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oubo9-0008Kh-VH;
	Mon, 14 Nov 2022 15:55:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oubo6-0008Fp-Bd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 15:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CWrrhyUaNA2vkvH4PDn69APK5d2szKZIGZBQOMXqfFc=; b=icuvhqZ3SKEJsd9OQAlSbd76io
 i81g8SZC8Vsn8vtnF7bYDMB1cwwI7sfKIETaHJkFW7vmRXN4gS2rP0bfXsJf6NgFnlj/oKh4iUCcu
 QSKp7fTlSbTsAaTGbKF/XJmDCAY5Hudw0gMhA8grRDghDzwh4JLd5SKbRE2IqReW2R18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CWrrhyUaNA2vkvH4PDn69APK5d2szKZIGZBQOMXqfFc=; b=A
 30eRiiSz3VPEeZGDRNhAh0t4dzkJQo2f1ZeilUTgTAIXp9AI4aTpJj0S9DRTyU7hx0e8prwGihyd+
 YG68nN6IBpz2rWwKCCKOGqujfU8gAKFWoGvmkZpqaYorvAdbg5BaBOVuroDRePKpoGqxIprWWKthZ
 tEoSZ11A7z36vaLo=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oubo5-0082rQ-H7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 15:55:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3C79FB8107D;
 Mon, 14 Nov 2022 15:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03DBDC433D6;
 Mon, 14 Nov 2022 15:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668441325;
 bh=H2Y1GL/SJK1DpbLM59qFjLKurzWZxWEgT0xFdgJ3650=;
 h=From:To:Cc:Subject:Date:From;
 b=jBhOPP3h1WF4rxpqWKIvOmKqNs2uikqxUy9fToQFF9JrbNpiKr9IEzcVY/01QBhk5
 lsYsCx1PnX4rlO/AY4mllj4Cs0MZErjbCzO2lvNAnGs80qG/uMWX6qbUJUyslIS4d5
 WNLBb9DMfb494tS/tiga5PfINY0nqh1F4vaMiXefdtpWVv0JrHs7t8SYiitWTkXQ4c
 4BccEEnJJjKGYiyFOgTzvxo6eU0KfsjeTCAt2DHpJav2DySaiHb3WKLPqUuGwrcV/9
 M16voDV37mDz8CBtqrtFyYh71J7/O/umd/WS4zRTyxMoQ7Y4I2q9/NBvGPVpgv9GCB
 8YL83M29KtWAw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 14 Nov 2022 11:05:41 +0800
Message-Id: <20221114030541.6589-1-chao@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot found a f2fs bug: BUG: KASAN: slab-out-of-bounds in
 data_blkaddr fs/f2fs/f2fs.h:2891 [inline] BUG: KASAN: slab-out-of-bounds
 in is_alive fs/f2fs/gc.c:1117 [inline] BUG: KASAN: slab-out-of-bounds in
 gc_data_segment fs/f [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oubo5-0082rQ-H7
Subject: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on i_extra_isize in
 is_alive()
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+f8f3dfa4abc489e768a1@syzkaller.appspotmail.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

syzbot found a f2fs bug:

BUG: KASAN: slab-out-of-bounds in data_blkaddr fs/f2fs/f2fs.h:2891 [inline]
BUG: KASAN: slab-out-of-bounds in is_alive fs/f2fs/gc.c:1117 [inline]
BUG: KASAN: slab-out-of-bounds in gc_data_segment fs/f2fs/gc.c:1520 [inline]
BUG: KASAN: slab-out-of-bounds in do_garbage_collect+0x386a/0x3df0 fs/f2fs/gc.c:1734
Read of size 4 at addr ffff888076557568 by task kworker/u4:3/52

CPU: 1 PID: 52 Comm: kworker/u4:3 Not tainted 6.1.0-rc4-syzkaller-00362-gfef7fd48922d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Workqueue: writeback wb_workfn (flush-7:0)
Call Trace:
<TASK>
__dump_stack lib/dump_stack.c:88 [inline]
dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
print_address_description mm/kasan/report.c:284 [inline]
print_report+0x15e/0x45d mm/kasan/report.c:395
kasan_report+0xbb/0x1f0 mm/kasan/report.c:495
data_blkaddr fs/f2fs/f2fs.h:2891 [inline]
is_alive fs/f2fs/gc.c:1117 [inline]
gc_data_segment fs/f2fs/gc.c:1520 [inline]
do_garbage_collect+0x386a/0x3df0 fs/f2fs/gc.c:1734
f2fs_gc+0x88c/0x20a0 fs/f2fs/gc.c:1831
f2fs_balance_fs+0x544/0x6b0 fs/f2fs/segment.c:410
f2fs_write_inode+0x57e/0xe20 fs/f2fs/inode.c:753
write_inode fs/fs-writeback.c:1440 [inline]
__writeback_single_inode+0xcfc/0x1440 fs/fs-writeback.c:1652
writeback_sb_inodes+0x54d/0xf90 fs/fs-writeback.c:1870
wb_writeback+0x2c5/0xd70 fs/fs-writeback.c:2044
wb_do_writeback fs/fs-writeback.c:2187 [inline]
wb_workfn+0x2dc/0x12f0 fs/fs-writeback.c:2227
process_one_work+0x9bf/0x1710 kernel/workqueue.c:2289
worker_thread+0x665/0x1080 kernel/workqueue.c:2436
kthread+0x2e4/0x3a0 kernel/kthread.c:376
ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:306

The root cause is that we forgot to do sanity check on .i_extra_isize
in below path, result in accessing invalid address later, fix it.
- gc_data_segment
 - is_alive
  - data_blkaddr
   - offset_in_addr

Reported-by: syzbot+f8f3dfa4abc489e768a1@syzkaller.appspotmail.com
Link: https://lore.kernel.org/linux-f2fs-devel/0000000000003cb3c405ed5c17f9@google.com/T/#u
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 69d7d8db3daa..0aaabfd2cf91 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1077,7 +1077,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 {
 	struct page *node_page;
 	nid_t nid;
-	unsigned int ofs_in_node, max_addrs;
+	unsigned int ofs_in_node, max_addrs, base;
 	block_t source_blkaddr;
 
 	nid = le32_to_cpu(sum->nid);
@@ -1103,11 +1103,17 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		return false;
 	}
 
-	max_addrs = IS_INODE(node_page) ? DEF_ADDRS_PER_INODE :
-						DEF_ADDRS_PER_BLOCK;
-	if (ofs_in_node >= max_addrs) {
-		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%u, nid:%u, max:%u",
-			ofs_in_node, dni->ino, dni->nid, max_addrs);
+	if (IS_INODE(node_page)) {
+		base = offset_in_addr(F2FS_INODE(node_page));
+		max_addrs = DEF_ADDRS_PER_INODE;
+	} else {
+		base = 0;
+		max_addrs = DEF_ADDRS_PER_BLOCK;
+	}
+
+	if (base + ofs_in_node >= max_addrs) {
+		f2fs_err(sbi, "Inconsistent blkaddr offset: base:%u, ofs_in_node:%u, max:%u, ino:%u, nid:%u",
+			base, ofs_in_node, max_addrs, dni->ino, dni->nid);
 		f2fs_put_page(node_page, 1);
 		return false;
 	}
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
