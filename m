Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 312BEA5DFB1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 16:05:27 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsNe2-0005Sr-BZ;
	Wed, 12 Mar 2025 15:05:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tsNe0-0005Sl-Et
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+RGUNOZRooCDk6D5hl+WGvq+RBwfetxyw4loUhV8bss=; b=ISnyp29v03byEsz8keXtyghBwk
 paR8A5y2TAN5Cq2A8SB1tBStNja6pEg2uy8r78YN30g1vss2XB9potskmSZK6b2jhanezFj0gTqHq
 JTZ+7ISk0hH7jlNuyDg8N2xc71tP9JS41jDUU19yr7kdtsZYm5FZ6Ba2b6nr1UYQ4Bgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+RGUNOZRooCDk6D5hl+WGvq+RBwfetxyw4loUhV8bss=; b=cEIFQhRdHqu7CKfAxSWjmq3cbo
 EKFV1s0MZHjjZ4Eacd1jdKCgdcnNv9OdJs69mrELOZqHVHo8q4m+MRWk6Yye2UrYRrvDdvJxBA9Aa
 5Mns+rBHoX+mmM8rRFlymwcE1WelYlvllgHxMCtdZjLfRTZdH8yqeCoRFTNQf4BBYiwA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsNdn-0005mc-LP for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 15:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB5155C1D24;
 Wed, 12 Mar 2025 14:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDBF5C4CEDD;
 Wed, 12 Mar 2025 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741789656;
 bh=vDwFwAtBZOVv/LiDgNGup/VLBOobWxXV6QVTB8kVnNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQ6JJ8ih0IRaf49JNes3gyJbaHP43wrBhyc2ze6AYpSUd8kOVX6Kk8MO1ABtIeKjr
 vPN9AekTQzOz3YQo6saoJeldSivUFWy2ihGCaaVWsqwEgDhG2KOwZL5GoU25GgCZBX
 Rdy3qzgR7HlEkh9bV5uo4MVuXoVQVgEKJOnP+QeZtNeWpQSCaP2pOHGrdcYMemMhgZ
 wpRzop5dH+xkGwBCtOio9LipaM6nK80coOnwqWgnTuAl+aeYnm7x68XgMOf/Un8KGi
 Diuw0+rIi21I+RmVcJoOClRV+dasutb7AvjG/4CmDmzVK4DEiwwvwSH09pNOV30QqN
 2CPcOdBlHLfqA==
Date: Wed, 12 Mar 2025 14:27:34 +0000
To: Chunhai Guo <guochunhai@vivo.com>
Message-ID: <Z9GZ1kg6VVMFpomb@google.com>
References: <20250312102005.2893698-1-guochunhai@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250312102005.2893698-1-guochunhai@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/12, Chunhai Guo wrote: > fstrim may miss candidates
 that need to be discarded, as shown in the > examples below. > > The root
 cause is that when cpc->reason is set with CP_DISCARD, > add_discard [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tsNdn-0005mc-LP
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix missing discard candidates in
 fstrim
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/12, Chunhai Guo wrote:
> fstrim may miss candidates that need to be discarded, as shown in the
> examples below.
> 
> The root cause is that when cpc->reason is set with CP_DISCARD,
> add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have
> been synced by seg_info_to_raw_sit() [1], and it tries to find the
> candidates based on ckpt_valid_map and discard_map. However,
> seg_info_to_raw_sit() does not actually run before
> f2fs_exist_trim_candidates(), resulting in the failure.

I think we need to fix the above logic.

> 
> The code logic can be simplified for all cases by finding all the
> discard blocks based only on discard_map. This might result in more
> discard blocks being sent for the segment during the first checkpoint
> after mounting, which were originally expected to be sent only in
> fstrim. Regardless, these discard blocks should eventually be sent, and
> the simplified code makes sense in this context.
> 
> root# cp testfile /f2fs_mountpoint
> 
> root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
> Fiemap: offset = 0 len = 1
>         logical addr.    physical addr.   length           flags
> 0       0000000000000000 0000000406a00000 000000003d800000 00001000
> 
> root# rm /f2fs_mountpoint/testfile
> 
> root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
> /f2fs_mountpoint: 0 B (0 bytes) trimmed
> 
> Relevant code process of the root cause:
> f2fs_trim_fs()
>     f2fs_write_checkpoint()
>         ...
>         if (cpc->reason & CP_DISCARD) {
>                 if (!f2fs_exist_trim_candidates(sbi, cpc)) {
>                     unblock_operations(sbi);
>                     goto out; // No candidates are found here, and it exits.
>                 }
>             ...
>         }
> 
> [1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not
> to issue redundantly") for the relationship between
> seg_info_to_raw_sit() and add_discard_addrs().
> 
> Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
> ---
> v2->v3: Add f2fs_bug_on() to make sure it never issues discard to valid data's block address.
> v1->v2: Find all the discard blocks based only on discard_map in add_discard_addrs().
> v1: https://lore.kernel.org/linux-f2fs-devel/20250102101310.580277-1-guochunhai@vivo.com/
> ---
>  fs/f2fs/segment.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 86e547f008f9..c8ad8e3bfebb 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -2075,7 +2075,6 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
>  	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
>  	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
>  	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
> -	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
>  	unsigned long *discard_map = (unsigned long *)se->discard_map;
>  	unsigned long *dmap = SIT_I(sbi)->tmp_map;
>  	unsigned int start = 0, end = -1;
> @@ -2097,9 +2096,10 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
>  	}
>  
>  	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
> -	for (i = 0; i < entries; i++)
> -		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
> -				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
> +	for (i = 0; i < entries; i++) {
> +		dmap[i] = ~discard_map[i];
> +		f2fs_bug_on(sbi, (cur_map[i] ^ discard_map[i]) & cur_map[i]);
> +	}
>  
>  	while (force || SM_I(sbi)->dcc_info->nr_discards <=
>  				SM_I(sbi)->dcc_info->max_discards) {
> -- 
> 2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
