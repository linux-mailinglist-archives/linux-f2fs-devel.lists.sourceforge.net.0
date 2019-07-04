Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D15A45F0F4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2019 03:24:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiqTV-0001Nf-Rb; Thu, 04 Jul 2019 01:23:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunqiuyang@huawei.com>) id 1hiqTV-0001NW-3w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 01:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=585T6/nrQB2eDBJb+9Ex0POq5BSB9Monn538KcazqmA=; b=Y+cXKir9YCGBfBZ5pGX8sPRPWz
 4M2N6AdzqNFKK63SdjBN8gTtTSTldlRhdkL6l0YWwCy+UW233yxIw3NY1VwZellRfmAh9aCdm3RO6
 z7PrP3t2KDBYaTr+cTs8ZQY7uEhAMecS/SG9hJu6zvcEIry9zOuDnR2WNrnK6rZ8D/Us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=585T6/nrQB2eDBJb+9Ex0POq5BSB9Monn538KcazqmA=; b=E9kl6oMs33mauo5MuZnXi2or3p
 oY3HJrGCVP7avhI636tOzneNUSf5wWUmpS/Ahoz10k5obONNQ0nEVglIwbwZhQQ1dFgKj+snCnYXY
 NWO/HR4UoIm76LomIdK6j55eTkFnl8e7VkkW/utL92bsOEybSJYqL1iOlxIE6WReHg+0=;
Received: from szxga03-in.huawei.com ([45.249.212.189] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiqTa-0050md-5q
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 01:23:58 +0000
Received: from DGGEML404-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id C9C96B3B7707C929353A;
 Thu,  4 Jul 2019 09:23:46 +0800 (CST)
Received: from DGGEML421-HUB.china.huawei.com (10.1.199.38) by
 DGGEML404-HUB.china.huawei.com (10.3.17.39) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 4 Jul 2019 09:23:46 +0800
Received: from DGGEML512-MBX.china.huawei.com ([169.254.2.81]) by
 dggeml421-hub.china.huawei.com ([10.1.199.38]) with mapi id 14.03.0439.000;
 Thu, 4 Jul 2019 09:23:36 +0800
From: sunqiuyang <sunqiuyang@huawei.com>
To: "Yuchao (T)" <yuchao0@huawei.com>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
Thread-Topic: [PATCH 1/1] fsck.f2fs: allow to fix inconsistency from online
 resize
Thread-Index: AQHVMKc6n8o46P81sEKZ7h6d+l1u6aa36dOAgAHC7F4=
Date: Thu, 4 Jul 2019 01:23:35 +0000
Message-ID: <157FC541501A9C4C862B2F16FFE316DC19045BD9@dggeml512-mbx.china.huawei.com>
References: <20190702074201.34869-1-sunqiuyang@huawei.com>,
 <cec45be3-7a2a-9e12-9eb0-84a987911307@huawei.com>
In-Reply-To: <cec45be3-7a2a-9e12-9eb0-84a987911307@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.249.127]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hiqTa-0050md-5q
Subject: Re: [f2fs-dev] [PATCH 1/1] fsck.f2fs: allow to fix inconsistency
 from online resize
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
Cc: "fangwei \(I\)" <fangwei1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

A quick comment: if cp.user_block_count is corrupted due to resize failure, then cp.free_segment_count will also be corrupted. Then in fsck_verify(), we will find the check "free segment_count matched with CP" fails, and still call fix_checkpoint() later.

Thanks,
________________________________________
From: Yuchao (T)
Sent: Wednesday, July 03, 2019 14:29
To: sunqiuyang; linux-f2fs-devel@lists.sourceforge.net; jaegeuk@kernel.org
Cc: fangwei (I)
Subject: Re: [PATCH 1/1] fsck.f2fs: allow to fix inconsistency from online resize

On 2019/7/2 15:42, sunqiuyang wrote:
> From: Qiuyang Sun <sunqiuyang@huawei.com>
>
> During F2FS online resize, if panic or poweroff happens when the new SB
> has been committed but not the new CP, the FS may end up with an
> inconsistent state, where user_block_count and free_segment_count in CP
> can be larger than allowed by the new SB.
>
> This patch allows fsck.f2fs to fix such inconsistency.
>
> Signed-off-by: Qiuyang Sun <sunqiuyang@huawei.com>
> ---
>  fsck/fsck.c  | 2 ++
>  fsck/mount.c | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fsck/fsck.c b/fsck/fsck.c
> index 6f0f262..66eb53c 100644
> --- a/fsck/fsck.c
> +++ b/fsck/fsck.c
> @@ -2083,6 +2083,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
>       set_cp(valid_block_count, fsck->chk.valid_blk_cnt);
>       set_cp(valid_node_count, fsck->chk.valid_node_cnt);
>       set_cp(valid_inode_count, fsck->chk.valid_inode_cnt);
> +     set_cp(user_block_count, (uint64_t)(get_sb(segment_count_main) -
> +                     get_cp(overprov_segment_count)) * c.blks_per_seg);
>
>       crc = f2fs_checkpoint_chksum(cp);
>       *((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
> diff --git a/fsck/mount.c b/fsck/mount.c
> index aecd0cd..81ab660 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -953,7 +953,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
>       segment_count_main = get_sb(segment_count_main);
>       log_blocks_per_seg = get_sb(log_blocks_per_seg);
>       if (!user_block_count || user_block_count >=
> -                     segment_count_main << log_blocks_per_seg) {
> +                     c.total_sectors / c.sectors_per_blk) {

This breaks the previous consistency check, then cp.user_block_count could still
be corrupted due to we won't call fix_checkpoint later.

Other concern is if user upgrade kernel only, with low version of fsck, user
can't repair image suffering power-cut during online resizing, so I wonder that
is there a way to find such inconsistency and give a hint to user that which
version of fsck can repair such corruption.

Thanks,

>               MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
>               return 1;
>       }
>

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
