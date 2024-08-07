Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA1494A22A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Aug 2024 09:57:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sbbXk-0004CY-MQ;
	Wed, 07 Aug 2024 07:57:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ryan.roberts@arm.com>) id 1sbbXh-0004CJ-TJ;
 Wed, 07 Aug 2024 07:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mqvL9kVCgzj7U7irHa2ORnVHw0WuVj0xvWQ+gN18bsg=; b=fva2hF/2JyTnYzrjpNdp0Rd7Ni
 pGqYz3B5wqIe+2qv5YFBk0RyoobI6riesnXhr+WJmy2Ovf1xWDC1JEfGQFuX5GicjlK3xnJGcbPiS
 IABul81MYI39QamklmTKX5nHmo6FJd6ARUNuZ0YADQg3ONDx3GcppWMlhCARI8ya9bt0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mqvL9kVCgzj7U7irHa2ORnVHw0WuVj0xvWQ+gN18bsg=; b=DIt2IsF2cj8NaDNFKik4X1z97E
 slfcujXjyWAQfiPIiBsaxy6E0/BAju4sQz+ej7RNyJ++8SbP6gMPDM+JQCr1e+dFT9o6Jh8r4306t
 iROnNENXxvtniBDQ1T18U51MmSHaxAN66fYbvwkzhVfQSXj+U6eyWNv5+CpnOJ9cMwsw=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1sbbXh-0003Ao-Ue; Wed, 07 Aug 2024 07:57:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6FBB2FEC;
 Wed,  7 Aug 2024 00:38:55 -0700 (PDT)
Received: from [10.57.81.112] (unknown [10.57.81.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 687A53F5A1;
 Wed,  7 Aug 2024 00:38:25 -0700 (PDT)
Message-ID: <e693ed7a-97bf-486b-84fb-f57e44a399b4@arm.com>
Date: Wed, 7 Aug 2024 08:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>,
 kernel test robot <oliver.sang@intel.com>,
 Christian Brauner <brauner@kernel.org>
References: <202408062249.2194d51b-lkp@intel.com>
 <ZrLuBz1eBdgFzIyC@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZrLuBz1eBdgFzIyC@casper.infradead.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/08/2024 04:46, Matthew Wilcox wrote: > On Tue, Aug 06, 
 2024 at 10:26:17PM +0800, kernel test robot wrote: >> kernel test robot noticed
 "kernel_BUG_at_include/linux/page-flags.h" on: >> >> commit [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [217.140.110.172 listed in list.dnswl.org]
X-Headers-End: 1sbbXh-0003Ao-Ue
Subject: Re: [f2fs-dev] [linux-next:master] [fs] cdc4ad36a8:
 kernel_BUG_at_include/linux/page-flags.h
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
Cc: jfs-discussion@lists.sourceforge.net,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-mtd@lists.infradead.org, linux-nilfs@vger.kernel.org, lkp@intel.com,
 linux-bcachefs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oe-lkp@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-karma-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/08/2024 04:46, Matthew Wilcox wrote:
> On Tue, Aug 06, 2024 at 10:26:17PM +0800, kernel test robot wrote:
>> kernel test robot noticed "kernel_BUG_at_include/linux/page-flags.h" on:
>>
>> commit: cdc4ad36a871b7ac43fcc6b2891058d332ce60ce ("fs: Convert aops->write_begin to take a folio")
>> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>>
>> [test failed on linux-next/master 1e391b34f6aa043c7afa40a2103163a0ef06d179]
>>
>> in testcase: boot
> 
> This patch should fix it.
> 
> Christian, can you squash the fix in?
> 
> 
> diff --git a/mm/shmem.c b/mm/shmem.c
> index 7d28304aea0f..66ff87417090 100644
> --- a/mm/shmem.c
> +++ b/mm/shmem.c
> @@ -2904,7 +2904,8 @@ shmem_write_begin(struct file *file, struct address_space *mapping,
>  	if (ret)
>  		return ret;
>  
> -	if (folio_test_has_hwpoisoned(folio)) {
> +	if (folio_test_hwpoison(folio) ||
> +	    (folio_test_large(folio) && folio_test_has_hwpoisoned(folio))) {

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Ryan Roberts <ryan.roberts@arm.com>


>  		folio_unlock(folio);
>  		folio_put(folio);
>  		return -EIO;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
