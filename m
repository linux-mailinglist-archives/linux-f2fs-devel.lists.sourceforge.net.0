Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C37125046DE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Apr 2022 08:42:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfybt-0001Y9-F8; Sun, 17 Apr 2022 06:42:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nfybs-0001Y2-AK
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 06:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GPZFiPf+JREXP0nIGPZ78VtzJS9Ti/8rKSyrf9fl+ds=; b=TeC47ej9Y1fzBy3/Jfm7YoBzv8
 ZGOl440FKx/z3ukmmDEX4O8wFnVuIxh7yx37W7qLPAFdFBUckzqbTpEbRAWyzSBXpYUWFJ473V3BR
 T4YBxOEOmavA1kH77sYdd6HUHGfmRBY3T+AP7Fk3vBpn0QsLfXbj9qDAIHaEnXssaPoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GPZFiPf+JREXP0nIGPZ78VtzJS9Ti/8rKSyrf9fl+ds=; b=dNrDR/WFHb34LxpqwqXpKKqlkT
 GAIaxpDI32QpC7AcWgAArwdPcBdeIfouitXkK+/NB6EP//H/WQxcV2fBemkbOCT2rWeMgXmukB0Gm
 48gCfBJMIdCLDPRvmo4jV7jg79x9XYqvDpN6Jg8Y9X6zvbujhvmH/az3cTHX4vaTgWWo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfybo-001uQM-Ne
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Apr 2022 06:42:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83BD961142
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Apr 2022 06:41:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6F1C385A7;
 Sun, 17 Apr 2022 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650177717;
 bh=mYmF9fQB39PB7wD2m8YVDgKopxt1nEx/PGkPkAA44DM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=MkcMF+JDLeCM/KSUIJThnRk4twIjI24+ffYlgu9RwlCuRjcNUImasCaDQVd+2deIM
 igjTUSkZKpbBKV8U+bSv8YhJppBS9Nx0Y1EqW5xS04YOg2pwT8jXVwvIyBl06qthAF
 hzx/+wa6AqeIEMpIIfI2LniPPvdxn4JB0we3TXe1rsyYloV/R4Jc8AxxVgBtpR+9ae
 AwZvANFSpdvEpN5pxDPGikti3p3ZGK6GSYLH+k3N38pHBVSRBbSFkhQ60Uv7Zgsy6f
 BVqsvdp5YN9QxdgyBLL6Ho16k9xvMvRrJcPiAwc0pHmpHLjW0/UYR64ExbKN9cK2tg
 UY/Qjzvz6vzzw==
Message-ID: <d6d5f865-a7da-cd4c-1390-a22374f387c7@kernel.org>
Date: Sun, 17 Apr 2022 14:41:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220411212141.1775589-1-jaegeuk@kernel.org>
 <20220411212141.1775589-2-jaegeuk@kernel.org> <Ylif523qTzL9eq1C@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <Ylif523qTzL9eq1C@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/15 6:27, Jaegeuk Kim wrote: > xfstests/generic/475
 can give EIO all the time which give an infinite loop > to flush node page
 like below. Let's avoid it. > > [16418.518551] Call Trace: > [16 [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfybo-001uQM-Ne
Subject: Re: [f2fs-dev] [PATCH 2/2 v2] f2fs: avoid infinite loop to flush
 node pages
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

On 2022/4/15 6:27, Jaegeuk Kim wrote:
> xfstests/generic/475 can give EIO all the time which give an infinite loop
> to flush node page like below. Let's avoid it.
> 
> [16418.518551] Call Trace:
> [16418.518553]  ? dm_submit_bio+0x48/0x400
> [16418.518574]  ? submit_bio_checks+0x1ac/0x5a0
> [16418.525207]  __submit_bio+0x1a9/0x230
> [16418.525210]  ? kmem_cache_alloc+0x29e/0x3c0
> [16418.525223]  submit_bio_noacct+0xa8/0x2b0
> [16418.525226]  submit_bio+0x4d/0x130
> [16418.525238]  __submit_bio+0x49/0x310 [f2fs]
> [16418.525339]  ? bio_add_page+0x6a/0x90
> [16418.525344]  f2fs_submit_page_bio+0x134/0x1f0 [f2fs]
> [16418.525365]  read_node_page+0x125/0x1b0 [f2fs]
> [16418.525388]  __get_node_page.part.0+0x58/0x3f0 [f2fs]
> [16418.525409]  __get_node_page+0x2f/0x60 [f2fs]
> [16418.525431]  f2fs_get_dnode_of_data+0x423/0x860 [f2fs]
> [16418.525452]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
> [16418.525458]  ? __mod_memcg_state.part.0+0x2a/0x30
> [16418.525465]  ? __mod_memcg_lruvec_state+0x27/0x40
> [16418.525467]  ? __xa_set_mark+0x57/0x70
> [16418.525472]  f2fs_do_write_data_page+0x10e/0x7b0 [f2fs]
> [16418.525493]  f2fs_write_single_data_page+0x555/0x830 [f2fs]
> [16418.525514]  ? sysvec_apic_timer_interrupt+0x4e/0x90
> [16418.525518]  ? asm_sysvec_apic_timer_interrupt+0x12/0x20
> [16418.525523]  f2fs_write_cache_pages+0x303/0x880 [f2fs]
> [16418.525545]  ? blk_flush_plug_list+0x47/0x100
> [16418.525548]  f2fs_write_data_pages+0xfd/0x320 [f2fs]
> [16418.525569]  do_writepages+0xd5/0x210
> [16418.525648]  filemap_fdatawrite_wbc+0x7d/0xc0
> [16418.525655]  filemap_fdatawrite+0x50/0x70
> [16418.525658]  f2fs_sync_dirty_inodes+0xa4/0x230 [f2fs]
> [16418.525679]  f2fs_write_checkpoint+0x16d/0x1720 [f2fs]
> [16418.525699]  ? ttwu_do_wakeup+0x1c/0x160
> [16418.525709]  ? ttwu_do_activate+0x6d/0xd0
> [16418.525711]  ? __wait_for_common+0x11d/0x150
> [16418.525715]  kill_f2fs_super+0xca/0x100 [f2fs]
> [16418.525733]  deactivate_locked_super+0x3b/0xb0
> [16418.525739]  deactivate_super+0x40/0x50
> [16418.525741]  cleanup_mnt+0x139/0x190
> [16418.525747]  __cleanup_mnt+0x12/0x20
> [16418.525749]  task_work_run+0x6d/0xa0
> [16418.525765]  exit_to_user_mode_prepare+0x1ad/0x1b0
> [16418.525771]  syscall_exit_to_user_mode+0x27/0x50
> [16418.525774]  do_syscall_64+0x48/0xc0
> [16418.525776]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
> 
> Change log from v1:
>   - cover one more error case
> 
>   fs/f2fs/checkpoint.c |  8 +-------
>   fs/f2fs/f2fs.h       | 20 ++++++++++++++++----
>   fs/f2fs/node.c       |  2 ++
>   3 files changed, 19 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 909085a78f9c..319903c2b34f 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -98,13 +98,7 @@ static struct page *__get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index,
>   	}
>   
>   	if (unlikely(!PageUptodate(page))) {
> -		if (page->index == sbi->metapage_eio_ofs) {
> -			if (sbi->metapage_eio_cnt++ == MAX_RETRY_META_PAGE_EIO)
> -				set_ckpt_flags(sbi, CP_ERROR_FLAG);
> -		} else {
> -			sbi->metapage_eio_ofs = page->index;
> -			sbi->metapage_eio_cnt = 0;
> -		}
> +		f2fs_handle_page_eio(sbi, page->index, META);
>   		f2fs_put_page(page, 1);
>   		return ERR_PTR(-EIO);
>   	}
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index cd1e65bcf0b0..977826a22568 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -579,8 +579,8 @@ enum {
>   /* maximum retry quota flush count */
>   #define DEFAULT_RETRY_QUOTA_FLUSH_COUNT		8
>   
> -/* maximum retry of EIO'ed meta page */
> -#define MAX_RETRY_META_PAGE_EIO			100
> +/* maximum retry of EIO'ed page */
> +#define MAX_RETRY_PAGE_EIO			100
>   
>   #define F2FS_LINK_MAX	0xffffffff	/* maximum link count per file */
>   
> @@ -1621,8 +1621,8 @@ struct f2fs_sb_info {
>   	/* keep migration IO order for LFS mode */
>   	struct f2fs_rwsem io_order_lock;
>   	mempool_t *write_io_dummy;		/* Dummy pages */
> -	pgoff_t metapage_eio_ofs;		/* EIO page offset */
> -	int metapage_eio_cnt;			/* EIO count */
> +	pgoff_t page_eio_ofs[NR_PAGE_TYPE];	/* EIO page offset */
> +	int page_eio_cnt[NR_PAGE_TYPE];		/* EIO count */
>   
>   	/* for checkpoint */
>   	struct f2fs_checkpoint *ckpt;		/* raw checkpoint pointer */
> @@ -4543,6 +4543,18 @@ static inline void f2fs_io_schedule_timeout(long timeout)
>   	io_schedule_timeout(timeout);
>   }
>   
> +static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi, pgoff_t ofs,
> +					enum page_type type)
> +{

If we have already set cp_error, it doesn't need to process below logic
redundantly?

if (f2fs_cp_error())
	return;

> +	if (ofs == sbi->page_eio_ofs[type]) {
> +		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO)
> +			set_ckpt_flags(sbi, CP_ERROR_FLAG);
> +	} else {
> +		sbi->page_eio_ofs[type] = ofs;
> +		sbi->page_eio_cnt[type] = 0;
> +	}
> +}
> +
>   #define EFSBADCRC	EBADMSG		/* Bad CRC detected */
>   #define EFSCORRUPTED	EUCLEAN		/* Filesystem is corrupted */
>   
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index c45d341dcf6e..c280f482c741 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1416,6 +1416,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   
>   	err = read_node_page(page, 0);
>   	if (err < 0) {
> +		f2fs_handle_page_eio(sbi, page->index, NODE);

How about:

goto out_put;

>   		f2fs_put_page(page, 1);
>   		return ERR_PTR(err);
>   	} else if (err == LOCKED_PAGE) {
> @@ -1452,6 +1453,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   		err = -EINVAL;
>   out_err:
>   		ClearPageUptodate(page);

out_put:

Thanks,

> +		f2fs_handle_page_eio(sbi, page->index, NODE);
>   		f2fs_put_page(page, 1);
>   		return ERR_PTR(err);
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
