Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA824446
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 01:24:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSreD-0000Gd-Mj; Mon, 20 May 2019 23:24:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hSreD-0000GX-Ce
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:24:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t+uaP/ohAj63Wv22oQBrYBTiAke4jqpS5KSHzp01SDk=; b=CzSy62yk87sANeYRyt58uM93Y6
 mKb0fWTvwFVIZqCOvEpNC4l8oMaMnJ9NtDtOG0CJicLF3tnfcD6TYKaRNAXrPoHzwFK2aDT7nR/1s
 I+Nzjp7wTjd4xk5HJ+H1fnSAA6zvzuhxlQrRAGciN91TCU9CmuUJgV3nqEWRWPKXfQCg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t+uaP/ohAj63Wv22oQBrYBTiAke4jqpS5KSHzp01SDk=; b=h0K0SXIOTjlCFh+mFU1zcrHgPs
 Phlr0F4u1aGjMFi2TF2rpuIkb2HPfNKeRX92Twnzw+s/aHBl32syybo2pMCfXcLyf+BTF6FZmYb4l
 OQdbmO4BhwNjVdEmI9KHX9tAhfz42ym3zPS/z5I5RYN38mKW57dcGtPdAQMaKa4MGkEo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSreC-0016LN-4v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:24:49 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82A3B20862;
 Mon, 20 May 2019 23:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558394682;
 bh=EAIisFPL9YiInF7rgY/58eLITFlmvPrtrY9ljPOJESM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sw3G2hqCcL7bO82bvqv/r6Z10kCLkBqgQgMffjGSQhFIWJTqAWbEaKMQgjZD1mj/i
 GuMymrpa9y9N7xKW+QaPFzS2D0t+N7RwRMEIb/GM6aDnEiYKKaoU8wjUtf5/fSuymL
 mCnwcegCm2qtJ6blWxg1+xPD4Gq//tYPfpdkgTeo=
Date: Mon, 20 May 2019 16:24:41 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190520232441.GA61195@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190212023343.52215-1-jaegeuk@kernel.org>
 <5ee36ad7-9fe9-adcf-0974-5c17fa8d50ee@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5ee36ad7-9fe9-adcf-0974-5c17fa8d50ee@huawei.com>
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
X-Headers-End: 1hSreC-0016LN-4v
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't clear CP_QUOTA_NEED_FSCK_FLAG
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

On 05/10, Chao Yu wrote:
> On 2019/2/12 10:33, Jaegeuk Kim wrote:
> > If we met this once, let fsck.f2fs clear this only.
> > Note that, this addresses all the subtle fault injection test.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  fs/f2fs/checkpoint.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index 03fea4efd64b..10a3ada28715 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1267,8 +1267,6 @@ static void update_ckpt_flags(struct f2fs_sb_info *sbi, struct cp_control *cpc)
> >  
> >  	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH))
> >  		__set_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> > -	else
> > -		__clear_ckpt_flags(ckpt, CP_QUOTA_NEED_FSCK_FLAG);
> 
> Jaegeuk,
> 
> Will below commit fix this issue? Not sure, but just want to check that.. :)
> 
> f2fs-tools: fix to check total valid block count before block allocation

I started test again whether we can revert this or not. :)
Let's see.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
