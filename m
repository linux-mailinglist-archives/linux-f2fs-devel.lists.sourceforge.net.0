Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98463E0929
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2019 18:37:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iMxAO-0008Hh-Pa; Tue, 22 Oct 2019 16:37:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1iMxAN-0008HZ-BG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 16:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l07ydrw0rIWfpTpFNq6xdfjirkVjlmGha45KFj7fuHc=; b=W9JgRNlkYl2UzDqeMSFTsHtnqz
 KCqBy4mOd6Wcs8H7vQrT+ZxCkABVb6DF1QLMiT6/N48rvFWRSLbm8CSGeiP1hxUdNxhYO4NsYmG6H
 roBQjDEhv2d1mWylba1oAiDgKi+K22JxND1AkliZeRbe4Ibt7PeYnU1VVlATK3Fz0AsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l07ydrw0rIWfpTpFNq6xdfjirkVjlmGha45KFj7fuHc=; b=iPVZAydiqa3w11xkUXpWiR5Mo7
 wTMrQ1IXu8XJCj27zGwmcdHdL9C6PxiAxBYsQpMrAq33LC229KyJIewy83a6lk+sZDjPmMA2McHoD
 +9eXMwwQQzBJ52teeVcbu7yZ+CDRDaMtBQ9WdwJiGWkADLnziGu0HNoTqKvPvikIN9YY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iMxAK-00GwQg-TU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 22 Oct 2019 16:37:51 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 014C3205ED;
 Tue, 22 Oct 2019 16:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571762263;
 bh=rRDMmhyKltaJwbJcMHjqQIWtz5N0p4ykMspDlHgBfG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ODNY+wMbg88YmanqkVZLBtuavnkLUkjsmJUtn8FO1Rjf7VFtwmPfwchNEZZKtdgDl
 9oGjh8/B9bitqrWNu0dG8Z9Fk2UXRx0IpTecz6ujj+X7nx/pSMcU5KuqiGWG+WDyro
 GJym/m6ptl9aVfv6fiJ8eucArGyNGtBt9c59ed6U=
Date: Tue, 22 Oct 2019 09:37:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <20191022163740.GB229362@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Paul Lawrence <paullawrence@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20191021230355.23136-1-ebiggers@kernel.org>
 <20191021230355.23136-3-ebiggers@kernel.org>
 <20191022133716.GB23268@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191022133716.GB23268@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.8 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMxAK-00GwQg-TU
Subject: Re: [f2fs-dev] [PATCH 2/3] ext4: add support for
 INLINE_CRYPT_OPTIMIZED encryption policies
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Satya Tangirala <satyat@google.com>,
 Paul Lawrence <paullawrence@google.com>, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 22, 2019 at 09:37:16AM -0400, Theodore Y. Ts'o wrote:
> On Mon, Oct 21, 2019 at 04:03:54PM -0700, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > INLINE_CRYPT_OPTIMIZED encryption policies have special requirements
> > from the filesystem:
> > 
> > - Inode numbers must never change, even if the filesystem is resized
> > - Inode numbers must be <= 32 bits
> > - File logical block numbers must be <= 32 bits
> 
> You need to guarantee more than this; you also need to guarantee that
> the logical block number may not change.  Fortunately, because the
> original per-file key scheme used a logical block tweak, we've
> prohibited this already, and we didn't relax this restriction for
> files encrpyted using DIRECT_KEY.  So it's a requirement which we
> already meet, but we should document this requirement explicitly ---
> both here and also in Documentations/filesystems/fscrypt.rst.
> 
> Otherwise, looks good.  Feel free to add:
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 

This is meant to list the requirements over the current policies.  If we wanted
to list all requirements on filesystems to support any fscrypt policy at all,
we'd also have to list a lot of other things like that the filesystem must
implement all the fscrypt_operations, must call all the needed hooks, must
support encrypted filenames and symlinks, etc...

I'll change the beginning of this commit message to
"INLINE_CRYPT_OPTIMIZED encryption policies have special requirements
from the filesystem, in comparison to the current encryption policies:"

... and in the previous patch I'll add a note in the "Contents encryption"
section of Documentation/filesystems/fscrypt.rst that the use of the file
logical block number means that filesystems must not allow operations that would
change it.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
