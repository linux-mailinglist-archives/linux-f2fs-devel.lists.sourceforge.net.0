Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 069FA5397DF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 22:15:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw8HI-0001an-UL; Tue, 31 May 2022 20:15:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nw8HH-0001ac-Qz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 20:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fUA7TJ2clMSFJ5rR8iYkdDB6a7yjJ3rXsQMdNpe/NNM=; b=Jcw+mhzQBKbgvGoTjBjt1169CG
 BNeXs6c/kaSR3Iah8TkRLiQilvx4VnUAarbYJ+g4EW2yVQqX9pS2Kuzl11HTzVcdYMguy4TVCZcVm
 6/OZbdi3cOSdbc+LgbfyTof8qU3rUO0iphK4JIIu+KGs01e0tRXoqMJnBFFnqTqBzSMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fUA7TJ2clMSFJ5rR8iYkdDB6a7yjJ3rXsQMdNpe/NNM=; b=SWfgK7AjqQEfErn4D4VQ6wA/hS
 +5ImjB20JGloPbyLf5HeUytc3XFjc2jnK1f+YYZitCLShpHgKFFeOYMdIIlQfxxxLXLzMt9xCVP/1
 aVyhWS3tHflq0F1b7s1QVQpZekonaXfltxqsmraWTwcSjRJdzB8o161jvxuNBuDTVuD0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nw8HD-00C7QP-AI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 20:15:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4D1E9CE177F;
 Tue, 31 May 2022 20:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DB84C385A9;
 Tue, 31 May 2022 20:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654028122;
 bh=BFanbqOhtsJfdsE0t1WgCWXCbNVZbf6rMzjnBDejGko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HTExhv82IFTfAX9On7K7/OBjqiJbZE6iPiLVuvD4xx82SDjLP9P74u8VjQUVFAjYl
 ipwq3tQzLRu4WCAoOB9JIjZvP0W8r6gnw6qcSNx7RiF1RvUBlur0Axirx9QoHRO4xQ
 mIa5TUL/xyxubDp51oQbQjoddfa2708yaXR7QhTbDyXUch3iGCMttd33LEyVHbjjT9
 gq98XIBn/tlCG0GYwnLfHur6a6GxGG911xMwSm8K4GCtR51UsL7NzWgvbXkVlJGppV
 og6hGBkGa9DhTnwHtJ5GGoTvNVvSzmeqXzaqVn+W2rpE3QZ9cgjwzIA2RaKx8qJWFD
 Xo/D5sYinC2bg==
Date: Tue, 31 May 2022 13:15:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YpZ3WI/Vjgk/CwFE@google.com>
References: <20220527205955.3251982-1-jaegeuk@kernel.org>
 <YpFDw3mQjN1LBd2j@gmail.com> <YpF1gPrQY3UFsgwC@google.com>
 <YpGtDhV7V7gDk430@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YpGtDhV7V7gDk430@infradead.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/27, Christoph Hellwig wrote: > On Fri, May 27, 2022
 at 06:06:08PM -0700, Jaegeuk Kim wrote: > > I think there's still some benefit
 to use FUA such as small chunk writes > > for checkpoint. > > D [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nw8HD-00C7QP-AI
Subject: Re: [f2fs-dev] [PATCH] f2fs: add sysfs entry to avoid FUA
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-block@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/27, Christoph Hellwig wrote:
> On Fri, May 27, 2022 at 06:06:08PM -0700, Jaegeuk Kim wrote:
> > I think there's still some benefit to use FUA such as small chunk writes
> > for checkpoint.
> 
> Did you measure if there is?  Because some SSDs basically implemented
> FUA as an implied flush after the write, in which case it would not
> really help there either (but also not hurt).
> 
> But as the previous two maintainers already said - this needs quirking
> at the driver layer, not in the submitter.

Thanks, I indeed measured this using UFS, and it turned out cache_flush
is better than FUA all the time like this. Hence, I posted a quirk [1].

Write(us/KB)	4	64	256	1024	2048
FUA		873.792	754.604	995.624	1011.67	1067.99
CACHE_FLUSH	824.703	712.98	800.307	1019.5	1037.37

[1] https://lore.kernel.org/linux-scsi/20220531201053.3300018-1-jaegeuk@kernel.org/T/#u


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
