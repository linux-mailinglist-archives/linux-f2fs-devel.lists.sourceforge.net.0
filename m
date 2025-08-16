Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F794B28B6C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Aug 2025 09:29:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u1y742DuwS+biIRbQNg9n1yyc7pxxLawWVyMzJztbgo=; b=XefbPN5nk6Okosk3CyiDJYlqNT
	L556KkCXeMcncmaXckQauOTzAD0XTuu3/D80raTKr83r4eYvYB0pJ2RwNuqYmBEUJxIXoTsCGreOr
	3ds8ileK3WNr50/tUeVcC3YDCRSBgjQy1UWrX8XQ06LawfTKk2HDpTFQq+FJu/OpN4HI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1unBMG-0001Iv-SA;
	Sat, 16 Aug 2025 07:29:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1unBMF-0001Il-Vw
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eVEpXUGGMLI+Lrq6c1gO6y9cpLIdxrULw4O4qN1tRnA=; b=DVWrNSko/FJY48UG5TJ2+RpcX5
 7OkJc3t75TB/YhqdWWjFMx4Q3iPSbHUXsPSZ6zTKQzEg57u1Y6B88LXES2s2Geox7SCwe/wh7J8AR
 CD7t00XpP+VB4xye1d28lI/HPAG2yqZbtTrjkjAve/jDn6CK8SMXM4D0u6JDTTE/zFTY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eVEpXUGGMLI+Lrq6c1gO6y9cpLIdxrULw4O4qN1tRnA=; b=E
 qG63zdkhCQYqBENisCq0TAI0K+OD3ApcVRd8WSgt+NkXGDrGVex/IjRuEMepq7VgavX4jkx9+BTWB
 DE3xTB46iCXYzxhpXRUC/xozac68KQkh6c7WxtWW5jyM+x1nykWYK1XGUzdefMNfO6DxtullGHb8r
 Y+aRZiisj4WumsEw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1unBMF-0003pR-GC for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Aug 2025 07:29:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 269E55C33B2;
 Sat, 16 Aug 2025 07:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83543C4CEEF;
 Sat, 16 Aug 2025 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755329377;
 bh=GxtuMTwBofj1WPDmtFWNrME/+hUfY/PdUIy66GYMHjE=;
 h=From:To:Cc:Subject:Date:From;
 b=sNo+UWz7VVp1l8Ia7d1g/t/2otoYQbXVGhrwVi0HPzYLvCPQdgnJJOzh6N9LwDM4c
 rkLpW2lAH6xaroj5ErUZIRXsJGzTnvxaVao4SrkLQayD4LCaQagwaVEZZhAvbqy2Bz
 QRNkIPdCe+uEVLVlXU7DHFrcx74lON42jVZNbmW94TCPRnMk4jRwA06peut48Lt0DY
 9bB434wckRPMoH59t7eUb3aL1UXJz3m0IbKJ0icp04mE38Reu/+lZG6x4MmSWmvfTp
 QDxbNUorZBLJoSO39E38/KkLFIp4o5t0C5wHjUZ6Bm7wpuBoxdgjrWR7R6k0oUB2WV
 fy2Rzz2EBRecg==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Sat, 16 Aug 2025 15:29:09 +0800
Message-ID: <20250816072909.2844349-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  w/ below change [1], f2fs will enable lookup_mode=perf by
 default, it will change f2fs dirent lookup method from linear based lookup
 to hash based lookup. So that, f2fs will ignore sb.s_encoding_flags by default,
 which is not compatible w/ f2fs/012 testcase, in where it will control lookup
 method by configuring this flag w/ fsck.f2fs. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1unBMF-0003pR-GC
Subject: [f2fs-dev] [PATCH v2] f2fs/012: adapt lookup_mode=x mount option
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

w/ below change [1], f2fs will enable lookup_mode=perf by default, it
will change f2fs dirent lookup method from linear based lookup to hash
based lookup.

So that, f2fs will ignore sb.s_encoding_flags by default, which is not
compatible w/ f2fs/012 testcase, in where it will control lookup method
by configuring this flag w/ fsck.f2fs.

To avoid failure of f2fs/012, let's check whether f2fs has supported
"lookup_mode=auto" mount option, mount w/ the option if it can,
otherwise, don't.

[1] https://lore.kernel.org/linux-f2fs-devel/20250805065228.1473089-1-chullee@google.com

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daniel Lee <chullee@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- ignore error from _try_scratch_mount "-o lookup_mode=auto"
 tests/f2fs/012 | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/f2fs/012 b/tests/f2fs/012
index b3df9a8f..7438d9ce 100755
--- a/tests/f2fs/012
+++ b/tests/f2fs/012
@@ -22,6 +22,15 @@ _require_scratch_nocheck
 _require_command "$F2FS_IO_PROG" f2fs_io
 _require_command "$F2FS_INJECT_PROG" inject.f2fs
 
+#check whether f2fs supports "lookup_mode=x" mount option
+mntopt=""
+_scratch_mkfs -O casefold -C utf8 >> $seqres.full
+_try_scratch_mount "-o lookup_mode=auto" >> $seqres.full 2>&1
+if [ $? == 0 ]; then
+	mntopt="-o lookup_mode=auto"
+	_scratch_unmount
+fi
+
 check_lookup()
 {
 	local nolinear_lookup=$1
@@ -30,7 +39,7 @@ check_lookup()
 	local redheart=$dir/$'\u2764\ufe0f'
 
 	_scratch_mkfs -O casefold -C utf8 >> $seqres.full
-	_scratch_mount
+	_scratch_mount $mntopt
 
 	mkdir $dir
 	$F2FS_IO_PROG setflags casefold $dir >> $seqres.full
@@ -52,7 +61,7 @@ check_lookup()
 
 	$F2FS_INJECT_PROG --dent --mb d_hash --nid $ino --val 0x9a2ea068 $SCRATCH_DEV >> $seqres.full
 
-	_scratch_mount
+	_scratch_mount $mntopt
 	if [ $nolinear_lookup == "1" ]; then
 		[ -f $redheart ] && _fail "red heart file should not exist"
 	else
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
