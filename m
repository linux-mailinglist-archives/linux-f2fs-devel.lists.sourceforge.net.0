Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E105A6C9499
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Mar 2023 15:48:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgQj6-0004iY-PH;
	Sun, 26 Mar 2023 13:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1pgQj2-0004iJ-8P
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+SpUcrqQU2yvb+UA3gwrYnueTILlD9OO69AKuHDiNKw=; b=ZyBBTrwk5OuyeQtEAz5KupACT8
 OQA6cdwqUf82/ypyhd9508a8B/Y2qNXRs9JRsTT6eqL0HxD1Qc2QcgrwZ285s8Ag26NodbBqeM8eL
 4UFG4E3dBxztXHIilrtAfMP+lYWuusmIHt+efoU2fBliXscbP0rPil8Z+UwjcuhBXLFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+SpUcrqQU2yvb+UA3gwrYnueTILlD9OO69AKuHDiNKw=; b=jB687tkeonetQouhGs6ENHwqJ4
 HbiS9S0iqc4yw6ebruqWK2ZtPI2r6LRObbnYy/jezxnR7Xmz1hQbAG0I5njSdqINWyk5F1bI57R45
 ZUY15lGbq8PxbabmwLDuy088c1lfPa4jvaaBf3L6qu70V/vhyPQxtdG0NCLfSh5GQSmM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pgQiz-00045X-26 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 13:47:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7027160EE1;
 Sun, 26 Mar 2023 13:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A364C433EF;
 Sun, 26 Mar 2023 13:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679838465;
 bh=Mbrp8vJfL4WUN8W5w3k6PtvrtBZ8ae9TAdSfQJPoQCY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EAGLHJEtYiiFDBODRxZ07bdcD8p12oHlpjlz1gRiKEjUcfWZ4nZB46uNRljMhFgzZ
 2Nf3yPjKaCdb63id3RP/xZHDPqNMYek2OzTLiCUoahWRePe/VbKV7uQBaXg+Xu739c
 Z4ZpQmyIj1Er6Tlj0YjZwZrAyrX/HfKaAWcY/15FQJIcEnM5RImqwtolWvYllV0hen
 2xAlG4NdeYyA/2//HJgRlZTyX9cEnLbhNVeTtaPhH2dJNQmNZnS7OBK8Euee5E3Eyd
 njVsOeAgwQsgoI8wSlYbNApE8iNISj1floUNOreIyYgJUU0AfznZRLFaeYtxH4h8iq
 lUmPr5VXbbioA==
Message-ID: <67aaa031-ab25-ffe4-ea56-3f3e4c0ac3d1@kernel.org>
Date: Sun, 26 Mar 2023 21:47:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20230320172218.59628-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230320172218.59628-1-frank.li@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/3/21 1:22,
 Yangtao Li wrote: > BUG_ON() will be triggered
 when writing files concurrently,
 > because the same page is writtenback multiple
 times. > > 1597 void folio_end_writeback(struct folio [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pgQiz-00045X-26
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: compress: fix to call
 f2fs_wait_on_page_writeback() in f2fs_write_raw_pages()
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
Cc: Christoph Hellwig <hch@lst.de>, hanqi@vivo.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/3/21 1:22, Yangtao Li wrote:
> BUG_ON() will be triggered when writing files concurrently,
> because the same page is writtenback multiple times.
> 
> 1597 void folio_end_writeback(struct folio *folio)
> 1598 {
> 		......
> 1618     if (!__folio_end_writeback(folio))
> 1619         BUG();
> 		......
> 1625 }
> 
> kernel BUG at mm/filemap.c:1619!
> Call Trace:
>   <TASK>
>   f2fs_write_end_io+0x1a0/0x370
>   blk_update_request+0x6c/0x410
>   blk_mq_end_request+0x15/0x130
>   blk_complete_reqs+0x3c/0x50
>   __do_softirq+0xb8/0x29b
>   ? sort_range+0x20/0x20
>   run_ksoftirqd+0x19/0x20
>   smpboot_thread_fn+0x10b/0x1d0
>   kthread+0xde/0x110
>   ? kthread_complete_and_exit+0x20/0x20
>   ret_from_fork+0x22/0x30
>   </TASK>
> 
> Below is the concurrency scenario:
> 
> [Process A]		[Process B]		[Process C]
> f2fs_write_raw_pages()
>    - redirty_page_for_writepage()
>    - unlock page()
> 			f2fs_do_write_data_page()
> 			  - lock_page()
> 			  - clear_page_dirty_for_io()
> 			  - set_page_writeback() [1st writeback]
> 			    .....
> 			    - unlock page()
> 
> 						generic_perform_write()
> 						  - f2fs_write_begin()
> 						    - wait_for_stable_page()
> 
> 						  - f2fs_write_end()
> 						    - set_page_dirty()
> 
>    - lock_page()
>      - f2fs_do_write_data_page()
>        - set_page_writeback() [2st writeback]
> 
> This problem was introduced by the previous commit 7377e853967b ("f2fs:
> compress: fix potential deadlock of compress file"). All pagelocks were
> released in f2fs_write_raw_pages(), but whether the page was
> in the writeback state was ignored in the subsequent writing process.
> Let's fix it by waiting for the page to writeback before writing.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> Fixes: 7377e853967b ("f2fs: compress: fix potential deadlock of compress file")
> Signed-off-by: Qi Han <hanqi@vivo.com>
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
