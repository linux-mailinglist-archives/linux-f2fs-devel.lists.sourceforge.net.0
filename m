Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCC427F66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 16:19:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hToZX-0004Jz-M6; Thu, 23 May 2019 14:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hToZW-0004Js-H3
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1zlWGhTuFZECuWqEyrnL0cMMQsEDAoe1ilXfJnJX5w=; b=dLaWksg1iNsMgtWbV+LRvIZbP3
 rq96eeQkJUZD9dBYQQqm8oQaKfJSfBM6R9D8u7m8cejWF2MESkkqnFIoZvZv1kt2x43nttIfiGusJ
 DlCO2VFLV3NCH2lptnAnQNC8zk9U1yQb6jo/mcUT+Zm7ascLuwFuoCHYKnOldjOopEpw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f1zlWGhTuFZECuWqEyrnL0cMMQsEDAoe1ilXfJnJX5w=; b=YQM88r5reQk2+Am/cSFyVWlIj0
 Bt4vFw4jSF35OdbjR7jH+Soc+6FwPfjmCQ67f+8Y5/QHCGhxgC+wUpgWM5/YQ9qDEh9bm5G4wmk9L
 Rpa9zmXf6YYQRiM1uzxy9JgiwjsbJEI1okLhsiyUDbKdhdHCS0x91JzcCU2GsW5MwbFQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hToZV-002RwI-9d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 14:19:54 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A259720863;
 Thu, 23 May 2019 14:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558621187;
 bh=WdPRcBAzLYCk1a5Tg2IsWPAke5bdt9URPFhOw0gXlK0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S4df5H49C66SGwtV+u3KR87W3r4/znLoHik+xz9zkZBABxGcL2O7QnVsRNY5qAeqf
 r34kRxR6WBDxnZvx//83slCxi0YrhxGpX2yAURvkPD5aWLUAjvYU4wIJDSlAxetv40
 IPwSamcd1TIpLAVLeblWygcYGTGysRUNu4eVBJ/w=
Date: Thu, 23 May 2019 07:19:46 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sahitya Tummala <stummala@codeaurora.org>
Message-ID: <20190523141946.GA12317@jaegeuk-macbookpro.roam.corp.google.com>
References: <1558586627-19784-1-git-send-email-stummala@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558586627-19784-1-git-send-email-stummala@codeaurora.org>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hToZV-002RwI-9d
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Fix up nat journal corruption
 with -a (auto-fix) option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/23, Sahitya Tummala wrote:
> Build segment manager and node manager always to catch and auto-fix
> invalid NAT entries found in the NAT journal.
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
> ---
>  fsck/mount.c | 28 +++++++++++++++-------------
>  1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/fsck/mount.c b/fsck/mount.c
> index ec22783..46d62ee 100644
> --- a/fsck/mount.c
> +++ b/fsck/mount.c
> @@ -943,6 +943,8 @@ static int f2fs_init_nid_bitmap(struct f2fs_sb_info *sbi)
>  			"NAT_JOURNAL_ENTRIES(%lu)\n",
>  			nats_in_cursum(journal), NAT_JOURNAL_ENTRIES);
>  		journal->n_nats = cpu_to_le16(NAT_JOURNAL_ENTRIES);
> +		c.auto_fix = 0;
> +		c.fix_on = 1;

BTW, we have some more error cases below. Can we add fix_on for them as well?

1077                 addr = le32_to_cpu(nat_in_journal(journal, i).block_addr);
1078                 if (!IS_VALID_BLK_ADDR(sbi, addr)) {
1079                         MSG(0, "\tError: f2fs_init_nid_bitmap: addr(%u) is invalid!!!\n", addr);
1080                         journal->n_nats = cpu_to_le16(i);
1081                         continue;
1082                 }
1083
1084                 nid = le32_to_cpu(nid_in_journal(journal, i));
1085                 if (!IS_VALID_NID(sbi, nid)) {
1086                         MSG(0, "\tError: f2fs_init_nid_bitmap: nid(%u) is invalid!!!\n", nid);
1087                         journal->n_nats = cpu_to_le16(i);
1088                         continue;
1089                 }

>  	}
>  
>  	for (i = 0; i < nats_in_cursum(journal); i++) {
> @@ -2363,19 +2365,6 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  
>  	print_ckpt_info(sbi);
>  
> -	if (c.auto_fix || c.preen_mode) {
> -		u32 flag = get_cp(ckpt_flags);
> -
> -		if (flag & CP_FSCK_FLAG ||
> -			(exist_qf_ino(sb) && (!(flag & CP_UMOUNT_FLAG) ||
> -						flag & CP_ERROR_FLAG))) {
> -			c.fix_on = 1;
> -		} else if (!c.preen_mode) {
> -			print_cp_state(flag);
> -			return 1;
> -		}
> -	}
> -
>  	c.bug_on = 0;
>  	c.feature = sb->feature;
>  
> @@ -2400,6 +2389,19 @@ int f2fs_do_mount(struct f2fs_sb_info *sbi)
>  		return -1;
>  	}
>  
> +	if (c.auto_fix || c.preen_mode) {
> +		u32 flag = get_cp(ckpt_flags);
> +
> +		if (flag & CP_FSCK_FLAG ||
> +			(exist_qf_ino(sb) && (!(flag & CP_UMOUNT_FLAG) ||
> +						flag & CP_ERROR_FLAG))) {
> +			c.fix_on = 1;
> +		} else if (!c.preen_mode) {
> +			print_cp_state(flag);
> +			return 1;
> +		}
> +	}
> +
>  	/* Check nat_bits */
>  	if (c.func != DUMP && is_set_ckpt_flags(cp, CP_NAT_BITS_FLAG)) {
>  		u_int32_t nat_bits_bytes, nat_bits_blocks;
> -- 
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
