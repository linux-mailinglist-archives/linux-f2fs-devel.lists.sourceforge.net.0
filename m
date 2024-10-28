Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C49B3326
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 15:18:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5QZc-0006VH-6C;
	Mon, 28 Oct 2024 14:18:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t5QZa-0006V9-Fm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=efZzDbJh40Eyo/1/ejbv8h7jUIbn76oQDePjYMYlbsg=; b=ljABHGo4VDCXoPXFy3fxNi3AhW
 t/Y8RaywmTByPjHRGqaOjcAoxrVZi0SvEQkrrfTPGDrLrg+g9JzOQd3CPRid/mP8+1Vt0VuanUZJ6
 +EUnH7XVglQ/LTBjD2cE11g7f6t4eEn4KOGxkCh3+eg+pUJ/WJfoxZNIrHrkYfnD6AmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=efZzDbJh40Eyo/1/ejbv8h7jUIbn76oQDePjYMYlbsg=; b=kj8IHaV+AO6ErdJaulKthLH05d
 P+Tun0XPOhcheHIm9JnoIBQKCbaAl8vCVtuJ8P+XFTUioIwy24P6NW+aciVOnUxmp2FbmYGLk3zRb
 bZ5xtYf3L9uxAiYAB53+rwrtd8VNYC+Y/LMuL1kxSmAjem9LlRaNGeka/Tp1WvX60BGo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5QZY-0000A3-WD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 14:18:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 319AEA42593;
 Mon, 28 Oct 2024 14:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB01C4CECD;
 Mon, 28 Oct 2024 14:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730125089;
 bh=pexBdKDgTINKrNIruMOIrMyMh+9Vaidlv8kP7M2pspg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AuZuJ2g/FgHXHw5HxA3KZG2gTkJB9mCzpt933hoIW0eDFxN7dHNPTP+te4W6PQDZu
 7T/ikKiTa4Lj/oefDGVZLGKXtQavEWy/i5GMexaoZsSZiC9+nkfau5u3ew6cmtnciw
 qOHloyh1ZxQTlEeK5tl1YwSilEX5r8f14dVhr6KDmFTKpIpDhFw7kSPJrYm/M0gVhL
 QPMGebX3oX4ecDEspRr2z413uu3LFQQsPLSAceAKT09v5mTOZKrb+TuvbITTCxXF5J
 5fBGh+Sx6CUEN19AxeHdGds0bXttE2SltIamBh1EtFVokQsA6GqNDUPwPD2XSl8lck
 iDoxGmdtMIJhA==
To: Zorro Lang <zlang@redhat.com>
Date: Mon, 28 Oct 2024 22:18:00 +0800
Message-Id: <20241028141800.1788356-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241028141800.1788356-1-chao@kernel.org>
References: <20241028141800.1788356-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: metadata of compressed inode should always be consistent
 after
 file compression, reservation, releasement and decompression, let's add a
 testcase to check it. Cc: Jaegeuk Kim <jaegeuk@kernel.org> Cc: Qi Han
 <hanqi@vivo.com>
 Signed-off-by: Chao Yu <chao@kernel.org> --- v3: - move _require_scratch
 before use of $SCRATCH_MNT - output message before _check_scra [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t5QZY-0000A3-WD
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs/007: add testcase to check
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
v3:
- move _require_scratch before use of $SCRATCH_MNT
- output message before _check_scratch_fs
 tests/f2fs/007     | 108 +++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/007.out |  16 +++++++
 2 files changed, 124 insertions(+)
 create mode 100755 tests/f2fs/007
 create mode 100644 tests/f2fs/007.out

diff --git a/tests/f2fs/007 b/tests/f2fs/007
new file mode 100755
index 00000000..805d88fa
--- /dev/null
+++ b/tests/f2fs/007
@@ -0,0 +1,108 @@
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
+_require_scratch
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
+	echo "check fs after compress"
+	_check_scratch_fs
+
+	_scratch_mount >> $seqres.full
+	$F2FS_IO_PROG release_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 2. check after releasement
+	echo "check fs after release_cblocks"
+	_check_scratch_fs
+
+	_scratch_mount >> $seqres.full
+	$F2FS_IO_PROG reserve_cblocks $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 3. check after rservation
+	echo "check fs after reserve_cblocks"
+	_check_scratch_fs
+
+	_scratch_mount "-o compress_mode=user" >> $seqres.full
+	$F2FS_IO_PROG decompress $testfile >> $seqres.full
+	_scratch_unmount
+
+	# 4. check after decompression
+	echo "check fs after decompress"
+	_check_scratch_fs
+done
+
+status=0
+exit
diff --git a/tests/f2fs/007.out b/tests/f2fs/007.out
new file mode 100644
index 00000000..a4b76300
--- /dev/null
+++ b/tests/f2fs/007.out
@@ -0,0 +1,16 @@
+QA output created by 007
+compression ratio is: 64 / 256
+check fs after compress
+check fs after release_cblocks
+check fs after reserve_cblocks
+check fs after decompress
+compression ratio is: 128 / 256
+check fs after compress
+check fs after release_cblocks
+check fs after reserve_cblocks
+check fs after decompress
+compression ratio is: 192 / 256
+check fs after compress
+check fs after release_cblocks
+check fs after reserve_cblocks
+check fs after decompress
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
