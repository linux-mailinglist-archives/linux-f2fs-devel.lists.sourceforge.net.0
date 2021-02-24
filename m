Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472FF323685
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Feb 2021 05:58:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEmFY-00055E-WC; Wed, 24 Feb 2021 04:58:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <smfrench@gmail.com>)
 id 1lEmFX-00054s-4G; Wed, 24 Feb 2021 04:58:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FrajYP2hBjaKUlNDr5nfLO5dI2VEsLYw/fRZTXaD8VA=; b=MZNutZwH1M7nodb5+wpJe0+ZNO
 h0vGY3MWGb0y3yAXw6CNBsWjRDZV/Ayj+YK2vaR7Pxo0o0L2bzKl3beZDt6D5wGw6PcYVFIovVlBC
 0ZeCgUVtumYaX0s8P7ss8CMhIdV/6BfKxTdflK6sYJO2wCLlsTUEb6NVPbD3QgARSupI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FrajYP2hBjaKUlNDr5nfLO5dI2VEsLYw/fRZTXaD8VA=; b=GacDnbUZ1rhLqoHuspXzBRYFaG
 UlDSNZx70ZgNEi1G4oPi5gxvcQwUBj7S/N5lVizUierl/pGko4JVutsZZgwbIN5+t0gMjeR8FYJ/J
 mu0YvNiFv6IDoyddT/7ASbPsesUCQcyPCNaZIkVNvZ3KnbfRK3soT9K4a7Ei/CVQtfWs=;
Received: from mail-lf1-f49.google.com ([209.85.167.49])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lEmFR-003Ejx-Us; Wed, 24 Feb 2021 04:58:11 +0000
Received: by mail-lf1-f49.google.com with SMTP id f1so1107612lfu.3;
 Tue, 23 Feb 2021 20:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrajYP2hBjaKUlNDr5nfLO5dI2VEsLYw/fRZTXaD8VA=;
 b=ZMmxrY5nQMPOuw6scDp5kDuYNOONNS6FyeSqMA2TydiNEydn5VzajUuNlS+6FCjg52
 co69WuI+FJUhbw5cv6uyYbvJIPdGEGuFONjiN7n7CEjSBcSkK47PSIn/83dDwIZjPNJq
 Bc99HBK+z471EUjv/2nnZGGvJp/vo7jFdbMAlPsQ1RCh3q4g4yMELRcpKYfgS1mz87PD
 dQLRvVz5IpraVECQzwKylQiGaE5qLGQtbFuuea9LWXD4GtMr51zfpdKbYhYqwn2V7uqY
 FCYktNTYMdvVIEunttK0IvC1KekDxUVtDEzPeP5hRuKb778GNss7erwfqplRsaae2Y6Y
 mtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrajYP2hBjaKUlNDr5nfLO5dI2VEsLYw/fRZTXaD8VA=;
 b=Ih0705lD4xVLr50CWrFtwF4Sdju/62bJjQf6UbLpQNXQ4ASVyYpYfvbFsMH+2dotAD
 /mRqU9mm49hqNf25svU4MTG7SFC5ceuc0fb5OT2XFr8A/JCVPAWuxl+ZIs8gRoJzO7XQ
 QvQPGNQwR2Xo+/F2vW1zQ/1xDN1znu6yGJV8nlOkf5EN14NEdHUHlb7PkkmPq2aBrcqP
 9DeeQ0YcI8UiM9VjhZPICHRYrggd14EKj+mdT5hk3cb+DzdhLEtlEl8ZNEPNngEgnw+M
 wmfUaiA7Qf3op4EOH7ee2NxZ0dM9k3PXrHlGZC0ybk0qYhlaHJEfJ5QZd6ZIsgMc+iP9
 z8Ag==
X-Gm-Message-State: AOAM533zQkoMB5DWDnLVtL4EsGiof/YnPbqfgngO3bwla+nWjQI8WI/V
 oEdVWEnK7L/gTwZqwvfzu3b35CoShuku3cf62aI=
X-Google-Smtp-Source: ABdhPJw6r/na/lmIQBVTZHzL3REpx3JMt6S1bztYIeQ+Q0r5DTYVKTT1II6PMpNnp9XsQr/gpOhg2b3f8C/vYdZxtAM=
X-Received: by 2002:a05:6512:1311:: with SMTP id
 x17mr17837516lfu.307.1614142679263; 
 Tue, 23 Feb 2021 20:57:59 -0800 (PST)
MIME-Version: 1.0
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
 <9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
 <CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
 <20210216021015.GH2858050@casper.infradead.org>
 <CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
 <20210223202742.GM2858050@casper.infradead.org>
In-Reply-To: <20210223202742.GM2858050@casper.infradead.org>
From: Steve French <smfrench@gmail.com>
Date: Tue, 23 Feb 2021 22:57:48 -0600
Message-ID: <CAH2r5ms06hL0f5+ejXJTYE7_8rO4SZRW+-ZeWETNFiXDPu1Jbg@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (smfrench[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: danluu.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEmFR-003Ejx-Us
Subject: Re: [f2fs-dev] [PATCH 00/33] Network fs helper library & fscache
 kiocb API [ver #3]
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
Cc: Dominique Martinet <asmadeus@codewreck.org>,
 David Howells <dhowells@redhat.com>,
 William Kucharski <william.kucharski@oracle.com>,
 linux-afs@lists.infradead.org, CIFS <linux-cifs@vger.kernel.org>,
 Case van Rij <case.vanrij@gmail.com>, Jeff Layton <jlayton@redhat.com>,
 Christoph Hellwig <hch@lst.de>, linux-cachefs@redhat.com,
 Trond Myklebust <trondmy@hammerspace.com>,
 v9fs-developer@lists.sourceforge.net, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel <ceph-devel@vger.kernel.org>,
 linux-nfs <linux-nfs@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 David Wysochanski <dwysocha@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 23, 2021 at 2:28 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Feb 15, 2021 at 11:22:20PM -0600, Steve French wrote:
> > On Mon, Feb 15, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > The switch from readpages to readahead does help in a couple of corner
> > > cases.  For example, if you have two processes reading the same file at
> > > the same time, one will now block on the other (due to the page lock)
> > > rather than submitting a mess of overlapping and partial reads.
> >
> > Do you have a simple repro example of this we could try (fio, dbench, iozone
> > etc) to get some objective perf data?
>
> I don't.  The problem was noted by the f2fs people, so maybe they have a
> reproducer.
>
> > My biggest worry is making sure that the switch to netfs doesn't degrade
> > performance (which might be a low bar now since current network file copy
> > perf seems to signifcantly lag at least Windows), and in some easy to understand
> > scenarios want to make sure it actually helps perf.
>
> I had a question about that ... you've mentioned having 4x4MB reads
> outstanding as being the way to get optimum performance.  Is there a
> significant performance difference between 4x4MB, 16x1MB and 64x256kB?
> I'm concerned about having "too large" an I/O on the wire at a given time.
> For example, with a 1Gbps link, you get 250MB/s.  That's a minimum
> latency of 16us for a 4kB page, but 16ms for a 4MB page.
>
> "For very simple tasks, people can perceive latencies down to 2 ms or less"
> (https://danluu.com/input-lag/)
> so going all the way to 4MB I/Os takes us into the perceptible latency
> range, whereas a 256kB I/O is only 1ms.
>
> So could you do some experiments with fio doing direct I/O to see if
> it takes significantly longer to do, say, 1TB of I/O in 4MB chunks vs
> 256kB chunks?  Obviously use threads to keep lots of I/Os outstanding.

That is a good question and it has been months since I have done experiments
with something similar.   Obviously this will vary depending on RDMA or not and
multichannel or not - but assuming the 'normal' low end network configuration -
ie a 1Gbps link and no RDMA or multichannel I could do some more recent
experiments.

In the past what I had noticed was that server performance for simple
workloads like cp or grep increased with network I/O size to a point:
smaller than 256K packet size was bad. Performance improved
significantly from 256K to 512K to 1MB, but only very
slightly from 1MB to 2MB to 4MB and sometimes degraded at 8MB
(IIRC 8MB is the max commonly supported by SMB3 servers),
but this is with only one adapter (no multichannel) and 1Gb adapters.

But in those examples there wasn't a lot of concurrency on the wire.

I did some experiments with increasing the read ahead size
(which causes more than one async read to be issued by cifs.ko
but presumably does still result in some 'dead time')
which seemed to help perf of some sequential read examples
(e.g. grep or cp) to some servers but I didn't try enough variety
of server targets to feel confident about that change especially
if netfs is coming

e.g. a change I experimented with was:
         sb->s_bdi->ra_pages = cifs_sb->ctx->rsize / PAGE_SIZE
to
         sb->s_bdi->ra_pages = 2 * cifs_sb->ctx->rsize / PAGE_SIZE

and it did seem to help a little.

I would expect that 8x1MB (ie trying to keep eight 1MB reads in process should
keep the network mostly busy and not lead to too much dead time on
server, client
or network) and is 'good enough' in many read ahead use cases (at
least for non-RDMA, and non-multichannel on a slower network) to keep the pipe
file, and I would expect the performance to be similar to the equivalent using
2MB read (e.g. 4x2MB) and perhaps better than 2x4MB.  Below 1MB i/o size
on the wire I would expect to see degradation due to packet processing
and task switching
overhead.  Would definitely be worth doing more experimentation here.
-- 
Thanks,

Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
