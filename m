Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6D84A02F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 22:36:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDYv2-0007VX-1j; Fri, 28 Jan 2022 21:36:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1nDYv1-0007VR-8Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 21:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=; b=RT2xi7108N1A0pOdJNXLLvQhNJ
 JdGI4C8lxMItG705ieJ8daleQWtILBMKVh2R6ftVUx8wcBWFws8nfiCcq1zAG9F8wsgx399B+SQcu
 EXme3i8o8yBCd4NzEHfgENzP7A73839e7vRnhLVDKfO8eVKCR9363RMeJw8Lo1B43lQo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=; b=f8xs/sI3Amr/7661rCY1t4aLl9
 RzNZFWGm5KoSP3FDB99Q8u1NxdGu0vu3HbsA4zJWYZEp9clJSlMmy+qkYIVQNyEX9/KmUER9oMzt5
 4lkRKEZzxcd7t9EkNo+o6Oz3zDXJmnD2BUBmBBrPIEcd1fhn3ktIDZpenJLalqluUge0=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nDYuv-001P0G-J3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 21:36:29 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E19E31F385;
 Fri, 28 Jan 2022 21:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643405774; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=;
 b=taayjmIQ/dw3pRt7LXMXgV+h3N2iGR9k6iWV1POVgUTfQy7v0b53WKl6W7epBEuQeWPNId
 2nS5W8Zz+JDvOI2H2O325FIcHt7vLtCdfAuhacvrf751M2nGilH84Y1DtEW6P5pWfmkFXk
 3R+tAum3D39BD7myqsYNPl0uf7Iudaw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643405774;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NLILDfYIewMcTAbJZc9mPjKMlBqDlqhTsKM2N1uM+Vw=;
 b=24PK3VAQmVA51Rx99IGbDGj51tJod8UX27xeq8Emd3IiwsHonr+XB9p01yVh4lqGGFRKKK
 qudbZz9CfGjnNuAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BAB613AA1;
 Fri, 28 Jan 2022 21:36:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fu7bMcdh9GHRawAAMHmgww
 (envelope-from <neilb@suse.de>); Fri, 28 Jan 2022 21:36:07 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Miklos Szeredi" <miklos@szeredi.hu>
In-reply-to: <CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
References: <164325106958.29787.4865219843242892726.stgit@noble.brown>,
 <164325158954.29787.7856652136298668100.stgit@noble.brown>,
 <CAJfpegt-igF8HqsDUcMzfU0jYv8WpofLy0Uv0YnXLzsfx=tkGg@mail.gmail.com>
Date: Sat, 29 Jan 2022 08:36:02 +1100
Message-id: <164340576289.5493.5784848964540459557@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, 28 Jan 2022, Miklos Szeredi wrote: > On Thu, 27 Jan
 2022 at 03:47, NeilBrown <neilb@suse.de> wrote: > > > > inode_congested()
 reports if the backing-device for the inode is > > congested. Few [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [195.135.220.29 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nDYuv-001P0G-J3
Subject: Re: [f2fs-dev] [PATCH 1/9] Remove inode_congested()
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
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm <linux-mm@kvack.org>, drbd-dev@lists.linbit.com,
 Paolo Valente <paolo.valente@linaro.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Ilya Dryomov <idryomov@gmail.com>, Ext4 <linux-ext4@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-nilfs@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Linux NFS list <linux-nfs@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jeff Layton <jlayton@kernel.org>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 28 Jan 2022, Miklos Szeredi wrote:
> On Thu, 27 Jan 2022 at 03:47, NeilBrown <neilb@suse.de> wrote:
> >
> > inode_congested() reports if the backing-device for the inode is
> > congested.  Few bdi report congestion any more, only ceph, fuse, and
> > nfs.  Having support just for those is unlikely to be useful.
> >
> > The places which test inode_congested() or it variants like
> > inode_write_congested(), avoid initiating IO if congestion is present.
> > We now have to rely on other places in the stack to back off, or abort
> > requests - we already do for everything except these 3 filesystems.
> >
> > So remove inode_congested() and related functions, and remove the call
> > sites, assuming that inode_congested() always returns 'false'.
> 
> Looks to me this is going to "break" fuse; e.g. readahead path will go
> ahead and try to submit more requests, even if the queue is getting
> congested.   In this case the readahead submission will eventually
> block, which is counterproductive.
> 
> I think we should *first* make sure all call sites are substituted
> with appropriate mechanisms in the affected filesystems and as a last
> step remove the superfluous bdi congestion mechanism.
> 
> You are saying that all fs except these three already have such
> mechanisms in place, right?  Can you elaborate on that?

Not much.  I haven't looked into how other filesystems cope, I just know
that they must because no other filesystem ever has a congested bdi
(with one or two minor exceptions, like filesystems over drbd).

Surely read-ahead should never block.  If it hits congestion, the
read-ahead request should simply fail.  block-based filesystems seem to
set REQ_RAHEAD which might get mapped to REQ_FAILFAST_MASK, though I
don't know how that is ultimately used.

Maybe fuse and others should continue to track 'congestion' and reject
read-ahead requests when congested.
Maybe also skip WB_SYNC_NONE writes..

Or maybe this doesn't really matter in practice...  I wonder if we can
measure the usefulness of congestion.

Thanks,
NeilBrown


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
