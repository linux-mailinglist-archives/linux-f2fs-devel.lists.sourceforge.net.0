Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FB2A0ED
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJ2-0002PN-9n; Fri, 24 May 2019 22:04:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIIz-0002Ov-VY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qZWp2Hyy7X4gg7HaAVAUqBQAUj52U0fBWy5SQw+Jgtk=; b=NovQ4BayGkpnr4ngiv6BRh+qmr
 np7rifGR2wuhExJ39+4oUBOZQ5UZJ+tasv+2Ixg/62vP9xOCpwK9LJv8qmR/KHYsrptkG90VCwrD/
 OZiNvwMajo1wWSvdfoGL7LJKE5C9+VAO9cb65xIAO2YgnhqmIxqsCK7sRx3UjN+AEUME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qZWp2Hyy7X4gg7HaAVAUqBQAUj52U0fBWy5SQw+Jgtk=; b=XoHa78elKOubqlo3Gr3OdtVaI+
 S0IzIaFXWcDm8iAkC0Ictdd6owIy4uTxGi9+S3CFKB8QM/xIhg0tUBJzVwmUdQoBszvwrtTYV6CcG
 iNWSO70cImdtdPO8ho/EuaQXthIwSR8gE9zYCo8og2rGAppeiBpPS7FnAzt5XXrUWPpM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIIy-00EpEZ-CC
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A14D92186A;
 Fri, 24 May 2019 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735482;
 bh=Hldth5dMxt0X+q4+e1pA+Q67BlHQsuKG7U26R2b9X78=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NaJ3hVBhL8ZQpn7zSSWvtos74OKBjRzsw1q6qoLPseyegG8B07rDw7uIFAr1tyGqC
 hHjjl7Ll/7yFrsYznz3w4Kbc+0tGg4Lx61BfojV2JHh/FG0D0zTrT1SapM5Z3M+Pix
 aMS3v8DpBFQuBhN2ZVUJ1je7ufTYDHuOnNtSllpA=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:22 -0700
Message-Id: <20190524220425.201170-5-ebiggers@kernel.org>
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
X-Headers-End: 1hUIIy-00EpEZ-CC
Subject: [f2fs-dev] [PATCH v2 4/7] common/encrypt: add helper for ciphertext
 verification tests
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

Introduce a function _verify_ciphertext_for_encryption_policy() which
verifies the correctness of encryption with the specified settings.

Basically, it does the following:

1. If missing any prerequisites, skip the test.

2. Create files in encrypted directories on the scratch device.

3. Unmount the scratch device and compare the actual ciphertext stored
   on-disk to the ciphertext computed by the fscrypt-crypt-util program.

Both file contents and names are verified, and non-default encryption
modes are supported.  Previously, non-default encryption modes were
untested by xfstests.  Also, while there's an existing test generic/399
that checks that encrypted contents seem random, it doesn't actually
test for correctness, nor does it test filenames encryption.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/encrypt | 392 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 392 insertions(+)

diff --git a/common/encrypt b/common/encrypt
index a4ffc531..13098d7f 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -258,3 +258,395 @@ _get_encpolicy()
 
 	$XFS_IO_PROG -c "get_encpolicy $*" "$file"
 }
+
+# Retrieve the encryption nonce of the given inode as a hex string.  The nonce
+# was randomly generated by the filesystem and isn't exposed directly to
+# userspace.  But it can be read using the filesystem's debugging tools.
+_get_encryption_nonce()
+{
+	local device=$1
+	local inode=$2
+
+	case $FSTYP in
+	ext4)
+		# Use debugfs to dump the special xattr named "c", which is the
+		# file's fscrypt_context.  This produces a line like:
+		#
+		#	c (28) = 01 01 04 02 00 00 00 00 00 00 00 00 ef bd 18 76 5d f6 41 4e c0 a2 cd 5f 91 29 7e 12
+		#
+		# Then filter it to get just the 16-byte 'nonce' field at the end:
+		#
+		#	efbd18765df6414ec0a2cd5f91297e12
+		#
+		$DEBUGFS_PROG $device -R "ea_get <$inode> c" 2>>$seqres.full \
+			| grep '^c ' | sed 's/^.*=//' | tr -d ' \n' | tail -c 32
+		;;
+	f2fs)
+		# dump.f2fs prints the fscrypt_context like:
+		#
+		#	xattr: e_name_index:9 e_name:c e_name_len:1 e_value_size:28 e_value:
+		#	format: 1
+		#	contents_encryption_mode: 0x1
+		#	filenames_encryption_mode: 0x4
+		#	flags: 0x2
+		#	master_key_descriptor: 0000000000000000
+		#	nonce: EFBD18765DF6414EC0A2CD5F91297E12
+		$DUMP_F2FS_PROG -i $inode $device | awk '
+			/\<e_name:c\>/ { found = 1 }
+			/^nonce:/ && found {
+				print substr($0, length($0) - 31, 32);
+				found = 0;
+			}'
+		;;
+	*)
+		_fail "_get_encryption_nonce() isn't implemented on $FSTYP"
+		;;
+	esac
+}
+
+# Require support for _get_encryption_nonce()
+_require_get_encryption_nonce_support()
+{
+	echo "Checking for _get_encryption_nonce() support for $FSTYP" >> $seqres.full
+	case $FSTYP in
+	ext4)
+		_require_command "$DEBUGFS_PROG" debugfs
+		;;
+	f2fs)
+		_require_command "$DUMP_F2FS_PROG" dump.f2fs
+		;;
+	*)
+		_notrun "_get_encryption_nonce() isn't implemented on $FSTYP"
+		;;
+	esac
+}
+
+# Retrieve the encrypted filename stored on-disk for the given file.
+# The name is printed to stdout in binary.
+_get_ciphertext_filename()
+{
+	local device=$1
+	local inode=$2
+	local dir_inode=$3
+
+	case $FSTYP in
+	ext4)
+		# Extract the filename from the debugfs output line like:
+		#
+		#  131075  100644 (1)      0      0       0 22-Apr-2019 16:54 \xa2\x85\xb0z\x13\xe9\x09\x86R\xed\xdc\xce\xad\x14d\x19
+		#
+		# Bytes are shown either literally or as \xHH-style escape
+		# sequences; we have to decode the escaped bytes here.
+		#
+		$DEBUGFS_PROG $device -R "ls -l -r <$dir_inode>" \
+					2>>$seqres.full | perl -ne '
+			next if not /^\s*'$inode'\s+/;
+			s/.*?\d\d:\d\d //;
+			chomp;
+			s/\\x([[:xdigit:]]{2})/chr hex $1/eg;
+			print;'
+		;;
+	f2fs)
+		# Extract the filename from the dump.f2fs output line like:
+		#
+		#  i_name                        		[UpkzIPuts9by1oDmE+Ivfw]
+		#
+		# The name is shown base64-encoded; we have to decode it here.
+		#
+		$DUMP_F2FS_PROG $device -i $inode | perl -ne '
+			next if not /^i_name\s+\[([A-Za-z0-9+,]+)\]/;
+			chomp $1;
+			my @chars = split //, $1;
+			my $ac = 0;
+			my $bits = 0;
+			my $table = join "", (A..Z, a..z, 0..9, "+", ",");
+			foreach (@chars) {
+				$ac += index($table, $_) << $bits;
+				$bits += 6;
+				if ($bits >= 8) {
+					print chr($ac & 0xff);
+					$ac >>= 8;
+					$bits -= 8;
+				}
+			}
+			if ($ac != 0) {
+				print STDERR "Invalid base64-encoded string!\n";
+			}'
+		;;
+	*)
+		_fail "_get_ciphertext_filename() isn't implemented on $FSTYP"
+		;;
+	esac
+}
+
+# Require support for _get_ciphertext_filename().
+_require_get_ciphertext_filename_support()
+{
+	echo "Checking for _get_ciphertext_filename() support for $FSTYP" >> $seqres.full
+	case $FSTYP in
+	ext4)
+		# Verify that the "ls -l -r" debugfs command is supported and
+		# that it hex-encodes non-ASCII characters, rather than using an
+		# ambiguous escaping method.  This requires e2fsprogs v1.45.1 or
+		# later; or more specifically, a version that has the commit
+		# "debugfs: avoid ambiguity when printing filenames".
+		_require_command "$DEBUGFS_PROG" debugfs
+		_scratch_mount
+		touch $SCRATCH_MNT/$'\xc1'
+		_scratch_unmount
+		if ! $DEBUGFS_PROG $SCRATCH_DEV -R "ls -l -r /" 2>&1 \
+			| tee -a $seqres.full | grep -E -q '\s+\\xc1\s*$'; then
+			_notrun "debugfs (e2fsprogs) is too old; doesn't support showing unambiguous on-disk filenames"
+		fi
+		;;
+	f2fs)
+		# Verify that dump.f2fs shows encrypted filenames in full.  This
+		# requires f2fs-tools v1.13.0 or later; or more specifically, a
+		# version that has the commit
+		# "f2fs-tools: improve filename printing".
+
+		_require_command "$DUMP_F2FS_PROG" dump.f2fs
+		_require_command "$KEYCTL_PROG" keyctl
+		_scratch_mount
+		_new_session_keyring
+
+		local keydesc=$(_generate_encryption_key)
+		local dir=$SCRATCH_MNT/test.${FUNCNAME[0]}
+		local file=$dir/$(perl -e 'print "A" x 255')
+		mkdir $dir
+		_set_encpolicy $dir $keydesc
+		touch $file
+		local inode=$(stat -c %i $file)
+
+		_scratch_unmount
+		$KEYCTL_PROG clear @s
+
+		# 255-character filename should result in 340 base64 characters.
+		if ! $DUMP_F2FS_PROG -i $inode $SCRATCH_DEV \
+			| grep -E -q '^i_name[[:space:]]+\[[A-Za-z0-9+,]{340}\]'; then
+			_notrun "dump.f2fs (f2fs-tools) is too old; doesn't support showing unambiguous on-disk filenames"
+		fi
+		;;
+	*)
+		_notrun "_get_ciphertext_filename() isn't implemented on $FSTYP"
+		;;
+	esac
+}
+
+# Get an encrypted file's list of on-disk blocks as a comma-separated list of
+# block offsets from the start of the device.  "Blocks" are 512 bytes each here.
+_get_ciphertext_block_list()
+{
+	local file=$1
+
+	sync
+	$XFS_IO_PROG -c fiemap $file | perl -ne '
+		next if not /^\s*\d+: \[\d+\.\.\d+\]: (\d+)\.\.(\d+)/;
+		print $_ . "," foreach $1..$2;' | sed 's/,$//'
+}
+
+# Dump a block list that was previously saved by _get_ciphertext_block_list().
+_dump_ciphertext_blocks()
+{
+	local device=$1
+	local blocklist=$2
+	local block
+
+	for block in $(tr ',' ' ' <<< $blocklist); do
+		dd if=$device bs=512 count=1 skip=$block status=none
+	done
+}
+
+_do_verify_ciphertext_for_encryption_policy()
+{
+	local contents_encryption_mode=$1
+	local filenames_encryption_mode=$2
+	local policy_flags=$3
+	local set_encpolicy_args=$4
+	local keydesc=$5
+	local raw_key_hex=$6
+	local crypt_cmd="src/fscrypt-crypt-util $7"
+
+	local blocksize=$(_get_block_size $SCRATCH_MNT)
+	local test_contents_files=()
+	local test_filenames_files=()
+	local i src dir dst inode blocklist \
+	      padding_flag padding dir_inode len name f nonce decrypted_name
+
+	# Create files whose encrypted contents we'll verify.  For each, save
+	# the information: (copy of original file, inode number of encrypted
+	# file, comma-separated block list) into test_contents_files[].
+	echo "Creating files for contents verification" >> $seqres.full
+	i=1
+	rm -f $tmp.testfile_*
+	for src in /dev/zero /dev/urandom; do
+		head -c $((4 * blocksize)) $src > $tmp.testfile_$i
+		(( i++ ))
+	done
+	dir=$SCRATCH_MNT/encdir
+	mkdir $dir
+	_set_encpolicy $dir $keydesc $set_encpolicy_args -f $policy_flags
+	for src in $tmp.testfile_*; do
+		dst=$dir/${src##*.}
+		cp $src $dst
+		inode=$(stat -c %i $dst)
+		blocklist=$(_get_ciphertext_block_list $dst)
+		test_contents_files+=("$src $inode $blocklist")
+	done
+
+	# Create files whose encrypted names we'll verify.  For each, save the
+	# information: (original filename, inode number of encrypted file, inode
+	# of parent directory, padding amount) into test_filenames_files[].  Try
+	# each padding amount: 4, 8, 16, or 32 bytes.  Also try various filename
+	# lengths, including boundary cases.  Assume NAME_MAX == 255.
+	echo "Creating files for filenames verification" >> $seqres.full
+	for padding_flag in 0 1 2 3; do
+		padding=$((4 << padding_flag))
+		dir=$SCRATCH_MNT/encdir.pad$padding
+		mkdir $dir
+		dir_inode=$(stat -c %i $dir)
+		_set_encpolicy $dir $keydesc $set_encpolicy_args \
+			-f $((policy_flags | padding_flag))
+		for len in 1 3 15 16 17 32 100 254 255; do
+			name=$(tr -d -C a-zA-Z0-9 < /dev/urandom | head -c $len)
+			touch $dir/$name
+			inode=$(stat -c %i $dir/$name)
+			test_filenames_files+=("$name $inode $dir_inode $padding")
+		done
+	done
+
+	# Now unmount the filesystem and verify the ciphertext we just wrote.
+	_scratch_unmount
+
+	echo "Verifying encrypted file contents" >> $seqres.full
+	for f in "${test_contents_files[@]}"; do
+		read -r src inode blocklist <<< "$f"
+		nonce=$(_get_encryption_nonce $SCRATCH_DEV $inode)
+		_dump_ciphertext_blocks $SCRATCH_DEV $blocklist > $tmp.actual_contents
+		$crypt_cmd $contents_encryption_mode $raw_key_hex \
+			--file-nonce=$nonce --block-size=$blocksize \
+			< $src > $tmp.expected_contents
+		if ! cmp $tmp.expected_contents $tmp.actual_contents; then
+			_fail "Expected encrypted contents != actual encrypted contents.  File: $f"
+		fi
+		$crypt_cmd $contents_encryption_mode $raw_key_hex --decrypt \
+			--file-nonce=$nonce --block-size=$blocksize \
+			< $tmp.actual_contents > $tmp.decrypted_contents
+		if ! cmp $src $tmp.decrypted_contents; then
+			_fail "Contents decryption sanity check failed.  File: $f"
+		fi
+	done
+
+	echo "Verifying encrypted file names" >> $seqres.full
+	for f in "${test_filenames_files[@]}"; do
+		read -r name inode dir_inode padding <<< "$f"
+		nonce=$(_get_encryption_nonce $SCRATCH_DEV $dir_inode)
+		_get_ciphertext_filename $SCRATCH_DEV $inode $dir_inode \
+			> $tmp.actual_name
+		echo -n "$name" | \
+			$crypt_cmd $filenames_encryption_mode $raw_key_hex \
+			--file-nonce=$nonce --padding=$padding \
+			--block-size=255 > $tmp.expected_name
+		if ! cmp $tmp.expected_name $tmp.actual_name; then
+			_fail "Expected encrypted filename != actual encrypted filename.  File: $f"
+		fi
+		$crypt_cmd $filenames_encryption_mode $raw_key_hex --decrypt \
+			--file-nonce=$nonce --padding=$padding \
+			--block-size=255 < $tmp.actual_name \
+			> $tmp.decrypted_name
+		decrypted_name=$(tr -d '\0' < $tmp.decrypted_name)
+		if [ "$name" != "$decrypted_name" ]; then
+			_fail "Filename decryption sanity check failed ($name != $decrypted_name).  File: $f"
+		fi
+	done
+}
+
+_fscrypt_mode_name_to_num()
+{
+	local name=$1
+
+	case "$name" in
+	AES-256-XTS)		echo 1 ;; # FS_ENCRYPTION_MODE_AES_256_XTS
+	AES-256-CTS-CBC)	echo 4 ;; # FS_ENCRYPTION_MODE_AES_256_CTS
+	AES-128-CBC-ESSIV)	echo 5 ;; # FS_ENCRYPTION_MODE_AES_128_CBC
+	AES-128-CTS-CBC)	echo 6 ;; # FS_ENCRYPTION_MODE_AES_128_CTS
+	Adiantum)		echo 9 ;; # FS_ENCRYPTION_MODE_ADIANTUM
+	*)			_fail "Unknown fscrypt mode: $name" ;;
+	esac
+}
+
+# Verify that file contents and names are encrypted correctly when an encryption
+# policy of the specified type is used.
+#
+# The first two parameters are the contents and filenames encryption modes to
+# test.  Optionally, also specify 'direct' to test the DIRECT_KEY flag.
+_verify_ciphertext_for_encryption_policy()
+{
+	local contents_encryption_mode=$1
+	local filenames_encryption_mode=$2
+	local opt
+	local policy_flags=0
+	local set_encpolicy_args=""
+	local crypt_util_args=""
+
+	shift 2
+	for opt; do
+		case "$opt" in
+		direct)
+			if [ $contents_encryption_mode != \
+			     $filenames_encryption_mode ]; then
+				_fail "For direct key mode, contents and filenames modes must match"
+			fi
+			(( policy_flags |= 0x04 )) # FS_POLICY_FLAG_DIRECT_KEY
+			;;
+		*)
+			_fail "Unknown option '$opt' passed to ${FUNCNAME[0]}"
+			;;
+		esac
+	done
+	local contents_mode_num=$(_fscrypt_mode_name_to_num $contents_encryption_mode)
+	local filenames_mode_num=$(_fscrypt_mode_name_to_num $filenames_encryption_mode)
+
+	set_encpolicy_args+=" -c $contents_mode_num"
+	set_encpolicy_args+=" -n $filenames_mode_num"
+
+	if (( policy_flags & 0x04 )); then
+		crypt_util_args+=" --kdf=none"
+	else
+		crypt_util_args+=" --kdf=AES-128-ECB"
+	fi
+	set_encpolicy_args=${set_encpolicy_args# }
+
+	_require_scratch_encryption $set_encpolicy_args
+	_require_test_program "fscrypt-crypt-util"
+	_require_xfs_io_command "fiemap"
+	_require_get_encryption_nonce_support
+	_require_get_ciphertext_filename_support
+	_require_command "$KEYCTL_PROG" keyctl
+
+	echo "Creating encryption-capable filesystem" >> $seqres.full
+	_scratch_mkfs_encrypted &>> $seqres.full
+	_scratch_mount
+
+	echo "Generating encryption key" >> $seqres.full
+	local raw_key=$(_generate_raw_encryption_key)
+	local keydesc=$(_generate_key_descriptor)
+	_new_session_keyring
+	_add_encryption_key $keydesc $raw_key
+	local raw_key_hex=$(echo "$raw_key" | tr -d '\\x')
+
+	echo
+	echo -e "Verifying ciphertext with parameters:"
+	echo -e "\tcontents_encryption_mode: $contents_encryption_mode"
+	echo -e "\tfilenames_encryption_mode: $filenames_encryption_mode"
+	[ $# -ne 0 ] && echo -e "\toptions: $*"
+
+	_do_verify_ciphertext_for_encryption_policy \
+		"$contents_encryption_mode" \
+		"$filenames_encryption_mode" \
+		"$policy_flags" \
+		"$set_encpolicy_args" \
+		"$keydesc" \
+		"$raw_key_hex" \
+		"$crypt_util_args"
+}
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
