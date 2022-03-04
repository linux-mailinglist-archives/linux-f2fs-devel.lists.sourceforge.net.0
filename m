Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D133F4CD107
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 10:29:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nQ4FL-0005rM-CC; Fri, 04 Mar 2022 09:29:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nQ4FJ-0005rF-Aa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 09:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HafY76HmVH3PTEDGR41tKV2i/C/KaRA43ZVYborCVmI=; b=J6EPJKfLbiGpGBpl3IuanenJh0
 BGH6bKtd3vZ2A9KQH++3URKQ6I/wmdpSmhC0xgb7GNa6Iz5nEmhXsJ/G3EtBluk6pZPv8xU5/1Faj
 uQDTosk11DoofaVe2jQ4LoxYkH3qqDjfMt+rVqjvRQwXlf/Ur7880td9j7U3rgrp+1vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HafY76HmVH3PTEDGR41tKV2i/C/KaRA43ZVYborCVmI=; b=ZqLDdSy2CKgrsjpR4xN/PCMJ1/
 EajIf9Q9CGb4rVsSMLzFfOfxKiTT8NYwytliKeiJIj9G79cfOtB8K7S+Fge6Ga73A6TY3IuFFqd0N
 Yx3RfvO2H49GOqgGg0TPVUzJ/b5AnLzVBmIAF6BosuyYcliAQidpFOynNdn9+FJNYsDE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nQ4FH-0003nu-8d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 09:29:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A685B827B7;
 Fri,  4 Mar 2022 09:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98404C340E9;
 Fri,  4 Mar 2022 09:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646386126;
 bh=3ZyGHoh6IanTsSvqHkAqFuBcwQnAyxkVM3EI89FxsvQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=J/veIj1vtbDybWYerGw3lXjK+ySuWAXxTr6gAZNl90zMlIWxoBGvmmyysLDTxUclj
 qjUCOsPaZB2tkCm5McrasfHjow1XEeGNe9PCGx2wwcODeJqQm/03N3pasadBU2N31i
 HhsIZ41i141/Eh8hDk5fCn6zelHz0bJCXHf6clQu+epx/E65joOgMhPY4BPzVg43zb
 PTS4hy2Y+aqXNCIonWxEGu66sVnvE9U+IlOIPUENkuv3dh0ZCDcbHv8nq21YcnSwPh
 /MoTmGt8/WSMyyK5Wu75F725f5nMq18insR+znYtTC1WNUKe+fWKUp+iwGtSBLitbF
 pOe6fvmurTPOQ==
Message-ID: <cac5624c-6338-b42a-346b-b6bfd86dda74@kernel.org>
Date: Fri, 4 Mar 2022 17:28:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220304021955.2524246-1-jaegeuk@kernel.org>
 <20220304021955.2524246-2-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220304021955.2524246-2-jaegeuk@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/4 10:19, Jaegeuk Kim wrote: > Unfair rwsem should
 be used when blk-cg is on. Otherwise, there is regression. > > FYI, we noticed
 a -26.7% regression of aim7.jobs-per-min due to commit: > > c [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nQ4FH-0003nu-8d
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: introduce F2FS_UNFAIR_RWSEM to
 support unfair rwsem
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
Cc: kernel test robot <oliver.sang@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/3/4 10:19, Jaegeuk Kim wrote:
> Unfair rwsem should be used when blk-cg is on. Otherwise, there is regression.
> 
> FYI, we noticed a -26.7% regression of aim7.jobs-per-min due to commit:
> 
> commit: e4544b63a7ee49e7fbebf35ece0a6acd3b9617ae ("f2fs: move f2fs to use reader-unfair rwsems")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
> 
> in testcase: aim7
> on test machine: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz with 128G memory
> with following parameters:
> 
> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: f2fs
> 	test: sync_disk_rw
> 	load: 100
> 	cpufreq_governor: performance
> 	ucode: 0x500320a
> 
> test-description: AIM7 is a traditional UNIX system level benchmark suite which is used to test and measure the performance of multiuser system.
> test-url: https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsourceforge.net%2Fprojects%2Faimbench%2Ffiles%2Faim-suite7%2F&amp;data=04%7C01%7Cchao.yu%40oppo.com%7C22ad61cc1e204e1d63e908d9fd858d65%7Cf1905eb1c35341c5951662b4a54b5ee6%7C0%7C0%7C637819572336831789%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SMV5sGpVhSvjC8sbrKpKGT27J35Bm1%2B3KoM4yeraceA%3D&amp;reserved=0
> 
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
