Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D883A54485
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Mar 2025 09:18:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tq6RK-0000rL-HP;
	Thu, 06 Mar 2025 08:18:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tq6RJ-0000rF-T8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Mar 2025 08:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N9ygpkWOYYYvfBlFYv27cIATOlJl0KJ2kaJs+0O4bY8=; b=Bkrw3nHD4aDe8KGIrNWGQxfqS6
 AAMdl2gIPWo+iFaPh6Sz2+gXAYRxxvS7BtOx2yZrCMrPGvV7wr9/5tk46+pMibrhZ22+MWlLfod0y
 frc2g6vFqQuNJ5C2UjjXJQxgMxBDCEyg41aoxvgxOYZb88T2BsyAzGgtNzUK6fSTBDTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N9ygpkWOYYYvfBlFYv27cIATOlJl0KJ2kaJs+0O4bY8=; b=S4xhH/NaHo3wqCVuAnF65GcSF1
 4OczoAXbUgbDU9gfC4VScU8AWIlGSyXlxWrdQnEXnX/NVnfkkyM9FbwtlCYEIdOHlWqN+lAKm9Qi+
 ql9bnOtOb0LIP+tBEBNy1Z0JvMnjfNtv51mt2qdFfW7l9p3WPXB1qhGJoZCqCmUWufa8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tq6R7-0005xZ-Ta for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Mar 2025 08:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A7C035C4D8E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Mar 2025 08:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08786C4CEE9;
 Thu,  6 Mar 2025 08:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741249108;
 bh=kyXXro/OE6+H623m77kqlXTNMmRNhmQ9EpAFZfE9lXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iJgO1Qmlv0WA1k0LdotT3Mi3qZAuvPVcSJKC5CYGJHKNPHcN05dLY6/VwnaOHpIBF
 9AbLC9Ok4cvmDJhOZ0eFdYc68jzUs6CVHDVsJiiCtuXS7keh54eDn+cZgddROCOO0o
 OmaeN+wkT6YzHsne1CGa852e7eAS8Ch0yCNcrJukkqA18zb6IJv+qJvCiO1jpY+SgS
 Cvf3gFtyLwoXu2t63NAo8vJRRMrcdYgFLo5tfvaSdiFdSGb1QLuF38l7ZG39VeEVnL
 Skb/+7JN8BYm0WEqj2PiVdMTp7c8ZEcYb/7fBxHREHEcUVvivnqwGMGhhtWjuxpi0M
 bgVu+FgD4qOSw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu,  6 Mar 2025 16:18:09 +0800
Message-ID: <20250306081809.2397527-4-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
In-Reply-To: <20250306081809.2397527-1-chao@kernel.org>
References: <20250306081809.2397527-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tq6R7-0005xZ-Ta
Subject: [f2fs-dev] [PATCH 4/4] f2fs/009: detect and repair nlink corruption
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
 tests/f2fs/009     | 142 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/009.out |   2 +
 2 files changed, 144 insertions(+)
 create mode 100755 tests/f2fs/009
 create mode 100644 tests/f2fs/009.out

diff --git a/tests/f2fs/009 b/tests/f2fs/009
new file mode 100755
index 00000000..8f6a3e11
--- /dev/null
+++ b/tests/f2fs/009
@@ -0,0 +1,142 @@
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
+
+dir=$SCRATCH_MNT
+filename=$dir/foo
+hardlink=$dir/bar
+
+for ((i=0;i<14;i++)) do
+	echo "round: " $i >> $seqres.full
+
+	_scratch_mkfs "-f" >> $seqres.full
+	_scratch_mount >> $seqres.full
+
+	if [ $i == 0 ]; then
+		touch $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=0
+	elif [ $i == 1 ]; then
+		mkdir $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=1
+	elif [ $i == 2 ]; then
+		mknod $filename c 9 0
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=0
+	elif [ $i == 3 ]; then
+		mknod $filename b 8 0
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=0
+	elif [ $i == 4 ]; then
+		mkfifo $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=0
+	elif [ $i == 5 ]; then
+		socket -s $filename >> $seqres.full 2>&1 &
+		pid=$!
+		sleep 2
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		kill $pid >> $seqres.full 2>&1
+		nlink=0
+	elif [ $i == 6 ]; then
+		ln -s $dir/empty $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		nlink=0
+	elif [ $i == 7 ]; then
+		# orphan inode
+		touch $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
+		stat $filename >> $seqres.full
+		rm $filename
+		$F2FS_IO_PROG shutdown 1 $dir/ >> $seqres.full
+		sleep 6
+		nlink=1
+	elif [ $i == 8 ]; then
+		# hardlink on file
+		touch $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 9 ]; then
+		# hardlink on charactor
+		mknod $filename c 9 0
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 10 ]; then
+		# hardlink on blockdev
+		mknod $filename b 8 0
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 11 ]; then
+		# hardlink on pipe
+		mkfifo $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 12 ]; then
+		# hardlink on socket
+		socket -s $filename >> $seqres.full 2>&1 &
+		pid=$!
+		sleep 2
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		kill $pid >> $seqres.full 2>&1
+		ln $filename $hardlink
+		nlink=0
+	elif [ $i == 13 ]; then
+		# hardlink on symlink
+		ln -s $dir/empty $filename
+		ino=`stat $filename | awk '/Inode:/ {print $4}'`
+		ln $filename $hardlink
+		nlink=0
+	fi
+
+	if [ $i != 7 ]; then
+		stat $dir/* >> $seqres.full
+	fi
+	echo "ino:"$ino >> $seqres.full
+	echo "nlink:"$nlink >> $seqres.full
+
+	_scratch_unmount
+
+	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV >> $seqres.full
+	if [ $? != 0 ]; then
+		exit
+	fi
+
+	export FSCK_OPTIONS="-f"
+	_repair_scratch_fs >> $seqres.full
+	if [ $? != 1 ]; then
+		_fail "fsck can not detect and repair zero nlink corruption "$i
+		exit
+	fi
+
+	export FSCK_OPTIONS=""
+	_check_scratch_fs >> $seqres.full
+	if [ $? != 0 ]; then
+		_fail "fsck hasn't fixed nlink corruption "$i
+		exit
+	fi
+
+	_scratch_mount >> $seqres.full
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
