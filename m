Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6763CA9BFD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 06 Dec 2025 01:40:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kTa7cqoUxkZkbxaMlXrE7+n/2PWKYgOCg0Rb8Y8OpL0=; b=FQwwefrpuRWDlygHbE9kUUp5Cw
	x8SrPzx9vA1ome1ZubL8e3BHVKlC8uaPll8ip9C8EDdBHLtQudpYKR0DugTy1QKPIVE49P7/+ZpSN
	eH1ZTowjp6K8I1Dxsjb4AfoAF5ajpqt9C2DYPwhNV6zrmrBxeJ1b9ijXAwb/fcCP2ucI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRgLu-00067q-Dy;
	Sat, 06 Dec 2025 00:40:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vRgLt-00067j-F8
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Dec 2025 00:40:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1FFBzNr2OxloHmTLTQAEYaryHGxNWED4EiS5ivlNTKY=; b=Rb665hMmUwWQjHpmiJKtQxpheB
 qwGcf8oAktGwfsifGcwACju66/XoIYXFgpzoofwm/zwFQOINXbrAPZuD6Foi2iZxG37pn0JOHUQgw
 JlmxJE6p2zJGDJjvp+gmFbgZ5J+4qKnujzeYxxr4xLw2eFyChUE7vQ+3NLRfngBYXzMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1FFBzNr2OxloHmTLTQAEYaryHGxNWED4EiS5ivlNTKY=; b=m
 LZcl+o7B0udI1zGr5i92NkFyxTS2NsAR533doPxYyoUwyY+S7Wi23mofB214D9ensZezT93XNDgHb
 GEb8MlNT2vPytHALJ5iE4b0bIVtav9nI3x3YEQubvftr6CGOEXIt3oiDLEU+GFBw63yPVSyILb5YZ
 c77vkfDYFy2pcNXs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vRgLs-0005Sm-T6 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Dec 2025 00:40:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DE05F600CB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  6 Dec 2025 00:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42DB0C4CEF1;
 Sat,  6 Dec 2025 00:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764981638;
 bh=SAtm1XxXYuGTwcRUQICs7Zs7Yin7yGN2ed//wLM8YsQ=;
 h=From:To:Cc:Subject:Date:From;
 b=Ij0R8Za705WAbOr8VVrSWxHR445BI0ZkNwKKv7xL5jkmThOTWdDOYA77D+pZdJkra
 gJAsiUXUOEwZBxCTv9Jl9HleWcz6XHCLUzgd7QDkz+3LWxalyXA1gJYB0AcjW7G/9C
 a0ZVOJiQyxekS4l35majsSjIG/sRmDa385gX7BgcIy3usbKc5l9hzw1/0KNVfMdTEH
 LpOJmB9RlOy1dwB3lQkQZbZg2wkVwOi1uM/yettpwzK+NRlvCslmkwRaZPHjhogTdD
 K++QKtOSYe7W1t4fNJkGO0ploBBeCkbhrcP/jvlBshErU2JKAngPk6EevCISWCp8mt
 9+7r2F10SsMGg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Sat,  6 Dec 2025 08:40:17 +0800
Message-ID: <20251206004017.4021067-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/233 3s ... - output mismatch (see
 /share/git/fstests/results//generic/233.out.bad)
 --- tests/generic/233.out 2025-01-12 21:57:40.259440359 +0800 +++
 /share/git/fstests/results//generic/233.out [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [172.105.4.254 listed in dnsbl-2.uceprotect.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vRgLs-0005Sm-T6
Subject: [f2fs-dev] [PATCH v2] common/quota: fix to wait for all inodes been
 evicted in _check_quota_usage()
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
Cc: jaegeuk@kernel.org, "Darrick J. Wong" <djwong@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/233  3s ... - output mismatch (see /share/git/fstests/results//generic/233.out.bad)
    --- tests/generic/233.out   2025-01-12 21:57:40.259440359 +0800
    +++ /share/git/fstests/results//generic/233.out.bad 2025-12-04 03:02:26.000000000 +0800
    @@ -4,4 +4,12 @@

     seed = S
     Comparing user usage
    +4c4
    +< #1000     --   31476   32000   32000            994  1000  1000
    +---
    +> #1000     --   31476   32000   32000            944  1000  1000
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/233.out /share/git/fstests/results//generic/233.out.bad'  to see the entire diff)
Ran: generic/233
Failures: generic/233
Failed 1 of 1 tests

Sometimes, generic/233 will fail due to it founds inode count is mismatched
in between quota system and filesystem.

The reason is cgroup v2 implementation will increase inode reference first,
and then, attach it to thread related cgroup writeback structure, once it
needs to switch write owner of target inode, a kernel thread will process
it, and finally release inode reference via evict_inode().

So, sync & drop_cache may not guarantee all inodes being evicted, as cgroup
has one more referenece on inodes during the time.

If inode has not been evicted, dquot inode reference will not be release, it
will lead to inode count mismatch.

Let's add a delay to wait for cgroup switching completion before quota check.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- sleep only for f2fs case
 common/quota | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/common/quota b/common/quota
index a51386b1..a7239501 100644
--- a/common/quota
+++ b/common/quota
@@ -333,6 +333,11 @@ _check_quota_usage()
 	# XXX: really need an ioctl instead of this big hammer
 	echo 3 > /proc/sys/vm/drop_caches
 
+	if [ $FSTYP == "f2fs" ]; then
+		# wait for inode_switch_wbs_wor_fn() to release inodes
+		sleep 3
+	fi
+
 	VFS_QUOTA=0
 	case $FSTYP in
 	ext2|ext3|ext4|f2fs|gfs2|bcachefs)
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
