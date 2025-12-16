Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75833CC05F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 01:49:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9VMSdeAhGwYXyz+CSpTF8x30HFZ1DF9/Ph9EkGKwto=; b=aXEFcFMF6e4HQYAbFMtVn6/RSr
	CEFCcdfogvgAoM6+ECJgF4CGp8IMUHmo0DApAp5PiEet5xX2zIVRnYd2YlWwBLhJ2xUIq3yXB0SZK
	rBoEzWKjTm1gkgFAzrq+mR8ph3C0YSMwqoLhraiUf5tU/3ScJAUTy0kAeBKmpriK4ZQw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVJFN-0008QI-PF;
	Tue, 16 Dec 2025 00:49:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vVJFM-0008Q1-SV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:49:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5BDDXnm1EjTO25mlkOUe69HWpi2OXDDOh9CbsxjnEf8=; b=LnQBZiRfA4h4vkL0prO4h6LVgi
 /hexNmQ8XU4ZnGrYcM+pNVbBedjs7JXMzJQlOg6bxiJrIEeVA19+mX6OAnKOwI+3Uga2lrAqzs/sb
 rttIccul79l5n1nw6twwCUEGevN70+Ox268e0K68f7SyiqFyV12unZLVKa+vuKCuRCpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5BDDXnm1EjTO25mlkOUe69HWpi2OXDDOh9CbsxjnEf8=; b=FEUDhbG+BP29vPMFnmmDnAo17a
 a/3jrvLbHLqy0kITfy5vo5IrCv/Ec+i9W00YE10TkCZia4uMCrCjro4F1yQqm/OWNmMrJwO+4gllt
 ommMqs826JcN88kQe3qsGQaMQ4+gw5AX7/nO0dPSc1Nm+Xl3u/LQ0ubIbYyPGFEhATk4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVJFM-0006Lw-A1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E584543E5B;
 Tue, 16 Dec 2025 00:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D51C4CEF5;
 Tue, 16 Dec 2025 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765846129;
 bh=utzvHxFx8eOt7T6O19EhUcB4HEYId4PuTJHu2fwc4lA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DHjfRH5rIiQlpLLZ2U+m/FAJTiFT4L0Z8pQFRCPYop8oN+Br1rHQzHS5xHOgtW1Pp
 o4CPap6pPsA3Yto8J8TmK9U7LTxO0iIMOeInhk3ESKqFQPk+Iy7dVK/1qFDUigKhPg
 ejxPXOYlGg+sV/gpG8GL44/M0usGdtSnYhxgLm3u5Z8mT2scSl4W1w1fDhpIYggi9N
 0Qj1RN5AAtN7fvsx03V92ePozc/SGhZXw67ItLzhqMGr/wqrgR9GWAElfK8O97+tqM
 xyVf4QIc3lyuNPuym7ccSsETvHK8q0NGPcSfhTn++/AA+xi3pEkBEfXn4xt2OErSTH
 6rMm7m/WrgVRg==
Date: Tue, 16 Dec 2025 00:48:47 +0000
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>
Message-ID: <aUCsbwy5yaAos5Lo@google.com>
References: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251212135221.690241-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/12,
 Yongpeng Yang wrote: > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
 > > For readahead, if the current readahead window is smaller than the extent
 > size, expand the window so that larger bi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVJFM-0006Lw-A1
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/12, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> For readahead, if the current readahead window is smaller than the extent
> size, expand the window so that larger bios can be issued and improve
> overall read performance.

I don't think it's good to change the readahead size in deep filesystem level.

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
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
