Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C7241121
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 21:49:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5Dnf-0003Il-0W; Mon, 10 Aug 2020 19:49:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1k5Dnd-0003IW-20
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 19:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ysnHvZXUv6rE+Uo8Kua96I2R1J0/Zt3oLCkvajiITNY=; b=b7NSOX+qs93ukQeisj0nzDkKV0
 6LpTHNLvTBO/9/MErY3ZTdYIB390B/NPJgTTmU62HnnmgFYKQFYrmV8JBm9eC7suc8k1vKv12txkT
 2+bSf2JQG4DOsW5YZtSsZb3QXQ94Tnx1uxv6IwH1uvRn6n0+EWPYmBcwBik0vCrDUhJ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ysnHvZXUv6rE+Uo8Kua96I2R1J0/Zt3oLCkvajiITNY=; b=FwXMhkjwyi/t6GIqW8gtjw6o65
 7ifyJFyMM9ZqQgBA+h58Euvd4+bmsOseaozuUJISLjDhJNZRL7oyliy5FmlNwVtMRPiY33fFQS5ny
 rD5fN57vF+1z3vPmcX2Rz8tAWgsP1DyV+GXoZfxhaifx9IuqFZRHjLJs4c+O4NrwXn7E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k5DnW-0063M5-QB
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 19:49:37 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4C6B822BF3;
 Mon, 10 Aug 2020 19:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597088965;
 bh=HjCZi5cqlmjfvNpjhRr8R4CIfIHLLuK5ibsgkztL5QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPEM6DbVFxE+Z04JnIjDUN+GadKR0tyGdZ7nOWPzCYo/FYi9ejXkwSlpO+6pwHrY1
 3K+ppd/0/Huo28pUhZGeUreah/jqWOM/1VSHJRqBeO3p2beb6SYqqUIlFkFWXtNkjz
 9D6GMnkaXFZerwJ1nMyUXTJhYmnB6enrk2zsMnP4=
Date: Mon, 10 Aug 2020 12:49:24 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Message-ID: <20200810194924.GB2745602@google.com>
References: <202007211524.zrSvup2X%lkp@intel.com>
 <BY5PR04MB699535E4F62BEC16568A3E058C780@BY5PR04MB6995.namprd04.prod.outlook.com>
 <20200721195736.GA43066@google.com>
 <20200810141852.GA15533@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200810141852.GA15533@localhost.localdomain>
X-Spam-Score: -0.3 (/)
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
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k5DnW-0063M5-QB
Subject: Re: [f2fs-dev] [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48:
 error: 'struct blk_zone' has no member named 'capacity'
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
 kernel test robot <lkp@intel.com>, Aravind Ramesh <Aravind.Ramesh@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 Hans Holmberg <Hans.Holmberg@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 08/10, Niklas Cassel wrote:
> On Tue, Jul 21, 2020 at 12:57:36PM -0700, Jaegeuk Kim wrote:
> > On 07/21, Aravind Ramesh wrote:
> > > Hello Jaegeuk,
> > > The patch that adds the capacity struct member has been merged to linux-block tree's for-next branch.
> > > So either:
> > > 1. f2fs-dev branch has to carry the same patch, from here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/log/include/uapi/linux/blkzoned.h?h=for-next
> > > I had mentioned this is the cover letter of this patch.
> > > 2. linux-block pull request has to be merged before f2fs pull request to Linus
> > > 3. Or this f2fs patch has to wait until next merge window (the one after kernel 5.9 merge window)
> > 
> > Yeah, indeed. Let me queue this patch and try upstream later till block has it.
> 
> Hello Jaegeuk,
> 
> Just curious, where is this queued?
> 
> I can't find it on any of your branches on this git:
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
> 
> FWIW, commit 82394db7383d ("block: add capacity field to zone descriptors")
> is now in Torvald's tree.
> 
> Which merge window did you intend for this patch? 5.9 or 5.10?

It was in https://github.com/jaegeuk/f2fs/commit/550451dc977aeb0000104eb9777fd1dca07e5efb,
and will be moved into kernel.org once pull request for 4.9 was applied.
I think we can merge it in 5.10.

Thanks,

> 
> 
> Kind regards,
> Niklas
> 
> > 
> > Thanks,
> > 
> > > 
> > > Thanks
> > > Aravind
> > > 
> > > > -----Original Message-----
> > > > From: kernel test robot <lkp@intel.com>
> > > > Sent: Tuesday, July 21, 2020 12:43 PM
> > > > To: Aravind Ramesh <Aravind.Ramesh@wdc.com>
> > > > Cc: kbuild-all@lists.01.org; linux-f2fs-devel@lists.sourceforge.net; Jaegeuk Kim
> > > > <jaegeuk@kernel.org>; Damien Le Moal <Damien.LeMoal@wdc.com>; Niklas Cassel
> > > > <Niklas.Cassel@wdc.com>; Chao Yu <yuchao0@huawei.com>; Chao Yu
> > > > <chao@kernel.org>
> > > > Subject: [f2fs:dev-test 37/38] fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has
> > > > no member named 'capacity'
> > > > 
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
> > > > head:   439633ba3673a5d8983529426df144c64a23d181
> > > > commit: d787c5eec8b58bb47d4bf750758e0e87d667bf56 [37/38] f2fs: support
> > > > zone capacity less than zone size
> > > > config: nds32-allyesconfig (attached as .config)
> > > > compiler: nds32le-linux-gcc (GCC) 9.3.0
> > > > reproduce (this is a W=1 build):
> > > >         wget https://raw.githubusercontent.com/intel/lkp-
> > > > tests/master/sbin/make.cross -O ~/bin/make.cross
> > > >         chmod +x ~/bin/make.cross
> > > >         git checkout d787c5eec8b58bb47d4bf750758e0e87d667bf56
> > > >         # save the attached .config to linux build tree
> > > >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross
> > > > ARCH=nds32
> > > > 
> > > > If you fix the issue, kindly add following tag as appropriate
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > 
> > > > All errors (new ones prefixed by >>):
> > > > 
> > > >    fs/f2fs/super.c: In function 'f2fs_report_zone_cb':
> > > > >> fs/f2fs/super.c:3058:48: error: 'struct blk_zone' has no member named 'capacity'
> > > >     3058 |  rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > > >          |                                                ^~
> > > >    fs/f2fs/super.c:3060:23: error: 'struct blk_zone' has no member named 'capacity'
> > > >     3060 |  if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > > >          |                       ^~
> > > > 
> > > > vim +3058 fs/f2fs/super.c
> > > > 
> > > >   3048
> > > >   3049	static int f2fs_report_zone_cb(struct blk_zone *zone, unsigned int idx,
> > > >   3050				      void *data)
> > > >   3051	{
> > > >   3052		struct f2fs_report_zones_args *rz_args = data;
> > > >   3053
> > > >   3054		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
> > > >   3055			return 0;
> > > >   3056
> > > >   3057		set_bit(idx, rz_args->dev->blkz_seq);
> > > > > 3058		rz_args->dev->zone_capacity_blocks[idx] = zone->capacity >>
> > > >   3059
> > > > 	F2FS_LOG_SECTORS_PER_BLOCK;
> > > >   3060		if (zone->len != zone->capacity && !rz_args->zone_cap_mismatch)
> > > >   3061			rz_args->zone_cap_mismatch = true;
> > > >   3062
> > > >   3063		return 0;
> > > >   3064	}
> > > >   3065
> > > > 
> > > > ---
> > > > 0-DAY CI Kernel Test Service, Intel Corporation
> > > > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
