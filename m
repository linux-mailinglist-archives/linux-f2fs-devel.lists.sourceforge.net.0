Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD178437EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jan 2024 08:32:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rV55Q-00045N-Se;
	Wed, 31 Jan 2024 07:32:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rV55P-000458-0z
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:32:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V4YAZDel5OBwMG24YgZ8kPVmC8xWyteZPVcV1z2w9Sk=; b=JRQrzGkcJ9y4rxUsKy4b4F7/L3
 sK/HnsSSASt5hKrH6VO0jROXN4kix9EBe/JOKeDgeeM0VKHthamjN7vWEmspnr3vfKgXhdTA5rnvZ
 1AVZTXxUMOEP1G7GaAtxziC4aIwlqZ9TRikDm4sn2tykmr128qgiCzZhT0SmH8UqwKDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V4YAZDel5OBwMG24YgZ8kPVmC8xWyteZPVcV1z2w9Sk=; b=myGX1P+wN+JGlJCiT2SCR8iCbK
 AEr0tRhRSz4Go7Ive8UETLOpRbhH7UUhT0eWTMUyEVLTvVAqeuEIKxhxzIjG57uYZN1R8Ny99GePM
 DAqvG3YN6sySZ80/zHc/ODVkXUQGUVMaCHq7Si63onjiiiwTHKakQyft9ipfBApR9JUw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rV55O-0003bC-4I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jan 2024 07:32:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0D3DCCE1D9F;
 Wed, 31 Jan 2024 07:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2C4C433C7;
 Wed, 31 Jan 2024 07:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706686355;
 bh=sxA/BQif6UosZYq9bEM7P35Kp7rNc5yXcyj9qFUfD4o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sXgRqJl/mMi2kUmYZA/bTZQ70FhzSCKpqsJprAywphSWPE15pORJFWbnfKjrJ8FqL
 FbArM8c44OdB1yyxg99MPlRtVdaX2d36hFPLV2AIVx6sK5wuRFanJeAmmkeosV2jeO
 i/tEvG5AAbqeAW/XsqxaSasMNCN9W/WIfyupoc/USjWkoFBPzkcYi+XaYHcMORh6mG
 bZ6HHZH/1YaM9xkgVDWPrRkj0gPXkQPS1y8kM6feJtdxy7PdpZ8fI9sAxeuqlUijBF
 H/mkTru9fO3Nf9nW21Ssl6kU7nEjmd5iZKNHS78J3STgJ4BuvnPKcX2HN0sirrqqx+
 2DFYmNgfg0rLg==
Message-ID: <a73d0808-b6ae-4d78-9846-379b83540c72@kernel.org>
Date: Wed, 31 Jan 2024 15:32:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 dm-devel@lists.linux.dev, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
References: <20240128-zonefs_nofs-v3-0-ae3b7c8def61@wdc.com>
 <20240128-zonefs_nofs-v3-4-ae3b7c8def61@wdc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240128-zonefs_nofs-v3-4-ae3b7c8def61@wdc.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/29 15:52, Johannes Thumshirn wrote: > Guard the
 calls to blkdev_zone_mgmt() with a memalloc_nofs scope. > This helps us
 getting
 rid of the GFP_NOFS argument to blkdev_zone_mgmt(); > > Signed [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rV55O-0003bC-4I
Subject: Re: [f2fs-dev] [PATCH v3 4/5] f2fs: guard blkdev_zone_mgmt with
 nofs scope
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
Cc: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/1/29 15:52, Johannes Thumshirn wrote:
> Guard the calls to blkdev_zone_mgmt() with a memalloc_nofs scope.
> This helps us getting rid of the GFP_NOFS argument to blkdev_zone_mgmt();
> 
> Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
