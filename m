Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 854593129D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Feb 2021 05:42:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l8yNU-0003jp-41; Mon, 08 Feb 2021 04:42:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>) id 1l8yNS-0003ji-TC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 04:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WB3juAaBYwC2MxbiotZSBmQXq1FFI9Dtko9ctx5zdno=; b=IqojiSAk1FSL1gLgnMamkCG8Fg
 l/2fCNe0h2OfKI+GmBEDcFn7Ml5oTc0cFP52B3OeUoEvnW/PvfgpffShGkhpfuuwDsBsrTeKLwR8c
 ZtbK8bFWgeabbXOXawpB4P1AVxp7DXPMK9nsSmUp6HfbywvVpAbvDzUiBi93O2PjSDLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WB3juAaBYwC2MxbiotZSBmQXq1FFI9Dtko9ctx5zdno=; b=OGo+7GcNyD+gAe1aIC/YlxfR5b
 f6x4KbuGrbSXs3ru57ZwVd/OSinTPQ9TsNLZHCjVZIRAzi6SaDeaBfA3m19KoO6YyL8ZX4g2FxpQb
 RgCZ/zGdc/DUODrb2zqH3LjWc1+5c2BDg6MUFC1k9GyTiuPT7bIg7AS0NDDPLOF+6M0I=;
Received: from mga14.intel.com ([192.55.52.115])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l8yNH-00Elf4-5a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Feb 2021 04:42:22 +0000
IronPort-SDR: h+vJe/QS4PRdxFnsWbWDpHGmmXdc6pHq2CQjCDbM57ysuplfRnaPiNiIc2x+XZvnw280BaRCnL
 o/CfKYRsd4AQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9888"; a="180881695"
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="180881695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 20:42:05 -0800
IronPort-SDR: lDzmoh8+UisZyVs1ZdC9r6kw83BmFeBWP09Iyvk1+CUVLR3QZX6dMgmpSW6/pKun3V1xaUAOt7
 PTdNFalIGYjw==
X-IronPort-AV: E=Sophos;i="5.81,161,1610438400"; d="scan'208";a="376972543"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 20:42:05 -0800
Date: Sun, 7 Feb 2021 20:42:05 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
Message-ID: <20210208044205.GG5033@iweiny-DESK2.sc.intel.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <BYAPR04MB49655721C8EE8BAFF055EE2986B09@BYAPR04MB4965.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR04MB49655721C8EE8BAFF055EE2986B09@BYAPR04MB4965.namprd04.prod.outlook.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1l8yNH-00Elf4-5a
Subject: Re: [f2fs-dev] [RFC PATCH 0/8] use core page calls instead of kmaps
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
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
 "ebiggers@kernel.org" <ebiggers@kernel.org>,
 Damien Le Moal <Damien.LeMoal@wdc.com>, "tytso@mit.edu" <tytso@mit.edu>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "hch@infradead.org" <hch@infradead.org>,
 Johannes Thumshirn <Johannes.Thumshirn@wdc.com>,
 "dave.hansen@intel.com" <dave.hansen@intel.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "clm@fb.com" <clm@fb.com>,
 "adilger.kernel@dilger.ca" <adilger.kernel@dilger.ca>,
 "dongli.zhang@oracle.com" <dongli.zhang@oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "dsterba@suse.com" <dsterba@suse.com>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 07, 2021 at 07:10:41PM +0000, Chaitanya Kulkarni wrote:
> On 2/7/21 11:04, Chaitanya Kulkarni wrote:
> > Chaitanya Kulkarni (8):
> >   brd: use memcpy_from_page() in copy_from_brd()
> >   brd: use memcpy_from_page() in copy_from_brd()
> I'm aware that couple of places in brd code we can use memcpy_to_page()
> and get rid the local variable, once I get some feedback I'll add those
> to the V1.

Except for the one comment I had this series look's good to me.

Reviewed-by: Ira Weiny <ira.weiny@intel.com>

Thanks!
Ira



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
