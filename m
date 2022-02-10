Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 968974B1994
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Feb 2022 00:35:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nIIyY-0001F5-As; Thu, 10 Feb 2022 23:35:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nIIyV-0001Ez-R6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 23:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2Yicem2YyHeYev4jh35sFR/3S6yxP16YJIZJw/2u2E=; b=ZeIJe0Q8Mc6t6zEViCKln8zwgL
 xr2Id9Tk+srCBBT7ZTw/i2BenMZMwXPmhCjyPCxnxzy31T3dmQoL+Y8c4AOLO1KA65rx3+5GYFo1I
 jPTisOLX8XopAIkqbg2wM5XigJVSC5WB3yGH2iGwsg1HoGv4H7Q9ikuIeexoVk9Of4wg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o2Yicem2YyHeYev4jh35sFR/3S6yxP16YJIZJw/2u2E=; b=W7d0tfevM8I0htasMvzBeHs7W8
 9yikPsMrCD/jZX1eq51aWYNM2kGwJJREENVrUL3PxuuO40YcDCyi14kJgL8MiAw+qCLRplZSdy5dZ
 q1yXyCmbldpistpzkaJaq3V6jpsSdOFM1hHDd336hPGbnCIF7XqyE16pUmNuBThj2CNY=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nIIyR-0000wm-CU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Feb 2022 23:35:41 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEFCF21126;
 Thu, 10 Feb 2022 23:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644536128; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2Yicem2YyHeYev4jh35sFR/3S6yxP16YJIZJw/2u2E=;
 b=IRejTp/lbCDisc33iEc4E7PVz/okwunBODuHyI/b85cHeu50KxfVz4Lm1ulBn16HHIvtlA
 ybEwfsOogFOgpBDauYwGb+Akw4qrm8puoflgsBEzORq8jfHdN6f4ykyJ3bj8AO7gbIdRoY
 JxHa2lsbMPUq7RCvp7L2aTnG70bRko0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644536128;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2Yicem2YyHeYev4jh35sFR/3S6yxP16YJIZJw/2u2E=;
 b=akwWvp114tx/QzY8BBRxePKACalrKHFoVw/bZPcO2rBeEBJtdQRh+pMHD3FVXfuxr+1IuH
 CB/Fb6z1JJ/iymCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AE5C13C55;
 Thu, 10 Feb 2022 23:35:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eHQaAjihBWKSUAAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 10 Feb 2022 23:35:20 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Jan Kara" <jack@suse.cz>
In-reply-to: <20220210122440.vqth5mwsqtv6vjpq@quack3.lan>
References: <164447124918.23354.17858831070003318849.stgit@noble.brown>,
 <164447147257.23354.2801426518649016278.stgit@noble.brown>,
 <20220210122440.vqth5mwsqtv6vjpq@quack3.lan>
Date: Fri, 11 Feb 2022 10:35:17 +1100
Message-id: <164453611721.27779.1299851963795418722@noble.neil.brown.name>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 10 Feb 2022, Jan Kara wrote: > Hi Neil! > > On Thu
 10-02-22 16:37:52, NeilBrown wrote: > > Add some "big-picture" documentation
 for read-ahead and polish the code > > to make it fit this docum [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
 low trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nIIyR-0000wm-CU
Subject: Re: [f2fs-dev] [PATCH 02/11] MM: document and polish read-ahead
 code.
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
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-nfs@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 10 Feb 2022, Jan Kara wrote:
> Hi Neil!
> 
> On Thu 10-02-22 16:37:52, NeilBrown wrote:
> > Add some "big-picture" documentation for read-ahead and polish the code
> > to make it fit this documentation.
> > 
> > The meaning of ->async_size is clarified to match its name.
> > i.e. Any request to ->readahead() has a sync part and an async part.
> > The caller will wait for the sync pages to complete, but will not wait
> > for the async pages.  The first async page is still marked PG_readahead

Thanks for the review!

> 
> So I don't think this is how the code was meant. My understanding of
> readahead comes from a comment:

I can't be sure what was "meant" but what I described is very close to
what the code actually does.

> 
> /*
>  * On-demand readahead design.
>  *
> ....
> 
> in mm/readahead.c. The ra->size is how many pages should be read.
> ra->async_size is the "lookahead size" meaning that we should place a
> marker (PageReadahead) at "ra->size - ra->async_size" to trigger next
> readahead.

This description of PageReadahead and ->async_size focuses on *what*
happens, not *why*.  Importantly it doesn't help answer the question "What
should I set ->async_size to?"

The implication in the code is that when we sequentially access a page
that was read-ahead (read before it was explicitly requested), we trigger
more read ahead.  So ->async_size should refer to that part of the
readahead request which was not explicitly requested.  With that
understanding, it becomes possible to audit all the places that
->async_size are set and to see if they make sense.

> 
> > 
> > - in try_context_readahead(), the async_sync is set correctly rather
> >   than being set to 1.  Prior to Commit 2cad40180197 ("readahead: make
> >   context readahead more conservative") it was set to ra->size which
> >   is not correct (that implies no sync component).  As this was too
> >   high and caused problems it was reduced to 1, again incorrect but less
> >   problematic.  The setting provided with this patch does not restore
> >   those problems, and is now not arbitrary.
> 
> I agree the 1 there looks strange as it effectively discards all the logic
> handling the lookahead size. I agree with the tweak there but I would do
> this behavioral change as a separate commit since it can have performance
> implications.
> 
> > - The calculation of ->async_size in the initial_readahead section of
> >   ondemand_readahead() now makes sense - it is zero if the chosen
> >   size does not exceed the requested size.  This means that we will not
> >   set the PG_readahead flag in this case, but as the requested size
> >   has not been satisfied we can expect a subsequent read ahead request
> >   any way.
> 
> So I agree that setting of ->async_size to ->size in initial_readahead
> section does not make great sence but if you look a bit below into readit
> section, you will notice the ->async_size is overwritten there to something
> meaninful. So I think the code actually does something sensible, maybe it
> could be written in a more readable way.

I'm certainly focusing on making the code look sensible and be
consistent with the documentation, rather than fixing actual faults in
behaviour.  Code that makes sense is easier to maintain.

I came very close to removing that code after readit: but I agree it
needs a separate patch and needs more thought.  It looks like a bandaid
that addressed some specific problem which was probably caused by one of
the size fields being set "wrongly" earlier.

>  
> > Note that the current function names page_cache_sync_ra() and
> > page_cache_async_ra() are misleading.  All ra request are partly sync
> > and partly async, so either part can be empty.
> 
> The meaning of these names IMO is:
> page_cache_sync_ra() - tell readahead that we currently need a page
> ractl->_index and would prefer req_count pages fetched ahead.

I don't think that is what req_count means.  req_count is the number of
pages that are needed *now* to satisfy the current read request.
page_cache_sync_ra() has the job of determining how many more pages (if
any) to read-ahead to satisfy future requests.  Sometimes it reads
another req_count - sometimes not.

> 
> page_cache_async_ra() - called when we hit the lookahead marker to give
> opportunity to readahead code to prefetch more pages.

Yes, but page_cache_async_ra() is given a req_count which, as above, is
the number of pages needed to satisfy *this* request.  That wouldn't
make sense if it was a pure future-readahead request.

In practice, the word "sync" is used to mean "page was missing" and
"async" here means "PG_readahead was found".  But that isn't what those
words usually mean.

They both call ondemand_readahead() passing False or True respectively
to hit_readahead_marker - which makes that meaning clear in the code...
but it still isn't clear in the name.

> 
> > A page_cache_sync_ra() request will usually set ->async_size non-zero,
> > implying it is not all synchronous.
> > When a non-zero req_count is passed to page_cache_async_ra(), the
> > implication is that some prefix of the request is synchronous, though
> > the calculation made there is incorrect - I haven't tried to fix it.
> > 
> > Signed-off-by: NeilBrown <neilb@suse.de>
> 
> 								Honza


Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
