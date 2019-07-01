Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EFC5C2FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 20:27:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hi11f-0006FY-4H; Mon, 01 Jul 2019 18:27:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hi11d-0006Er-Bp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ebRECreGvf3qg4IR4hPpvwFfA3gIdfpuQR/QTs8pchQ=; b=Bxw/4Ecv2fQ87Rhw7ydGjpp4CV
 rsa9f4ErJKkfzzz8OIaHHcXxOxNtSFH7Ni2FNS7LPL9d98wrkpliqN9ZHB1T07/Q/1iPkw7vJD4Mu
 jkDKGsYXLexB9yuOBs+c/oenDBvLg/hGaclbTShoaPMjymgPmsEmSmud6zj4Im3cj24U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ebRECreGvf3qg4IR4hPpvwFfA3gIdfpuQR/QTs8pchQ=; b=jpmpo1Pu6HsHVK1QzmGWbd2KXn
 QateAmI7j6jeQI4dIsrJrF25tP8+p5rI06mBy1GnNekDAjvkwDQlxWZ0Ua1fjDB02Wo5oyGHXW9lL
 9BVvtXxLD264SlfxoJbVCLic7jAk3ryQ1ynSyhk/rXpGqA4H/PRTlHnYCm0XliFHO910=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hi11h-003Kzq-Dc
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 18:27:42 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA5A121850;
 Mon,  1 Jul 2019 18:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562005650;
 bh=RmiFi9tzptxJ/Z6+W7fN3Dap7wQkvqwPSafCyDX4i/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oe5fbBDPIAdyID+5Xi/P0Dr1zN2RHZhC41movJiM1sFaXIZETwG85Jcu6ySi41NZA
 1+8YNNkqBO2I9avjZGmsR23YSGChQilOuEVdVMON+5ZoKHDxeBYVoyAblXidoe6Svv
 46rRYR27TKVawylFIOJyyQtCDYCqrWo+YBvHG/jY=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Mon,  1 Jul 2019 11:25:46 -0700
Message-Id: <20190701182547.165856-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190701182547.165856-1-ebiggers@kernel.org>
References: <20190701182547.165856-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.3 (/)
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
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hi11h-003Kzq-Dc
Subject: [f2fs-dev] [RFC PATCH v3 7/8] generic: test using fs-verity and
 fscrypt simultaneously
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

This primarily verifies correct ordering of the hooks for each feature:
fscrypt needs to be first.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 tests/generic/904     | 80 +++++++++++++++++++++++++++++++++++++++++++
 tests/generic/904.out | 12 +++++++
 tests/generic/group   |  1 +
 3 files changed, 93 insertions(+)
 create mode 100755 tests/generic/904
 create mode 100644 tests/generic/904.out

diff --git a/tests/generic/904 b/tests/generic/904
new file mode 100755
index 00000000..61bdae22
--- /dev/null
+++ b/tests/generic/904
@@ -0,0 +1,80 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2018 Google LLC
+#
+# FS QA Test generic/904
+#
+# Test using fs-verity and fscrypt simultaneously.  This primarily verifies
+# correct ordering of the hooks for each feature: fscrypt needs to be first.
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
+. ./common/encrypt
+
+# remove previous $seqres.full before test
+rm -f $seqres.full
+
+# real QA test starts here
+_supported_fs generic
+_supported_os Linux
+_require_scratch_verity
+_require_scratch_encryption
+_require_command "$KEYCTL_PROG" keyctl
+
+_scratch_mkfs_encrypted_verity &>> $seqres.full
+_scratch_mount
+
+fsv_orig_file=$tmp.file
+edir=$SCRATCH_MNT/edir
+fsv_file=$edir/file.fsv
+
+# Set up an encrypted directory.
+_new_session_keyring
+keydesc=$(_generate_encryption_key)
+mkdir $edir
+_set_encpolicy $edir $keydesc
+
+# Create a file within the encrypted directory and enable verity on it.
+# Then check that it has an encryption policy as well.
+head -c 100000 /dev/zero > $fsv_orig_file
+cp $fsv_orig_file $fsv_file
+_fsv_enable $fsv_file
+echo
+$XFS_IO_PROG -r -c "get_encpolicy" $fsv_file | _filter_scratch \
+	| sed 's/Master key descriptor:.*/Master key descriptor: 0000000000000000/'
+echo
+
+# Verify that the file contents are as expected.  This should be going through
+# both the decryption and verity I/O paths.
+cmp $fsv_orig_file $fsv_file && echo "Files matched"
+
+# Just in case, try again after a mount cycle to empty the page cache.
+_scratch_cycle_mount
+cmp $fsv_orig_file $fsv_file && echo "Files matched"
+
+# Corrupt some bytes as a sanity check that fs-verity is really working.
+# This also verifies that the data on-disk is really encrypted, since otherwise
+# the data being written here would be identical to the old data.
+head -c 1000 /dev/zero | _fsv_scratch_corrupt_bytes $fsv_file 50000
+md5sum $fsv_file |& _filter_scratch
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/904.out b/tests/generic/904.out
new file mode 100644
index 00000000..5f4e249a
--- /dev/null
+++ b/tests/generic/904.out
@@ -0,0 +1,12 @@
+QA output created by 904
+
+Encryption policy for SCRATCH_MNT/edir/file.fsv:
+	Policy version: 0
+	Master key descriptor: 0000000000000000
+	Contents encryption mode: 1 (AES-256-XTS)
+	Filenames encryption mode: 4 (AES-256-CTS)
+	Flags: 0x02
+
+Files matched
+Files matched
+md5sum: SCRATCH_MNT/edir/file.fsv: Input/output error
diff --git a/tests/generic/group b/tests/generic/group
index 97fd5a32..cc30a30b 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -564,3 +564,4 @@
 901 auto quick verity
 902 auto quick verity
 903 auto quick verity
+904 auto quick verity encrypt
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
