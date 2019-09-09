Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB808AD46A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 10:07:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7EhU-0000aa-8Z; Mon, 09 Sep 2019 08:07:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i7EhT-0000Zv-Mk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:07:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74IOr3j2IpEutIV+C4veAQ0BtRz9XZmzp3QS6uYZlC4=; b=bIn9wWUAjDs91PdNjNYW1IDWIZ
 v17/Edy9PxSwDkUhdewV83TKFxF1qAh6H27aHwdqDXSf22tCTR7chwzS14rLEGzpZGgGvBz+kcV7J
 YjcsrPlNXUOC9/FUjF1XjbdFSvbGQeOkxzwklHATU0ivpVSDhzykztQiYGq5ax+vID18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74IOr3j2IpEutIV+C4veAQ0BtRz9XZmzp3QS6uYZlC4=; b=BbuRacqUgZEvOE9Mmm+akws1B4
 49oROxJyHnfxqjDE5CBWctq0lh9ME9snzToIzoUT6i5AFdQ4KwdoCcts1keYhGHL78IkvhwNwbNCt
 DGR1LqomzoPBUnc68OyAi3x3oM+coHNSKeW7QNCSUeGggaOcJlnam9kZU3pPi+KKUb8Y=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7EhS-005RQC-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:07:03 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 618342086D;
 Mon,  9 Sep 2019 08:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568016416;
 bh=gBnN4mBgf2SZFJnxSuZz5ZjjrkXhkkVXGa7TuEUaPYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=shcqLVlkKJ8x8hG17xWUsY/UzdOjlYXf3/brnsMT7+cu79VhwxLHE6Gvs2ZPgQc6b
 7PEFUwCQavFWkAnoujhIFkpuIH3339qVrYAhnUD+mosCSScXNUm/eeCzDHFDHRqHhP
 axYv35sE2skJL0/YDAVuFdWFPxLqLqdQRiCr3BpM=
Date: Mon, 9 Sep 2019 09:06:54 +0100
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1i7EhS-005RQC-HQ
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/09, Chao Yu wrote:
> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> > GC must avoid select the same victim again.
> 
> Blocks in previous victim will occupy addition free segment, I doubt after this
> change, FGGC may encounter out-of-free space issue more frequently.

Hmm, actually this change seems wrong by sec_usage_check().
We may be able to avoid this only in the suspicious loop?

---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e88f98ddf396..5877bd729689 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		round++;
 	}
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC && seg_freed)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
 	if (sync)
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
