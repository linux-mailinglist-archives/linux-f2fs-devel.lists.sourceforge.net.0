Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BC770EC7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Aug 2023 10:33:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSCiZ-0005SG-P1;
	Sat, 05 Aug 2023 08:33:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1qSCiX-0005S9-Su
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 08:32:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BCIlXluXWy5gM4p2olEUM/cLP3jDHmE1DtsIWN67gk8=; b=nAFn8t+dwrFIwrQlqcqRQLnmqF
 nCNMieB4mLeg1oYOelGo3ZO2+4bO74wsxSEZU2n1aVdeuGt+El+azrSmMD2DTPXKagJWRsG3npJ3w
 mB1ktNhcg1W+k0vEWaLw0SCTHnfmtvSwru4Yokr+SEin5JLhgabXF0fOKfBIfpjnWu8s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BCIlXluXWy5gM4p2olEUM/cLP3jDHmE1DtsIWN67gk8=; b=Pkj7fEz5A71cBa636GWpA2gtLC
 z3bObQlzUANXmX0QP8KzdBGGMcKBPbZVuIXrU1EEL5EjgoVvkRbxs76E5TrHJXmb8Bd6VVlO6KSZ+
 AVfADT3ZQadho54sr7ow+3CqgtGqlfn9oP07X7d5dvhZtt9ZkKWCnt5KV9Hmcp4eSTVk=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qSCiT-00019Y-L3 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 05 Aug 2023 08:32:58 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A2E2A68AA6; Sat,  5 Aug 2023 10:32:39 +0200 (CEST)
Date: Sat, 5 Aug 2023 10:32:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <20230805083239.GA29780@lst.de>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-12-hch@lst.de>
 <20230802163219.GW11352@frogsfrogsfrogs>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802163219.GW11352@frogsfrogsfrogs>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong
 wrote: > > + /* see get_tree_bdev why this is needed and safe */ > > Which
 part of get_tree_bdev? Is it this? > > /* > * s_umount nests inside [...]
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1qSCiT-00019Y-L3
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
 Christian Brauner <brauner@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 Josef Bacik <josef@toxicpanda.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, linux-nilfs@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Aug 02, 2023 at 09:32:19AM -0700, Darrick J. Wong wrote:
> > +	/* see get_tree_bdev why this is needed and safe */
> 
> Which part of get_tree_bdev?  Is it this?
> 
> 		/*
> 		 * s_umount nests inside open_mutex during
> 		 * __invalidate_device().  blkdev_put() acquires
> 		 * open_mutex and can't be called under s_umount.  Drop
> 		 * s_umount temporarily.  This is safe as we're
> 		 * holding an active reference.
> 		 */
> 		up_write(&s->s_umount);
> 		blkdev_put(bdev, fc->fs_type);
> 		down_write(&s->s_umount);

Yes.  With the refactoring earlier in the series get_tree_bdev should
be trivial enough to not need a more specific reference.  If you
think there's a better way to refer to it I can update the comment,
though.

> >  		mp->m_logdev_targp = mp->m_ddev_targp;
> >  	}
> >  
> > -	return 0;
> > +	error = 0;
> > +out_unlock:
> > +	down_write(&sb->s_umount);
> 
> Isn't down_write taking s_umount?  I think the label should be
> out_relock or something less misleading.

Agreed.  Christian, can you just change this in your branch, or should
I send an incremental patch?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
