Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D985D40603D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 01:51:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOTpT-0000zn-Oh; Thu, 09 Sep 2021 23:51:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mOTpS-0000zh-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:51:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vnx9eaK6Rf7jbpckAL093aW2bY1xrkRJ0JeFL3qz8fg=; b=T4JV0Ow/bGSyV6BUlP1rFJG/HS
 zaHopZHTeXw9xCZ6x/jCLs4oUU7sCW7ugTSCLrB9LZyzSKSL0FlNvcEz3xUfilQBruouqdHhB2D8y
 uOj9PosO8OcpPxq/b8sXYs3apl0rpb6ecXaC5EfRzUD66LVV2VG9hEwkKOvN0e9KUrHc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vnx9eaK6Rf7jbpckAL093aW2bY1xrkRJ0JeFL3qz8fg=; b=bA9pKidW00k3Nvc1AxJitjeM73
 MPaTuL1tMnFbcf7RGNW/GmH5K0ve2nZpGMxyUlXHzq1WUJEfe76UuaVVMHQ3zHtFqY+W4n0axtlSg
 9FU13YRbwW5UPBJVcPzSOOtwV/lgLVjHxVfqoj0ZKxh0mXFjkA4zm3WS3nie3d+odA38=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOTpR-005Qfm-WC
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:51:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FB36610E9;
 Thu,  9 Sep 2021 23:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631231490;
 bh=fztYKXwCNriqil1UbKCuyBqnFoKNcnIMC9/mJUjAils=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=urGtZ56EpHaXAcPm9F103+W/UhQ6A5tOHIELnS27hJPbf0riXPNIIaQ/6F3sxJOLO
 bleOHITbxmgh64Aok8t3qKQ2IvxGOz4caCBewz8dMSN/OSkaQ/hnlU/37Bew3u4/zK
 l5BuFR+6K9rYH1aMV+28+uxaTtd0gcpLPEmTgBlH81ht7SNMjn+/2T7vpiKzcRvLUD
 eAvifvkG18e2XX6OlzN5s0Xi8T13NAbh2Uj6k2Rhl0n/wyTW823AyiihfH53kfpB4Z
 msrSzms5LlrOrJ2+WvX9PnhlkVWSnpAEY33GO/N5HMT/JDaMtx38UXGDgxVT0ixU5p
 E5UMLNWsHyqMg==
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210907174351.1104857-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
Message-ID: <6c40b766-2bdc-03c2-9e8a-e399d6e83282@kernel.org>
Date: Fri, 10 Sep 2021 07:51:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210907174351.1104857-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/8 1:43, Jaegeuk Kim wrote: > We use inline_dentry
 which requires to allocate dentry page when adding a link. > If we allow
 to reclaim memory from filesystem, we do down_read(&sbi->cp_rwsem) [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOTpR-005Qfm-WC
Subject: Re: [f2fs-dev] [PATCH] f2fs: should use GFP_NOFS for directory
 inodes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/8 1:43, Jaegeuk Kim wrote:
> We use inline_dentry which requires to allocate dentry page when adding a link.
> If we allow to reclaim memory from filesystem, we do down_read(&sbi->cp_rwsem)
> twice by f2fs_lock_op(). I think this should be okay, but how about stopping
> the lockdep complaint [1]?
> 
> f2fs_create()
>   - f2fs_lock_op()
>   - f2fs_do_add_link()
>    - __f2fs_find_entry
>     - f2fs_get_read_data_page()
>     -> kswapd
>      - shrink_node
>       - f2fs_evict_inode
>        - f2fs_lock_op()
> 
> [1]
> 
> fs_reclaim
> ){+.+.}-{0:0}
> :
> kswapd0:        lock_acquire+0x114/0x394
> kswapd0:        __fs_reclaim_acquire+0x40/0x50
> kswapd0:        prepare_alloc_pages+0x94/0x1ec
> kswapd0:        __alloc_pages_nodemask+0x78/0x1b0
> kswapd0:        pagecache_get_page+0x2e0/0x57c
> kswapd0:        f2fs_get_read_data_page+0xc0/0x394
> kswapd0:        f2fs_find_data_page+0xa4/0x23c
> kswapd0:        find_in_level+0x1a8/0x36c
> kswapd0:        __f2fs_find_entry+0x70/0x100
> kswapd0:        f2fs_do_add_link+0x84/0x1ec
> kswapd0:        f2fs_mkdir+0xe4/0x1e4
> kswapd0:        vfs_mkdir+0x110/0x1c0
> kswapd0:        do_mkdirat+0xa4/0x160
> kswapd0:        __arm64_sys_mkdirat+0x24/0x34
> kswapd0:        el0_svc_common.llvm.17258447499513131576+0xc4/0x1e8
> kswapd0:        do_el0_svc+0x28/0xa0
> kswapd0:        el0_svc+0x24/0x38
> kswapd0:        el0_sync_handler+0x88/0xec
> kswapd0:        el0_sync+0x1c0/0x200
> kswapd0:
> -> #1
> (
> &sbi->cp_rwsem
> ){++++}-{3:3}
> :
> kswapd0:        lock_acquire+0x114/0x394
> kswapd0:        down_read+0x7c/0x98
> kswapd0:        f2fs_do_truncate_blocks+0x78/0x3dc
> kswapd0:        f2fs_truncate+0xc8/0x128
> kswapd0:        f2fs_evict_inode+0x2b8/0x8b8
> kswapd0:        evict+0xd4/0x2f8
> kswapd0:        iput+0x1c0/0x258
> kswapd0:        do_unlinkat+0x170/0x2a0
> kswapd0:        __arm64_sys_unlinkat+0x4c/0x68
> kswapd0:        el0_svc_common.llvm.17258447499513131576+0xc4/0x1e8
> kswapd0:        do_el0_svc+0x28/0xa0
> kswapd0:        el0_svc+0x24/0x38
> kswapd0:        el0_sync_handler+0x88/0xec
> kswapd0:        el0_sync+0x1c0/0x200
> 
> Fixes: bdbc90fa55af ("f2fs: don't put dentry page in pagecache into highmem")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
