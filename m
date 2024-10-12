Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 323CD99AFD3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Oct 2024 03:14:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1szQiL-0000rw-L5;
	Sat, 12 Oct 2024 01:14:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1szQiK-0000rl-A7
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 01:14:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mg6NYDvupJv6CutMlUjxXLqj5k52d5JRmSBBtOx/ZU=; b=P9s8sR7pbL/ZpMxWBJlkQbR5IR
 5fHdYfHDoYzZj4H9gxjvI/+94NLRSCOdJIABblmC7v2Uu/LEwI9vOKxWd+cIgln9MeHxt0ctR1b4L
 JCW+O1DhOLBW0CujjIf7jxuNGvPleZevL2zPkPjw6G99Wafq4vsEHAJLj7EbxHPb+5qE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5mg6NYDvupJv6CutMlUjxXLqj5k52d5JRmSBBtOx/ZU=; b=k
 0JaURlB4e+7/PsvF68ZmL6tZ7VMf0fPcQpOT6ILuIahGkGK2Y8jOmxllD+EBGA5b70lIDtfjNzYw0
 mYtck4ipcmRp+SvRud+KYNpWl/hqRwAjPt1IMWJUp2Vi9BUX4yT0dlZanVkv4iq5bIwgtG7pjv4UU
 iGsW1YJeyRZmBNEE=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1szQiJ-0007vE-Js for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Oct 2024 01:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00D77A4535B;
 Sat, 12 Oct 2024 01:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B308EC4CEC3;
 Sat, 12 Oct 2024 01:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728695669;
 bh=k4D5x4KbEGce1yIU0y1WdlxGh1G84wK2Xz30+tWn5OE=;
 h=From:To:Cc:Subject:Date:From;
 b=FLnA0TStGvO2/bt4qkew1Pi3HWgV/AExdP0PjMk7Cdd3qYvCJQCaaka/hLw+sT63e
 w69ZfgyQWbxp+21rqSEFgeZedoYjdgnzgOpTW7xHiVqM4kBY1MJ+oTMdNwHPrFhmuv
 TKD9Sh12B89RN3tgqhdxKqTOXJgGOBiyg0Z6Ox3T/O7ApUtOa6Reqj2Cuohp/j6QbR
 dyZbr0nZV7tW3o6DKo3W06UzKFVGeEGoGKZRDhZRHlQNlrAnhDwXLuXegA871lDQyT
 +Vi33gBj8rMZTFjD39ttyfYCYyw+jpE9cvfztWIKJ294U+bnlswekeX6qYgVMyMwOr
 KJLmqdOQjk8Gw==
To: Zorro Lang <zlang@redhat.com>
Date: Sat, 12 Oct 2024 09:14:19 +0800
Message-Id: <20241012011419.4066147-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bug related to this regression testcase has been fixed
 by commit b2c160f4f3cf ("f2fs: atomic: fix to forbid dio in atomic_file"),
 let's add missing _fixed_by_kernel_commit line for this testcase. 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1szQiJ-0007vE-Js
Subject: [f2fs-dev] [PATCH] f2fs/004: add missing _fixed_by_kernel_commit
 line
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>,
 fstests@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The bug related to this regression testcase has been fixed by commit
b2c160f4f3cf ("f2fs: atomic: fix to forbid dio in atomic_file"), let's
add missing _fixed_by_kernel_commit line for this testcase.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/004 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/f2fs/004 b/tests/f2fs/004
index dd1ed5c1..e08cee11 100755
--- a/tests/f2fs/004
+++ b/tests/f2fs/004
@@ -25,6 +25,9 @@ _cleanup()
 	rm -r -f $tmp.*
 }
 
+_fixed_by_kernel_commit b2c160f4f3cf \
+	"f2fs: atomic: fix to forbid dio in atomic_file"
+
 _require_scratch
 _require_odirect
 _scratch_mkfs >> $seqres.full
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
