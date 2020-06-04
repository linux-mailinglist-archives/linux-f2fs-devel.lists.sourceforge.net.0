Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE91EDB2E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jun 2020 04:26:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgfaH-0001I7-6R; Thu, 04 Jun 2020 02:26:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jgfaF-0001Ht-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 02:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uK/TCePk+D4rJISKWs2ngu0UaTHUITY3ybjaF8qeBHE=; b=R39YJ/1u3PBSAhBGUb0jMuUyvj
 66n9wyi7XtdsvJx21fON9wgnQNEv2MoJOmGggpFEwaeJ77fWnEaAWgqYiJ3eYpZAOYQIKzHG/bEqh
 ZYOBErGjGNO5imDoL8Xb8jdImBCJkOCKbXirGohUQxWknQkNPiS+q6R9A4pbVTVRatP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uK/TCePk+D4rJISKWs2ngu0UaTHUITY3ybjaF8qeBHE=; b=K
 c2shsXqec5b1Bddq6WlRUhcboyzlLMFWq0Ho28UB1EYyqX6ABpfTGlrDGlXc2NX6grJ6WCEHMQY/0
 15lvoqQ9HYNjTrMuoy7VU20uLyz+Rg+QE5Go5pK8x9aU5ipiBJCP13fA1qdImoVd14SD9m62GVU0q
 +i6K2hAKQ2Jtr8xc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgfaC-0088LF-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jun 2020 02:26:19 +0000
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 336C520657;
 Thu,  4 Jun 2020 02:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591237559;
 bh=mtY+0BqKAtk8g8udHtJQPPg4cNBQETb1s0kd0xnhJ6Y=;
 h=From:To:Cc:Subject:Date:From;
 b=MMPE1fGkaNKzaUoyt5USbSfCT5lWZ4lY5y2b4sDWyjdpPd7mfvWr92oxUgJt8TeDn
 JNoCau/PPJCHSqTvbTGRue/QYTbuOeszvjgBu5A4B6SCYUilbZcI0f3wnPGyRiz+UJ
 4+AYOfiwb9zOOtHU2ufYm1hZ2I/1SeJkYE57jFLA=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Wed,  3 Jun 2020 19:25:01 -0700
Message-Id: <20200604022501.425267-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jgfaC-0088LF-Mc
Subject: [f2fs-dev] [xfstests PATCH] generic: verify ciphertext of
 IV_INO_LBLK_32 encryption policies
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

Verify the ciphertext for v2 encryption policies that use the
IV_INO_LBLK_32 flag and that use AES-256-XTS to encrypt file contents
and AES-256-CTS-CBC to encrypt file names.

The IV_INO_LBLK_32 encryption policy flag modifies the IV generation and
key derivation to be optimized for use with inline encryption hardware
that only accepts 32-bit IVs.  It is similar to IV_INO_LBLK_64 (which is
tested by generic/592), but it uses a trick to get the IV down to 32
bits.  For more information, see kernel commit e3b1078bedd3 ("fscrypt:
add support for IV_INO_LBLK_32 policies").

This test required adding SipHash support to fscrypt-crypt-util.

Running this test requires a kernel containing the above commit, e.g.
the latest mainline (which will become v5.8 and later).  For ext4, it
also needs an e2fsprogs version that supports the stable_inodes feature,
e.g. the latest git master branch (which will become v1.46 and later).

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/encrypt           |  18 ++++--
 src/fscrypt-crypt-util.c | 121 ++++++++++++++++++++++++++++++++++-----
 tests/generic/900        |  43 ++++++++++++++
 tests/generic/900.out    |   6 ++
 tests/generic/group      |   1 +
 5 files changed, 171 insertions(+), 18 deletions(-)
 create mode 100755 tests/generic/900
 create mode 100644 tests/generic/900.out

diff --git a/common/encrypt b/common/encrypt
index 5695a123..c4cc2d83 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -97,7 +97,8 @@ _require_encryption_policy_support()
 	echo "Checking whether kernel supports encryption policy: $set_encpolicy_args" \
 		>> $seqres.full
 
-	if (( policy_flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 )); then
+	if (( policy_flags & (FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 |
+			      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) )); then
 		_scratch_unmount
 		_scratch_mkfs_stable_inodes_encrypted &>> $seqres.full
 		_scratch_mount
@@ -769,6 +770,7 @@ FSCRYPT_MODE_ADIANTUM=9
 
 FSCRYPT_POLICY_FLAG_DIRECT_KEY=0x04
 FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64=0x08
+FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32=0x10
 
 FSCRYPT_KEY_SPEC_TYPE_DESCRIPTOR=1
 FSCRYPT_KEY_SPEC_TYPE_IDENTIFIER=2
@@ -797,6 +799,7 @@ _fscrypt_mode_name_to_num()
 #	'v2':			test a v2 encryption policy
 #	'direct':		test the DIRECT_KEY policy flag
 #	'iv_ino_lblk_64':	test the IV_INO_LBLK_64 policy flag
+#	'iv_ino_lblk_32':	test the IV_INO_LBLK_32 policy flag
 #
 _verify_ciphertext_for_encryption_policy()
 {
@@ -826,6 +829,9 @@ _verify_ciphertext_for_encryption_policy()
 		iv_ino_lblk_64)
 			(( policy_flags |= FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 ))
 			;;
+		iv_ino_lblk_32)
+			(( policy_flags |= FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 ))
+			;;
 		*)
 			_fail "Unknown option '$opt' passed to ${FUNCNAME[0]}"
 			;;
@@ -841,14 +847,15 @@ _verify_ciphertext_for_encryption_policy()
 		set_encpolicy_args+=" -v 2"
 		crypt_util_args+=" --kdf=HKDF-SHA512"
 		if (( policy_flags & FSCRYPT_POLICY_FLAG_DIRECT_KEY )); then
-			if (( policy_flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 )); then
-				_fail "'direct' and 'iv_ino_lblk_64' options are mutually exclusive"
-			fi
 			crypt_util_args+=" --mode-num=$contents_mode_num"
 		elif (( policy_flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 )); then
 			crypt_util_args+=" --iv-ino-lblk-64"
 			crypt_util_contents_args+=" --mode-num=$contents_mode_num"
 			crypt_util_filename_args+=" --mode-num=$filenames_mode_num"
+		elif (( policy_flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32 )); then
+			crypt_util_args+=" --iv-ino-lblk-32"
+			crypt_util_contents_args+=" --mode-num=$contents_mode_num"
+			crypt_util_filename_args+=" --mode-num=$filenames_mode_num"
 		fi
 	else
 		if (( policy_flags & ~FSCRYPT_POLICY_FLAG_DIRECT_KEY )); then
@@ -872,7 +879,8 @@ _verify_ciphertext_for_encryption_policy()
 	fi
 
 	echo "Creating encryption-capable filesystem" >> $seqres.full
-	if (( policy_flags & FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 )); then
+	if (( policy_flags & (FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64 |
+			      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32) )); then
 		_scratch_mkfs_stable_inodes_encrypted &>> $seqres.full
 	else
 		_scratch_mkfs_encrypted &>> $seqres.full
diff --git a/src/fscrypt-crypt-util.c b/src/fscrypt-crypt-util.c
index 1bf8f95c..ce9da85d 100644
--- a/src/fscrypt-crypt-util.c
+++ b/src/fscrypt-crypt-util.c
@@ -63,10 +63,14 @@ static void usage(FILE *fp)
 "  --decrypt                   Decrypt instead of encrypt\n"
 "  --file-nonce=NONCE          File's nonce as a 32-character hex string\n"
 "  --fs-uuid=UUID              The filesystem UUID as a 32-character hex string.\n"
-"                                Only required for --iv-ino-lblk-64.\n"
+"                                Required for --iv-ino-lblk-32 and\n"
+"                                --iv-ino-lblk-64; otherwise is unused.\n"
 "  --help                      Show this help\n"
-"  --inode-number=INUM         The file's inode number.  Only required for\n"
-"                                --iv-ino-lblk-64.\n"
+"  --inode-number=INUM         The file's inode number.  Required for\n"
+"                                --iv-ino-lblk-32 and --iv-ino-lblk-64;\n"
+"                                otherwise is unused.\n"
+"  --iv-ino-lblk-32            Similar to --iv-ino-lblk-64, but selects the\n"
+"                                32-bit variant.\n"
 "  --iv-ino-lblk-64            Use the format where the IVs include the inode\n"
 "                                number and the same key is shared across files.\n"
 "                                Requires --kdf=HKDF-SHA512, --fs-uuid,\n"
@@ -143,6 +147,11 @@ static inline u32 ror32(u32 v, int n)
 	return (v >> n) | (v << (32 - n));
 }
 
+static inline u64 rol64(u64 v, int n)
+{
+	return (v << n) | (v >> (64 - n));
+}
+
 static inline u64 ror64(u64 v, int n)
 {
 	return (v >> n) | (v << (64 - n));
@@ -1579,6 +1588,50 @@ static void test_adiantum(void)
 }
 #endif /* ENABLE_ALG_TESTS */
 
+/*----------------------------------------------------------------------------*
+ *                               SipHash-2-4                                  *
+ *----------------------------------------------------------------------------*/
+
+/*
+ * Reference: "SipHash: a fast short-input PRF"
+ *	https://cr.yp.to/siphash/siphash-20120918.pdf
+ */
+
+#define SIPROUND						\
+	do {							\
+		v0 += v1;	    v2 += v3;			\
+		v1 = rol64(v1, 13); v3 = rol64(v3, 16);		\
+		v1 ^= v0;	    v3 ^= v2;			\
+		v0 = rol64(v0, 32);				\
+		v2 += v1;	    v0 += v3;			\
+		v1 = rol64(v1, 17); v3 = rol64(v3, 21);		\
+		v1 ^= v2;	    v3 ^= v0;			\
+		v2 = rol64(v2, 32);				\
+	} while (0)
+
+/* Compute the SipHash-2-4 of a 64-bit number when formatted as little endian */
+static u64 siphash_1u64(const u64 key[2], u64 data)
+{
+	u64 v0 = key[0] ^ 0x736f6d6570736575ULL;
+	u64 v1 = key[1] ^ 0x646f72616e646f6dULL;
+	u64 v2 = key[0] ^ 0x6c7967656e657261ULL;
+	u64 v3 = key[1] ^ 0x7465646279746573ULL;
+	u64 m[2] = {data, (u64)sizeof(data) << 56};
+	size_t i;
+
+	for (i = 0; i < ARRAY_SIZE(m); i++) {
+		v3 ^= m[i];
+		SIPROUND;
+		SIPROUND;
+		v0 ^= m[i];
+	}
+
+	v2 ^= 0xff;
+	for (i = 0; i < 4; i++)
+		SIPROUND;
+	return v0 ^ v1 ^ v2 ^ v3;
+}
+
 /*----------------------------------------------------------------------------*
  *                               Main program                                 *
  *----------------------------------------------------------------------------*/
@@ -1723,15 +1776,39 @@ struct key_and_iv_params {
 	u8 file_nonce[FILE_NONCE_SIZE];
 	bool file_nonce_specified;
 	bool iv_ino_lblk_64;
+	bool iv_ino_lblk_32;
 	u32 inode_number;
 	u8 fs_uuid[UUID_SIZE];
 	bool fs_uuid_specified;
 };
 
 #define HKDF_CONTEXT_KEY_IDENTIFIER	1
-#define HKDF_CONTEXT_PER_FILE_KEY	2
+#define HKDF_CONTEXT_PER_FILE_ENC_KEY	2
 #define HKDF_CONTEXT_DIRECT_KEY		3
 #define HKDF_CONTEXT_IV_INO_LBLK_64_KEY	4
+#define HKDF_CONTEXT_DIRHASH_KEY	5
+#define HKDF_CONTEXT_IV_INO_LBLK_32_KEY	6
+#define HKDF_CONTEXT_INODE_HASH_KEY	7
+
+/* Hash the file's inode number using SipHash keyed by a derived key */
+static u32 hash_inode_number(const struct key_and_iv_params *params)
+{
+	u8 info[9] = "fscrypt";
+	union {
+		u64 words[2];
+		u8 bytes[16];
+	} hash_key;
+
+	info[8] = HKDF_CONTEXT_INODE_HASH_KEY;
+	hkdf_sha512(params->master_key, params->master_key_size,
+		    NULL, 0, info, sizeof(info),
+		    hash_key.bytes, sizeof(hash_key));
+
+	hash_key.words[0] = get_unaligned_le64(&hash_key.bytes[0]);
+	hash_key.words[1] = get_unaligned_le64(&hash_key.bytes[8]);
+
+	return (u32)siphash_1u64(hash_key.words, params->inode_number);
+}
 
 /*
  * Get the key and starting IV with which the encryption will actually be done.
@@ -1752,8 +1829,20 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 
 	memset(iv, 0, sizeof(*iv));
 
-	if (params->iv_ino_lblk_64 && params->kdf != KDF_HKDF_SHA512)
-		die("--iv-ino-lblk-64 requires --kdf=HKDF-SHA512");
+	if (params->iv_ino_lblk_64 || params->iv_ino_lblk_32) {
+		const char *opt = params->iv_ino_lblk_64 ? "--iv-ino-lblk-64" :
+							   "--iv-ino-lblk-32";
+		if (params->iv_ino_lblk_64 && params->iv_ino_lblk_32)
+			die("--iv-ino-lblk-64 and --iv-ino-lblk-32 are mutually exclusive");
+		if (params->kdf != KDF_HKDF_SHA512)
+			die("%s requires --kdf=HKDF-SHA512", opt);
+		if (!params->fs_uuid_specified)
+			die("%s requires --fs-uuid", opt);
+		if (params->inode_number == 0)
+			die("%s requires --inode-number", opt);
+		if (params->mode_num == 0)
+			die("%s requires --mode-num", opt);
+	}
 
 	switch (params->kdf) {
 	case KDF_NONE:
@@ -1776,23 +1865,24 @@ static void get_key_and_iv(const struct key_and_iv_params *params,
 		break;
 	case KDF_HKDF_SHA512:
 		if (params->iv_ino_lblk_64) {
-			if (!params->fs_uuid_specified)
-				die("--iv-ino-lblk-64 requires --fs-uuid");
-			if (params->inode_number == 0)
-				die("--iv-ino-lblk-64 requires --inode-number");
-			if (params->mode_num == 0)
-				die("--iv-ino-lblk-64 requires --mode-num");
 			info[infolen++] = HKDF_CONTEXT_IV_INO_LBLK_64_KEY;
 			info[infolen++] = params->mode_num;
 			memcpy(&info[infolen], params->fs_uuid, UUID_SIZE);
 			infolen += UUID_SIZE;
 			put_unaligned_le32(params->inode_number, &iv->bytes[4]);
+		} else if (params->iv_ino_lblk_32) {
+			info[infolen++] = HKDF_CONTEXT_IV_INO_LBLK_32_KEY;
+			info[infolen++] = params->mode_num;
+			memcpy(&info[infolen], params->fs_uuid, UUID_SIZE);
+			infolen += UUID_SIZE;
+			put_unaligned_le32(hash_inode_number(params),
+					   iv->bytes);
 		} else if (params->mode_num != 0) {
 			info[infolen++] = HKDF_CONTEXT_DIRECT_KEY;
 			info[infolen++] = params->mode_num;
 			file_nonce_in_iv = true;
 		} else if (params->file_nonce_specified) {
-			info[infolen++] = HKDF_CONTEXT_PER_FILE_KEY;
+			info[infolen++] = HKDF_CONTEXT_PER_FILE_ENC_KEY;
 			memcpy(&info[infolen], params->file_nonce,
 			       FILE_NONCE_SIZE);
 			infolen += FILE_NONCE_SIZE;
@@ -1817,6 +1907,7 @@ enum {
 	OPT_FS_UUID,
 	OPT_HELP,
 	OPT_INODE_NUMBER,
+	OPT_IV_INO_LBLK_32,
 	OPT_IV_INO_LBLK_64,
 	OPT_KDF,
 	OPT_MODE_NUM,
@@ -1830,6 +1921,7 @@ static const struct option longopts[] = {
 	{ "fs-uuid",         required_argument, NULL, OPT_FS_UUID },
 	{ "help",            no_argument,       NULL, OPT_HELP },
 	{ "inode-number",    required_argument, NULL, OPT_INODE_NUMBER },
+	{ "iv-ino-lblk-32",  no_argument,       NULL, OPT_IV_INO_LBLK_32 },
 	{ "iv-ino-lblk-64",  no_argument,       NULL, OPT_IV_INO_LBLK_64 },
 	{ "kdf",             required_argument, NULL, OPT_KDF },
 	{ "mode-num",        required_argument, NULL, OPT_MODE_NUM },
@@ -1890,6 +1982,9 @@ int main(int argc, char *argv[])
 		case OPT_INODE_NUMBER:
 			params.inode_number = parse_inode_number(optarg);
 			break;
+		case OPT_IV_INO_LBLK_32:
+			params.iv_ino_lblk_32 = true;
+			break;
 		case OPT_IV_INO_LBLK_64:
 			params.iv_ino_lblk_64 = true;
 			break;
diff --git a/tests/generic/900 b/tests/generic/900
new file mode 100755
index 00000000..dc2a2225
--- /dev/null
+++ b/tests/generic/900
@@ -0,0 +1,43 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright 2020 Google LLC
+#
+# FS QA Test No. 900
+#
+# Verify ciphertext for v2 encryption policies that use the IV_INO_LBLK_32 flag
+# and use AES-256-XTS to encrypt file contents and AES-256-CTS-CBC to encrypt
+# file names.
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
+. ./common/encrypt
+
+# remove previous $seqres.full before test
+rm -f $seqres.full
+
+# real QA test starts here
+_supported_fs generic
+_supported_os Linux
+
+_verify_ciphertext_for_encryption_policy AES-256-XTS AES-256-CTS-CBC \
+	v2 iv_ino_lblk_32
+
+# success, all done
+status=0
+exit
diff --git a/tests/generic/900.out b/tests/generic/900.out
new file mode 100644
index 00000000..8fbb34cc
--- /dev/null
+++ b/tests/generic/900.out
@@ -0,0 +1,6 @@
+QA output created by 900
+
+Verifying ciphertext with parameters:
+	contents_encryption_mode: AES-256-XTS
+	filenames_encryption_mode: AES-256-CTS-CBC
+	options: v2 iv_ino_lblk_32
diff --git a/tests/generic/group b/tests/generic/group
index c6ce029c..d3501ccc 100644
--- a/tests/generic/group
+++ b/tests/generic/group
@@ -604,3 +604,4 @@
 599 auto quick remount shutdown
 600 auto quick quota
 601 auto quick quota
+900 auto quick encrypt
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
