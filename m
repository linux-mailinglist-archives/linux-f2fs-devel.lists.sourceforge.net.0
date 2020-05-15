Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2441D5236
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 16:45:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZbaY-0005ZZ-N2; Fri, 15 May 2020 14:45:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jZbaW-0005ZK-PJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 14:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZuLKfa1i0o4pX+jejinnEWf/074esPkh6gLMlbRgmFg=; b=D2VHWF3Bt4UUYG3UuY2KNyklmy
 R+9zCScpbJl4ApowyCEf1l1xqhGVRZbCgoROyup8o5AGLUH5Y04VLU1GoWND8R2HcXCy1YxPlwP0f
 tGerRPNGQm/1iwGrGY7myvY9G25yK6e2hkXDKUX5v63qeDRGcD5exDC0Yy1WOoa5oM7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZuLKfa1i0o4pX+jejinnEWf/074esPkh6gLMlbRgmFg=; b=C672zB5mhVOG36wpQEckMZeVFJ
 /qxfTpGbSZ4DKXcJklS4gwaIYClCwZbStOjoNIMl8mpXt3fMvDTn+pp0RLEapU7PHYGhi9gA2R98q
 +0NN9wIze7EMF5gVuF4eAYJdAobgz7K7jJ/cVLc02qvJEm68d8xoXc9/0F16iUsSqAVY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZbaN-00BhrJ-BT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 14:45:24 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B5F4320671;
 Fri, 15 May 2020 14:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589553909;
 bh=11QCz4wj0IRYOsP8TSzEDA1ar1cIM8puU3El5/WrkVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OlAW9ahgqgxfR8cXxImDaOO46Cnzdv4vh2+mbxjE0y3uKG1qx3xRCPMMS8HG7NDh5
 tkFYpwUohUuIUa1bP+R9mvELw7n4OMAfJM/hA4bgvqyII4yEi5SE3BeQv/JBw20yf0
 KOpRb93VlfcGn9OzGvNVWjSgbBApluGmHdFqCPWM=
Date: Fri, 15 May 2020 07:45:09 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200515144509.GA46028@google.com>
References: <20200515021554.226835-1-jaegeuk@kernel.org>
 <9ba6e5ef-068d-a925-1eb9-107b0523666c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ba6e5ef-068d-a925-1eb9-107b0523666c@huawei.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZbaN-00BhrJ-BT
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush dirty meta pages when flushing
 them
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/15, Chao Yu wrote:
> On 2020/5/15 10:15, Jaegeuk Kim wrote:
> > Let's guarantee flusing dirty meta pages to avoid infinite loop.
> 
> What's the root cause? Race case or meta page flush failure?

Investigating, but at least, this can avoid the inifinite loop there.

V2:

From c60ce8e7178004fd6cba96e592247e43b5fd98d8 Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 13 May 2020 21:12:53 -0700
Subject: [PATCH] f2fs: flush dirty meta pages when flushing them

Let's guarantee flusing dirty meta pages to avoid infinite loop.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/checkpoint.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 620a386d82c1a..3dc3ac6fe1432 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1266,6 +1266,9 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
 		if (unlikely(f2fs_cp_error(sbi)))
 			break;
 
+		if (type == F2FS_DIRTY_META)
+			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
+							FS_CP_META_IO);
 		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
 	}
 	finish_wait(&sbi->cp_wait, &wait);
-- 
2.26.2.761.g0e0b3e54be-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
