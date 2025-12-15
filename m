Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A03ACBC370
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Dec 2025 02:56:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FZ93cLdTK3F40PMYxE7x2U0jAwigjbMvfM5n05krS0E=; b=TOdrGCbWxUmkP/HD7DXncDp1Xs
	I/cU4r1j7GBifIf9dHbdhG6Fu8KS0VMQrT5Yc4F2gyvZEEo0Uap8/GnaMsYJIVlhvLIc0japMUpoe
	faUKXyXnmHW1SyOy9O6JYHyMTEEzUqTRZ0K7IsvRJ8yZVRjqDiqEtt7+K8UI5PafMRQ0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vUxog-0006IA-AH;
	Mon, 15 Dec 2025 01:56:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vUxoS-0006Hi-8H
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1mxCvReE8kSobhtBXz67v5zjSvKP+uMeiXfGeeev+48=; b=K97q4V92Bu0umm9je1nZXJzwif
 6zA64t9fjUSmHOSdLk/efBPXMBMM8UlFpxz2gX0cIbWHCQUQf4E9KYCqksO7pmwRou/9jSdDgcRM1
 ABe5LHyuzmc501+yUMrJuDDERaflA6ivFOgs2MeXUBICa4IHL1r5HBM8ihqta/vU4MjI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1mxCvReE8kSobhtBXz67v5zjSvKP+uMeiXfGeeev+48=; b=Q2NjLP0AiZ7TE1P4CxiqJQo2bL
 rBhZ1BDwb9/ZbNIGMoEgJN78mly5EiDMbWxqIbjQKxRtEw7vK99rmVtCRoMydPzddqmiLkCucFfgU
 iHfFbvNAQtcf99oBL0/mlAFVkwFMKQvqRXqvm0Rrx9j+/vvciVjKk85SdBcwW540ZcCY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vUxoR-0006oo-Rd for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Dec 2025 01:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2F9EB60127;
 Mon, 15 Dec 2025 01:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DC3C4CEF1;
 Mon, 15 Dec 2025 01:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765763736;
 bh=h6+dgTycGrSf6TZ6Yib3R0OFv1DSZ6794qZgY10eKWg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aiCgjEy3IgEkXKXvmC6vfwvac5NHe6KabbEAofMktSbi89C9Gb1NzLxNo2jQfTDBe
 1v2OhHZOh3Bd8zFxDTGJX+7q1eRUgC0wSsCv60QzirMmPQIeqlVb8Ajc2HhSFDk9tv
 auJrx4blBD6ZZkaiqEudKqWOWGm1Tl3c0KSgrvcnQAdyuEXFQ+w9CFvAkkCyX8ialZ
 FLBYw3AJ0ptkBh+Ph7Tn1xBrbDI1DrEceoiQRTcIC9/Q8QH+9y5ieAICQRrDYDS4jI
 wunnQygqSZt0e4T6QZAuvUOgbDSGksaNy5ADiLL2lvKPjs581vlDkDxfl05lnCbIri
 pGRLKkgLFZbYw==
Message-ID: <18edf007-9f95-40b0-867b-05ece98ca70f@kernel.org>
Date: Mon, 15 Dec 2025 09:55:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12/25 21:52, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > For readahead, if the current readahead window
 is smaller than the extent > size, expand the window so that [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vUxoR-0006oo-Rd
Subject: Re: [f2fs-dev] [RFC PATCH 1/1] f2fs: adjust readahead window based
 on extent length
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12/25 21:52, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> For readahead, if the current readahead window is smaller than the extent
> size, expand the window so that larger bios can be issued and improve
> overall read performance.

Yongpeng,

Do you have any numbers to reveal how this patch improves the sequential
read performance?

In addition, will we suffer regression for random read case?

Thanks,

> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>  fs/f2fs/data.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c30e69392a62..2e5cbdb7729c 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2377,6 +2377,17 @@ static int f2fs_mpage_readpages(struct inode *inode,
>  	map.m_seg_type = NO_CHECK_TYPE;
>  	map.m_may_create = false;
>  
> +	if (rac) {
> +		loff_t block_in_file;
> +
> +		block_in_file = rac->_index;
> +		map.m_lblk = block_in_file;
> +		map.m_len = max(nr_pages, inode_to_bdi(inode)->ra_pages);
> +		if (!f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_DEFAULT) && map.m_len > nr_pages) {
> +			readahead_expand(rac, block_in_file << F2FS_BLKSIZE_BITS, map.m_len << F2FS_BLKSIZE_BITS);
> +			nr_pages = readahead_count(rac);
> +		}
> +	}
>  	for (; nr_pages; nr_pages--) {
>  		if (rac) {
>  			folio = readahead_folio(rac);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
