Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EC51F7FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2019 17:49:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hQwAD-0006sy-Fe; Wed, 15 May 2019 15:49:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hQwAC-0006sn-LY
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 15:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hw2hztWOOCj0bqPYufUpoGNl7w0SD68xvdgpWGoSPd4=; b=jcczNvKaBXQ0ytPR0g/i2beWWE
 cyDbOWX2pg3Z+gP9eAJ+32cMvkpTq0soqv45qoFCEAnHOgvj8GOgl9mnCYsAQ1z7V8UjSyG5nQk7L
 seyDYUoueZEu6Mi1jU85AMRItm4NmGf+MQOYBHy8tvoEydvAXuqa0Qyhxh0nx97lnleU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hw2hztWOOCj0bqPYufUpoGNl7w0SD68xvdgpWGoSPd4=; b=Pl8ojmjKAL0XOxHUREenFXZ+O1
 A8zVvkpW7OptzhXGgsKOAUCD7c5t5pDOns4MLoJ7/2SVgmjcn8kYfllIdY0KKIUz+pBDWuM8OzSBW
 nZ2YernJjcemZBcG7/BofGuJxhXayAdZl96dV3IV3Xlpw3tijO4dYJ8A1AfVwSWBKTcU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hQwAB-004ulv-D4
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 May 2019 15:49:52 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ED8C20818;
 Wed, 15 May 2019 15:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1557935385;
 bh=Ndp4Y0wKILIbKDLuo2pthEdlo5rVUdhtSHXsMELisKw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uCLF5acAlb+VaLCq+rWhbK/i+zDOtrW4LIv/Rg6AXr8GomXBBin+4qhbH33Le1vvc
 wGGrytExQQyRo3Qf47T+YXSDLqWqd4GJUK5MfBNrlfvzTYAFL1SqYuc/JEbbr7jNQd
 ZBFq0D8buJ8EZGjWVc2MLxdSs28uV/3x8mqo78Fk=
Date: Wed, 15 May 2019 08:49:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20190515154943.GB21903@sol.localdomain>
References: <20190424175909.71430-1-ebiggers@kernel.org>
 <bc18ee1a-8c31-fe76-fd13-a401ce203095@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc18ee1a-8c31-fe76-fd13-a401ce203095@huawei.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hQwAB-004ulv-D4
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: improve filename printing
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

On Sun, Apr 28, 2019 at 02:25:37PM +0800, Chao Yu wrote:
> On 2019/4/25 1:59, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > - Make buffers for pretty-printed filenames 341 bytes long, long enough
> >   for 255 (NAME_MAX) base64-encoded bytes.  Then print encrypted
> >   filenames in full, base64-encoded.  This will be useful for tests I'm
> >   writing which verify the correct ciphertext is stored on-disk.
> > 
> > - Rename convert_encrypted_name() to pretty_print_filename(), to make it
> >   clear that it handles unencrypted names too.  Also make the output
> >   'char' rather than 'unsigned char', as it's for printing; and remove
> >   the unnecessary return value.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> 
> Reviewed-by: Chao Yu <yuchao0@huawei.com>
> 
> Thanks,
> 

Hi Jaegeuk, are you planning to apply this patch?

Thanks,

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
