Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DE33903A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Mar 2021 15:46:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lKj3M-0001JS-Lv; Fri, 12 Mar 2021 14:46:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1lKj3L-0001JF-Je
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mr1FjbtOo2oaErNudiDkdyq/FC3uXpVrOtNOsRZRzZU=; b=XGA9KioGFVcXX5jeh9HSRVvN0s
 +lCUKRUAzDe8l5bmkbQJF+sAv0kPYYEdYKVBhYEt16Fenmxrj1azATTrjyKqQtqYPeAG53KX6G6Pc
 1Qeb274JSKqlLvh2PDuV2XvTxykkCLajdzVrNZ2XBOZeQlDHYt9HRMClA62y/ANaCab8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mr1FjbtOo2oaErNudiDkdyq/FC3uXpVrOtNOsRZRzZU=; b=fYq1S80G3nxHTBepXwVYVEa0py
 Lss/xD6vo05jt9pD10SyLmjKz1nAFbAwZtfJ3yq8rh/We6mPCyxfUra9FCt1mvsPzLtJIgvlm9Bcs
 hUIZ5ckRnosncT/YQ8UJIN9cLv73Bd9wHmm436kFuLpqDqx8+fl6L17A66Ied7WAKTmM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lKj36-005syX-7W
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Mar 2021 14:46:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4536A64FD6;
 Fri, 12 Mar 2021 14:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1615560350;
 bh=5OcUS67DMAnxCxpF2YhrDjA4ZH7gotBBF3aF5cp7VAo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OGrTW2c5kQMZqDLHOuPubJDXsH5iNNl9G1C8bABPxHyPcm06lamlCYPxjL/7xokSu
 6xqdQEaz0tP0k8l4U3D3jCYKk3PxisKyYJ9L5pw2AdXmglGrmAxermQHLMydovsQSS
 IA2wUtJS7RrAgy28DpmknVJbOyZw2fAvOZcmmZbs=
Date: Fri, 12 Mar 2021 15:45:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <YEt+nAEOd+YUdln8@kroah.com>
References: <20210312122531.2717093-1-daeho43@gmail.com>
 <YEtg8U7whCVV2tQt@kroah.com>
 <CACOAw_zhZ0OgT-KCBmD_H6_U=CZCNY44D-ojH2AZah2cbAvdAQ@mail.gmail.com>
 <YEt00vJ6oVfoRjSJ@kroah.com>
 <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_yjyy+58B=RawAaQO98NQB43roZOv4sq5313sFHN1myXQ@mail.gmail.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: daringfireball.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lKj36-005syX-7W
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add sysfs nodes to get runtime
 compression stat
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top


On Fri, Mar 12, 2021 at 11:37:29PM +0900, Daeho Jeong wrote:
> As you can see, if we're doing like the below.
> 
> sbi->compr_written_block += blocks;
> 
> Let's assume the initial value as 0.
> 
> <thread A>                                             <thread B>
> sbi->compr_written_block = 0;
> 
> sbi->compr_written_block = 0;
> +blocks(3);
>                                                                + blocks(2);
> sbi->compr_written_block = 3;
> 
> sbi->compr_written_block = 2;
> 
> Finally, we end up with 2, not 5.
> 
> As more threads are participating it, we might miss more counting.

Are you sure?  Isn't adding a number something that should happen in a
"safe" way?

And if you miss 2 blocks, who cares?  What is so critical about these
things that you take the cache flush of 2 atomic writes just for a
debugging statistic?

Why not just take 1 lock for everything if it's so important to get
these "correct"?

What is the performance throughput degradation of adding 2 atomic writes
to each time you write a block?

But really, will you ever notice missing a few, even if that could be
possible on your cpu (and I strongly doubt most modern cpus will miss
this...)

But this isn't my code, I just hate seeing atomic variables used for
silly things like debugging stats when they do not seem to be really
needed.  So if you want to keep them, go ahead, but realize that the
number you are reading has nothing to do with being "atomic" at all.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
