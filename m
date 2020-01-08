Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC2134FEF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 00:18:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipKbE-00046n-23; Wed, 08 Jan 2020 23:18:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1ipKbD-00046b-1Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 23:18:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J6a0HPrJ63WHKyoLqdUyHULAz04QyRnZTjE0G42Yy5s=; b=AwTwSf7yHfAfhsQr+lu6bOpfoA
 yO6v1DYkG4WQbcEveTWBdrYzJDnXc4/+/pHPxBdgGyNvdzAeGVkF7UplU6vYLn/FGXOQDVup1AUpm
 kIN3qXDFnIA3AIBtTDiWCC9M/C2Gwr43uEEurIadhLnWbguFwxHmrhOEF77MPQFF2Ncc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J6a0HPrJ63WHKyoLqdUyHULAz04QyRnZTjE0G42Yy5s=; b=I2iz6/YIhuzYPqbDXgJXqNEWnq
 ns4OD5pH/JPRwdORyHScoHEyOc/7EM6rd5QZAHexPSlMpgxc9/IX2ED0gWNscj5iyKVppvaPfGNob
 d3921ouXDQVwpjs03GQcypK/9P8KKPAs0FWN1LSk0l0eSR6TxhH6+RBLlDm+FEoU+LmM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipKb8-00DwyJ-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 23:18:50 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCEBB20692;
 Wed,  8 Jan 2020 23:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578525520;
 bh=q1ENe4lLdEVnjYZqJH1I18oDEtMqgJp+XWV9ZHBhBUo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xRtKYFCRN3JZg9pKxw7k1COaZOH2oDBEouKYbCKb555D9DRFy2p8VMwZqTKDJyKpJ
 bp5nTDdhgYT9xRZtewxTb1vozXEmnuLYZ3ceotd9czbs1mVwQSpS7lH3E8UNhHukJJ
 Vmf+RQ2X691WtheRwbLZE7Zr8sMvAiAyy30MVtkI=
Date: Wed, 8 Jan 2020 15:18:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200108231840.GB42219@jaegeuk-macbookpro.roam.corp.google.com>
References: <20200107020709.73568-1-jaegeuk@kernel.org>
 <afddac87-b7c5-f68c-4e55-3705be311cf6@huawei.com>
 <20200108120444.GC28331@jaegeuk-macbookpro.roam.corp.google.com>
 <d5555fd8-736f-cc2f-1e57-d9ac01b3d012@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5555fd8-736f-cc2f-1e57-d9ac01b3d012@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
X-Headers-End: 1ipKb8-00DwyJ-Hv
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a way to turn off ipu bio cache
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

On 01/08, Chao Yu wrote:
> On 2020/1/8 20:04, Jaegeuk Kim wrote:
> > On 01/08, Chao Yu wrote:
> >> On 2020/1/7 10:07, Jaegeuk Kim wrote:
> >>> Setting 0x40 in /sys/fs/f2fs/dev/ipu_policy gives a way to turn off
> >>> bio cache, which is useufl to check whether block layer using hardware
> >>> encryption engine merges IOs correctly.
> >>>
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  Documentation/filesystems/f2fs.txt | 1 +
> >>>  fs/f2fs/segment.c                  | 2 +-
> >>>  fs/f2fs/segment.h                  | 1 +
> >>>  3 files changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
> >>> index 41b5aa94b30f..cd93bcc34726 100644
> >>> --- a/Documentation/filesystems/f2fs.txt
> >>> +++ b/Documentation/filesystems/f2fs.txt
> >>> @@ -335,6 +335,7 @@ Files in /sys/fs/f2fs/<devname>
> >>>                                 0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
> >>>                                 0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
> >>>                                 0x10: F2FS_IPU_FSYNC.
> >>
> >> . -> ,
> > 
> > Actually, we can't do it. I revised it a bit instead.
> 
> One more question, why skipping 0x20 bit position?

It seems original patch missed to add comment.

From f9447095de55a3cda1023a37a5e1cb6dd2f54ebb Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 8 Jan 2020 15:10:02 -0800
Subject: [PATCH] f2fs: update f2fs document regarding to fsync_mode

This patch adds missing fsync_mode entry in f2fs document.

Fixes: 04485987f053 ("f2fs: introduce async IPU policy")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/filesystems/f2fs.txt | 3 ++-
 fs/f2fs/segment.h                  | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.txt b/Documentation/filesystems/f2fs.txt
index b80a7b69f210..ee61ace30276 100644
--- a/Documentation/filesystems/f2fs.txt
+++ b/Documentation/filesystems/f2fs.txt
@@ -334,7 +334,8 @@ Files in /sys/fs/f2fs/<devname>
                               updates in f2fs. User can set:
                                0x01: F2FS_IPU_FORCE, 0x02: F2FS_IPU_SSR,
                                0x04: F2FS_IPU_UTIL,  0x08: F2FS_IPU_SSR_UTIL,
-                               0x10: F2FS_IPU_FSYNC, 0x40: F2FS_IPU_NOCACHE.
+                               0x10: F2FS_IPU_FSYNC, 0x20: F2FS_IPU_ASYNC,
+                               0x40: F2FS_IPU_NOCACHE.
                               Refer segment.h for details.
 
  min_ipu_util                 This parameter controls the threshold to trigger
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5e6cd8d8411d..459dc3901a57 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -607,9 +607,10 @@ static inline int utilization(struct f2fs_sb_info *sbi)
  *                     threashold,
  * F2FS_IPU_FSYNC - activated in fsync path only for high performance flash
  *                     storages. IPU will be triggered only if the # of dirty
- *                     pages over min_fsync_blocks.
+ *                     pages over min_fsync_blocks. (=default option)
+ * F2FS_IPU_ASYNC - do IPU given by asynchronous write requests.
  * F2FS_IPU_NOCACHE - disable IPU bio cache.
- * F2FS_IPUT_DISABLE - disable IPU. (=default option)
+ * F2FS_IPUT_DISABLE - disable IPU. (=default option in LFS mode)
  */
 #define DEF_MIN_IPU_UTIL	70
 #define DEF_MIN_FSYNC_BLOCKS	8
-- 
2.24.0.525.g8f36a354ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
