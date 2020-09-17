Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDB126DFA5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Sep 2020 17:29:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIvqh-0007ZC-6k; Thu, 17 Sep 2020 15:29:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kIvqf-0007Z3-Ge
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 15:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tzdzRXIY/dTafYizuCbIHiTwajDaC5bWrLPG9z0QhbA=; b=b/DW9Xr63o/WXFi5ack8u97cjX
 c25sDV62MGnGC/3QySVrcmSzzAp8hSTcmHd8MD7kL1xCZJg0C0WTIWAE78R+fKFlZG63mK4z0tDEv
 q/4yhwe3seddNziEZOxnA4S7qtKOX19jAt5dda6mjqf//Ukc9ykfFC/8jSUK0IyEUBUg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tzdzRXIY/dTafYizuCbIHiTwajDaC5bWrLPG9z0QhbA=; b=kerKwPy+LIJFJ3NbRDAZUbhRMC
 d4EtS32uahN9W9C/08PvCbPxbw9kP1hZqqwUow7xjd0yiCTGWAvvOzCKfE5F4j1FD19Cf1yP0OVaW
 lEaPKR7qv2FxNB0SOFtwIuG8iAbh8EhdWAiTjYBtTF7I2vR03G3nPhY7krZI+L4UpBxM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kIvqZ-00D6sh-DR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Sep 2020 15:29:25 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D9F632224A;
 Thu, 17 Sep 2020 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600356549;
 bh=dsrHqCpL2En5vdo8EKO9ihwbSqFxqTvchyF3EQmBx8M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pLRXIPMU+ebvvDik5sg9LeQLxfPqJ2VfS43CgFM7HSeOTANsZGnTFTJTgezDNSjOp
 JQbxMoBBOjqjx84cP7GtBdk6eGD1U5VV+fNacoBl4rBzEKoFw3oeRWyqZ36HmyXEdw
 DLqkCLEPIBXNzP2ARkC0eEXzCYDCBwGOA5LkiyJw=
Date: Thu, 17 Sep 2020 08:29:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20200917152907.GB855@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200917041136.178600-14-ebiggers@kernel.org>
 <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41ad3cd50f4d213455bef4e7c42143c289690222.camel@kernel.org>
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
X-Headers-End: 1kIvqZ-00D6sh-DR
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

On Thu, Sep 17, 2020 at 08:32:39AM -0400, Jeff Layton wrote:
> On Wed, 2020-09-16 at 21:11 -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > fscrypt_set_test_dummy_encryption() requires that the optional argument
> > to the test_dummy_encryption mount option be specified as a substring_t.
> > That doesn't work well with filesystems that use the new mount API,
> > since the new way of parsing mount options doesn't use substring_t.
> > 
> > Make it take the argument as a 'const char *' instead.
> > 
> > Instead of moving the match_strdup() into the callers in ext4 and f2fs,
> > make them just use arg->from directly.  Since the pattern is
> > "test_dummy_encryption=%s", the argument will be null-terminated.
> > 
> 
> Are you sure about that? I thought the point of substring_t was to give
> you a token from the string without null terminating it.
> 
> ISTM that when you just pass in ->from, you might end up with trailing
> arguments in your string like this. e.g.:
> 
>     "v2,foo,bar,baz"
> 
> ...and then that might fail to match properly
> in fscrypt_set_test_dummy_encryption.
> 

Yes I'm sure, and I had also tested it.  The use of match_token() here is to
parse one null-terminated mount option at a time.

The reason that match_token() can return multiple substrings is that the pattern
might be something like "foo=%d:%d".

But here it's just "test_dummy_encryption=%s". "%s" matches until end-of-string.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
