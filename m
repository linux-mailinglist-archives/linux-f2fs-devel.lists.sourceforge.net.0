Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F154D23B325
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Aug 2020 05:01:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k2nCh-0002n9-82; Tue, 04 Aug 2020 03:01:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k2nCf-0002n2-Qb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 03:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JAdZVoXiZIp+XKaOGvc0G4RamvIwo6Ui02fr76wrrco=; b=T7mVvZi8E72ZJCjN9GZLBQhyqN
 IQAuvjfDdcyOvur/BV0GUjbX1WsPP4NWlNmMO8lDfB5EyBcpaa1UDruRU9ZWkA293DFth1pXD3BLO
 yqkr3AMz+6E6z8bkxLk6fwk8MZQ0KC0JElxqHZGlR+vNvPq8XE4UTHMHZk0+h44y5JFE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JAdZVoXiZIp+XKaOGvc0G4RamvIwo6Ui02fr76wrrco=; b=MBAtL9hPF2NobVDJpd39IqkHQW
 D11oZStLTs7nCu0iItDKwiXiaiR7tdMfr5SReKPpom1IJSj20p5xudHzNxW7ocbzY/9ZO0oElnFNp
 RqYNcLToPZ6Tm/RS5Wu5YGzDriyBNLO5oQe59FxzM56YEWMDXIWuBxxddg4OzrD0SWAA=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k2nCe-00BITb-Jw
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Aug 2020 03:01:25 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5090750F53C9FB1E9DF8;
 Tue,  4 Aug 2020 11:01:17 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 4 Aug 2020
 11:01:10 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200729070244.584518-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <670f35e1-872b-6602-320c-dd73bcb62510@huawei.com>
Date: Tue, 4 Aug 2020 11:01:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200729070244.584518-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k2nCe-00BITb-Jw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix deadlock between quota writes and
 checkpoint
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

On 2020/7/29 15:02, Jaegeuk Kim wrote:
> f2fs_write_data_pages(quota_mapping)
>   __f2fs_write_data_pages             f2fs_write_checkpoint
>    * blk_start_plug(&plug);
>    * add bio in write_io[DATA]
>                                        - block_operations
>                                        - skip syncing quota by
>                                                  >DEFAULT_RETRY_QUOTA_FLUSH_COUNT
>                                        - down_write(&sbi->node_write);

f2fs_flush_merged_writes() will be called after block_operations(), why this doesn't
help?

>    - f2fs_write_single_data_page
>      - f2fs_do_write_data_page
>        - f2fs_outplace_write_data
>          - do_write_page
>             - f2fs_allocate_data_block
>              - down_write(node_write)
>                                        - f2fs_wait_on_all_pages(F2FS_WB_CP_DATA);
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/checkpoint.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 8c782d3f324f0..99c8061da55b9 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1269,6 +1269,8 @@ void f2fs_wait_on_all_pages(struct f2fs_sb_info *sbi, int type)
>   		if (type == F2FS_DIRTY_META)
>   			f2fs_sync_meta_pages(sbi, META, LONG_MAX,
>   							FS_CP_META_IO);
> +		else if (type == F2FS_WB_CP_DATA)
> +			f2fs_submit_merged_write(sbi, DATA);
>   		io_schedule_timeout(DEFAULT_IO_TIMEOUT);
>   	}
>   	finish_wait(&sbi->cp_wait, &wait);
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
