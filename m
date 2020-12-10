Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 534AF2D506F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Dec 2020 02:46:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1knB2i-0003BW-F2; Thu, 10 Dec 2020 01:46:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1knB2g-0003BO-TR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 01:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WCkRFspRa+zESagNM5S8wPUu1yhnCpKPAprrAw9lfp8=; b=fG/kqV4Op9v0vrvkxTi1CZnA4f
 02fqcwuLL2Ud7YZKrZhAmQD1l1PZf8cQ9RuKGLdOH05L1E6EnZlrRSBv2+7VY3UQX/2VVWpW3epSi
 6VS/QCWxQaix1BobkdQAZWFvhcZsrnTKqLcEbTm4548OTxeMWGLNuhm951yk2QlZbe3A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WCkRFspRa+zESagNM5S8wPUu1yhnCpKPAprrAw9lfp8=; b=Uk8LpPr98yIFuIwWL2lg0Va5ft
 5y7o9GD+Dr4FgCdTv87YB6QY6X1YfCGSvRy1vam0XvssFVD2UFNAkjwhGjoqV9oPYEL6MjiS0Yu8e
 tTAG/FGtB0+LmexpQ2wjWnZWXDjgSUEk+bWWBDpCozFzhZsFbsOJg8go0f/JXQBoP8Do=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1knB2b-005ngg-KQ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Dec 2020 01:46:50 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Crxb11h04zhq60;
 Thu, 10 Dec 2020 09:46:05 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 10 Dec
 2020 09:46:33 +0800
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
References: <20201209181322.27932-1-anant.thazhemadam@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <9e38608c-9fc3-1f94-d275-742facef3db3@huawei.com>
Date: Thu, 10 Dec 2020 09:46:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201209181322.27932-1-anant.thazhemadam@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: appspotmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1knB2b-005ngg-KQ
Subject: Re: [f2fs-dev] [PATCH] fs: f2fs: fix potential shift-out-of-bounds
 error in sanity_check_raw_super()
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Anant,

I've posted a patch a little earlier. :P

https://lore.kernel.org/linux-f2fs-devel/20201209084936.31711-1-yuchao0@huawei.com/T/#u

Thanks,

On 2020/12/10 2:13, Anant Thazhemadam wrote:
> In sanity_check_raw_super(), if
> 1 << le32_to_cpu(raw_super->log_blocksize) != F2FS_BLKSIZE, then the
> block size is deemed to be invalid.
> 
> syzbot triggered a shift-out-of-bounds bug by assigning a value of 59 to
> le32_to_cpu(raw_super->log_blocksize).
> Although the value assigned itself isn't of much significance, this goes
> to show that even if the block size is invalid,
> le32_to_cpu(raw_super->log_blocksize) can be potentially evaluated to a
> value for which the shift exponent becomes too large for the unsigned
> int.
> 
> Since 1 << le32_to_cpu(raw_super->log_blocksize) must be = 4096 for a
> valid block size, le32_to_cpu(raw_super->log_blocksize) must equal 12.
> Replacing the existing check with the more direct sanity check
> resolves this bug.
> 
> Reported-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com
> Tested-by: syzbot+ca9a785f8ac472085994@syzkaller.appspotmail.com
> Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
> ---
>   fs/f2fs/super.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 33808c397580..4bc7372af43f 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -2775,7 +2775,6 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>   	block_t total_sections, blocks_per_seg;
>   	struct f2fs_super_block *raw_super = (struct f2fs_super_block *)
>   					(bh->b_data + F2FS_SUPER_OFFSET);
> -	unsigned int blocksize;
>   	size_t crc_offset = 0;
>   	__u32 crc = 0;
>   
> @@ -2802,10 +2801,8 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>   	}
>   
>   	/* Currently, support only 4KB block size */
> -	blocksize = 1 << le32_to_cpu(raw_super->log_blocksize);
> -	if (blocksize != F2FS_BLKSIZE) {
> -		f2fs_info(sbi, "Invalid blocksize (%u), supports only 4KB",
> -			  blocksize);
> +	if (le32_to_cpu(raw_super->log_blocksize) != 12) {
> +		f2fs_info(sbi, "Invalid blocksize. Only 4KB supported");
>   		return -EFSCORRUPTED;
>   	}
>   
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
