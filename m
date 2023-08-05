Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FE877107E
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Aug 2023 18:19:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSJzn-00054y-9a;
	Sat, 05 Aug 2023 16:19:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1qSJzl-00054j-Cz
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 16:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjNsJCLVAu0TU0e6K2MCvm9mrzrNe+dQtFIPEgONaU4=; b=IquPtAirGX+Trs6LVCyhKNzyF/
 ck2Yfu10/NzM2eT86MUVJb/VSyoaWbb76YV6r+O/h0+V7N7COkJy2pzTc1hXyPfaJghJcXB/FLmuX
 5TCa2kFqVDl1XWDAo/WWBqre0XVTkcfKnfhK/iY8gNuDupNuV7UEqtl4AFCschRtrfek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjNsJCLVAu0TU0e6K2MCvm9mrzrNe+dQtFIPEgONaU4=; b=NyWCvHowHxgJOPkSoT8gs90Mt/
 NJxD4wXB4fp7sIV3mODO9m/uXdRNfs2OvA0wcNpZcNaHYLVIykc9v8uUH9lGGIEtmYXLEHvzY9mEj
 y/o4UeFE9V9iRsx6XHnZxEChDKLobFuUaPM5OiDQe1KuTVcQldrGkI5FR9GcPa4xYGko=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSJzj-00088E-Kx for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 16:19:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E146E60BA3;
 Sat,  5 Aug 2023 16:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F45DC433C8;
 Sat,  5 Aug 2023 16:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691252345;
 bh=eczxg65nAKdspBAZJjvsqnJ9aD9e1Cnh1ASqk/5x4Tc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z0h/IrNV9FDvUWv2eNzdGVI/pdKwMLXK4ephLjq8qasptg9QR42I18oxpmAO8umTF
 +jPDQ/hHlUXz8vlybFxoV5RemFk0DVSLbmOMRAK0CJqcO8LUXtppZEHOBIInbCw1Bp
 JTrajwX0bDnORyljOsGHdnXOxmx4UhQ4gFvfINhcXD8pnn5ERuxQv6rcgrEHwNJK1I
 cw8urElSBCWxmfql/5enH6QJ/LQEtkXgzdIYOACoSdLpWEdSHCXQJS6+TIJwCyfYu7
 hRiEBFxuNr7P2y5wMX51/z0/iaXoTcxnlDluglqILaNhlVU/0TaObzI32WdPQIaxv2
 RPO/N8LaaV66Q==
Date: Sat, 5 Aug 2023 09:19:04 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230805161904.GM11377@frogsfrogsfrogs>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-12-hch@lst.de>
 <20230802163219.GW11352@frogsfrogsfrogs>
 <20230805083239.GA29780@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230805083239.GA29780@lst.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Aug 05, 2023 at 10:32:39AM +0200, Christoph Hellwig
 wrote: > On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong wrote:
 > > > + /* see get_tree_bdev why this is needed and safe */ > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qSJzj-00088E-Kx
Subject: Re: [f2fs-dev] [PATCH 11/12] xfs: drop s_umount over opening the
 log and RT devices
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
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 05, 2023 at 10:32:39AM +0200, Christoph Hellwig wrote:
> On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong wrote:
> > > +	/* see get_tree_bdev why this is needed and safe */
> > 
> > Which part of get_tree_bdev?  Is it this?
> > 
> > 		/*
> > 		 * s_umount nests inside open_mutex during
> > 		 * __invalidate_device().  blkdev_put() acquires
> > 		 * open_mutex and can't be called under s_umount.  Drop
> > 		 * s_umount temporarily.  This is safe as we're
> > 		 * holding an active reference.
> > 		 */
> > 		up_write(&s->s_umount);
> > 		blkdev_put(bdev, fc->fs_type);
> > 		down_write(&s->s_umount);
> 
> Yes.  With the refactoring earlier in the series get_tree_bdev should
> be trivial enough to not need a more specific reference.  If you
> think there's a better way to refer to it I can update the comment,
> though.

How about:

	/*
	 * blkdev_put can't be called under s_umount, see the comment in
	 * get_tree_bdev for more details
	 */

with that and the label name change,
Reviewed-by: Darrick J. Wong <djwong@kernel.org>

--D


> > >  		mp->m_logdev_targp = mp->m_ddev_targp;
> > >  	}
> > >  
> > > -	return 0;
> > > +	error = 0;
> > > +out_unlock:
> > > +	down_write(&sb->s_umount);
> > 
> > Isn't down_write taking s_umount?  I think the label should be
> > out_relock or something less misleading.
> 
> Agreed.  Christian, can you just change this in your branch, or should
> I send an incremental patch?
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
