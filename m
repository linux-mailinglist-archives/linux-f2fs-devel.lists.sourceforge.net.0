Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D13695C2FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 20:27:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi11Q-0001bD-Pk; Mon, 01 Jul 2019 18:27:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi11P-0001ae-76
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E8zSleLIjwzAsktzmZW02Kt34rzIE701criz6sdIAPA=; b=aMevzi4cnRWBs9xOIqlomQSvRQ
 OM6eCeTIipWM28NGKA3ISlDQEe6spF9hqg7bFCN6V/wvoUVUo2Ife7F43LVUkMhWekjgxpTcA+Sph
 j8sYWPaGoaD0eSs0cUVAHA1CkbyHYSa4PfOMM8gMrGST6Pu54yoATctbyvCqtXHCxDEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E8zSleLIjwzAsktzmZW02Kt34rzIE701criz6sdIAPA=; b=WTpWRwnL9sNKBqQn96+WiZWuYC
 t5uyvgy7DBM4sVhpqHsGCj8y8a9ZORftGPa/KRkgwVvi8e7onnn3VzfJczY7kgmEvVxg0sjLrsxPE
 cQBOI7utWltbiFPjpQDdBA6KW5GLyLlAI42Kd2+kO50izRLnl9uB907uk6jXoody4uoc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi11c-003hhT-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:37 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CF632183F;
 Mon,  1 Jul 2019 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562005648;
 bh=GgHe2pDOgx2EgjfzSjYlGCopRfHCgOnwQBH27hbteQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Wuu3Qe5UC89mrLrDKaaD/ZdViFqspX4r1cPm7P7RgtWnyKU5stvaIHrc6kexImXU4
 XoO6KgsUlVc/2IGl4IEOWV5TJv95dlZ4Eh/slqnTZ8MjuzRKbL33mLjRJbtMvqmU9p
 S99hpv84mvvnhQ6jf3CmDTbDoTXdlEWyLUrfzlgk=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Mon,  1 Jul 2019 11:25:42 -0700
Message-Id: <20190701182547.165856-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701182547.165856-1-ebiggers@kernel.org>
References: <20190701182547.165856-1-ebiggers@kernel.org>
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
X-Headers-End: 1hi11c-003hhT-Gg
Subject: [f2fs-dev] [RFC PATCH v3 3/8] generic: test general behavior of
 verity files
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

This is a basic fs-verity test which verifies:

- conditions for enabling verity
- verity files have expected contents and size
- can't change contents of verity files, but can change metadata
- can retrieve a verity file's measurement via FS_IOC_MEASURE_VERITY

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/900     | 190 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/900.out |  71 ++++++++++++++++
 tests/generic/group   |   1 +
 3 files changed, 262 insertions(+)
 create mode 100755 tests/generic/900
 create mode 100644 tests/generic/900.out

diff --git a/tests/generic/900 b/tests/generic/900
new file mode 100755
index 00000000..144870a6
--- /dev/null
+++ b/tests/generic/900
@@ -0,0 +1,190 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2018 Google LLC
+#
+# FS QA Test generic/900
+#
+# This is a basic fs-verity test which verifies:
+#
+# - conditions for enabling verity
+# - verity files have correct contents and size
+# - can't change contents of verity files, but can change metadata
+# - can retrieve a verity file's measurement via FS_IOC_MEASURE_VERITY
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
+
+_scratch_mkfs_verity &>> $seqres.full
+_scratch_mount
+fsv_orig_file=$SCRATCH_MNT/file
+fsv_file=$SCRATCH_MNT/file.fsv
+
+verify_data_readable()
+{
+	local file=$1
+
+	md5sum $file > /dev/null
+}
+
+verify_data_unreadable()
+{
+	local file=$1
+
+	# try both reading just the first data block, and reading until EOF
+	head -c $FSV_BLOCK_SIZE $file 2>&1 >/dev/null | _filter_scratch
+	md5sum $file |& _filter_scratch
+}
+
+_fsv_scratch_begin_subtest "Enabling verity on file with verity already enabled fails with EEXIST"
+_fsv_create_enable_file $fsv_file
+echo "(trying again)"
+_fsv_enable $fsv_file |& _filter_scratch
+
+_fsv_scratch_begin_subtest "Enabling verity with invalid hash algorithm fails with EINVAL"
+_fsv_create_enable_file $fsv_file --hash-alg=257 |& _filter_scratch
+verify_data_readable $fsv_file
+
+_fsv_scratch_begin_subtest "Enabling verity with invalid block size fails with EINVAL"
+_fsv_create_enable_file $fsv_file --block-size=1 |& _filter_scratch
+verify_data_readable $fsv_file
+
+_fsv_scratch_begin_subtest "Enabling verity on directory fails with EISDIR"
+mkdir $SCRATCH_MNT/dir
+_fsv_enable $SCRATCH_MNT/dir |& _filter_scratch
+
+_fsv_scratch_begin_subtest "Enabling verity with too-long salt fails with EMSGSIZE"
+_fsv_create_enable_file $fsv_file --salt=$(perl -e 'print "A" x 1000') |& _filter_scratch
+verify_data_readable $fsv_file
+
+_fsv_scratch_begin_subtest "Enabling verity on file on read-only filesystem fails with EROFS"
+echo foo > $fsv_file
+_scratch_remount ro
+_fsv_enable $fsv_file |& _filter_scratch
+_scratch_remount rw
+
+_fsv_scratch_begin_subtest "Enabling verity on file open for writing fails with ETXTBSY"
+echo foo > $fsv_file
+exec 3<> $fsv_file
+_fsv_enable $fsv_file |& _filter_scratch
+exec 3<&-
+verify_data_readable $fsv_file
+
+_fsv_scratch_begin_subtest "Enabling verity can be interrupted"
+dd if=/dev/zero of=$fsv_file bs=1 count=0 seek=$((1 << 34)) status=none
+start_time=$(date +%s)
+$FSVERITY_PROG enable $fsv_file &
+sleep 0.5
+kill %1
+wait
+elapsed=$(( $(date +%s) - start_time ))
+if (( elapsed > 5 )); then
+	echo "Failed to interrupt FS_IOC_ENABLE_VERITY ($elapsed seconds elapsed)"
+fi
+
+_fsv_scratch_begin_subtest "verity file can't be opened for writing"
+_fsv_create_enable_file $fsv_file >> $seqres.full
+echo "* reading"
+$XFS_IO_PROG -r $fsv_file -c ''
+echo "* xfs_io writing, should be O_RDWR"
+$XFS_IO_PROG $fsv_file -c '' |& _filter_scratch
+echo "* bash >>, should be O_APPEND"
+bash -c "echo >> $fsv_file" |& _filter_scratch
+echo "* bash >, should be O_WRONLY|O_CREAT|O_TRUNC"
+bash -c "echo > $fsv_file" |& _filter_scratch
+
+_fsv_scratch_begin_subtest "verity file can be read"
+_fsv_create_enable_file $fsv_file >> $seqres.full
+verify_data_readable $fsv_file
+
+_fsv_scratch_begin_subtest "verity file can be measured"
+_fsv_create_enable_file $fsv_file >> $seqres.full
+_fsv_measure $fsv_file
+
+_fsv_scratch_begin_subtest "verity file can be renamed"
+_fsv_create_enable_file $fsv_file
+mv $fsv_file $fsv_file.newname
+
+_fsv_scratch_begin_subtest "verity file can be unlinked"
+_fsv_create_enable_file $fsv_file
+rm $fsv_file
+
+_fsv_scratch_begin_subtest "verity file can be linked to"
+_fsv_create_enable_file $fsv_file
+ln $fsv_file $fsv_file.newname
+
+_fsv_scratch_begin_subtest "verity file can be chmodded"
+_fsv_create_enable_file $fsv_file
+chmod 777 $fsv_file
+chmod 444 $fsv_file
+
+_fsv_scratch_begin_subtest "verity file can be chowned"
+_fsv_create_enable_file $fsv_file
+chown 1:1 $fsv_file
+chown 0:0 $fsv_file
+
+_fsv_scratch_begin_subtest "verity file has correct contents and size"
+head -c 100000 /dev/urandom > $fsv_orig_file
+cp $fsv_orig_file $fsv_file
+_fsv_enable $fsv_file >> $seqres.full
+cmp $fsv_file $fsv_orig_file
+stat -c %s $fsv_file
+_scratch_cycle_mount
+cmp $fsv_file $fsv_orig_file
+stat -c %s $fsv_file
+
+_fsv_scratch_begin_subtest "Trying to measure non-verity file fails with ENODATA"
+echo foo > $fsv_file
+_fsv_measure $fsv_file |& _filter_scratch
+verify_data_readable $fsv_file
+
+# Test files <= 1 block in size.  These are a bit of a special case since there
+# are no hash blocks; the root hash is calculated directly over the data block.
+for size in 1 $((FSV_BLOCK_SIZE - 1)) $FSV_BLOCK_SIZE; do
+	_fsv_scratch_begin_subtest "verity on $size-byte file"
+	head -c $size /dev/urandom > $fsv_orig_file
+	cp $fsv_orig_file $fsv_file
+	_fsv_enable $fsv_file
+	cmp $fsv_orig_file $fsv_file && echo "Files matched"
+	rm -f $fsv_file
+done
+
+_fsv_scratch_begin_subtest "verity on 100M file (multiple levels in hash tree)"
+head -c 100000000 /dev/urandom > $fsv_orig_file
+cp $fsv_orig_file $fsv_file
+_fsv_enable $fsv_file
+cmp $fsv_orig_file $fsv_file && echo "Files matched"
+
+_fsv_scratch_begin_subtest "verity on sparse file"
+dd if=/dev/zero of=$fsv_orig_file bs=1 count=1 seek=1000000 status=none
+cp $fsv_orig_file $fsv_file
+_fsv_enable $fsv_file
+cmp $fsv_orig_file $fsv_file && echo "Files matched"
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/900.out b/tests/generic/900.out
new file mode 100644
index 00000000..ff5162f3
--- /dev/null
+++ b/tests/generic/900.out
@@ -0,0 +1,71 @@
+QA output created by 900
+
+# Enabling verity on file with verity already enabled fails with EEXIST
+(trying again)
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': File exists
+
+# Enabling verity with invalid hash algorithm fails with EINVAL
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Invalid argument
+
+# Enabling verity with invalid block size fails with EINVAL
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Invalid argument
+
+# Enabling verity on directory fails with EISDIR
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/dir': Is a directory
+
+# Enabling verity with too-long salt fails with EMSGSIZE
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Message too long
+
+# Enabling verity on file on read-only filesystem fails with EROFS
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Read-only file system
+
+# Enabling verity on file open for writing fails with ETXTBSY
+ERROR: FS_IOC_ENABLE_VERITY failed on 'SCRATCH_MNT/file.fsv': Text file busy
+
+# Enabling verity can be interrupted
+
+# verity file can't be opened for writing
+* reading
+* xfs_io writing, should be O_RDWR
+SCRATCH_MNT/file.fsv: Operation not permitted
+* bash >>, should be O_APPEND
+bash: SCRATCH_MNT/file.fsv: Operation not permitted
+* bash >, should be O_WRONLY|O_CREAT|O_TRUNC
+bash: SCRATCH_MNT/file.fsv: Operation not permitted
+
+# verity file can be read
+
+# verity file can be measured
+sha256:be54121da3877f8852c65136d731784f134c4dd9d95071502e80d7be9f99b263
+
+# verity file can be renamed
+
+# verity file can be unlinked
+
+# verity file can be linked to
+
+# verity file can be chmodded
+
+# verity file can be chowned
+
+# verity file has correct contents and size
+100000
+100000
+
+# Trying to measure non-verity file fails with ENODATA
+ERROR: FS_IOC_MEASURE_VERITY failed on 'SCRATCH_MNT/file.fsv': No data available
+
+# verity on 1-byte file
+Files matched
+
+# verity on 4095-byte file
+Files matched
+
+# verity on 4096-byte file
+Files matched
+
+# verity on 100M file (multiple levels in hash tree)
+Files matched
+
+# verity on sparse file
+Files matched
diff --git a/tests/generic/group b/tests/generic/group
index 543c0627..7f72b304 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -560,3 +560,4 @@
 555 auto quick cap
 556 auto quick casefold
 557 auto quick log
+900 auto quick verity
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
