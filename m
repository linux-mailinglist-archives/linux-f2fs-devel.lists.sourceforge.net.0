Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 075C51863A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Mar 2020 04:19:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jDgHt-0006IJ-HS; Mon, 16 Mar 2020 03:19:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jDgHr-0006IB-QP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YsFNVhUHL3SgXPHb1aVUgHnVLADWxX1IqL4T/NqvbJw=; b=Yz483DI0JFOYMSFAwFlkkEQsKs
 87uQgQYgd1ACy/N6Yw5RHjwCgTR7CyQAuTeGJhGx6kCxfog8GQK6L1iV3jMHzL+aQbwBfl6eg6bZB
 efUNImgqHFjoW/NOV4jEJDgvnqgYIZQFwbH4bYJL/zz3GoYSCgiNXAOXs5Izc+GLmlyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YsFNVhUHL3SgXPHb1aVUgHnVLADWxX1IqL4T/NqvbJw=; b=SBi/WcfOiTsCAybHhb5tbqINtr
 PN9A4vwp4rt5hsuxKDc+VpEnE8mG+pSqxDLtiv+EAfMLHwCfxY2JHY+HCZLkBBsgRPTGHt4jgFGQX
 nVBSr8uKgt43017ueNkodmtJ0oj/KilypQssJkOuD7n43k6lUrw4PCIPpQS4w63b8mjc=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jDgHn-00CAAZ-EE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Mar 2020 03:19:31 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C26536C6A616FF9EAECA;
 Mon, 16 Mar 2020 11:19:14 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 16 Mar
 2020 11:19:11 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1583466746-17445-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3c88ab1f-d6f0-56da-e845-1d064b0e24fe@huawei.com>
Date: Mon, 16 Mar 2020 11:19:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1583466746-17445-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jDgHn-00CAAZ-EE
Subject: Re: [f2fs-dev] [PATCH V2] fsck.f2fs: allow fsck to fix issues with
 online resize due to SPO
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/3/6 11:52, Sahitya Tummala wrote:
> Add support for new CP flag CP_RESIZEFS_FLAG set during online
> resize FS. If SPO happens after SB is updated but CP isn't, then
> allow fsck to fix it.
> 
> fsck errors without this fix -
>     Info: CKPT version = 6ed7bccb
>             Wrong user_block_count(2233856)
>     [f2fs_do_mount:3365] Checkpoint is polluted
> 
> the subsequent mount failure without this fix -
> [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
> [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
> v2:
> - fix even if CP_FSCK_FLAG is set for backward compatibility
> - update print_cp_state()
> 
>  fsck/mount.c      | 34 +++++++++++++++++++++++++++++++---
>  include/f2fs_fs.h |  1 +
>  2 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index e4ba048..8d32e41 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -429,6 +429,8 @@ void print_cp_state(u32 flag)
>  		MSG(0, "%s", " orphan_inodes");
>  	if (flag & CP_DISABLED_FLAG)
>  		MSG(0, "%s", " disabled");
> +	if (flag & CP_RESIZEFS_FLAG)
> +		MSG(0, "%s", " resizefs");
>  	if (flag & CP_UMOUNT_FLAG)
>  		MSG(0, "%s", " unmount");
>  	else
> @@ -1128,6 +1130,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	unsigned int total, fsmeta;
>  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>  	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> +	unsigned int flag = get_cp(ckpt_flags);
>  	unsigned int ovp_segments, reserved_segments;
>  	unsigned int main_segs, blocks_per_seg;
>  	unsigned int sit_segs, nat_segs;
> @@ -1164,7 +1167,32 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
>  	log_blocks_per_seg = get_sb(log_blocks_per_seg);
>  	if (!user_block_count || user_block_count >=
>  			segment_count_main << log_blocks_per_seg) {
> -		MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
> +		if (flag & (CP_FSCK_FLAG | CP_RESIZEFS_FLAG)) {
> +			u32 valid_user_block_cnt;
> +			u32 seg_cnt_main = get_sb(segment_count) -
> +					(get_sb(segment_count_ckpt) +
> +					 get_sb(segment_count_sit) +
> +					 get_sb(segment_count_nat) +
> +					 get_sb(segment_count_ssa));
> +
> +			/* validate segment_count_main in sb first */
> +			if (seg_cnt_main != get_sb(segment_count_main)) {
> +				MSG(0, "\tWrong user_block_count(%u) and inconsistent segment_cnt_main %u\n",
> +						user_block_count,
> +						segment_count_main << log_blocks_per_seg);
> +				return 1;
> +			}
> +			valid_user_block_cnt = ((get_sb(segment_count_main) -
> +						get_cp(overprov_segment_count)) * c.blks_per_seg);
> +			MSG(0, "\tInfo: Fix wrong user_block_count in CP: (%u) -> (%u)\n",
> +					user_block_count, valid_user_block_cnt);

By default, we should only fix such bug if c.fix_on is true, something
like this:

ASSERT_MSG("\tWrong user_block_count(%u)\n", user_block_count);

if (!c.fix_on)
	return 1;

valid_user_block_cnt = ((get_sb(segment_count_main) -
	get_cp(overprov_segment_count)) * c.blks_per_seg);

MSG(0, "\tInfo: Fix wrong user_block_count in CP: (%u) -> (%u)\n",
	user_block_count, valid_user_block_cnt);

Thanks,


> +			set_cp(user_block_count, valid_user_block_cnt);
> +			c.fix_on = 1;
> +			c.bug_on = 1;
> +		} else {
> +			MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
> +			return 1;
> +		}
>  		return 1;
>  	}
>  
> @@ -3361,6 +3389,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  		return -1;
>  	}
>  
> +	c.bug_on = 0;
> +
>  	if (sanity_check_ckpt(sbi)) {
>  		ERR_MSG("Checkpoint is polluted\n");
>  		return -1;
> @@ -3380,8 +3410,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  			c.fix_on = 1;
>  	}
>  
> -	c.bug_on = 0;
> -
>  	if (tune_sb_features(sbi))
>  		return -1;
>  
> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> index af31bc5..265f50c 100644
> --- a/include/f2fs_fs.h
> +++ b/include/f2fs_fs.h
> @@ -678,6 +678,7 @@ struct f2fs_super_block {
>  /*
>   * For checkpoint
>   */
> +#define CP_RESIZEFS_FLAG                0x00004000
>  #define CP_DISABLED_FLAG		0x00001000
>  #define CP_QUOTA_NEED_FSCK_FLAG		0x00000800
>  #define CP_LARGE_NAT_BITMAP_FLAG	0x00000400
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
