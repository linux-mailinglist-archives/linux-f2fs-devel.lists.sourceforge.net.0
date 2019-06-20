Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E434DCCA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 23:38:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he4lg-0007cg-2i; Thu, 20 Jun 2019 21:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1he4lc-0007c5-Ne
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5tpFNgymtdd0t/szPGsWbXomEaQl2A2vxTP24KawZSA=; b=Phoh64ipuQ1E3R7umUx8gVz6Ra
 DNC5rzV4Cexnjm/zIMOFqYdCW7i1ntoXYkL/YzlDVvK/Ijv7lE7MjsiB+A0YQr1mqA/SHaI/mkNHk
 vg8xORv2Z3ETC3MSHpl58ghbW6z+6EHVfZMBYr71Kq79Dr6lFVSTFGYVhuGcV5G8rFs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5tpFNgymtdd0t/szPGsWbXomEaQl2A2vxTP24KawZSA=; b=iTgzS9jULlsL3LEq7evCnNd5xI
 XacAM3jANZ56H1jqobCOBotZP5f1CzNbSkhrDbtRjWlt6f+QbJlB1maZQ2QDNclOZI+/m3TG/1JZm
 po+D2bOPZcVUMqqwaQi1Ts+28MpicwZysvnokDGvJXCMkDdjI9OGjJb7BV5AZR0noC3U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he4le-006aPk-29
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:51 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 27522215EA;
 Thu, 20 Jun 2019 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561066719;
 bh=5CM983t566SpUFL1OYw+Q9AJLEmW5fX4XcdwmQ5M32Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=F0AW4GOhOUWI7+lfy2qlw36rAS9/dND8eokd1WdzuWs5AjH60tQcPWmvp12koGVk8
 h72mVFhWcqc2BthwBYyKdPcPeD91ECdKmAjcTEfX0Cl5m1fTvx5h+ADyh6dNW9ZBf9
 NE+mBDSEiRSOkrLu4VL3jgZAYs7lJsHaQA+b4sho=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 20 Jun 2019 14:36:12 -0700
Message-Id: <20190620213614.113685-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190620213614.113685-1-ebiggers@kernel.org>
References: <20190620213614.113685-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1he4le-006aPk-29
Subject: [f2fs-dev] [RFC PATCH v2 6/8] generic: test that fs-verity is using
 the correct measurement values
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

This test verifies that fs-verity is doing its Merkle tree-based hashing
correctly, i.e. that it hasn't been broken by a change.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/903     | 112 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/903.out |   5 ++
 tests/generic/group   |   1 +
 3 files changed, 118 insertions(+)
 create mode 100755 tests/generic/903
 create mode 100644 tests/generic/903.out

diff --git a/tests/generic/903 b/tests/generic/903
new file mode 100755
index 00000000..55f4a3ba
--- /dev/null
+++ b/tests/generic/903
@@ -0,0 +1,112 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2018 Google LLC
+#
+# FS QA Test generic/903
+#
+# Test that fs-verity is using the correct measurement values.  This test
+# verifies that fs-verity is doing its Merkle tree-based hashing correctly,
+# i.e. that it hasn't been broken by a change.
+#
+seq=`basename $0`
+seqres=$RESULT_DIR/$seq
+echo "QA output created by $seq"
+
+here=`pwd`
+tmp=/tmp/$$
+status=1	# failure is the default!
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+_cleanup()
+{
+	cd /
+	rm -f $tmp.*
+}
+
+# get standard environment, filters and checks
+. ./common/rc
+. ./common/filter
+. ./common/verity
+
+# remove previous $seqres.full before test
+rm -f $seqres.full
+
+# real QA test starts here
+_supported_fs generic
+_supported_os Linux
+_require_scratch_verity
+if [ $FSV_BLOCK_SIZE != 4096 ]; then
+	_notrun "4096-byte verity block size not supported on this platform"
+fi
+
+_scratch_mkfs_verity &>> $seqres.full
+_scratch_mount
+fsv_orig_file=$SCRATCH_MNT/file
+fsv_file=$SCRATCH_MNT/file.fsv
+
+algs=(sha256 sha512)
+
+# Try files with 0, 1, and multiple Merkle tree levels.
+file_sizes=(0 4096 65536 65536 100000000)
+
+# Try both unsalted and salted, and check that empty salt is the same as no salt
+salts=('' '' '' '--salt=' '--salt=f3c93fa6fb828c0e1587e5714ecf6f56')
+
+# The expected file measurements are here rather than in the expected output
+# file because not all hash algorithms may be available.
+sha256_vals=(
+sha256:3d248ca542a24fc62d1c43b916eae5016878e2533c88238480b26128a1f1af95
+sha256:babc284ee4ffe7f449377fbf6692715b43aec7bc39c094a95878904d34bac97e
+sha256:011e3f2b1dc89b75d78cddcc2a1b85cd8a64b2883e5f20f277ae4c0617e0404f
+sha256:011e3f2b1dc89b75d78cddcc2a1b85cd8a64b2883e5f20f277ae4c0617e0404f
+sha256:9d33cab743468fcbe4edab91a275b30dd543c12dd5e6ce6f2f737f66a1558f06
+)
+sha512_vals=(
+sha512:ccf9e5aea1c2a64efa2f2354a6024b90dffde6bbc017825045dce374474e13d10adb9dadcc6ca8e17a3c075fbd31336e8f266ae6fa93a6c3bed66f9e784e5abf
+sha512:928922686c4caf32175f5236a7f964e9925d10a74dc6d8344a8bd08b23c228ff5792573987d7895f628f39c4f4ebe39a7367d7aeb16aaa0cd324ac1d53664e61
+sha512:eab7224ce374a0a4babcb2db25e24836247f38b87806ad9be9e5ba4daac2f5b814fc0cbdfd9f1f8499b3c9a6c1b38fe08974cce49883ab4ccd04462fd2f9507f
+sha512:eab7224ce374a0a4babcb2db25e24836247f38b87806ad9be9e5ba4daac2f5b814fc0cbdfd9f1f8499b3c9a6c1b38fe08974cce49883ab4ccd04462fd2f9507f
+sha512:f7083a38644880d25539488313e9e5b41a4d431a0e383945129ad2c36e3c1d0f28928a424641bb1363c12b6e770578102566acea73baf1ce8ee15336f5ba2446
+)
+
+test_alg()
+{
+	local alg=$1
+	local -n vals=${alg}_vals
+	local i
+	local file_size
+	local expected actual salt_arg
+
+	_fsv_scratch_begin_subtest "Check for expected measurement values ($alg)"
+
+	if ! _fsv_have_hash_algorithm $alg $fsv_file; then
+		if [ "$alg" = sha256 ]; then
+			_fail "Something is wrong - sha256 hash should always be available"
+		fi
+		return 0
+	fi
+
+	for i in ${!file_sizes[@]}; do
+		file_size=${file_sizes[$i]}
+		expected=${vals[$i]}
+		salt_arg=${salts[$i]}
+
+		head -c $file_size /dev/zero > $fsv_orig_file
+		cp $fsv_orig_file $fsv_file
+		_fsv_enable --hash-alg=$alg $salt_arg $fsv_file
+		actual=$(_fsv_measure $fsv_file)
+		if [ "$actual" != "$expected" ]; then
+			echo "Mismatch: expected $expected, kernel calculated $actual (file_size=$file_size)"
+		fi
+		cmp $fsv_orig_file $fsv_file
+		rm -f $fsv_file
+	done
+}
+
+for alg in ${algs[@]}; do
+	test_alg $alg
+done
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/903.out b/tests/generic/903.out
new file mode 100644
index 00000000..02508828
--- /dev/null
+++ b/tests/generic/903.out
@@ -0,0 +1,5 @@
+QA output created by 903
+
+# Check for expected measurement values (sha256)
+
+# Check for expected measurement values (sha512)
diff --git a/tests/generic/group b/tests/generic/group
index ffdc7640..3927f779 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -562,3 +562,4 @@
 900 auto quick verity
 901 auto quick verity
 902 auto quick verity
+903 auto quick verity
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
