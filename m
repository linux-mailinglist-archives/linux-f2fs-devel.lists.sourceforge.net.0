Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB71C990FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 21:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=du3oo7R6hk2eyayVJAe4b9WjLszOZRnnryY8UqiEpgI=; b=WcYgozNrf4t1jeq0VcLr/kOd97
	cpVm1e5RHOzgPQkb/2Are0/CxYXp5MfSwOs/LONx7y9ZpKXvnipBoT8yy7xKdF7mxjJa/A9C50SiD
	BFKUmCjxBlNAvyBMcF61D1UoFksYqWp0fNPtSgP99aHwC9/z4se7XY5ocIzl2U9oYu3E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQAh7-00074J-3W;
	Mon, 01 Dec 2025 20:40:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vQAh4-00074B-4g
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ORj1j5D4VUiYDzfLJ/Bss2dvDE3yh8/ZaBlGfaKtK8=; b=jGjgpRtyXVjEaHF8juVdEeL6Y5
 AyQL2/JeSKFSd2aofnm3c+Co/pSo2sHQGD/meBwYfVo9BkCRt1nJUHNxxvfeaVLju5tiCQlfp9Y5i
 yNWhd3Dd1zwGPVjhQLUZ37y3hvANrQQL28wP6bvpIBwJ0w64PdK7Tsg745LhzFrUIBn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ORj1j5D4VUiYDzfLJ/Bss2dvDE3yh8/ZaBlGfaKtK8=; b=JFn1jqP7kePuLTdKKi95vb3XtG
 8WcCF1c2RffhyxOe5m6rxG88FGoCn6d4xKPl6yKBcyk+mRoWKojVfJBaYT905y37MNBfvtK0YHp6G
 aJF+PFS3DLF1UGWqsaqDaC/n6eeQbGDqjZFCqCfTYQSSy+wZppa2csmqb6HT+gl9/Q4M=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQAh3-0000fV-Hq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 20:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E4A206014A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 20:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CDC3C4CEF1;
 Mon,  1 Dec 2025 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764621610;
 bh=Kddjz4kbthsv6mSJiFXwMHZqAU+w31YB1r6G3D/SACA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qjh4DeAGEERO+4NH+RpPAwZ+rCsPvazPOZFPiosg0wpdQXPZy43ue1AurxGWByHWE
 tvN9jEPGJj89VBes+iOcdRdpUSrKF8f/ikT/BRmwm8+lAodVe6rY7svYCauDkwSr9i
 KsJuZwW6eviLEmJUtxcHxTpcBIE7fqUCxI9JgGioyJT16Fu3VtBQZX1904lMGfA1uX
 gf5T1ssA4fHd32Hk33JYPGltUS7QtqvVsvmN/jrEC5U5NJPllZh4YrVuUlHuZWRHqY
 cB7EEiDeYsT8h4pqMPpny64QUqmLy44qKqQmwYn+jfU8zy41Poglu4ua/BXa2Lj6e+
 +TNLVvad6MoCQ==
Message-ID: <3420618e-a108-4d29-b941-e94d3e9bb55e@kernel.org>
Date: Mon, 1 Dec 2025 12:40:08 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20251201191940.883657-1-jaegeuk@kernel.org>
 <20251201191940.883657-2-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20251201191940.883657-2-jaegeuk@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/12/2 03:16, Jaegeuk Kim via Linux-f2fs-devel wrote:
 > This patch fixes the broken readahead flow for POSIX_FADV_WILLNEED, where
 > the problem is, in force_page_cache_ra(nr_to_read), nr_to_read [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQAh3-0000fV-Hq
Subject: Re: [f2fs-dev] [PATCH 1/4] mm/readahead: fix the broken readahead
 for POSIX_FADV_WILLNEED
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/12/2 03:16, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch fixes the broken readahead flow for POSIX_FADV_WILLNEED, where
> the problem is, in force_page_cache_ra(nr_to_read), nr_to_read is cut by
> the below code.
> 
>       max_pages = max_t(unsigned long, bdi->io_pages, ra->ra_pages);
>       nr_to_read = min_t(unsigned long, nr_to_read, max_pages);
> 
> IOWs, we are not able to read ahead larger than the above max_pages which
> is most likely the range of 2MB and 16MB. Note, it doesn't make sense
> to set ra->ra_pages to the entire file size. Instead, let's fix this logic.
> 
> Before:
> f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
> page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=512 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1024 nr_to_read=512 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1536 nr_to_read=512 lookahead_size=0
> 
> After:
> f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
> page_cache_ra_unbounded: dev=252:16 ino=e index=0 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=8192 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=10240 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=12288 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=14336 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=16384 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=18432 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=20480 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=22528 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=24576 nr_to_read=2048 lookahead_size=0
> ...
> page_cache_ra_unbounded: dev=252:16 ino=e index=1042432 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1044480 nr_to_read=2048 lookahead_size=0
> page_cache_ra_unbounded: dev=252:16 ino=e index=1046528 nr_to_read=2048 lookahead_size=0
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
