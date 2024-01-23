Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA42839A69
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jan 2024 21:39:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rSNYH-0007C4-R6;
	Tue, 23 Jan 2024 20:39:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mpatocka@redhat.com>) id 1rSNYG-0007Bx-6g
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 20:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MZviQqgVcq2tRc3p4TWEA+VfgMFTGON5OotgVwwOHF4=; b=lyWTg6dMg0yt+JL4xF4Zo2/84d
 CMhcIZaXRHyVkJHWfacIFloAGyl0foawiMSCpxHJxVZocf5hsjmFDB4G13XuBvAEUmYqypq882IZN
 2QHkrAgRkKOabTKV+f9wrZztvK+GT7P3OJXYzK/ojvsW6fBBFv6M1u5xlRNiN/ZKbB3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MZviQqgVcq2tRc3p4TWEA+VfgMFTGON5OotgVwwOHF4=; b=aeTBksfk9tpkRsSMr873cAU0U/
 vORITxmCg4Ya8BfBR7zisKi/sQdWM4rIbZ/MYWOamQXYqME83nVBHKKqV78NSIuPhfd2tgpiZyEil
 pGlGIrJJbjvYGIkrl8qjYgo/VSOOLIkcpHj0xPGgz/ZXmaBQGnSXZaCqJAXl5FZBMsD0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rSNYB-0004n4-I1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jan 2024 20:39:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706042350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MZviQqgVcq2tRc3p4TWEA+VfgMFTGON5OotgVwwOHF4=;
 b=AEXR0JW3kcQewmXfRpoKS0VgDzaTzwxOXZlygNLAzJ7cw7nHVfaY40lxE7XFrjOsfOqLMX
 LP6TiRmZgA/665cjMvGNe/DtqBV1xBq8UaiTK45GarJrZ3zVfsZ8SUQfdm03jM6uw4hl9p
 QCJtvtqz6s4R6knrExoPdwtM8zNB+m0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-16-4b7BRzuFOe-EJjmvnNvwOg-1; Tue, 23 Jan 2024 15:39:04 -0500
X-MC-Unique: 4b7BRzuFOe-EJjmvnNvwOg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 088278828C2;
 Tue, 23 Jan 2024 20:39:03 +0000 (UTC)
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2462026D66;
 Tue, 23 Jan 2024 20:39:02 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id D9D7030A79CB; Tue, 23 Jan 2024 20:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 D72613FB4E; Tue, 23 Jan 2024 21:39:02 +0100 (CET)
Date: Tue, 23 Jan 2024 21:39:02 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
In-Reply-To: <20240123-zonefs_nofs-v1-1-cc0b0308ef25@wdc.com>
Message-ID: <31e0f796-1c5-b7f8-2f4b-d937770e8d5@redhat.com>
References: <20240123-zonefs_nofs-v1-0-cc0b0308ef25@wdc.com>
 <20240123-zonefs_nofs-v1-1-cc0b0308ef25@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, 23 Jan 2024,
 Johannes Thumshirn wrote: > Pass GFP_KERNEL
 instead of GFP_NOFS to the blkdev_zone_mgmt() call in > zonefs_zone_mgmt().
 > > As as zonefs_zone_mgmt() and zonefs_inode_zone_mgmt() are never called
 > from a place that can recurse [...] 
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.133.124 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [170.10.133.124 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rSNYB-0004n4-I1
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
Cc: Naohiro Aota <naohiro.aota@wdc.com>, dm-devel@lists.linux.dev,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Chaitanya Kulkarni <kch@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
 Josef Bacik <josef@toxicpanda.com>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 Chris Mason <clm@fb.com>, Damien Le Moal <dlemoal@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On Tue, 23 Jan 2024, Johannes Thumshirn wrote:

> Pass GFP_KERNEL instead of GFP_NOFS to the blkdev_zone_mgmt() call in
> zonefs_zone_mgmt().
> 
> As as zonefs_zone_mgmt() and zonefs_inode_zone_mgmt() are never called
> from a place that can recurse back into the filesystem on memory reclaim,
> it is save to call blkdev_zone_mgmt() with GFP_KERNEL.
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
> ---
>  fs/zonefs/super.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/zonefs/super.c b/fs/zonefs/super.c
> index 93971742613a..63fbac018c04 100644
> --- a/fs/zonefs/super.c
> +++ b/fs/zonefs/super.c
> @@ -113,7 +113,7 @@ static int zonefs_zone_mgmt(struct super_block *sb,
>  
>  	trace_zonefs_zone_mgmt(sb, z, op);
>  	ret = blkdev_zone_mgmt(sb->s_bdev, op, z->z_sector,
> -			       z->z_size >> SECTOR_SHIFT, GFP_NOFS);
> +			       z->z_size >> SECTOR_SHIFT, GFP_KERNEL);
>  	if (ret) {
>  		zonefs_err(sb,
>  			   "Zone management operation %s at %llu failed %d\n",
> 
> -- 
> 2.43.0

zonefs_inode_zone_mgmt calls 
lockdep_assert_held(&ZONEFS_I(inode)->i_truncate_mutex); - so, this 
function is called with the mutex held - could it happen that the 
GFP_KERNEL allocation recurses into the filesystem and attempts to take 
i_truncate_mutex as well?

i.e. GFP_KERNEL -> iomap_do_writepage -> zonefs_write_map_blocks -> 
zonefs_write_iomap_begin -> mutex_lock(&zi->i_truncate_mutex)

Mikulas



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
