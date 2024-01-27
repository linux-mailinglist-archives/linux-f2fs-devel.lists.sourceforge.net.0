Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C09583EC89
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Jan 2024 10:58:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTfSP-0006AQ-6K;
	Sat, 27 Jan 2024 09:58:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rTfSG-0006A3-As
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 09:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aLR0u5iVQP30s7WW2kWZOASJw+r/LwZNUj/T0zySgg=; b=bsfnIS6UvyPb6Y4O02YD1/uKuw
 fRcuyAz6dTpMLFz8hqUs6f/ytEJZu4HqkZttY97/7UwFTbG0wTWqZJq8N6lqI6pvhJc+sNnqFdBnB
 2IIJzIaZGG/UuuHsTepFR1kai0lAK+xlkFkcq3G8jNqWWkeybZooJTRbqpxENtv2klwc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4aLR0u5iVQP30s7WW2kWZOASJw+r/LwZNUj/T0zySgg=; b=Ti4DONVox90CbgkhleDt0kcsNd
 JptA/7XSsPRjOIib6N9lJOx+Vk0jYyBoDIJAQBtc9e/2ZXMWNbKWuT3+VN+i/SFfUhXZc36ST5/M3
 XIZYPcK0ilsLu9zGrBB6PSUUQ9EmHjT0MCdFxgxpeUh71MTyesTJhs3ZykELtJzHxvbc=;
Received: from mgamail.intel.com ([192.198.163.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTfSB-0004C0-SY for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Jan 2024 09:58:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706349505; x=1737885505;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=r+T7mnQmtI5J+JZqBTfH0y2lgNd/RUDtr9kKlTXAe0w=;
 b=gWrRrlnmySwooWImO53WhCUi1zOtQprzuHVAq74odHJqyZEEH+eqV/Pn
 N7R/t9lGTjDJkYCXEmQUlKAFkrR6gZp4D8ezH0ZVF7OvjZ7unOT9n4p2W
 rNOrL1+Th9RNGFrTRlL7itOjWLakHmTToeJleoOIt6KuOD+fLDFC5fZ3X
 KYG0uLTbBZt1sd7LywxoHYuEelxwg0RWZq+sgxRS5Dgv08qbuyVFGkEY6
 NjVM9Rn5Eta78zHsqEXcWbkryRm+oF/R/ATqK4jA198NpdTh094oYms5i
 SOQeRffmKYU5MJhiYuWiSiMyiwdlGXj1mdk1B0+xcmR5cs0HfNSsLdkuf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9341802"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9341802"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 01:58:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2947041"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by fmviesa004.fm.intel.com with ESMTP; 27 Jan 2024 01:58:13 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rTfRz-00025e-0m;
 Sat, 27 Jan 2024 09:58:11 +0000
Date: Sat, 27 Jan 2024 17:57:59 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>, Naohiro Aota <naohiro.aota@wdc.com>,
 Mike Snitzer <snitzer@kernel.org>, dm-devel@lists.linux.dev,
 Chris Mason <chris.mason@fusionio.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 Chao Yu <chao@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <kch@nvidia.com>
Message-ID: <202401271724.LJfDQ6VB-lkp@intel.com>
References: <20240123-zonefs_nofs-v1-5-cc0b0308ef25@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123-zonefs_nofs-v1-5-cc0b0308ef25@wdc.com>
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Johannes, kernel test robot noticed the following build
 errors: [auto build test ERROR on 7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf]
 Content analysis details:   (-1.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTfSB-0004C0-SY
Subject: Re: [f2fs-dev] [PATCH 5/5] block: remove gfp_flags from
 blkdev_zone_mgmt
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
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 oe-kbuild-all@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on 7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/zonefs-pass-GFP_KERNEL-to-blkdev_zone_mgmt-call/20240123-174911
base:   7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf
patch link:    https://lore.kernel.org/r/20240123-zonefs_nofs-v1-5-cc0b0308ef25%40wdc.com
patch subject: [PATCH 5/5] block: remove gfp_flags from blkdev_zone_mgmt
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240127/202401271724.LJfDQ6VB-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401271724.LJfDQ6VB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401271724.LJfDQ6VB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/md/dm-zoned-metadata.c: In function 'dmz_reset_zone':
>> drivers/md/dm-zoned-metadata.c:1659:23: error: too many arguments to function 'blkdev_zone_mgmt'
    1659 |                 ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
         |                       ^~~~~~~~~~~~~~~~
   In file included from drivers/md/dm-zoned.h:12,
                    from drivers/md/dm-zoned-metadata.c:8:
   include/linux/blkdev.h:327:5: note: declared here
     327 | int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
         |     ^~~~~~~~~~~~~~~~


vim +/blkdev_zone_mgmt +1659 drivers/md/dm-zoned-metadata.c

3b1a94c88b798d Damien Le Moal     2017-06-07  1639  
3b1a94c88b798d Damien Le Moal     2017-06-07  1640  /*
3b1a94c88b798d Damien Le Moal     2017-06-07  1641   * Reset a zone write pointer.
3b1a94c88b798d Damien Le Moal     2017-06-07  1642   */
3b1a94c88b798d Damien Le Moal     2017-06-07  1643  static int dmz_reset_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
3b1a94c88b798d Damien Le Moal     2017-06-07  1644  {
3b1a94c88b798d Damien Le Moal     2017-06-07  1645  	int ret;
3b1a94c88b798d Damien Le Moal     2017-06-07  1646  
3b1a94c88b798d Damien Le Moal     2017-06-07  1647  	/*
3b1a94c88b798d Damien Le Moal     2017-06-07  1648  	 * Ignore offline zones, read only zones,
3b1a94c88b798d Damien Le Moal     2017-06-07  1649  	 * and conventional zones.
3b1a94c88b798d Damien Le Moal     2017-06-07  1650  	 */
3b1a94c88b798d Damien Le Moal     2017-06-07  1651  	if (dmz_is_offline(zone) ||
3b1a94c88b798d Damien Le Moal     2017-06-07  1652  	    dmz_is_readonly(zone) ||
3b1a94c88b798d Damien Le Moal     2017-06-07  1653  	    dmz_is_rnd(zone))
3b1a94c88b798d Damien Le Moal     2017-06-07  1654  		return 0;
3b1a94c88b798d Damien Le Moal     2017-06-07  1655  
3b1a94c88b798d Damien Le Moal     2017-06-07  1656  	if (!dmz_is_empty(zone) || dmz_seq_write_err(zone)) {
8f22272af7a727 Hannes Reinecke    2020-06-02  1657  		struct dmz_dev *dev = zone->dev;
3b1a94c88b798d Damien Le Moal     2017-06-07  1658  
6c1b1da58f8c7a Ajay Joshi         2019-10-27 @1659  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
3b1a94c88b798d Damien Le Moal     2017-06-07  1660  				       dmz_start_sect(zmd, zone),
c4d4977392621f Johannes Thumshirn 2024-01-23  1661  				       zmd->zone_nr_sectors, GFP_KERNEL);
3b1a94c88b798d Damien Le Moal     2017-06-07  1662  		if (ret) {
3b1a94c88b798d Damien Le Moal     2017-06-07  1663  			dmz_dev_err(dev, "Reset zone %u failed %d",
b71228739851a9 Hannes Reinecke    2020-05-11  1664  				    zone->id, ret);
3b1a94c88b798d Damien Le Moal     2017-06-07  1665  			return ret;
3b1a94c88b798d Damien Le Moal     2017-06-07  1666  		}
3b1a94c88b798d Damien Le Moal     2017-06-07  1667  	}
3b1a94c88b798d Damien Le Moal     2017-06-07  1668  
3b1a94c88b798d Damien Le Moal     2017-06-07  1669  	/* Clear write error bit and rewind write pointer position */
3b1a94c88b798d Damien Le Moal     2017-06-07  1670  	clear_bit(DMZ_SEQ_WRITE_ERR, &zone->flags);
3b1a94c88b798d Damien Le Moal     2017-06-07  1671  	zone->wp_block = 0;
3b1a94c88b798d Damien Le Moal     2017-06-07  1672  
3b1a94c88b798d Damien Le Moal     2017-06-07  1673  	return 0;
3b1a94c88b798d Damien Le Moal     2017-06-07  1674  }
3b1a94c88b798d Damien Le Moal     2017-06-07  1675  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
