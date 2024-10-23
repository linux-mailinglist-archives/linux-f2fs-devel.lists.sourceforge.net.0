Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC3C9AC145
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 10:16:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3WXb-0008KT-4q;
	Wed, 23 Oct 2024 08:16:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t3WXa-0008KI-4V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=of1MI47wCja644OgQOb+mTDmo5hRD6gH/ChcvlQyF5g=; b=bQfM/+xCVjtlHrmFziDcjMZEZT
 sqvHTBwTYiqs1lQhxEzhcEIS0ap7v1+aDu/6nmSX3RLsX53XMxz2234SllcK4lsgRXMLjyUQQmoMN
 ijRIiPvjvwYtW3NkuUhKESXqsRtFJ5LXtTXTgENhAsoIcTXqLNbJHkiGfc7kcZsYvECY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=of1MI47wCja644OgQOb+mTDmo5hRD6gH/ChcvlQyF5g=; b=PUH3b3A/0oEZxbuY4IKwLcTieF
 K8WDc4ring8tyKp7XKWxULaDzMBd29xKyg5hKEHv6bjuz9mRq+D24hN3zpB5/3GtGOdwCmTjh0kqn
 HvNPv2088NeCHV6+B8311rmVMuSAWA/EU6cTDrd9SR/+MiUPB+IJUdfUPLS0buGsJp60=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3WXZ-0003dT-36 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 08:16:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 36341A44B9E;
 Wed, 23 Oct 2024 08:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749DBC4CECD;
 Wed, 23 Oct 2024 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729671374;
 bh=ny96yE+u0tbc540OPl+68cxi48B5XhGbATbld3m9Zf0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aO68x6puPuyvAX9fExYgnnr6gVbl2DVv/nNC+5LVHw2aStd4sbDJTF0KNG74H8xmG
 CmM/TcCTc1t7sOEVjNnvKnpSwkpYb+gbPT8t9EGfuTsQQQavPKBFa6+4exFZ79WW1+
 GJf53si/dnz9lAMfl/hI9oKr7LJX5prZn2GSJPyq03/UJJmrSVgzun5kFDXqVb4C1g
 4J4XW6pnGPLU/TUe48t9S1udOLJbykh7oI5tpdnekA1Iy/NeKn44DLNqeB9dVSYRzm
 rnmFbt3mEPOXOKnxZVfv4Yg48cO8wPhwS84OUIhlTUTGax1zLuGwyjKVcWKqDpoXz1
 k5y9NybdiSNxw==
To: Zorro Lang <zlang@redhat.com>
Date: Wed, 23 Oct 2024 16:16:02 +0800
Message-Id: <20241023081602.3806579-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241023081602.3806579-1-chao@kernel.org>
References: <20241023081602.3806579-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: metadata of compressed inode should always be consistent
 after
 file compression, reservation, releasement and decompression, let's add a
 testcase to check it. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Cc: Qi Han
 <hanqi@vivo.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v2: - add
 _fixed_by_kernel_commit()
 - code cleanup - add error handling for _scratch_mkfs( [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t3WXZ-0003dT-36
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs/007: add testcase to check
 consistency of compressed inode metadata
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Qi Han <hanqi@vivo.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

metadata of compressed inode should always be consistent after file
compression, reservation, releasement and decompression, let's add
a testcase to check it.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Qi Han <hanqi@vivo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- add _fixed_by_kernel_commit()
- code cleanup
- add error handling for _scratch_mkfs()
 tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/007.out |   4 ++
 2 files changed, 120 insertions(+)
 create mode 100755 tests/f2fs/007
 create mode 100644 tests/f2fs/007.out

diff --git a/tests/f2fs/007 b/tests/f2fs/007
new file mode 100755
index 00000000..8979c21c
--- /dev/null
+++ b/tests/f2fs/007
@@ -0,0 +1,116 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2024 Oppo.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/007
+#
+# This is a regression test to check whether compressed metadata
+# can become inconsistent after file compression, reservation
+# releasement, and decompression.
+#
+. ./common/preamble
+_begin_fstest auto quick rw compress
+
+_fixed_by_kernel_commit xxxxxxxxxxxx \
+        "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"
+
+testfile_prefix=$SCRATCH_MNT/testfile
+fio_config=$tmp.fio
+
+cat >$fio_config <<EOF
+[write_compressed_data_30]
+name=mytest
+ioengine=psync
+rw=write
+direct=0
+bs=1M
+filesize=1M
+numjobs=1
+filename=${testfile_prefix}30
+buffer_compress_percentage=30
+
+[write_compressed_data_60]
+name=mytest
+ioengine=psync
+rw=write
+direct=0
+bs=1M
+filesize=1M
+numjobs=1
+filename=${testfile_prefix}60
+buffer_compress_percentage=60
+
+[write_compressed_data_90]
+name=mytest
+ioengine=psync
+rw=write
+direct=0
+bs=1M
+filesize=1M
+numjobs=1
+filename=${testfile_prefix}90
+buffer_compress_percentage=90
+EOF
+
+_require_scratch
+_require_fio $fio_config
+_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
+_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
+
+echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
+cat $fio_config >> $seqres.full
+$FIO_PROG $fio_config >> $seqres.full
+_scratch_unmount
+
+# force to repaire if filesystem is corrupted
+export FSCK_OPTIONS="-f $FSCK_OPTIONS"
+
+for i in 30 60 90; do
+	testfile=$testfile_prefix$i
+
+	_scratch_mount "-o compress_mode=user" >> $seqres.full
+	$F2FS_IO_PROG compress $testfile >> $seqres.full
+	cblocks=`$F2FS_IO_PROG get_cblocks $testfile`
+	echo "compression ratio is: "$cblocks" / 256"
+
+	_scratch_unmount
+
+	# 1. check after compression
+	_check_scratch_fs
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after compress"
+	fi
+
+	_scratch_mount >> $seqres.full
+	$F2FS_IO_PROG release_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 2. check after releasement
+	_check_scratch_fs
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after release_cblocks"
+	fi
+
+	_scratch_mount >> $seqres.full
+	$F2FS_IO_PROG reserve_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 3. check after rservation
+	_check_scratch_fs
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after reserve_cblocks"
+	fi
+
+	_scratch_mount "-o compress_mode=user" >> $seqres.full
+	$F2FS_IO_PROG decompress $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 4. check after decompression
+	_check_scratch_fs
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after decompress"
+	fi
+done
+
+status=0
+exit
diff --git a/tests/f2fs/007.out b/tests/f2fs/007.out
new file mode 100644
index 00000000..2ea71c18
--- /dev/null
+++ b/tests/f2fs/007.out
@@ -0,0 +1,4 @@
+QA output created by 007
+compression ratio is: 64 / 256
+compression ratio is: 128 / 256
+compression ratio is: 192 / 256
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
