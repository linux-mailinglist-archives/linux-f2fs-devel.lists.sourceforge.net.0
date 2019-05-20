Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F14A6244D9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 01:56:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSs8m-0001g6-No; Mon, 20 May 2019 23:56:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hSs8l-0001fv-5I
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:56:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NwDA6ghM6QLpqMOppzIfrtQWz+NiiYdN+gsVFgCtjjc=; b=Xqw+u2FOMd3iUUElLLViQ6gAxK
 fvMcDT3p3T9z+OYdI+lXLygaLeLnPF/3QNu3v8bd2MPOW+sjPpxXnKFihBjwIRlQ71R/VvBdASQrV
 bRVk8Y8cWd5OR6CGaGidPwxC5lyH+sdfhu6XpuY8yiinPa+UvFqW4ms55JiOI7aGlpc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NwDA6ghM6QLpqMOppzIfrtQWz+NiiYdN+gsVFgCtjjc=; b=i8JYIIf4kGO3Kz4GihdfGyeGBA
 WiNgoiGvJOwySU7spXudvThzi/JWFXG2ndQAdR0QfinnkyXu6wYompjdBceufRTvpHuc7BeLmAi5n
 D/96WpDUpleFtMNdhZCbTMWBw0pYx//f2j5u+QmmlTW/575dpsq8RM7JEfbT2qUt3b7Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hSs8j-00CpDi-7x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 23:56:23 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C2B02173C;
 Mon, 20 May 2019 23:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558396575;
 bh=eAz2gwrEX0FBGhzvzLmaUTeqCYvDeT5sIp8WTzMGe68=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hx8XsCaiFuur9A6ZCk45AWEzuHFmBNbeCqa/riTokwM4UQS8e0xQ33xatNB58k0Fc
 U/AfVrBD6+DiCw1+PtYhRn7hxxIAkOYhUpXtO3F5G0vC0/t1nYrlcDCu1+WnEVoxMZ
 bA7GuaT91pd2Kt6r0ncQH83T2Ig6Qc2wN/BcWouM=
Date: Mon, 20 May 2019 16:56:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190520235614.GB61195@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190424175730.70979-1-ebiggers@kernel.org>
 <242d8b26-592b-57da-bd1f-3466bf714803@huawei.com>
 <20190515154846.GA21903@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190515154846.GA21903@sol.localdomain>
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
X-Headers-End: 1hSs8j-00CpDi-7x
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: improve xattr value printing
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/15, Eric Biggers wrote:
> On Sun, Apr 28, 2019 at 02:25:10PM +0800, Chao Yu wrote:
> > On 2019/4/25 1:57, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > - Print the values of xattrs that have an unknown ->e_name_index, rather
> > >   than ignoring them.
> > > 
> > > - Replace char with u8.  Otherwise xattr values containing bytes >= 0x80
> > >   are printed incorrectly on platforms where char is signed.
> > > 
> > > - Only parse the encryption xattr if it has a known format number and
> > >   size.  Otherwise print it as hex.
> > > 
> > > - Remove incorrect le16_to_cpu() on ->e_name_len which has type u8.
> > > 
> > > - Consolidate the code that prints the xattr value as hex.
> > > 
> > > - Constify pointers to the xattr entry.
> > > 
> > > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > 
> > Reviewed-by: Chao Yu <yuchao0@huawei.com>
> > 
> > Thanks,
> > 
> 
> Hi Jaegeuk, are you planning to apply this patch?

Yup, it's in dev branch. Just too busy to add them into master.
Thank you for the heads up. Will do soon.

> 
> Thanks,
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
