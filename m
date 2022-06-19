Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF7A55079F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:11:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2iWu-0004hd-Q0; Sun, 19 Jun 2022 00:11:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2iWt-0004hW-3S
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3RFnMWfU7UvFmdpe1lIg3TslueidBV9FP28xLQ36xbg=; b=NJYOdf0Tjp+M3v820K6Y37arK0
 +DM8myv7iQHfMWgZHaYsVote48ZDW0pwDEeq0QUzCzlrmltXAsd4fL78hkbdO6/Ofgq6cDrXvcp5s
 3mgNAIGHDL+UV9zCvqqfuPxlv4ei/uEW6a9w4acbvYtUOq/kDZmEdy+akZWo4MlwgJnY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3RFnMWfU7UvFmdpe1lIg3TslueidBV9FP28xLQ36xbg=; b=D6BbMCaxh6Q+P/MCFnp5HKcYdi
 LBQY6Q4O+1bdUkw8IXQWVhojszKYbwwqCCkTQ3M/bcCoC96ZQVuPGbDI8ABClSZmXtXN7MXhy/Ntk
 XkGJknVMdcDLoieQ53PMJHIt3iu9xrdOFC0BPfV9R5xV5hZgdVb0WvQrLdMq+1PnC23I=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2iWr-000359-4x
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:11:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2C51AB80108;
 Sun, 19 Jun 2022 00:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1FAC3411A;
 Sun, 19 Jun 2022 00:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655597454;
 bh=pJavzBOpBup2L2XFujyF+W4cOF5r98O8lnH39scpEWM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PyhtF9Wwm/fzM9VqL4TSKYSYMr/ZpGzFqS8u1mazEehsHuuuOTISzzWLBeXibwTrd
 cMv2p9TdV7k5UUOnxyBnhfVzMuX0UuERo/UrTaPJ9mpGd0Er+KDeMeEpdRTzrU7WI1
 6X5qFY5P0dULAPEnlBU+kBtsu6DV+Lu0/zYaqN97GiNL5dzaelMLTW0MY8NW8CwWH1
 yLrP+R+0sCQAHLAME/C/E1OxBj33bdL5gcNyp5UACwWxoLkqctZ6xozqgO0r1M/7R3
 WXdM+Ait16ErrahcTmz3+jrEbrdNeVRTRXtI1FTDItaR3kcx9AxYUfLp2zHJPorAbi
 DSiStkGAIsYuw==
Message-ID: <f3fd41e1-ea76-a7d7-4890-ff66ea87b7ab@kernel.org>
Date: Sun, 19 Jun 2022 08:10:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: qixiaoyu1 <qxy65535@gmail.com>, jaegeuk@kernel.org
References: <20220614114929.6897-1-qixiaoyu1@xiaomi.com>
 <20220614114929.6897-2-qixiaoyu1@xiaomi.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220614114929.6897-2-qixiaoyu1@xiaomi.com>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/14 19:49, qixiaoyu1 wrote: > Otherwise, after grow,
 kernel may report below error message > when we mount the image if -o
 parameter
 is specified during resize: > > F2FS-fs (loop0): invalid c [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2iWr-000359-4x
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs-tools: fix to check free space
 before grow
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/14 19:49, qixiaoyu1 wrote:
> Otherwise, after grow, kernel may report below error message
> when we mount the image if -o parameter is specified during resize:
> 
> F2FS-fs (loop0): invalid crc_offset: 0
> F2FS-fs (loop0): Wrong valid_user_blocks: 16404, user_block_count: 13312
> F2FS-fs (loop0): Failed to get valid F2FS checkpoint
> mount(2) system call failed: Structure needs cleaning.
> 
> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>

It looks this patch should be merged into previous one, otherwise
-o option support is broken for resize.f2fs.

Thanks,

> ---
>   fsck/resize.c | 36 ++++++++++++++++++++++++------------
>   1 file changed, 24 insertions(+), 12 deletions(-)
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index d19c6fa..e135b66 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -599,6 +599,26 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>   	DBG(0, "Info: Done to rebuild checkpoint blocks\n");
>   }
>   
> +static int f2fs_resize_check(struct f2fs_sb_info *sbi, struct f2fs_super_block *new_sb)
> +{
> +	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> +	block_t user_block_count;
> +	unsigned int overprov_segment_count;
> +
> +	overprov_segment_count = (get_newsb(segment_count_main) -
> +			c.new_reserved_segments) *
> +			c.new_overprovision / 100;
> +	overprov_segment_count += c.new_reserved_segments;
> +
> +	user_block_count = (get_newsb(segment_count_main) -
> +			overprov_segment_count) * c.blks_per_seg;
> +
> +	if (get_cp(valid_block_count) > user_block_count)
> +		return -1;
> +
> +	return 0;
> +}
> +
>   static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
>   {
>   	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> @@ -616,6 +636,9 @@ static int f2fs_resize_grow(struct f2fs_sb_info *sbi)
>   	if (get_new_sb(new_sb))
>   		return -1;
>   
> +	if (f2fs_resize_check(sbi, new_sb) < 0)
> +		return -1;
> +
>   	/* check nat availability */
>   	if (get_sb(segment_count_nat) > get_newsb(segment_count_nat)) {
>   		err = shrink_nats(sbi, new_sb);
> @@ -659,11 +682,8 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
>   	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>   	struct f2fs_super_block new_sb_raw;
>   	struct f2fs_super_block *new_sb = &new_sb_raw;
> -	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
>   	block_t old_end_blkaddr, old_main_blkaddr;
>   	block_t new_end_blkaddr, new_main_blkaddr, tmp_end_blkaddr;
> -	block_t user_block_count;
> -	unsigned int overprov_segment_count;
>   	unsigned int offset;
>   	int err = -1;
>   
> @@ -674,15 +694,7 @@ static int f2fs_resize_shrink(struct f2fs_sb_info *sbi)
>   	if (get_new_sb(new_sb))
>   		return -1;
>   
> -	overprov_segment_count = (get_newsb(segment_count_main) -
> -			c.new_reserved_segments) *
> -			c.new_overprovision / 100;
> -	overprov_segment_count += c.new_reserved_segments;
> -
> -	user_block_count = (get_newsb(segment_count_main) -
> -			overprov_segment_count) * c.blks_per_seg;
> -
> -	if (get_cp(valid_block_count) > user_block_count)
> +	if (f2fs_resize_check(sbi, new_sb) < 0)
>   		return -1;
>   
>   	/* check nat availability */


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
