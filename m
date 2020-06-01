Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8C61E9EC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 09:05:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfeVw-00024c-LJ; Mon, 01 Jun 2020 07:05:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jfeVv-00024Q-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 07:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zzZbg6vchb4W1EGHL1ltr5VvzmgvvF0bJQ4NBhDXQzM=; b=ElroVHScYlH55dgoYMWsSCdMZI
 8C1KF4bnnobLRDxbGmBFDtteoxVDrqa/BhUVh8F3Bt3RQ60+8puPeAh3SxdDfECNYBFQtsLRjhJTL
 +jgX7RDGDrGoOXRj5KQ5AagSuIRopL0mZPJwDLKx1T86T/OOfkiltQC2zKYKiK32WPDY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zzZbg6vchb4W1EGHL1ltr5VvzmgvvF0bJQ4NBhDXQzM=; b=CdhNnd7gXQ8ToFNWhmsQV4tFwm
 2RcsA/6fNSdmCklYG1Wx2OKoRWLfaV6n3EUlq75e1Y80l5oFnYbx+BLl1bWQ41HhxOrtOs9GjV7ZB
 kWOkiQtbJYQCam1KddcSgK7YTRVD81rwiUF3buLSNxK1PxFI6SX7RG9Zq9ipSeS/l200=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfeVp-006C9n-Ds
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 07:05:39 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CB03D20678;
 Mon,  1 Jun 2020 07:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590995128;
 bh=of4R5hmBi9J/EzsQd0OEbsARZdgvjho4xeYJhJNt2Do=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=REe9iTIj0rvPdUZ0fAwCFBL25zQSliEg6NDZXCNWm+GxB7ChH+p6T4g9I3JrG/I29
 qQY6A4W6JGi89GzFHUrmUmzoBUmPFfUmnIC3GxnOv3Bb6SVKaZraCbH6JGOIVGVCQE
 JFlH21cNbzl/CZyF/zoYvoP15LkHIVOpCT2qAfTk=
Date: Mon, 1 Jun 2020 00:05:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200601070526.GD11054@sol.localdomain>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <20200530171814.GD19604@bombadil.infradead.org>
 <20200530173547.GA12299@sol.localdomain>
 <20200530204132.GE19604@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530204132.GE19604@bombadil.infradead.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jfeVp-006C9n-Ds
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

On Sat, May 30, 2020 at 01:41:32PM -0700, Matthew Wilcox wrote:
> On Sat, May 30, 2020 at 10:35:47AM -0700, Eric Biggers wrote:
> > On Sat, May 30, 2020 at 10:18:14AM -0700, Matthew Wilcox wrote:
> > > On Fri, May 29, 2020 at 11:02:16PM -0700, Eric Biggers wrote:
> > > > +	if (len <= DNAME_INLINE_LEN - 1) {
> > > > +		unsigned int i;
> > > > +
> > > > +		for (i = 0; i < len; i++)
> > > > +			strbuf[i] = READ_ONCE(str[i]);
> > > > +		strbuf[len] = 0;
> > > 
> > > This READ_ONCE is going to force the compiler to use byte accesses.
> > > What's wrong with using a plain memcpy()?
> > > 
> > 
> > It's undefined behavior when the source can be concurrently modified.
> > 
> > Compilers can assume that it's not, and remove the memcpy() (instead just using
> > the source data directly) if they can prove that the destination array is never
> > modified again before it goes out of scope.
> > 
> > Do you have any suggestions that don't involve undefined behavior?
> 
> void *memcpy_unsafe(void *dst, volatile void *src, __kernel_size_t);
> 
> It can just call memcpy() of course, but the compiler can't reason about
> this function because it's not a stdlib function.

The compiler can still reason about it if it's in the same file, if it's an
inline function, or if link-time-optimization is enabled.  (LTO isn't yet
supported by the mainline kernel, but people have been working on it.)

Also, as I mentioned to Al, it's necessary to cast away 'volatile' to call
memcpy().  So the 'volatile' serves no purpose.

How about using barrier(), which expands to  asm("" : : : "memory") to tell the
compiler that memory was clobbered?

        if (len <= DNAME_INLINE_LEN - 1) {
                memcpy(strbuf, str, len);
                strbuf[len] = 0;
                /* prevent compiler from optimizing out the temporary buffer */
                barrier();
        }

I think it's still technically undefined to call memcpy() on concurrently
modified memory at all, but I think the above would be okay in practice...

Using 'noinline' could be another option.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
