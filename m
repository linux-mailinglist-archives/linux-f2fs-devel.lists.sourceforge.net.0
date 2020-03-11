Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8916181F9B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 18:35:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC5GX-0001nU-Ii; Wed, 11 Mar 2020 17:35:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jC5GW-0001nI-Jt
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zKJ+YEkEw7A18umBYOZPQE46xiKsXK62wC8gi/w2Mto=; b=mvG5V9XUANsR567m/rlscDE3Vb
 qOBUuIZKEh6HyV12IEefr/AxE9APiiWCz9pU+iQm1kvLjwXKkpflaBbMjDTaxeKp1az7/biNAfT68
 wKU42MWkf9HclLYxZUtS/fSpuyBRtQIgkwZyUbR2gGaMFBfT0DfjiGcfKHtdToqDhpMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zKJ+YEkEw7A18umBYOZPQE46xiKsXK62wC8gi/w2Mto=; b=LQlGVX7s9+OIWp/FbdaWnpomva
 8FqunpMG+DduAoZbbaDtu/MXTbKp9ycnqFZxpZbSXfK4Zz39X7n1pzIn23VI0u6cel4b2+bv7h8ia
 27IkGzG/Cznjtf4Ozt3QDFFFtuaRetqhWFp0SuWAIQRxKtcrQ1dKq5ESTbCYthYrfzjo=;
Received: from [198.145.29.99] (helo=mail.kernel.org)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC5GT-008btu-CS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 17:35:32 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57EBA2072F;
 Wed, 11 Mar 2020 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583948114;
 bh=uRPyYMPVAszfnVKvro8kpzdf0xTwiUPLRA5JUmq/v9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AFREYax8HihMgrTlVKVrpk3AA9/wEAT4h2oCHN1AyBMB7R+05HA2C0vFxIJMHH27R
 UPkC4nDbncZxW0a7COmWptXuSEreRqBTWA6DrlfAZg5l5dN1cyosfdQT2vN4xMPlh0
 7y7peuTKexQxFbK0VPX1Og1l2zOYka3QVDU2pjwc=
Date: Wed, 11 Mar 2020 10:35:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20200311173513.GA261045@google.com>
References: <20200311162735.GA152176@google.com>
 <CAHk-=wjES_Si7rUtu_EuYu4PDz4OGdA4BWhYGJ=zOoJiELiykw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjES_Si7rUtu_EuYu4PDz4OGdA4BWhYGJ=zOoJiELiykw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jC5GT-008btu-CS
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
> On Wed, Mar 11, 2020 at 9:27 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> >
> > Sorry for late pull request. Could you please consider this?
> 
> I pulled this, and then immediately unpulled.
> 
> Most (all?) of the commits have been committed basically minutes
> before you sent the pull request.
> 
> That's simply not acceptable. Not when we're in late rc, and with
> hundreds of lines of changes, and when there is no explanation for a
> late pull request that was very very recently generated.

I actually merged the last three patches which were introduced yesterday.
I thought that it'd be fine to pull in, since they are quite trivial several
lines of code changes.

Others were merged over a week ago, and I've tested in the mean time.
It seems the commit times were modified as recent date, when I reorganized
there-in commits aligned to other branch, dev-test. Probably, I had to keep
the commit date in somehow.

Thanks,

> 
>                 Linus


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
