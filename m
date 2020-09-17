Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 258AF26E0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 18:33:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIwqp-0005wp-3E; Thu, 17 Sep 2020 16:33:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jlayton@kernel.org>) id 1kIwqn-0005wi-FS
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 16:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IFrvdTENn5FArdLL4iokB76gMFl78VHV27PjjKfcEZo=; b=nS/AX2dlKEqlJMDQ4Yk9KexS8H
 xcnl7gTCEhxDUy44Z1I+Z2NdUMlsjIAtherATpoEdNkNReVGMlgKPOqRJdJW3JVnqlqBRJucOT2di
 6kybtykJ25ZJgo4c9+hlKZaT+XN16u5tcwcXdSgpGByQYLl2g6ejNhVOfwlSzFEEr2dI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IFrvdTENn5FArdLL4iokB76gMFl78VHV27PjjKfcEZo=; b=gliBZSa4yzueDiDR5TOsLDZall
 Gk1M9HkQD0AHnjGQMSF4htzZuwdWxepZAPlHWHXwY8pEiPIB6Yn87eMnMBu7+a275kjIj0p9l19bR
 zVEGf+RocABMf+aZcHi9WgEdzudvdr+mLG8FtLRwFk9VjBWxoWCcLNT4VYbavyjD7lpI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIwqk-00EN8h-4C
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 16:33:37 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C27D2214D8;
 Thu, 17 Sep 2020 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600360408;
 bh=64guTUZ7EKPT2qpTc7D0yaFTflRcH4pcyFWo+xuAOGU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=eU1pP6hgmXz25xyBg9bazb9fKAso0aXmNP2dVveMx2ztmBwOjVdBVik39B9/dsfyi
 l7B1BELQj4b0ud+U4UFntHF3lCMR/Rq5xrFwpLL3OBQuZckdLAshp7dwLe0wC59tkq
 GBid0tzn4y03cySN4r38Z/i9cVEe43zaJsX5UFUA=
Message-ID: <197468586b4a9b933755d2f9a462a234d654e280.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 17 Sep 2020 12:33:26 -0400
In-Reply-To: <20200917152907.GB855@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200917041136.178600-14-ebiggers@kernel.org>
 <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
 <20200917152907.GB855@sol.localdomain>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-Spam-Score: -3.1 (---)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kIwqk-00EN8h-4C
Subject: Re: [f2fs-dev] [PATCH v3 13/13] fscrypt: make
 fscrypt_set_test_dummy_encryption() take a 'const char *'
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
Cc: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 2020-09-17 at 08:29 -0700, Eric Biggers wrote:
> On Thu, Sep 17, 2020 at 08:32:39AM -0400, Jeff Layton wrote:
> > On Wed, 2020-09-16 at 21:11 -0700, Eric Biggers wrote:
> > > From: Eric Biggers <ebiggers@google.com>
> > > 
> > > fscrypt_set_test_dummy_encryption() requires that the optional argument
> > > to the test_dummy_encryption mount option be specified as a substring_t.
> > > That doesn't work well with filesystems that use the new mount API,
> > > since the new way of parsing mount options doesn't use substring_t.
> > > 
> > > Make it take the argument as a 'const char *' instead.
> > > 
> > > Instead of moving the match_strdup() into the callers in ext4 and f2fs,
> > > make them just use arg->from directly.  Since the pattern is
> > > "test_dummy_encryption=%s", the argument will be null-terminated.
> > > 
> > 
> > Are you sure about that? I thought the point of substring_t was to give
> > you a token from the string without null terminating it.
> > 
> > ISTM that when you just pass in ->from, you might end up with trailing
> > arguments in your string like this. e.g.:
> > 
> >     "v2,foo,bar,baz"
> > 
> > ...and then that might fail to match properly
> > in fscrypt_set_test_dummy_encryption.
> > 
> 
> Yes I'm sure, and I had also tested it.  The use of match_token() here is to
> parse one null-terminated mount option at a time.
> 
> The reason that match_token() can return multiple substrings is that the pattern
> might be something like "foo=%d:%d".
> 
> But here it's just "test_dummy_encryption=%s". "%s" matches until end-of-string.

Got it. Thanks for explaining!
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
