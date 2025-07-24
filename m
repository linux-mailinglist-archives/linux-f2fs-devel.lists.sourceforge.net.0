Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E998CB10AA4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Jul 2025 14:51:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oydlQ5Vslp9DLspzKkhQIUv0BCDC1oqHLDsLYOzvyrE=; b=Xg2MY4IIWor7AW4ueZNK2NhB9f
	Tjf/UCXlQnaRI545bk4FZfNpt0Mbzw3ZGe4aJFsBiKEGACnuQr3wvufKF0bC0CEwNq5DUr24w/sy8
	t3iGjyE+2wQquzlbbxVbR1P1rg7V2MlCO6ReN7PFSwtBF8oHOjIyEKDjsAvxVrGaEcFM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uevPk-0000OB-Mz;
	Thu, 24 Jul 2025 12:51:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uevPj-0000O5-E5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 12:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bnmIG/czwcguWKUHU+5urSi4jMff4mv7s6BA5VQgJWs=; b=a/9xRiw2HeblxF5as91X1sAwrv
 MwvkbvGtNNB6hGQ3t7i0arm16fyCfd6Eyfp5Zpt3mt+nvcOV18QzPSj2GH8LTMI488kIUBDYtz4/8
 6udsUX2l49QzIaNg/Dwa5l9EvoQGvpor9ak240FrQlJk8dXFtxBosp8GOdIxFnLbZwV0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bnmIG/czwcguWKUHU+5urSi4jMff4mv7s6BA5VQgJWs=; b=Un6lgPe+VGdVwiAJdHYK0CveGn
 acPQlHHQ6ZPXbYoW/JRSug+lcN1S/iHCB+5AFvEnOWUzKamO5O1RVzD0+bs1aj/+IqkXsOULTB2Yc
 FYXqIzT5o6CrncC7Novhjkv9HlvcHX3YTWKQRbYHnBk4BcrZ+Pd3mhfYNGwrFynf0n9U=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uevPi-0007iw-VX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Jul 2025 12:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4FD9EA56052;
 Thu, 24 Jul 2025 12:51:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E0EC4CEED;
 Thu, 24 Jul 2025 12:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753361460;
 bh=wpyJfM5Cwer3eb3m4ADvdms9YwdATaTcSHsIq7SRT4k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pBQT292EYVdBVM+4DG/9130zi279NdyXZf9nAmEoZyudQKiTEkZseaomOyDfz2fTc
 xpT5QhDdbdeAL865/nPHAMDTcL2opqHcMufpCCw8fDepXsLcGPjmAP50AkiZXlKC6Q
 Wb1r7zZK8e0gDQw+Enf5i47X9wuvanNbi36iGPdLUTn8LCplhmwTVTO/p9IPhQNyYX
 5Zc1ZzNGLSrBMXVJDa6HkeNCWP3pnNMCpRZph1+2TvFp/rKeUrnySyA9D8xjs2202S
 AcHXcKsknEXjsvUsm6M2a1B/M6u3oIfBRq6cX9Lnv/K5vSS+nREMf+B1/lSWwsSoVt
 6klICXevjCyKw==
Message-ID: <f3f1810b-667b-4b3a-a9fb-606a87097f86@kernel.org>
Date: Thu, 24 Jul 2025 20:51:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jan Prusakowski <jprusakowski@google.com>, jaegeuk@kernel.org
References: <20250724103016.5164-1-jprusakowski@google.com>
Content-Language: en-US
In-Reply-To: <20250724103016.5164-1-jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Jan, On 2025/7/24 18:30, Jan Prusakowski via Linux-f2fs-devel
 wrote: > When testing F2FS with xfstests using UFS backed virtual disks the
 > kernel complains sometimes that f2fs_release_decomp_mem() calls > [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uevPi-0007iw-VX
Subject: Re: [f2fs-dev] [PATCH] f2fs: vm_unmap_ram() may be called from an
 invalid context
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Jan,

On 2025/7/24 18:30, Jan Prusakowski via Linux-f2fs-devel wrote:
> When testing F2FS with xfstests using UFS backed virtual disks the
> kernel complains sometimes that f2fs_release_decomp_mem() calls
> vm_unmap_ram() from an invalid context.

It will be better to include testcase & crash information in commit
message.

> 
> This patch modifies in_task() check inside f2fs_read_end_io() to also
> check if interrupts are disabled. This ensures that pages are unmapped
> asynchronously in an interrupt handler.
> 
> Fixes: bff139b (f2fs: handle decompress only post processing in softirq)

./scripts/checkpatch.pl will output below warning message:

WARNING: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")'

Please use this instead:

Fixes: bff139b49d9f ("f2fs: handle decompress only post processing in softirq")

> 
> Signed-off-by: Jan Prusakowski <jprusakowski@google.com>

Code part looks good to me, please feel free to add my RVB tag in next version:

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/data.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index d1a2616d41be..0acc25f996b3 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -280,7 +280,7 @@ static void f2fs_read_end_io(struct bio *bio)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_F_SB(bio_first_folio_all(bio));
>   	struct bio_post_read_ctx *ctx;
> -	bool intask = in_task();
> +	bool intask = in_task() && !irqs_disabled();
>   
>   	iostat_update_and_unbind_ctx(bio);
>   	ctx = bio->bi_private;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
