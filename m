Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E63493E7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 15:24:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPQty-0003iG-Dv; Thu, 25 Mar 2021 14:23:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1lPQtx-0003hw-4I
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 14:23:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7RAWveYTMxgdnPEf9KKp37irquek+hrI1myWQxHF6W4=; b=UHDS7LB03uRk6/UUarmebC/qR9
 HEfZnsXA1Tscsv7+NABlyPX6rhvEiF0HO+VzBhIQdoPr3nzvTSON/yKiCfPp2scwfSWjKxbYKEYEJ
 TgmUfsgorM6vaQE2LhwnX5uhz3bOo2Yxt4Ef71qP36Ol4T4WXbvHf4ZceNNbvIsNigaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7RAWveYTMxgdnPEf9KKp37irquek+hrI1myWQxHF6W4=; b=Y0nw0PMwyHtLYExZQxqFFjA4Yw
 nI23law9+7fGA1AkriJl5FSXCMwqXErml6gHf8TW6OVTquRPqUl7bnnZ9tOjD4IO8jqxC+d0yj+JD
 lSjajwPfqALAyTwwhy6laB/NMqj48vaFx0Kjp6iQgCwPSca5xSJWpPS2b/9aEre6npkY=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPQto-0000MO-Io
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 14:23:57 +0000
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 12PEMsvK022736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 10:22:54 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 3E0E615C39CC; Thu, 25 Mar 2021 10:22:54 -0400 (EDT)
Date: Thu, 25 Mar 2021 10:22:54 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Message-ID: <YFycvk4aMoPAZcwJ@mit.edu>
References: <20210207190425.38107-1-chaitanya.kulkarni@wdc.com>
 <20210207190425.38107-7-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210207190425.38107-7-chaitanya.kulkarni@wdc.com>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wdc.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [18.9.28.11 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lPQto-0000MO-Io
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
 bvanassche@acm.org, hch@infradead.org, johannes.thumshirn@wdc.com,
 dave.hansen@intel.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 dongli.zhang@oracle.com, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 dsterba@suse.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Feb 07, 2021 at 11:04:23AM -0800, Chaitanya Kulkarni wrote:
> Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
> ---
>  fs/ext4/verity.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Hi, were you expecting to have file system maintainers take these
patches into their own trees?  The ext4 patches look good, and unless
you have any objections, I can take them through the ext4 tree.

Thanks,

    	     		       	    - Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
