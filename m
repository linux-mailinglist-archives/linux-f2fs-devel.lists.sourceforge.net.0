Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA9C779B6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Nov 2025 07:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WsF9k3T/2lBT0vWtbH1AYJLnl4GHy5Uj5Br693pch8I=; b=d7VjwRnqmy8Wx+9oc2YRZTwv1+
	sNA+qNzwCjQt2QB+y9wqc5mJhzjfQrNp6vKkRFkwiGVLY4umdajri4aSMEBOlBjVFRGvZV52/3GFR
	ShNBcFIaVONKoQ+ojp2pUyGBgS1f6xwFh+Unab6WVKIo6TC8tZjcQKAiUneBN+2DPEJA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vMKyY-0005Bu-SR;
	Fri, 21 Nov 2025 06:50:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+8a242fb3b4bb83c2bb93+8125+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vMKyX-0005Bo-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vo2CYkxvIT2Wjjh88hsMNfehDmvCrW9LP6F7KKNOnOM=; b=MNTv5zl6Jz2xWsrgCyYUKFMRY8
 B96zZxbilc6G/dCBtoLjjMlNagkQ5JVL5PFse5hKtfFL0/NyrsIe4NGEFgTQvx1rDUkXBxMAUTXTE
 MADaDwGVaD8rSWHm/GLzOIMmp8E76UMUQhh+0RVt6Fg6Gxu56VUYCVLZz/jfJ8iv1Fp4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vo2CYkxvIT2Wjjh88hsMNfehDmvCrW9LP6F7KKNOnOM=; b=HzGV+jNdmeiKvGOn/ZgSGMxpB2
 UsI6W1dkdz+P/l/dexHkMMBPCTn9NGOV8fvhAXtMgTVEFyO2Qk2n1kualSBlJi7hKyDyaCd8fUh5i
 4bRMtofzfiKEp89b98Tl8h9mwEV746x/GB0IGS729BLnwes+qvVS1nkjwTmUEJKn3fj4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vMKyX-00084Y-B5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Nov 2025 06:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vo2CYkxvIT2Wjjh88hsMNfehDmvCrW9LP6F7KKNOnOM=; b=R2BU6NopA+aJdjWX0pOQHAp99x
 KFL2tyCvJUebfU3KFAdDCgw/dfuwctywKfhlJhBccOKQ9/uuy28mzO8NUtzMR0H4sPH5HEV9SbnDY
 izyjpuxwmNYj2JnifkM2+Wh0I6wwXW9HQ8wXH2S8Nsbz2n8xO42lP5CAhvDnysJo+DCYAbsHr5+9D
 xqDgKZNV3+q2CjDickAQX/gbqJ2aGEImWMWVbXt/gSR45a9N2KzL3DKCs+T8CK69IOZHFWcqppOHc
 uwIMA/n5ubuPXy+p1ZD0uWLXqM6TuvjGKiU1z/cuBofNEhprXz2o5yYpBVbeZb5kuw+JmKJNP3mp7
 lKZEXKEg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vMKyS-00000007wM0-0d5O;
 Fri, 21 Nov 2025 06:50:28 +0000
Date: Thu, 20 Nov 2025 22:50:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <aSALtF5Cty38G2UV@infradead.org>
References: <20251121014846.1971924-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251121014846.1971924-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 21, 2025 at 01:48:46AM +0000, Jaegeuk Kim wrote:
 > This patch adds a sysfs entry to change the folio order for readahead.
 You'll need to explain why this is useful. And why this is f2fs specific
 instead of generic. 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vMKyX-00084Y-B5
Subject: Re: [f2fs-dev] [PATCH] f2fs: add a way to change the desired
 readahead folio order
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 21, 2025 at 01:48:46AM +0000, Jaegeuk Kim wrote:
> This patch adds a sysfs entry to change the folio order for readahead.

You'll need to explain why this is useful.  And why this is f2fs
specific instead of generic.

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c  | 1 +
>  fs/f2fs/f2fs.h  | 3 +++
>  fs/f2fs/super.c | 1 +
>  fs/f2fs/sysfs.c | 9 +++++++++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index c80d7960b652..faf1faa27c41 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2764,6 +2764,7 @@ int f2fs_readahead_pages(struct file *file, loff_t offset, loff_t len)
>  	while (nrpages) {
>  		unsigned long this_chunk = min(nrpages, ra_pages);
>  
> +		ractl.ra->desired_order = F2FS_I_SB(inode)->ra_folio_order;
>  		ractl.ra->ra_pages = this_chunk;
>  
>  		page_cache_sync_ra(&ractl, this_chunk << 1);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 934287cc5624..0e61e253d861 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1921,6 +1921,9 @@ struct f2fs_sb_info {
>  	/* carve out reserved_blocks from total blocks */
>  	bool carve_out;
>  
> +	/* enable large folio. */
> +	unsigned int ra_folio_order;
> +
>  #ifdef CONFIG_F2FS_FS_COMPRESSION
>  	struct kmem_cache *page_array_slab;	/* page array entry */
>  	unsigned int page_array_slab_size;	/* default page array slab size */
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d47ec718f3be..dabac6f288f0 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4287,6 +4287,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
>  			NAT_ENTRY_PER_BLOCK));
>  	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
>  	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
> +	sbi->ra_folio_order = 0;
>  	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
>  	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
>  	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index c42f4f979d13..2537a25986a6 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -906,6 +906,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>  		return count;
>  	}
>  
> +	if (!strcmp(a->attr.name, "ra_folio_order")) {
> +		if (t < 0 || t > MAX_PAGECACHE_ORDER)
> +			return -EINVAL;
> +		sbi->ra_folio_order = t;
> +		return count;
> +	}
> +
>  	*ui = (unsigned int)t;
>  
>  	return count;
> @@ -1180,6 +1187,7 @@ F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
>  F2FS_SBI_GENERAL_RW_ATTR(dir_level);
>  F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
>  F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
> +F2FS_SBI_GENERAL_RW_ATTR(ra_folio_order);
>  #ifdef CONFIG_F2FS_IOSTAT
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
>  F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
> @@ -1422,6 +1430,7 @@ static struct attribute *f2fs_attrs[] = {
>  	ATTR_LIST(reserved_pin_section),
>  	ATTR_LIST(allocate_section_hint),
>  	ATTR_LIST(allocate_section_policy),
> +	ATTR_LIST(ra_folio_order),
>  	NULL,
>  };
>  ATTRIBUTE_GROUPS(f2fs);
> -- 
> 2.52.0.487.g5c8c507ade-goog
> 
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
