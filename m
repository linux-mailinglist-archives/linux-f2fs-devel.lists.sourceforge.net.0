Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0D7A664CE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Mar 2025 02:18:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tuLbc-0006kA-Ew;
	Tue, 18 Mar 2025 01:18:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tuLbb-0006k1-EI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X2KJLwjkRG/UWj7qsWSfpguxvBDPT8z/siscjV75OsQ=; b=KORNfrlwaxNeESp6JV+98j1rs4
 qYj03rTmGuotyyILWOwW+29e65IudVisgDTKeezwRBeDMvq4FPAuIPTdUObTB+NqmR2PB+BbXkGv+
 5aGKseq8K49m4Yrh3DLkJs2HE/LgwQlgimAgIy+vMhtjinUVskFjzyfMeVIH1H73hYSM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=X2KJLwjkRG/UWj7qsWSfpguxvBDPT8z/siscjV75OsQ=; b=gce/uvy8IDOD/rpEhmu6IJvfLa
 XwH+jK88E09/BSgfYaHkpQSowTvpy4Ava8SZu4GxAr+np1cJjpadvWJvjUJoXXeC2JB1IiiW8eviw
 wtDdKz+UwyMwuEIPI7xQGeKk0gpCYGD0Y9zH5gGNzSlx8j79Px/gKJ1wldq4AAD8zAQ0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tuLba-0006Jk-NP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Mar 2025 01:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 545D6A41AAB;
 Tue, 18 Mar 2025 01:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AD1C4CEE3;
 Tue, 18 Mar 2025 01:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742260723;
 bh=YSMbJQm0dtkQCgXKxD1IBYJdlWjjJpfSyCN7la2UKg8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=NbQtkQ8sdbI2EhaGjfAO8JcdK/s5hZsL/zi0FGzYsodq27nzkUlP+cVHPWxqnt/dr
 4ZbbTMlB/Ce/7GAo65RwTnz4P71hcrileui7yCA/NZSsn+uMPUKPZ5QcCZ0mMOdUg+
 M1pA7DjA58/4fH6DJZCPX7yQUJfF4wcLe5cM5Sm7GPb+8kSf2dRzisdiOcz8NE8hom
 K8QWHzOPt9CZo1i628dvt1KosDWVUGo0O3tjwTx2/n2J7+6OrFmF23KEysFGhlz2am
 PwYLxJNnQeyJyWuw8HRvVPMVVT4gFxdi74tUNnBSsj1RkbO1oNHSHuGyFfgX4zU4E7
 3qZxCtQIv80Ow==
Message-ID: <0cbe2a82-6e1c-425d-a967-85e4de44067d@kernel.org>
Date: Tue, 18 Mar 2025 09:18:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chunhai Guo <guochunhai@vivo.com>, jaegeuk@kernel.org
References: <20250317101624.3223575-1-guochunhai@vivo.com>
Content-Language: en-US
In-Reply-To: <20250317101624.3223575-1-guochunhai@vivo.com>
X-Spam-Score: -2.8 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/17/25 18:16, Chunhai Guo wrote: > During a checkpoint, 
 the current active segment X may not be handled > properly. This occurs when
 segment X has 0 valid blocks and a non-zero > number of discard [...] 
 Content analysis details:   (-2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tuLba-0006Jk-NP
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix missing discard for active
 segments
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/17/25 18:16, Chunhai Guo wrote:
> During a checkpoint, the current active segment X may not be handled
> properly. This occurs when segment X has 0 valid blocks and a non-zero
> number of discard blocks, for the following reasons:
> 
> locate_dirty_segment() does not mark any active segment as a prefree
> segment. As a result, segment X is not included in dirty_segmap[PRE], and
> f2fs_clear_prefree_segments() skips it when handling prefree segments.
> 
> add_discard_addrs() skips any segment with 0 valid blocks, so segment X is
> also skipped.
> 
> Consequently, no `struct discard_cmd` is actually created for segment X.
> However, the ckpt_valid_map and cur_valid_map of segment X are synced by
> seg_info_to_raw_sit() during the current checkpoint process. As a result,
> it cannot find the missing discard bits even in subsequent checkpoints.
> Consequently, the value of sbi->discard_blks remains non-zero. Thus, when
> f2fs is umounted, CP_TRIMMED_FLAG will not be set due to the non-zero
> sbi->discard_blks.
> 
> Relevant code process:
> 
> f2fs_write_checkpoint()
>     f2fs_flush_sit_entries()
>          list_for_each_entry_safe(ses, tmp, head, set_list) {
>              for_each_set_bit_from(segno, bitmap, end) {
>                  ...
>                  add_discard_addrs(sbi, cpc, false); // skip segment X due to its 0 valid blocks
>                  ...
>                  seg_info_to_raw_sit(); // sync ckpt_valid_map with cur_valid_map for segment X
>                  ...
>              }
>          }
>     f2fs_clear_prefree_segments(); // segment X is not included in dirty_segmap[PRE] and is skipped
> 
> This issue is easy to reproduce with the following operations:
> 
> root # mkfs.f2fs -f /dev/f2fs_dev
> root # mount -t f2fs /dev/f2fs_dev /mnt_point
> root # dd if=/dev/blk_dev of=/mnt_point/1.bin bs=4k count=256
> root # sync
> root # rm /mnt_point/1.bin
> root # umount /mnt_point
> root # dump.f2fs /dev/f2fs_dev | grep "checkpoint state"
> Info: checkpoint state = 45 :  crc compacted_summary unmount ---- 'trimmed' flag is missing
> 
> Since add_discard_addrs() can handle active segments with non-zero valid
> blocks, it is reasonable to fix this issue by allowing it to also handle
> active segments with 0 valid blocks.
> 
> Fixes: b29555505d81 ("f2fs: add key functions for small discards")
> Signed-off-by: Chunhai Guo <guochunhai@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
