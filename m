Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0478918EE4A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 03:59:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGDJ1-00062m-Dk; Mon, 23 Mar 2020 02:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <joe@perches.com>) id 1jGDIz-00062f-W4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7Lr3jPNRn0LnNdBa8agBUYE0oFz+Isc72DncbL978Xw=; b=V5JISc+kOEMfrGshTp0zo/r+V8
 qtVoU9QS7VsugjEV5Ur6HYw6Kk/UnviTxTFQyrCZnaeWky9ebsS9iUn6BEDa2L616Iq+j604ZyXLe
 Gvi989VBY1KUI1IDB42gZrylTUlVBBo+PxD0G7ofOG0qTHozK6bwPV21dvKFyYKlTRM4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Lr3jPNRn0LnNdBa8agBUYE0oFz+Isc72DncbL978Xw=; b=AU5pq8HpETzww7VqGsDdc5QIFb
 NcBc3VnvTjYOG57TVErAVsZCNoDoFq3ieG+ymN1oKayANvy48Xi5iiD6ckpCC195Rgo4JoyQRLNar
 rs5eeZlYGg+plsjBChQGiTM7RaAfJsmHOO61mhRKkf3Phf8s7/V55A8Oj4gDhVnm3v1A=;
Received: from smtprelay0026.hostedemail.com ([216.40.44.26]
 helo=smtprelay.hostedemail.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGDIv-000Q9w-EH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 02:59:09 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id BCE4E1802926E;
 Mon, 23 Mar 2020 02:58:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:41:355:379:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:2901:3138:3139:3140:3141:3142:3353:3622:3865:3866:3867:3868:3870:3871:3872:4321:5007:6119:7903:8603:10004:10400:10848:11026:11473:11658:11914:12295:12297:12740:12760:12895:13069:13138:13231:13311:13357:13439:14659:14721:21080:21451:21627:21796:30036:30054:30090:30091,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Custom_rules:0:0:0,
 LFtime:1, LUA_SUMMARY:none
X-HE-Tag: foot07_314bb36a3e01d
X-Filterd-Recvd-Size: 2428
Received: from XPS-9350.home (unknown [47.151.136.130])
 (Authenticated sender: joe@perches.com)
 by omf08.hostedemail.com (Postfix) with ESMTPA;
 Mon, 23 Mar 2020 02:58:58 +0000 (UTC)
Message-ID: <8d435607bd79f518bd9420d68894ddda521bac5a.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
Date: Sun, 22 Mar 2020 19:57:09 -0700
In-Reply-To: <20200323024109.60967-1-yuchao0@huawei.com>
References: <20200323024109.60967-1-yuchao0@huawei.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [216.40.44.26 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [216.40.44.26 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGDIv-000Q9w-EH
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix potential .flags overflow on
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

On Mon, 2020-03-23 at 10:41 +0800, Chao Yu wrote:
> f2fs_inode_info.flags is unsigned long variable, it has 32 bits
> in 32bit architecture, since we introduced FI_MMAP_FILE flag
> when we support data compression, we may access memory cross
> the border of .flags field, corrupting .i_sem field, result in
> below deadlock.
[]
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
[]
> @@ -682,6 +682,47 @@ enum {
[]
> +/* used for f2fs_inode_info->flags */
> +enum {
[]
> +	FI_MAX,			/* max flag, never be used */
> +};
> +
> +/* f2fs_inode_info.flags array size */
> +#define FI_ARRAY_SIZE		(BITS_TO_LONGS(FI_MAX))

Perhaps FI_ARRAY_SIZE isn't necessary.

> +
>  struct f2fs_inode_info {
>  	struct inode vfs_inode;		/* serve a vfs inode */
>  	unsigned long i_flags;		/* keep an inode flags for ioctl */
> @@ -694,7 +735,7 @@ struct f2fs_inode_info {
>  	umode_t i_acl_mode;		/* keep file acl mode temporarily */
>  
>  	/* Use below internally in f2fs*/
> -	unsigned long flags;		/* use to pass per-file flags */
> +	unsigned long flags[FI_ARRAY_SIZE];	/* use to pass per-file flags */

and BITS_TO_LONGS should be used here.

> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
[]
> @@ -362,7 +363,8 @@ static int do_read_inode(struct inode *inode)
>  	fi->i_flags = le32_to_cpu(ri->i_flags);
>  	if (S_ISREG(inode->i_mode))
>  		fi->i_flags &= ~F2FS_PROJINHERIT_FL;
> -	fi->flags = 0;
> +	for (i = 0; i < FI_ARRAY_SIZE; i++)
> +		fi->flags[i] = 0;

And this could become

	bitmap_zero(fi->flags, BITS_TO_LONG(FI_MAX));

Is FI_ARRAY_SIZE used anywhere else?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
