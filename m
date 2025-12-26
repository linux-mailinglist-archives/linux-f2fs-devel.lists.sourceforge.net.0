Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47093CDE345
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 02:44:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wxPoGv5CQoCumcpvua4KChFZgdCK/agyJXHmy9f7eI=; b=nJROu8i4E1f610D9Uw2nURimdK
	o8r+sM32CRKRkw/bb/cb8ZU7zlDKHjTGASFZdxwEOMqEyrK1CSpHszEJgwYqSAcGjSM++nghmvBeK
	VANlahpmHXCY+LEalxWy4POt92EzEHcwcO71nNGBfsBAG70ukNitQftkmaWLLE9C3ghU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYws9-0004ux-V7;
	Fri, 26 Dec 2025 01:44:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYws7-0004un-UI
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tFnPWKGOqrg+FG3c5kMYJ8OTJ4EnWx7j0s+5/4fnjho=; b=mKGH0VR8ixd/7mO3ubR/Ykkznv
 Ky4pxLkHFxny6/VocnIb5wwPofkWUU44QzDDn1wvnxWJc1gs4xjyMvNYgXnkUhr7Bau5c+AGzpiEW
 Bujq4pVfQ/mB8UF5nc4P4BMf1iYeZ1gbwxnR4oksGBUFjYeXYzkuI0DKoikliojlUkbc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tFnPWKGOqrg+FG3c5kMYJ8OTJ4EnWx7j0s+5/4fnjho=; b=XbSyCLz0anho2c7PoMgHnAcXVW
 b0YHexAXQVrpHVRK1l18B3GipAApNd+3nbmT5W+xj8TbCfN2cX5jcNhs9yrNZ8vuBxtSewB9JefEN
 jVjPuCo6KrigxbLcXL8hNmKbqNUwTkLv49Gh3JyLjh/6GGe59I2UcnQCTTH8hVbbe5Mo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYws7-0004AE-Gu for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 01:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DE0F96000A;
 Fri, 26 Dec 2025 01:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F59AC4CEF1;
 Fri, 26 Dec 2025 01:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766713437;
 bh=3zJ0+Z9k/5hC5BOEpyg+FP+P/ao/Hy90xw+8o3KVh0Q=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y2zDocCWmzPgd7WVUAQ7vTRkzpJ8J/MqQE3rgxH3A6jujMIS52mrLaTsFggoKwXgs
 BouN+rk6lCw9/kNZqsg+51sNg/VLH9HxDxfDehaozpqrksAavc3LuH52toTXGarjXt
 yUlYszhFQjPF45p2Z7+zwakmtCGBJGSg3S9cNpU3ULGrwHYwMWgdJ49EkauyTViCMo
 LGR6+rwk2F+J2ju2LA5S6XcPD3L9GPW+4xF6/p3qvBN/hZu+Gthdmc2NHDxqywq8I9
 Cjc15sJAQwAa58LIswuf1Mg/8wkrj3c8ad1BKHxBszvk7TTCZo8Udjb4HfMxFvRhW8
 3AZZEjujGtsJw==
Message-ID: <e004abda-4aec-46bf-8ea7-02962538bcd8@kernel.org>
Date: Fri, 26 Dec 2025 09:44:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1766116991-2910-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1766116991-2910-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/19/2025 12:03 PM, Zhiguo Niu wrote: > It missed the
 stat count in f2fs_gc_range. > > Cc: stable@kernel.org > Fixes: 2f0209f579d1
 ("f2fs: separate f2fs_gc_range() to use GC for a range") Fixes: 9bf1dcbdfdc88
 ("f2fs: fix to account gc stats correctly") ? 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYws7-0004AE-Gu
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to add gc count stat in
 f2fs_gc_range
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
 linux-f2fs-devel@lists.sourceforge.net, Hao_hao.Wang@unisoc.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/19/2025 12:03 PM, Zhiguo Niu wrote:
> It missed the stat count in f2fs_gc_range.
> 
> Cc: stable@kernel.org
> Fixes: 2f0209f579d1 ("f2fs: separate f2fs_gc_range() to use GC for a range")

Fixes: 9bf1dcbdfdc88 ("f2fs: fix to account gc stats correctly") ?

> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> ---
> V2: add Cc and Fixes tags
> ---
>   fs/f2fs/gc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 6afd57f..58b291d 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2096,6 +2096,7 @@ int f2fs_gc_range(struct f2fs_sb_info *sbi,
>   	if (unlikely(f2fs_cp_error(sbi)))
>   		return -EIO;
>   
> +	stat_inc_gc_call_count(sbi, FOREGROUND);
>   	for (segno = start_seg; segno <= end_seg; segno += SEGS_PER_SEC(sbi)) {
>   		struct gc_inode_list gc_list = {
>   			.ilist = LIST_HEAD_INIT(gc_list.ilist),



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
