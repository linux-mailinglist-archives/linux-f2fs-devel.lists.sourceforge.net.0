Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F22874CD32D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 12:14:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nQ5tA-0002sI-Ul; Fri, 04 Mar 2022 11:14:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jlayton@kernel.org>) id 1nQ5t9-0002sC-AL
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 11:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zPWuwqMlsCBZUN3x8Z4zIZnN2A6JKPstZM0krEMHVyE=; b=PRcQ7a6cHkz0C3OB9iOlmK6yuf
 l0FjNOmU5Huyo5cW6JH+uwlNZl0RtzOuA9kgFj/7oup1buuBaUzQjpugHvgV2E9x01F/MWQlXt8xN
 RW2UFUkjHZ6D+vYphA9uINAvE/EJbfHTfDu+D8rnZa1+RjnXBr7/3JfCqj/NAwVyH6uQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zPWuwqMlsCBZUN3x8Z4zIZnN2A6JKPstZM0krEMHVyE=; b=SuhbTVSCWd/NLevyn0XED7kWqJ
 Uo+w1nvvTVr1WI/C1WlJ6ImH8GnwYHYELfDdVGbXSSLiIDhpjtuZYDPDhRs5/tyt8Wssawqonap88
 Al6m4tl1iCECWsM79zyTc+hihRsVO51o4M5HDCreb7KbXKBSjyp5DuExSyAa/jCn31Z0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nQ5t3-004fy3-Lr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 11:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6495561CAB;
 Fri,  4 Mar 2022 11:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7958DC340E9;
 Fri,  4 Mar 2022 11:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646392446;
 bh=oMRkrgkieQqbJLozH2f1WWABMteAvIgUeoZgr4XZLG4=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=ik9/iqlkSYV+ppGVcBuwu2APgDACKwcHntHw+Hu2Xr2jfUIu91CbsiGhv5jpiECni
 a9ovy2jThDcrU31vb3KB6PNgCDbjxn7wJSUL91b4PsewrN4+rSSjwpeYjmoA689kh4
 iDM6CtEhfpShSDPSpPc8OIhQniSoJ0vCl0gEMEfWWqbowcPyp/OV9D5KAOaqrN4GF7
 NkaSTJNMWNW1q7JiBxw6Y8agL6pJATIClarAY+MMxefSgKrrjMeZe0bTtYVrgIPW8i
 BgnfCclXxDPDHqmIImbnZl+viTCZzSUfh9tCE21gQuO0asP18iC8AbQv7azba/hjRh
 5NjtEiNztu8Xw==
Message-ID: <1c5aa5552850dc90bdeb5f8bc0e4f5dd3270a382.camel@kernel.org>
From: Jeff Layton <jlayton@kernel.org>
To: NeilBrown <neilb@suse.de>
Date: Fri, 04 Mar 2022 06:14:03 -0500
In-Reply-To: <164636204663.29369.1845040729675190216@noble.neil.brown.name>
References: <164549971112.9187.16871723439770288255.stgit@noble.brown>
 , <164549983739.9187.14895675781408171186.stgit@noble.brown>
 , <ccc81eb5c23f933137c5da8d5050540cc54e58f0.camel@kernel.org>
 , <164568131640.25116.884631856219777713@noble.neil.brown.name>
 , <e8ec98a9c4fab9b7aa099001f09ff9b11f0c3f96.camel@kernel.org>
 <164636204663.29369.1845040729675190216@noble.neil.brown.name>
User-Agent: Evolution 3.42.4 (3.42.4-1.fc35) 
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 2022-03-04 at 13:47 +1100, NeilBrown wrote: > On Thu,
 24 Feb 2022, Jeff Layton wrote: > > On Thu, 2022-02-24 at 16:41 +1100,
 NeilBrown
 wrote: > > > On Thu, 24 Feb 2022, Jeff Layton wrote: > > [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nQ5t3-004fy3-Lr
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

On Fri, 2022-03-04 at 13:47 +1100, NeilBrown wrote:
> On Thu, 24 Feb 2022, Jeff Layton wrote:
> > On Thu, 2022-02-24 at 16:41 +1100, NeilBrown wrote:
> > > On Thu, 24 Feb 2022, Jeff Layton wrote:
> > > > On Tue, 2022-02-22 at 14:17 +1100, NeilBrown wrote:
> > > > > The bdi congestion tracking in not widely used and will be removed.
> > > > > 
> > > > > CEPHfs is one of a small number of filesystems that uses it, setting
> > > > > just the async (write) congestion flags at what it determines are
> > > > > appropriate times.
> > > > > 
> > > > > The only remaining effect of the async flag is to cause (some)
> > > > > WB_SYNC_NONE writes to be skipped.
> > > > > 
> > > > > So instead of setting the flag, set an internal flag and change:
> > > > >  - .writepages to do nothing if WB_SYNC_NONE and the flag is set
> > > > >  - .writepage to return AOP_WRITEPAGE_ACTIVATE if WB_SYNC_NONE
> > > > >     and the flag is set.
> > > > > 
> > > > > The writepages change causes a behavioural change in that pageout() can
> > > > > now return PAGE_ACTIVATE instead of PAGE_KEEP, so SetPageActive() will
> > > > > be called on the page which (I think) wil further delay the next attempt
> > > > > at writeout.  This might be a good thing.
> > > > > 
> > > > > Signed-off-by: NeilBrown <neilb@suse.de>
> > > > 
> > > > Maybe. I have to wonder whether all of this is really useful.
> > > > 
> > > > When things are congested we'll avoid trying to issue new writeback
> > > > requests. Note that we don't prevent new pages from being dirtied here -
> > > > - only their being written back.
> > > > 
> > > > This also doesn't do anything in the DIO or sync_write cases, so if we
> > > > lose caps or are doing DIO, we'll just keep churning out "unlimited"
> > > > writes in those cases anyway.
> > > 
> > > I think the point of congestion tracking is to differentiate between
> > > sync and async IO.  Or maybe "required" and "optional".
> > > Eventually the "optional" IO will become required, but if we can delay
> > > it until a time when there is less "required" io, then maybe we can
> > > improve perceived latency.
> > > 
> > > "optional" IO here is write-back and read-ahead.  If the load of
> > > "required" IO is bursty, and if we can shuffle that optional stuff into
> > > the quiet periods, we might win.
> > > 
> > 
> > In that case, maybe we should be counting in-flight reads too and deny
> > readahead when the count crosses some threshold? It seems a bit silly to
> > only look at writes when it comes to "congestion".
> 
> I agree that seems a bit silly.
> 
> > 
> > > Whether this is a real need is an important question that I don't have an
> > > answer for.  And whether it is better to leave delayed requests in the
> > > page cache, or in the low-level queue with sync requests able to
> > > over-take them - I don't know.  If you have multiple low-level queue as
> > > you say you can with ceph, then lower might be better.
> > > 
> > > The block layer has REQ_RAHEAD ..  maybe those request get should get a
> > > lower priority ... though I don't think they do.
> > > NFS has a 3 level priority queue, with write-back going at a lower
> > > priority ... I think... for NFSv3 at least.
> > > 
> > > Sometimes I suspect that as all our transports have become faster, we
> > > have been able to ignore the extra latency caused by poor scheduling of
> > > optional requests.  But at other times when my recently upgraded desktop
> > > is struggling to view a web page while compiling a kernel ...  I wonder
> > > if maybe we don't have the balance right any more.
> > > 
> > > So maybe you are right - maybe we can rip all this stuff out.
> > > 
> > 
> > I lean more toward just removing it. The existing implementation seems a
> > bit half-baked with the gaps in what's being counted. Granted, the
> > default congestion threshold is pretty high with modern memory sizes, so
> > it probably doesn't come into play much in practice, but removing it
> > would reduce some complexity in the client.
> 
> I'd love to have some test that could reliably generate congestion and
> measure latencies for other IO.  Without that, it is mostly guess work.
> So I cannot argue against your proposal, and do agree that removing the
> code would reduce complexity.  I have no idea what the costs might be -
> if any.  Hence my focus was on not changing behaviour.
> 

Fair enough -- caution is warranted.

I think the thing to do here is to take your patch for now, and then we
can look at just removing all of this stuff at some point in the future.
That would also give us a fallback that doesn't require the old
congestion infrastructure if it turns out that it is needed.

I'm assuming this is going in via Andrew's tree, but let us know if
you'd like us to take any of these in via the ceph tree.

Thanks,
-- 
Jeff Layton <jlayton@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
