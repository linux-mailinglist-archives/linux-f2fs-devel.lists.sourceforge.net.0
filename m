Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 72528CCE4F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 04:05:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpIwo3wDjM/Bwbr88MnsSKd8myb2vhZlHZXnwgdF6ZE=; b=U4OBuW9gyiOS6u17UTLGrEstAI
	UXz9htkfSQGAH6Hty+IvzFkea7DR7EDw2Dt0UMk8u46XOInbrtLkogq9WnGX7Gy8llJPOug2Ao5mK
	nYs6PhVO1sgH1rr10286b19QrjCxWfQhIBhkpeYAMCSOmQSCCd7uuQ/t7FoPJDNZt7VU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQnq-0005X0-Mw;
	Fri, 19 Dec 2025 03:05:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vWQno-0005Ws-Ai
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RpTQAhduS/p88pTSKq8wFYA4tmls/qxKNY7z/4YzKoI=; b=mWXtb5Q+5d7jcBm2wKKnHzwy9R
 iFuj31zKr7Miy2zxyDZRjGH+qpfE7ZyAx5fXQRkZe8ARJEX2SJKUybkW0kWm8VcWdRRy5NE070m6S
 BWq3EBky7mZ7/qgoWjqpEaVOnHpVYkqibcHqdiU7NiCiofFkzkQYKdw9P7hiaj00fodE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RpTQAhduS/p88pTSKq8wFYA4tmls/qxKNY7z/4YzKoI=; b=EyTBhUWNl0UT8Ik8wh3HU2qVS8
 +gJ0PRXcwmpKeIsbmgVbk5vkt7CEVsVjQZmb8YExn0oX7Tn1+luDHGGNJGuh+6ou9bnBoL3mhMYdJ
 jHkMKKDsoCQsV6Y2zfH0twiO5E1ofSuvOdwXg/WvBK+EeQZsfPDYkq/cvMcnibPaUZjI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWQnn-0001Pa-Lr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 517E0443C0;
 Fri, 19 Dec 2025 03:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920EEC4CEFB;
 Fri, 19 Dec 2025 03:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766113501;
 bh=2N7Nd1I3u9+iaoc4QKDk9Mo3qLacyv0s2hTDz7iIxzg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SYbymAgjVvZ0D+WJOkzawUjjoXLIwCCLkABzORS8SXJbe9YSOjGDBLFF40nXC2VHf
 bBKDhhyUepJI7W4u351vPgTih4AORQTPW1lhQX61DXfy4fds4PGdWWdFwUkTftyHA1
 bhF4ll1vw4Azt65DyPmHtiTJYsR0ushdB4fBkdWoB8ijq4ZHxKeWD+D4eqDeHAIOe/
 9VAE54qGdIi5RlTovj5jef6/McSukaBwTUROI7m0rirEhciKsD9IOcO6tCZmV8avxE
 nEQOAgyB96/jsEkfjz27UzDSI3wBnWZw6NErdIV9fPzgColbokIaNW9XcgBI6irlTj
 hL9ICxxCcJoVw==
Message-ID: <d9faceb9-d90e-45f4-b272-d26ae5d1c8ce@kernel.org>
Date: Fri, 19 Dec 2025 11:05:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <zhiguo.niu@unisoc.com>, jaegeuk@kernel.org
References: <1765957574-4386-1-git-send-email-zhiguo.niu@unisoc.com>
Content-Language: en-US
In-Reply-To: <1765957574-4386-1-git-send-email-zhiguo.niu@unisoc.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/17/2025 3:46 PM, Zhiguo Niu wrote: > It missed the stat
 count in f2fs_gc_range. > Cc: stable@kernel.org And add Fixes line? Thanks,
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vWQnn-0001Pa-Lr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to add gc count stat in
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

On 12/17/2025 3:46 PM, Zhiguo Niu wrote:
> It missed the stat count in f2fs_gc_range.
> 

Cc: stable@kernel.org
And add Fixes line?

Thanks,

> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
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
