Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A399E1ADE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2024 12:26:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIR2z-0006P5-Sa;
	Tue, 03 Dec 2024 11:26:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tIR2y-0006Oy-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 11:26:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BUoaVMI5vo5SVaQnpNhtzMDz0svyJiDvDjzVnJx8qGo=; b=F2o+O37DYMWv8l4y5m0+K0Kgoo
 t0+uyQmGWWsDg1sKVCyb8aaisr1xfDed/wKWVfpsvoBwdTHCgz4jbEvCRGlqt8bVNnoP5sLoHrSDh
 de/Tv8ie27l/FmkxrHTwP7by3/QprXTw5/W9sqLONRfitiVsHz+oJNjX/uO8IowLAeDU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BUoaVMI5vo5SVaQnpNhtzMDz0svyJiDvDjzVnJx8qGo=; b=D
 Wkztbs0xOkPGz2G9rA1RNtx7xBpz0q0w2oNWph4H5iKPl1+gBC2LKnrTt3dpQBfjIeweGShSeSb7n
 GzpxeVG6+JOJffrka8H45vr/ooDUZpG6+4Ww5CutagVpjQhiNWkZ30bANwt0DAcxWq2xG2oM77zZY
 nnADEHm8QUf4pC3s=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tIR2z-00030m-1J for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 11:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1D1D7A4148E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 Dec 2024 11:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2548C4CECF;
 Tue,  3 Dec 2024 11:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733225183;
 bh=Xb4RldGYMblNFnvTTFHKocXMgSxQA1PsdRWp6ce3rWY=;
 h=From:To:Cc:Subject:Date:From;
 b=B6cv/hRj3kj0SFo8i9HH6lcH7bPtsosUFBc4JzjhqXIH3G6CMoMxcSVbKs7Oc0YFv
 6Ty4rMcuTCBjAYu5ap3fuuachNEj10UO3/cLc8PAdHWjp4jEvCaFK9bg636lJoFBu7
 qZnBdd1J9BUZT3jsrlSyQkSbHuVVnr0mno4S/rXw1ncGUvVbEzco88pWuub5QHzhrt
 RlbGjEyFYzvh2FMNmHsZelQYSFBMXWsPy8KOl0XuucFxd/fIcPtm3cRveZ+T6qgSgF
 w3ZD6KgYqD2kW62JULMLW8tG6E7JsKyAP0TI+L6w53mhRqgn7UzX7LedRbKdz75P+2
 qqBdQravuQoEw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  2 Dec 2024 23:57:27 +0800
Message-Id: <20241202155727.4221-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bugs related to f2fs/00[5-7] regression testcases have
 been fixed by below commits: - d5c367ef8287 ("f2fs: fix f2fs_bug_on when
 uninstalling filesystem call f2fs_evict_inode.") - 1acd73edbbfe ("f2fs: fix
 to account dirty data in __get_secs_required()") 
 Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.8 DATE_IN_PAST_12_24     Date: is 12 to 24 hours before Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tIR2z-00030m-1J
Subject: [f2fs-dev] [PATCH] f2fs: add commit id to _fixed_by_kernel_commit
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

The bugs related to f2fs/00[5-7] regression testcases have been fixed
by below commits:

- d5c367ef8287 ("f2fs: fix f2fs_bug_on when uninstalling filesystem call
f2fs_evict_inode.")

- 1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()")

- 26413ce18e85 ("f2fs: compress: fix inconsistent update of i_blocks in
release_compress_blocks and reserve_compress_blocks")

Let's add commit id to _fixed_by_kernel_commit in f2fs/00[5-7].

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/005 | 2 +-
 tests/f2fs/006 | 2 +-
 tests/f2fs/007 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

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
diff --git a/tests/f2fs/006 b/tests/f2fs/006
index a9c823c1..c1f8d4ff 100755
--- a/tests/f2fs/006
+++ b/tests/f2fs/006
@@ -16,7 +16,7 @@
 . ./common/preamble
 _begin_fstest auto quick
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit 1acd73edbbfe \
 	"f2fs: fix to account dirty data in __get_secs_required()"
 
 _require_scratch
diff --git a/tests/f2fs/007 b/tests/f2fs/007
index 6451d4b4..37388433 100755
--- a/tests/f2fs/007
+++ b/tests/f2fs/007
@@ -11,7 +11,7 @@
 . ./common/preamble
 _begin_fstest auto quick rw compress
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit 26413ce18e85 \
         "f2fs: compress: fix inconsistent update of i_blocks in release_compress_blocks and reserve_compress_blocks"
 
 _require_scratch
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
