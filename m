Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BBB82E95
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Sep 2025 06:53:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLdYVBWSVfboR0B3oO6gFxRpBPPBSgbrjdL3KMUZ/HA=; b=a/dI8TSJangyk5ZdzpjGTBakVw
	UD9x4IaLljD5atwTbIcOsca3u/YrBVZMRylONelr9QhcZqceusDjfseqK/OPOrsoUzwVUAY9qmPO3
	vHlAtPawvajhnVRRtW5xfasyi4NFgjbZyVZlytvdmXPfGvdEvcKx3oUQDM6kaegW7ejM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uz6eE-0007k4-Rj;
	Thu, 18 Sep 2025 04:53:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uz6eC-0007jy-Tm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qwJ+Fh86IMiHzgexCE4Xk8hUYvJ/y5QbxKZEBn63xsk=; b=AoDrfwLqnK3TO3SVHu1xa+13j0
 peLPJTv3kYdgewvRrFqFa4QbjYt681dzTG5Tjo8aEBX9jaeUkGetC1MxlN6uFBle+WTj9shZVoroq
 cvCZh+biafwmnI7MKJ0SxlHDKRzM2CSOf4Y7HgQ747HKGqoqKKQh7Gm/pzlO0mUIg9K4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qwJ+Fh86IMiHzgexCE4Xk8hUYvJ/y5QbxKZEBn63xsk=; b=g5Zi8z1lTuJqFsagLUOjll6VVT
 P9+O9DkLyqbuuovICA3NVo4XAzy6uh6gHoSmLwLKGOPK3wJ+ytxgrVcRMofaVXALEsQFSmp/JRKD0
 7jfqu8ChsVjZxy+eWv2rQKPBHJv0caW5cJMRJmlgxNB7tPjHJgIKlg01Uhbx8XCw6hRI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uz6eC-0006bE-Iq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Sep 2025 04:53:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 494D4446C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Sep 2025 04:53:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A603C4CEE7;
 Thu, 18 Sep 2025 04:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758171202;
 bh=/gXzDdAnoWUlNp1Chp4LMp6EH4bKVcufAUX0pO3bMoM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uAHLtLZ2E2PV725Lj0xgYozxusV8q1ZMB87eskVKkwlRbPLFzYS2htXHYOjkEBrCi
 ikn3SUCJwXraCodCFZ22KNpMKgH9y7Iwg5qOwFyJVPodDWtueQXhtfa7xwPIsgrndd
 0uyomwNSwA9vOQttDgxbMkYi6M0SRVQGJwiU+FDzmUVRckIEFIdiusXwvKhstSCebQ
 knqIbBGYFkLBkY0xTttbYRp/ULCerwKQi/UpFNYMRSzPj/vbX8G69+fvaBNB/0j1ib
 Ut1PYJsS/C9zHC6wW384NwzK+v8JYcdmDWUIRi95RXNId5k5QPCS9vetNklVFmGJ33
 jUfBM5J26r74g==
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 18 Sep 2025 04:53:16 +0000
Message-ID: <20250918045316.714102-3-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
In-Reply-To: <20250918045316.714102-1-jaegeuk@kernel.org>
References: <20250918045316.714102-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> ---
 tools/f2fs_io/f2fs_io.c
 | 4 ++++ 1 file changed, 4 insertions(+) diff --git a/tools/f2fs_io/f2fs_io.c
 b/tools/f2fs_io/f2fs_io.c index 2ed9cb4184b8..248cf7a44a34 100644 ---
 a/tools/f2fs_io/f2fs_io.c
 +++ b/tools/f2fs_io/f2fs_io.c @@ -101,6 +101,10 @@ static void *ali [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uz6eC-0006bE-Iq
Subject: [f2fs-dev] [PATCH 3/3] f2fs_io: let's try to get contigous memory
 if possible
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 2ed9cb4184b8..248cf7a44a34 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -101,6 +101,10 @@ static void *aligned_xalloc(size_t alignment, size_t size)
 
 	if (!p)
 		die("Memory alloc failed (requested %zu bytes)", size);
+
+	if (madvise(p, size, MADV_HUGEPAGE))
+		die("Madvise failed (requested %zu bytes)", size);
+
 	return p;
 }
 
-- 
2.51.0.470.ga7dc726c21-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
