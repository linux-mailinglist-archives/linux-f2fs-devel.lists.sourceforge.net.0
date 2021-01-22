Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B12FFA11
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Jan 2021 02:45:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l2lVy-0006ku-U4; Fri, 22 Jan 2021 01:45:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1l2lVy-0006kn-4d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 01:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uboQv9WxmH1a+Q8oGJjxAEHbvzYKf8U8YD/DUYVJhWo=; b=B6H1QW0x+Al1xzN8SBfUmJ+wGJ
 fjmkCY0W5cXXaPpZOHZ6QHInaghUeTQzL60ZSZ4klkBbJQUQ0AH0kKLKalNyCBpWXrRStR0ciiOfL
 430ND3Y8i1dnktODEjaxnvLaepCSuNj0BZtOACv7ZJpI4+MnaiKokQz54JowaAbf8i8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uboQv9WxmH1a+Q8oGJjxAEHbvzYKf8U8YD/DUYVJhWo=; b=A
 FwptnYs6FGJTWqtt4CtZpgbNzH7wMOpCyeNnz0VKWiYAtiohKUi1pl0/key3tVVQerc84A1jIPJZH
 s6c1Rey4zfaC5GNIZhIRCmp1iDQx+XXTrROaneZs8vQBRId1g3YIIz+948lnaLC1TF1/+RZwL4ify
 mfZ7t2IxjXy5a9G4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l2lVo-00CQ7s-M8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Jan 2021 01:45:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37F63223C8;
 Fri, 22 Jan 2021 01:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611279910;
 bh=tIZKoD9FjEGIJuhgcCASN9kC2KnJio/calleGdZuYP4=;
 h=From:To:Cc:Subject:Date:From;
 b=rqCUIPR+3AJEvhGVYBa7+P7zQet+Bsx6FaeKJ1eUl5JPf0MIgaNf4DYRtPlS07Coy
 4wnyYditKQpqPttZE3jwcUPYosaJUOa8DTC21eU/lBxiSKnrC7tlDz14P8z/yGHDmg
 KQeJlS4lMKkdfB5ba3lm1YnEvOdPf5U8flJ7ohsq55rY4HLbbGdtV14F4goRWSC3EX
 ZZitiJJaR8WrSwG9bZS6P0Hgv0PP5U/Mb1usCWZ+PiGOalYBqXMqfLA+uI/jQNF3ug
 Xo6fInsXMXCIkU0RdzDJcXAJnblefHGYFUKJWEKwkapgoD28zbH09ojyjY9GwoEzpR
 j0VYcyJIbhY1A==
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 21 Jan 2021 17:44:34 -0800
Message-Id: <20210122014434.110196-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l2lVo-00CQ7s-M8
Subject: [f2fs-dev] [xfstests PATCH v2] generic: test for lazytime timestamp
 updates
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Test that when the lazytime mount option is enabled, updates to atime,
mtime, and ctime get persisted in the cases when they should be.

This test currently runs on ext4, f2fs, and xfs, since it's limited to
filesystems that support the shutdown ioctl.

This test currently passes on ext4 and f2fs.  On xfs, kernel
commit 1e249cb5b7fc ("fs: fix lazytime expiration handling in
__writeback_single_inode()") is needed for the test to pass, since xfs
had a bug where it didn't persist timestamps when it should have.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

v2: updated comments and commit message, including to add a mention of a
    related kernel commit.

 tests/generic/900     | 239 ++++++++++++++++++++++++++++++++++++++++++
 tests/generic/900.out |  37 +++++++
 tests/generic/group   |   1 +
 3 files changed, 277 insertions(+)
 create mode 100755 tests/generic/900
 create mode 100644 tests/generic/900.out

diff --git a/tests/generic/900 b/tests/generic/900
new file mode 100755
index 00000000..d9756158
--- /dev/null
+++ b/tests/generic/900
@@ -0,0 +1,239 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright 2021 Google LLC
+#
+# FS QA Test No. 900
+#
+# Test that when the lazytime mount option is enabled, updates to atime, mtime,
+# and ctime are persisted in (at least) the four cases when they should be:
+#
+# - The inode needs to be updated for some change unrelated to file timestamps
+# - Userspace calls fsync(), syncfs(), or sync()
+# - The inode is evicted from memory
+# - More than dirtytime_expire_seconds have elapsed
+#
+# This is in part a regression test for kernel commit 1e249cb5b7fc
+# ("fs: fix lazytime expiration handling in __writeback_single_inode()").
+# This test failed on XFS without that commit.
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
+DIRTY_EXPIRE_CENTISECS_ORIG=$(</proc/sys/vm/dirty_expire_centisecs)
+DIRTY_WRITEBACK_CENTISECS_ORIG=$(</proc/sys/vm/dirty_writeback_centisecs)
+DIRTYTIME_EXPIRE_SECONDS_ORIG=$(</proc/sys/vm/dirtytime_expire_seconds)
+
+restore_expiration_settings()
+{
+	echo "$DIRTY_EXPIRE_CENTISECS_ORIG" > /proc/sys/vm/dirty_expire_centisecs
+	echo "$DIRTY_WRITEBACK_CENTISECS_ORIG" > /proc/sys/vm/dirty_writeback_centisecs
+	echo "$DIRTYTIME_EXPIRE_SECONDS_ORIG" > /proc/sys/vm/dirtytime_expire_seconds
+}
+
+# Enable continuous writeback of dirty inodes, so that we don't have to wait
+# for the typical 30 seconds default.
+__expire_inodes()
+{
+	echo 1 > /proc/sys/vm/dirty_expire_centisecs
+	echo 1 > /proc/sys/vm/dirty_writeback_centisecs
+}
+
+# Trigger and wait for writeback of any dirty inodes (not dirtytime inodes).
+expire_inodes()
+{
+	__expire_inodes
+	# Userspace doesn't have direct visibility into when inodes are dirty,
+	# so the best we can do is sleep for a couple seconds.
+	sleep 2
+	restore_expiration_settings
+}
+
+# Trigger and wait for writeback of any dirtytime inodes.
+expire_timestamps()
+{
+	# Enable immediate expiration of lazytime timestamps, so that we don't
+	# have to wait for the typical 24 hours default.  This should quickly
+	# turn dirtytime inodes into regular dirty inodes.
+	echo 1 > /proc/sys/vm/dirtytime_expire_seconds
+
+	# Enable continuous writeback of dirty inodes.
+	__expire_inodes
+
+	# Userspace doesn't have direct visibility into when inodes are dirty,
+	# so the best we can do is sleep for a couple seconds.
+	sleep 2
+	restore_expiration_settings
+}
+
+_cleanup()
+{
+	restore_expiration_settings
+	rm -f $tmp.*
+}
+
+. ./common/rc
+. ./common/filter
+
+rm -f $seqres.full
+
+_supported_fs generic
+# This test uses the shutdown command, so it has to use the scratch filesystem
+# rather than the test filesystem.
+_require_scratch
+_require_scratch_shutdown
+_require_xfs_io_command "pwrite"
+_require_xfs_io_command "fsync"
+_require_xfs_io_command "syncfs"
+# Note that this test doesn't have to check that the filesystem supports
+# "lazytime", since "lazytime" is a VFS-level option, and at worst it just will
+# be ignored.  This test will still pass if lazytime is ignored, as it only
+# tests that timestamp updates are persisted when they should be; it doesn't
+# test that timestamp updates aren't persisted when they shouldn't be.
+
+_scratch_mkfs &>> $seqres.full
+_scratch_mount
+
+# Create the test file for which we'll update and check the timestamps.
+file=$SCRATCH_MNT/file
+$XFS_IO_PROG -f $file -c "pwrite 0 100" > /dev/null
+
+# Get the specified timestamp of $file in nanoseconds since the epoch.
+get_timestamp()
+{
+	local timestamp_type=$1
+
+	local arg
+	case $timestamp_type in
+	atime)	arg=X ;;
+	mtime)	arg=Y ;;
+	ctime)	arg=Z ;;
+	*)	_fail "Unhandled timestamp_type: $timestamp_type" ;;
+	esac
+	stat -c "%.9${arg}" $file | tr -d '.'
+}
+
+do_test()
+{
+	local timestamp_type=$1
+	local persist_method=$2
+
+	echo -e "\n# Testing that lazytime $timestamp_type update is persisted by $persist_method"
+
+	# Mount the filesystem with lazytime.  If atime is being tested, then
+	# also use strictatime, since otherwise the filesystem may default to
+	# relatime and not do the atime updates.
+	if [[ $timestamp_type == atime ]]; then
+		_scratch_cycle_mount lazytime,strictatime
+	else
+		_scratch_cycle_mount lazytime
+	fi
+
+	# Update the specified timestamp on the file.
+	local orig_time=$(get_timestamp $timestamp_type)
+	sleep 0.1
+	case $timestamp_type in
+	atime)
+		# Read from the file to update its atime.
+		cat $file > /dev/null
+		;;
+	mtime)
+		# Write to the file to update its mtime.  Make sure to not write
+		# past the end of the file, as that would change i_size, which
+		# would be an inode change which would cause the timestamp to
+		# always be written -- thus making the test not detect bugs
+		# where the timestamp doesn't get written.
+		#
+		# Also do the write twice, since XFS updates i_version the first
+		# time, which likewise causes mtime to be written.  We want the
+		# last thing done to just update mtime.
+		$XFS_IO_PROG -f $file -c "pwrite 0 100" > /dev/null
+		$XFS_IO_PROG -f $file -c "pwrite 0 100" > /dev/null
+		;;
+	ctime)
+		# It isn't possible to update just ctime, so use 'touch -a'
+		# to update both atime and ctime.
+		touch -a $file
+		;;
+	esac
+	local expected_time=$(get_timestamp $timestamp_type)
+	if (( expected_time <= orig_time )); then
+		echo "FAIL: $timestamp_type didn't increase after updating it (in-memory)"
+	fi
+
+	# Do something that should cause the timestamp to be persisted.
+	case $persist_method in
+	other_inode_change)
+		# Make a non-timestamp-related change to the inode.
+		chmod 777 $file
+		if [[ $timestamp_type == ctime ]]; then
+			# The inode change will have updated ctime again.
+			expected_time=$(get_timestamp ctime)
+		fi
+		# The inode may have been marked dirty but not actually written
+		# yet.  Expire it by tweaking the VM settings and waiting.
+		expire_inodes
+		;;
+	sync)
+		# Execute the sync() system call.
+		sync
+		;;
+	fsync)
+		# Execute the fsync() system call on the file.
+		$XFS_IO_PROG -r $file -c fsync
+		;;
+	syncfs)
+		# Execute the syncfs() system call on the filesystem.
+		$XFS_IO_PROG $SCRATCH_MNT -c syncfs
+		;;
+	eviction)
+		# Evict the inode from memory.  In theory, drop_caches should do
+		# the trick by itself.  But that actually just dirties the
+		# inodes that need a lazytime update.  So we still need to wait
+		# for inode writeback too.
+		echo 2 > /proc/sys/vm/drop_caches
+		expire_inodes
+		;;
+	expiration)
+		# Expire the lazy timestamps via dirtytime_expire_seconds.
+		expire_timestamps
+		;;
+	*)
+		_fail "Unhandled persist_method: $persist_method"
+	esac
+
+	# Use the shutdown ioctl to abort the filesystem.
+	#
+	# The timestamp might have just been written to the log and not *fully*
+	# persisted yet, so use -f to ensure the log gets flushed.
+	_scratch_shutdown -f
+
+	# Now remount the filesystem and verify that the timestamp really got
+	# updated as expected.
+	_scratch_cycle_mount
+	local ondisk_time=$(get_timestamp $timestamp_type)
+	if (( ondisk_time != expected_time )); then
+		# Fail the test by printing unexpected output rather than by
+		# calling _fail(), since we can still run the other test cases.
+		echo "FAIL: lazytime $timestamp_type wasn't persisted by $persist_method"
+		echo "ondisk_time ($ondisk_time) != expected_time ($expected_time)"
+	fi
+}
+
+for timestamp_type in atime mtime ctime; do
+	do_test $timestamp_type other_inode_change
+	do_test $timestamp_type sync
+	do_test $timestamp_type fsync
+	do_test $timestamp_type syncfs
+	do_test $timestamp_type eviction
+	do_test $timestamp_type expiration
+done
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/900.out b/tests/generic/900.out
new file mode 100644
index 00000000..53bd2e29
--- /dev/null
+++ b/tests/generic/900.out
@@ -0,0 +1,37 @@
+QA output created by 900
+
+# Testing that lazytime atime update is persisted by other_inode_change
+
+# Testing that lazytime atime update is persisted by sync
+
+# Testing that lazytime atime update is persisted by fsync
+
+# Testing that lazytime atime update is persisted by syncfs
+
+# Testing that lazytime atime update is persisted by eviction
+
+# Testing that lazytime atime update is persisted by expiration
+
+# Testing that lazytime mtime update is persisted by other_inode_change
+
+# Testing that lazytime mtime update is persisted by sync
+
+# Testing that lazytime mtime update is persisted by fsync
+
+# Testing that lazytime mtime update is persisted by syncfs
+
+# Testing that lazytime mtime update is persisted by eviction
+
+# Testing that lazytime mtime update is persisted by expiration
+
+# Testing that lazytime ctime update is persisted by other_inode_change
+
+# Testing that lazytime ctime update is persisted by sync
+
+# Testing that lazytime ctime update is persisted by fsync
+
+# Testing that lazytime ctime update is persisted by syncfs
+
+# Testing that lazytime ctime update is persisted by eviction
+
+# Testing that lazytime ctime update is persisted by expiration
diff --git a/tests/generic/group b/tests/generic/group
index 30a73605..00b75b42 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -624,3 +624,4 @@
 619 auto rw enospc
 620 auto mount quick
 621 auto quick encrypt
+900 auto
-- 
2.30.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
