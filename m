Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 435084DCC2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 23:38:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1he4ld-0003zm-RV; Thu, 20 Jun 2019 21:38:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1he4lX-0003zQ-RO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7IQfp55+ErdeaZ9hhZowNIjRqXHcAUbqHL1TqZ9mNr4=; b=OoL6RbNQpXGoggUJPSG62hP6Vp
 jWjdGKATsa6EkJ7rFkOAECheTFYl8zehYd835Ds0OYnFiBLkLHNROYWGPzUp+zhQcGBaX5qhiP/9A
 vtvuerONZwhn9EDlS5hLgAs+vzx83O9JTBhTfHwu4g4jTvW7IqpIIiowaDearKSJdKdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7IQfp55+ErdeaZ9hhZowNIjRqXHcAUbqHL1TqZ9mNr4=; b=lQfSGvDJlePX1SXrGeDYEepBrx
 hFgLfLgQkRTVU8eWSlzrj6k8SQ8WhQY8tQH5Uq8hKt1qAowjgWJYecd2qorYvPfCLKHm0Nr9EotYT
 PSilqF5u4PLthKb136pxhQDRos45nFEKE8uebvCa9qUl7n9Ku+IYXr4tWRxCNZMj/1H8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1he4lX-006aPN-Ap
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 21:38:44 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F1302085A;
 Thu, 20 Jun 2019 21:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561066717;
 bh=HeWLaZx8vNDd7SwrPn4f5AIlPq+mBHnG456nIkYnQjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rfIKpazNDw1bB4C0/XZpZm2Dww4Ln3wetmFc7WOjsnOQ1Sq6/yvmvnVxmNPqBtTJD
 xmP+5sfHRul6vItjTbM4Kl5tXBl997Ahf/M1u//ASjVYxdgU6N7dkNeV5LB2I1Sjhi
 q31wKs8W1kkDNx3SwhIpdTpis6qnIJqwMrzKKZL8=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Thu, 20 Jun 2019 14:36:08 -0700
Message-Id: <20190620213614.113685-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190620213614.113685-1-ebiggers@kernel.org>
References: <20190620213614.113685-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
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
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1he4lX-006aPN-Ap
Subject: [f2fs-dev] [RFC PATCH v2 2/8] common/verity: add common functions
 for testing fs-verity
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

Add common functions for setting up and testing fs-verity, a new feature
for read-only file-based authenticity protection.  fs-verity will be
supported by ext4 and f2fs, and perhaps by other filesystems later.
Running the fs-verity tests requires:

- A kernel with the fs-verity patches from
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
  branch "fsverity" and configured with CONFIG_FS_VERITY.
- The fsverity utility program from
  https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git
- e2fsprogs v1.45.2 or later for ext4 tests, or f2fs-tools v1.11.0 or
  later for f2fs tests.

See the file Documentation/filesystems/fsverity.rst in the kernel tree
for more information about fs-verity.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/config |   1 +
 common/verity | 189 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 common/verity

diff --git a/common/config b/common/config
index bd64be62..001ddc45 100644
--- a/common/config
+++ b/common/config
@@ -212,6 +212,7 @@ export CHECKBASHISMS_PROG="$(type -P checkbashisms)"
 export XFS_INFO_PROG="$(type -P xfs_info)"
 export DUPEREMOVE_PROG="$(type -P duperemove)"
 export CC_PROG="$(type -P cc)"
+export FSVERITY_PROG="$(type -P fsverity)"
 
 # use 'udevadm settle' or 'udevsettle' to wait for lv to be settled.
 # newer systems have udevadm command but older systems like RHEL5 don't.
diff --git a/common/verity b/common/verity
new file mode 100644
index 00000000..86fb6585
--- /dev/null
+++ b/common/verity
@@ -0,0 +1,189 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2018 Google LLC
+#
+# Functions for setting up and testing fs-verity
+
+_require_scratch_verity()
+{
+	_require_scratch
+	_require_command "$FSVERITY_PROG" fsverity
+
+	if ! _scratch_mkfs_verity &>>$seqres.full; then
+		# ext4: need e2fsprogs v1.44.5 or later (but actually v1.45.2+
+		#       is needed for some tests to pass, due to an e2fsck bug)
+		# f2fs: need f2fs-tools v1.11.0 or later
+		_notrun "$FSTYP userspace tools don't support fs-verity"
+	fi
+
+	# Try to mount the filesystem.  If this fails then either the kernel
+	# isn't aware of fs-verity, or the mkfs options were not compatible with
+	# verity (e.g. ext4 with block size != PAGE_SIZE).
+	if ! _try_scratch_mount &>>$seqres.full; then
+		_notrun "kernel is unaware of $FSTYP verity feature," \
+			"or mkfs options are not compatible with verity"
+	fi
+	_scratch_unmount
+
+	# The filesystem may be aware of fs-verity but have it disabled by
+	# CONFIG_FS_VERITY=n.  Detect support via sysfs.
+	if [ ! -e /sys/fs/$FSTYP/features/verity ]; then
+		_notrun "kernel $FSTYP isn't configured with verity support"
+	fi
+
+	# Merkle tree block size.  Currently all filesystems only support
+	# PAGE_SIZE for this.  This is also the default for 'fsverity enable'.
+	FSV_BLOCK_SIZE=$(get_page_size)
+}
+
+_scratch_mkfs_verity()
+{
+	case $FSTYP in
+	ext4|f2fs)
+		_scratch_mkfs -O verity
+		;;
+	*)
+		_notrun "No verity support for $FSTYP"
+		;;
+	esac
+}
+
+_scratch_mkfs_encrypted_verity()
+{
+	case $FSTYP in
+	ext4)
+		_scratch_mkfs -O encrypt,verity
+		;;
+	f2fs)
+		# f2fs-tools as of v1.11.0 doesn't allow comma-separated
+		# features with -O.  Instead -O must be supplied multiple times.
+		_scratch_mkfs -O encrypt -O verity
+		;;
+	*)
+		_notrun "$FSTYP not supported in _scratch_mkfs_encrypted_verity"
+		;;
+	esac
+}
+
+_fsv_scratch_begin_subtest()
+{
+	local msg=$1
+
+	rm -rf "${SCRATCH_MNT:?}"/*
+	echo -e "\n# $msg"
+}
+
+_fsv_enable()
+{
+	$FSVERITY_PROG enable "$@"
+}
+
+_fsv_measure()
+{
+        $FSVERITY_PROG measure "$@" | awk '{print $1}'
+}
+
+# Generate a file, then enable verity on it.
+_fsv_create_enable_file()
+{
+	local file=$1
+	shift
+
+	head -c $((FSV_BLOCK_SIZE * 2)) /dev/zero > "$file"
+	_fsv_enable "$file" "$@"
+}
+
+_fsv_have_hash_algorithm()
+{
+	local hash_alg=$1
+	local test_file=$2
+
+	rm -f $test_file
+	head -c 4096 /dev/zero > $test_file
+	if ! _fsv_enable --hash-alg=$hash_alg $test_file &>> $seqres.full; then
+		# no kernel support
+		return 1
+	fi
+	rm -f $test_file
+	return 0
+}
+
+#
+# _fsv_scratch_corrupt_bytes - Write some bytes to a file, bypassing the filesystem
+#
+# Write the bytes sent on stdin to the given offset in the given file, but do so
+# by writing directly to the extents on the block device, with the filesystem
+# unmounted.  This can be used to corrupt a verity file for testing purposes,
+# bypassing the restrictions imposed by the filesystem.
+#
+# The file is assumed to be located on $SCRATCH_DEV.
+#
+_fsv_scratch_corrupt_bytes()
+{
+	local file=$1
+	local offset=$2
+	local lstart lend pstart pend
+	local dd_cmds=()
+	local cmd
+
+	sync	# Sync to avoid unwritten extents
+
+	cat > $tmp.bytes
+	local end=$(( offset + $(stat -c %s $tmp.bytes ) ))
+
+	# For each extent that intersects the requested range in order, add a
+	# command that writes the next part of the data to that extent.
+	while read -r lstart lend pstart pend; do
+		lstart=$((lstart * 512))
+		lend=$(((lend + 1) * 512))
+		pstart=$((pstart * 512))
+		pend=$(((pend + 1) * 512))
+
+		if (( lend - lstart != pend - pstart )); then
+			_fail "Logical and physical extent lengths differ for file '$file'"
+		elif (( offset < lstart )); then
+			_fail "Hole in file '$file' at byte $offset.  Next extent begins at byte $lstart"
+		elif (( offset < lend )); then
+			local len=$((lend - offset))
+			local seek=$((pstart + (offset - lstart)))
+			dd_cmds+=("head -c $len | dd of=$SCRATCH_DEV oflag=seek_bytes seek=$seek status=none")
+			(( offset += len ))
+		fi
+	done < <($XFS_IO_PROG -r -c "fiemap $offset $((end - offset))" "$file" \
+		 | _filter_xfs_io_fiemap)
+
+	if (( offset < end )); then
+		_fail "Extents of file '$file' ended at byte $offset, but needed until $end"
+	fi
+
+	# Execute the commands to write the data
+	_scratch_unmount
+	for cmd in "${dd_cmds[@]}"; do
+		eval "$cmd"
+	done < $tmp.bytes
+	sync	# Sync to flush the block device's pagecache
+	_scratch_mount
+}
+
+#
+# _fsv_scratch_corrupt_merkle_tree - Corrupt a file's Merkle tree
+#
+# Like _fsv_scratch_corrupt_bytes(), but this corrupts the file's fs-verity
+# Merkle tree.  The offset is given as a byte offset into the Merkle tree.
+#
+_fsv_scratch_corrupt_merkle_tree()
+{
+	local file=$1
+	local offset=$2
+
+	case $FSTYP in
+	ext4|f2fs)
+		# ext4 and f2fs store the Merkle tree after the file contents
+		# itself, starting at the next 65536-byte aligned boundary.
+		(( offset += ($(stat -c %s $file) + 65535) & ~65535 ))
+		_fsv_scratch_corrupt_bytes $file $offset
+		;;
+	*)
+		_fail "_fsv_scratch_corrupt_merkle_tree() unimplemented on $FSTYP"
+		;;
+	esac
+}
-- 
2.22.0.410.gd8fdbe21b5-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
