Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F11AD211
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 04:57:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i79rr-0003jh-L6; Mon, 09 Sep 2019 02:57:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i79rn-0003jR-HX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 02:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTjbsdu48kEZ/NZ28Jjjwl2gN/xJIiALrBEUTGV6CTY=; b=az8l3n4mPzJrJIysO6v06HgwGW
 5ZzPMrhMUjKcQKjUEJR2CrlmSgBpHXMov6mIXFdNdBL6EhRUvK54faAtzfezVUSB43BpgvWiSSnUT
 bFpV2sAmZ3GLjJIXoZGIF38h7R9pbKXMznr136wYgCyXqxFnRum5I0OeRD82ajvunOx4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTjbsdu48kEZ/NZ28Jjjwl2gN/xJIiALrBEUTGV6CTY=; b=EMy5LnrxOHg5UaLFzGbduGfZPr
 WB+DQrq1oONAlL6aEMrKZhUCciiyNtv6yaiapNh906uquP64FLVUHS6MIbSrwD5cMmfkYi8HbeJPq
 h5p+Das/FBJE0WvEJSNex00LPbmMbwowKDr6BDG3TeFrzkh4NGBYc1S/Yvtz592tTJnY=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i79rj-005CCq-BH
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 02:57:21 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3F5596BA153CDAEA09DD;
 Mon,  9 Sep 2019 10:57:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 9 Sep 2019
 10:57:09 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <69933b7f-48cc-47f9-ba6f-b5ca8f733cba@huawei.com>
Date: Mon, 9 Sep 2019 10:56:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190909012532.20454-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1i79rj-005CCq-BH
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right
 again
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2019/9/9 9:25, Jaegeuk Kim wrote:
> GC must avoid select the same victim again.

Blocks in previous victim will occupy addition free segment, I doubt after this
change, FGGC may encounter out-of-free space issue more frequently.

Thanks,

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/gc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index e88f98ddf396..15ca8bbb0b22 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -274,6 +274,9 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
>  static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
>  			unsigned int segno, struct victim_sel_policy *p)
>  {
> +	if (sbi->cur_victim_sec == GET_SEC_FROM_SEG(sbi, segno))
> +		return UINT_MAX;
> +
>  	if (p->alloc_mode == SSR)
>  		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
>  
> @@ -1326,9 +1329,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>  		round++;
>  	}
>  
> -	if (gc_type == FG_GC)
> -		sbi->cur_victim_sec = NULL_SEGNO;
> -
>  	if (sync)
>  		goto stop;
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
