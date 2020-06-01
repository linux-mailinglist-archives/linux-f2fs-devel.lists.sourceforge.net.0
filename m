Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA981E9E6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jun 2020 08:45:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jfeCK-000144-0m; Mon, 01 Jun 2020 06:45:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jfeCI-00013x-CY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 06:45:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V3Muhqi4RgIADnlgY17wOFAb5vUds6UnImNsEuAM8kM=; b=d0n3keIdWMkMFbew3530DoBLZc
 6X/48MrP94VcsM95GuHEBPq8Txmxmya9b3w6jorIKmNoa2Wfd0YVeX/Ve81qo83ywuHXojkT5vjww
 vwl9+ovby5099I2B1eQECvhp3SbbT3yzkeAvaJLfn71BbmaslRvYclXYkhXAEIHC2Vu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V3Muhqi4RgIADnlgY17wOFAb5vUds6UnImNsEuAM8kM=; b=HJ6XmzbSR9A/3G/YCWqrriRr+P
 ama6h4jgOFaEJSE2aYrz5g7rrXqoIa0EeLP/Jopy/auxy7CcHCnR9JNoHTJLEMY3EBbAjWxL0Iqfn
 K/cj0KyTPUdX6iDPpan2EkCbvOcNy98gm8az8qWKL97lepPZcIXYYz0Aq9M+DNi8sQSU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jfeCH-0038ks-96
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jun 2020 06:45:22 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 72D46206C3;
 Mon,  1 Jun 2020 06:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590993915;
 bh=zfYAnnOMkuQXZpA+G/MMKrf7YexWrDaV0EqmTcf7Kaw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FFKfplnDcJ3+nxndceXPwzR2M/jR5K/qxfXBsvkZAJzdDCb74SueskNAYqAs33Vk3
 aepTFVKI0QPR+J5wWfSJQF5/tsz99wlBYoa9QC69vAvtmGepUojbFvMA5EA8HXV/l+
 7Z1fKoGzdAEknCR10jfE8XtiTzQs3f6/WMt4QQEE=
Date: Sun, 31 May 2020 23:45:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <20200601064514.GC11054@sol.localdomain>
References: <20200530060216.221456-1-ebiggers@kernel.org>
 <20200530171814.GD19604@bombadil.infradead.org>
 <20200530173547.GA12299@sol.localdomain>
 <20200530175907.GP23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200530175907.GP23230@ZenIV.linux.org.uk>
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
X-Headers-End: 1jfeCH-0038ks-96
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
 linux-f2fs-devel@lists.sourceforge.net, Matthew Wilcox <willy@infradead.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Gabriel Krisman Bertazi <krisman@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, May 30, 2020 at 06:59:07PM +0100, Al Viro wrote:
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
> Even memcpy(strbuf, (volatile void *)str, len)?  It's been a while since I've
> looked at these parts of C99...

That doesn't make sense.  memcpy() takes a non-volatile pointer, so the pointer
just gets implicitly cast back to (void *), and you get a compiler warning.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
