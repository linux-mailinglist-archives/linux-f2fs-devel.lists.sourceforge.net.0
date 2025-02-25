Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B82A4341C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2025 05:27:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tmmXc-0002qd-0g;
	Tue, 25 Feb 2025 04:27:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tmmXZ-0002qV-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Feb 2025 04:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S0F7M61sCEMEc12u5mZX4YTZKiewUjOa2nAkC3QHp/M=; b=h1hc+5+aX8i0Pnqpf0V4K/bpFk
 JlQsDu+tGBBq9WohFdRe1C5/E9RrCKcYG1EXgvTzo5orkDRlHzi9VvMuY06GufRzn6thHYv9ypr7v
 IQ4kIQ1kXKYD3A6OGvAupbDXD6AAfmxp32qjb3ovApqw75j/jEYeopSA4aedfumhrq9g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=S0F7M61sCEMEc12u5mZX4YTZKiewUjOa2nAkC3QHp/M=; b=G
 8J+kHgNFz0gtJQSiPduPRonCmCQoIH/zeNE2cSWcrTxYNi6IIoBVYimLLnSkWL37vSgaXEdqbMP4J
 sYCKym+q5X+oVgFcTQEJ3BcL9L7MxMOibJiNj2SMt5fTnU0K4PLiSAC7g/rNqYOAntGR+Rsj/nmje
 Td1d2SfMKUu5meg0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tmmXY-00078S-EX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Feb 2025 04:27:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 16CD85C5735
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Feb 2025 04:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA0D9C4CEDD;
 Tue, 25 Feb 2025 04:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740457637;
 bh=vF9ZxyTl2Vrx+HdQ8m5CTI6HCAg5PMkpXsbTT8coIyI=;
 h=From:To:Cc:Subject:Date:From;
 b=KT4esB3oQjo4kfrRthYnoOQ0m3HmPUlEufXvotbFzZ1LGQk+uQ4WRgT/QG4L3imt2
 4bBqg/Nq89zGOHYL82V1IfcnNTNBXZxC5FwbZnDp07p27crywA3tMU97gClXIZeEXn
 3fWBm1bERF0QHsBfoigz1rFx/9Uzi6xX/r7Wn/RZ9XulYsWAwbkhyFiOk6sQQrYwl1
 4JihiZXnTnNr4C3OQP3S7qjU1J0XJpRyGREBVT1h0n7cg83IPSnNJ5mZE895Kv1o4Z
 ORoR8zISra/ESfj6UYYs5VnjKq1oLTgehHfraiuVJSBpU1zCn3LI2t2V8LErFLETur
 8Ium6iu4mXoLw==
To: jaegeuk@kernel.org
Date: Tue, 25 Feb 2025 12:27:10 +0800
Message-ID: <20250225042710.294342-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previous, fsck.f2fs only support i_links check and repair
 for orphan and directory inode, this patch starts to check and repair i_links
 for char, block, fifo, sock,
 symlink and regular inode. Tested w/ below testcase:
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tmmXY-00078S-EX
Subject: [f2fs-dev] [PATCH] fsck.f2fs: support to repair corrupted i_links
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previous, fsck.f2fs only support i_links check and repair for orphan
and directory inode, this patch starts to check and repair i_links for
char, block, fifo, sock, symlink and regular inode.

Tested w/ below testcase:

dev=/dev/vda
mp=/mnt/f2fs
for ((i=0;i<8;i++)) do
	mkfs.f2fs -f $dev
	mount $dev $mp
	cd $mp

	if [ $i == 0 ]; then
		touch file
		nlink=0
	elif [ $i == 1 ]; then
		mkdir dir
		nlink=1
	elif [ $i == 2 ]; then
		mknod charactor c 9 0
		nlink=0
	elif [ $i == 3 ]; then
		mknod blockdev b 8 0
		nlink=0
	elif [ $i == 4 ]; then
		mkfifo pipe
		nlink=0
	elif [ $i == 5 ]; then
		socket -s $mp/sock & fuser -k $mp/sock
		nlink=0
	elif [ $i == 6 ]; then
		ln -s file symlink
		nlink=0
	elif [ $i == 7 ]; then
		touch atomic
		f2fs_io write 1 0 1 zero atomic_commit ./atomic 2000 &
		rm atomic
		sync
		f2fs_io shutdown 2 ./
		nlink=1
		sleep 2
	fi

	cd ~/
	umount $mp

	inject.f2fs --node --mb i_links --nid 4 --val $nlink $dev

	fsck.f2fs -f $dev
	fsck.f2fs $dev
done

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fsck/fsck.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ef9662b..ce88cfe 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -902,7 +902,9 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	int need_fix = 0;
 	int ret;
 	u32 cluster_size = 1 << node_blk->i.i_log_cluster_size;
+	u32 target_links;
 	bool is_aliasing = IS_DEVICE_ALIASING(&node_blk->i);
+	bool corrupted_nlink = false;
 
 	if (!compressed)
 		goto check_next;
@@ -1413,14 +1415,33 @@ skip_dot_fix:
 					nid, (unsigned long)F2FS_BLKSIZE);
 	}
 
-	if (ftype == F2FS_FT_ORPHAN && i_links) {
-		ASSERT_MSG("ino: 0x%x is orphan inode, but has i_links: %u",
-				nid, i_links);
+	if (ftype == F2FS_FT_ORPHAN) {
+		if (i_links) {
+			corrupted_nlink = true;
+			target_links = 0;
+		}
+	} else if (ftype == F2FS_FT_CHRDEV || ftype == F2FS_FT_BLKDEV ||
+			ftype == F2FS_FT_FIFO || ftype == F2FS_FT_SOCK ||
+			ftype == F2FS_FT_SYMLINK) {
+		if (i_links != 1) {
+			corrupted_nlink = true;
+			target_links = 1;
+		}
+	} else if (ftype == F2FS_FT_REG_FILE) {
+		if (i_links == 0) {
+			corrupted_nlink = true;
+			target_links = 1;
+		}
+	}
+
+	if (corrupted_nlink) {
+		ASSERT_MSG("ino: 0x%x ftype: %d has i_links: %u",
+					nid, ftype, i_links);
 		if (c.fix_on) {
-			node_blk->i.i_links = 0;
+			node_blk->i.i_links = cpu_to_le32(target_links);
 			need_fix = 1;
-			FIX_MSG("ino: 0x%x orphan_inode, i_links= 0x%x -> 0",
-					nid, i_links);
+			FIX_MSG("ino: 0x%x ftype: %d fix i_links: %u -> %u",
+				nid, ftype, i_links, target_links);
 		}
 	}
 
-- 
2.48.1.658.g4767266eb4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
