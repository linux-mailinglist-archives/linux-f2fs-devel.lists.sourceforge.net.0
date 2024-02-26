Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCE866848
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Feb 2024 03:41:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1reQvP-00020w-Lj;
	Mon, 26 Feb 2024 02:41:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1reQvO-00020n-3S
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:41:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cZ4kvREKEeE8AWMScKwJNIrDH2T4AukCvFXoUmAlvhc=; b=HQOSmT50IgADa0k0CJhiCKu3A/
 qTK12ZEE/1OnMtOgDLf8hkbgg6GqGdxzBlvjhbswtPi+zEXnnpQI419HzTxVnzPVbsmbG6E24TH82
 V8fk/O31MX13UdZL0uC2CVmEeDEtJaoVEWbdUQmC+PrGveoyjPY8jJLsc7vBks2o0J/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cZ4kvREKEeE8AWMScKwJNIrDH2T4AukCvFXoUmAlvhc=; b=K0C6hReyiWfM/y2PaT0ku5MQBB
 w/MdzzDDr9CuojE9WU42w/8Ww1qI5LywjacMREbpwm8QX2wZvR1SMLlaKYjF/GIQLJ+Pf8PCj/Dt2
 Ngf5EyjRvBXryhOgk4eUjW+5Fso/ABY6hZCx9tYv0m8nJZcY4tkWVchr22GPwGyiS+jc=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1reQvJ-0001zj-Qg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Feb 2024 02:41:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DC9BBCE0E97
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Feb 2024 02:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3693CC433F1;
 Mon, 26 Feb 2024 02:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708915245;
 bh=DuGF9S4m4uhmiHy72DnJgIonHHmX99UDPQZHNKqVFP4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=F6+HRb/9hWHnekgZ+zmflcvQfEybBYrxw8KGD0fT7IoNYR+T09ePn8ZhQqQpmAKCt
 T71rbKStsjrTOarQmZhP7H4NFyyLWgr6iJkv04hsYvOfZgVKPC62tyPd2EV4L9C8Bg
 SpnS/gVfqrZYUJKm7g6RhMSmBiQbvyIs69lA/8oLxhKW+hbL1aIElUc2GvuWAv4NUi
 sGPYkLTPb1K9S2zQY5LHfeEqBXhM5BESicI/1A/ThQQeEINVbVmd2EEf4r+/JCj7J1
 mDvS0zf9iEmNaDgyLsZRJLnQkHpah6zgr6BjQdn2rgYh45nlJLSMtJcfzRs+o1icyv
 inYsj1VB/ehjA==
Message-ID: <afa444c5-7ac1-457e-9559-6d7c6623c426@kernel.org>
Date: Mon, 26 Feb 2024 10:40:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240223205535.307307-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240223205535.307307-1-jaegeuk@kernel.org>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/24 4:55,
 Jaegeuk Kim wrote: > In cfd66bb715fd ("f2fs:
 fix deadloop in foreground GC"), we needed to check > the number of blocks
 in a section instead of the segment. > > In addtion, let's ch [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1reQvJ-0001zj-Qg
Subject: Re: [f2fs-dev] [PATCH 1/5] f2fs: check number of blocks in a
 current section
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

On 2024/2/24 4:55, Jaegeuk Kim wrote:
> In cfd66bb715fd ("f2fs: fix deadloop in foreground GC"), we needed to check
> the number of blocks in a section instead of the segment.
> 
> In addtion, let's check the entire node sections when checking the avaiable
> node block space. It does not match one to one per temperature, but currently

I tested this patch w/ testcase in [1], it doesn't complain.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=215914

> we don't have exact dirty page count per temperature. Hence, use a rough
> estimation.

Do we need more accurate per-temperature dirty node count for extreme
corner case?

e.g. node_blocks is counted from hot dirty nodes, and current hot_node
log has no enough free space for it.

Thanks,

> 
> Fixes: cfd66bb715fd ("f2fs: fix deadloop in foreground GC")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/segment.h | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 3edd3809b6b5..15bf5edd9b3c 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -561,23 +561,23 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
>   			unsigned int node_blocks, unsigned int dent_blocks)
>   {
>   
> -	unsigned int segno, left_blocks;
> +	unsigned segno, left_blocks;
>   	int i;
>   
> -	/* check current node segment */
> +	/* check current node sections, which counts very roughly */
> +	left_blocks = 0;
>   	for (i = CURSEG_HOT_NODE; i <= CURSEG_COLD_NODE; i++) {
>   		segno = CURSEG_I(sbi, i)->segno;
> -		left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> -				get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> -
> -		if (node_blocks > left_blocks)
> -			return false;
> +		left_blocks += CAP_BLKS_PER_SEC(sbi) -
> +				get_ckpt_valid_blocks(sbi, segno, true);
>   	}
> +	if (node_blocks > left_blocks)
> +		return false;
>   
> -	/* check current data segment */
> +	/* check current data section for dentry blocks. */
>   	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
> -	left_blocks = f2fs_usable_blks_in_seg(sbi, segno) -
> -			get_seg_entry(sbi, segno)->ckpt_valid_blocks;
> +	left_blocks = CAP_BLKS_PER_SEC(sbi) -
> +			get_ckpt_valid_blocks(sbi, segno, true);
>   	if (dent_blocks > left_blocks)
>   		return false;
>   	return true;
> @@ -626,7 +626,7 @@ static inline bool has_not_enough_free_secs(struct f2fs_sb_info *sbi,
>   
>   	if (free_secs > upper_secs)
>   		return false;
> -	else if (free_secs <= lower_secs)
> +	if (free_secs <= lower_secs)
>   		return true;
>   	return !curseg_space;
>   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
