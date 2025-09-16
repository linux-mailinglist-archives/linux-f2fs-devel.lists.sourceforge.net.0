Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DEDB58BCE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Sep 2025 04:22:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f12mOMpLD9w17Iwh/gwnpNT0ldfs2Wium57DEwg4qCk=; b=hb3dUUk0Rm/7XN3Z/Nek/MR2C1
	xJYexI8YayFjl5ZiiLXsWyG/muvC1h1g/4GdLvB1C7z+kOhACXiRQ2SiSxEJbz1XnJ6BOINScB8Hn
	plUbdk8SVV2SicMJig62VgqNIkxpj8J4qavScEW5PWGn0PtH6tqMgVDeGGUiyRypqoy0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyLKV-000605-F6;
	Tue, 16 Sep 2025 02:22:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1uyLKT-0005zv-WC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eFP8bpZ873Ck/cJvH8Q5uyNCB1r+xMJXpbPJ2BH8GpM=; b=FyvErrf0GdkAouifDKwwM1/Wj9
 j8DoMMEihHMW7toEBnhRTCaZ7LtxtMxKqAdfCt9G3RPZ7IEfQ0axX7Tb3+EimEMqFSeHexVMtl203
 ve8mbB6UKrynXheVhbjsOoMXXykbP60/5kOy7y+vAeDCyh/R3k8T+flZwXZVUxh7IQg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eFP8bpZ873Ck/cJvH8Q5uyNCB1r+xMJXpbPJ2BH8GpM=; b=N0kBprtjqp6R6qdVHoJoxmn6mz
 EICiObho0TSnYoR2HlmLrlaGN31AuMy5D3cmxoZUjYrQZ4DZJH5tE/i352z26MEG8vmfMhtoR12Pb
 zVNX3+K/RFONJLgdQHBt6ED+WcBRz4R1vq2WoOzLqCCgctBaFeugotewX74i2lvTkNbs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyLKT-0001QB-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Sep 2025 02:22:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2B84C42B7C;
 Tue, 16 Sep 2025 02:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2216C4CEF1;
 Tue, 16 Sep 2025 02:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757989316;
 bh=qFFHU9Ro9y1dW9pkQJIf+o5PCm3RfY+093ZluYDx62w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nwg+t5BfvGtjH2BGhT1xMfM5GkVXBkx8Z7seHJHuf5LGw0Vti7AQI6FnSB9f6natz
 5mRIOF7BRlgkDS+4wo3ykcsnTzUReBJ2e8zvL0ny8QUf6PGVM7CgBQ5+OWeaVHhj4Y
 47mYfp14og3rwqFqdmOV2IByRNn8e3OqMZrMM4geCvyI9ss+CSCok50fFAruzzM0Jl
 TJvPV9qsIyfjhn0IsHGZEYPtPnyQiOD1uEIMiZ1QNuoUbdr7K1ojPKJuT84YWb+EvF
 iFBSQg02VHSYNoDnTO5LhLAzVE9z9SuKJXGBAXbyzlfCtPPAis1NsWFT5Oc+bkU4Da
 kJTtChFk/tM4w==
Date: Tue, 16 Sep 2025 02:21:54 +0000
To: wangzijie <wangzijie1@honor.com>
Message-ID: <aMjJwkQ3wQ0uNJXX@google.com>
References: <20250915035246.98055-1-wangzijie1@honor.com>
 <20250915035246.98055-2-wangzijie1@honor.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915035246.98055-2-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/15, wangzijie wrote: > When we get wrong extent info
 data, and look up extent_node in rb tree,
 > it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n).
 Avoiding this by > return NULL. This is the exact buggy case which we should
 fix the original one. Have you seen this error? In that case, can we consider
 writing some kernel message and handle the error properly? 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyLKT-0001QB-Fj
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/15, wangzijie wrote:
> When we get wrong extent info data, and look up extent_node in rb tree,
> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
> return NULL.

This is the exact buggy case which we should fix the original one. Have
you seen this error? In that case, can we consider writing some kernel
message and handle the error properly?


> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>
> ---
>  fs/f2fs/extent_cache.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
> index 199c1e7a8..6ed6f3d1d 100644
> --- a/fs/f2fs/extent_cache.c
> +++ b/fs/f2fs/extent_cache.c
> @@ -605,6 +605,7 @@ static struct extent_node *__insert_extent_tree(struct f2fs_sb_info *sbi,
>  			leftmost = false;
>  		} else {
>  			f2fs_bug_on(sbi, 1);
> +			return NULL;
>  		}
>  	}
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
