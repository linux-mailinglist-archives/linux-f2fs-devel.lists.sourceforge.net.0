Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F032965E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 07:11:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGyFl-0001EB-Lo; Tue, 02 Mar 2021 06:11:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lGyFk-0001E4-5a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 06:11:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0sLQemdTtYEVWSXHSCHtY8Xkz+Xu9nQuH7n+gjbWuZo=; b=FMJn7ugpQSjEAxPwhRqWMxRiz4
 P+S1/PB0b4SrfZp7zLo7zwX9EVc+q42uryChp0IoO5s+WTUuhGV8w19sb6Dg7eLupDcCCaSzjHjMN
 ni5njg3AUkVNGb+6CdxapT2EvFMUGhJlu52rIgBVLqM1p7bUNcfKX5X9MivMAd0+en0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0sLQemdTtYEVWSXHSCHtY8Xkz+Xu9nQuH7n+gjbWuZo=; b=VVVjY6EoocSoGMZcCQlrZ4J/pE
 LAVEzHhNuY6+EK1I2uamQW5HHSiS/LEypERpQpgtYIz5SLvQ2ErZTiCD8VMkgfnLQ8vTKlfRlr7uf
 4fwibWY2plSbx6euxfYw0q3TA1IWe9ravVkBK46BQ1T4g26Qh3COL2UMdCF95VBTubIw=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGyFh-0004wB-26
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 06:11:28 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DqRY56MKpz7sDF;
 Tue,  2 Mar 2021 14:09:29 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.498.0; Tue, 2 Mar 2021
 14:11:07 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
Date: Tue, 2 Mar 2021 14:11:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210302054233.3886681-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lGyFh-0004wB-26
Subject: Re: [f2fs-dev] [PATCH] f2fs: expose # of overprivision segments
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/3/2 13:42, Jaegeuk Kim wrote:
> This is useful when checking conditions during checkpoint=disable in Android.

This sysfs entry is readonly, how about putting this at
/sys/fs/f2fs/<disk>/stat/?

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/sysfs.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index e38a7f6921dd..254b6fa17406 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
>   			(unsigned long long)(free_segments(sbi)));
>   }
>   
> +static ssize_t ovp_segments_show(struct f2fs_attr *a,
> +		struct f2fs_sb_info *sbi, char *buf)
> +{
> +	return sprintf(buf, "%llu\n",
> +			(unsigned long long)(overprovision_segments(sbi)));
> +}
> +
>   static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
>   		struct f2fs_sb_info *sbi, char *buf)
>   {
> @@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
>   F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
>   F2FS_GENERAL_RO_ATTR(dirty_segments);
>   F2FS_GENERAL_RO_ATTR(free_segments);
> +F2FS_GENERAL_RO_ATTR(ovp_segments);

Missed to add document entry in Documentation/ABI/testing/sysfs-fs-f2fs?

Thanks,

>   F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
>   F2FS_GENERAL_RO_ATTR(features);
>   F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
