Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965AAB31BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 May 2025 10:33:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KRXk0ardVyohD4kxay32fKTOxK6seMDzGfmeiB4REI8=; b=fJ0X99yOGbxDQLQHUKX0u3P/aG
	rj5fPdVR+DIichrP5aHNvtAT4HiKJvkoVnSD8vS7BEVqr2AMla0KazfiN7t1dMLjZU2xwpoC93Jjy
	Xc4KHM50JeStckAXD7sUTZj3bbtDctjKo22gj+aMsxhRmTQOz2EELcWboxroZ9FI3QYs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uEOar-0006oD-IM;
	Mon, 12 May 2025 08:33:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uEOal-0006o0-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 08:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8XMCgG6ybGVEK9xeF/T1eKwSLHsbuL69QIP1QOPyc78=; b=aBTC00eYienOOjCsTFsIX8wuzg
 0KvZtxoCX8tZxnJFykttsYsOc56JgGLXmMb1VkYsBRvkwKIOmUBZmZL+elexKxh+0FPB8rvlNDk6C
 Wton1dyNS5OWbK3ROI8WvAWKwnX760fo7blTLJuLVEdsHJhsJzA0sctQN+WMj6UIOGtw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8XMCgG6ybGVEK9xeF/T1eKwSLHsbuL69QIP1QOPyc78=; b=L1i/hXYOFvWnr0fSz43Wq2DQwf
 m1wVdMVefSBM0s5902s6032i1OZQ535OmOq1okm7Cp9AtH3x3KP4t9CrQ7P6vAhGi8W++J2zKy/6L
 hiGbiEjCN8vR42F8Gsm6leRdQ6V4jbbSHshoIOosw3girYyJORpBpf+52tvlRW/5Sf+o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uEOal-0007Kz-5G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 May 2025 08:32:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 72A845C5CCF;
 Mon, 12 May 2025 08:30:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02563C4CEE7;
 Mon, 12 May 2025 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1747038764;
 bh=GX8fYHvvYUXe+jT1O2CX8/xQ4AmFtSJKyE3+LifDO/s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TNWL1fLxQSTG+ahjZwR5I27l9cZT4zu/0hlxQ8kgnxamU3rAAN44dt4Kd4oiGcHTp
 9nT79CIx01TIQgT20ifARlPCz7/0OYmm5TWYCgHCDZS7ihTfbV6z4RV+Dtt8y7rYAN
 0XBs2GwxCM5NC4bht6Pv86/r7rJFMAaMg3VeNR4ZJpPrdxAGHlkZHsEY+uyGkjlhTN
 QFw/ZQzdmSLgTmcn5KqIYZWJd09mayxjTJUFNk/ndP4x6dw7tNgUxjmxSzA4xUiWI5
 bHFiAdbUsFe8I+4XZSlLgO9H11c20JzT4DdTLFh9URgdEcWX31t8RsTU20dgmBbK8j
 p1tlD4+64SgYQ==
Message-ID: <bcb59f9d-a908-4ea4-ba24-af4cfa54145b@kernel.org>
Date: Mon, 12 May 2025 16:32:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yohan.joung" <yohan.joung@sk.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20250512073611.718-1-yohan.joung@sk.com>
 <20250512073611.718-2-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250512073611.718-2-yohan.joung@sk.com>
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/25 15:36,
 yohan.joung wrote: > when performing buffered
 writes in a large section, > overhead is incurred due to the iteration through
 > ckpt_valid_blocks within the section. > when SEGS_PER_S [...] 
 Content analysis details:   (-6.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/, high
 trust [139.178.84.217 listed in list.dnswl.org]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uEOal-0007Kz-5G
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add ckpt_valid_blocks to the
 section entry
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

On 5/12/25 15:36, yohan.joung wrote:
> when performing buffered writes in a large section,
> overhead is incurred due to the iteration through
> ckpt_valid_blocks within the section.
> when SEGS_PER_SEC is 128, this overhead accounts for 20% within
> the f2fs_write_single_data_page routine.
> as the size of the section increases, the overhead also grows.
> to handle this problem ckpt_valid_blocks is
> added within the section entries.
> 
> Test
> insmod null_blk.ko nr_devices=1 completion_nsec=1  submit_queues=8
> hw_queue_depth=64 max_sectors=512 bs=4096 memory_backed=1
> make_f2fs /dev/block/nullb0
> make_f2fs -s 128 /dev/block/nullb0
> fio --bs=512k --size=1536M --rw=write --name=1
> --filename=/mnt/test_dir/seq_write
> --ioengine=io_uring --iodepth=64 --end_fsync=1
> 
> before
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2145MiB/s
> 
> after
> SEGS_PER_SEC 1
> 2556MiB/s
> SEGS_PER_SEC 128
> 2556MiB/s
> 
> Signed-off-by: yohan.joung <yohan.joung@sk.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
