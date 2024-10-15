Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4193A99DC6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Oct 2024 04:51:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0Xez-0001Ey-AZ;
	Tue, 15 Oct 2024 02:51:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t0Xew-0001Ep-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 02:51:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pxiCCsuULI1JZG2LQOHaVzXh1g2r8v2g2qYcx6Ge6nM=; b=a/ue2XOyN2CI62bii7Zz5E21Rk
 Ienv5xeu9ClJRt7KjmkUkS9j00b0ezsNup63pOKi4JpgalQjmrkp4ThxIf2ySkY2kA0qsgcBA/URp
 Z/rxL8uy9nryFZV1WQHYoLw6Bm1YtIddEF8/g/1mAFfnAym6h9g0manQ9hNp1jFULM4s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pxiCCsuULI1JZG2LQOHaVzXh1g2r8v2g2qYcx6Ge6nM=; b=Cy+nZrOV1jJSs4yW5h/dQ+t4tA
 zCLb8ztm1DpnOh9Ge97IeOYOXJr2gpeYmjezN00ZrJ66X/iPMkTeE1X1JvyeSi8Jqt47B1M0Zs7+Y
 +4aSDQBVrUKNi72b7KzSNuibbLQF4oyeecxaDtZdNAIxjzBj7VTHTsjNUJxonFv1vLyQ=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0Xew-0005Xs-TM for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Oct 2024 02:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 50A1FA401F9;
 Tue, 15 Oct 2024 02:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F8F1C4CED0;
 Tue, 15 Oct 2024 02:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728960691;
 bh=Y05EfT0ASAjNhTImYRlNb+wZ7uQbgocCROAhY9S4ZAU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KWKKJK7vFQn9sRsbVTHVJFDV0KhaqMyDA65XyYsIdE6xEcXx7KE3wklyotJ7CET06
 6bIvhp+iaxew4tV+3FuQnvzI2Cz82mURHKCzMd2su6As/Davr92etlVH8Xe9uLxCjG
 6lhQ+Ts+YgrJmNCUhLj/8lgcZJR8p7ShTrnXW0VqRTQRrLlNN0BOPhGzGQV1Dt3km1
 aS8BfKruyBeHgn8c0JDh/3YJY7T/QLWs8r3kgice8P/2ImNvHZLDr4IuWgB5V8PTey
 jhomZNcd/L+UrZWWjPGOxrkDdyRAKrNi+q3HpurZl6wM3p50ASaWu12Ud/75XG+KW5
 ++/itwbhoM0Mg==
To: Zorro Lang <zlang@redhat.com>
Date: Tue, 15 Oct 2024 10:51:06 +0800
Message-Id: <20241015025106.3203676-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241015025106.3203676-1-chao@kernel.org>
References: <20241015025106.3203676-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
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
 Signed-off-by: Chao Yu <chao@kernel.org> --- tests/f2fs/007 | 116
 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/007.out | 4 [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t0Xew-0005Xs-TM
Subject: [f2fs-dev] [PATCH 2/2] f2fs/007: add testcase to check consistency
 of compressed inode metadata
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
 tests/f2fs/007     | 116 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/007.out |   4 ++
 2 files changed, 120 insertions(+)
 create mode 100755 tests/f2fs/007
 create mode 100644 tests/f2fs/007.out

diff --git a/tests/f2fs/007 b/tests/f2fs/007
new file mode 100755
index 00000000..274be806
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
+_begin_fstest auto quick
+
+_cleanup()
+{
+	cd /
+	rm -r -f tmp.*
+}
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
+filename=/mnt/scratch_f2fs/testfile30
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
+filename=/mnt/scratch_f2fs/testfile60
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
+filename=/mnt/scratch_f2fs/testfile90
+buffer_compress_percentage=90
+EOF
+
+_require_fio $fio_config
+_require_scratch
+_scratch_mkfs "-f -O extra_attr,compression" >> $seqres.full
+_scratch_mount "-o compress_mode=user,compress_extension=*" >> $seqres.full
+
+echo -e "Run fio to initialize file w/ specified compress ratio" >> $seqres.full
+cat $fio_config >> $seqres.full
+$FIO_PROG $fio_config >> $seqres.full
+_scratch_unmount
+
+for i in 30 60 90; do
+	testfile=$testfile_prefix$i
+
+	_scratch_mount "-o compress_mode=user" >> $seqres.full
+	f2fs_io compress $testfile >> $seqres.full
+	cblocks=`f2fs_io get_cblocks $testfile`
+	echo "compression ratio is: "$cblocks" / 256"
+
+	_scratch_unmount
+
+	# 1. check after compression
+	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after compress"
+	fi
+
+	_scratch_mount >> $seqres.full
+	f2fs_io release_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 2. check after releasement
+	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after release_cblocks"
+	fi
+
+	_scratch_mount >> $seqres.full
+	f2fs_io reserve_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 3. check after rservation
+	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
+	if [ $? -ne 0 ]; then
+		_fail "filesystem becomes corrupted after reserve_cblocks"
+	fi
+
+	_scratch_mount "-o compress_mode=user" >> $seqres.full
+	f2fs_io decompress $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 4. check after decompression
+	fsck -t $FSTYP -f $SCRATCH_DEV >> $seqres.full
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
