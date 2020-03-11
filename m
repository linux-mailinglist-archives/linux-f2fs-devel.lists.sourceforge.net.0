Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 230EB181FFF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 18:48:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC5TM-0005aU-Q6; Wed, 11 Mar 2020 17:48:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jC5TL-0005aM-8G
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:48:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Unly3C3+gr7731ExqEwNqQqD050BoBWzFjgavDaXPrY=; b=dhakg/jX264gXQSLVWRVy0BQb2
 s1/+my8+F2PXh5aBqG227PiSUMSMlmYSHCkBDMdLRRBm6AmaxFclkVHL71M4kj4lHvfXhjiGNuMy/
 49mOVdRS2ydp+6g6rmFoRgGt/aovV6ITDe84fYV5ZN6SMdPScrdVaLbDS24t5jt88uLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Unly3C3+gr7731ExqEwNqQqD050BoBWzFjgavDaXPrY=; b=WMBhEvhDs8XuFvvjqUaubk0BOH
 B6lA1jtHSExB1XUF9W/PYf4dj5dZcXs8agP8dvV3u2ZEfRaSPYJiLLqsPgnAY18HKK0wy28R5gfi/
 zWEWgjPql8MHQvcZGNiPVv5Q+054bhaC5JuS+kxJlRVDPqtzTSCzOGcj8BmPBB3KauIc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC5TI-00ForW-4l
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:48:47 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F1C5B20734;
 Wed, 11 Mar 2020 17:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583948919;
 bh=o6cfFMd76vbeZd9f32n4LmEvpTaX32KdbDibeKUu9jU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lNcHirCXMuXTRjxAhcBTXM+uJDRIFTyQ7xcnNZSGcV3HXtYu50FYhlFQKyeqt5Qi+
 ybY2UKmTNNL9si7JuFc72Uusfw+T/EyxehtOUL6ajiw4gusPq9ta9DeeW7dm3u+qzM
 /B07T/grBRqlow0OJHle22MB4VhyWV3rB0tgMFRw=
Date: Wed, 11 Mar 2020 10:48:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200311174837.GA82207@google.com>
References: <20200311162735.GA152176@google.com>
 <CAHk-=wjES_Si7rUtu_EuYu4PDz4OGdA4BWhYGJ=zOoJiELiykw@mail.gmail.com>
 <20200311173513.GA261045@google.com>
 <CAHk-=wiVpnOo9MyOpHxAyuv0ZBGCsW2tMmOtwb+6CX-taKRtKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wiVpnOo9MyOpHxAyuv0ZBGCsW2tMmOtwb+6CX-taKRtKQ@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.0 (/)
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
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jC5TI-00ForW-4l
Subject: Re: [f2fs-dev] [GIT PULL] f2fs for 5.6-rc6
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/11, Linus Torvalds wrote:
> On Wed, Mar 11, 2020 at 10:35 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > I actually merged the last three patches which were introduced yesterday.
> >
> > Others were merged over a week ago.
> 
> No, three were done just before you sent the pull request, and then
> seven others were done yesterday.

Due to my rebase work. :(

> 
> Yes, the rest were a week ago.
> 
> But basically, by rc6, I want to get the warm and fuzzies that the
> code has been tested, seen review, and isn't some last-minute
> addition.

Ok, I see. Let me prepare them for next merge window.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
