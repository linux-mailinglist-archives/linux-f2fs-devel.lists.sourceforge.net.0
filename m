Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1295CA0645A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2025 19:29:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVanw-0001U9-CN;
	Wed, 08 Jan 2025 18:29:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tVanq-0001Tx-Oo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 18:29:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4YRrVNFItg82zPxV0SZM2b5qRVn1n744tRtYpRzo5tE=; b=NFjrVhcVU9d8xTFRFXkRiAvBFJ
 xudCraeZW38rTKd+B8XkJ+Fn6eY6hpDzeUnxHcIEN3mA5NMNc1cy2FR686HnMMalonE4p0KPglrrl
 G9A1R/mNT+MaC2krxNV3hd8Fu3E6A5kTUolq//NoV9aqq3GVtm4DEW9O8KBLEe9btN9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4YRrVNFItg82zPxV0SZM2b5qRVn1n744tRtYpRzo5tE=; b=VB6mk9AJKO3x099czaArw5rPIL
 DKPQGKU/cdJRxFvGatB4Noh1NvyCE1z5qTYKOd9JAk7vZAcBIiRjOglVgRXCVCEzTMA8qZhbNAaT0
 CDoqDZ/oifuKjVFHDrIgsRSzcksOQM09ajcB5odDx0xXXpUaLdn06p5mR1Bqm60Cw/PU=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVanq-00073q-SA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 08 Jan 2025 18:29:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 88A27A415E6;
 Wed,  8 Jan 2025 18:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E212C4CED3;
 Wed,  8 Jan 2025 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736360943;
 bh=yp6+JEaEkvjLxq1d8E/XB9umNpoUJ/bejXz+TrlhQyI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MccV8tYGfY9gV1RGzLj2TUKLZpIedPDiqq2+f2nUwbq12oku7VZnZwRVTsfMLDHYj
 sPQOy8UT8olgSpDPkeOFvjyoUWun17Z9n3aUQ/z2Ldx7cEFIC04Wcv5qLqWySj0im6
 EdQqP3qubbjkQBCGLnfeCyt4LJg0ATOKL460+KPUMysyVYcid7LO+gWVyNCpc2e0sx
 kAvKa6JkTr+KCjRw3RX6EyIcgTaIWq9wXJ+liRdOmENs1CwMjWV+t9HE53ICa8TIaY
 O3V8UXt+QyX+7z5RAfzZ/I51kgssUmLRxKDVfu6cSqvwa6De1hjcKZj1Nq1eAlbDSW
 IH4E297ifDFyw==
Date: Wed, 8 Jan 2025 18:29:01 +0000
To: zangyangyang <zangyangyang66@gmail.com>
Message-ID: <Z37D7TRFCvqMoX5U@google.com>
References: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/06,
 zangyangyang wrote: > From: zangyangyang1 <zangyangyang1@xiaomi.com>
 > > When f2fs_write_single_data_page fails, f2fs_write_cache_pages > will
 use the last 'submitted' value incorrectly, whi [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVanq-00073q-SA
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix using wrong 'submitted' value
 in f2fs_write_cache_pages
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
Cc: zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/06, zangyangyang wrote:
> From: zangyangyang1 <zangyangyang1@xiaomi.com>
> 
> When f2fs_write_single_data_page fails, f2fs_write_cache_pages
> will use the last 'submitted' value incorrectly, which will cause
> 'nwritten' and 'wbc->nr_to_write' calculation errors
> 
> Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
> ---
> v3: No logical changes, just format patch
> v2: Initialize "submitted" in f2fs_write_single_data_page()
> ---
>  fs/f2fs/data.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 94f7b084f601..f772fbc7f331 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2816,6 +2816,9 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>  
>  	trace_f2fs_writepage(folio, DATA);
>  
> +	if (submitted)
> +		*submitted = 0;

I don't think this is correct, as callers should handle it.

> +
>  	/* we should bypass data pages to proceed the kworker jobs */
>  	if (unlikely(f2fs_cp_error(sbi))) {
>  		mapping_set_error(folio->mapping, -EIO);
> -- 
> 2.43.2


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
