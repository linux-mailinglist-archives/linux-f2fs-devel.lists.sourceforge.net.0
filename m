Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF21E93A2
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 22:41:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jf8Ii-0007Jh-Tg; Sat, 30 May 2020 20:41:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jf8Ig-0007JP-0G
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 20:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4OdrZK2pGyMVHZP9dBAVdzAWc40dh9XQscP29VyVrvM=; b=NPZO8sJ+vZ+NUu2D/hwh9aKMHM
 DMgTBGNt2vQmcbANPOmf+Hfbplkeeilnz2qc6Dtds8E11kmtdNzTW8eIPXPL/O3i7ZGF9C2HsQDIK
 cwLsrqjIhBGsjM1rL6MzWss8ni+z6+CU2SVcxHPb6FYTUHjgQy9doo3QrD3cUuKMHg4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4OdrZK2pGyMVHZP9dBAVdzAWc40dh9XQscP29VyVrvM=; b=SNFgnQAAPOTzE+OClkU0fsk/d8
 aL8/O2BSZLwHQw7NbYLRl1KlDEe/jqivyO6PG9o6rVkNq1n8ZF5siiFxTZpu34WITU2uyvHWxuE7I
 10BuX2cagz1ZF43ThAI+vfpKEBCRT6aXmK0OjGrInxl0TWS7C2lKTnf5IUIpB0uK1Qd4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jf8Ib-001F31-E6
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 20:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4OdrZK2pGyMVHZP9dBAVdzAWc40dh9XQscP29VyVrvM=; b=HZvQiU2YlUtBkyi6j0X0sBvcK6
 YZbb6RElwJlDvQSoI8EnGgMdqBHoihEOfco2ouCjUP4Lrt9K1yHxN8OR5Caaio7SnY2tGtjpu2vng
 jr1IQnGoevyNcal8I/kgEqEGTu3l+Zwlh5LVZwcZgiHGb4WD6ut/ABzyv8M2MhE68B0QNvidpnC3Q
 2Lj81yDjMRBVamW438WZSQXqIyI6NJY97hDAeLt7m7VQQfHf4EELlTmQSzzKspRVXWPOK0cCOwljZ
 sJ9Nep2Dn0XzCi79koJwJFZzSkEGkTSq4HO0sQ6syXZ7aNRGYBeUxnVBXkgbEbKIIudGg/NB/2i+7
 XqHaEaWg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jf8IO-0000XW-Qx; Sat, 30 May 2020 20:41:32 +0000
Date: Sat, 30 May 2020 13:41:32 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200530204132.GE19604@bombadil.infradead.org>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <20200530171814.GD19604@bombadil.infradead.org>
 <20200530173547.GA12299@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530173547.GA12299@sol.localdomain>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jf8Ib-001F31-E6
Subject: Re: [f2fs-dev] [PATCH] ext4: avoid utf8_strncasecmp() with unstable
 name
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
Cc: Daniel Rosenberg <drosen@google.com>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 30, 2020 at 10:35:47AM -0700, Eric Biggers wrote:
> On Sat, May 30, 2020 at 10:18:14AM -0700, Matthew Wilcox wrote:
> > On Fri, May 29, 2020 at 11:02:16PM -0700, Eric Biggers wrote:
> > > +	if (len <= DNAME_INLINE_LEN - 1) {
> > > +		unsigned int i;
> > > +
> > > +		for (i = 0; i < len; i++)
> > > +			strbuf[i] = READ_ONCE(str[i]);
> > > +		strbuf[len] = 0;
> > 
> > This READ_ONCE is going to force the compiler to use byte accesses.
> > What's wrong with using a plain memcpy()?
> > 
> 
> It's undefined behavior when the source can be concurrently modified.
> 
> Compilers can assume that it's not, and remove the memcpy() (instead just using
> the source data directly) if they can prove that the destination array is never
> modified again before it goes out of scope.
> 
> Do you have any suggestions that don't involve undefined behavior?

void *memcpy_unsafe(void *dst, volatile void *src, __kernel_size_t);

It can just call memcpy() of course, but the compiler can't reason about
this function because it's not a stdlib function.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
