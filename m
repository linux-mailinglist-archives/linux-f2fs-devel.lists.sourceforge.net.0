Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB21E92EE
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 May 2020 19:36:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jf5Oy-000705-BF; Sat, 30 May 2020 17:36:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jf5Ow-0006zu-39
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PXvj5rBvBmvpa4rkFuOUlbBYTpoUR2R9/dzj0Hd9rUg=; b=AFLq/FdNODvN6jZAWSqJtCObU1
 MemIF1pwy14P2bEWEekLsCteqyxLQ3ya0NVOxGe0QYocjA4O+G0e2Y22eN7TCNulqpz3o8hlavpSF
 lbN7P0FeZJ3v/Ss8K16NlexmVXPBPi5/x8zQMLGHh4bSONx9uAOc3QyaWkM0zB8HIY4c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PXvj5rBvBmvpa4rkFuOUlbBYTpoUR2R9/dzj0Hd9rUg=; b=CNMHKiG9YNlp6efgjpxdhnTVTH
 MPmqmAypEOi6m6lpW5CUfi2AYKZ4b3UDz0zYT1SMzhOFaCBIGM6L4h+xy5jRC/JxCs6ZTt0DhYzpA
 HCKW1z4skuEOTaSgnofMXDMZOG6D1Wvm491czJa842c/xB3xr9+h/b3PQ7Hb+Sy+BZjs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jf5Op-0018Hr-6A
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 May 2020 17:36:06 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 71A3C20774;
 Sat, 30 May 2020 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590860148;
 bh=Km+qsBMMCDWbNMm6RhJqYLEma5l3VL5pC1iVxzc9Ljc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ONHZOgZx3Q3+kUxk28asW/VTjbkXr6fmbkaCLfRocfasre//eQ8N+H8ow5bFn2xpc
 uzOcmb+LeGzNgVi+kWs1F9TLCQo0V1V/Cx5r4MEnnaZoz/2+E51ez9VyjQ8BaL47rD
 3JZWi+c4WkS0ahXTI7RyIR2JEJ4iTPJZ2z9GX+tM=
Date: Sat, 30 May 2020 10:35:47 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200530173547.GA12299@sol.localdomain>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <20200530171814.GD19604@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530171814.GD19604@bombadil.infradead.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jf5Op-0018Hr-6A
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

On Sat, May 30, 2020 at 10:18:14AM -0700, Matthew Wilcox wrote:
> On Fri, May 29, 2020 at 11:02:16PM -0700, Eric Biggers wrote:
> > +	if (len <= DNAME_INLINE_LEN - 1) {
> > +		unsigned int i;
> > +
> > +		for (i = 0; i < len; i++)
> > +			strbuf[i] = READ_ONCE(str[i]);
> > +		strbuf[len] = 0;
> 
> This READ_ONCE is going to force the compiler to use byte accesses.
> What's wrong with using a plain memcpy()?
> 

It's undefined behavior when the source can be concurrently modified.

Compilers can assume that it's not, and remove the memcpy() (instead just using
the source data directly) if they can prove that the destination array is never
modified again before it goes out of scope.

Do you have any suggestions that don't involve undefined behavior?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
