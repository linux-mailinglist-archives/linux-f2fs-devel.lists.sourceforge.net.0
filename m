Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A056E18BACB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2020 16:17:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jEwvE-0006wN-R1; Thu, 19 Mar 2020 15:17:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <bounce+103f7e.be9e4a-linux-f2fs-devel=lists.sourceforge.net@mg.codeaurora.org>)
 id 1jEwvC-0006wE-Oy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 15:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fh/bI0+qquFS2ZESo9A4EzgEEpZIH3bQk3mHNK9Cin0=; b=UwLydS0Bg21nJg6F6XUAaq1oHd
 kzZCjzUiZvmE4EBg38IF7JWh7b/EXIi+shx7uIjzhgrfTMIbidLHYj+YgnPWo7XcKts7PujHxw/s3
 uYJqOPXPQ2Lzjg5jimp6dmIk8freXnUKOKbiTlyyIAE9CpoCYYvGEKvNRFVWSY/bqyHA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fh/bI0+qquFS2ZESo9A4EzgEEpZIH3bQk3mHNK9Cin0=; b=QbWzCJ3ULCQ2IjkhoAOP6Gs6FQ
 GyDbBdhFqF7KfooORgjR/HxC6kvIDNJP+Rvt8Cw3I3i1nL3CP8UfIidy+GwqYvV20G/22hRLeFDvZ
 gypYyRFRq37O73WVSGG31B7Et/rPPwwy1z2k/KDo0ZNnOm8oAr2WRlGWcAY1n/sVW2BE=;
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jEwv1-008zUf-LD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 Mar 2020 15:17:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1584631034; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=fh/bI0+qquFS2ZESo9A4EzgEEpZIH3bQk3mHNK9Cin0=;
 b=NquWyewJilujwjk/u1ulih66EDktMYqihKdu4jGVpTpqZHSW776u/6jQO52ALwOx0IK/FJBa
 m/qyaWZXU31RlrFTOq2S8gNkV3lhhuLWoR9MFluszopZDoYmPCfJ0MUnBfvaoUdJbz+2/rWQ
 XOUwOPNbwasCUhhBngiNXH8Fvxc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI2M2Y4ZiIsICJsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e738ced.7f643e8f48f0-smtp-out-n01;
 Thu, 19 Mar 2020 15:17:01 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C3E9AC4478F; Thu, 19 Mar 2020 15:16:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested) (Authenticated sender: stummala)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E8D2EC44791;
 Thu, 19 Mar 2020 15:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E8D2EC44791
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
Date: Thu, 19 Mar 2020 20:46:53 +0530
From: Sahitya Tummala <stummala@codeaurora.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200319151652.GO20234@codeaurora.org>
References: <1583466746-17445-1-git-send-email-stummala@codeaurora.org>
 <3c88ab1f-d6f0-56da-e845-1d064b0e24fe@huawei.com>
 <20200319091518.GN20234@codeaurora.org>
 <12c0ac9f-54ab-d012-0796-24b6e08d31c7@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <12c0ac9f-54ab-d012-0796-24b6e08d31c7@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [104.130.122.26 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jEwv1-008zUf-LD
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Mar 19, 2020 at 06:47:07PM +0800, Chao Yu wrote:
> Hi Sahitya,
> 
> On 2020/3/19 17:15, Sahitya Tummala wrote:
> > Hi Chao,
> > 
> > On Mon, Mar 16, 2020 at 11:19:11AM +0800, Chao Yu wrote:
> >> On 2020/3/6 11:52, Sahitya Tummala wrote:
> >>> Add support for new CP flag CP_RESIZEFS_FLAG set during online
> >>> resize FS. If SPO happens after SB is updated but CP isn't, then
> >>> allow fsck to fix it.
> >>>
> >>> fsck errors without this fix -
> >>>     Info: CKPT version = 6ed7bccb
> >>>             Wrong user_block_count(2233856)
> >>>     [f2fs_do_mount:3365] Checkpoint is polluted
> >>>
> >>> the subsequent mount failure without this fix -
> >>> [   11.294650] F2FS-fs (sda8): Wrong user_block_count: 2233856
> >>> [   11.300272] F2FS-fs (sda8): Failed to get valid F2FS checkpoint
> >>>
> >>> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> >>> ---
> >>> v2:
> >>> - fix even if CP_FSCK_FLAG is set for backward compatibility
> >>> - update print_cp_state()
> >>>
> >>>  fsck/mount.c      | 34 +++++++++++++++++++++++++++++++---
> >>>  include/f2fs_fs.h |  1 +
> >>>  2 files changed, 32 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/fsck/mount.c b/fsck/mount.c
> >>> index e4ba048..8d32e41 100644
> >>> --- a/fsck/mount.c
> >>> +++ b/fsck/mount.c
> >>> @@ -429,6 +429,8 @@ void print_cp_state(u32 flag)
> >>>  		MSG(0, "%s", " orphan_inodes");
> >>>  	if (flag & CP_DISABLED_FLAG)
> >>>  		MSG(0, "%s", " disabled");
> >>> +	if (flag & CP_RESIZEFS_FLAG)
> >>> +		MSG(0, "%s", " resizefs");
> >>>  	if (flag & CP_UMOUNT_FLAG)
> >>>  		MSG(0, "%s", " unmount");
> >>>  	else
> >>> @@ -1128,6 +1130,7 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
> >>>  	unsigned int total, fsmeta;
> >>>  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
> >>>  	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
> >>> +	unsigned int flag = get_cp(ckpt_flags);
> >>>  	unsigned int ovp_segments, reserved_segments;
> >>>  	unsigned int main_segs, blocks_per_seg;
> >>>  	unsigned int sit_segs, nat_segs;
> >>> @@ -1164,7 +1167,32 @@ int sanity_check_ckpt(struct f2fs_sb_info *sbi)
> >>>  	log_blocks_per_seg = get_sb(log_blocks_per_seg);
> >>>  	if (!user_block_count || user_block_count >=
> >>>  			segment_count_main << log_blocks_per_seg) {
> >>> -		MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
> >>> +		if (flag & (CP_FSCK_FLAG | CP_RESIZEFS_FLAG)) {
> >>> +			u32 valid_user_block_cnt;
> >>> +			u32 seg_cnt_main = get_sb(segment_count) -
> >>> +					(get_sb(segment_count_ckpt) +
> >>> +					 get_sb(segment_count_sit) +
> >>> +					 get_sb(segment_count_nat) +
> >>> +					 get_sb(segment_count_ssa));
> >>> +
> >>> +			/* validate segment_count_main in sb first */
> >>> +			if (seg_cnt_main != get_sb(segment_count_main)) {
> >>> +				MSG(0, "\tWrong user_block_count(%u) and inconsistent segment_cnt_main %u\n",
> >>> +						user_block_count,
> >>> +						segment_count_main << log_blocks_per_seg);
> >>> +				return 1;
> >>> +			}
> >>> +			valid_user_block_cnt = ((get_sb(segment_count_main) -
> >>> +						get_cp(overprov_segment_count)) * c.blks_per_seg);
> >>> +			MSG(0, "\tInfo: Fix wrong user_block_count in CP: (%u) -> (%u)\n",
> >>> +					user_block_count, valid_user_block_cnt);
> >>
> >> By default, we should only fix such bug if c.fix_on is true, something
> >> like this:
> >>
> >> ASSERT_MSG("\tWrong user_block_count(%u)\n", user_block_count);
> >>
> >> if (!c.fix_on)
> >> 	return 1;
> >>
> >> valid_user_block_cnt = ((get_sb(segment_count_main) -
> >> 	get_cp(overprov_segment_count)) * c.blks_per_seg);
> >>
> >> MSG(0, "\tInfo: Fix wrong user_block_count in CP: (%u) -> (%u)\n",
> >> 	user_block_count, valid_user_block_cnt);
> >>
> > Since this is a fatal error which fails the basic mount itself, I thought it
> > must be fixed by default with fsck independent of -f option. Can we do so for
> > such critical bugs?
> 
> I suggest to follow the options' meaning, e.g. if user specified --dry-run,
> however we change any bits on that image, it looks that break that option's
> semantics, and it may violate user's will.... so IMO, if user don't want to
> repair the image, it will be better to keep the image as it is.
> 
> Thoughts?

Sure Chao. I will update the patch to fix it as per your suggestion.

Thanks,
> 
> To Jaegeuk, thoughts?
> 
> Thanks,
> 
> > 
> > Thanks,
> > 
> >> Thanks,
> >>
> >>
> >>> +			set_cp(user_block_count, valid_user_block_cnt);
> >>> +			c.fix_on = 1;
> >>> +			c.bug_on = 1;
> >>> +		} else {
> >>> +			MSG(0, "\tWrong user_block_count(%u)\n", user_block_count);
> >>> +			return 1;
> >>> +		}
> >>>  		return 1;
> >>>  	}
> >>>  
> >>> @@ -3361,6 +3389,8 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
> >>>  		return -1;
> >>>  	}
> >>>  
> >>> +	c.bug_on = 0;
> >>> +
> >>>  	if (sanity_check_ckpt(sbi)) {
> >>>  		ERR_MSG("Checkpoint is polluted\n");
> >>>  		return -1;
> >>> @@ -3380,8 +3410,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
> >>>  			c.fix_on = 1;
> >>>  	}
> >>>  
> >>> -	c.bug_on = 0;
> >>> -
> >>>  	if (tune_sb_features(sbi))
> >>>  		return -1;
> >>>  
> >>> diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
> >>> index af31bc5..265f50c 100644
> >>> --- a/include/f2fs_fs.h
> >>> +++ b/include/f2fs_fs.h
> >>> @@ -678,6 +678,7 @@ struct f2fs_super_block {
> >>>  /*
> >>>   * For checkpoint
> >>>   */
> >>> +#define CP_RESIZEFS_FLAG                0x00004000
> >>>  #define CP_DISABLED_FLAG		0x00001000
> >>>  #define CP_QUOTA_NEED_FSCK_FLAG		0x00000800
> >>>  #define CP_LARGE_NAT_BITMAP_FLAG	0x00000400
> >>>
> > 

-- 
--
Sent by a consultant of the Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
