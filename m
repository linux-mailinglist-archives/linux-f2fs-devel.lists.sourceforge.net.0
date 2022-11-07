Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DAC61E83B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Nov 2022 02:25:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1orqtB-0005yw-35;
	Mon, 07 Nov 2022 01:25:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1orqt9-0005yq-KZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 01:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B2/7XRs8/GUUOF+W4Cq6u8AsvxtjXLRPg5JrxDQvPwg=; b=QrCeYE7sliE4oLOYkwsdQjb5BR
 V80oyc0Y8LTeZilA3U6lyBsQiAU47FbtI4RZ6i1HnO+/Uno4uK8zc+DFl6YlQieMwNsMtbh/5eEgB
 jL8A4SNEXa4Ti/htInOfDLglAYAshiooGqTACbu2SvriW1/v9a/N9t9GxIeexmx1J+IQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B2/7XRs8/GUUOF+W4Cq6u8AsvxtjXLRPg5JrxDQvPwg=; b=FCczwgI9oTKiUTsMgSJQV6XLQx
 d/+qTWkHwVa/5wwagBq1ur2BLg6mCHW6rW5Ftk7D6XtRCy/21YSFXpRBvgk8qcSzxwajahXlZZ7fN
 UCmN3L1BXULqVtEtqVknAdesY17QbOl6yyvDNB70cVCxC2/X55RAHyeIB+6fcM7sSMyA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1orqt8-00Ea43-SP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Nov 2022 01:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55330B80D71;
 Mon,  7 Nov 2022 01:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C675AC433D6;
 Mon,  7 Nov 2022 01:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667784315;
 bh=tk00DWLZn8UdWpKhWBEVC5BzHAP8Recbed1ijqVL3lU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HcZDpCY2gaR9TFg+qeHgIXFqzzyNttYt9OF/v1FREAbNXTRFFEM1U5BuHW+nbUWRS
 ohChy5Gia3vCETSkUdC9DFVGrU8NJdN46n3tsCaSpgFgjOiTjzs31DbBLVk/3G3vce
 s3QqW4bao9ahI1SxPHF+eC1WbzV3RaBfEDh6085DBkoLfJ6xYNV9y13anwzguSgQC8
 q9HelmcrU794A+B69aDfRiINtRk93kZHKjPVcUlLr2O4rYUQDjPyrxZeVQXIpNvLjU
 KKw1bCp2NuSRxWBqs7c3awDhRRujHSWv5iq9ISbewom6sIkfMcU4iTE1UOF7LcgJtm
 XIUr/aFCi2uuQ==
Message-ID: <9e22b747-5e59-9a1c-5ff1-fd4f2d6e43fc@kernel.org>
Date: Mon, 7 Nov 2022 09:25:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: "zhiguo.niu" <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <1667547621-26175-1-git-send-email-zhiguo.niu@unisoc.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1667547621-26175-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/4 15:40,
 zhiguo.niu wrote: > From: Zhiguo Niu <zhiguo.niu@unisoc.com>
 > > There is bug on issue after atgc feature is enabled in > 32bits platform
 as the following log: > > F2FS-fs (dm-x): [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1orqt8-00Ea43-SP
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix atgc bug on issue in 32bits
 platform
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
Cc: niuzhiguo84@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/4 15:40, zhiguo.niu wrote:
> From: Zhiguo Niu <zhiguo.niu@unisoc.com>
> 
> There is bug on issue after atgc feature is enabled in
> 32bits platform as the following log:
> 
> F2FS-fs (dm-x): inconsistent rbtree, cur(3470333575168) next(3320009719808)
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/gc.c:602!
> Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
> PC is at get_victim_by_default+0x13c0/0x1498
> LR is at f2fs_check_rb_tree_consistence+0xc4/0xd4
> ....
> [<c04d98b0>] (get_victim_by_default) from [<c04d4f44>] (f2fs_gc+0x220/0x6cc)
> [<c04d4f44>] (f2fs_gc) from [<c04d4780>] (gc_thread_func+0x2ac/0x708)
> [<c04d4780>] (gc_thread_func) from [<c015c774>] (kthread+0x1a8/0x1b4)
> [<c015c774>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
> 
> The reason is the 64bits key in struct rb_entry has __packed attibute
> but has not in struct victim_entry, so the wrong key value got by
> in f2fs_check_rb_tree_consistence, the following are the memory layouts
> of struct rb_entry and struct victim_entry in 32bits platform:
> 
> struct rb_entry {
>     [0] struct rb_node rb_node;
>         union {
>             struct {...};
>    [12]     unsigned long long key;
>         };
> }
> struct victim_entry {
>     [0] struct rb_node rb_node;
>         union {
>             struct {...};
>    [16]     struct victim_info vi;
>         };
>    [32] struct list_head list;
> }

Shouldn't we add __packed for struct victim_entry?

> 
> This patch fix this inconsistence layout of 64bits key between
> struct rb_entry and struct victim_entry.
> 

Fixes: 093749e296e2 ("f2fs: support age threshold based garbage collection")

> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
