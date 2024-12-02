Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF939E00CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 12:42:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tI4of-00045Y-5M;
	Mon, 02 Dec 2024 11:42:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tI4od-00045P-Jv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 11:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M882m1b5WQG1yFqRmVBH5p/eRY6BUw8+yTDu0RxAQSA=; b=Xks00UJ7Kuna4//1oMLMoHrk2m
 CmpIpknx2Y0SA2I9K5FVsqBi/D0maUyhFMXJHqgr2jyZQ0bRn6wIXsZuWaiU57J0IKcnx0xqKiwgT
 hZjsh4SddllZ6Y9gqgAR7NLWxnGsslhec+GL19kHqsYpK1ryutUqmObUQjz/N/2Qnzuk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M882m1b5WQG1yFqRmVBH5p/eRY6BUw8+yTDu0RxAQSA=; b=c
 LRrMLeF1ZvDShQ7GUovk/uBKF/RbdTNUBmDCAwmXKxl/uWZ4unSNy5JOPWLWGu8CHbuxBchnifBBV
 4r+vYN9+pKLPFB2wTRkJgIKzu/REOPF9+enqzJMlPuEH9DfkBroVs6sBmlHVS482k72jejj0l9cTB
 oD8ZTw9AqBU5i+Pg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tI4od-00060t-0B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 11:42:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DE029A40B4C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 Dec 2024 11:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7FCC4CED1;
 Mon,  2 Dec 2024 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733139724;
 bh=wt8fAHvHw7fq8a87xaaoMOWZCAti1YWLt5GHipDkHCo=;
 h=From:To:Cc:Subject:Date:From;
 b=g3d+cSr2v1UXfdbZSEwdv1CU8+txVdv03HJ8gLdvz53ElvVcBmEnTMIhsId78juYX
 4z+2vMOfY5T23Zm/wgRcAfygnDnix+O9cno3rESijLI1/1aoDmkn1S06GMF97NhC2/
 u3PP+DXXb5fKc4sR+3+k9z56AAIbAlyAGfD19cRkFKudwahVO1tCsdSJxrOByjAZB0
 lSUKgJT7YFX0asJTBxybXwkYu8Q1TIousyjajaMJilYOgPKLBnvCcDe/ye1PfN8wm2
 F+W/8NeyTTvgHe2XKztaR13V/FmhqAeUeMuLNH8ag86YdogNPOeV4Es6BV2y3fe3Sc
 1+fZ9sUG7+l1A==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  2 Dec 2024 19:41:47 +0800
Message-Id: <20241202114149.2666-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bug related to this regression testcase has been fixed
 by commit d5c367ef8287 ("f2fs: fix f2fs_bug_on when uninstalling filesystem
 call f2fs_evict_inode."), let's update commit id in _fixed_by_ker [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tI4od-00060t-0B
Subject: [f2fs-dev] [PATCH 1/3] f2fs/005: update commit id in
 _fixed_by_kernel_commit line
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

The bug related to this regression testcase has been fixed by commit
d5c367ef8287 ("f2fs: fix f2fs_bug_on when uninstalling filesystem call
f2fs_evict_inode."), let's update commit id in _fixed_by_kernel_commit
line.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/005 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/f2fs/005 b/tests/f2fs/005
index a817d51a..33d4fdb9 100755
--- a/tests/f2fs/005
+++ b/tests/f2fs/005
@@ -11,7 +11,7 @@
 . ./common/preamble
 _begin_fstest auto quick
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit d5c367ef8287 \
 	"f2fs: fix f2fs_bug_on when uninstalling filesystem call f2fs_evict_inode."
 
 _require_scratch
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
