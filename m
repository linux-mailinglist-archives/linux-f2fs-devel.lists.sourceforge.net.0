Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC94A4A753
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Mar 2025 02:16:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1toBST-0005bd-1G;
	Sat, 01 Mar 2025 01:16:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1toBSR-0005bK-Je
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:16:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dg3CPuibkA+8LZkbLMH77toWzdbjNhWgHE5fia07VkI=; b=Nq/+OPqdUxWA0+xqfJ+Mzq1Oxs
 +Vjjt5cOYI9KA3HCzupb0/927zOqcz1ZmLQxErJsAHdmClq6W621HE3WsBD4ZEHkWndybBofuKnXJ
 xBCig7KLi9HMoh29CifTwiwlVA9NXUNwpzmDMENhGJ8c0jOM2s3eirs/n8TOuATkXLrQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dg3CPuibkA+8LZkbLMH77toWzdbjNhWgHE5fia07VkI=; b=Fa/o8LTmJIF8J2XpAsOVT2/5Hj
 1u8XkKPQyFwroBs65cnht5QFlLuNCOHEEhtpm8BfEiIJLvofSw7qnjmI49eu70NrO2xfGFl1ZaSgo
 BkG6L4lf++Z+JYYTBR4HLX6azB0yra1rL3PmJ6Cm2NI4NjUFuPbeesMRhhnXdt0n3ffU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1toBSR-0006tt-JH for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Mar 2025 01:16:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4AC3061160;
 Sat,  1 Mar 2025 01:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F0F0C4CED6;
 Sat,  1 Mar 2025 01:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740791748;
 bh=gwP/lAwkf+yOnx27eEqF2ecPLEyoDU7PhipvMcy//xc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=vKKQ5HcYczvq1COSyQF8Ci6vVbTOSCTdNyvZE8OSqHMP1rZFxIKslUuicU0uvpCZW
 OL1qK9IYhpVt0GJbiODPHAzr23L4BvZGQtjjvlQTOTImubOwP4ddlJvIT/KhKcSvDt
 6cKLF+wCWdu2ExPnj6+RDbib6sI2svJP8tjRvRGCuAVNRLnSCpnlA+++U10z/vLm2+
 2Uv8VsG0kmJ/GW41upFzM2tnoJrlPD08SLRfDhHjK8D3VPZ1nzNWV8RAmcZM3nZO6z
 4G9Vs7lnxP2e1fQiiqvdNJw0htDdWbjXqzahuZ70zoYQQsqG61VmMLVILzgVbyo0eW
 EpgwvoccKx+6w==
Message-ID: <39268c84-f514-48b7-92f6-b298d55dfc62@kernel.org>
Date: Sat, 1 Mar 2025 09:15:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250218055203.591403-1-willy@infradead.org>
 <20250218055203.591403-18-willy@infradead.org>
Content-Language: en-US
In-Reply-To: <20250218055203.591403-18-willy@infradead.org>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote: > Change
 __get_node_page() to return a folio and convert back to a page in >
 f2fs_get_node_page()
 and f2fs_get_node_page_ra(). > > Signed-off-by: Mat [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1toBSR-0006tt-JH
Subject: Re: [f2fs-dev] [PATCH 17/27] f2fs: Add f2fs_get_node_folio()
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2025/2/18 13:51, Matthew Wilcox (Oracle) wrote:
> Change __get_node_page() to return a folio and convert back to a page in
> f2fs_get_node_page() and f2fs_get_node_page_ra().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   fs/f2fs/f2fs.h |  1 +
>   fs/f2fs/node.c | 18 +++++++++++++-----
>   2 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bbaa61da83a8..8f23bb082c6f 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3689,6 +3689,7 @@ struct page *f2fs_new_inode_page(struct inode *inode);
>   struct page *f2fs_new_node_page(struct dnode_of_data *dn, unsigned int ofs);
>   void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid);
>   struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid);
> +struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid);
>   struct page *f2fs_get_node_page_ra(struct page *parent, int start);
>   int f2fs_move_node_page(struct page *node_page, int gc_type);
>   void f2fs_flush_inline_data(struct f2fs_sb_info *sbi);
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index da28e295c701..2d161ddda9c3 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1449,7 +1449,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
>   	f2fs_put_page(apage, err ? 1 : 0);
>   }
>   
> -static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
> +static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
>   					struct page *parent, int start)
>   {
>   	struct folio *folio;
> @@ -1462,7 +1462,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   repeat:
>   	folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), nid, false);
>   	if (IS_ERR(folio))
> -		return ERR_CAST(folio);
> +		return folio;
>   
>   	err = read_node_page(&folio->page, 0);
>   	if (err < 0) {
> @@ -1493,7 +1493,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   	}
>   page_hit:
>   	if (likely(nid == nid_of_node(&folio->page)))
> -		return &folio->page;
> +		return folio;
>   
>   	f2fs_warn(sbi, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
>   			  nid, nid_of_node(&folio->page), ino_of_node(&folio->page),
> @@ -1512,17 +1512,25 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
>   	return ERR_PTR(err);
>   }
>   
> +struct folio *f2fs_get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid)
> +{
> +	return __get_node_folio(sbi, nid, NULL, 0);
> +}
> +
>   struct page *f2fs_get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid)
>   {
> -	return __get_node_page(sbi, nid, NULL, 0);
> +	struct folio *folio = __get_node_folio(sbi, nid, NULL, 0);
> +

	if (IS_ERR(folio))
		return ERR_CAST(folio));

> +	return &folio->page;
>   }
>   
>   struct page *f2fs_get_node_page_ra(struct page *parent, int start)
>   {
>   	struct f2fs_sb_info *sbi = F2FS_P_SB(parent);
>   	nid_t nid = get_nid(parent, start, false);
> +	struct folio *folio = __get_node_folio(sbi, nid, parent, start);
>   

	if (IS_ERR(folio))
		return ERR_CAST(folio));

> -	return __get_node_page(sbi, nid, parent, start);
> +	return &folio->page;
>   }
>   
>   static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
