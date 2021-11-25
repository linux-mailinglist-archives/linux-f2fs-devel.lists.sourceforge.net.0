Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 600E745DD1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Nov 2021 16:15:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqGT3-0004tC-O8; Thu, 25 Nov 2021 15:15:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mqGT2-0004sQ-Hr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Nov 2021 15:15:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SmClU5hhMC7JMr/9aqK2whgnNi4dWDwvWkATL81YZdk=; b=EojjfCZ70dDcQ6Ae5QCeUAJtuu
 NJIQqX7nxZ4V6AjJqocCk3DKJr9sj1lRVDTroJ7zZGqHAerzXabNpWA4dkosHqEitCKxKT58qtNcC
 yA+bkuhP75WRhxl2/DzUdJakcfPAoyMhGORkdDgQrzmamV3pT9SqPNc7abE6MdK96ToQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SmClU5hhMC7JMr/9aqK2whgnNi4dWDwvWkATL81YZdk=; b=crUUzs1CJhowiU/JbY5COVVkp1
 H+CxSimV+UMsZNy6gEAA1bXpFfNSDFvKOoiqMyWrvBiLs7+bZOS1Sp1XxtiW88/LyAgwRo5feDZNL
 SBtERI2p45RW0WOuhBb6sosp7LXWpBDQOnIumKIwo9PF1yxnepk8JA77os6pPdZxopXc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqGT1-008w4H-SV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Nov 2021 15:15:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C9631610A2;
 Thu, 25 Nov 2021 15:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637853314;
 bh=3HNOeBiQfWyuXjbDErrrUKYCERzF1Z/NjdNMWKsi/Uw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EOgnULI6mgV5+eF7qra8jxY4CRA0gpWKoUWOqdGTnFoaGMHAVDcUCzgg4IsnpQyUp
 sYIPHifGpz24KeTJzFo+8zn3urJ6R4GlwM8rqSLZysZXeitlTwaodiDD2VP8H/i+78
 vXJ299zgd2FTBo2lshGvwoGWJWRe4+OvaIr/Py8tVFpJ0BgVSGpCVXg1TtxZGkhQ3e
 6vdKPPJGQYcCKzNPtnuOdcwZZSl7HbFU03YSb8CiAzZ1ObIfYHAa9ICUBYe6/bKmrI
 tmsPPmRTyyXX2EaHa4Gaytasad5n4aXYrS46EvdHR5Pt6DII7a1LBWwY2Uwf9X5mZZ
 TsJv1mz+419dg==
Message-ID: <fffa6f82-22a9-b19d-5bc2-2e79fd1820b7@kernel.org>
Date: Thu, 25 Nov 2021 23:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-US
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org
References: <20211124083929.259433-1-changfengnan@vivo.com>
 <20211124083929.259433-2-changfengnan@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20211124083929.259433-2-changfengnan@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/24 16:39, Fengnan Chang wrote: > Previously,
 compressed
 page cache drop when clean page cache, but > POSIX_FADV_DONTNEED can't clean
 compressed page cache, this commit > try to support it. [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mqGT1-008w4H-SV
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/24 16:39, Fengnan Chang wrote:
> Previously, compressed page cache drop when clean page cache, but
> POSIX_FADV_DONTNEED can't clean compressed page cache, this commit
> try to support it.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
> ---
>   fs/f2fs/compress.c | 10 ++++++++--
>   fs/f2fs/f2fs.h     |  7 ++++---
>   2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index fb9e5149af5d..7ec5e3c2590b 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -842,7 +842,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
>   		WRITE_ONCE(dic->failed, true);
>   	else if (blkaddr)
>   		f2fs_cache_compressed_page(sbi, page,
> -					dic->inode->i_ino, blkaddr);
> +					dic, blkaddr);
>   
>   	if (atomic_dec_and_test(&dic->remaining_pages))
>   		f2fs_decompress_cluster(dic);
> @@ -1659,6 +1659,7 @@ static void f2fs_put_dic(struct decompress_io_ctx *dic)
>   static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
>   {
>   	int i;
> +	nid_t ino = dic->inode->i_ino;
>   
>   	for (i = 0; i < dic->cluster_size; i++) {
>   		struct page *rpage = dic->rpages[i];
> @@ -1666,6 +1667,9 @@ static void __f2fs_decompress_end_io(struct decompress_io_ctx *dic, bool failed)
>   		if (!rpage)
>   			continue;
>   
> +		if (dic->cpage_cached)
> +			set_page_private_data(rpage, ino);

I didn't get the point, why should we set ino into raw page's private field?

Thanks,

> +
>   		/* PG_error was set if verity failed. */
>   		if (failed || PageError(rpage)) {
>   			ClearPageUptodate(rpage);
> @@ -1772,10 +1776,11 @@ void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr)
>   }
>   
>   void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> -						nid_t ino, block_t blkaddr)
> +				struct decompress_io_ctx *dic, block_t blkaddr)
>   {
>   	struct page *cpage;
>   	int ret;
> +	nid_t ino = dic->inode->i_ino;
>   
>   	if (!test_opt(sbi, COMPRESS_CACHE))
>   		return;
> @@ -1804,6 +1809,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>   	}
>   
>   	set_page_private_data(cpage, ino);
> +	dic->cpage_cached = true;
>   
>   	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE_READ))
>   		goto out;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ac6dda6c4c5a..128190b0c737 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1551,6 +1551,7 @@ struct decompress_io_ctx {
>   	 */
>   	refcount_t refcnt;
>   
> +	bool cpage_cached;		/* indicate cpages cached in compress mapping*/
>   	bool failed;			/* IO error occurred before decompression? */
>   	bool need_verity;		/* need fs-verity verification after decompression? */
>   	void *private;			/* payload buffer for specified decompression algorithm */
> @@ -4085,7 +4086,7 @@ void f2fs_destroy_compress_cache(void);
>   struct address_space *COMPRESS_MAPPING(struct f2fs_sb_info *sbi);
>   void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi, block_t blkaddr);
>   void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> -						nid_t ino, block_t blkaddr);
> +				struct decompress_io_ctx *dic, block_t blkaddr);
>   bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
>   								block_t blkaddr);
>   void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi, nid_t ino);
> @@ -4137,8 +4138,8 @@ static inline int __init f2fs_init_compress_cache(void) { return 0; }
>   static inline void f2fs_destroy_compress_cache(void) { }
>   static inline void f2fs_invalidate_compress_page(struct f2fs_sb_info *sbi,
>   				block_t blkaddr) { }
> -static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
> -				struct page *page, nid_t ino, block_t blkaddr) { }
> +static inline void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
> +				struct decompress_io_ctx *dic, block_t blkaddr) { }
>   static inline bool f2fs_load_compressed_page(struct f2fs_sb_info *sbi,
>   				struct page *page, block_t blkaddr) { return false; }
>   static inline void f2fs_invalidate_compress_pages(struct f2fs_sb_info *sbi,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
