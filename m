Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A461A6FEFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 13:59:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tx3sA-0002LX-LI;
	Tue, 25 Mar 2025 12:59:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tx3s9-0002LP-PV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 12:59:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rth/rSLHcIUrEnDXDxWpmudi7GYtb9ghls3vpdhmr14=; b=TYBE7WLO3RRmV/7ZIUsKpfI4/n
 KkIhGibqp7WzocUt5VSMCrr/r98uDz5wZ/AWp8a4qBfCTx5XG1W1w80Nw4GvBwB+N3eF/C9/JrlgO
 D8ebaFoctbL1Yf4+bRf1NJHDdXQRXwbwkH8OrCSyghX3m3lFysKA16c1LVw2ZFzoAHCM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rth/rSLHcIUrEnDXDxWpmudi7GYtb9ghls3vpdhmr14=; b=Yntl/DtkadP8tq+vIX9hqnc4rW
 EkALknUmj3pZNma98v7aIA/M6BN3k5l80rbTyh6SlTd+6x1eIlSGWfD3C4K/nWfXBa55L29G71HYE
 EN/4AJfbahY60G3I//e2dK1CE5Fk0A7RZuDyQJSoRzXx5G2O14Upd2xa5J7JoODyeKKA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tx3ry-0004Ar-9o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 12:59:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 81D696159E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 12:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461EDC4CEE4;
 Tue, 25 Mar 2025 12:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742907531;
 bh=RQvIBzy9bgK+sBeTLXLeBY1V+fYe6vVoOMsaan4bsAo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FZf6xIXKU/sV5eIXWbbfwXe+VikVmrCO6GOa2mf/aV/4TBSO3BQwDUVub6/RfRACG
 0LayZkzm6moWPKWROfluC9SAFIa6mFzlJqvenLEP8NXNWuDEB/VosZIiIAh/3Vio6T
 8B4D4vd87yXCStFSgE1gzsyuYnpasJ7dem+QmgOyOj+3VuiQoxkjnhQWT0uRjyzInR
 Rwb3TSdyjlb++huL74Bzjp+yJHc53LVkj+BHXZ3S+AlHDvFNOYzHW4hUoP6+xF6yab
 aDpfhN6TEz5h8fCh6DwshzR6yIENwxmDppflMdmR8hIlQPzNk+KySgImA+xwCiZnMJ
 ovqGVfgH3XF3A==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 25 Mar 2025 20:58:24 +0800
Message-ID: <20250325125824.3367060-6-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250325125824.3367060-1-chao@kernel.org>
References: <20250325125824.3367060-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression test to check whether fsck can handle
 corrupted nlinks correctly, it uses inject.f2fs to inject nlinks w/ wrong
 value, and expects fsck.f2fs can detect such corruption and do the [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tx3ry-0004Ar-9o
Subject: [f2fs-dev] [PATCH v5 6/6] f2fs/009: detect and repair nlink
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
v5:
- clean up codes suggested by Dave.
 tests/f2fs/009     | 141 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/009.out |   2 +
 2 files changed, 143 insertions(+)
 create mode 100755 tests/f2fs/009
 create mode 100644 tests/f2fs/009.out

diff --git a/tests/f2fs/009 b/tests/f2fs/009
new file mode 100755
index 00000000..864fdcfb
--- /dev/null
+++ b/tests/f2fs/009
@@ -0,0 +1,141 @@
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
+if [ ! -x "$(type -P socket)" ]; then
+	_notrun "Couldn't find socket"
+fi
+
+_require_scratch
+_require_command "$F2FS_INJECT_PROG" inject.f2fs
+
+_fixed_by_git_commit f2fs-tools 958cd6e \
+	"fsck.f2fs: support to repair corrupted i_links"
+
+filename=$SCRATCH_MNT/foo
+hardlink=$SCRATCH_MNT/bar
+
+_cleanup()
+{
+	if [ -n "$pid" ]; then
+		kill $pid &> /dev/null
+		wait
+	fi
+	cd /
+	rm -r -f $tmp.*
+}
+
+_inject_and_check()
+{
+	local nlink=$1
+	local ino=$2
+
+	echo "ino:"$ino >> $seqres.full
+	echo "nlink:"$nlink >> $seqres.full
+
+	_scratch_unmount
+
+	$F2FS_INJECT_PROG --node --mb i_links --nid $ino --val $nlink $SCRATCH_DEV \
+		>> $seqres.full || _fail "fail to inject"
+
+	_check_scratch_fs >> $seqres.full 2>&1 && _fail "can't find corruption"
+	_repair_scratch_fs >> $seqres.full
+	_check_scratch_fs >> $seqres.full 2>&1 || _fail "fsck can't fix corruption"
+
+	_scratch_mount
+	_scratch_unmount
+
+	_scratch_mkfs >> $seqres.full
+	_scratch_mount
+}
+
+inject_and_check()
+{
+	local nlink=$1
+	local create_hardlink=$2
+	local ino=$3
+
+	if [ -z $ino ]; then
+		ino=`stat -c '%i' $filename`
+	fi
+
+	if [ $create_hardlink == 1 ]; then
+		ln $filename $hardlink
+	fi
+
+	_inject_and_check $nlink $ino
+}
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount
+
+touch $filename
+inject_and_check 0 0
+
+mkdir $filename
+inject_and_check 1 0
+
+mknod $filename c 9 0
+inject_and_check 0 0
+
+mknod $filename b 8 0
+inject_and_check 0 0
+
+mkfifo $filename
+inject_and_check 0 0
+
+socket -s $filename >> $seqres.full 2>&1 &
+pid=$!
+sleep 2
+ino=`stat -c '%i' $filename`
+kill $pid >> $seqres.full 2>&1
+inject_and_check 0 0 $ino
+
+ln -s $SCRATCH_MNT/empty $filename
+inject_and_check 0 0
+
+touch $filename
+ino=`stat -c '%i' $filename`
+$F2FS_IO_PROG write 1 0 1 zero atomic_commit $filename 5000 >> $seqres.full 2>&1 &
+stat $filename >> $seqres.full
+rm $filename
+$F2FS_IO_PROG shutdown 1 $SCRATCH_MNT/ >> $seqres.full
+sleep 6
+inject_and_check 1 0 $ino
+
+# hardlink
+touch $filename
+inject_and_check 0 1
+
+mknod $filename c 9 0
+inject_and_check 0 1
+
+mknod $filename b 8 0
+inject_and_check 0 1
+
+mkfifo $filename
+inject_and_check 0 1
+
+socket -s $filename >> $seqres.full 2>&1 &
+pid=$!
+sleep 2
+ino=`stat -c '%i' $filename`
+kill $pid >> $seqres.full 2>&1
+inject_and_check 0 1 $ino
+
+ln -s $SCRATCH_MNT/empty $filename
+inject_and_check 0 1
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
