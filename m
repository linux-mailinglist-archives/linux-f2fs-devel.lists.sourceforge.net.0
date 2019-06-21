Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AE04E53A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jun 2019 11:58:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1heGJq-0000Gb-MN; Fri, 21 Jun 2019 09:58:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1heGJc-0000D2-Oc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NSe7F5KSTdwgm5UQVnwnYN2H3zjXGshpCO/uwCjc9ks=; b=G74SMZmhrlGtNgP4T5d8o/fLHf
 +fWKttM8TKYD+ydfwVhHfBERBYyvClGZwrOnon+3gRx8fs8m8c8i7AZHoUh0qIrt9/FCN61kXBuEI
 9qIGzIEqSY+maY0KCh7izc1xEMMw1kVIPP0G2LSXfY2cxqQ7SJiyzM6YoV060bwYrLFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NSe7F5KSTdwgm5UQVnwnYN2H3zjXGshpCO/uwCjc9ks=; b=Eig59H6VpNHvnIb2Zv6UbXG8ni
 Sxhko0MmJf7XfyaiNLhH98ljTmQWUB20JyB4FKEn33DHZ7nrfFBzkDssAtR60u7AJlFMssdFlmgl3
 dy0bPzHx1zuzy4gY1YM/sDjIR3JEDaGUpeKSPb6KTafREaqWH7Ay+0DGpDLvHR7ELDXw=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1heGJe-007D5s-K8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Jun 2019 09:58:44 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 173B27541006DC4FEB6F;
 Fri, 21 Jun 2019 17:58:35 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 21 Jun
 2019 17:58:31 +0800
To: Geert Uytterhoeven <geert@linux-m68k.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190620144208.28151-1-geert@linux-m68k.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <39883399-6a4d-7b61-5b8a-d5e39790c769@huawei.com>
Date: Fri, 21 Jun 2019 17:58:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190620144208.28151-1-geert@linux-m68k.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linux-m68k.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1heGJe-007D5s-K8
Subject: Re: [f2fs-dev] [PATCH] fsf2: Use DIV_ROUND_UP() instead of
 open-coding
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

fsf2: Use DIV_ROUND_UP() instead of open-coding

fsf2 -> f2fs

Otherwise, it looks good to me.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

On 2019/6/20 22:42, Geert Uytterhoeven wrote:
> Replace the open-coded divisions with round-up by calls to the
> DIV_ROUND_UP() helper macro.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  fs/f2fs/f2fs.h    | 4 ++--
>  fs/f2fs/file.c    | 6 +++---
>  fs/f2fs/segment.h | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 9afe15675dbbd369..52f477eaaee93bc3 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -480,8 +480,8 @@ static inline int get_inline_xattr_addrs(struct inode *inode);
>  #define NR_INLINE_DENTRY(inode)	(MAX_INLINE_DATA(inode) * BITS_PER_BYTE / \
>  				((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * \
>  				BITS_PER_BYTE + 1))
> -#define INLINE_DENTRY_BITMAP_SIZE(inode)	((NR_INLINE_DENTRY(inode) + \
> -					BITS_PER_BYTE - 1) / BITS_PER_BYTE)
> +#define INLINE_DENTRY_BITMAP_SIZE(inode) \
> +	DIV_ROUND_UP(NR_INLINE_DENTRY(inode), BITS_PER_BYTE)
>  #define INLINE_RESERVED_SIZE(inode)	(MAX_INLINE_DATA(inode) - \
>  				((SIZE_OF_DIR_ENTRY + F2FS_SLOT_LEN) * \
>  				NR_INLINE_DENTRY(inode) + \
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 1180eca879331eba..fc00d8bdc31c18b0 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -1211,7 +1211,7 @@ static int __exchange_data_block(struct inode *src_inode,
>  static int f2fs_do_collapse(struct inode *inode, loff_t offset, loff_t len)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> -	pgoff_t nrpages = (i_size_read(inode) + PAGE_SIZE - 1) / PAGE_SIZE;
> +	pgoff_t nrpages = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>  	pgoff_t start = offset >> PAGE_SHIFT;
>  	pgoff_t end = (offset + len) >> PAGE_SHIFT;
>  	int ret;
> @@ -1464,7 +1464,7 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
>  	pg_start = offset >> PAGE_SHIFT;
>  	pg_end = (offset + len) >> PAGE_SHIFT;
>  	delta = pg_end - pg_start;
> -	idx = (i_size_read(inode) + PAGE_SIZE - 1) / PAGE_SIZE;
> +	idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
>  
>  	/* avoid gc operation during block exchange */
>  	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> @@ -2362,7 +2362,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>  	if (!fragmented)
>  		goto out;
>  
> -	sec_num = (total + BLKS_PER_SEC(sbi) - 1) / BLKS_PER_SEC(sbi);
> +	sec_num = DIV_ROUND_UP(total, BLKS_PER_SEC(sbi));
>  
>  	/*
>  	 * make sure there are enough free section for LFS allocation, this can
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 166ac0f07a4e472d..2ae6df03b9982d12 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -109,7 +109,7 @@
>  #define	START_SEGNO(segno)		\
>  	(SIT_BLOCK_OFFSET(segno) * SIT_ENTRY_PER_BLOCK)
>  #define SIT_BLK_CNT(sbi)			\
> -	((MAIN_SEGS(sbi) + SIT_ENTRY_PER_BLOCK - 1) / SIT_ENTRY_PER_BLOCK)
> +	DIV_ROUND_UP(MAIN_SEGS(sbi), SIT_ENTRY_PER_BLOCK)
>  #define f2fs_bitmap_size(nr)			\
>  	(BITS_TO_LONGS(nr) * sizeof(unsigned long))
>  
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
