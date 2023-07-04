Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EEA74763E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jul 2023 18:15:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qGig0-0005KR-Bq;
	Tue, 04 Jul 2023 16:14:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qGifv-0005KH-9f;
 Tue, 04 Jul 2023 16:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R1W87rnlNGGe3O62ySITe0WV/TkO13M6jrCnVpdBC/M=; b=dSueikkBnRQxDMtcZYC+VeQ69E
 H+CKIv1CYo/klk8ZDOpWGPfLudno0YKIliOCqM97XAQzNFbL/hQmAe8Ic82/Qor1s4VVftVp59VhA
 F05oBavszulV/OxxJSMtaEJL14/DgW0DQ5Eo+Ciogy1PIQ1JynUdxa7s1dyb/NXyY6bQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R1W87rnlNGGe3O62ySITe0WV/TkO13M6jrCnVpdBC/M=; b=QSqkkLfle1h/6s9NnBMHX/I71D
 WVXqKTB7Vy/Vtf54efBujMoahxtrve40U8nshmT5NstuZ9/Za29C8lLCO8gHVLnnjgSX+Zq1NUtfo
 w0QL7Wd0TmCFuoB7ADI0Q6BDjTlQKaedZyXDPZr7SfxtVLKXAYqN3i7rWISVrUPVl/nc=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qGifs-005rhq-8O; Tue, 04 Jul 2023 16:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=R1W87rnlNGGe3O62ySITe0WV/TkO13M6jrCnVpdBC/M=; b=ma0abi+l8BKnWZyE2Bm6SMUpzA
 GY/Sg9bKM4QGi5Fi3SxYqWXxJ46oHMzkk2XTYG6szPrdjaFZvCOeUvh2qeA+qFPnGTya2tgZ0Czoo
 anlh0yET7VOr2nReXBjhvXLbethMJyMQRtOEtJdxTJlnJDQLzVkEFxU1z6LlHa+R1Svpz+R+Zi/2e
 EbHE+jMBvtLJPxFFKggvC8J4kNKoPgnxYJ08D38bFVgefZT0kn05//LL45wE920g1ut/XHRnJF4Ur
 2JcraLDAhTPQ+qGFyYF+arcI4MuDDkahpy1OJ1ZV5vzT8Q6c9E3mK76aIjApGP0H0G7MQh7QY3lZI
 j0pVBAMA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qGifB-009I83-IW; Tue, 04 Jul 2023 16:14:01 +0000
Date: Tue, 4 Jul 2023 17:14:01 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Bart Van Assche <bvanassche@acm.org>
Message-ID: <ZKRFSZQglwCba9/i@casper.infradead.org>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche
 wrote: > On 7/4/23 05:21, Jan Kara wrote: > > +struct bdev_handle { > > +
 struct block_device *bdev; > > + void *holder; > > +}; > > Please ex [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qGifs-005rhq-8O
Subject: Re: [f2fs-dev] [PATCH 01/32] block: Provide blkdev_get_handle_*
 functions
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
Cc: Dave Kleikamp <shaggy@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-nvme@lists.infradead.org, Joseph Qi <joseph.qi@linux.alibaba.com>,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jack Wang <jinpu.wang@ionos.com>,
 Alasdair Kergon <agk@redhat.com>, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Christoph Hellwig <hch@infradead.org>, xen-devel@lists.xenproject.org,
 Gao Xiang <xiang@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Kent Overstreet <kent.overstreet@gmail.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-pm@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, Joern Engel <joern@lazybastard.org>,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 linux-mm@kvack.org, Song Liu <song@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
 Anna Schumaker <anna@kernel.org>, linux-fsdevel@vger.kernel.org,
 "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche wrote:
> On 7/4/23 05:21, Jan Kara wrote:
> > +struct bdev_handle {
> > +	struct block_device *bdev;
> > +	void *holder;
> > +};
> 
> Please explain in the patch description why a holder pointer is introduced
> in struct bdev_handle and how it relates to the bd_holder pointer in struct
> block_device. Is one of the purposes of this patch series perhaps to add
> support for multiple holders per block device?

That is all in patch 0/32.  Why repeat it?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
