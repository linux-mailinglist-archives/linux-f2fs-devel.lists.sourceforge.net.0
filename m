Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 910EAB6872
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2019 18:48:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iAd7e-0005S5-If; Wed, 18 Sep 2019 16:48:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iAd7c-0005Rk-1N
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 16:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uLRK5cmbvWS8LX/NXctb3nZHA/YRTOmPJIf+aUYoAAs=; b=FBJMwMq0MSUurdS8B6SAiSJQcs
 Y/SC6o9UHBkfJ2IbU9ryKc2YkAKrTCqEv+TARwVNN53QNu014A6t5SgQEWDG7wRlD0AaiFSwgQi2N
 L7KXbgsIKoMmnrKzH3jzypcCWtHTRNOf2MtpWCKYJjE63Lj4ULL9G1t5vfQtDe3M2VII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uLRK5cmbvWS8LX/NXctb3nZHA/YRTOmPJIf+aUYoAAs=; b=dY/9oYpGsixW1a+5Kr2DyOpqQr
 xm0qSP3kvtke5uJ3C4jdlDt75+8NDsn+4/djaa6o97AkqMpUYCrnvGAm3K83zmYtF+SPzuzfolyNz
 ix+OjjSwr2/ITlkhl1/zJA879zRYW2xb3iAPxj9NPTbtTQ4gwbSdp0OpTpp7cdYtYuFI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1iAd7Z-009HaO-SG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Sep 2019 16:48:03 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 52D82218AE;
 Wed, 18 Sep 2019 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568825275;
 bh=dT8WG2DycZhc/fpKSgROJHbA/O6sl74Vzx7O0UdeWt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=saox0hpaKbeFfsuq0ImpXJzHzGWB4nd3hnPuSOYOCOgdZvdNG67r4gVp1K7nk0Ogp
 gCnuFmZMH+SrPbsOytnPBQ2F3vU9O15kAaR0wcIOaIYjOuuCOvexB738PHrFl28MOC
 4qE+8aQwLwNjSBW39jdMgWCRlMRwmDZq9ctPBaGw=
Date: Wed, 18 Sep 2019 09:47:54 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190918164754.GA88624@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909080654.GD21625@jaegeuk-macbookpro.roam.corp.google.com>
 <97237da2-897a-8420-94de-812e94aa751f@huawei.com>
 <20190909120443.GA31108@jaegeuk-macbookpro.roam.corp.google.com>
 <27725e65-53fe-5731-0201-9959b8ef6b49@huawei.com>
 <20190916153736.GA2493@jaegeuk-macbookpro.roam.corp.google.com>
 <ab9561c9-db27-2967-e6fc-accd9bc58747@huawei.com>
 <20190917205501.GA60683@jaegeuk-macbookpro.roam.corp.google.com>
 <e823b534-f4de-7f59-0c26-ff2c463260d1@huawei.com>
 <20190918031257.GA82722@jaegeuk-macbookpro.roam.corp.google.com>
 <b4f3f571-debc-c900-9ce7-d4326b3d8038@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b4f3f571-debc-c900-9ce7-d4326b3d8038@huawei.com>
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
X-Headers-End: 1iAd7Z-009HaO-SG
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
> On 2019/9/18 11:12, Jaegeuk Kim wrote:
> > On 09/18, Chao Yu wrote:
> >> On 2019/9/18 4:55, Jaegeuk Kim wrote:
> >>> On 09/17, Chao Yu wrote:
> >>>> On 2019/9/16 23:37, Jaegeuk Kim wrote:
> >>>>> On 09/16, Chao Yu wrote:
> >>>>>> On 2019/9/9 20:04, Jaegeuk Kim wrote:
> >>>>>>> On 09/09, Chao Yu wrote:
> >>>>>>>> On 2019/9/9 16:06, Jaegeuk Kim wrote:
> >>>>>>>>> On 09/09, Chao Yu wrote:
> >>>>>>>>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> >>>>>>>>>>> GC must avoid select the same victim again.
> >>>>>>>>>>
> >>>>>>>>>> Blocks in previous victim will occupy addition free segment, I doubt after this
> >>>>>>>>>> change, FGGC may encounter out-of-free space issue more frequently.
> >>>>>>>>>
> >>>>>>>>> Hmm, actually this change seems wrong by sec_usage_check().
> >>>>>>>>> We may be able to avoid this only in the suspicious loop?
> >>>>>>>>>
> >>>>>>>>> ---
> >>>>>>>>>  fs/f2fs/gc.c | 2 +-
> >>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>>>>>>
> >>>>>>>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> >>>>>>>>> index e88f98ddf396..5877bd729689 100644
> >>>>>>>>> --- a/fs/f2fs/gc.c
> >>>>>>>>> +++ b/fs/f2fs/gc.c
> >>>>>>>>> @@ -1326,7 +1326,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
> >>>>>>>>>  		round++;
> >>>>>>>>>  	}
> >>>>>>>>>  
> >>>>>>>>> -	if (gc_type == FG_GC)
> >>>>>>>>> +	if (gc_type == FG_GC && seg_freed)
> >>>>>>>>
> >>>>>>>> That's original solution Sahitya provided to avoid infinite loop of GC, but I
> >>>>>>>> suggest to find the root cause first, then we added .invalid_segmap for that
> >>>>>>>> purpose.
> >>>>>>>
> >>>>>>> I've checked the Sahitya's patch. So, it seems the problem can happen due to
> >>>>>>> is_alive or atomic_file.
> >>>>>>
> >>>>>> For some conditions, this doesn't help, for example, two sections contain the
> >>>>>> same fewest valid blocks, it will cause to loop selecting them if it fails to
> >>>>>> migrate blocks.
> >>>>>>
> >>>>>> How about keeping it as it is to find potential bug.
> >>>>>
> >>>>> I think it'd be fine to merge this. Could you check the above scenario in more
> >>>>> detail?
> >>>>
> >>>> I haven't saw this in real scenario yet.
> >>>>
> >>>> What I mean is if there is a bug (maybe in is_alive()) failing us to GC on one
> >>>> section, when that bug happens in two candidates, there could be the same
> >>>> condition that GC will run into loop (select A, fail to migrate; select B, fail
> >>>> to migrate, select A...).
> >>>>
> >>>> But I guess the benefit of this change is, if FGGC fails to migrate block due to
> >>>> i_gc_rwsem race, selecting another section and later retrying previous one may
> >>>> avoid lock race, right?
> >>>
> >>> In any case, I think this can avoid potenial GC loop. At least to me, it'd be
> >>> quite risky, if we remain this just for debugging purpose only.
> >>
> >> Yup,
> >>
> >> One more concern is would this cur_victim_sec remain after FGGC? then BGGC/SSR
> >> will always skip the section cur_victim_sec points to.
> > 
> > Then, we can get another loop before using it by BGGC/SSR.
> 
> I guess I didn't catch your point, do you mean, if we reset it in the end of
> FGGC, we may encounter the loop during BGGC/SSR?

FGGC failed in a loop and last victim was remained in cur_victim_sec.
Next FGGC kicked in and did the same thing again. I don't expect BGGC/SSR
wants to select this victim much, since it will have CB policy.

> 
> I meant:
> 
> f2fs_gc()
> ...
> 
> +	if (gc_type == FG_GC)
> +		sbi->cur_victim_sec = NULL_SEGNO;
> 
> 	mutex_unlock(&sbi->gc_mutex);
> 
> 	put_gc_inode(&gc_list);
> ...
> 
> Thanks,
> 
> > 
> >>
> >> So could we reset cur_victim_sec in the end of FGGC?
> >>
> >> Thanks,
> >>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Thanks,
> >>>>>>>>
> >>>>>>>>>  		sbi->cur_victim_sec = NULL_SEGNO;
> >>>>>>>>>  
> >>>>>>>>>  	if (sync)
> >>>>>>>>>
> >>>>>>> .
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
