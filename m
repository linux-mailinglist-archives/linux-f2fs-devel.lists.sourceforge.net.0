Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 811CFB5A0D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2019 05:13:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iAQOx-0007N5-8j; Wed, 18 Sep 2019 03:13:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iAQOv-0007Mx-KF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 03:13:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lilIzO3FCSjO3+LFSH7//5aqHS/sm7ZDOfKkZ/w6i0M=; b=YRhABDnV4kL1CK1+fU7HT5oeX5
 XCKVsMWmj1fz8V7pPM8AdgVnjueKtFVqxdKF+HnxPQ+7stKaq6KGBtfuoyHikMcpH+oDRvratsPWk
 hXppJVz5UtWzDpzENBNLMc3qf1SIhdvPIReslf+SaWTMHOfOXH4kmrDZHbCvGjlQRAIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lilIzO3FCSjO3+LFSH7//5aqHS/sm7ZDOfKkZ/w6i0M=; b=m+q2/lnGnnONUUrHKxrDZXM6a7
 4+h/78YDWZyBfc/5Phm/0l1tfZKdrgAQagsbF8FMKeZXgkHWGMN/euqGUde4mJT1VP0ZFB/SpgU87
 d2hH4zO5seNi7Rn4rcJEPdmFaSj39X0ASBbhy04rf57Xh6TlBDQ3+/rX4egtAICyYVZw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iAQOu-008jhK-CK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 03:13:05 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9985F21855;
 Wed, 18 Sep 2019 03:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568776378;
 bh=2nL15fdb42znZn7Z0uLezA9HuQwulYK2zVQeGOjDF7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=crVCuysuqQ+TWaYTS224Ytoemrl6mkiBBkbsaqjqxs/PqOviAmadvOAW4qV8lKsR5
 pAU1m5zqurS9rw5WJwzUdu98mLAnz5y4Y7zD3OSSrwDH3aAyuyYLKi/GYmvajftRT2
 Eq89aVkVQgCc4sBHgE9zaWHcqSXWUTl3gaXMjQRc=
Date: Tue, 17 Sep 2019 20:12:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190918031257.GA82722@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
 <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
 <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
 <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
 <20190916153736.GA2493@jaegeuk-macbookpro.roam.corp.google.com>
 <ab9561c9-db27-2967-e6fc-accd9bc58747@huawei.com>
 <20190917205501.GA60683@jaegeuk-macbookpro.roam.corp.google.com>
 <e823b534-f4de-7f59-0c26-ff2c463260d1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e823b534-f4de-7f59-0c26-ff2c463260d1@huawei.com>
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
X-Headers-End: 1iAQOu-008jhK-CK
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

On 09/18, Chao Yu wrote:
> On 2019/9/18 4:55, Jaegeuk Kim wrote:
> > On 09/17, Chao Yu wrote:
> >> On 2019/9/16 23:37, Jaegeuk Kim wrote:
> >>> On 09/16, Chao Yu wrote:
> >>>> On 2019/9/9 20:04, Jaegeuk Kim wrote:
> >>>>> On 09/09, Chao Yu wrote:
> >>>>>> On 2019/9/9 16:06, Jaegeuk Kim wrote:
> >>>>>>> On 09/09, Chao Yu wrote:
> >>>>>>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> >>>>>>>>> GC must avoid select the same victim again.
> >>>>>>>>
> >>>>>>>> Blocks in previous victim will occupy addition free segment, I doubt after this
> >>>>>>>> change, FGGC may encounter out-of-free space issue more frequently.
> >>>>>>>
> >>>>>>> Hmm, actually this change seems wrong by sec_usage_check().
> >>>>>>> We may be able to avoid this only in the suspicious loop?
> >>>>>>>
> >>>>>>> ---
> >>>>>>>  fs/f2fs/gc.c | 2 +-
> >>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>>>>>> index e88f98ddf396..5877bd729689 100644
> >>>>>>> --- a/fs/f2fs/gc.c
> >>>>>>> +++ b/fs/f2fs/gc.c
> >>>>>>> @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >>>>>>>  		round++;
> >>>>>>>  	}
> >>>>>>>  
> >>>>>>> -	if (gc_type == FG_GC)
> >>>>>>> +	if (gc_type == FG_GC && seg_freed)
> >>>>>>
> >>>>>> That's original solution Sahitya provided to avoid infinite loop of GC, but I
> >>>>>> suggest to find the root cause first, then we added .invalid_segmap for that
> >>>>>> purpose.
> >>>>>
> >>>>> I've checked the Sahitya's patch. So, it seems the problem can happen due to
> >>>>> is_alive or atomic_file.
> >>>>
> >>>> For some conditions, this doesn't help, for example, two sections contain the
> >>>> same fewest valid blocks, it will cause to loop selecting them if it fails to
> >>>> migrate blocks.
> >>>>
> >>>> How about keeping it as it is to find potential bug.
> >>>
> >>> I think it'd be fine to merge this. Could you check the above scenario in more
> >>> detail?
> >>
> >> I haven't saw this in real scenario yet.
> >>
> >> What I mean is if there is a bug (maybe in is_alive()) failing us to GC on one
> >> section, when that bug happens in two candidates, there could be the same
> >> condition that GC will run into loop (select A, fail to migrate; select B, fail
> >> to migrate, select A...).
> >>
> >> But I guess the benefit of this change is, if FGGC fails to migrate block due to
> >> i_gc_rwsem race, selecting another section and later retrying previous one may
> >> avoid lock race, right?
> > 
> > In any case, I think this can avoid potenial GC loop. At least to me, it'd be
> > quite risky, if we remain this just for debugging purpose only.
> 
> Yup,
> 
> One more concern is would this cur_victim_sec remain after FGGC? then BGGC/SSR
> will always skip the section cur_victim_sec points to.

Then, we can get another loop before using it by BGGC/SSR.

> 
> So could we reset cur_victim_sec in the end of FGGC?
> 
> Thanks,
> 
> > 
> >>
> >> Thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>>  		sbi->cur_victim_sec = NULL_SEGNO;
> >>>>>>>  
> >>>>>>>  	if (sync)
> >>>>>>>
> >>>>> .
> >>>>>
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
