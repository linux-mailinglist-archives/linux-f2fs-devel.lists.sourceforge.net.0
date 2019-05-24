Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2C2A0EC
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 May 2019 00:04:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hUIJ0-0002P1-H5; Fri, 24 May 2019 22:04:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hUIIz-0002Om-9I
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=miD945q+zSw8XLmjoFK/+c2/BIPbhGGLVDrqVSEeUHc=; b=CUTX6Jxq49OsW5hGkbYANGeBAW
 LVh48iCUuMTRM6R5HphzmsXjG1vA9qcKwdjymgszy5TP/cf5AoWEDMwV0S0J3XAZlHWGZq0hZUI4Q
 Z2lvzzklVSNAOuWaTFgwrM2aFM/5fAGW5MYyeAD+TU1BA8uMRjHM20lgNcO/nkhSSCbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=miD945q+zSw8XLmjoFK/+c2/BIPbhGGLVDrqVSEeUHc=; b=FatWmjSRsVTCRFLLLBn4OYjzMp
 +uW22K+8adTzPvqlEQxFSA/RctaWoQtBAYMf773spRI9yGKQgH+P0RuUFDAoM0QDgt2lSUdUaT05G
 MuMktj1vWsMmia31EcRSEa1q6hMSQMxEyFdjuso/mATuJORu6BR9qFEOP/eJMBeppvbA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hUIIy-00EpEY-2z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 May 2019 22:04:49 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 587FA21851;
 Fri, 24 May 2019 22:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558735482;
 bh=3DPYimAv7dGFrLAiI90pBPFZSlR28YeUsoKy+dmkXMk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OXjOb5ORLzwBz0a8YjQ6yQJkAR6Kh/pRbJrdGpPLstrZB1Rx+eipcVgRA8mC9jsME
 cRSxAdRqrltzDJw+47D/G5KBS1tUOyubNjkd6BmwgrHc9HcNLWhf9XvArk0ek2MTse
 9DM90KahT501RfoeNCX2n2JJiGke37MbHfpD6Jh4=
From: Eric Biggers <ebiggers@kernel.org>
To: fstests@vger.kernel.org
Date: Fri, 24 May 2019 15:04:21 -0700
Message-Id: <20190524220425.201170-4-ebiggers@kernel.org>
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
X-Headers-End: 1hUIIy-00EpEY-2z
Subject: [f2fs-dev] [PATCH v2 3/7] common/encrypt: support requiring other
 encryption settings
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

Update _require_scratch_encryption() to support checking for kernel
support for contents and filenames encryption modes besides the default.
This will be used by some of the ciphertext verification tests.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 common/encrypt | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/common/encrypt b/common/encrypt
index cbe0b73d..a4ffc531 100644
--- a/common/encrypt
+++ b/common/encrypt
@@ -4,6 +4,15 @@
 #
 # Functions for setting up and testing file encryption
 
+#
+# _require_scratch_encryption [-c CONTENTS_MODE] [-n FILENAMES_MODE]
+#
+# Require encryption support on the scratch device.
+#
+# This checks for support for the default type of encryption policy (AES-256-XTS
+# and AES-256-CTS).  Options can be specified to also require support for a
+# different type of encryption policy.
+#
 _require_scratch_encryption()
 {
 	_require_scratch
@@ -44,9 +53,58 @@ _require_scratch_encryption()
 		_notrun "kernel does not support $FSTYP encryption"
 	fi
 	rmdir $SCRATCH_MNT/tmpdir
+
+	# If required, check for support for the specific type of encryption
+	# policy required by the test.
+	if [ $# -ne 0 ]; then
+		_require_encryption_policy_support $SCRATCH_MNT "$@"
+	fi
+
 	_scratch_unmount
 }
 
+_require_encryption_policy_support()
+{
+	local mnt=$1
+	local dir=$mnt/tmpdir
+	local set_encpolicy_args=""
+	local c
+
+	OPTIND=2
+	while getopts "c:n:" c; do
+		case $c in
+		c|n)
+			set_encpolicy_args+=" -$c $OPTARG"
+			;;
+		*)
+			_fail "Unrecognized option '$c'"
+			;;
+		esac
+	done
+	set_encpolicy_args=${set_encpolicy_args# }
+
+	echo "Checking whether kernel supports encryption policy: $set_encpolicy_args" \
+		>> $seqres.full
+
+	mkdir $dir
+	_require_command "$KEYCTL_PROG" keyctl
+	_new_session_keyring
+	local keydesc=$(_generate_encryption_key)
+	if _set_encpolicy $dir $keydesc $set_encpolicy_args \
+		2>&1 >>$seqres.full | egrep -q 'Invalid argument'; then
+		_notrun "kernel does not support encryption policy: '$set_encpolicy_args'"
+	fi
+	# fscrypt allows setting policies with modes it knows about, even
+	# without kernel crypto API support.  E.g. a policy using Adiantum
+	# encryption can be set on a kernel without CONFIG_CRYPTO_ADIANTUM.
+	# But actually trying to use such an encrypted directory will fail.
+	if ! touch $dir/file; then
+		_notrun "encryption policy '$set_encpolicy_args' is unusable; probably missing kernel crypto API support"
+	fi
+	$KEYCTL_PROG clear @s
+	rm -r $dir
+}
+
 _scratch_mkfs_encrypted()
 {
 	case $FSTYP in
-- 
2.22.0.rc1.257.g3120a18244-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
