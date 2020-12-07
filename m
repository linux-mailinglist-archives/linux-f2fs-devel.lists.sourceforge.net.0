Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2272D0AF2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 08:05:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmAaj-0001W9-Al; Mon, 07 Dec 2020 07:05:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmAah-0001Vt-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SDG0yExj+4TdY2YjjGAojEP5rFbNdBZ5zvTg07AVIE0=; b=JCPtgc2aLVa1LXc2iUnJq1puLc
 /WlqEjZgnvBc510LuL4LJb360vKB6oLAUxxjLZOuLgS0UCutUkE6Tlydy8sqYmSje8unx+OFJcQkK
 yF+AXD88emvBq3UyXn8m7OrRJ3J2waEvxYOQHx8W5Bo1wke0knqCZm8ELUtOSVj08P9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SDG0yExj+4TdY2YjjGAojEP5rFbNdBZ5zvTg07AVIE0=; b=QZ5vx6Vs5RB1VOWjdVVPlccAzx
 cikhnA4Yz8XE60Iie2zzKwkxiZocB51hmqqz89VS8Rf9HFDwsctNbKl5STYOlnxyneoZzXWAz3DGc
 QrMMFsHvpqhJQojNo27pg3fNfwlk6cOK1yWQibTFSp/E92ex13D8i8kkqd+97zikCHnA=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmAaZ-001dK7-Bg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:05:46 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqDp84hwVzkmRk;
 Mon,  7 Dec 2020 15:04:48 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 7 Dec 2020
 15:05:24 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201205042626.1113600-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <c3c41d53-2a99-17a2-223a-3d674613a417@huawei.com>
Date: Mon, 7 Dec 2020 15:05:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201205042626.1113600-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmAaZ-001dK7-Bg
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix race of pending_pages in
 decompression
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/5 12:26, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> I found out f2fs_free_dic() is invoked in a wrong timing, but
> f2fs_verify_bio() still needed the dic info and it triggered the
> below kernel panic. It has been caused by the race condition of
> pending_pages value between decompression and verity logic, when
> the same compression cluster had been split in different bios.
> By split bios, f2fs_verify_bio() ended up with decreasing
> pending_pages value before it is reset to nr_cpages by
> f2fs_decompress_pages() and caused the kernel panic.
> 
> [ 4416.564763] Unable to handle kernel NULL pointer dereference
>                 at virtual address 0000000000000000
> ...
> [ 4416.896016] Workqueue: fsverity_read_queue f2fs_verity_work
> [ 4416.908515] pc : fsverity_verify_page+0x20/0x78
> [ 4416.913721] lr : f2fs_verify_bio+0x11c/0x29c
> [ 4416.913722] sp : ffffffc019533cd0
> [ 4416.913723] x29: ffffffc019533cd0 x28: 0000000000000402
> [ 4416.913724] x27: 0000000000000001 x26: 0000000000000100
> [ 4416.913726] x25: 0000000000000001 x24: 0000000000000004
> [ 4416.913727] x23: 0000000000001000 x22: 0000000000000000
> [ 4416.913728] x21: 0000000000000000 x20: ffffffff2076f9c0
> [ 4416.913729] x19: ffffffff2076f9c0 x18: ffffff8a32380c30
> [ 4416.913731] x17: ffffffc01f966d97 x16: 0000000000000298
> [ 4416.913732] x15: 0000000000000000 x14: 0000000000000000
> [ 4416.913733] x13: f074faec89ffffff x12: 0000000000000000
> [ 4416.913734] x11: 0000000000001000 x10: 0000000000001000
> [ 4416.929176] x9 : ffffffff20d1f5c7 x8 : 0000000000000000
> [ 4416.929178] x7 : 626d7464ff286b6b x6 : ffffffc019533ade
> [ 4416.929179] x5 : 000000008049000e x4 : ffffffff2793e9e0
> [ 4416.929180] x3 : 000000008049000e x2 : ffffff89ecfa74d0
> [ 4416.929181] x1 : 0000000000000c40 x0 : ffffffff2076f9c0
> [ 4416.929184] Call trace:
> [ 4416.929187]  fsverity_verify_page+0x20/0x78
> [ 4416.929189]  f2fs_verify_bio+0x11c/0x29c
> [ 4416.929192]  f2fs_verity_work+0x58/0x84
> [ 4417.050667]  process_one_work+0x270/0x47c
> [ 4417.055354]  worker_thread+0x27c/0x4d8
> [ 4417.059784]  kthread+0x13c/0x320
> [ 4417.063693]  ret_from_fork+0x10/0x18

Is race condition as below?

Thread A			f2fs_post_read_wq		fsverity_wq
- f2fs_read_multi_pages()
  - f2fs_alloc_dic
   - dic->pending_pages = 2
   - submit_bio()
   - submit_bio()
				- f2fs_post_read_work() handle first bio
				 - f2fs_decompress_work()
				  - __read_end_io()
				   - f2fs_decompress_pages()
				    - dic->pending_pages--
				 - enqueue f2fs_verity_work()
								- f2fs_verity_work() handle first bio
								 - f2fs_verify_bio()
								  - dic->pending_pages--
				- f2fs_post_read_work() handle second bio
				 - f2fs_decompress_work()
				 - enqueue f2fs_verity_work()
								  - f2fs_verify_pages()
								  - f2fs_free_dic()
								
								- f2fs_verity_work() handle second bio
								 - f2fs_verfy_bio()
								  - use-after-free on dic
If this is correct, could you please add this into commit message?

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> v3: back to v1 and enabled verity in a unit of cluster
> v2: merged verity_pages with pending_pages, and increased the
>      pending_pages count only if STEP_VERITY is set on bio
> ---
>   fs/f2fs/compress.c |  2 --
>   fs/f2fs/data.c     | 51 ++++++++++++++++++++++++++++++++++++----------
>   fs/f2fs/f2fs.h     |  1 +
>   3 files changed, 41 insertions(+), 13 deletions(-)
> 
> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
> index 87090da8693d..832b19986caf 100644
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -803,8 +803,6 @@ void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity)
>   	if (cops->destroy_decompress_ctx)
>   		cops->destroy_decompress_ctx(dic);
>   out_free_dic:
> -	if (verity)
> -		atomic_set(&dic->pending_pages, dic->nr_cpages);
>   	if (!verity)
>   		f2fs_decompress_end_io(dic->rpages, dic->cluster_size,
>   								ret, false);
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 42254d3859c7..861e5783a5fc 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -202,7 +202,7 @@ static void f2fs_verify_bio(struct bio *bio)
>   		dic = (struct decompress_io_ctx *)page_private(page);
>   
>   		if (dic) {
> -			if (atomic_dec_return(&dic->pending_pages))
> +			if (atomic_dec_return(&dic->verity_pages))
>   				continue;
>   			f2fs_verify_pages(dic->rpages,
>   						dic->cluster_size);
> @@ -1027,7 +1027,8 @@ static inline bool f2fs_need_verity(const struct inode *inode, pgoff_t idx)
>   
>   static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>   				      unsigned nr_pages, unsigned op_flag,
> -				      pgoff_t first_idx, bool for_write)
> +				      pgoff_t first_idx, bool for_write,
> +				      bool for_verity)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>   	struct bio *bio;
> @@ -1049,7 +1050,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
>   		post_read_steps |= 1 << STEP_DECRYPT;
>   	if (f2fs_compressed_file(inode))
>   		post_read_steps |= 1 << STEP_DECOMPRESS_NOWQ;
> -	if (f2fs_need_verity(inode, first_idx))
> +	if (for_verity && f2fs_need_verity(inode, first_idx))
>   		post_read_steps |= 1 << STEP_VERITY;
>   
>   	if (post_read_steps) {
> @@ -1079,7 +1080,7 @@ static int f2fs_submit_page_read(struct inode *inode, struct page *page,
>   	struct bio *bio;
>   
>   	bio = f2fs_grab_read_bio(inode, blkaddr, 1, op_flags,
> -					page->index, for_write);
> +					page->index, for_write, true);
>   	if (IS_ERR(bio))
>   		return PTR_ERR(bio);
>   
> @@ -2133,7 +2134,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
>   	if (bio == NULL) {
>   		bio = f2fs_grab_read_bio(inode, block_nr, nr_pages,
>   				is_readahead ? REQ_RAHEAD : 0, page->index,
> -				false);
> +				false, true);
>   		if (IS_ERR(bio)) {
>   			ret = PTR_ERR(bio);
>   			bio = NULL;
> @@ -2180,6 +2181,8 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   	const unsigned blkbits = inode->i_blkbits;
>   	const unsigned blocksize = 1 << blkbits;
>   	struct decompress_io_ctx *dic = NULL;
> +	struct bio_post_read_ctx *ctx;
> +	bool for_verity = false;
>   	int i;
>   	int ret = 0;
>   
> @@ -2245,10 +2248,22 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		goto out_put_dnode;
>   	}
>   
> +	if (fsverity_active(cc->inode)) {
> +		atomic_set(&dic->verity_pages, cc->nr_cpages);
> +		for_verity = true;
> +
> +		if (bio) {
> +			ctx = bio->bi_private;
> +			if (!(ctx->enabled_steps & (1 << STEP_VERITY))) {

It looks like it will be better to move this into merge condition?

		if (bio && (!page_is_mergeable(sbi, bio,
					*last_block_in_bio, blkaddr) ||
		    !f2fs_crypt_mergeable_bio(bio, inode, page->index, NULL) ||
			f2fs_verify_mergeable_bio())) {

Thanks,

> +				__submit_bio(sbi, bio, DATA);
> +				bio = NULL;
> +			}
> +		}
> +	}
> +
>   	for (i = 0; i < dic->nr_cpages; i++) {
>   		struct page *page = dic->cpages[i];
>   		block_t blkaddr;
> -		struct bio_post_read_ctx *ctx;
>   
>   		blkaddr = data_blkaddr(dn.inode, dn.node_page,
>   						dn.ofs_in_node + i + 1);
> @@ -2264,17 +2279,31 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
>   		if (!bio) {
>   			bio = f2fs_grab_read_bio(inode, blkaddr, nr_pages,
>   					is_readahead ? REQ_RAHEAD : 0,
> -					page->index, for_write);
> +					page->index, for_write, for_verity);
>   			if (IS_ERR(bio)) {
> +				unsigned int remained = dic->nr_cpages - i;
> +				bool release = false;
> +
>   				ret = PTR_ERR(bio);
>   				dic->failed = true;
> -				if (!atomic_sub_return(dic->nr_cpages - i,
> -							&dic->pending_pages)) {
> +
> +				if (for_verity) {
> +					if (!atomic_sub_return(remained,
> +						&dic->verity_pages))
> +						release = true;
> +				} else {
> +					if (!atomic_sub_return(remained,
> +						&dic->pending_pages))
> +						release = true;
> +				}
> +
> +				if (release) {
>   					f2fs_decompress_end_io(dic->rpages,
> -							cc->cluster_size, true,
> -							false);
> +						cc->cluster_size, true,
> +						false);
>   					f2fs_free_dic(dic);
>   				}
> +
>   				f2fs_put_dnode(&dn);
>   				*bio_ret = NULL;
>   				return ret;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 94d16bde5e24..f328f55fb0a0 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1341,6 +1341,7 @@ struct decompress_io_ctx {
>   	size_t rlen;			/* valid data length in rbuf */
>   	size_t clen;			/* valid data length in cbuf */
>   	atomic_t pending_pages;		/* in-flight compressed page count */
> +	atomic_t verity_pages;		/* in-flight page count for verity */
>   	bool failed;			/* indicate IO error during decompression */
>   	void *private;			/* payload buffer for specified decompression algorithm */
>   	void *private2;			/* extra payload buffer */
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
