Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFC718F30C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 11:42:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGKXA-0001Tb-4f; Mon, 23 Mar 2020 10:42:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1jGKX8-0001TK-NC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 10:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CVg2Sx9rAstC32JJ2NrvxjHMCdgYOTJ42VH9vrIERqQ=; b=hC6fhkkvyIVyU1+YiAX5JEl30c
 Nrs4Rn2Fknv2W78V96ysP5Fw+rKIDR1tGJbaLxZVvjQZIXW8qmqCE/+9LzsCwVUQxl5wcPn7IdQgd
 5L/E+SrTjV+e9NuBsRxaxUsVy59DZXkXPmKd5+6m4ljjrPrsTiYUQb87WTRezWrtOrSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CVg2Sx9rAstC32JJ2NrvxjHMCdgYOTJ42VH9vrIERqQ=; b=WOPEmTCMH96mZyis/veaXxs/iz
 JSrECKOHycA674mhAAuCBsAnCEplBxRkO86PNSRPWlZ81UB/yRM03AAz7SaHnaunbLJD1SCEZfhTF
 lqH8xOYakCJipP/XFB4NNtsn/3qGDmxrAjSZyyOqKzR4FiR4Vo76efxmY8LCzcyNFjDc=;
Received: from smtprelay0034.hostedemail.com ([216.40.44.34]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGKX7-000lM3-3g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 10:42:14 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay01.hostedemail.com (Postfix) with ESMTP id 1FBD8100E7B47;
 Mon, 23 Mar 2020 10:42:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:2901:3138:3139:3140:3141:3142:3351:3622:3865:3866:3870:3871:3872:3873:4321:5007:10004:10400:10848:11026:11473:11658:11914:12295:12297:12740:12760:12895:13069:13138:13231:13311:13357:13439:14659:14721:21080:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: spot70_125bc865c5d12
X-Filterd-Recvd-Size: 1557
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Mar 2020 10:42:06 +0000 (UTC)
Message-ID: <afa74570dacebb3b93d4b9c27d6c8a87186cef2d.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
Date: Mon, 23 Mar 2020 03:40:16 -0700
In-Reply-To: <20200323031807.94473-1-yuchao0@huawei.com>
References: <20200323031807.94473-1-yuchao0@huawei.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.34 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGKX7-000lM3-3g
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: fix potential .flags overflow on
 32bit architecture
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, 2020-03-23 at 11:18 +0800, Chao Yu wrote:
> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
> in 32bit architecture, since we introduced FI_MMAP_FILE flag
> when we support data compression, we may access memory cross
> the border of .flags field, corrupting .i_sem field, result in
> below deadlock.
[]
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
[]
> @@ -362,7 +362,7 @@ static int do_read_inode(struct inode *inode)
>  	fi->i_flags = le32_to_cpu(ri->i_flags);
>  	if (S_ISREG(inode->i_mode))
>  		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
> -	fi->flags = 0;
> +	bitmap_zero(fi->flags, BITS_TO_LONGS(FI_MAX));

Sorry, I misled you here, this should be

	bitmap_zero(fi->flags, FI_MAX);




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
