Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B7C2A0EE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJ4-0005mB-GW; Fri, 24 May 2019 22:04:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIIz-0005lw-RM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QipMibOhRCLlRCaCuVLlq5ybOo6NDWV+Nc69/ijyvb8=; b=lSXL1YMKqQmMuu+ngv/EVQ9SlB
 rNo68meG3ziqBP7ViZWVLNVrIDYNkw1UsWDZ6w1hNNPRbmPpLa1IK5mQeFoNGmOolQ6wwlaImcPXh
 LH+LF9UsQGeE5ylJiGGC36GkGG0r9COkMAecIU/XdQjfRFRLE9Mcb7hQxd18nHmq/sZU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QipMibOhRCLlRCaCuVLlq5ybOo6NDWV+Nc69/ijyvb8=; b=T73FODZQMRixLnWZg15A0SDPJH
 pj4oD72Xw7HYZUEwfEmy/LgbLFI4rJrUSHVehxQGmEjoFlDwhAC5tfuZFXnHITPXHhKzm/ql379Ua
 rUv4PzyyPzBrmRrM4qa24M8TjL50dFfvY/BAbquYmaWc4JH3ST8plkemSIlj1VVmHevQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIIy-00EpER-1b
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A33A921848;
 Fri, 24 May 2019 22:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735481;
 bh=SjUAAPrCosMj1zpeSzo6jmYVTfl6Ul3ADRujFmKZJKA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hR6icy/blBLGl5T4CS9n0xMZe77XcZ9SBX23x6h8WY+l64nFPF28rpjcZfWMQ7CNA
 wwxK1THGAaISFKwnzL/wVaB1LQ93cEXgxctPmUqPnsUc+oljX8WP4DVOaSdOUzBpbT
 CZ6ZKw8QR+MmnNN9qfAW0FMjukylVF19PAjzFQwg=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:19 -0700
Message-Id: <20190524220425.201170-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190524220425.201170-1-ebiggers@kernel.org>
References: <20190524220425.201170-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hUIIy-00EpER-1b
Subject: [f2fs-dev] [PATCH v2 1/7] common/encrypt: introduce helpers for
 set_encpolicy and get_encpolicy
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

For conciseness in tests, add helper functions that wrap the xfs_io
commands 'set_encpolicy' and 'get_encpolicy'.  Then update all
encryption tests to use them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/encrypt        | 29 +++++++++++++++++++++++++++--
 tests/ext4/024        |  3 +--
 tests/generic/395     | 26 ++++++++++++--------------
 tests/generic/395.out |  2 +-
 tests/generic/396     | 15 +++++++--------
 tests/generic/397     |  3 +--
 tests/generic/398     |  5 ++---
 tests/generic/399     |  3 +--
 tests/generic/419     |  3 +--
 tests/generic/421     |  3 +--
 tests/generic/429     |  3 +--
 tests/generic/435     |  3 +--
 tests/generic/440     |  5 ++---
 13 files changed, 58 insertions(+), 45 deletions(-)

diff --git a/common/encrypt b/common/encrypt
index 1b10aa71..cbe0b73d 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -38,8 +38,7 @@ _require_scratch_encryption()
 	# presence of /sys/fs/ext4/features/encryption, but this is broken on
 	# some older kernels and is ext4-specific anyway.)
 	mkdir $SCRATCH_MNT/tmpdir
-	if $XFS_IO_PROG -c set_encpolicy $SCRATCH_MNT/tmpdir \
-		2>&1 >>$seqres.full | \
+	if _set_encpolicy $SCRATCH_MNT/tmpdir 2>&1 >>$seqres.full | \
 		egrep -q 'Inappropriate ioctl for device|Operation not supported'
 	then
 		_notrun "kernel does not support $FSTYP encryption"
@@ -175,3 +174,29 @@ _revoke_encryption_key()
 	local keyid=$($KEYCTL_PROG search @s logon $FSTYP:$keydesc)
 	$KEYCTL_PROG revoke $keyid >>$seqres.full
 }
+
+# Set an encryption policy on the specified directory.
+_set_encpolicy()
+{
+	local dir=$1
+	shift
+
+	$XFS_IO_PROG -c "set_encpolicy $*" "$dir"
+}
+
+_user_do_set_encpolicy()
+{
+	local dir=$1
+	shift
+
+	_user_do "$XFS_IO_PROG -c \"set_encpolicy $*\" \"$dir\""
+}
+
+# Display the specified file or directory's encryption policy.
+_get_encpolicy()
+{
+	local file=$1
+	shift
+
+	$XFS_IO_PROG -c "get_encpolicy $*" "$file"
+}
diff --git a/tests/ext4/024 b/tests/ext4/024
index c54d2519..a86cc417 100755
--- a/tests/ext4/024
+++ b/tests/ext4/024
@@ -33,7 +33,6 @@ rm -f $seqres.full
 _supported_fs ext4
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 
 _new_session_keyring
@@ -55,7 +54,7 @@ _scratch_mkfs_encrypted &>>$seqres.full
 _scratch_mount
 mkdir $SCRATCH_MNT/edir
 keydesc=$(_generate_encryption_key)
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc
 echo foo > $SCRATCH_MNT/edir/file
 inum=$(stat -c '%i' $SCRATCH_MNT/edir/file)
 _scratch_unmount
diff --git a/tests/generic/395 b/tests/generic/395
index cae97cef..2a16334f 100755
--- a/tests/generic/395
+++ b/tests/generic/395
@@ -34,7 +34,6 @@ _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
 _require_xfs_io_command "get_encpolicy"
-_require_xfs_io_command "set_encpolicy"
 _require_user
 
 _scratch_mkfs_encrypted &>> $seqres.full
@@ -45,7 +44,7 @@ check_no_policy()
 	# When a file is unencrypted, FS_IOC_GET_ENCRYPTION_POLICY currently
 	# fails with ENOENT on ext4 but with ENODATA on f2fs.  TODO: it's
 	# planned to consistently use ENODATA.  For now this test accepts both.
-	$XFS_IO_PROG -c "get_encpolicy" $1 |&
+	_get_encpolicy $1 |&
 		sed -e 's/No such file or directory/No data available/'
 }
 
@@ -54,25 +53,25 @@ empty_dir=$SCRATCH_MNT/empty_dir
 echo -e "\n*** Setting encryption policy on empty directory ***"
 mkdir $empty_dir
 check_no_policy $empty_dir |& _filter_scratch
-$XFS_IO_PROG -c "set_encpolicy 0000111122223333" $empty_dir
-$XFS_IO_PROG -c "get_encpolicy" $empty_dir | _filter_scratch
+_set_encpolicy $empty_dir 0000111122223333
+_get_encpolicy $empty_dir | _filter_scratch
 
 # Should be able to set the same policy again, but not a different one.
 # TODO: the error code for "already has a different policy" is planned to switch
 # from EINVAL to EEXIST.  For now this test accepts both.
 echo -e "\n*** Setting encryption policy again ***"
-$XFS_IO_PROG -c "set_encpolicy 0000111122223333" $empty_dir
-$XFS_IO_PROG -c "get_encpolicy" $empty_dir | _filter_scratch
-$XFS_IO_PROG -c "set_encpolicy 4444555566667777" $empty_dir |& \
+_set_encpolicy $empty_dir 0000111122223333
+_get_encpolicy $empty_dir | _filter_scratch
+_set_encpolicy $empty_dir 4444555566667777 |& \
 	_filter_scratch | sed -e 's/Invalid argument/File exists/'
-$XFS_IO_PROG -c "get_encpolicy" $empty_dir | _filter_scratch
+_get_encpolicy $empty_dir | _filter_scratch
 
 # Should *not* be able to set an encryption policy on a nonempty directory
 nonempty_dir=$SCRATCH_MNT/nonempty_dir
 echo -e "\n*** Setting encryption policy on nonempty directory ***"
 mkdir $nonempty_dir
 touch $nonempty_dir/file
-$XFS_IO_PROG -c "set_encpolicy" $nonempty_dir |& _filter_scratch
+_set_encpolicy $nonempty_dir |& _filter_scratch
 check_no_policy $nonempty_dir |& _filter_scratch
 
 # Should *not* be able to set an encryption policy on a nondirectory file, even
@@ -83,7 +82,7 @@ check_no_policy $nonempty_dir |& _filter_scratch
 nondirectory=$SCRATCH_MNT/nondirectory
 echo -e "\n*** Setting encryption policy on nondirectory ***"
 touch $nondirectory
-$XFS_IO_PROG -c "set_encpolicy" $nondirectory |& \
+_set_encpolicy $nondirectory |& \
 	_filter_scratch | sed -e 's/Invalid argument/Not a directory/'
 check_no_policy $nondirectory |& _filter_scratch
 
@@ -93,8 +92,7 @@ check_no_policy $nondirectory |& _filter_scratch
 unauthorized_dir=$SCRATCH_MNT/unauthorized_dir
 echo -e "\n*** Setting encryption policy on another user's directory ***"
 mkdir $unauthorized_dir
-su $qa_user -c "$XFS_IO_PROG -c \"set_encpolicy\" $unauthorized_dir" |& \
-	_filter_scratch
+_user_do_set_encpolicy $unauthorized_dir |& _filter_scratch
 check_no_policy $unauthorized_dir |& _filter_scratch
 
 # Should *not* be able to set an encryption policy on a directory on a
@@ -104,12 +102,12 @@ check_no_policy $unauthorized_dir |& _filter_scratch
 echo -e "\n*** Setting encryption policy on readonly filesystem ***"
 mkdir $SCRATCH_MNT/ro_dir $SCRATCH_MNT/ro_bind_mnt
 _scratch_remount ro
-$XFS_IO_PROG -c "set_encpolicy" $SCRATCH_MNT/ro_dir |& _filter_scratch
+_set_encpolicy $SCRATCH_MNT/ro_dir |& _filter_scratch
 check_no_policy $SCRATCH_MNT/ro_dir |& _filter_scratch
 _scratch_remount rw
 mount --bind $SCRATCH_MNT $SCRATCH_MNT/ro_bind_mnt
 mount -o remount,ro,bind $SCRATCH_MNT/ro_bind_mnt
-$XFS_IO_PROG -c "set_encpolicy" $SCRATCH_MNT/ro_bind_mnt/ro_dir |& _filter_scratch
+_set_encpolicy $SCRATCH_MNT/ro_bind_mnt/ro_dir |& _filter_scratch
 check_no_policy $SCRATCH_MNT/ro_bind_mnt/ro_dir |& _filter_scratch
 umount $SCRATCH_MNT/ro_bind_mnt
 
diff --git a/tests/generic/395.out b/tests/generic/395.out
index 90c450f2..2c55d7a9 100644
--- a/tests/generic/395.out
+++ b/tests/generic/395.out
@@ -33,7 +33,7 @@ SCRATCH_MNT/nondirectory: failed to set encryption policy: Not a directory
 SCRATCH_MNT/nondirectory: failed to get encryption policy: No data available
 
 *** Setting encryption policy on another user's directory ***
-SCRATCH_MNT/unauthorized_dir: failed to set encryption policy: Permission denied
+Permission denied
 SCRATCH_MNT/unauthorized_dir: failed to get encryption policy: No data available
 
 *** Setting encryption policy on readonly filesystem ***
diff --git a/tests/generic/396 b/tests/generic/396
index 50c2c2e0..7027c339 100755
--- a/tests/generic/396
+++ b/tests/generic/396
@@ -34,7 +34,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 
 _scratch_mkfs_encrypted &>> $seqres.full
 _scratch_mount
@@ -42,23 +41,23 @@ dir=$SCRATCH_MNT/dir
 mkdir $dir
 
 echo -e "\n*** Invalid contents encryption mode ***"
-$XFS_IO_PROG -c "set_encpolicy -c 0xFF" $dir |& _filter_scratch
+_set_encpolicy $dir -c 0xFF |& _filter_scratch
 
 echo -e "\n*** Invalid filenames encryption mode ***"
-$XFS_IO_PROG -c "set_encpolicy -n 0xFF" $dir |& _filter_scratch
+_set_encpolicy $dir -n 0xFF |& _filter_scratch
 
 echo -e "\n*** Invalid flags ***"
-$XFS_IO_PROG -c "set_encpolicy -f 0xFF" $dir |& _filter_scratch
+_set_encpolicy $dir -f 0xFF |& _filter_scratch
 
 echo -e "\n*** Invalid policy version ***"
-$XFS_IO_PROG -c "set_encpolicy -v 0xFF" $dir |& _filter_scratch
+_set_encpolicy $dir -v 0xFF |& _filter_scratch
 
 # Currently, the only supported combination of modes is AES-256-XTS for contents
 # and AES-256-CTS for filenames.  Nothing else should be accepted.
 echo -e "\n*** Invalid combinations of modes ***"
-$XFS_IO_PROG -c "set_encpolicy -c AES-256-CTS -n AES-256-CTS" $dir |& _filter_scratch
-$XFS_IO_PROG -c "set_encpolicy -c AES-256-CTS -n AES-256-XTS" $dir |& _filter_scratch
-$XFS_IO_PROG -c "set_encpolicy -c AES-256-XTS -n AES-256-XTS" $dir |& _filter_scratch
+_set_encpolicy $dir -c AES-256-CTS -n AES-256-CTS |& _filter_scratch
+_set_encpolicy $dir -c AES-256-CTS -n AES-256-XTS |& _filter_scratch
+_set_encpolicy $dir -c AES-256-XTS -n AES-256-XTS |& _filter_scratch
 
 # success, all done
 status=0
diff --git a/tests/generic/397 b/tests/generic/397
index c2f779a4..a97e866b 100755
--- a/tests/generic/397
+++ b/tests/generic/397
@@ -37,7 +37,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 
 _new_session_keyring
@@ -47,7 +46,7 @@ _scratch_mount
 
 mkdir $SCRATCH_MNT/edir $SCRATCH_MNT/ref_dir
 keydesc=$(_generate_encryption_key)
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc
 for dir in $SCRATCH_MNT/edir $SCRATCH_MNT/ref_dir; do
 	touch $dir/empty > /dev/null
 	$XFS_IO_PROG -t -f -c "pwrite 0 4k" $dir/a > /dev/null
diff --git a/tests/generic/398 b/tests/generic/398
index ecf82690..b1af65e5 100755
--- a/tests/generic/398
+++ b/tests/generic/398
@@ -56,7 +56,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _requires_renameat2
 
 _new_session_keyring
@@ -71,8 +70,8 @@ udir=$SCRATCH_MNT/udir
 mkdir $edir1 $edir2 $udir
 keydesc1=$(_generate_encryption_key)
 keydesc2=$(_generate_encryption_key)
-$XFS_IO_PROG -c "set_encpolicy $keydesc1" $edir1
-$XFS_IO_PROG -c "set_encpolicy $keydesc2" $edir2
+_set_encpolicy $edir1 $keydesc1
+_set_encpolicy $edir2 $keydesc2
 touch $edir1/efile1
 touch $edir2/efile2
 touch $udir/ufile
diff --git a/tests/generic/399 b/tests/generic/399
index 5e55096f..5625503b 100755
--- a/tests/generic/399
+++ b/tests/generic/399
@@ -43,7 +43,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$XZ_PROG" xz
 _require_command "$KEYCTL_PROG" keyctl
 
@@ -64,7 +63,7 @@ _scratch_mount
 
 keydesc=$(_generate_encryption_key)
 mkdir $SCRATCH_MNT/encrypted_dir
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/encrypted_dir
+_set_encpolicy $SCRATCH_MNT/encrypted_dir $keydesc
 
 # Create the "same" symlink in two different directories.
 # Later we'll check both the name and target of the symlink.
diff --git a/tests/generic/419 b/tests/generic/419
index 1014764c..2f1d34c6 100755
--- a/tests/generic/419
+++ b/tests/generic/419
@@ -38,7 +38,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 _requires_renameat2
 
@@ -49,7 +48,7 @@ _scratch_mount
 
 mkdir $SCRATCH_MNT/edir
 keydesc=$(_generate_encryption_key)
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc
 echo a > $SCRATCH_MNT/edir/a
 echo b > $SCRATCH_MNT/edir/b
 _unlink_encryption_key $keydesc
diff --git a/tests/generic/421 b/tests/generic/421
index 415e14b5..c8cc2dcc 100755
--- a/tests/generic/421
+++ b/tests/generic/421
@@ -35,7 +35,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 
 _new_session_keyring
@@ -53,7 +52,7 @@ slice=2
 rm -rf $dir
 mkdir $dir
 keydesc=$(_generate_encryption_key)
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $dir
+_set_encpolicy $dir $keydesc
 $XFS_IO_PROG -f $file -c "pwrite 0 $((nproc*slice))M" -c "fsync" > /dev/null
 
 # Create processes to read from the encrypted file.  Use fadvise to wipe the
diff --git a/tests/generic/429 b/tests/generic/429
index 5f5b056a..472fdbd9 100755
--- a/tests/generic/429
+++ b/tests/generic/429
@@ -46,7 +46,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 _require_test_program "t_encrypted_d_revalidate"
 
@@ -58,7 +57,7 @@ keydesc=$(_generate_key_descriptor)
 raw_key=$(_generate_raw_encryption_key)
 mkdir $SCRATCH_MNT/edir
 _add_encryption_key $keydesc $raw_key
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc
 
 # Create two files in the directory: one whose name is valid in the base64
 # format used for encoding ciphertext filenames, and one whose name is not.  The
diff --git a/tests/generic/435 b/tests/generic/435
index baed1bdc..073596f3 100755
--- a/tests/generic/435
+++ b/tests/generic/435
@@ -42,7 +42,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 
 # set up an encrypted directory
@@ -53,7 +52,7 @@ _scratch_mount
 mkdir $SCRATCH_MNT/edir
 keydesc=$(_generate_encryption_key)
 # -f 0x2: zero-pad to 16-byte boundary (i.e. encryption block boundary)
-$XFS_IO_PROG -c "set_encpolicy -f 0x2 $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc -f 0x2
 
 # Create files with long names (> 32 bytes, long enough to trigger the use of
 # "digested" names) in the encrypted directory.
diff --git a/tests/generic/440 b/tests/generic/440
index 5013f276..434286f4 100755
--- a/tests/generic/440
+++ b/tests/generic/440
@@ -38,7 +38,6 @@ rm -f $seqres.full
 _supported_fs generic
 _supported_os Linux
 _require_scratch_encryption
-_require_xfs_io_command "set_encpolicy"
 _require_command "$KEYCTL_PROG" keyctl
 
 # Set up an encryption-capable filesystem and an encryption key.
@@ -52,7 +51,7 @@ _add_encryption_key $keydesc $raw_key
 # Set up an encrypted directory containing a regular file, a subdirectory, and a
 # symlink.
 mkdir $SCRATCH_MNT/edir
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir
+_set_encpolicy $SCRATCH_MNT/edir $keydesc
 mkdir $SCRATCH_MNT/edir/subdir
 ln -s target $SCRATCH_MNT/edir/symlink
 echo contents > $SCRATCH_MNT/edir/file
@@ -82,7 +81,7 @@ echo
 echo "***** Child has key, but parent doesn't *****"
 _add_encryption_key $keydesc $raw_key
 mkdir $SCRATCH_MNT/edir2
-$XFS_IO_PROG -c "set_encpolicy $keydesc" $SCRATCH_MNT/edir2
+_set_encpolicy $SCRATCH_MNT/edir2 $keydesc
 ln $SCRATCH_MNT/edir/file $SCRATCH_MNT/edir2/link
 _scratch_cycle_mount
 cat $SCRATCH_MNT/edir2/link
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
