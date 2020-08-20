Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9424C2E8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Aug 2020 18:06:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8n4d-0003pE-Lt; Thu, 20 Aug 2020 16:05:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k8n4c-0003p7-F3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 16:05:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=02FrIDf733KsD9phhTlHQ6GqQ1sh+JFxpirqnd1entA=; b=hpdOa4vA73kQB69YBV8dxsowun
 Z2+lICkhoVjtr/z3LpqkHnlEfQELI5hbcIQm+GAdT6QB3J0I12pTwACU+iPRgc+uL3HnO9RDhMWT8
 H7VvmMxZVXbQa/fVhVN6Brpqlj1kMgcYAILyXC7nvu3w4BS9t6txISBNgM6bIrfhcXTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=02FrIDf733KsD9phhTlHQ6GqQ1sh+JFxpirqnd1entA=; b=DsFwJyWLN7Iyy+VA95og+CrNcP
 OQ5WGrWAzLoCtxJSVpkmBUPn1NVJ0Yn50OKoiimmUHbmcrbZ4GZdrEtJ9+oTH0O1GnGiZ2qvpsC+j
 /28jFZ5SPsU9ZK+YUF+B/tUzpEwDe5FnizDMT5878+uhb8ZQct2dLfH8j8MZDDKQ8TDw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k8n4Y-00DddQ-Ru
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Aug 2020 16:05:54 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9223C20724;
 Thu, 20 Aug 2020 16:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597939540;
 bh=X3RkYc8CDl15fqMhS1yWkmLLkx48ZVkNvNOGrel4Qc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c6fBpcRfsKy7oH+BIXlWZc149akwQgJfMnKVcCqKWCc/llJ5cwHCZjpdjrkBPWOWi
 u0mqRt9Dy6lkkfF2fp47PACMriJjKVCZfby2u/63/Moe4sg9R1LvmAZIoIK+stjIkq
 P3amufJDG8HRPc1r2DiTFIt+K1WB5U4RGzOLljXs=
Date: Thu, 20 Aug 2020 09:05:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <20200820160540.GA2375181@google.com>
References: <20200819013448.148302-1-shinichiro.kawasaki@wdc.com>
 <20200819105748.plywpksq3cgm3j24@shindev.dhcp.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200819105748.plywpksq3cgm3j24@shindev.dhcp.fujisawa.hgst.com>
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
X-Headers-End: 1k8n4Y-00DddQ-Ru
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix type of section block count
 variables
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/19, Shinichiro Kawasaki wrote:
> On Aug 19, 2020 / 10:34, Shin'ichiro Kawasaki wrote:
> > Commit da52f8ade40b ("f2fs: get the right gc victim section when section
> > has several segments") added code to count blocks of each section using
> > variables with type 'unsigned short', which has 2 bytes size in many
> > systems. However, the counts can be larger than the 2 bytes range and
> > type conversion results in wrong values. Especially when the f2fs
> > sections have blocks as many as USHRT_MAX, the count is handled as zero.
> 
> I made a mistake in the commit message line above. Not 'USHRT_MAX' but
> 'UHSRT_MAX + 1' is the number to be zero after type cast to unsinged short.
> 
> Jaegeuk, if the patch is good enough for you to pick up, could you help to
> edit the line as follows?
> 
> > sections have blocks as many as USHRT_MAX + 1, the count is handled as 0.
> >                                          ^^^^                          ^
> 
> In case this patch needs update to v2, I will update the commit message.
> Sorry about this confusion.

No worries. I applied the above change. Thanks,

> 
> -- 
> Best Regards,
> Shin'ichiro Kawasaki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
