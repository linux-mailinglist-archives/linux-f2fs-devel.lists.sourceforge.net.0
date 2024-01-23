Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54A839D58
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jan 2024 00:47:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSQUO-0002Ol-GN;
	Tue, 23 Jan 2024 23:47:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1rSQUM-0002Oe-Ix
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 23:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pyNE0YBQ61XvxQg0qzcUw/mj3pyKM5V+H7U9PFr3Dnc=; b=hMR/Uc2bcfCxOuhl7d5tD1+jeA
 qzCjphljc6P8yBuOJFc/LQio2inY6I71ZuvM6fgTeKyLRI3F3lnbVty/YoeX9W8SDAbvqQPe62p8H
 +cyA76ZHzHTG+Jh42Du4DqUUcr6PLOeSG+XFOCT5Sjuc8J0Ne2aOAnhQ0krcVGvyIv7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pyNE0YBQ61XvxQg0qzcUw/mj3pyKM5V+H7U9PFr3Dnc=; b=JSOslUHOy2WbiZzpot71CCX+vU
 RKGjKhSj7DIlXX5kHgn2RPI7blO67qcpV63KJI6heh8q8jwaej+rXsFIblmw6svxfeBaGkjUSIFj2
 XGrq2hPVBvu2Jm4KsgAoc3urDb9Km8Tn+RxyWtwFOjzd9zWB9RjJzd7jJV5LBy9/apao=;
Received: from mail-oa1-f45.google.com ([209.85.160.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rSQUH-0004Cy-KN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 23:47:31 +0000
Received: by mail-oa1-f45.google.com with SMTP id
 586e51a60fabf-2046b2cd2d3so3632222fac.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 23 Jan 2024 15:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1706053640; x=1706658440;
 darn=lists.sourceforge.net; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=pyNE0YBQ61XvxQg0qzcUw/mj3pyKM5V+H7U9PFr3Dnc=;
 b=NdwvIK8ENtOFBfNiV9Y8QbKTouL6hzThldB/na6Lb19c0WRkhIBEJwRSdlrWw2MMOE
 pvdSLBxWHpHI/X76fV8AtfP+uiBFxy/6nfM0YyUJPe5+vaVqpx5bgDYqB3Ttw34F0rdc
 6JgCaCiaupLIwzun2Fzl3vIeYOZ6Run2b9u2n8UfqSKmpN1XyClPLykq7j1081q3gvzB
 2+KYF4zaUek2OOzu22bW0P9Dz6hAkJ7xaqTrbZo8MT6nIjAA0onNZlHRLiPHwlMgSNBM
 4cFSg7IM7T9FC8K92nzYGjZxDc86DMpNX3+aF8s8aj453od03Fq0CXdjAz9IM3++xCCP
 xqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706053640; x=1706658440;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pyNE0YBQ61XvxQg0qzcUw/mj3pyKM5V+H7U9PFr3Dnc=;
 b=b70LnHtyixm33HGWynTr+S+r1nLl7fIykIpachUeUaj+IyB+ZLsGOyV0t9ox/qqvOp
 j2794aJ22NRlOI9nn29CBErPMhDI+f2to1d4PI1oe52H2ptLjAZpDy8IOQPJ4NMDUONv
 Fk7FJaAQUQeqa5YxStjJagXKkMV5mXtd8WkUkvFlNjWfnKWNPMu92/XfeABFDZ5JnS2q
 XWoibdRKnzQdcKmbfGVlFHpzWHf93P2Ve+DHb+BHwXqJ5E+iaNW94RqQHGxfvvKwoG74
 9S2DkJw8zaFIaOsE29eyKYtoBcExDZvMjM7T5q7gyu6PpFzrlzgn8mTRy4ffttgoEfgh
 au4A==
X-Gm-Message-State: AOJu0YzOLCQRaEFN58QroPQZV0d8KH8dOcKuvxx7pkGtSEin9zIfcVro
 xvHeedptPUwXABZ0CJWxS7ACpFgEOEMSTtvqYUGsSOuzY/pwDukwka7kWiDMr69AMLt03bVpK7s
 H
X-Google-Smtp-Source: AGHT+IGeQm//kQ1jNNCFdA/q04f/cj+3wXvZbTLBGBCW2U08K7o/GP2/AW3XgLOokmhWoQbjbV2FZg==
X-Received: by 2002:a17:902:d202:b0:1d7:1e5d:ab39 with SMTP id
 t2-20020a170902d20200b001d71e5dab39mr3908243ply.80.1706052110812; 
 Tue, 23 Jan 2024 15:21:50 -0800 (PST)
Received: from dread.disaster.area (pa49-181-38-249.pa.nsw.optusnet.com.au.
 [49.181.38.249]) by smtp.gmail.com with ESMTPSA id
 t10-20020a170902bc4a00b001d714a1530bsm8165932plz.176.2024.01.23.15.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 15:21:50 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1rSQ5T-00EPce-2c;
 Wed, 24 Jan 2024 10:21:47 +1100
Date: Wed, 24 Jan 2024 10:21:47 +1100
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <ZbBKC3U3/1yPvWDR@dread.disaster.area>
References: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
 <20240123-zonefs_nofs-v1-1-cc0b0308ef25@wdc.com>
 <31e0f796-1c5-b7f8-2f4b-d937770e8d5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31e0f796-1c5-b7f8-2f4b-d937770e8d5@redhat.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 23, 2024 at 09:39:02PM +0100, Mikulas Patocka
 wrote: > > > On Tue, 23 Jan 2024,
 Johannes Thumshirn wrote: > > > Pass GFP_KERNEL
 instead of GFP_NOFS to the blkdev_zone_mgmt() call in > > zo [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.45 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.45 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rSQUH-0004Cy-KN
Subject: Re: [f2fs-dev] [PATCH 1/5] zonefs: pass GFP_KERNEL to
 blkdev_zone_mgmt() call
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Naohiro Aota <naohiro.aota@wdc.com>, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, Chaitanya Kulkarni <kch@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Chris Mason <clm@fb.com>,
 Damien Le Moal <dlemoal@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-btrfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 23, 2024 at 09:39:02PM +0100, Mikulas Patocka wrote:
> 
> 
> On Tue, 23 Jan 2024, Johannes Thumshirn wrote:
> 
> > Pass GFP_KERNEL instead of GFP_NOFS to the blkdev_zone_mgmt() call in
> > zonefs_zone_mgmt().
> > 
> > As as zonefs_zone_mgmt() and zonefs_inode_zone_mgmt() are never called
> > from a place that can recurse back into the filesystem on memory reclaim,
> > it is save to call blkdev_zone_mgmt() with GFP_KERNEL.
> > 
> > Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> > ---
> >  fs/zonefs/super.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> > index 93971742613a..63fbac018c04 100644
> > --- a/fs/zonefs/super.c
> > +++ b/fs/zonefs/super.c
> > @@ -113,7 +113,7 @@ static int zonefs_zone_mgmt(struct super_block *sb,
> >  
> >  	trace_zonefs_zone_mgmt(sb, z, op);
> >  	ret = blkdev_zone_mgmt(sb->s_bdev, op, z->z_sector,
> > -			       z->z_size >> SECTOR_SHIFT, GFP_NOFS);
> > +			       z->z_size >> SECTOR_SHIFT, GFP_KERNEL);
> >  	if (ret) {
> >  		zonefs_err(sb,
> >  			   "Zone management operation %s at %llu failed %d\n",
> > 
> > -- 
> > 2.43.0
> 
> zonefs_inode_zone_mgmt calls 
> lockdep_assert_held(&ZONEFS_I(inode)->i_truncate_mutex); - so, this 
> function is called with the mutex held - could it happen that the 
> GFP_KERNEL allocation recurses into the filesystem and attempts to take 
> i_truncate_mutex as well?
> 
> i.e. GFP_KERNEL -> iomap_do_writepage -> zonefs_write_map_blocks -> 
> zonefs_write_iomap_begin -> mutex_lock(&zi->i_truncate_mutex)

zonefs doesn't have a ->writepage method, so writeback can't be
called from memory reclaim like this.

-Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
