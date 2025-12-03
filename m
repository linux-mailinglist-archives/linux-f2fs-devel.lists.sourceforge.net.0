Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 10740CA1678
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 03 Dec 2025 20:32:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZ6t0B0Uip0Fj5nZr8aShJJsn/PP0UUNbj2ZVhD4GgY=; b=XAi1ARD0OQYGKvWKbwHvHJVzu0
	WeDLAyy3hCPLN16r0/5wdv7RMABnjoMBlXFJhDMJlJtKN2a0vMsVFoPG1ducPP+aIoKZ7BZEBHkti
	GO0sx4RupiHkC5boHjE2WWAYZ4XhT4INn+oCcc/QCur3xRURyKeCSiTcHMMTlK+0jahM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQsaC-0003Hv-DF;
	Wed, 03 Dec 2025 19:32:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQsaA-0003Hg-HT
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 19:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DyL9YbTwTqiiIdnOFaHjHPKtqffEXvFfrCY/vGxNxcE=; b=XkGS8WugAcfT4rkpA3UwKOYl9i
 3Vt6OieYIF+w0LIJIoiUYdVB1rRfTaKMeRDtkrs9ZFx7FZ6hGnL5Jtc80qDuQvHZThAw8gRP7zzq1
 zM6FUH7UmYaom3eYuC0CYUMOAI4VXFdrG+wThYivoaX24w6vLPEDmTi7nI68sTgeV93M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DyL9YbTwTqiiIdnOFaHjHPKtqffEXvFfrCY/vGxNxcE=; b=E
 pN8Pnrj9U8I0mC72HXMbLJd5WYLGRTAWv0ku2+4jqk+/Fm4RmccBxyPtebMi/qP8stza/U/cf/nKo
 3Qvsj1vIu4PxTlArRNYIRKx87kUgu3iur/shsm4L55s+aJtkPddAmq5DljadlC9/qp2ZSRnd03iIr
 6TDiIHWyLQOJada8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQsaA-0002t3-SK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 Dec 2025 19:32:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3F1B860125
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Dec 2025 19:32:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B29AC4CEF5;
 Wed,  3 Dec 2025 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764790319;
 bh=JQ73DsR3vSrwlgoERKzmcSkW9Qw/PCxxhEFOlNAOaEM=;
 h=From:To:Cc:Subject:Date:From;
 b=mZySEC99H7CU+jjMAeqEnydP7UxQHV96VkVIt8mur31YCqfGemquRT76yDTGmdJim
 n0WEDSQAzy9n1QpHLEgb26MUWcoorPi+vFDAoeXh2LURtMrGMykHmFuwBSCMG8CXwG
 5itnzPoPQow6dfw+qHsRzsIEE36UsNkt9I7xfuLORvzUZYdA0LjVc2bqp63jr4fH5l
 JtTPGH+dC0IQ+x3eoeQewOiae+nDmdNNDv7ZGZ4rq17BA8h5gH55XKvbuuvxjDH7YB
 rE6Sn1p4ORI8mvvVMHLrETatp427Mzmh2TVEvS4MbhcwMSLOFRMxglGyTYaotVm6cU
 vyEdJ2iRR3zvQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Thu,  4 Dec 2025 03:31:47 +0800
Message-ID: <20251203193147.3320893-1-chao@kernel.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQsaA-0002t3-SK
Subject: [f2fs-dev] [PATCH] common/quota: fix to wait for all inodes been
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
in between in-memory one and on-disk one.

The reason is cgroup v2 implementation requires to increase inode reference,
and then attach it to thread related cgroup writeback structure, once it
needs to switch once write owner changes of target inode, a kernel thread
will process it and then release inode reference via evict_inode().

So, sync & drop_cache may not guarantee all inodes being evicted, as cgroup
has one more refernece on inodes during the time.

If inode has not been evicted, dquot inode reference will not be release, it
will lead to inode quota mismatch.

Let's add a delay to wait for cgroup switching completion before quota check.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 common/quota | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/common/quota b/common/quota
index a51386b1..de7e84e8 100644
--- a/common/quota
+++ b/common/quota
@@ -333,6 +333,9 @@ _check_quota_usage()
 	# XXX: really need an ioctl instead of this big hammer
 	echo 3 > /proc/sys/vm/drop_caches
 
+	# wait for inode_switch_wbs_wor_fn() to release inodes
+	sleep 3
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
