Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D57B4A79BEF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 08:27:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0E2w-0002O2-GW;
	Thu, 03 Apr 2025 06:27:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u0E2v-0002Nv-Hy
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 06:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HllgY4tp7lBMdSLSWodxX990WKdZ87Bx+R3XYrzUr8o=; b=QmuJicJ7nST9AfY944x5hYkDUY
 m2EPuj4VhRCZSV2GD0GDkiycsfCplJ7xAilkL/61lAtxSt8gI/kv6xIbJidbWtoqbI3QcSrs/q3e1
 VcB/Ss7jxC6E2aWn2wHbNDwCah1nG4TN303JS/XmAYRZ8zK0Kx4HkfAcWIuQbunrGc5A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HllgY4tp7lBMdSLSWodxX990WKdZ87Bx+R3XYrzUr8o=; b=Zs0sefm/CGxQHOtgPKWscGpG16
 ZLbDyYhPU2CUtVnwHjna/lGfn8b+67bn1XoNYnlRuetJZzuQ+x4tdfZQwtJwuPSvHK9PmIwzSKWk3
 rgoVLElq3UqigeJvd7rySA5izSHTFJfuPCub61RV0dG5taqUKeCw76AXyv9H7qxuFkpw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0E2f-0003te-6N for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 06:27:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E14D43A0D;
 Thu,  3 Apr 2025 06:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE4CC4CEE9;
 Thu,  3 Apr 2025 06:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743661618;
 bh=fXrJUM8SeTerC0x9RnCZjNaU2MJi1ObxumgAG3z2PmU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZnZodorrqaY28iosFNvCGb6554ZQmXVNAbOUXZtG8yfiI2XoOSt3EXCsKDVOBtmIV
 EuRUCgboPsDxu45o/cJ8+zOVIosM5BHSeTFZecyffaZ1AJMn3MojxnQ6gzRKZlWrtI
 d6PqAsRIIooPyfkS1L7mhY4CgL/bd6H6w/I0+Lre/+VAhmx9apxmG5nwCELquvYB2n
 UORX65QowVHd7pDq9EhJbd8ORZcJf0t+tSo44DPEG5nozTq7wSL0g7o9+YFrp9HWkc
 g2fwKR7hmQNdrsIKn67NbzlTCOSbKDU0GeMklAlu3sJVkUjI9enPg13o1nqmJWyKGA
 qMsfMODpDRMTw==
Message-ID: <002ea626-8468-4587-b481-10d8b9bd7a0f@kernel.org>
Date: Thu, 3 Apr 2025 14:26:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250402080428.2811-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250402080428.2811-1-yohan.joung@sk.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/2 16:04,
 yohan.joung wrote: > When selecting a victim
 using next_victim_seg in a large section, the > selected section might already
 have been cleared and designated as the > new current sec [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u0E2f-0003te-6N
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: prevent the current section from
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/4/2 16:04, yohan.joung wrote:
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
>   fs/f2fs/segment.h | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
> index 0465dc00b349..129df633d656 100644
> --- a/fs/f2fs/segment.h
> +++ b/fs/f2fs/segment.h
> @@ -476,6 +476,12 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
>   		if (next >= start_segno + usable_segs) {
>   			if (test_and_clear_bit(secno, free_i->free_secmap))
>   				free_i->free_sections++;
> +
> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
> +				sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
> +
> +			if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
> +				sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Only need to reset next_victim_seg[] when setting section free?

if (!test_and_clear_bit(secno, free_i->free_secmap))
	goto skip_free;

free_i->free_sections++;

if (GET_SEC_FROM_SEG(sbi->next_victim_seg[BG_GC]) == secno)
	sbi->next_victim_seg[BG_GC] = NULL_SEGNO;
if (GET_SEC_FROM_SEG(sbi->next_victim_seg[FG_GC]) == secno)
	sbi->next_victim_seg[FG_GC] = NULL_SEGNO;

Thanks,

>   		}
>   	}
>   skip_free:



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
