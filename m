Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A180AA59337
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Mar 2025 12:58:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1trblR-0001C2-OD;
	Mon, 10 Mar 2025 11:57:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1trblO-0001Bw-S2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 11:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sd6qndF4LDlwq1C8bu/MUdm18alw8OQu2LMBDu8TbO8=; b=T+pjJVC2HIvsvf4oVnk4OwcPEY
 JYn9s7ZeJxOaP4p1jr2J0Uo08yYoSpntMcnshnuA173IMFliIgW7t1sHHLpeEKH/sI4bO8KmabbOU
 PPae+ApBTGC4W+5tNQPeGc5+08lGfxOVLO/+yaYlIwzieqJ+1hd2ABmlU1HgG4wquDn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sd6qndF4LDlwq1C8bu/MUdm18alw8OQu2LMBDu8TbO8=; b=ljd8SY6WIiFcxiJFhb6B9vW1ER
 S9iKSQktqoJT26Xdyov3/2yTYlzLv3HTohyGR7hPdplofNVgnXv9ZJ3WohKZw1DKnqWrWFyuosZdn
 K6PneAiZgYL1oJzudvOGjcPuh5cv2l6LkPTUbrG1Tsnc7DMRokvUA0HfVNdb9TMwtQ9o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1trblI-0001CM-Dx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Mar 2025 11:57:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F23C95C600D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Mar 2025 11:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C2B6C4CEEA;
 Mon, 10 Mar 2025 11:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741607844;
 bh=GXwM4rv65Xwt4R+oS85AFKlhzvJB3Sm5lKewF7AKtVA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nPir2eoR1GUsB4L4vasstxgPxb92c2zjBGMTPJYtWa99cOgktzWPNJ8onHeFJDZB8
 7I/cPCWkRFEKZkcwpa3FvKN6yHE7TzweJv7gRBaKDLoUGNGzyB33Wa0RElwknB4X0C
 MCHTLLATfPZhGVLG1Pa2nl9v5x7syYuMAYFx2Q2AdHauUksffV0YMfKc2I25TOdjVC
 waLh76xc0iGhAUjNM8hDZENNKGTUG4lmPl+K5Jm3L8D0qzYusQt+g8NECzCJ5+ZELH
 tEpNg81g3HqzwJVhmL2fX9xnTJuJZUsQex3g6of+zOXXe9I3D4ie6g/99UjLuOe/2H
 0zhAjHZF3aoMw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 10 Mar 2025 19:56:21 +0800
Message-ID: <20250310115621.3441518-4-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250310115621.3441518-1-chao@kernel.org>
References: <20250310115621.3441518-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test to check whether fsck can handle
 corrupted nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong
 value, and expects fsck.f2fs can detect such corruption and do the [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1trblI-0001CM-Dx
Subject: [f2fs-dev] [PATCH v2 4/4] f2fs/009: detect and repair nlink
 corruption
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test to check whether fsck can handle corrupted
nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
and expects fsck.f2fs can detect such corruption and do the repair.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- make _scratch_mkfs() to format f2fs image forcely
- adjust _check_scratch_fs() to allow specified parameter of f2fs
- add _fixed_by_git_commit
- add _require_command inject.f2fs
- simply return value handling
 common/rc          |   9 ++-
 tests/f2fs/009     | 133 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/009.out |   2 +
 3 files changed, 143 insertions(+), 1 deletion(-)
 create mode 100755 tests/f2fs/009
 create mode 100644 tests/f2fs/009.out

diff --git a/common/rc b/common/rc
index bf24da4e..e156f3af 100644
--- a/common/rc
+++ b/common/rc
@@ -993,7 +993,7 @@ _scratch_mkfs()
 		mkfs_filter="grep -v -e ^Warning: -e \"^mke2fs \""
 		;;
 	f2fs)
-		mkfs_cmd="$MKFS_F2FS_PROG"
+		mkfs_cmd="$MKFS_F2FS_PROG -f"
 		mkfs_filter="cat"
 		;;
 	ocfs2)
@@ -3682,6 +3682,13 @@ _check_scratch_fs()
     ubifs)
 	# there is no fsck program for ubifs yet
 	;;
+    f2fs)
+        if [ "$FSCK_OPTIONS" == "--dry-run" ]; then
+            fsck -t $FSTYP $device -- $FSCK_OPTIONS >> $seqres.full 2>&1
+        else
+            _check_generic_filesystem $device
+        fi
+        ;;
     *)
 	_check_generic_filesystem $device
 	;;
diff --git a/tests/f2fs/009 b/tests/f2fs/009
new file mode 100755
index 00000000..d14df968
--- /dev/null
+++ b/tests/f2fs/009
@@ -0,0 +1,133 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/009
+#
+# This is a regression test to check whether fsck can handle corrupted
+# nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong value,
+# and expects fsck.f2fs can detect such corruption and do the repair.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_require_scratch
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+_fixed_by_git_commit f2fs-tools 958cd6e
+
+filename=$SCRATCH_MNT/foo
+hardlink=$SCRATCH_MNT/bar
+
+for ((i=0;i<14;i++)) do
+	echo "round: " $i >> $seqres.full
+
+	_scratch_mkfs "-f" >> $seqres.full
+	_scratch_mount >> $seqres.full
+
+	if [ $i == 0 ]; then
+		touch $filename
+		ino=`stat -c '%i' $filename`
+		nlink=0
+	elif [ $i == 1 ]; then
+		mkdir $filename
+		ino=`stat -c '%i' $filename`
+		nlink=1
+	elif [ $i == 2 ]; then
+		mknod $filename c 9 0
+		ino=`stat -c '%i' $filename`
+		nlink=0
+	elif [ $i == 3 ]; then
+		mknod $filename b 8 0
+		ino=`stat -c '%i' $filename`
+		nlink=0
+	elif [ $i == 4 ]; then
+		mkfifo $filename
+		ino=`stat -c '%i' $filename`
+		nlink=0
+	elif [ $i == 5 ]; then
+		socket -s $filename >> $seqres.full 2>&1 &
+		pid=$!
+		sleep 2
+		ino=`stat -c '%i' $filename`
+		kill $pid >> $seqres.full 2>&1
+		nlink=0
+	elif [ $i == 6 ]; then
+		ln -s $SCRATCH_MNT/empty $filename
+		ino=`stat -c '%i' $filename`
+		nlink=0
+	elif [ $i == 7 ]; then
+		# orphan inode
+		touch $filename
+		ino=`stat -c '%i' $filename`
+		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
+		stat $filename >> $seqres.full
+		rm $filename
+		$F2FS_IO_PROG shutdown 1 $SCRATCH_MNT/ >> $seqres.full
+		sleep 6
+		nlink=1
+	elif [ $i == 8 ]; then
+		# hardlink on file
+		touch $filename
+		ino=`stat -c '%i' $filename`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 9 ]; then
+		# hardlink on charactor
+		mknod $filename c 9 0
+		ino=`stat -c '%i' $filename`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 10 ]; then
+		# hardlink on blockdev
+		mknod $filename b 8 0
+		ino=`stat -c '%i' $filename`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 11 ]; then
+		# hardlink on pipe
+		mkfifo $filename
+		ino=`stat -c '%i' $filename`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 12 ]; then
+		# hardlink on socket
+		socket -s $filename >> $seqres.full 2>&1 &
+		pid=$!
+		sleep 2
+		ino=`stat -c '%i' $filename`
+		kill $pid >> $seqres.full 2>&1
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 13 ]; then
+		# hardlink on symlink
+		ln -s $SCRATCH_MNT/empty $filename
+		ino=`stat -c '%i' $filename`
+		ln $filename $hardlink
+		nlink=0
+	fi
+
+	if [ $i != 7 ]; then
+		stat $SCRATCH_MNT/* >> $seqres.full
+	fi
+	echo "ino:"$ino >> $seqres.full
+	echo "nlink:"$nlink >> $seqres.full
+
+	_scratch_unmount
+
+	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
+		>> $seqres.full || _fail "fail to inject"
+
+	export FSCK_OPTIONS="--dry-run"
+	_check_scratch_fs >>$seqres.full 2>&1 && _fail "can't find corruption"
+	_repair_scratch_fs >> $seqres.full
+	_check_scratch_fs
+
+	_scratch_mount
+	_scratch_unmount
+done
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/009.out b/tests/f2fs/009.out
new file mode 100644
index 00000000..7e977155
--- /dev/null
+++ b/tests/f2fs/009.out
@@ -0,0 +1,2 @@
+QA output created by 009
+Silence is golden
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
