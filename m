Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F232BCAF335
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 09 Dec 2025 08:50:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L9viWNQKltAOrGr0oFS9JAwbvWcqv9bQU/d7JA4WZl4=; b=c8gyKs0PBnQ3BFWboGNUdVtHLh
	qOP2ZibEYBc7db7Z3dw4uD7B+kjPKpY6Oa3C6Qcz1SuZbAKMzOHxwx4yCXX2bveKsodxYvslR082q
	/vAvW/5PmvUcTyqEZvst+r9Hvji4GJhOx4JBiQkPKWtax5llcyaRDWmCEIcTZT8uJzRI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vSsUg-0000AK-T1;
	Tue, 09 Dec 2025 07:50:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vSsUf-0000A6-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 07:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZmD3QsZKJKm9k+f9OMZV7ExNN7kJgmQShNsZUkvSLQ=; b=ZwsNwlcT8ejhqS8O1ltuCNv+df
 uUenBbnR8PVfbHHmuJNRsFOxGW9WuGls54qECr38YL7KPlQ9eHhGrfxsmij+zKWHENCVrYkMPYRpG
 WKiFhwZKAArqLS6a95IXAWg6agf6iZ5NZGQkO5/xQFI8GnFxWtuIYrXlgvPKC/n2rHvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zZmD3QsZKJKm9k+f9OMZV7ExNN7kJgmQShNsZUkvSLQ=; b=l
 eCPrgdECo8NjuEu4n7sOt6LaUkcqq8vvvSOmYrtchscw1Y8sRQGnlBFFERMwVESIXc8GQK/OOGs+y
 CuneAdu6zZPVxaekSmb82os2IojIL9ScDkM5Q8pyXYvIE6zy60GJSdIyML3z98qiISEJ7RDNwgDPU
 VvXXjSfxlOmzwIIQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vSsUe-0001v4-IF for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Dec 2025 07:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 441E743FBF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 Dec 2025 07:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C29C4CEF5;
 Tue,  9 Dec 2025 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765266639;
 bh=LrBjfGwuZDchK7/MYTK0mv5CH8g5/vx8/nh/5oP7Blo=;
 h=From:To:Cc:Subject:Date:From;
 b=EyYbXyEWaCWOOHyFrriTBGGgI6PVr25QSO/Hk+7O2zibNBSExcMxU6VmqPmjp37GX
 ejxzakJ9Q9a8ZaYaUaQYIhF2GR+/c5hB9S1T0RFicv4swE/4gz4hT1dJ9dfBo5HMF4
 /Cg4MysWb0q9FCjxF7GZe7shs3YJ222ZYrinQDm+f0wSSE5iWS+9FOo2t6fo37PRUC
 zgspCKt95EbsYf9v1DP4Huj8Gcc+Hv4ohepKW1ZDLtRGFCfC1/AjBfb7PzYJaQRbPn
 Y6/RWMMU+URC1Gm459jw47TSjZZpj00ozKW+PxscIui2StW2aCzb+LaP89PQ6EjRal
 PmUZevDRLKlgw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue,  9 Dec 2025 15:50:28 +0800
Message-ID: <20251209075028.909869-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vSsUe-0001v4-IF
Subject: [f2fs-dev] [PATCH v3] common/quota: fix to wait for all inodes been
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
v3:
- sleep in existed case statement rather than in newly added check condition
 common/quota | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/common/quota b/common/quota
index a51386b1..5d351fdf 100644
--- a/common/quota
+++ b/common/quota
@@ -335,7 +335,14 @@ _check_quota_usage()
 
 	VFS_QUOTA=0
 	case $FSTYP in
-	ext2|ext3|ext4|f2fs|gfs2|bcachefs)
+	ext2|ext3|ext4|gfs2|bcachefs)
+		VFS_QUOTA=1
+		quotaon -f -u -g $SCRATCH_MNT 2>/dev/null
+		;;
+	f2fs)
+		# wait for inode_switch_wbs_wor_fn() to release inodes
+		sleep 3
+
 		VFS_QUOTA=1
 		quotaon -f -u -g $SCRATCH_MNT 2>/dev/null
 		;;
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
