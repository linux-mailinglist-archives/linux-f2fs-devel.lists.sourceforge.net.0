Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 525435B878C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 13:52:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYQwQ-00080s-Pj;
	Wed, 14 Sep 2022 11:52:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oYQwO-00080l-KL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 11:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2PNKkfM1amFHj/l7Be6Ezz4AV1/+vNO4Qx0zp0qYYJk=; b=TfuqMGF/7fkO4WUBhAGBV/Foj8
 72liE4Q8/q0vktd1UXQz4I8ZVdAwSltnE4zKbB6W/xCDUzu/U+E+uC9VCpua9PKrfG8bA62JPP4YL
 F6CRCxm13QYedWSd0pCkIH6HB+HGD+eii5kbSFSBMgQ89lR/q8kdpSD6Rt7vJXk8rvIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2PNKkfM1amFHj/l7Be6Ezz4AV1/+vNO4Qx0zp0qYYJk=; b=S
 eqE280M+hinlaSmiZSqlblaNykkVCzndTKou+LceMfIbw/3HGsAJehNOvp9QblSwFaFNCKmNsr1re
 3Byuyl3+kku6OEbotVBrVvUkcfRRWhybke0AsIwV1ZdFep8rM+whlaBQDgy3Ifi6td1oFMZh+6Obk
 xqYwpCUUJ9VoMBg8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYQwK-0007SO-BJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 11:52:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFA5A61C4F;
 Wed, 14 Sep 2022 11:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83B40C433C1;
 Wed, 14 Sep 2022 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663156338;
 bh=4f7QnIMHb0ycvGRooXpzyLGWeV+vETSC/ILe3NrR92s=;
 h=From:To:Cc:Subject:Date:From;
 b=DBiW2GLenZPedRpYFS7qErx8A1PpUdLZ1FTTi/nBL/N0kbQuLc/x9Uxaqfvvodb5Y
 8/o+uSsMfNZUZVKHyslFCBLkRr41lV8BTuN9TodiXO7a5PW5du2iYvOt4vg8tdNUiL
 XXhfNZqEiNeWOdjT70VoLYmAqhbiR6ZOLmAREHIpkK6XEUHKRdoTRnde/jgQ0sI9ei
 9h+2qGnMcJ/MGtVFN1wVNtmPZUggTzSXtoZ+MESsPMK4ODw2AGTYa4mZtzO0eOIC7J
 uH1xVMk65b+Kgf7R5APtqGqo1c5VRNLQiMSJ3aLW7EKz1eAaDPhZYjdCz+nSpszIh5
 MyysSSCHtbclw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 14 Sep 2022 19:51:51 +0800
Message-Id: <20220914115151.2994632-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Wenqing Liu reported in bugzilla:
 https://bugzilla.kernel.org/show_bug.cgi?id=216456
 BUG: KASAN: use-after-free in recover_data+0x63ae/0x6ae0 [f2fs] Read of size
 4 at addr ffff8881464dcd80 by task mount/1013 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oYQwK-0007SO-BJ
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to do sanity check on summary info
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
Cc: stable@kernel.org, Wenqing Liu <wenqingliu0120@gmail.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Wenqing Liu reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=216456

BUG: KASAN: use-after-free in recover_data+0x63ae/0x6ae0 [f2fs]
Read of size 4 at addr ffff8881464dcd80 by task mount/1013

CPU: 3 PID: 1013 Comm: mount Tainted: G        W          6.0.0-rc4 #1
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.15.0-1 04/01/2014
Call Trace:
 dump_stack_lvl+0x45/0x5e
 print_report.cold+0xf3/0x68d
 kasan_report+0xa8/0x130
 recover_data+0x63ae/0x6ae0 [f2fs]
 f2fs_recover_fsync_data+0x120d/0x1fc0 [f2fs]
 f2fs_fill_super+0x4665/0x61e0 [f2fs]
 mount_bdev+0x2cf/0x3b0
 legacy_get_tree+0xed/0x1d0
 vfs_get_tree+0x81/0x2b0
 path_mount+0x47e/0x19d0
 do_mount+0xce/0xf0
 __x64_sys_mount+0x12c/0x1a0
 do_syscall_64+0x38/0x90
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The root cause is: in fuzzed image, SSA table is corrupted: ofs_in_node
is larger than ADDRS_PER_PAGE(), result in out-of-range access on 4k-size
page.

- recover_data
 - do_recover_data
  - check_index_in_prev_nodes
   - f2fs_data_blkaddr

This patch adds sanity check on summary info in recovery and GC flow
in where the flows rely on them.

After patch:
[   29.310883] F2FS-fs (loop0): Inconsistent ofs_in_node:65286 in summary, ino:0, nid:6, max:1018

Cc: <stable@kernel.org>
Reported-by: Wenqing Liu <wenqingliu0120@gmail.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- fix to avoid use uninitialized variable
 fs/f2fs/gc.c       | 10 +++++++++-
 fs/f2fs/recovery.c | 15 ++++++++++++---
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index fd400d148afb..3a820e5cdaee 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1078,7 +1078,7 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 {
 	struct page *node_page;
 	nid_t nid;
-	unsigned int ofs_in_node;
+	unsigned int ofs_in_node, max_addrs;
 	block_t source_blkaddr;
 
 	nid = le32_to_cpu(sum->nid);
@@ -1104,6 +1104,14 @@ static bool is_alive(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		return false;
 	}
 
+	max_addrs = IS_INODE(node_page) ? DEF_ADDRS_PER_INODE :
+						DEF_ADDRS_PER_BLOCK;
+	if (ofs_in_node >= max_addrs) {
+		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%u, nid:%u, max:%u",
+			ofs_in_node, dni->ino, dni->nid, max_addrs);
+		return false;
+	}
+
 	*nofs = ofs_of_node(node_page);
 	source_blkaddr = data_blkaddr(NULL, node_page, ofs_in_node);
 	f2fs_put_page(node_page, 1);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 8326003e6918..5c9facec98f6 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -474,7 +474,7 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	struct dnode_of_data tdn = *dn;
 	nid_t ino, nid;
 	struct inode *inode;
-	unsigned int offset;
+	unsigned int offset, ofs_in_node, max_addrs;
 	block_t bidx;
 	int i;
 
@@ -501,15 +501,24 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 got_it:
 	/* Use the locked dnode page and inode */
 	nid = le32_to_cpu(sum.nid);
+	ofs_in_node = le16_to_cpu(sum.ofs_in_node);
+
+	max_addrs = ADDRS_PER_PAGE(dn->node_page, dn->inode);
+	if (ofs_in_node >= max_addrs) {
+		f2fs_err(sbi, "Inconsistent ofs_in_node:%u in summary, ino:%lu, nid:%u, max:%u",
+			ofs_in_node, dn->inode->i_ino, nid, max_addrs);
+		return -EFSCORRUPTED;
+	}
+
 	if (dn->inode->i_ino == nid) {
 		tdn.nid = nid;
 		if (!dn->inode_page_locked)
 			lock_page(dn->inode_page);
 		tdn.node_page = dn->inode_page;
-		tdn.ofs_in_node = le16_to_cpu(sum.ofs_in_node);
+		tdn.ofs_in_node = ofs_in_node;
 		goto truncate_out;
 	} else if (dn->nid == nid) {
-		tdn.ofs_in_node = le16_to_cpu(sum.ofs_in_node);
+		tdn.ofs_in_node = ofs_in_node;
 		goto truncate_out;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
