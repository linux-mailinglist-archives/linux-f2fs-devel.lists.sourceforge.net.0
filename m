Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8785DE0F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jul 2019 08:29:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiYlJ-00051Q-4U; Wed, 03 Jul 2019 06:29:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hiYlG-000510-Ps
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 06:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yyGN3QScQOONDARQuRE19xZ9J55QKoCVd+ULNV7mP6I=; b=d6pXj3fWeJq2wffGP+Fubr+bcs
 zpsbYZexgFK9bk/N2l/WISn7yXrJn2hfOhBdVDZEmEYr8YAIVPHDSTbYgSPu5REFTm1rBlZ/sX6OR
 oEC9dWdIAVT5RNPuCNVUvbgu7U+YkN9Pj8nVqfHbT7UusTfiPffCQqAPB8t2MMmPb71Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yyGN3QScQOONDARQuRE19xZ9J55QKoCVd+ULNV7mP6I=; b=gLXxUzAvN04Rg+y9xajJrhCJd8
 G46HcjWR8C4cODATIwJQygppKr93QRInOoka4Dk/YvQm0T1bIVMHSsVB7hv72Jvg6Fj237N0A+YCk
 AKBDzxdNE/ex+c978PA9i9L9K++I6XJIVnxstmhlgQsDHNkOfAsyzOSkiuwscQABRj1Y=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiYlK-006IQJ-P5
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jul 2019 06:29:06 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id E079C9420A1841C14589;
 Wed,  3 Jul 2019 14:28:53 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 3 Jul 2019
 14:28:45 +0800
To: sunqiuyang <sunqiuyang@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>, <jaegeuk@kernel.org>
References: <20190702074201.34869-1-sunqiuyang@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cec45be3-7a2a-9e12-9eb0-84a987911307@huawei.com>
Date: Wed, 3 Jul 2019 14:29:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190702074201.34869-1-sunqiuyang@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
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
X-Headers-End: 1hiYlK-006IQJ-P5
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
Cc: fangwei1@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
>  	set_cp(valid_block_count, fsck->chk.valid_blk_cnt);
>  	set_cp(valid_node_count, fsck->chk.valid_node_cnt);
>  	set_cp(valid_inode_count, fsck->chk.valid_inode_cnt);
> +	set_cp(user_block_count, (uint64_t)(get_sb(segment_count_main) -
> +			get_cp(overprov_segment_count)) * c.blks_per_seg);
>  
>  	crc = f2fs_checkpoint_chksum(cp);
>  	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
> diff --git a/fsck/mount.c b/fsck/mount.c
> index aecd0cd..81ab660 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -953,7 +953,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	segment_count_main = get_sb(segment_count_main);
>  	log_blocks_per_seg = get_sb(log_blocks_per_seg);
>  	if (!user_block_count || user_block_count >=
> -			segment_count_main << log_blocks_per_seg) {
> +			c.total_sectors / c.sectors_per_blk) {

This breaks the previous consistency check, then cp.user_block_count could still
be corrupted due to we won't call fix_checkpoint later.

Other concern is if user upgrade kernel only, with low version of fsck, user
can't repair image suffering power-cut during online resizing, so I wonder that
is there a way to find such inconsistency and give a hint to user that which
version of fsck can repair such corruption.

Thanks,

>  		MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
>  		return 1;
>  	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
