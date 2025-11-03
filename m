Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562EC2A2A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 03 Nov 2025 07:22:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4jTc9N4hxJ4Z1AfCloXkv2oX18YOiVJhSZ+Ik+5/90U=; b=lEcp40XmIjm9Zd5rr5o6sXSnEg
	JKlvS8CR2ofWOL4DQStIwXyXGGskthvHgl0l11UqX887wgrs6mOHXM8h8HjE7SKImG1l0oAn107Pl
	P6FvWROpx5eXm/w1yu7CL0Nt7IjfNUthY4UT8TSDoLjlMPFAahra2kPbzVxBbQRxeBLk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vFnxI-0005jZ-AR;
	Mon, 03 Nov 2025 06:22:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vFnxH-0005jT-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qb5LkSskMN/6zrk184TgPdMj7ztfOnyH8iEqqzkpwTk=; b=SgDRXxJwaip/sI5Ib9HzX8qCmG
 iZgjbE1Z9kT/FhfHB6grGpd4Qns/d24RpeZPDyLNdW7asZKBvc2ye548Y7cATLrg/052I9iPM6yQy
 h7uI6Yy+2RoyGvybOrU33TybgzIbqbK00NYdt+QD7xmX+m/zztMieBqpTi2EB7IAzr1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qb5LkSskMN/6zrk184TgPdMj7ztfOnyH8iEqqzkpwTk=; b=m
 ezQB17Z8a6hamHIkJmnTi2JdNFvSqw52e1L5wM/tEuG42tf2JrnImAG8ETarsqee10YwSdjocQ577
 oYvSdDM6m+j4d14tQ0g+n2klfy60XuqVKkzrh4g1R+sb8edzgPFqal4ENa5G8IcV4rZTMmM/C6jtp
 9ZZnMZ73WZEkcViI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vFnxG-0007O0-GK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Nov 2025 06:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BE761601BA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  3 Nov 2025 06:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE8BC4CEE7;
 Mon,  3 Nov 2025 06:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762150923;
 bh=g/JQOKGipvOMYcBy5UArWqQ/sYChVVWIl6QTs6ySaBg=;
 h=From:To:Cc:Subject:Date:From;
 b=PYYvCPfhungoYhiPN3AlD76m0j+VshgoiK8EiACUZra2T9V+A2E+DqVKO3VpDa3Vb
 +utrL6Tb7CPnyoc4kGypyvTNzhJ36Xs9ZKh0JITRanuXIx+LAtow3TO9kV/jcaC0y+
 V/7n4KrD+CcXAPGGJbIRoXjcGe/Ms9NaGSVZYxZFd9G3KlHgFVMbcqXMftEa8qnyoF
 8lfk/XhCLsPlSdNW+YBezzs3nX0Tpy38daPyQvNOaKUhGGOECwdtmoa92obtowRFAK
 kYG0+STgFbRpaPOzjbPuJdUEpZXLsWI4ByYGVV/gCQ2qPaOgKuoxcnRPTQBf4Ahmex
 sNQ21pDwiqoDw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  3 Nov 2025 14:21:43 +0800
Message-ID: <20251103062143.2657116-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.2.997.g839fc31de9-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: After commit 5c1768b67250 ("f2fs: fix to do sanity check
 correctly
 on i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
 correctly, let's add this regression testcase to check tha [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vFnxG-0007O0-GK
Subject: [f2fs-dev] [PATCH v2] f2fs/023: test sanity check condition w/
 error injection
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

After commit 5c1768b67250 ("f2fs: fix to do sanity check correctly on
i_inline_xattr_size"), f2fs should handle corrupted i_inline_xattr_size
correctly, let's add this regression testcase to check that.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- use _filter_scratch to filter scratch mountpoint
- check output message of inject.f2fs rather than return value
- add _require_attrs
- add f2fs/023 to attr group
- fail testcase if mkfs failed
 tests/f2fs/023     | 49 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/023.out |  2 ++
 2 files changed, 51 insertions(+)
 create mode 100755 tests/f2fs/023
 create mode 100644 tests/f2fs/023.out

diff --git a/tests/f2fs/023 b/tests/f2fs/023
new file mode 100755
index 00000000..33108421
--- /dev/null
+++ b/tests/f2fs/023
@@ -0,0 +1,49 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Chao Yu <chao@kernel.org>
+#
+# FS QA Test No. f2fs/023
+#
+# This testcase tries to inject fault into inode.i_inline_xattr_size,
+# and check whether sanity check of f2fs can handle fault correctly.
+#
+
+. ./common/preamble
+. ./common/attr
+. ./common/filter
+_begin_fstest auto quick rw attr
+
+_fixed_by_kernel_commit 5c1768b67250 \
+        "f2fs: fix to do sanity check correctly on i_inline_xattr_size"
+
+_require_attrs
+_require_scratch_nocheck
+_require_inject_f2fs_command node i_inline
+_require_inject_f2fs_command node i_inline_xattr_size
+
+testfile=$SCRATCH_MNT/testfile
+
+# remove all mkfs options to avoid layout change of on-disk inode
+export MKFS_OPTIONS=""
+
+_scratch_mkfs "-O extra_attr,flexible_inline_xattr" >> $seqres.full || _fail "mkfs failed"
+_scratch_mount "-o inline_xattr_size=512" >>$seqres.full 2>&1
+touch $testfile
+_scratch_unmount
+
+# inject .i_inline field: clear F2FS_EXTRA_ATTR bit
+output=`$F2FS_INJECT_PROG --node --mb i_inline --nid 4 --val 0x1 $SCRATCH_DEV`
+echo "$output" >> $seqres.full
+echo "$output" | grep "unknown or unsupported member" && _fail "i_inline is unsupported"
+
+# inject .i_inline_xattr_size field from 512 to 2048
+output=`$F2FS_INJECT_PROG --node --mb i_inline_xattr_size --nid 4 --val 2048 $SCRATCH_DEV`
+echo "$output" >> $seqres.full
+echo "$output" | grep "unknown or unsupported member" && _fail "i_inline_xattr_size is unsupported"
+
+_scratch_mount
+
+$GETFATTR_PROG -n user.test "$testfile" 2>&1 | _filter_scratch
+
+status=0
+exit
diff --git a/tests/f2fs/023.out b/tests/f2fs/023.out
new file mode 100644
index 00000000..f9635d38
--- /dev/null
+++ b/tests/f2fs/023.out
@@ -0,0 +1,2 @@
+QA output created by 023
+getfattr: SCRATCH_MNT/testfile: Structure needs cleaning
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
