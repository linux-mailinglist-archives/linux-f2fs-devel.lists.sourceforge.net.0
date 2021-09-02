Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCEE3FF826
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Sep 2021 01:58:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mLwaf-0001Om-SW; Thu, 02 Sep 2021 23:57:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mLwae-0001Oe-3L
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Sep 2021 23:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0b4HhATCZi6jAYbELw7XRSYG/ZtkgDvtGKHPcR98B8I=; b=F5JWSSDJV1CCxwMypcpnuzmTPz
 62wZz5sh1GMrduvid8/+9OAnnFuVdCQXpAL5daIVO3YVtVHy3BA4Kjrud0JkFeRR1Nj7aMvPvO5yN
 0oLi5NJ1Pw8jGJpGWuPg0xccFbLjkz0+R9xR35etx6pB9Z/q4MfHotimDHLY5EVYuHs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0b4HhATCZi6jAYbELw7XRSYG/ZtkgDvtGKHPcR98B8I=; b=QgrmA75BysN7Vu1IHmPOU1neXR
 30felPKGet2zUz9mxKSwLNx7He2j20hfs48l2mh3iDdc3knL0C5L4Kh/1EcrBGGWCSV3hfvg1tHBM
 AzcQFs9tZZ6lH8Av9dnFHS6S+yjG0b6Nj+2mDOzRIptFew4dB5C5k/udDO+l/dDrbQLo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mLwab-0006Un-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Sep 2021 23:57:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAC9861053;
 Thu,  2 Sep 2021 23:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630627059;
 bh=99fHBy+T4K/mLQGDUtNtGh+nM1zfP3QWsKjosICZFrE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eqU0fedD54QHOyuaINSODjXbVG0NaNgqeOg3QZxtWr6oqLPlevyqizlfn0GJg4GoU
 O0E2kRc8DEvnzwUM+x8sq+KMY2XNMmLmyNJS0B45Hm/6IZ05QU7ijl+NqPeZY2JrSu
 fidkF6W1XwEJfO8wJ5s2P8KvKFaeY6/lhgPdEFHagSatrY1RLsfezF/MIUTFGRTEJv
 ZDk658AZDCqNCLgfM3bysTBBjF3VcTZ0XLGg1ZIcouWlS2sPh67pVCfdpgiMZdyxMs
 B1Z8WGprIt4gD9Wy06heBB9e4MXM+qSerl/HRySDst+99dsPgpQqlQdZPD10V/+Z6v
 Lip+UhPCQtD/g==
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20210902172404.3517626-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <9ab17089-accc-c3a3-a5dc-007fc4eeaa20@kernel.org>
Date: Fri, 3 Sep 2021 07:57:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902172404.3517626-1-daeho43@gmail.com>
Content-Language: en-US
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mLwab-0006Un-Ay
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: introduce fragment allocation mode
 mount option
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/3 1:24, Daeho Jeong wrote:
> @@ -2630,6 +2631,8 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
>   	unsigned short seg_type = curseg->seg_type;
>   
>   	sanity_check_seg_type(sbi, seg_type);
> +	if (f2fs_need_rand_seg(sbi))
> +		return prandom_u32() % (MAIN_SECS(sbi) * sbi->segs_per_sec);

	if (f2fs_need_seq_seg(sbi))
		return 0;

static inline bool f2fs_need_seq_seg(struct f2fs_sb_info *sbi)
{
	return F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_FIXED_BLK;
}

> @@ -2707,12 +2715,29 @@ static int __next_free_blkoff(struct f2fs_sb_info *sbi,
>   static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
>   				struct curseg_info *seg)
>   {
> -	if (seg->alloc_type == SSR)
> +	if (seg->alloc_type == SSR) {
>   		seg->next_blkoff =
>   			__next_free_blkoff(sbi, seg->segno,
>   						seg->next_blkoff + 1);
> -	else
> +	} else {
>   		seg->next_blkoff++;
> +		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_FIXED_BLK) {
> +			if (--seg->fragment_remained_chunk <= 0) {
> +				seg->fragment_remained_chunk =
> +				   sbi->fragment_chunk_size;
> +				seg->next_blkoff +=
> +				   sbi->fragment_hole_size;

One more concern... we'd better to save fragment_remained_hole as well
as fragment_remained_chunk,  otherwise, if fragment_chunk_size +
fragment_hole_size > 512, fragment hole will be truncated to 512 -
fragment_chunk_size due to we won't create hole with enough size as
seg->next_blkoff has crossed end of current segment.

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
