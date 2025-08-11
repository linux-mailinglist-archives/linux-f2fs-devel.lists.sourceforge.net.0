Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 716ACB20416
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 11:45:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z5yj7eN5D6ejytixrwDZbxMvH8tVLOT7EQ6wLvVMSec=; b=Lc7jdfYqhbIOuwEh+fRmIkiBbq
	TE8r7aJRreP12zOwwi3n8VCspJBghsgHSyNB+5xGa8yu0YIyaSn8uf1EGwM0WlgK+CAGSgHPD9s2T
	uraWL0U/s1Tfgh61rZ4YCA3QOZOAjH3cqUC1R8DXiErumP+eiw/jyK0iUkxowHRYxKgM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulP5O-0008B2-T0;
	Mon, 11 Aug 2025 09:44:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulP54-0008AT-5b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZOA6dUJV991CSOeT6O1HjdRq7OMd4Yti1MtTwPnT4BY=; b=ScKRcmMbGzNZnkuO2B9WOudq42
 ABAKGSF403Az7bILi7tFAfYlDYx5WpUN7geJiCFee7SXWfqZ5UIzjLgmBUE7vsrZJYFIyYrgGcxX4
 5P3/fKL294STxsFZ08yRomVk9QsfG3goncASdUJwG+S4/opzXWuCk3+XYBE1p0uU1kZ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZOA6dUJV991CSOeT6O1HjdRq7OMd4Yti1MtTwPnT4BY=; b=Z
 YVY67ZwKTBaxPqQVu5+apb2b9BL4YA0GY7yXYZgDbzagPQgW6syNNn7lh1SPn/NePfb76SpxqWYx6
 k/FYyQtjCR2joSPXELEQNWHI/tN3sR3zsOX0vANY3MSquOn/uKr9u9VjMboTTwp/F/63uzALzxtfH
 emsymDJkfnqkNvK0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulP53-0001yT-ON for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 09:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1A000A56CAF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Aug 2025 09:44:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63F2CC4CEF7;
 Mon, 11 Aug 2025 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754905466;
 bh=zq73lEqMNIN5nVGXtc894pn3tXcy2I8u6DhVq5U9hvU=;
 h=From:To:Cc:Subject:Date:From;
 b=BUsOPRQ3tnCzSbSTt1LIpiMwqQam093jZv0o6uhtpHBqUTQd5kDBRIrvDDu6MuyXq
 5wLtH6L0d4ieZywdBCZW4VkPgd5QCw+skhgeRiElPsqZl7ucdD8VkFPSvt2GY9SbNm
 O8zdySABRDW/W0GndWa9XAGGX8l/BUzJwROmwK1BSV/wbT/WFrAUFRgf3YTfX7TUld
 V1q6n02f8Sb3K9Qwx3aeaQJzoyWhK38f23p0vwQ4tf3fSCdbJSmrdYuN/29cZDnhL/
 9eX0L1O8Ac6PTlxvc5Xd0nmbBRdoE0XUFaX+oxCCXgdaRjt0YtWGp2NSzqDcS7zH4C
 zPwYb15xhh1uw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 11 Aug 2025 17:44:13 +0800
Message-ID: <20250811094415.1053545-1-chao@kernel.org>
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
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
X-Headers-End: 1ulP53-0001yT-ON
Subject: [f2fs-dev] [PATCH 1/3] f2fs/018: check data eof after partial
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
 tests/f2fs/018     | 58 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/018.out |  2 ++
 2 files changed, 60 insertions(+)
 create mode 100755 tests/f2fs/018
 create mode 100644 tests/f2fs/018.out

diff --git a/tests/f2fs/018 b/tests/f2fs/018
new file mode 100755
index 00000000..ca727d24
--- /dev/null
+++ b/tests/f2fs/018
@@ -0,0 +1,58 @@
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
+_require_scratch
+_require_fio
+
+testfile=$SCRATCH_MNT/testfile
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
+	_scratch_mkfs "-O extra_attr,compression" >> $seqres.full || _fail "mkfs failed"
+	_scratch_mount "-o compress_extension=*" >> $seqres.full
+
+	xfs_io -f -c "pwrite 0 $filesize" -c "fsync" $testfile >> $seqres.full
+	xfs_io -c "truncate $offset1" $testfile
+	xfs_io -c "truncate $offset2" $testfile
+
+	if [ "$offset3" ]; then
+		xfs_io -c "truncate $offset3" $testfile
+	fi
+
+	$FIO_PROG --name=verify-data --filename=$testfile --rw=read --verify=pattern \
+		--verify_pattern=0x00 --do_verify=1 --verify_only --offset=$eof_start \
+		--size=$eof_size >> $seqres.full 2>&1 || _fail "eof data is not zero"
+	_scratch_unmount
+}
+
+check_data_eof 12k 4k 16k 12k 20k
+check_data_eof 10k 6k 16k 10k 20k
+check_data_eof 12k 4k 16k 8k 12k 20k
+check_data_eof 10k 6k 16k 8k 10k 20k
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
