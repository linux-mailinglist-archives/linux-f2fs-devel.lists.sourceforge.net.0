Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0602D0B55
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 08:51:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmBJL-0003mR-93; Mon, 07 Dec 2020 07:51:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmBJI-0003mJ-Rv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BkeeEwFPhyjBrFg8Q+93pXuIch2cPpfkNY6jToTMbMk=; b=KrfElXhW2zlK2h8SF8SsBlutz7
 fMnt6hlvaDJEs2toP7OTqMg+4eqf1t92bNoLdT+ij59MPeHlJxPOOwMLPk7mV/ddAu79C5h389tpU
 6BtdpMqxWucaar2EdOeVmFVMwcqAiYLh5/gUrBueaVWAcFcmQiv5EOPYMHk1zz/vksx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BkeeEwFPhyjBrFg8Q+93pXuIch2cPpfkNY6jToTMbMk=; b=HeYdI/7wymA9i+xXCs/Xxa2PHY
 WMAwTxd9dkJsDid3+KaLlZFjC0yg/hUGzzIJ2/UCXxMdhn1tZCrPMXEYTWVMiW+RWga1wwirTjal/
 NV+WG8b0BRT+k01zohFy5YTLgiQHMSap3gUY7CHLsC/5FJVd4i8QktG80TVnbh5/wzeI=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmBJD-001fR2-Qu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 07:51:52 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CqFqL3bwNzM1Yf;
 Mon,  7 Dec 2020 15:50:54 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 7 Dec 2020
 15:51:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201203205522.891082-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <48d45bbd-baaf-e29e-8351-df375ee5a8b0@huawei.com>
Date: Mon, 7 Dec 2020 15:51:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201203205522.891082-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kmBJD-001fR2-Qu
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: don't allow any writes on readonly
 mount
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

On 2020/12/4 4:55, Jaegeuk Kim wrote:
> generic_make_request: Trying to write to read-only block-device dm-5 (partno 0)
> WARNING: CPU: 7 PID: 546 at block/blk-core.c:2190 generic_make_request_checks+0x664/0x690
> pc : generic_make_request_checks+0x664/0x690
> lr : generic_make_request_checks+0x664/0x690
> Call trace:
>   generic_make_request_checks+0x664/0x690
>   generic_make_request+0xf0/0x3a4
>   submit_bio+0x80/0x250
>   __submit_merged_bio+0x368/0x4e0
>   __submit_merged_write_cond.llvm.12294350193007536502+0xe0/0x3e8
>   f2fs_wait_on_page_writeback+0x84/0x128
>   f2fs_convert_inline_page+0x35c/0x6f8
>   f2fs_convert_inline_inode+0xe0/0x2e0
>   f2fs_file_mmap+0x48/0x9c
>   mmap_region+0x41c/0x74c
>   do_mmap+0x40c/0x4fc
>   vm_mmap_pgoff+0xb8/0x114
>   vm_mmap+0x34/0x48
>   elf_map+0x68/0x108
>   load_elf_binary+0x538/0xb70
>   search_binary_handler+0xac/0x1dc
>   exec_binprm+0x50/0x15c
>   __do_execve_file+0x620/0x740
>   __arm64_sys_execve+0x54/0x68
>   el0_svc_common+0x9c/0x168
>   el0_svc_handler+0x60/0x6c
>   el0_svc+0x8/0xc
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
