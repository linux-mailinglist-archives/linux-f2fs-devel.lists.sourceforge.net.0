Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F555A79CC5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Apr 2025 09:20:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u0Erq-0002Nd-9j;
	Thu, 03 Apr 2025 07:20:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u0Erp-0002Mf-2p
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B8+3FCndhK/eFuWswzqmm4Pv9tRETnx/dVWNcg6viYE=; b=H3VE6jFQMIklFFLtNVCZ+z+D4x
 HQ9xPva/VOt8JqFCr4Kd83imTrQa4fHvYHmyuBKgb+Gfjh7Ym+8NQ8yiuyHXmOVLv+B4T5J9z1hi7
 NP4/Dby0dB5e7A72/C42PYNrnC1hEJ+YWd86tGSIBR3s+jNBdWCX6NA6pkaFeQIrT8S4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B8+3FCndhK/eFuWswzqmm4Pv9tRETnx/dVWNcg6viYE=; b=EYHgZc8xMreHmgQL0qm186mJ8l
 8x2YJSnhFCrkJw1FQ4AXUtxAcMXsE+6foyV+u45DO19eEiLVTqQzDmAmGPBLJGNghzQFAhJOtMICd
 w7PTwsBQCgg4zY727yJRPn04WPPZExman4xqyByHRmwOT1zu60F2C5osLHhJoUHj5X9o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u0ErZ-00067f-ON for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Apr 2025 07:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BC43944667;
 Thu,  3 Apr 2025 07:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB76C4CEE8;
 Thu,  3 Apr 2025 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743664775;
 bh=2Gg7mQPZtQqIRFP+YKqKdJbYQPk/kewlGHSkoZ4su5M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=AilQEb4R9jSeMvaqJoefZhNtprms7+crlL5CFepBDG2tOgsZKvtJYzhzFwsPYAL1l
 6tgZnEsBpC/UXED1XuO08XspimgruR+eNUXs4MDoNiRsuqJMgcJt07qReq6qFYXQGl
 gGPGHXd/1mDnt0O2uJ7OuNI2HeQ7aniiuqjw0yezB5swTIbIpEtSW5z1bD+N3dhqRh
 pq4uS0blHrY3c71K8Ru/7Y9Hz/XKmgL+BysGAZ70nA7pJnM+vAeFN232ZBba+H8vH6
 iFb0j4XkGNPbpXgtROscNjIfiYXOTeGx9NJ7BHcT6gb9JJvj7ozBthSY8Ooq0JRAmj
 qpNt8k0xsPaMQ==
Message-ID: <d8dc7ba9-a46c-473c-aabf-90a417a300cc@kernel.org>
Date: Thu, 3 Apr 2025 15:19:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org
References: <20250403071016.2940-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250403071016.2940-1-yohan.joung@sk.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/3 15:10,
 yohan.joung wrote: > When selecting a victim
 using next_victim_seg in a large section, the > selected section might already
 have been cleared and designated as the > new current sec [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u0ErZ-00067f-ON
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: prevent the current section from
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

On 2025/4/3 15:10, yohan.joung wrote:
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

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
