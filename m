Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD53B4C23B0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Feb 2022 06:42:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nN6ta-00005z-L8; Thu, 24 Feb 2022 05:42:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nN6tY-00005s-JG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Feb 2022 05:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=; b=JV0Y/mWQiFsexprdPWxuWgh1pp
 Vb+a67uOYsTfPjyRlny/xca/pj9Fv5nIKr3aMhAb776Dlpmbk65uNPY+UGtTzC1XuSaOh7UJFtZTk
 LSPxm4MxeGod1MYxknsqm6148/NS/DR/zp0QTpJqmCTCV3YB93FW7yhKVztrmSvRKULw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=; b=K7MoQ0sHsZyH2uke5jQ+jsb63D
 xF6AWEUQ1H12Kfv59kzRdoVUvoeGa/P/fuSmBorrTVntOzzxIjNuNeHsrXxT7FQMF9wjl35tF/q6Z
 NWu2DY+uvyNwpUoC4QbMaBZLq+Q9/KW8LO1AhKm3JTMXKV8djLUNJovSnq9TRdAd98Pc=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nN6tS-0005kL-Cy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 24 Feb 2022 05:42:27 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EBB951F3A1;
 Thu, 24 Feb 2022 05:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645681327; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=;
 b=oacCq8DpEx+HDVYUG2DsF2wuspiuS5qhOaHg1qyYd+T9C2DteAD78mmee61D0FUkZI1YLt
 89gaqCC57biyg1VI4eWpjZIyZz5bUCc+qIzPagHkvNRbHUbMXkbpK1X9DZdFRD07Aas5HD
 lAXZBPvJQXlq+oS7kaTZ3tDK1PH657o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645681327;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LKmtUS8Iww56ZG9AedqwAoOu6e9VunJUN5pEfmlFqFg=;
 b=MEMewd7NbYPArVPBoXiNu4N+Gd4+gUbLnYQ+eJp9sW2uduqkIYyCem3t9SIAJPZbOtxf7E
 cjDOc2g76XCgQcAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFB7B13322;
 Thu, 24 Feb 2022 05:42:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id spy1IqgaF2JJDwAAMHmgww
 (envelope-from <neilb@suse.de>); Thu, 24 Feb 2022 05:42:00 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Jeff Layton" <jlayton@kernel.org>
In-reply-to: <ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>,
 <164549983739.9187.14895675781408171186.stgit@noble.brown>,
 <ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
Date: Thu, 24 Feb 2022 16:41:56 +1100
Message-id: <164568131640.25116.884631856219777713@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, 24 Feb 2022, Jeff Layton wrote: > On Tue, 2022-02-22
 at 14:17 +1100, NeilBrown wrote: > > The bdi congestion tracking in not widely
 used and will be removed. > > > > CEPHfs is one of a small n [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nN6tS-0005kL-Cy
Subject: Re: [f2fs-dev] [PATCH 06/11] ceph: remove reliance on bdi congestion
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
 linux-nilfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Wu Fengguang <fengguang.wu@intel.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, 24 Feb 2022, Jeff Layton wrote:
> On Tue, 2022-02-22 at 14:17 +1100, NeilBrown wrote:
> > The bdi congestion tracking in not widely used and will be removed.
> > 
> > CEPHfs is one of a small number of filesystems that uses it, setting
> > just the async (write) congestion flags at what it determines are
> > appropriate times.
> > 
> > The only remaining effect of the async flag is to cause (some)
> > WB_SYNC_NONE writes to be skipped.
> > 
> > So instead of setting the flag, set an internal flag and change:
> >  - .writepages to do nothing if WB_SYNC_NONE and the flag is set
> >  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
> >     and the flag is set.
> > 
> > The writepages change causes a behavioural change in that pageout() can
> > now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> > be called on the page which (I think) wil further delay the next attempt
> > at writeout.  This might be a good thing.
> > 
> > Signed-off-by: NeilBrown <neilb@suse.de>
> 
> Maybe. I have to wonder whether all of this is really useful.
> 
> When things are congested we'll avoid trying to issue new writeback
> requests. Note that we don't prevent new pages from being dirtied here -
> - only their being written back.
> 
> This also doesn't do anything in the DIO or sync_write cases, so if we
> lose caps or are doing DIO, we'll just keep churning out "unlimited"
> writes in those cases anyway.

I think the point of congestion tracking is to differentiate between
sync and async IO.  Or maybe "required" and "optional".
Eventually the "optional" IO will become required, but if we can delay
it until a time when there is less "required" io, then maybe we can
improve perceived latency.

"optional" IO here is write-back and read-ahead.  If the load of
"required" IO is bursty, and if we can shuffle that optional stuff into
the quiet periods, we might win.

Whether this is a real need is an important question that I don't have an
answer for.  And whether it is better to leave delayed requests in the
page cache, or in the low-level queue with sync requests able to
over-take them - I don't know.  If you have multiple low-level queue as
you say you can with ceph, then lower might be better.

The block layer has REQ_RAHEAD ..  maybe those request get should get a
lower priority ... though I don't think they do.
NFS has a 3 level priority queue, with write-back going at a lower
priority ... I think... for NFSv3 at least.

Sometimes I suspect that as all our transports have become faster, we
have been able to ignore the extra latency caused by poor scheduling of
optional requests.  But at other times when my recently upgraded desktop
is struggling to view a web page while compiling a kernel ...  I wonder
if maybe we don't have the balance right any more.

So maybe you are right - maybe we can rip all this stuff out.

Or maybe not.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
