Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B689F1E52E8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 May 2020 03:26:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1je7JV-00031Z-94; Thu, 28 May 2020 01:26:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1je7JT-00031S-Se
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 01:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BULKG5hwDM/JRea/sDBnri8aU6fvwz4CzAB8uZC2Cvw=; b=Kh+/ULPghCrv09olMGLr3E/UPZ
 izMbh6QuH121e9yVSxDlSCSborWZkdbcdhJycz0QLOAVvTqksoxUHO3SJGLgoRBQFqa1hiHVO2DDF
 R5YHUx2oyX4m++oCYoPI2KyXBZARTmELqfqubhXsliw5js96o0743cKXgb0w9QLFxIjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BULKG5hwDM/JRea/sDBnri8aU6fvwz4CzAB8uZC2Cvw=; b=Xm/pOaUZGA7NIjGywXV8gkv//x
 4nui06ZiCiGGk3AoplbQze2bL7yoJ8gSQ974iwE+EmxjYcUf8piFXM5ChIv50bDwZ8BcK/88PxFeR
 zMx8O4Sz4NvT895axJoeFlCoQt+tg+Kz5h+yA4om8HrDQ2LLZe3FImacWX52zBb5T8/k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1je7JM-000x3V-Vu
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 May 2020 01:26:27 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82B1920888;
 Thu, 28 May 2020 01:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590629175;
 bh=FrkNrOnyuxxgqjKw18LCwgpFRO2g3jWI9Z3k+0njVXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NR0QGGZyrKSAieQ6Pte0JsOsZzZtDrD/6rX7sz1N5YPNmxprW3x2V4nULOEE1cWRG
 Dy4fT75efExtLjP7Zhl813wPkRRXrWe0utFYw/Ri3IeChB4nngDk6kCf0VN6dNqASl
 aGG0gQHe6NM6lFMSuH31TZ/qwV9LI8z5h6y4Es8A=
Date: Wed, 27 May 2020 18:26:15 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200528012615.GA232094@google.com>
References: <20200527102753.15743-1-yuchao0@huawei.com>
 <20200527102753.15743-3-yuchao0@huawei.com>
 <20200527210233.GC206249@google.com>
 <23245f6e-528d-43ab-57b6-4ca16db43fe5@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23245f6e-528d-43ab-57b6-4ca16db43fe5@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1je7JM-000x3V-Vu
Subject: Re: [f2fs-dev] [PATCH 3/3] f2fs: fix to cover meta flush with
 cp_lock
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

On 05/28, Chao Yu wrote:
> On 2020/5/28 5:02, Jaegeuk Kim wrote:
> > On 05/27, Chao Yu wrote:
> >> meta inode page should be flushed under cp_lock, fix it.
> > 
> > It doesn't matter for this case, yes?
> 
> It's not related to discard issue.

I meant we really need this or not. :P

> 
> Now, I got some progress, I can reproduce that bug occasionally.
> 
> Thanks,
> 
> > 
> >>
> >> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> >> ---
> >>  fs/f2fs/file.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >> index f7de2a1da528..0fcae4d90074 100644
> >> --- a/fs/f2fs/file.c
> >> +++ b/fs/f2fs/file.c
> >> @@ -2260,7 +2260,9 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
> >>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> >>  		break;
> >>  	case F2FS_GOING_DOWN_METAFLUSH:
> >> +		mutex_lock(&sbi->cp_mutex);
> >>  		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
> >> +		mutex_unlock(&sbi->cp_mutex);
> >>  		f2fs_stop_checkpoint(sbi, false);
> >>  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
> >>  		break;
> >> -- 
> >> 2.18.0.rc1
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
