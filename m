Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE1A2B6A73
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Nov 2020 17:41:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kf42P-0005rw-Ei; Tue, 17 Nov 2020 16:41:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kf42M-0005rf-UM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 16:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G4nJyWOOgFVPNjN26OQYXP+EpUr8BtD9ZArelFtwfVM=; b=gBqk/K39utGQZ93Soi2xJrItcY
 wVZpWqJ7Zpwl7ihngdXIpO4Bze075qUax86CcG1xhhyPviCG83aelH0xdZ2E3pv6OPLbQFrd7DjEi
 A1S08BnobwOLxhmo755ISY3SsRJTK0YDR57oJPdn67oCJC6QUGUBvM2juPQI4IAb/New=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G4nJyWOOgFVPNjN26OQYXP+EpUr8BtD9ZArelFtwfVM=; b=gjnDAcSuM9p0YvIgF4eE0w9nNT
 O7wiqcF576u2jYXIIFa4sv7M8iJhM6nCOnBTvtFQwUNhVGj4OrPYfJbuU4NCJQc0wgDakOrGLHo8u
 cE6aZjpVll2dMOjDdlDQpol626CvgxqcZc1V6o4NGizrQZiJDXyKtjhXbLtL+j4455EM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kf420-0016Xf-Ov
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Nov 2020 16:40:58 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE6CA21D7E;
 Tue, 17 Nov 2020 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605631224;
 bh=dVxDFAXp6FT9+XWoqU4EDdf3Oe33FE/vSylhfLqTJVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AplUYdKVw+5q2guEA+7SSOzhDI0mbCO+QtVbEflBbv070cX030TV4iVc6rUOziYdB
 27J3C+KSf4VJoMOGT0Nk5yUbx4D4xdvGG/KAwfqz3OZScMP4MBGXPAllELo+2XtJhJ
 kMzl/pywyeWOgjdAhxxyB8m69EHSLWVV/GlQjQRo=
Date: Tue, 17 Nov 2020 08:40:21 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201117164021.GA1636127@google.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com>
 <20201112054051.GA4092972@google.com>
 <4aae85c2-1829-06c0-8fd1-4148100dc0b9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4aae85c2-1829-06c0-8fd1-4148100dc0b9@huawei.com>
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 2.4 FSL_HELO_FAKE          No description available.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kf420-0016Xf-Ov
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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
 Light Hsieh <Light.Hsieh@mediatek.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/12, Chao Yu wrote:
> On 2020/11/12 13:40, Jaegeuk Kim wrote:
> > Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> > wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.
> > 
> > Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> > v3:
> >   - fix to use NM_I(sbi)
> > 
> >   fs/f2fs/shrinker.c | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> > index d66de5999a26..555712ba06d8 100644
> > --- a/fs/f2fs/shrinker.c
> > +++ b/fs/f2fs/shrinker.c
> > @@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
> >   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
> >   {
> > -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> > +	long count;
> > +
> > +	down_read(&NM_I(sbi)->nat_tree_lock);
> > +	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> > +	up_read(&NM_I(sbi)->nat_tree_lock);
> >   	return count > 0 ? count : 0;
> 
> Minor thing,
> 
> Just return count is enough? since count should never be smaller than 0.

Yeah, but let me keep this just in case.

> 
> Anyway,
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 
> Thanks,
> 
> >   }
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
