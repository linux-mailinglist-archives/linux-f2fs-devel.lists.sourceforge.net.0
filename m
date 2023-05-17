Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B039705C77
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 03:33:10 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pz62O-0007qp-14;
	Wed, 17 May 2023 01:33:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pz62M-0007qj-MW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QwMQ0O8gXw5A5DRIdMs57cI0x+C1HtkWYHoQj4OL4MA=; b=JIKlGBmH6M0a1bO4axG28MBkCp
 oq7NtGUW7wEgbt5xiaLi44oz6zL5pYIcJf54EqlKbLLpDt2DY7y4cn44/+TlLBIpd6X5aj7YGfM3q
 /N9SqPYUkZiZ6nXWUyLmISeEqNUF6sglLpWUQdFyVmj1xgUoBqCsoaLfbfPFLfjjWkZs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QwMQ0O8gXw5A5DRIdMs57cI0x+C1HtkWYHoQj4OL4MA=; b=CFAIH2NJK3YKJSOA/NOolSYij1
 FoLrkvw6qeajcrMyULMGxL2j8o27PSORIhRudEuYNY54XzT4gqspw0kfJDmUqFKi2oXLtke2cz20G
 +p7kG9EY9QcwVigiZhBem/5T5B+GkHNrW/Bl0zPnkDg31anncgp+DTyT+S/wpD3BMBU4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pz62L-0006ud-VQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 01:33:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8947D6135A;
 Wed, 17 May 2023 01:32:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE958C433A4;
 Wed, 17 May 2023 01:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684287176;
 bh=rg77yQfSpeOMSnNWxehfQlKpM4cPkoDtVLTfLguYlzo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DlM6sMKRZAS30k+VxniJv2P0kk3jnTjgt3BuUnbXorxoUya/BuqaaAObJvJPDNnAo
 SGbLKBhScpO3q1/1+dB3grQuQxxbiamA28xXLPXmU17WLjBhFeyGTsP3d9BfG+/KQY
 Z1i3oEC6F5Joi5NCXOT7h9i/RaQV9kUtmOAoyLd7glJtHJwLfAAVazst2KJwLWawul
 tIgKVSQyNDARKcxeCJfCIg1wtktC6XFryOVIHSc6Em4sufD97LRIqk+PDh/JNhYBgW
 SIZ2tetjYFmIMkS5wPr7rnlRf6gS09KLi75OUVxY7qZePXhBrBNESkWm27yIHkLUXt
 jmWc774sYG/kw==
Message-ID: <8c91663e-dfca-4b64-dc39-5a130fbb99a7@kernel.org>
Date: Wed, 17 May 2023 09:32:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20230505155040.87561-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230505155040.87561-1-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/5 23:50, Jaegeuk Kim wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > To keep six open zone constraints, make them not
 to be open over six > open zones. > > Signed-off-by: Daeho Jeong [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pz62L-0006ud-VQ
Subject: Re: [f2fs-dev] [PATCH] f2fs: maintain six open zones for zoned
 devices
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

On 2023/5/5 23:50, Jaegeuk Kim wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> To keep six open zone constraints, make them not to be open over six
> open zones.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/data.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   fs/f2fs/f2fs.h |  5 +++++
>   2 files changed, 62 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 7dd92a9028b1..bb9de0a02143 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -383,6 +383,17 @@ static void f2fs_write_end_io(struct bio *bio)
>   	bio_put(bio);
>   }
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static void f2fs_zone_write_end_io(struct bio *bio)
> +{
> +	struct f2fs_bio_info *io = (struct f2fs_bio_info *)bio->bi_private;
> +
> +	bio->bi_private = io->bi_private;
> +	complete(&io->zone_wait);
> +	f2fs_write_end_io(bio);
> +}
> +#endif
> +
>   struct block_device *f2fs_target_device(struct f2fs_sb_info *sbi,
>   		block_t blk_addr, sector_t *sector)
>   {
> @@ -639,6 +650,10 @@ int f2fs_init_write_merge_io(struct f2fs_sb_info *sbi)
>   			INIT_LIST_HEAD(&sbi->write_io[i][j].io_list);
>   			INIT_LIST_HEAD(&sbi->write_io[i][j].bio_list);
>   			init_f2fs_rwsem(&sbi->write_io[i][j].bio_list_lock);
> +#ifdef CONFIG_BLK_DEV_ZONED

init_completion(&io->zone_wait);

> +			sbi->write_io[i][j].zone_pending_bio = NULL;
> +			sbi->write_io[i][j].bi_private = NULL;
> +#endif
>   		}
>   	}
>   
> @@ -965,6 +980,26 @@ int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   	return 0;
>   }
>   
> +#ifdef CONFIG_BLK_DEV_ZONED
> +static bool is_end_zone_blkaddr(struct f2fs_sb_info *sbi, block_t blkaddr)
> +{
> +	int devi = 0;
> +
> +	if (f2fs_is_multi_device(sbi)) {
> +		devi = f2fs_target_device_index(sbi, blkaddr);
> +		if (blkaddr < FDEV(devi).start_blk ||
> +		    blkaddr > FDEV(devi).end_blk) {
> +			f2fs_err(sbi, "Invalid block %x", blkaddr);
> +			return false;
> +		}
> +		blkaddr -= FDEV(devi).start_blk;
> +	}
> +	return bdev_zoned_model(FDEV(devi).bdev) == BLK_ZONED_HM &&
> +		f2fs_blkz_is_seq(sbi, devi, blkaddr) &&
> +		(blkaddr % sbi->blocks_per_blkz == sbi->blocks_per_blkz - 1);
> +}
> +#endif
> +
>   void f2fs_submit_page_write(struct f2fs_io_info *fio)
>   {
>   	struct f2fs_sb_info *sbi = fio->sbi;
> @@ -975,6 +1010,16 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>   	f2fs_bug_on(sbi, is_read_io(fio->op));
>   
>   	f2fs_down_write(&io->io_rwsem);
> +
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (f2fs_sb_has_blkzoned(sbi) && btype < META && io->zone_pending_bio) {
> +		wait_for_completion_io(&io->zone_wait);
> +		bio_put(io->zone_pending_bio);
> +		io->zone_pending_bio = NULL;
> +		io->bi_private = NULL;
> +	}
> +#endif
> +
>   next:
>   	if (fio->in_list) {
>   		spin_lock(&io->io_lock);
> @@ -1038,6 +1083,18 @@ void f2fs_submit_page_write(struct f2fs_io_info *fio)
>   	if (fio->in_list)
>   		goto next;
>   out:
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	if (f2fs_sb_has_blkzoned(sbi) && btype < META &&
> +			is_end_zone_blkaddr(sbi, fio->new_blkaddr)) {
> +		bio_get(io->bio);
> +		init_completion(&io->zone_wait);

reinit_completion(&io->zone_wait);

Thanks,

> +		io->bi_private = io->bio->bi_private;
> +		io->bio->bi_private = io;
> +		io->bio->bi_end_io = f2fs_zone_write_end_io;
> +		io->zone_pending_bio = io->bio;
> +		__submit_merged_bio(io);
> +	}
> +#endif
>   	if (is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
>   				!f2fs_is_checkpoint_ready(sbi))
>   		__submit_merged_bio(io);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 7afc9aef127a..0f05c1dd633f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1218,6 +1218,11 @@ struct f2fs_bio_info {
>   	struct bio *bio;		/* bios to merge */
>   	sector_t last_block_in_bio;	/* last block number */
>   	struct f2fs_io_info fio;	/* store buffered io info. */
> +#ifdef CONFIG_BLK_DEV_ZONED
> +	struct completion zone_wait;	/* condition value for the previous open zone to close */
> +	struct bio *zone_pending_bio;	/* pending bio for the previous zone */
> +	void *bi_private;		/* previous bi_private for pending bio */
> +#endif
>   	struct f2fs_rwsem io_rwsem;	/* blocking op for bio */
>   	spinlock_t io_lock;		/* serialize DATA/NODE IOs */
>   	struct list_head io_list;	/* track fios */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
