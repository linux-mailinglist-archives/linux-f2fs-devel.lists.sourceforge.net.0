Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CCC75ADD0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 14:07:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMSR2-0006Cq-DD;
	Thu, 20 Jul 2023 12:07:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qMSR1-0006Cd-9E
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CXi0GZjcxztTbJDhGZsDqauMI815aXijIaLoDNyKEI8=; b=YBwATIST//xoJXk9X72vc8vypX
 v7nBv2FNfZBlvUTfiFaIwyfY95Lkc9YXjsND0E2UASgLyAU5Rd50z+GlWbcenRuBlA1c6oshKgveJ
 /klmnrNcZXWntCFOX1x52jpd+pOOz339uP8jq+JW/Dq/QSx2hUPCqQqmbe/b0HLNgmFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CXi0GZjcxztTbJDhGZsDqauMI815aXijIaLoDNyKEI8=; b=EQ0moVJgxiCPGO0ISxOcJTlb/N
 gZ4nXoNGAaZ04R/W09putrBCiafof74dhD4yJ2Ww50AZC8/FazWJADmYodQlZQFzH0y7HJDC+kmCn
 SKDb2Tr5jtdyx7Z9cBdOrGG0gJmcTArCbn73Ur5t5cWIP0l4PfUlio5VnvkWuQYvSpWM=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMSQx-00E298-NG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 12:07:08 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DDB576732D; Thu, 20 Jul 2023 14:06:50 +0200 (CEST)
Date: Thu, 20 Jul 2023 14:06:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20230720120650.GA13266@lst.de>
References: <20230424054926.26927-1-hch@lst.de>
 <20230424054926.26927-17-hch@lst.de>
 <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b96b397e-2f5e-7910-3bb3-7405d0e293a7@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke
 wrote: > I'm hitting this during booting: > [ 5.016324] <TASK> > [ 5.030256]
 iomap_iter+0x11a/0x350 > [ 5.030264] iomap_readahead+0x1eb/0x2c0 [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qMSQx-00E298-NG
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 19, 2023 at 04:22:01PM +0200, Hannes Reinecke wrote:
> I'm hitting this during booting:
> [    5.016324]  <TASK>
> [    5.030256]  iomap_iter+0x11a/0x350
> [    5.030264]  iomap_readahead+0x1eb/0x2c0
> [    5.030272]  read_pages+0x5d/0x220
> [    5.030279]  page_cache_ra_unbounded+0x131/0x180
> [    5.030284]  filemap_get_pages+0xff/0x5a0
> [    5.030292]  filemap_read+0xca/0x320
> [    5.030296]  ? aa_file_perm+0x126/0x500
> [    5.040216]  ? touch_atime+0xc8/0x150
> [    5.040224]  blkdev_read_iter+0xb0/0x150
> [    5.040228]  vfs_read+0x226/0x2d0
> [    5.040234]  ksys_read+0xa5/0xe0
> [    5.040238]  do_syscall_64+0x5b/0x80
>
> Maybe we should consider this patch:

As willy said this should be taken care of by the i_size check.
Did you run with just this patch set or some of the large block
size experiments on top which might change the variables?

I'll repost the series today without any chances in the area, and
if you can reproduce it with just that series we need to root
cause it, so please send your kernel and VM config along for the
next report.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
