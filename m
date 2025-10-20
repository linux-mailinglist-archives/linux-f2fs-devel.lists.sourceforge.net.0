Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11ECEBEF152
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Oct 2025 04:31:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fbESTT75pZl3l6aPfO1ceJV/S6UawhNoMzzByhqmzXA=; b=CbPBVGILoEv8j2PGV5G2iMRrXY
	IYUUGGb86tWnNZbRask5s9TTyt48wGOaBCN10f2xQGArAFdqfvoLfk5l3ZzMPmru6piIQ+7H2Q3RZ
	rNqd6PUD/KeNC38Veh1287QghNT+cWoWZ3umk/XlYULbO5ys5Ahb+SbtVyDCxYYwBi0Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vAfgD-0003JM-CG;
	Mon, 20 Oct 2025 02:31:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vAfgB-0003JE-Vt
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 02:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ym8YwJwrENUfuJtoFnhppqQ1dnRjL4my9TZadhvA/MY=; b=VzfhXEd7Bzluq4VrF4YLOEwBWz
 wrgdiy3sodfuW3W+iRsm8tw8ypdXL/DrKA/5eHhZA55zm5C5IJUpK7ps8CBgNtgdGGnm1o0Jxq9m+
 ia35XH6+AqHDJrZjTTiBf3LIk9alv+nagd3fMzaXj5/R3Ndpm7bRmJdSV+3tIMtwSYKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ym8YwJwrENUfuJtoFnhppqQ1dnRjL4my9TZadhvA/MY=; b=W
 BGehLhKQd052aQuC6OrmyZGf3c0pbj2RzXUWbbzufznDLh5xL5uIEUWJBPqV23lW4gwkmFqzWIg2q
 ZttHQBRvA559mM7Po0ixUiwQ/XE0itfSyzfqF4dQ+YInbC2+DQRZDNYy49MDmMM5EqvZscpZFHY/7
 92IVxeCRQteby784=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vAfgB-0006xm-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Oct 2025 02:31:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9F37460145
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Oct 2025 02:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B136C4CEE7;
 Mon, 20 Oct 2025 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760927477;
 bh=zH5t+wqmszTT+27i4XIEn7dPrWgnpg/gn5uTS78dewk=;
 h=From:To:Cc:Subject:Date:From;
 b=rFLYUkI6pekSZMPfXtynwcBS4ILFrL7onBKoDAwt2biaFQ/UqdVpdUVmv+2idDsrt
 H0oAH96GXkp0iB2HDNezTTmJr9mvc+FA0osKqaJyLQ2uOOnAKAjAY6lDoLtGEj2lYU
 h2uaJwqob1xei6SDH0Rh8R2n6FmYv2tN8J62xNX/zfLeMxLgk55wcuWjDqiraxs6a4
 /NNXjUA+vJsnYJdasdO/tiXofWr0Q8HJZqWEgWUgO6u0HtMFBsjEd422IxLseyx5Qd
 p088rANgINIqQXqjTa+KfzupKP0GdLLus2vE57ZfJhPE7LI9R3WgiEAFIVwW8rIkhd
 fVvUcc8s7jWCQ==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 20 Oct 2025 10:31:07 +0800
Message-ID: <20251020023108.327728-1-chao@kernel.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bugs related to f2fs/02[1-2] regression testcases have
 been fixed by below commits: - 930a9a6ee8e7 ("f2fs: fix to avoid NULL pointer
 dereference in f2fs_check_quota_consistency()") - c18ecd99e0c7 ("f2fs: fix
 to do sanity check on node footer for non inode dnode") 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vAfgB-0006xm-Hg
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add commit id to
 _fixed_by_kernel_commit for f2fs/02[1-2]
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

The bugs related to f2fs/02[1-2] regression testcases have been fixed
by below commits:

- 930a9a6ee8e7 ("f2fs: fix to avoid NULL pointer dereference in
f2fs_check_quota_consistency()")

- c18ecd99e0c7 ("f2fs: fix to do sanity check on node footer for non
inode dnode")

Let's add commit id to _fixed_by_kernel_commit in f2fs/02[1-2].

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/021 | 2 +-
 tests/f2fs/022 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/f2fs/021 b/tests/f2fs/021
index 96fc97c4..0cacb138 100755
--- a/tests/f2fs/021
+++ b/tests/f2fs/021
@@ -10,7 +10,7 @@
 . ./common/preamble
 _begin_fstest auto quick mount quota remount
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit 930a9a6ee8e7 \
 	"f2fs: fix to avoid NULL pointer dereference in f2fs_check_quota_consistency()"
 
 _require_scratch
diff --git a/tests/f2fs/022 b/tests/f2fs/022
index 48a8386b..f6d77c96 100755
--- a/tests/f2fs/022
+++ b/tests/f2fs/022
@@ -15,7 +15,7 @@ _begin_fstest auto quick rw
 
 . ./common/attr
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit c18ecd99e0c7 \
 	"f2fs: fix to do sanity check on node footer for non inode dnode"
 
 _require_scratch_nocheck
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
