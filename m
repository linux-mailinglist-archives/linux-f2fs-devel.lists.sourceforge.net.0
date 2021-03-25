Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D1E349500
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 16:11:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPRdV-0002kV-SJ; Thu, 25 Mar 2021 15:11:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <ira.weiny@intel.com>) id 1lPRdT-0002kB-Sl
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 15:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CD1hiTq1Yt9meGWzqd9lSosuyPGcxqAcgdo3oANFZUU=; b=MozJPBYMlxsNx601d9kWZ42Mea
 YF+iTQZeEwSiPT1PXqlRbaCKZLlhWXZusE/o1ipTdK1wlFHyDfrwHE30QIpwmjZH9Z4OYEOr9IeTj
 PdDy9jAjPcmSjCj0O/ArRjehWwix9EcaD1r7gPQ/rY3IQVjjjdaERPSlO75whA9Hseow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CD1hiTq1Yt9meGWzqd9lSosuyPGcxqAcgdo3oANFZUU=; b=O1nNgw2h2wNJVvEPtdzeUxzobs
 sv+r6eOOwgzXibxSib7/MlxsWd3E6P4/3Jy9uX6ApCpHwFPHkX2bt1dNqwaCjKU2h6YwKDl8on48C
 +yJUsdd7aghxdC0+TZOtIHk7dT7bN90tcvjjj1Q1ES3lzVTh/JpF7R2CTfbTGiHHEf08=;
Received: from mga06.intel.com ([134.134.136.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPRdO-0002c3-OL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 15:10:59 +0000
IronPort-SDR: 9eDpTeuOm1Z8MK8wJ307ND0kuL4DeoFMIYd/Tik0GrIH26fDMyI4zAqPiJ3FGYUZ6MiPWxHYpQ
 ykEGiyBbr8nA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="252305248"
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="252305248"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 08:10:48 -0700
IronPort-SDR: dPvFJNBPXz+6hB+ecIHrgxpLZawb8lLhygnp4vUuH4RjI/fPMOirG8taFHfKyYVt+tqxrpbPgs
 xtVQhWYMifZA==
X-IronPort-AV: E=Sophos;i="5.81,277,1610438400"; d="scan'208";a="416044528"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 08:10:48 -0700
Date: Thu, 25 Mar 2021 08:10:48 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20210325151047.GX3014244@iweiny-DESK2.sc.intel.com>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-7-chaitanya.kulkarni@wdc.com>
 <YFycvk4aMoPAZcwJ@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFycvk4aMoPAZcwJ@mit.edu>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lPRdO-0002c3-OL
Subject: Re: [f2fs-dev] [RFC PATCH 6/8] ext4: use memcpy_to_page() in
 pagecache_write()
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
Cc: axboe@kernel.dk, ebiggers@kernel.org, damien.lemoal@wdc.com,
 bvanassche@acm.org, Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
 hch@infradead.org, johannes.thumshirn@wdc.com, dave.hansen@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 clm@fb.com, adilger.kernel@dilger.ca, dongli.zhang@oracle.com,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, dsterba@suse.com,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 25, 2021 at 10:22:54AM -0400, Theodore Y. Ts'o wrote:
> On Sun, Feb 07, 2021 at 11:04:23AM -0800, Chaitanya Kulkarni wrote:
> > Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> > ---
> >  fs/ext4/verity.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> Hi, were you expecting to have file system maintainers take these
> patches into their own trees?  The ext4 patches look good, and unless
> you have any objections, I can take them through the ext4 tree.

I should have sent the lore link to the fix:

https://lore.kernel.org/linux-f2fs-devel/BYAPR04MB496564B786E293FDA21D06E6868F9@BYAPR04MB4965.namprd04.prod.outlook.com/

Sorry,
Ira


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
