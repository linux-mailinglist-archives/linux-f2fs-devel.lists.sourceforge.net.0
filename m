Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BD118E97C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2020 15:58:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jG23E-0000eC-8I; Sun, 22 Mar 2020 14:58:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1jG237-0000dv-Kp
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 14:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+2ZXRkwqW4xtY6eDH9Bk3rHzI4EbYyHR4X38i/zHbDA=; b=e0/GCoqFb94gKR44muc8Skreum
 bNBrk1Hz72EbTXIwIVIIaRi8ORXEgimE3yRTCS2Npkbl94RlPNfEZ1oMXp0Cf/HDg4Gii61ysYyi3
 CSn6s87+Rc+RKp876nY430mFSuz4hDfAo3JAhLw7BerwRWMOgq5+HVFZjjWLH+idyxxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+2ZXRkwqW4xtY6eDH9Bk3rHzI4EbYyHR4X38i/zHbDA=; b=LooJOQVN0msDkUDPL78KokwUcF
 BijMpN7tIT6Ps3l7AkJQo3FlxEQQiL1raLG0WpgTxujv3v5TieGpl8y9qTQcnyHmeYOj8ipBR+/BY
 8L3xb2m35WA+YtdFRrokVPC/+Ju4WE2NYS9MxhIGWQiibO/YgY6wtrnbr+KGOGpXe1XY=;
Received: from smtprelay0254.hostedemail.com ([216.40.44.254]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jG233-00Clsm-HU
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 14:58:01 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id 8E4F0182CF665;
 Sun, 22 Mar 2020 14:57:50 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:800:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2691:2828:2901:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3870:3871:3872:3873:4321:5007:7576:10004:10400:10848:11026:11232:11473:11658:11914:12043:12295:12296:12297:12740:12760:12895:13069:13138:13231:13311:13357:13439:14181:14659:14721:21080:21627:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: steel34_a211d3b44761
X-Filterd-Recvd-Size: 1815
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Sun, 22 Mar 2020 14:57:49 +0000 (UTC)
Message-ID: <d88cce8ff37f336087899226668abcbcacd96baa.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org
Date: Sun, 22 Mar 2020 07:56:01 -0700
In-Reply-To: <20200322135614.10413-1-chao@kernel.org>
References: <20200322135614.10413-1-chao@kernel.org>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.254 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.254 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jG233-00Clsm-HU
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix potential .flags overflow on
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

On Sun, 2020-03-22 at 21:56 +0800, Chao Yu wrote:
> From: Chao Yu <yuchao0@huawei.com>
> 
> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
> in 32bit architecture, since we introduced FI_MMAP_FILE flag
> when we support data compression, we may access memory cross
> the border of .flags field, corrupting .i_sem field, result in
> below deadlock.
> 
> To fix this issue, let's expand .flags as an array to grab enough
> space to store new flags.
[]
> +static inline void __set_inode_flag(struct inode *inode, int flag)
> +{
> +	if (!test_bit(flag % BITS_PER_LONG,
> +			&F2FS_I(inode)->flags[BIT_WORD(flag)]))
> +		set_bit(flag % BITS_PER_LONG,
> +			&F2FS_I(inode)->flags[BIT_WORD(flag)]);
> +}

I believe you don't need to do anything like this
but just let test_bit and set_bit do the indexing.

	if (!test_bit(flg, F2FS_I(inode->flags)))
		set_bit(flag, F2FS_I(inode->flags));

And there already is a function called test_and_set_bit()




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
