Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FC9E2868
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2019 04:45:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iNT7f-0003bB-W1; Thu, 24 Oct 2019 02:45:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iNT7e-0003b3-3O
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 02:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UZfqbwJWgOrDyqqbDjenEFgPvn43ry1ACm9OHDegZ0M=; b=WU44JDo7yidZLaJWyMnPYLFzME
 H2nwk9wlqxPNb54MkL/mBVbD5Gzu3vvne3q/LrAvMEozqJx/lyUIofEOi8QbHpsfXYT25QMsa4pZl
 YGZRen5wrqzG/vkz3oTEUDJYdFLtNRB2jBZC5rVpLDrqIzt3EIJvGh4zaJ8zOjWCf2I0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UZfqbwJWgOrDyqqbDjenEFgPvn43ry1ACm9OHDegZ0M=; b=OWvxZJNNCuun5o5Ll0YmBiff+f
 KYuihpMQKZ2Z/fhaOUNmKT75QGCAC8mvs7KDF4lFby2JVqowDFENw4Pny2YRlO7kzES4tYhhNdfPG
 9aO6qwpWxUCytTGNNKM6Yavub77sLWw3bQE+q/GucW1gmzo/3phSVoFgez9uVdIr0gPM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iNT7c-00DwP6-6P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Oct 2019 02:45:10 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 450E0205ED;
 Thu, 24 Oct 2019 02:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571885101;
 bh=a2UR3JAnyAGjBvbCcFgN3hdU19LvuMRY6eXNL0aIMNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zmudk+9tdkF/VJbvVxVh1n6lA0HdvlzM3gBA3QAF1BMscyQJAyMeSZ2oTVsjvvwLT
 7zWvsbjWU2UqzIiP1iVr+lRHIhxOdYWj/Wc+SyebQphK85AotCcV+0CDrhh0+yrGnd
 B9bdgo2eMR7JqYlPmsGNBDIgqcbCsb1s4q8+D25A=
Date: Wed, 23 Oct 2019 19:44:59 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <20191024024459.GA743@sol.localdomain>
Mail-Followup-To: Christoph Hellwig <hch@infradead.org>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-2-ebiggers@kernel.org>
 <20191022052712.GA2083@dread.disaster.area>
 <20191022060004.GA333751@sol.localdomain>
 <20191022133001.GA23268@mit.edu>
 <20191023092718.GA23274@infradead.org>
 <20191023125701.GA2460@mit.edu>
 <20191024012759.GA32358@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191024012759.GA32358@infradead.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNT7c-00DwP6-6P
Subject: Re: [f2fs-dev] [PATCH 1/3] fscrypt: add support for
 inline-encryption-optimized policies
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
Cc: linux-ext4@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 23, 2019 at 06:27:59PM -0700, Christoph Hellwig wrote:
> > If and when the vaporware shows up in real hardware, and assuming that
> > fscrypt is useful for this hardware, we can name it
> > "super_duper_fancy_inline_crypto".  :-)
> 
> I think you are entirely missing the point.  The point is that naming
> the option someting related to inline encryption is fundamentally
> wrong.  It is related to a limitation of existing inline crypto
> engines, not related to the fudamental model.  And all the other
> rambling below don't matter either.
> 

Would you be happy with something that more directly describes the change the
flag makes, like FSCRYPT_POLICY_FLAG_CONTENTS_IV_INO_LBLK_64?  I.e., the IVs for
contents encryption are 64-bit and contain the inode and logical block numbers.

Actually, we could use the same key derivation and IV generation for directories
and symlinks too, which would result in just FSCRYPT_POLICY_FLAG_IV_INO_LBLK_64.
(lblk is 0 when encrypting a filename.)

Although, in general it would be nice to name the settings in ways that are
easier for people not intimately familiar with the crypto to understand...

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
