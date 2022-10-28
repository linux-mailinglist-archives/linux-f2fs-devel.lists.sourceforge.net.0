Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC4611943
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 19:26:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooT7R-0001kN-HT;
	Fri, 28 Oct 2022 17:26:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ooT7P-0001kG-Ss
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hwgrJ8O0h5ZksD31SQFYU/3IuNklqEQF38FJ+yAiLpE=; b=ZOgAUfZ4SjPAhRhD5S9srE8Xsn
 piCpOeLpkIms2jdyYNZZXVpZi0Dlg2PfWu96iLRNshq+5GCWU8nsriRNtXx9ivpjhdLTxY6BbLg7J
 Y6VZKUZFQ/Jxfh3jpsSY/PkakaydP10UvU4IizDNRv+s7gCG9dp09OQ9hHWg5kTRj0nM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hwgrJ8O0h5ZksD31SQFYU/3IuNklqEQF38FJ+yAiLpE=; b=NU8Q4hh8obIAXPBwA6YTzmsIlu
 44niajORltf9+mOaFZBXwcPMTiIHLlRUphr+bIJesnsKAIgE+OBscs4QPOiLMX13vg1Wp+R9xvNcL
 8ysncw2FlFRHoEqcz0J77vEzSoaJifavvh3aF6Gn8nLI42i0th5skiLr1Bk8D/Hem9Ak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooT7P-003f36-5t for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 17:26:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4A93629DD;
 Fri, 28 Oct 2022 17:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6AAC433C1;
 Fri, 28 Oct 2022 17:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666977961;
 bh=PvReomNXtci5g9AZMQJxpfFHI9W77tJBy5ChK1R+KDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NAQAyjPLWbYaO3bmUCsbuSIqe6EGHFVlSkBzdvRmW9YrnAzXtgFWdiE4yhBFE3urw
 7K1bn2U2CrlzZWrrdaaG8hLvdYXRU2byYTEDoNcRcbTC0zqCR4+HR7Nn0yAaUTvAgn
 3F16J5qOPL99XMVg9bTAwxZTcShbJVIGAWz2MPNQzIFQTUn/TPFqgBHwlA+WmtY5Dm
 zCK04Y/NGmgeisq49I8iilRRX4lEuP34JHpOrqHgRPHV520lqyg9L+RdP5370I6ir2
 ggnIu41lN/5r/I1wAXzdrwuVx2JORFBxFCf05EQ9QWRDyXhQpk6UksxDQs+AB+tCup
 fNtxqN9ZquLhQ==
Date: Fri, 28 Oct 2022 10:25:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y1wQp4Z9sHEqfWV1@google.com>
References: <20221028130716.80850-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221028130716.80850-1-frank.li@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I modified and integrated some patches as below. Could
 you please take a look?
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d34f1e7212c1965a409d4581a32a92a1c91495fc
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooT7P-003f36-5t
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove gc_urgent_high_remaining node
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

I modified and integrated some patches as below. Could you please take a look?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=d34f1e7212c1965a409d4581a32a92a1c91495fc

Thanks,

On 10/28, Yangtao Li wrote:
> As Jaegeuk suggested to remove it. And it is not a super critical node,
> which just for internal tests now.
> 
> Let's remove the testing gc_urgent_high_remaining sysfs node.
> As well as updating the description in the documentation to indicate
> that readers need to use the new node.
> 
> BTW, fill in a missing '>', :)
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
>  fs/f2fs/f2fs.h                          | 1 -
>  fs/f2fs/sysfs.c                         | 6 ------
>  3 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index 374f0c98f8a9..e6b87522518d 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -241,7 +241,7 @@ Description:	Shows total written kbytes issued to disk.
>  What:		/sys/fs/f2fs/<disk>/features
>  Date:		July 2017
>  Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
> -Description:	<deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
> +Description:	<deprecated>: should use /sys/fs/f2fs/<disk>/feature_list/
>  		Shows all enabled features in current device.
>  		Supported features:
>  		encryption, blkzoned, extra_attr, projquota, inode_checksum,
> @@ -601,10 +601,10 @@ Description:	With "mode=fragment:block" mount options, we can scatter block allo
>  What:		/sys/fs/f2fs/<disk>/gc_urgent_high_remaining
>  Date:		December 2021
>  Contact:	"Daeho Jeong" <daehojeong@google.com>
> -Description:	You can set the trial count limit for GC urgent high mode with this value.
> +Description:	<deprecated>: should use /sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
> +		You can set the trial count limit for GC urgent high mode with this value.
>  		If GC thread gets to the limit, the mode will turn back to GC normal mode.
>  		By default, the value is zero, which means there is no limit like before.
> -		<deprecated>
>  
>  What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
>  Date:		October 2022
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index b467c0ca1118..d0a279605f20 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1747,7 +1747,6 @@ struct f2fs_sb_info {
>  	spinlock_t gc_urgent_idle_lock;
>  	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
>  	unsigned int gc_urgent_idle_remaining;
> -	unsigned int gc_urgent_high_remaining;	/* deprecated */
>  
>  	/* for skip statistic */
>  	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9312954ec03b..9db77f18e8a7 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -538,10 +538,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> -	/* deprecated */
> -	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
> -		return -EINVAL;
> -
>  	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
>  		spin_lock(&sbi->gc_urgent_idle_lock);
>  		sbi->gc_urgent_idle_remaining = t;
> @@ -836,7 +832,6 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
>  #endif
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> -F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
>  F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
>  F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
>  F2FS_GENERAL_RO_ATTR(dirty_segments);
> @@ -966,7 +961,6 @@ static struct attribute *f2fs_attrs[] = {
>  #endif
>  	ATTR_LIST(data_io_flag),
>  	ATTR_LIST(node_io_flag),
> -	ATTR_LIST(gc_urgent_high_remaining),
>  	ATTR_LIST(gc_urgent_idle_remaining),
>  	ATTR_LIST(ckpt_thread_ioprio),
>  	ATTR_LIST(dirty_segments),
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
