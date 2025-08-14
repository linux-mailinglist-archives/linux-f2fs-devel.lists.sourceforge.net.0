Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 439EFB26027
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Aug 2025 11:07:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KGQAa+E5w4IvCJi/Pv/SfD+Rq43hIC7lsXTAYVmq0cY=; b=O8uI01ySkX9rFMY1uUCfUnXh9G
	IlyYevROH5xJgGHDEXcp5rMoOYckhKNxIlCJ+rA3gEBvutM63C/lC2Ct4RmB7nrWf0NcTZulHkl9C
	LDBO6bVZ0C7cWJ6KiD+lTjytq1SV0ifPP6h2bGmEa8QXrSWX0mqLKt+T5hGgTht9zeP0=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umTvk-0001Xo-9N;
	Thu, 14 Aug 2025 09:07:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umTvi-0001Xi-WD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=p1S8voo6YqWNBQIoKEJrCn52r1fopqnjrqwjlc/StTQ=; b=NWroPs80CReTINB5+P94GdfDyJ
 fO99PtautorA+ELz57Isw+R0ymLIwkPavYHJi+nhJkKHXBkCqBcAeSDa08FF+yXBEjFKXYsgDEZG9
 py/uZEw6EWBe7CpoibZWj+LES78XD42Oef7MZGwNgXJTl/SReF+3YhX4XDiHHKOtpSi4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=p1S8voo6YqWNBQIoKEJrCn52r1fopqnjrqwjlc/StTQ=; b=A
 hzTcbWuSMeb4yrn8FeOc5Q/aBbaXqpJAWgzYH7hX4dT3gvHt3IT5BipnVq4Q/2qu2c/yLPJ0aSKdo
 RTMCGTGCbNJxovHpE8Evvv6KZJtwUV7nGN4Wjyz+6DJTqK9CXZyupCu/Fcz7ujmxkuyTQ0OUNKVKL
 PV27VjYIkJSd/hEE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umTvi-0000dg-Gv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Aug 2025 09:07:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2093145132
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 14 Aug 2025 09:07:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C345AC4CEED;
 Thu, 14 Aug 2025 09:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755162441;
 bh=qkKDvLSf4uMSfrwG1DW03hrJDPS0n39bGOJKm8+9eUo=;
 h=From:To:Cc:Subject:Date:From;
 b=oNpVmwyKVtZB5XyBSUwsPWdZwBbfQ2fT8WVRbKsNt7ZcExWRj9Jou7XcHbnpblcKy
 fYwEJQCZUWAyJ4hd34pFiBDPMnKlPCUMTB3xbscjY9Ixo+ibbXW+vAa9WOKOemKjYF
 EdAqCX1uEuxsK1VOdwOWvyhnwgp9dzy33M2yff7TDTkbaffizodFzDWgLMoHusON5l
 v6BqsfbdYteGSGICDqO7IBv1QIDPJOZ/oIeTOD74Vtb9SckFdv8+aje61BKtomtvnT
 hBtXO85VMyW0TcE5jGTGSQ73SjUrdsTep7BCnl3meYyYI6odeIuaNdxxtmTng4cUX/
 A0C3DdUgSa6gg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu, 14 Aug 2025 17:07:10 +0800
Message-ID: <20250814090712.2119455-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is a regression testcase, it is added to check below
 case and its variants: - write 16k data into compressed file (data will be
 compressed) - truncate file to 12k (truncate partial data in compre [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umTvi-0000dg-Gv
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs/018: check data eof after partial
 truncation on compressed cluster
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

This is a regression testcase, it is added to check below case
and its variants:
- write 16k data into compressed file (data will be compressed)
- truncate file to 12k (truncate partial data in compressed cluster)
- truncate file to 20k
- verify data in range of [12k, 16k] to see whether data is all zero
or not

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add missing _require_xfs_io_command "truncate"
- add missing _require_fio $fio_config
- use $XFS_IO_PROG instead of xfs_io
- avoid mkfs&mount .. umount for each round test
 tests/f2fs/018     | 77 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/018.out |  2 ++
 2 files changed, 79 insertions(+)
 create mode 100755 tests/f2fs/018
 create mode 100644 tests/f2fs/018.out

diff --git a/tests/f2fs/018 b/tests/f2fs/018
new file mode 100755
index 00000000..e1047f78
--- /dev/null
+++ b/tests/f2fs/018
@@ -0,0 +1,77 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/018
+#
+# This is a regression test to check whether page eof will be
+# zero or not after we truncate partial data in compressed
+# cluster.
+#
+. ./common/preamble
+_begin_fstest auto quick rw compress
+
+_fixed_by_kernel_commit ba8dac350faf \
+	"f2fs: fix to zero post-eof page"
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+	"f2fs: fix to zero data after EOF for compressed file correctly"
+
+_require_xfs_io_command "truncate"
+_require_scratch
+
+testfile=$SCRATCH_MNT/testfile
+fio_config=$tmp.fio
+
+cat >$fio_config <<EOF
+[global]
+filename=$testfile
+rw=read
+verify=pattern
+verify_pattern=0x00
+do_verify=1
+verify_only
+offset=0
+size=4k
+numjobs=1
+EOF
+_require_fio $fio_config
+
+_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
+_scratch_mount "-o compress_extension=*" >> $seqres.full
+
+check_data_eof()
+{
+	local eof_start=$1
+	local eof_size=$2
+	local filesize=$3
+	local offset1=$4
+	local offset2=$5
+	local offset3=$6
+
+
+	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
+	$XFS_IO_PROG -c "truncate $offset1" $testfile
+	$XFS_IO_PROG -c "truncate $offset2" $testfile
+
+	if [ "$offset3" ]; then
+		xfs_io -c "truncate $offset3" $testfile
+	fi
+
+	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
+		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
+		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"
+
+	rm -f $testfile
+}
+
+check_data_eof 12k 4k 16k 12k 20k
+check_data_eof 10k 6k 16k 10k 20k
+check_data_eof 12k 4k 16k 8k 12k 20k
+check_data_eof 10k 6k 16k 8k 10k 20k
+
+_scratch_unmount
+
+echo "Silence is golden"
+
+status=0
+exit
diff --git a/tests/f2fs/018.out b/tests/f2fs/018.out
new file mode 100644
index 00000000..8849e303
--- /dev/null
+++ b/tests/f2fs/018.out
@@ -0,0 +1,2 @@
+QA output created by 018
+Silence is golden
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
