Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079B3EF25A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Aug 2021 20:58:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mG4Hj-0001AG-38; Tue, 17 Aug 2021 18:58:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1mG4Hh-0001A0-Si
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 18:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SKXZEtFnmmQKtLbidAJL3GzrUo+mK7sR5VhVr/WptyQ=; b=Hp53KmlA3ZLYubRayEIL2QpkiK
 ocTs4cplr6Tn0LTEc8rwQ7ru4zWdL7pZrSMG22HkA/0cG0GXMh/LgDISFhfXuhXIilR0Vdavu5V+u
 QvhRtsoN46V2AcPHC2yDnw0jGOvCWR9PubYM5Lpl5QxiEbOw/f53aIcPXN60y64aX1Ko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SKXZEtFnmmQKtLbidAJL3GzrUo+mK7sR5VhVr/WptyQ=; b=FB/kM3kGPErUEfFQGJOV80N0Yh
 Qquw/IBAv+okVlFWaxcaZgVagLgXNcwi/pVX9Xk/iGndGqT0YNeKI+duhID8+/ADqlMyBxW1BVVBC
 IfGfjXsrlLqDYbnRL2e4i86gq331SSEi4AN8Bqw+obcPl/yCZp9eT6BDRfBPozctKjxw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mG4Hd-0005Ep-Tl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 Aug 2021 18:57:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D6EE60F58;
 Tue, 17 Aug 2021 18:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629226667;
 bh=2XcXNJckxVKqAUkQr3OnLHOMlEXeXg+rMqgZHIzsIwQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZM19eiaP830Jjnq7WpgBd757cueDeUTKGXydS3fRcMzp35BHWeA1kbaTfHQntpUKg
 aBJBvPvUYSoLD7drxmoiyEqyQAUlakf/ToVSnsJLrO+XBdkzVmBZQdCEZYYZK/2dpl
 ITkP1rQYvN+ddd5YSddzCS4hHinnnovMXQGVQe9/C+VPzsdbYBFfrXixrd+qkGA/wS
 hQ4yxQTfmnpI9MO6e1AmDv7dwk34YBa1uxj3S3I+WmUWHOgWA6sjb1mhPGK4Mgj7or
 Vf6M2m1tkPuW5Jgsy4ClIceTF4N6Xjq+Qvqt1fSUnEWqEM7Kac8PNg3IgLHQvTl/GU
 hOjJWx0rbekdA==
Date: Tue, 17 Aug 2021 11:57:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <YRwGqsLgyKqdbkGX@google.com>
References: <20210728015154.171507-1-ebiggers@kernel.org>
 <YQRQRh1zUHSIzcC/@gmail.com> <YQS5eBljtztWwOFE@mit.edu>
 <YQd3Hbid/mFm0o24@sol.localdomain>
 <a3cdd7cb-50a7-1b37-fe58-dced586712a2@kernel.org>
 <YQg4Lukc2dXX3aJc@google.com>
 <b88328b4-db3e-0097-d8cc-f250ee678e5b@kernel.org>
 <YQidOD/zNB17fd9v@google.com> <YRsY6dyHyaChkQ6n@gmail.com>
 <YRtMOqzZU4c1Vjje@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YRtMOqzZU4c1Vjje@infradead.org>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mG4Hd-0005Ep-Tl
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove broken support for allocating
 DIO writes
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
Cc: Theodore Ts'o <tytso@mit.edu>, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/17, Christoph Hellwig wrote:
> On Mon, Aug 16, 2021 at 07:03:21PM -0700, Eric Biggers wrote:
> > Freeing preallocated blocks on error would be better than nothing, although note
> > that the preallocated blocks may have filled an arbitrary sequence of holes --
> > so simply truncating past EOF would *not* be sufficient.
> > 
> > But really filesystems need to be designed to never expose uninitialized data,
> > even if I/O errors or a sudden power failure occurs.  It is unfortunate that
> > f2fs apparently wasn't designed with that goal in mind.
> > 
> > In any case, I don't think we can proceed with any other f2fs direct I/O
> > improvements until this data leakage bug can be solved one way or another.  If
> > my patch to remove support for allocating writes isn't acceptable and the
> > desired solution is going to require some more invasive f2fs surgery, are you or
> > Chao going to work on it?  I'm not sure there's much I can do here.
> 
> Btw, this is generally a problem for buffered I/O as well, although the
> window for exposing uninitialized blocks on a crash tends to be smaller.

How about adding a warning message when we meet an error with preallocated
unwritten blocks? In the meantime, can we get the Eric's patches for iomap
support? I feel that we only need to modify the preallocation and error
handling parts?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
