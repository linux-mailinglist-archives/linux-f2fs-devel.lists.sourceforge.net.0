Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CAAA439B9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2025 10:37:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tmrNN-0000US-9y;
	Tue, 25 Feb 2025 09:37:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tmrNL-0000UJ-5n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Feb 2025 09:37:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pzulq5Oz0IIgb8ofgMOP6djALWJM+QRWWMPou6y74n0=; b=RZPIQpz8Bs2yezgG2uKFN6qi5b
 XxnVg5/oBFTDi7k79GmUg9H0hMBS5om6PLTGfsFTy0W+HdnCEro9OaNVq72dWxhekf6mDdjZDx/ro
 N6Lq8mR2xzQAeY2YfJPCDJcaz06OGc1KAYw28GyDUD+HGaAdXHhHyXBIglza5vdn6Bh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pzulq5Oz0IIgb8ofgMOP6djALWJM+QRWWMPou6y74n0=; b=B
 YvsJrgTqOE/U0VOOoxHHRz6LKaGzSnAWFD9DpHrnu28DC1iLpnC/9r2pBAZrs6KFw6rGq+y3ZIlTg
 dM+97CIdgw/e1HdqfFoc7/wgmk79getUDUsnC/1gnOq9DNeUrzdszJjx/wswQM6vje5U2OH1CYMny
 M53WjZdvlmtKpZbc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tmrNK-0007Pf-D4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Feb 2025 09:37:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17A955C6A9C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Feb 2025 09:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7B0C4CEDD;
 Tue, 25 Feb 2025 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740476223;
 bh=vo/uwtoGQ8GULTwla/DNBnhPxdWOndpU+xQ7NuMvuXc=;
 h=From:To:Cc:Subject:Date:From;
 b=AYSlGitw3TujqldwOfOCPJeHkTXXRunwClVXWCFcjo8ZZ+YH0evl7uim9knKjyghL
 q7GQjkTu+NWL+vrDuo4G6EsbeAkRVRnygCNHEihYrDTJE3PVpdeWJxQJa9dvY5hG2F
 XJjkjYlo/vhnohKZlZMIgiJb19rKOfuyeG94aVgqtJRMefBtwoNQ3myxbZ+4q/Tp/d
 XRKaEhjaVVIDMqAnfPSKoT9Gpy8lv0mNZ7533+p5c1gSlFqhIijjs/FfdfnfHzshoJ
 MyPNouqmecsXpqSDiD/sFToHs4FHFGBFv2gGfNBhhGIGqWG+Ne7EvCWfjhJg2h9/3I
 mOi1C8rEdnTdw==
To: jaegeuk@kernel.org
Date: Tue, 25 Feb 2025 17:36:54 +0800
Message-ID: <20250225093654.414590-1-chao@kernel.org>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: fsck.f2fs missed to check and repair zeroed i_links for char,
 block, fifo, sock, symlink and regular inode, fix it. Tested w/ below testcase:
 dev=/dev/vda mp=/mnt/f2fs for ((i=0; i<14;
 i++)) do echo "testcase #"$i mkfs.f2fs
 -f $dev >/dev/null 2>&1 if [ $? != 0 ]; then exit fi mount $dev $mp cd $mp
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tmrNK-0007Pf-D4
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: support to repair corrupted i_links
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

fsck.f2fs missed to check and repair zeroed i_links for char, block,
fifo, sock, symlink and regular inode, fix it.

Tested w/ below testcase:

dev=/dev/vda
mp=/mnt/f2fs
for ((i=0;i<14;i++)) do
	echo "testcase #"$i
	mkfs.f2fs -f $dev >/dev/null 2>&1
	if [ $? != 0 ]; then
		exit
	fi
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
		socket -s $mp/sock & sleep 2
		fuser -k $mp/sock
		nlink=0
	elif [ $i == 6 ]; then
		ln -s file symlink
		nlink=0
	elif [ $i == 7 ]; then
		# orphan inode
		touch atomic
		f2fs_io write 1 0 1 zero atomic_commit ./atomic 2000 &
		rm atomic
		sync
		f2fs_io shutdown 2 ./
		nlink=1
		sleep 2
	elif [ $i == 8 ]; then
		# hardlink on file
		touch file
		ln file hardlink
		nlink=0
	elif [ $i == 9 ]; then
		# hardlink on charactor
		mknod charactor c 9 0
		ln charactor hardlink
		nlink=0
	elif [ $i == 10 ]; then
		# hardlink on blockdev
		mknod blockdev b 8 0
		ln blockdev hardlink
		nlink=0
	elif [ $i == 11 ]; then
		# hardlink on pipe
		mkfifo pipe
		ln pipe hardlink
		nlink=0
	elif [ $i == 12 ]; then
		# hardlink on socket
		socket -s $mp/sock & sleep 2
		fuser -k $mp/sock
		ln sock hardlink
		nlink=0
	elif [ $i == 13 ]; then
		# hardlink on symlink
		ln -s file symlink
		ln symlink hardlink
		nlink=0
	fi

	cd ~/
	umount $mp

	inject.f2fs --node --mb i_links --nid 4 --val $nlink $dev
	if [ $? != 0 ]; then
		exit
	fi

	fsck.f2fs -f $dev
	if [ $? != 1 ]; then
		exit
	fi
	fsck.f2fs $dev
	if [ $? != 0 ]; then
		exit
	fi

	mount $dev $mp
	stat $mp/*
	umount $mp
done

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- update testcase to cover hardlink of non-dir inode
- fix zeroed i_links only
 fsck/fsck.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index aa3fb97..8155cbd 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -942,6 +942,22 @@ check_next:
 		if (f2fs_test_main_bitmap(sbi, ni->blk_addr) == 0) {
 			f2fs_set_main_bitmap(sbi, ni->blk_addr,
 							CURSEG_WARM_NODE);
+
+			if (i_links == 0 && (ftype == F2FS_FT_CHRDEV ||
+				ftype == F2FS_FT_BLKDEV ||
+				ftype == F2FS_FT_FIFO ||
+				ftype == F2FS_FT_SOCK ||
+				ftype == F2FS_FT_SYMLINK ||
+				ftype == F2FS_FT_REG_FILE)) {
+				ASSERT_MSG("ino: 0x%x ftype: %d has i_links: %u",
+							nid, ftype, i_links);
+				if (c.fix_on) {
+					node_blk->i.i_links = cpu_to_le32(1);
+					need_fix = 1;
+					FIX_MSG("ino: 0x%x ftype: %d fix i_links: %u -> 1",
+						nid, ftype, i_links);
+				}
+			}
 			if (i_links > 1 && ftype != F2FS_FT_ORPHAN &&
 					!is_qf_ino(F2FS_RAW_SUPER(sbi), nid)) {
 				/* First time. Create new hard link node */
-- 
2.48.1.658.g4767266eb4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
