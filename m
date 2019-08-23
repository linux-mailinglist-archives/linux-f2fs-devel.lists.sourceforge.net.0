Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 511BC9A5E1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Aug 2019 05:02:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0zqq-0004ud-4a; Fri, 23 Aug 2019 03:02:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1i0zqo-0004uP-0J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 03:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Scpxi+9kyAUoGtB6rJxTx4ratCG3a+h9bAvxM13wcus=; b=kiayWk8r6gigjFJZX2hnaZIDgh
 cSP38g/CoH1p2fzs9/v6/eoC16DDtDbj/Gz3hYYrkcaHpfUQ9BGHu0Nrv6Fus+as/cgQVhuLSSkT+
 4hhmzRqNT0KAP2LGhDHlu1NRAhA+FMYghV9lRTAWsjcq4BdMji1DleWd16NFi9rgEJdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Scpxi+9kyAUoGtB6rJxTx4ratCG3a+h9bAvxM13wcus=; b=LRQIWJSv40doYv/9SiSg6ZyAfK
 2ZaOpv2KiXO7X9sovz9FedSv70y5Zc0EdYfWum/wNAZC6VZmjMrHf3PyFN4XY/qH3HfiTax1lQqMb
 eRGR49eQbwCOeAjn0XgI9CB0DNOaDhRZ1EDkLBFyVPm++l3Rk0/BY2lDS0n+rZBKFM8k=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0zqm-00Gna9-6M
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 23 Aug 2019 03:02:53 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E9570F33A7B7D70DA2DC;
 Fri, 23 Aug 2019 11:02:44 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 23 Aug
 2019 11:02:42 +0800
To: <jaegeuk@kernel.org>
References: <20190712085542.4068-1-yuchao0@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <28424a84-67aa-c8e9-99c3-475be89206ac@huawei.com>
Date: Fri, 23 Aug 2019 11:02:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190712085542.4068-1-yuchao0@huawei.com>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i0zqm-00Gna9-6M
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: introduce {page,
 io}_is_mergeable() for readability
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

On 2019/7/12 16:55, Chao Yu wrote:
> Wrap merge condition into function for readability, no logic change.
> 
> Signed-off-by: Chao Yu <yuchao0@huawei.com>
> ---
> v2: remove bio validation check in page_is_mergeable().
>  fs/f2fs/data.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 6a8db4abdf5f..f1e401f9fc13 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -482,6 +482,33 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
>  	return 0;
>  }
>  
> +static bool page_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
> +				block_t last_blkaddr, block_t cur_blkaddr)
> +{
> +	if (last_blkaddr != cur_blkaddr)

if (last_blkaddr + 1 != cur_blkaddr)

Merge condition is wrong here.

> +		return false;
> +	return __same_bdev(sbi, cur_blkaddr, bio);
> +}
> +
> +static bool io_type_is_mergeable(struct f2fs_bio_info *io,
> +						struct f2fs_io_info *fio)
> +{
> +	if (io->fio.op != fio->op)
> +		return false;
> +	return io->fio.op_flags == fio->op_flags;
> +}
> +
> +static bool io_is_mergeable(struct f2fs_sb_info *sbi, struct bio *bio,
> +					struct f2fs_bio_info *io,
> +					struct f2fs_io_info *fio,
> +					block_t last_blkaddr,
> +					block_t cur_blkaddr)
> +{
> +	if (!page_is_mergeable(sbi, bio, last_blkaddr, cur_blkaddr))
> +		return false;
> +	return io_type_is_mergeable(io, fio);
> +}
> +
>  int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  {
>  	struct bio *bio = *fio->bio;
> @@ -495,8 +522,8 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>  	trace_f2fs_submit_page_bio(page, fio);
>  	f2fs_trace_ios(fio, 0);
>  
> -	if (bio && (*fio->last_block + 1 != fio->new_blkaddr ||
> -			!__same_bdev(fio->sbi, fio->new_blkaddr, bio))) {
> +	if (bio && !page_is_mergeable(fio->sbi, bio, *fio->last_block,
> +						fio->new_blkaddr)) {
>  		__submit_bio(fio->sbi, bio, fio->type);
>  		bio = NULL;
>  	}
> @@ -569,9 +596,8 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>  
>  	inc_page_count(sbi, WB_DATA_TYPE(bio_page));
>  
> -	if (io->bio && (io->last_block_in_bio != fio->new_blkaddr - 1 ||
> -	    (io->fio.op != fio->op || io->fio.op_flags != fio->op_flags) ||
> -			!__same_bdev(sbi, fio->new_blkaddr, io->bio)))
> +	if (io->bio && !io_is_mergeable(sbi, io->bio, io, fio,
> +			io->last_block_in_bio, fio->new_blkaddr))
>  		__submit_merged_bio(io);
>  alloc_new:
>  	if (io->bio == NULL) {
> @@ -1643,8 +1669,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>  	 * This page will go to BIO.  Do we need to send this
>  	 * BIO off first?
>  	 */
> -	if (bio && (*last_block_in_bio != block_nr - 1 ||
> -		!__same_bdev(F2FS_I_SB(inode), block_nr, bio))) {
> +	if (bio && !page_is_mergeable(F2FS_I_SB(inode), bio,
> +				*last_block_in_bio, block_nr - 1)) {

*last_block_in_bio, block_nr)

Sorry, anyway, let me send v2.

>  submit_and_realloc:
>  		__submit_bio(F2FS_I_SB(inode), bio, DATA);
>  		bio = NULL;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
