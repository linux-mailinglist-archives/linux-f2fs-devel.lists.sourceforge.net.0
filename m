Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 774DB6D811A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Apr 2023 17:09:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pk4lZ-0008MP-3u;
	Wed, 05 Apr 2023 15:09:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1pk4lX-0008MA-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79yDnodF22HJGDCnUpnUGggD40n6HiawRbVw81LjdKA=; b=PguYu2ilVhTlLB6RniHB44yZlN
 TeZZzhG1sqBKIFv1yj8RGDyMNv/mabNivkn+1gaaCPdR9+d9uEtNwGuwFRiVaUBR7BEgh+JRUOmy7
 4aHawKI3Ncl/DXhiO2ZWB2leofZdKAepRwo/fOZugGnvZKubGcZS2eXsiv7pxOLj38RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79yDnodF22HJGDCnUpnUGggD40n6HiawRbVw81LjdKA=; b=amfxr+1vjNflp9ryKz3z1sNhlw
 q93u7s0l31FRzGAr3fFlG+e49lS5xSNObM7GHJvpMrq7rH6eKtNurC4B/tyNpoKeeMUWBYDx02SQ2
 HQwJdXLHwDmJaNeEPEYJO08RNeTsO8Lh8Z2kfM8tx9ydofntG0wJ0+8CYXak9dG6thWE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pk4lT-0000Yz-1k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 15:09:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0FA2626EA;
 Wed,  5 Apr 2023 15:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353F3C433EF;
 Wed,  5 Apr 2023 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680707368;
 bh=+aefmgXHXWQivw0zE6f7l8O069i+hkWlRKpgwCfgkhM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eaui7DNs5zR82qFwoJqlHJGtdjxtNEKuV49OBzaU1JlhtGdDYmTgoB7Cg2oP8kuF6
 llkjHDUdha3QByAfdxqMYc98qQ+8ePQOOGLfMYXv7iryNRKikleW4/Rv2KpJZ+dG+R
 hqqk2yOgcJkfZwcFmwaxyL/C4cW8DC4atYXvjSG94RQwISX4hL8V8dC7qMnS2GbmwG
 xxCnzKlA3g+4SzfCaBYH98ENyrqmXYnLMN9ZwmfOIOHAYdZ2+3ckQ45BzFODINTzEK
 guTSkMAP9TBQ1TjgYouk94BaRFrPHtC5b2sMJBCMYjozrgR384v+W/44ayI8qoH62X
 9Z0ZXiDNSLnow==
Date: Wed, 5 Apr 2023 08:09:27 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Andrey Albershteyn <aalbersh@redhat.com>
Message-ID: <20230405150927.GD303486@frogsfrogsfrogs>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-20-aalbersh@redhat.com>
 <20230404161047.GA109974@frogsfrogsfrogs>
 <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405150142.3jmxzo5i27bbc4c4@aalbersh.remote.csb>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Apr 05, 2023 at 05:01:42PM +0200, Andrey Albershteyn
 wrote: > On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
 > > On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pk4lT-0000Yz-1k
Subject: Re: [f2fs-dev] [PATCH v2 19/23] xfs: disable direct read path for
 fs-verity sealed files
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
Cc: fsverity@lists.linux.dev, hch@infradead.org, linux-ext4@vger.kernel.org,
 agruenba@redhat.com, damien.lemoal@opensource.wdc.com,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Apr 05, 2023 at 05:01:42PM +0200, Andrey Albershteyn wrote:
> On Tue, Apr 04, 2023 at 09:10:47AM -0700, Darrick J. Wong wrote:
> > On Tue, Apr 04, 2023 at 04:53:15PM +0200, Andrey Albershteyn wrote:
> > > The direct path is not supported on verity files. Attempts to use direct
> > > I/O path on such files should fall back to buffered I/O path.
> > > 
> > > Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
> > > ---
> > >  fs/xfs/xfs_file.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
> > > index 947b5c436172..9e072e82f6c1 100644
> > > --- a/fs/xfs/xfs_file.c
> > > +++ b/fs/xfs/xfs_file.c
> > > @@ -244,7 +244,8 @@ xfs_file_dax_read(
> > >  	struct kiocb		*iocb,
> > >  	struct iov_iter		*to)
> > >  {
> > > -	struct xfs_inode	*ip = XFS_I(iocb->ki_filp->f_mapping->host);
> > > +	struct inode		*inode = iocb->ki_filp->f_mapping->host;
> > > +	struct xfs_inode	*ip = XFS_I(inode);
> > >  	ssize_t			ret = 0;
> > >  
> > >  	trace_xfs_file_dax_read(iocb, to);
> > > @@ -297,10 +298,17 @@ xfs_file_read_iter(
> > >  
> > >  	if (IS_DAX(inode))
> > >  		ret = xfs_file_dax_read(iocb, to);
> > > -	else if (iocb->ki_flags & IOCB_DIRECT)
> > > +	else if (iocb->ki_flags & IOCB_DIRECT && !fsverity_active(inode))
> > >  		ret = xfs_file_dio_read(iocb, to);
> > > -	else
> > > +	else {
> > > +		/*
> > > +		 * In case fs-verity is enabled, we also fallback to the
> > > +		 * buffered read from the direct read path. Therefore,
> > > +		 * IOCB_DIRECT is set and need to be cleared
> > > +		 */
> > > +		iocb->ki_flags &= ~IOCB_DIRECT;
> > >  		ret = xfs_file_buffered_read(iocb, to);
> > 
> > XFS doesn't usually allow directio fallback to the pagecache. Why
> > would fsverity be any different?
> 
> Didn't know that, this is what happens on ext4 so I did the same.
> Then it probably make sense to just error on DIRECT on verity
> sealed file.

Thinking about this a little more -- I suppose we shouldn't just go
breaking directio reads from a verity file if we can help it.  Is there
a way to ask fsverity to perform its validation against some arbitrary
memory buffer that happens to be fs-block aligned?  In which case we
could support fsblock-aligned directio reads without falling back to the
page cache?

--D

> > 
> > --D
> > 
> > > +	}
> > >  
> > >  	if (ret > 0)
> > >  		XFS_STATS_ADD(mp, xs_read_bytes, ret);
> > > -- 
> > > 2.38.4
> > > 
> > 
> 
> -- 
> - Andrey
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
