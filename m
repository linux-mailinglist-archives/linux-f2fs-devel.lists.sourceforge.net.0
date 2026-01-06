Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C79A3CF78AB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 10:31:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrECZ0/5eZXRSUp3Viuwcp4hs0bwtesad9Jtx9SWXu0=; b=cH8+N2QWht3T9HnUWpK/ZAxOsJ
	dpVzoqjk91i82CE3E4WwGK9UmEC2ZSNv/SjMK+yAakb2ZJuOAVE/ledlgtJfbxIyT7oHXAbx0tc4Y
	1AKc3ovX9DeNBD2leU/uAypy2kDJNoSo4CJcuXiWK+UzNGrCFiXuiToVrLC4/NKUPiPc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd3PU-0005eF-Bi;
	Tue, 06 Jan 2026 09:31:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd3PS-0005e5-MJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QsLt0JdXNIWgMKpHfOm51GpJMimTaJtOEmZYRx9X/Tc=; b=JmIDCDllmn9vgEAX3uKzdBb/Ga
 VzmQ0gYRag4m+Rz90V4i0ko1nidFDN3OZtEiQCsPUh2JGPRu70CXR6DqX3htRvqgbp6Fx0xp2PpX5
 kRBN0Zq2U8018EitgNAe74LjDpvKw+f8IT82Bcw1f0v20t/MpTkG+D4kIEZR+KzPWsv0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QsLt0JdXNIWgMKpHfOm51GpJMimTaJtOEmZYRx9X/Tc=; b=g6khl3W7n82v1weXRK368Ymkfj
 POjVUTkqA7aGPfgx4MpRCl5+7Czk4wwgo7PEOcdo750LzgrleczlL9g9Jcp4DB6Z0uhE+w/e3SQ73
 6X0kBXA0qikxmgDj6wxMQaTxq/cvtX4ENSVVB0F8lQ5B6piosa71sDlhQHGnCRDkrSoY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd3PS-00028q-7s for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:31:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D33064078D;
 Tue,  6 Jan 2026 09:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B0A1C116C6;
 Tue,  6 Jan 2026 09:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767691875;
 bh=7AISoZfUTtJ8qU2F5kq1TdtJ/wFsXo1uQ3IwmK9NNGo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dwmTDmpW0BAt9PRsXQKdexoK2XecVcgoH6T7YEkfyZRK619FypwFgHg55/9Er5n89
 zzvQIxZAdEQELq4ZJnQkIqZxJuhXSZtuRu2igDFQNC6uazIxzWrGNrZUCobek2Dmt3
 Lr4kUCE9eqLYdWXGQt6EP6tbWQk6eFOWOZgnrJzBuY2nWlTo6nWN9Z2G+1jZOf3NLC
 Dky3A1R8TAyXOgo+b9YC4TttPjW/tRXKjQNU7F442EvHSGPHK7eLww9fhokV2wQrC9
 A9mM/qXheQChW/iB0EuPbcRIma6oGh73aigeV9deEWfw4oHBhiUVmP58V84SjdA/6Z
 U1mpN39Q4C8tQ==
Message-ID: <5ca2ef6a-ce46-4d80-b2e0-ff35c628e0ba@kernel.org>
Date: Tue, 6 Jan 2026 17:31:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-5-nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <20260105153101.152892-5-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/5/2026 11:31 PM,
 Nanzhe Zhao wrote: > f2fs_read_data_large_folio()
 can build a single read BIO across multiple > folios during readahead. If
 a folio ends up having none of its subpages > added to [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd3PS-00028q-7s
Subject: Re: [f2fs-dev] [PATCH v1 4/5] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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

On 1/5/2026 11:31 PM, Nanzhe Zhao wrote:
> f2fs_read_data_large_folio() can build a single read BIO across multiple
> folios during readahead. If a folio ends up having none of its subpages
> added to the BIO (e.g. all subpages are zeroed / treated as holes), it
> will never be seen by f2fs_finish_read_bio(), so folio_end_read() is
> never called. This leaves the folio locked and not marked uptodate.
> 
> Track whether the current folio has been added to a BIO via a local
> 'folio_in_bio' bool flag, and when iterating readahead folios, explicitly
> mark the folio uptodate (on success) and unlock it when nothing was added.
> 
> Signed-off-by: Nanzhe Zhao <nzzhao@126.com>
> ---
>   fs/f2fs/data.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 66ab7a43a56f..ac569a396914 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2430,6 +2430,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	unsigned nrpages;
>   	struct f2fs_folio_state *ffs;
>   	int ret = 0;
> +	bool folio_in_bio = false;

No need to initialize folio_in_bio?

> 
>   	if (!IS_IMMUTABLE(inode))
>   		return -EOPNOTSUPP;
> @@ -2445,6 +2446,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	if (!folio)
>   		goto out;
> 
> +	folio_in_bio = false

folio_in_bio = false;

>   	index = folio->index;
>   	offset = 0;
>   	ffs = NULL;
> @@ -2530,6 +2532,7 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   					offset << PAGE_SHIFT))
>   			goto submit_and_realloc;
> 
> +		folio_in_bio = true;
>   		inc_page_count(F2FS_I_SB(inode), F2FS_RD_DATA);
>   		f2fs_update_iostat(F2FS_I_SB(inode), NULL, FS_DATA_READ_IO,
>   				F2FS_BLKSIZE);
> @@ -2539,6 +2542,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	}
>   	trace_f2fs_read_folio(folio, DATA);
>   	if (rac) {
> +		if (!folio_in_bio) {
> +			if (!ret)
> +				folio_mark_uptodate(folio);
> +			folio_unlock(folio);
> +	}

err_out:
	/* Nothing was submitted. */
	if (!bio) {
		if (!ret)
			folio_mark_uptodate(folio);
		folio_unlock(folio);

                 ^^^^^^^^^^^^

If all folios in rac have not been mapped (hole case), will we unlock the folio twice?

Thanks,

		return ret;
	}

>   		folio = readahead_folio(rac);
>   		goto next_folio;
>   	}
> --
> 2.34.1
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
