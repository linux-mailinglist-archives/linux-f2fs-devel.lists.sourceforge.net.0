Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B47C2AD82B4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Jun 2025 07:49:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NQkrGeWMjHqQUpNiE9xcjL4+PQy8FKJ/gaU/nwtKYLQ=; b=bE3BuQORhgFT0/oE4xQNIg5xhJ
	vqfBKu5FfYynDKynWiYTxKhsiiIxsGY5+zUMjNn/yDXsqOE4b0mEs3/zrqwWgxo7AU+fuiPfWhQoa
	uqMwut2K+uE12LszqMh0tZ4oeeNZDdOpzYNPyVO0+esxWhQEJs7xsGciNDHOoAcIc6RM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uPxHh-00017E-UP;
	Fri, 13 Jun 2025 05:49:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uPxHg-00016x-HT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u0avzBjdXtua9jShjDLq5tALaHext5lV91IppW/GyD8=; b=bWBOglnHU/SbWUNbWUmmb99jc+
 PpMolKfGGFftcZbVasFwBmXmuZ5qMMu9ihueHHSdaAd3FERGBbPWBroj3Y6eEXpoTvwul3SmNCjHs
 U/5rjYO6EXCJXedQMtwfjb195blw0Sr1OUaEtFfYSoTC50qLKXXd6whiAb/EXezf+AAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u0avzBjdXtua9jShjDLq5tALaHext5lV91IppW/GyD8=; b=AMc6soISuZZBFZQ7TWDPoC6XsY
 ScroY1aZ1dxFB+kuAmewLHbCN3WWPzitlw8USYZywR/RXKMurofxE53Bcga9mZsPYP7h97LoRmO8M
 jGF8dokccNryXXXODYlAzmmfL9Ybdl+yAF+Pe5Sxt1xzGhTRYzHM4hO8k05Y6liqiDSU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uPxHg-0001WX-0y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Jun 2025 05:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 02726438E2;
 Fri, 13 Jun 2025 05:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECCD5C4CEE3;
 Fri, 13 Jun 2025 05:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749793727;
 bh=EWx+9SzS20cv+g+xd65u2EnKXP1aEWhGwbzrFnYRDqE=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gLCVFLBEp7olDJ97Ld/YWJva25IGy90KzUX4dX5TdEkS0wR1qv5RjFoqF2Nr7wh6l
 sRF/XVKJP+isQqCas0k/7iIXErLPFOaz+iIPF36bsPYoFIbPSmw6SCxqZpGtX9fFF3
 4Dgfxleg0uN087MMsFpJ+67XC5G57bxYzSMKh77Svs4R+ezo/rZleqjY6IUE/e8hMq
 suKQbuM5QeDcUwRhwCTe4JhcNv1VXWSed2QJTnh0aBbjt4qQBD7+VokR0l4hcXubDU
 oRS3rgiG4+R/HlHtu/OhsmRotogjnuAUzQY9K2oAGBBvhS7degORQKq3YvlNDHX0zp
 wcG0e36RnovlA==
Message-ID: <4c7c12d3-4305-4756-9623-0154d7cce6c8@kernel.org>
Date: Fri, 13 Jun 2025 13:48:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1749779445-29125-1-git-send-email-zhiguo.niu@unisoc.com>
 <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1749779445-29125-2-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/6/13 9:50, Zhiguo Niu wrote: > The decompress_io_ctx
 may be released asynchronously after > I/O completion. If this file is deleted
 immediately after read, > and the kworker of processing post [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uPxHg-0001WX-0y
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: compress: fix UAF of
 f2fs_inode_info in f2fs_free_dic
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, baocong.liu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/6/13 9:50, Zhiguo Niu wrote:
> The decompress_io_ctx may be released asynchronously after
> I/O completion. If this file is deleted immediately after read,
> and the kworker of processing post_read_wq has not been executed yet
> due to high workloads, It is possible that the inode(f2fs_inode_info)
> is evicted and freed before it is used f2fs_free_dic.
> 
>      The UAF case as below:
>      Thread A                                      Thread B
>      - f2fs_decompress_end_io
>       - f2fs_put_dic
>        - queue_work
>          add free_dic work to post_read_wq
>                                                     - do_unlink
>                                                      - iput
>                                                       - evict
>                                                        - call_rcu
>      This file is deleted after read.
> 
>      Thread C                                 kworker to process post_read_wq
>      - rcu_do_batch
>       - f2fs_free_inode
>        - kmem_cache_free
>       inode is freed by rcu
>                                               - process_scheduled_works
>                                                - f2fs_late_free_dic
>                                                 - f2fs_free_dic
>                                                  - f2fs_release_decomp_mem
>                                        read (dic->inode)->i_compress_algorithm
> 
> This patch store compress_algorithm and sbi in dic to avoid inode UAF.
> 
> In addition, the previous solution is deprecated in [1] may cause system hang.
> [1] https://lore.kernel.org/all/c36ab955-c8db-4a8b-a9d0-f07b5f426c3f@kernel.org
> 
> Cc: Daeho Jeong <daehojeong@google.com>
> Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")
> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> Signed-off-by: Baocong Liu <baocong.liu@unisoc.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
