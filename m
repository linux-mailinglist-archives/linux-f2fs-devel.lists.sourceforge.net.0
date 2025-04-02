Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8AEA788DD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Apr 2025 09:34:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzsbz-00082T-2e;
	Wed, 02 Apr 2025 07:34:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tzsbn-000820-Pv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 07:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GWl3GDxF79uPqDxO1fUQUlVbGf3r1LKhZoC6XwDGNR4=; b=X6CeOzZMtcVzo7/AE9NUiuxpNk
 Cj/Fm6lOSmZQAVv5nayhpIRlnac6XuuEQjs/rrBCyS1Q9igNNLT/PxSCa7o8IsQdfAsOnelxMY4Dn
 bDkCwNglhAyfuMX1zKr6BjH7O3qnFpIZ6EXIKvkCANs+YupgCSlSve1Psgt2AwWdL+ng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GWl3GDxF79uPqDxO1fUQUlVbGf3r1LKhZoC6XwDGNR4=; b=gVk7NkKZEcV97SZgJK3g08Ogbh
 ZNI05gMV7N/m8Uv31X9XiJApwXzf7v3ksKPfBq8E9h5HfbLcsUBEmFVkkaVOo7E6jIPnkVle/rDfR
 zBxlxxb7dz69VShqZVe+/QVas+IBUUozGVbndyJgT0Iy4xgc3km9HFafJi/DsBrt6ODw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzsbX-0003yj-GE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Apr 2025 07:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8D3E140C24;
 Wed,  2 Apr 2025 07:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E2BC4CEDD;
 Wed,  2 Apr 2025 07:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743579217;
 bh=b7/z+v+dRK3PsbS6by6MwpH6N9jR2YN5LuzxOdBQ5Mo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YNtpCe711Nye01QngIJFBtC/uDDptYD02pfHLQnsiwI2jvWBmIPITGz095PdWRwJQ
 22vowJSoC6C3Qw7/EgagYDR1OsDt+GWhjXVXzJHpxlhUtaScSnYMdZ72ZljN133Pid
 /aV+ldylK4s/ZHOwZzYPEr3FFYHM9pVB7EYxwYAiAVshaKOvY9dyir8kYmw6VudIRq
 GTjdaeSu+IGkk9V13cBbDKCBCllGQTMpwwkuwszR+BEsAFCaDCkia1HNj7//pS7M9z
 XPA0OoBfPNzPT3UC1sWkzl7bTr7wGlqVlc8BZoiiV/oj1NO46OZmXi3LBLKvOKxKgd
 bGPOqipzMRPjw==
Message-ID: <7440d324-03f4-44a6-b6bf-4f569c829214@kernel.org>
Date: Wed, 2 Apr 2025 15:33:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250402005219.2759-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250402005219.2759-1-yohan.joung@sk.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/2/25 08:52, yohan.joung wrote: > When selecting a victim
 using next_victim_seg in a large section, the > selected section might already
 have been cleared and designated as the > new current secti [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tzsbX-0003yj-GE
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: prevent the current section from
 being selected as a victim during GC
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
Cc: pilhyun.kim@sk.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/2/25 08:52, yohan.joung wrote:
> When selecting a victim using next_victim_seg in a large section, the
> selected section might already have been cleared and designated as the
> new current section, making it actively in use.
> This behavior causes inconsistency between the SIT and SSA.
> 
> F2FS-fs (dm-54): Inconsistent segment (70961) type [0, 1] in SSA and SIT
> Call trace:
> dump_backtrace+0xe8/0x10c
> show_stack+0x18/0x28
> dump_stack_lvl+0x50/0x6c
> dump_stack+0x18/0x28
> f2fs_stop_checkpoint+0x1c/0x3c
> do_garbage_collect+0x41c/0x271c
> f2fs_gc+0x27c/0x828
> gc_thread_func+0x290/0x88c
> kthread+0x11c/0x164
> ret_from_fork+0x10/0x20
> 
> issue scenario
> segs_per_sec=2
> - seg#0 and seg#1 are all dirty
> - all valid blocks are removed in seg#1
> - gc select this sec and next_victim_seg=seg#0
> - migrate seg#0, next_victim_seg=seg#1
> - checkpoint -> sec(seg#0, seg#1)  becomes free
> - allocator assigns sec(seg#0, seg#1) to curseg
> - gc tries to migrate seg#1
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/segment.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0465dc00b349..14d18bcf3559 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -460,6 +460,7 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  		unsigned int segno, bool inmem)
>  {
>  	struct free_segmap_info *free_i = FREE_I(sbi);
> +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>  	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>  	unsigned int start_segno = GET_SEG_FROM_SEC(sbi, secno);
>  	unsigned int next;
> @@ -476,6 +477,11 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>  		if (next >= start_segno + usable_segs) {
>  			if (test_and_clear_bit(secno, free_i->free_secmap))
>  				free_i->free_sections++;
> +
> +			if (test_and_clear_bit(secno, dirty_i->victim_secmap)) {
> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

sbi->next_victim_seg[FG_GC] relies on sbi->cur_victim_sec?

If sbi->next_victim_seg[BG_GC] is not equal to secno, will we still need to
nullify sbi->next_victim_seg[BG_GC]?

We have cleared bit in victim_secmap after we tag a section as prefree, right?

- locate_dirty_segment
 - __locate_dirty_segment
 - __remove_dirty_segment
  - clear_bit(GET_SEC_FROM_SEG(sbi, segno), dirty_i->victim_secmap);

Thanks,

> +			}
>  		}
>  	}
>  skip_free:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
