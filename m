Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1524323213
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Feb 2021 21:29:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lEeIh-0001Ox-96; Tue, 23 Feb 2021 20:28:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>)
 id 1lEeIf-0001Of-IL; Tue, 23 Feb 2021 20:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V88KanrG68jeibxEGiMg5wPm/95lNG+KdlAZmbHwfNg=; b=FXNvzdhIOF4ljy6kxiG8z68+BC
 CObZN/4RqrJNG6qtGW+5FQs3hNAvYOp/7tySGd8BmJ17YCaoOLbUkymvvTy8z23QTCh8ewJMOlEpq
 8FkkhLmrYCd7uZhvD2o2O2z+xWGsbJjukYCHMa7LpZxQPF+ViseReFCJ5llcST30xqIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V88KanrG68jeibxEGiMg5wPm/95lNG+KdlAZmbHwfNg=; b=KFq0X2vmfMbwcfYUuJ7VUzYuXF
 /rOuSnlFcKlLz2MlqilpmByhzrnisRVVvep46hUhOnP1SCfT00jMElQ479/oE+9tNexrY9EjzCxQb
 plj5kMfEaea4zv3N/lmg/Z2hhMx0pLpE5WRNamtrK780R2SWhfsXZfK5jYB6TKho2w40=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lEeIX-0002Tu-JV; Tue, 23 Feb 2021 20:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=V88KanrG68jeibxEGiMg5wPm/95lNG+KdlAZmbHwfNg=; b=WsrJrMaCSkHBCRydgslpm+bYR7
 p4fZaB4qJVm4eh/q4N9ITrmuWgU22B1d2LPb0yP61G6zCvOG4nZbMvPCFXGMdgl4kliAGgFgRHfSK
 vBkrCF7V78z7YKGtGtCYPngbxKEdwwfVRKQNk88r0NnpnhmSdXye788ZaCAS/38sjxJGvjCU8gmAZ
 0Po70uq86ABK1s0pppmhu68EwIBCytaT6WL17R2ISODMQrLMpYDPuJDblWkLgeZmGAOSG2DI4WurP
 dlmqQcawkf3fmLa27fEdJHsx5uXkFApiU8O/jT0SoBE9lHBeRm5DoQ2t5hpdhqKdGSRus/saT/nk/
 QuTxmsSA==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lEeHW-008TA8-Qu; Tue, 23 Feb 2021 20:27:48 +0000
Date: Tue, 23 Feb 2021 20:27:42 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Steve French <smfrench@gmail.com>
Message-ID: <20210223202742.GM2858050@casper.infradead.org>
References: <161340385320.1303470.2392622971006879777.stgit@warthog.procyon.org.uk>
 <9e49f96cd80eaf9c8ed267a7fbbcb4c6467ee790.camel@redhat.com>
 <CAH2r5mvPLivjuE=cbijzGSHOvx-hkWSWbcxpoBnJX-BR9pBskQ@mail.gmail.com>
 <20210216021015.GH2858050@casper.infradead.org>
 <CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2r5mv+AdiODH1TSL+SOQ5qpZ25n7Ysrp+iYxauX9sD8ehhVQ@mail.gmail.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lEeIX-0002Tu-JV
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
 Jeff Layton <jlayton@redhat.com>, Christoph Hellwig <hch@lst.de>,
 linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
 v9fs-developer@lists.sourceforge.net, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 linux-nfs <linux-nfs@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 David Wysochanski <dwysocha@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Feb 15, 2021 at 11:22:20PM -0600, Steve French wrote:
> On Mon, Feb 15, 2021 at 8:10 PM Matthew Wilcox <willy@infradead.org> wrote:
> > The switch from readpages to readahead does help in a couple of corner
> > cases.  For example, if you have two processes reading the same file at
> > the same time, one will now block on the other (due to the page lock)
> > rather than submitting a mess of overlapping and partial reads.
> 
> Do you have a simple repro example of this we could try (fio, dbench, iozone
> etc) to get some objective perf data?

I don't.  The problem was noted by the f2fs people, so maybe they have a
reproducer.

> My biggest worry is making sure that the switch to netfs doesn't degrade
> performance (which might be a low bar now since current network file copy
> perf seems to signifcantly lag at least Windows), and in some easy to understand
> scenarios want to make sure it actually helps perf.

I had a question about that ... you've mentioned having 4x4MB reads
outstanding as being the way to get optimum performance.  Is there a
significant performance difference between 4x4MB, 16x1MB and 64x256kB?
I'm concerned about having "too large" an I/O on the wire at a given time.
For example, with a 1Gbps link, you get 250MB/s.  That's a minimum
latency of 16us for a 4kB page, but 16ms for a 4MB page.

"For very simple tasks, people can perceive latencies down to 2 ms or less"
(https://danluu.com/input-lag/)
so going all the way to 4MB I/Os takes us into the perceptible latency
range, whereas a 256kB I/O is only 1ms.

So could you do some experiments with fio doing direct I/O to see if
it takes significantly longer to do, say, 1TB of I/O in 4MB chunks vs
256kB chunks?  Obviously use threads to keep lots of I/Os outstanding.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
