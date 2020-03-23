Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9518F848
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 16:10:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGOiu-0007y5-EH; Mon, 23 Mar 2020 15:10:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jGOit-0007xz-UX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 15:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0AoPx3M//CC4MKv+fqKfXM7iuK3yRsz/4Eiic0tSJ0Y=; b=kXHbxnnfnWlpcAh29HD+TpiNcl
 kv5LVFhR+sniDjSSBw7afT64V9x5vY8gIkcW9qw2k8CxyVx+RPdpGNFgRfrFnk0KWixnp0l5OaSxn
 tMDxi5QCynHw3Whi5juLAcH0ztN0ckU1ZJY96Z+sHDXskT3Kdu3TQVzCRM20eT5D30jI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0AoPx3M//CC4MKv+fqKfXM7iuK3yRsz/4Eiic0tSJ0Y=; b=QxeJZ/sst29h6sPxroAfc59jgW
 0zFX3WY1meHRtejtZtWMxvBo531jrfI1OER9L9UgxiK14vayr7S6WQmfNtu5kONdMIOdtmpS9Qhgx
 1iQGpRfSo4Iw2fWudKw35HyFHwya0dWrLOHIc15JRzJhCnhoYhyAI8XLJ7k9/Mt2Rg1w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGOir-004gun-W7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 15:10:39 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89130206F8;
 Mon, 23 Mar 2020 15:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584976227;
 bh=DEot+U5aAhQnERI+yODgTb0Q/N9eQ71HwwOhlgIpZNg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fp35Xy2S29GLP/ffijwK4fWsN+7zW24b/sRU3E5KJRjWgG2NDU9PL5qcUH5rARgsq
 U/XhqJhFFnjVPTVydoGD1OUz86UQbWzlEmA/IJXfp1RWhT6z5RLNP6inFn/hEAWGja
 x4PkJp+QG2cQ6qnZ7pz53hrZcikOl+4Q50CiCUls=
Date: Mon, 23 Mar 2020 08:10:27 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Joe Perches <joe@perches.com>
Message-ID: <20200323151027.GA123526@google.com>
References: <20200323031807.94473-1-yuchao0@huawei.com>
 <afa74570dacebb3b93d4b9c27d6c8a87186cef2d.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afa74570dacebb3b93d4b9c27d6c8a87186cef2d.camel@perches.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGOir-004gun-W7
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix potential .flags overflow on
 32bit architecture
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/23, Joe Perches wrote:
> On Mon, 2020-03-23 at 11:18 +0800, Chao Yu wrote:
> > f2fs_inode_info.flags is unsigned long variable, it has 32 bits
> > in 32bit architecture, since we introduced FI_MMAP_FILE flag
> > when we support data compression, we may access memory cross
> > the border of .flags field, corrupting .i_sem field, result in
> > below deadlock.
> []
> > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> []
> > @@ -362,7 +362,7 @@ static int do_read_inode(struct inode *inode)
> >  	fi->i_flags = le32_to_cpu(ri->i_flags);
> >  	if (S_ISREG(inode->i_mode))
> >  		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
> > -	fi->flags = 0;
> > +	bitmap_zero(fi->flags, BITS_TO_LONGS(FI_MAX));
> 
> Sorry, I misled you here, this should be
> 
> 	bitmap_zero(fi->flags, FI_MAX);

Thanks, I applied this directly in the f2fs tree.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
