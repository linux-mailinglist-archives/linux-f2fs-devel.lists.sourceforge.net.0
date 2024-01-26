Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 570A883E52B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jan 2024 23:20:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rTUZ1-0001is-LO;
	Fri, 26 Jan 2024 22:20:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1rTUYz-0001im-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/E6SchMT/MBTkigsKRtKzMaww505l1rRLlIaIQ2soUg=; b=E5oljEnhkHUhoXkhZ3Qf3262h7
 RzcWYBPolxzkA0TDonQOMxf7k/sqWLDUVt58t/HMlUmSMjOo2u+bcYhZeoRjYviBDzFtBKGlb1E0P
 LN4pwIasRfh/CRw2QFyPeZNvIKCO7TdBQ/xj5BIA6abUXRIdb93/vv4ts3YjninYlihE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/E6SchMT/MBTkigsKRtKzMaww505l1rRLlIaIQ2soUg=; b=f0vW3eFSLv23PUyMO7ykruWOE0
 RVu9rLC9F+XTsg1VFXvcKnjletg1fjJUIx8rH2iUEWrLw0nPB7doL1Q/uHDXsnOx6RRUPRN+DYr1n
 lpJnDlOuRsY8WhzNPPom8VtpV4k5BMp2VSAUYZDujed31HBGxUDbZ3pWw6PsTTYol1LI=;
Received: from mgamail.intel.com ([134.134.136.65])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rTUYv-0000iS-N1 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jan 2024 22:20:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706307638; x=1737843638;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=PgTmG/yzGVqUhuwJ1i6jbTUkm8ADJwrhKbzlIpQ+M9M=;
 b=XPHClsATyxiWPI7ALw3UKJg0COt7TTiIxyxeuwS3MSkEDEBA0FjYtM9+
 fN/yJqgeGtwPAKg5Q98/t5kSl2c7MOQHnE69XjFWQRH0wCyLIs3Hl5d1/
 SdEgTwvlV/3gHESLWOd3xjuyRn63AyxPtXHEM0LeSkeyh4CcEororws0f
 kcTcjKrbpscb8FBN76q7DthrD/S5O1RTyZrsxLHdqMy90JmPw+DzuyMJL
 iSq8KxPvsugHWEniH6B1GIlyyziOrnw7gkWbi1xuUAZQOCj0wZbYUp1DS
 NE+YswRQTD8NLHTfR/8xZdu4VMDP8QIqREJhn3cOvYbsEE4NlUatFwUXY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="406317860"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="406317860"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 14:04:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2716758"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
 by fmviesa005.fm.intel.com with ESMTP; 26 Jan 2024 14:04:33 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1rTUJL-0001NK-01;
 Fri, 26 Jan 2024 22:04:31 +0000
Date: Sat, 27 Jan 2024 06:03:58 +0800
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
Message-ID: <202401270524.3SWUUYR8-lkp@intel.com>
References: <20240123-zonefs_nofs-v1-5-cc0b0308ef25@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123-zonefs_nofs-v1-5-cc0b0308ef25@wdc.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Johannes, kernel test robot noticed the following build
 errors: [auto build test ERROR on 7ed2632ec7d72e926b9e8bcc9ad1bb0cd37274bf]
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [134.134.136.65 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rTUYv-0000iS-N1
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
Cc: Johannes Thumshirn <johannes.thumshirn@wdc.com>, llvm@lists.linux.dev,
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240127/202401270524.3SWUUYR8-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project a31a60074717fc40887cfe132b77eec93bedd307)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270524.3SWUUYR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270524.3SWUUYR8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/dm-zoned-metadata.c:8:
   In file included from drivers/md/dm-zoned.h:12:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/md/dm-zoned-metadata.c:8:
   In file included from drivers/md/dm-zoned.h:12:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/md/dm-zoned-metadata.c:8:
   In file included from drivers/md/dm-zoned.h:12:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/md/dm-zoned-metadata.c:1661:34: error: too many arguments to function call, expected 4, have 5
    1659 |                 ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
         |                       ~~~~~~~~~~~~~~~~
    1660 |                                        dmz_start_sect(zmd, zone),
    1661 |                                        zmd->zone_nr_sectors, GFP_KERNEL);
         |                                                              ^~~~~~~~~~
   include/linux/gfp_types.h:327:20: note: expanded from macro 'GFP_KERNEL'
     327 | #define GFP_KERNEL      (__GFP_RECLAIM | __GFP_IO | __GFP_FS)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/blkdev.h:327:5: note: 'blkdev_zone_mgmt' declared here
     327 | int blkdev_zone_mgmt(struct block_device *bdev, enum req_op op,
         |     ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     328 |                 sector_t sectors, sector_t nr_sectors);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   6 warnings and 1 error generated.


vim +1661 drivers/md/dm-zoned-metadata.c

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
6c1b1da58f8c7a Ajay Joshi         2019-10-27  1659  		ret = blkdev_zone_mgmt(dev->bdev, REQ_OP_ZONE_RESET,
3b1a94c88b798d Damien Le Moal     2017-06-07  1660  				       dmz_start_sect(zmd, zone),
c4d4977392621f Johannes Thumshirn 2024-01-23 @1661  				       zmd->zone_nr_sectors, GFP_KERNEL);
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
