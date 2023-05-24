Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB6670F7AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 15:33:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1ocg-0008DF-R2;
	Wed, 24 May 2023 13:33:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1q1ocd-0008D8-HH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 13:33:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PlI3NINuTp5y2t5Z+4wg7vfiTt8lvB4SyLbHC5tKASU=; b=VEJM8Sud9RMNAaQYmVdCymFl+/
 R2VYurhlerJG7deAPEQQiseSMCBSQN3IKmzgpQrGcHpzwCQ9Q89JXdG2gdiULQpwvAdCfIbiBfuRR
 jQB/n5tUR2dT9J9vIUhRaXW+mpqtvnpQm5koK18BmbAhjAjiUrH2PDo5bss9n+Wbnb4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PlI3NINuTp5y2t5Z+4wg7vfiTt8lvB4SyLbHC5tKASU=; b=egN2f3PHFOw9eEIx5kfXabfQ2x
 vHgP0X1ahNLNCZTZwBWy5Kh0QIXxiXYtVhQ8cCT5QZNQYQ81uTnXZ4+ILS9Ckg+bn8kBgR3Ai8tbQ
 dr3HtVlOfvkI+0+zNExherj3rsHbQoCY5vi6QY+ixglUyjcrCN1d8DRPK37i5nuB0+2Y=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1ocW-0001ao-T2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 13:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PlI3NINuTp5y2t5Z+4wg7vfiTt8lvB4SyLbHC5tKASU=; b=eq1oO18nKmxdfx79+rZ3TTo5Q2
 2/F3VHC9ngHsBakNRFv680ymTTyCK9hQMC/hF/6ByoTd1QX5Huc2qSnkfOtIpqNxg3U3KILlEnohH
 tk1m/vJLtoK5KkcBjlU2kaBM3cLYnmqGoN2Zya9Htl2CZTaH4W94BgkzuYeaOzmShvPd+qb3ym5EL
 yonGPZiSfd3yzH3hEQFRUsVsx849CuZTYjYDAClbFB7R6Y5PcboAB1JCCXjmLj8dakGubsyS8QwrS
 jjlaR0JAq6BqcKNmdvnkHdN+wsZcZz5xjzhHDugGtoEqqn7cXDiJJ1Gi7vDVBHa/uqXa8DUbUI1v1
 peQuoiEw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1q1oc5-00BF3M-Tz; Wed, 24 May 2023 13:33:13 +0000
Date: Wed, 24 May 2023 14:33:13 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZG4SGYOogQtEZrll@casper.infradead.org>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
 <ZG09wR4WOI8zDxJK@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZG09wR4WOI8zDxJK@dread.disaster.area>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 24, 2023 at 08:27:13AM +1000, Dave Chinner wrote:
 > On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote: > > I'm
 hitting this during booting: > > [ 5.016324] <TASK> > > [ 5.030 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1ocW-0001ao-T2
Subject: Re: [f2fs-dev] [PATCH 16/17] block: use iomap for writes to block
 devices
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-nfs@vger.kernel.org, cluster-devel@redhat.com, linux-xfs@vger.kernel.org,
 Miklos Szeredi <miklos@szeredi.hu>, "Darrick J. Wong" <djwong@kernel.org>,
 ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, Hannes Reinecke <hare@suse.de>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, May 24, 2023 at 08:27:13AM +1000, Dave Chinner wrote:
> On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
> > I'm hitting this during booting:
> > [    5.016324]  <TASK>
> > [    5.030256]  iomap_iter+0x11a/0x350
> > [    5.030264]  iomap_readahead+0x1eb/0x2c0
> > [    5.030272]  read_pages+0x5d/0x220
> > [    5.030279]  page_cache_ra_unbounded+0x131/0x180
> > [    5.030284]  filemap_get_pages+0xff/0x5a0
> 
> Why is filemap_get_pages() using unbounded readahead? Surely
> readahead should be limited to reading within EOF....

It isn't using unbounded readahead; that's an artifact of this
incomplete stack trace.  Actual call stack:

page_cache_ra_unbounded
do_page_cache_ra
ondemand_readahead
page_cache_sync_ra
page_cache_sync_readahead
filemap_get_pages

As you can see, do_page_cache_ra() does limit readahead to i_size.
Is ractl->mapping->host the correct way to find the inode?  I always
get confused.

> I think Christoph's code is correct. IMO, any attempt to read beyond
> the end of the device should throw out a warning and return an
> error, not silently return zeros.
> 
> If readahead is trying to read beyond the end of the device, then it
> really seems to me like the problem here is readahead, not the iomap
> code detecting the OOB read request....
> 
> Cheers,
> 
> Dave.
> -- 
> Dave Chinner
> david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
