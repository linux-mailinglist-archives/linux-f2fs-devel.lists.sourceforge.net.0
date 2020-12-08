Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C51102D3733
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Dec 2020 00:55:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmmpW-0008QW-Ck; Tue, 08 Dec 2020 23:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmmpV-0008QP-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 23:55:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HjuLsRWiAcdECFRpMhcQgdKb8zX0P1YPLgXhIIIEsDA=; b=Qv0lMod98oPLtZKWycj1dzcDbK
 eP8PccBrYKGLPGvW+MK29clNx88XHzZiEKxftOt6BE7hFXNc242s/u+PfQAgJnc7gZOd08yLMIaMm
 J+W0nBUkbcUs+1lmyREV25PDbR5dlRNvTwlmk96u87vGVjP+YWaB0VX4RhrKDqn04hRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HjuLsRWiAcdECFRpMhcQgdKb8zX0P1YPLgXhIIIEsDA=; b=FW05gH8KWwjbItDcSUxKUTfHQF
 hzRmBvErUFaxk4jprtPmNREKZpVlsqb5sRsf+UHDy9GLzoKXLEkZ+Ni6RkBDYmCTb7z5oqxC9uP1Y
 A4Wm6mpxTokMm0oJqruAG62mKsEssJFkT5XsIzL47pyHRC39R/nlTM84HpqcwU7PInPQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmmpI-004DM0-Rc
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 23:55:37 +0000
Date: Tue, 8 Dec 2020 15:55:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607471719;
 bh=XYsYf5906N+mg1XwuCiho6GHsJNm2dGoMhfW56SAY8I=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=mqapjCiUDt5ExNEpAupAg/ZpeOom3Aiu7KhulRwdafuvSQLKj7jGFe021y5kDSJbE
 eD56i7mcQqPLrFOOogLc85rv0+qh/tK3UIFH7S5CpShj6662STqFqVaiJBZy3ZgsQs
 c4npFfZMdBuvUDyDvGVUCHPl09N8HKv0nZFC+tvAckYBGUPXR+7MrE7dc//B+f11hh
 Jskw6sHp2Wr8QVY9IkC8I/kHs+mTWB8yf1rjYPBqQJKGqYN5bxkeR3kTA1AWs7z1wl
 /U3oklwBMSR6/x2H9f8vheTeBvL9kQ1UHWIx0y1r6Znmlx9zs7n1UAnCKs80zD570U
 Ns9oNGcDgMIwA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <X9ASZV4ZBBPxCpU/@google.com>
References: <20201205042626.1113600-1-daeho43@gmail.com>
 <X86RJdLhOVRm28Eu@gmail.com>
 <CACOAw_yp0LU-vcT2+NTF3ipibF6GvqfaQ4V=957CDPQLbes92Q@mail.gmail.com>
 <X88ZC4f2hZxAU3C0@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X88ZC4f2hZxAU3C0@gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmmpI-004DM0-Rc
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/07, Eric Biggers wrote:
> On Tue, Dec 08, 2020 at 08:51:45AM +0900, Daeho Jeong wrote:
> > > I am trying to review this but it is very hard, as the f2fs compression code is
> > > very hard to understand.
> > >
> > > It looks like a 'struct decompress_io_ctx' represents the work to decompress a
> > > particular cluster.  Since the compressed data of the cluster can be read using
> > > multiple bios, there is a reference count of how many pages are remaining to be
> > > read before all the cluster's pages have been read and decompression can start.
> > >
> > > What I don't understand is why that reference counting needs to work differently
> > > depending on whether verity is enabled or not.  Shouldn't it be exactly the
> > > same?
> > >
> > > There also seems to be some confusion about the scope of STEP_VERITY.  Before
> > > f2fs compression was added, it was a per-bio thing.  But now in a compressed
> > > file, it's really a per-cluster thing, since all decompressed pages in a
> > > compressed cluster are verified (or not verified) at once.
> > >
> > > Wouldn't it make a lot more sense to, when a cluster needs both compression and
> > > verity, *not* set STEP_VERITY on the bios, but rather set a similar flag in the
> > > decompress_io_ctx?
> > >
> > 
> > Eric,
> > 
> > Decompression and verity can be executed in different thread contexts
> > in different timing, so we need separate counts for each.
> > 
> > We already use STEP_VERITY for non-compression case, so I think using
> > this flag in here looks more making sense.
> > 
> > Thanks,
> 
> That didn't really answer my questions.
> 
> I gave up trying to review this patch as the compression post-read handling is
> just way too weird and hard to understand.  I wrote a patch to clean it all up
> instead, please take a look:
> https://lkml.kernel.org/r/20201208060328.2237091-1-ebiggers@kernel.org

Eric,
I also tried to review your patch, but it's quite hard to follow quickly and
requires stress tests for a while. Given upcoming merge window and urgency of
the bug, let me apply Daeho's fix first. By any chance, may I ask revisiting
your clean-up on top of the fix in the next cycle?

Thanks,

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
