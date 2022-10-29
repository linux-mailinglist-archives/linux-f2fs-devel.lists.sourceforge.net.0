Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 53925611FD3
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 05:38:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oocg6-0000z3-Br;
	Sat, 29 Oct 2022 03:38:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oocg4-0000yx-Q6
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 03:38:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NZwLUqyDwBAuL7Zv9pN771PSh8Ic+s2U2Gxsx0i1Gdc=; b=CfEI5J192RVsUU+R2hxNEqV8kx
 bbaU7muxEr/PPjTE+/NoWAFzI8jMSHp8oJvxZ0s7wIsAhFW1gQQAGZM397YO4U1WW0Cl8WZRv2NAZ
 I69lG5WgKIQ4iJlRGN6z67Xgf5kjFQb+1vl86MDx16f04gqeQbNvAWiW2d04yyyTJzHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NZwLUqyDwBAuL7Zv9pN771PSh8Ic+s2U2Gxsx0i1Gdc=; b=QGFrmuh/nnrjI3Cc577t1tpgOb
 aWDQlBY5AYB/ne88cYIbkNfWqhRIdhANqvNgbWhrp5k1YmqKC7AR6dlds8kPPU1NOl6SHaBiKIbdZ
 FmIjw0jDG4oIICygX97shQvsEyfHG6SEbjZx0rR7TCKFhBo1yhfAr3P4UscISsM8+4LQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oocg2-0003cX-AI for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 03:38:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D965B82DF6;
 Sat, 29 Oct 2022 03:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F289C433C1;
 Sat, 29 Oct 2022 03:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667014702;
 bh=GDYgRLpPM2uZtvu6eyY88zG1Hs6CG0ltXrGiCBBjrb8=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=oeTSfSxUNfBG+B/2hQF/jWGp3yDmPDinrgnSMFVEn2PjpxGHXZtl2Su8bozODgFfx
 CNLixUiS3jfrzF2sFoYKMk1zz6XlxTC3B0bN7Y92LTfdFaGQXdtydRzhwvcNkWOhXC
 sfqWRB8Xn9lBvLMAzoRFVLNVhCJnzRRPJjGLZ9s6JYQVWi+ZgxprzzNPRU/bc2X9Zp
 nI1fRuDKwnMZ1NMBOhrYBNgcNJL3I1IKyC1MHsc+A8odwcGON9uQX05gJ5xSBlohDK
 tn0h65rYiJ6xN6OH+7PKngW64eMuwHOrBqUq82Dp+4zWGq3ea+TPisFj/F+zQ/Kzj3
 1X6AQTiuwk3Eg==
Message-ID: <0bfe4dab-6316-401c-3b6f-49df0ca0a271@kernel.org>
Date: Sat, 29 Oct 2022 11:38:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20221025132638.38260-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221025132638.38260-1-frank.li@vivo.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/25 21:26, Yangtao Li via Linux-f2fs-devel wrote:
 > This patch adds a new proc entry to show discard_plist > information in
 more detail, which is very helpful to > know the discard pend list [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oocg2-0003cX-AI
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add proc entry to show
 discard_plist info
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/25 21:26, Yangtao Li via Linux-f2fs-devel wrote:
> This patch adds a new proc entry to show discard_plist
> information in more detail, which is very helpful to
> know the discard pend list count clearly.
> 
> Such as:
> 
> Discard pend list(Show diacrd_cmd count on each entry, .:not exist):

Discard pending list

>    0       390     156      85      67      46      37      26      14
>    8        17      12       9       9       6      12      11      10
>    16        5       9       2       4       8       3       4       1
>    24        3       2       2       5       2       4       5       4
>    32        3       3       2       3       .       3       3       1
>    40        .       4       1       3       2       1       2       1
>    48        1       .       1       1       .       1       1       .
>    56        .       1       1       1       .       2       .       1
>    64        1       2       .       .       .       .       .       .
>    72        .       1       .       .       .       .       .       .
>    80        3       1       .       .       1       1       .       .
>    88        1       .       .       .       1       .       .       1
> ......
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
> v2:
> -move to procfs entry
>   fs/f2fs/sysfs.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index df27afd71ef4..0fc17375e042 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -1243,6 +1243,44 @@ static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
>   	return 0;
>   }
>   
> +static int __maybe_unused discard_plist_seq_show(struct seq_file *seq,
> +						void *offset)
> +{
> +	struct super_block *sb = seq->private;
> +	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
> +	int i, count;
> +
> +	seq_puts(seq, "Discard pend list(Show diacrd_cmd count on each entry, .:not exist):\n");
> +	if (!f2fs_realtime_discard_enable(sbi))
> +		return 0;
> +
> +	if (dcc) {

IIUC, dcc should always be valid.

> +		mutex_lock(&dcc->cmd_lock);
> +		for (i = 0; i < MAX_PLIST_NUM; i++) {
> +			struct list_head *pend_list;
> +			struct discard_cmd *dc, *tmp;

unsigned int count = 0;

> +
> +			if (i % 8 == 0)
> +				seq_printf(seq, "  %-3d", i);

seq_printf(seq, "%-10d", i);

> +			count = 0;
> +			pend_list = &dcc->pend_list[i];
> +			list_for_each_entry_safe(dc, tmp, pend_list, list)
> +				count++;
> +			if (count)
> +				seq_printf(seq, " %7d", count);

On 16TB size device, there will be about 2 billion discard entry at
maximum, so %10d will be more safe?

How about introducing an array to record discard numbers, if there is
millions of discard, lookuping this proc entry may hang f2fs due to
holding cmd_lock for long time.

> +			else
> +				seq_puts(seq, "       .");

It's fine to show '0' here.

> +			if (i % 8 == 7)
> +				seq_putc(seq, '\n');

else
	seq_putc(seq, ' ');

> +		}
> +		seq_putc(seq, '\n');
> +		mutex_unlock(&dcc->cmd_lock);
> +	}
> +
> +	return 0;
> +}
> +
>   int __init f2fs_init_sysfs(void)
>   {
>   	int ret;
> @@ -1313,6 +1351,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
>   #endif
>   		proc_create_single_data("victim_bits", 0444, sbi->s_proc,
>   				victim_bits_seq_show, sb);
> +		proc_create_single_data("discard_plist_info", 0444, sbi->s_proc,

Well, discard_plist?

Thanks,

> +				discard_plist_seq_show, sb);
>   	}
>   	return 0;
>   put_feature_list_kobj:
> @@ -1336,6 +1376,7 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
>   		remove_proc_entry("segment_info", sbi->s_proc);
>   		remove_proc_entry("segment_bits", sbi->s_proc);
>   		remove_proc_entry("victim_bits", sbi->s_proc);
> +		remove_proc_entry("discard_plist_info", sbi->s_proc);
>   		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
>   	}
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
