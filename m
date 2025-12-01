Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3CC991F1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzksmJdswL5tch064e5or/lnjbSNsetDkPtE3Pz4+GU=; b=NEn3YpBTHk1wXcBiff9VeL7IfU
	p4BnYtajjc0kG6WPJwc/k/c7PuvAYN702yp3UM3vSAB6E+tRXU/VbnbdFY0Yw8teBCJ9zoqeYwJ5s
	HpZrvCNKn3RYbtp1WSfWXJ7Xho5ZtUrVx1mohR8N/Itz3MUJV67vyXRvcYKMvhFF5YwE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQB23-0002Ve-7T;
	Mon, 01 Dec 2025 21:02:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQB21-0002VQ-TI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dpXRiJBKjKItXddkwA9Bd5l2LFW+rFBJnSXqMQbB6qA=; b=bYnukg934jK3BxhyLUutSrUgXc
 YfWQRbg4/P0+A56ENYXLk8CkeWl8hf7n64t9vcTWZBHxwwfXP5ad2osg6V7pSTR6ViOo+Ok5BBKg5
 bsLGEw1fnKvbcKvrQYt7etEt9zh3zmdNtIDMCUQAVp5U3r3Wqcu1H78J7NRugoy9IOOM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dpXRiJBKjKItXddkwA9Bd5l2LFW+rFBJnSXqMQbB6qA=; b=O
 e5WYbjBnU/QgxrJgOYEQMcpNQzOm0427HOUZRY8n4T7ZwEg/cI4V+/LyFOH7JXQCWkZ//xOIKfzTB
 Qf61WWr1sDRmjG7GO2PwS4MNAwEFYo4u8DLuy1z3qV89T4BsyhQ3leAHYt83gy3brhNOuix9p/mpr
 fNd37ewuJtFu4oEc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQB22-0001i9-8Z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A0DD16014A;
 Mon,  1 Dec 2025 21:01:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442F3C4CEF1;
 Mon,  1 Dec 2025 21:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764622916;
 bh=kDg4UlKqtx2kxAbBrTrmlrpB3BG8XZudH7azKRu6UuM=;
 h=From:To:Cc:Subject:Date:From;
 b=k8H1Knt2YGtIAfZejDTzedxkXfpLumivEUzblkUViaRS8Zr9XR83xn08hJBwuJciC
 CJljm6uG7ICFM9yue1j5ek4AHEaQhO8/sMgZI772ARV4Y7abtB0o+HRQBAJ0ZLT08R
 8BesBi2Y9w/L7tlPzUSSP2l++fHSq5zgB4v5DnSBpllLrG3MjbbAJCLsyCEGtssDjs
 ZlRIizMsoBwfqNdulGXSzh+/S5oJmi/GmMscqFM8IDQopW5N6nd61VATl/KY6WrMuD
 xm8UuHDjKQPG5Wyhqh+kAIBzfXjDSdab6QMtoPmQyCZaIvxYVKhmfzDVcfJq9B+qpg
 LHe/XjYOOtSLw==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Mon,  1 Dec 2025 21:01:23 +0000
Message-ID: <20251201210152.909339-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch series aims to improve
 fadvise(POSIX_FADV_WILLNEED).
 The first patch fixes the broken logic which was not reading the entire range
 ahead, and two patches were converting the logic to adopt [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQB22-0001i9-8Z
Subject: [f2fs-dev] [PATCH RESEND 0/4] improve fadvise(POSIX_FADV_WILLNEED)
 with large folio
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

This patch series aims to improve fadvise(POSIX_FADV_WILLNEED). The first patch
fixes the broken logic which was not reading the entire range ahead, and two
patches were converting the logic to adopt large folio supported by filesystem.
The last one is one example of how filesystem can set a desired folio order to
boost the readahead speed.

Jaegeuk Kim (4):
  mm/readahead: fix the broken readahead for POSIX_FADV_WILLNEED
  mm/readahead: use page_cache_sync_ra for FADVISE_FAV_WILLNEED
  mm/readahead: add a_ops->ra_folio_order to get a desired folio order
  f2fs: attach a_ops->ra_folio_order to allocate large folios for
    readahead

 fs/f2fs/data.c          |  9 +++++++++
 fs/f2fs/f2fs.h          |  3 +++
 fs/f2fs/super.c         |  1 +
 fs/f2fs/sysfs.c         |  9 +++++++++
 include/linux/fs.h      |  4 ++++
 include/linux/pagemap.h | 12 +++++++++++
 mm/readahead.c          | 44 ++++++++++++++++++++++++-----------------
 7 files changed, 64 insertions(+), 18 deletions(-)

-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
