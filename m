Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F9B27AAE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Aug 2025 10:14:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+SaR0nqraSUq70f8sjPUdEzGEpOujzGOX3TDeRqniEA=; b=DFcorffJGTMpad7f9jYpEoemT7
	okHj959O7pZgYsi9GWJD6qDtfy8a3/ZhYx1qeenyDrK6xmL7TD8dmRVWAgi00y8pyeZp2dBv9Xxx1
	DIc2pAFW+m0z6++odbeHWQx1S6YKuXixXCPwTDBc63BQzSLxVzXDVvT9hPdHQyCcM/fM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1umpZx-0005WI-DF;
	Fri, 15 Aug 2025 08:14:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1umpZv-0005WB-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4w21+L7N5chWuzuECESOcm54VH/L+IeKJFhMorpzVHs=; b=c2QN4ZA5oeAUsJAd9w+pIWOefb
 fDg8j6isFSOjRwvmR81hMQ0eT62Z4cmfa+VGA/Z8jISOvHeStS8XJRZ/dc0JlvTr5HMrr3HmROSpx
 pf0puBNryITXMaG6S7/gKklNm/u1kGk1YHabs+TB53hTI92mYFEM4kobpyy/P3/Vnjjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4w21+L7N5chWuzuECESOcm54VH/L+IeKJFhMorpzVHs=; b=D
 2DrBtcT6HWS76rxPHQ7ayRax9K5dZr9u7Hzb/21eDa8hxF84ZwI+Q+4fabuFlGAQSkkST3ylxdvPy
 b0eQdZ5caKKOAnQB54FyZwXQBNzMqLkwHsLbU8X05V6RUiwPSb31xSEcAo7nQxBac7P9r55MBWK++
 g7Oo4vadTyhO6Qwc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1umpZv-0006Mb-BL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 15 Aug 2025 08:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 915C86116E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 15 Aug 2025 08:14:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FADFC4CEEB;
 Fri, 15 Aug 2025 08:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755245652;
 bh=QsHEVt06CDo9H2tnF/vlxmAvcKj6cilFpixxqBet9ME=;
 h=From:To:Cc:Subject:Date:From;
 b=qTH08axzFyJFIaLwJ0qtgZrQaOS+4tcepPdvEVi/JIi91C9n19UJEhoQ1aEISq+hw
 OuLgRZXAFdpY0GaWUi8yys9wEYcAsu3XN8nlQ4iAkJc6ilcuCFPwwliN/aL9moBZlN
 +kIxVPZUPdebIGll76TXZtlnEsiBokMawJYBDgdDRS5wBDNorNX+RyGGfNCQb+rRwv
 GmxP5/0rCXYzOV6IEKt2drxlUWxBrMmBzgGocEMhKrALwBfeCUKBNX/9VK/BwnRFEX
 oMv06xVlmQZ9dt1aqzwDz83mFHwNYz2BF/YcQeHG2+egyRTamZIKgqlyKCpl2JziCx
 kqFW7XXRfwtSg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Fri, 15 Aug 2025 16:14:03 +0800
Message-ID: <20250815081405.2523015-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1umpZv-0006Mb-BL
Subject: [f2fs-dev] [PATCH v3 1/3] f2fs/018: check data eof after partial
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
v3:
- introduce build_fio_config() for cleanup
- use run_check() to check return value of check_data_eof()
- add _cleanup
- use $XFS_IO_PROG instead of xfs_io
 tests/f2fs/018     | 89 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/018.out |  2 ++
 2 files changed, 91 insertions(+)
 create mode 100755 tests/f2fs/018
 create mode 100644 tests/f2fs/018.out

diff --git a/tests/f2fs/018 b/tests/f2fs/018
new file mode 100755
index 00000000..8013042d
--- /dev/null
+++ b/tests/f2fs/018
@@ -0,0 +1,89 @@
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
+build_fio_config()
+{
+	local offset=$1
+	local size=$2
+
+	cat >$fio_config <<EOF
+[verify-data]
+filename=$testfile
+rw=read
+verify=pattern
+verify_pattern=0x00
+do_verify=1
+verify_only
+offset=$offset
+size=$size
+numjobs=1
+EOF
+	cat $fio_config >> $seqres.full
+}
+
+build_fio_config 0 4k
+_require_fio $fio_config
+
+_cleanup()
+{
+       rm -f $testfile
+}
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
+	rm -f $testfile
+
+	$XFS_IO_PROG -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
+	$XFS_IO_PROG -c "truncate $offset1" $testfile
+	$XFS_IO_PROG -c "truncate $offset2" $testfile
+
+	if [ "$offset3" ]; then
+		$XFS_IO_PROG -c "truncate $offset3" $testfile
+	fi
+
+	build_fio_config $eof_start $eof_size
+	$FIO_PROG $fio_config >> $seqres.full 2>&1
+
+	return $?
+}
+
+run_check check_data_eof 12k 4k 16k 12k 20k
+run_check check_data_eof 10k 6k 16k 10k 20k
+run_check check_data_eof 12k 4k 16k 8k 12k 20k
+run_check check_data_eof 10k 6k 16k 8k 10k 20k
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
