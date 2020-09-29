Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB0727C098
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Sep 2020 11:12:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNBgM-0003T0-Ik; Tue, 29 Sep 2020 09:12:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kNBgK-0003SY-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Sep 2020 09:12:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DXvEtds3yw4RGjLUXxSVVxldbaW4rESsdWV6jJwN/Mg=; b=DXuEHiGkfD9yYdf0h0awTGLDfw
 2ieHm0I/k0oFtejxrImcQohZB6X2icRbAh+xK8luWkygD5t7+Cz9EdUfKIw0kYtnIvP9duKjiomOJ
 7+dMnHua3AuzpKOigeUIrZ5g0HCgskJx7doB1alvHvCddXKpf+c8TzdD6m4q3UO9Z/EQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DXvEtds3yw4RGjLUXxSVVxldbaW4rESsdWV6jJwN/Mg=; b=cztpO/qXSxZhaACt1j4my/EL2X
 3+3WhS8iFA7UUmpcNmrjJ20bp5WjLZWNdskRtrBGLUZqQUCoUw6b7XEmEbhX4waP9I32vTgeGm/0P
 6bRxWw2GNYNBZuqgxt0X2M9IbZV2tOLLWXR+h8G10maVAkaBnqfqnKRmltRnZA1dDb/Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kNBgH-009rvQ-GR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Sep 2020 09:12:20 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3C93204FD;
 Tue, 29 Sep 2020 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601370720;
 bh=Ro99+3eggNn8iafNxEoxyEpWU/yokJe5HPgAFlFJtJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aYSSwiEuA7DNdbyfu62/HdciUlsBNLlSEmWy/CoRIP3VmuHwPcAtH17QQRgwNvXIn
 jSR9+7e8URP46YdQ2ndO0CUD5wOuxN6UciSxZJfMm7XF/W6T4d0GCdoPlryj/nqPxH
 sT5MESd8Mr8si5SP8vc2A3Wuc6nQLc92MZD0YdbQ=
Date: Tue, 29 Sep 2020 02:11:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200929091159.GC1567825@google.com>
References: <20200914090514.50102-1-yuchao0@huawei.com>
 <20200929082306.GA1567825@google.com>
 <6e7639db-9120-d406-0a46-ec841845bb28@huawei.com>
 <20200929084739.GB1567825@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200929084739.GB1567825@google.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kNBgH-009rvQ-GR
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: compress: introduce page array
 slab cache
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/29, Jaegeuk Kim wrote:
> On 09/29, Chao Yu wrote:
> > On 2020/9/29 16:23, Jaegeuk Kim wrote:
> > > I found a bug related to the number of page pointer allocation related to
> > > nr_cpages.
> > 
> > Jaegeuk,
> > 
> > If I didn't miss anything, you mean that nr_cpages could be larger
> > than nr_rpages, right? the problematic case here is lzo/lzo-rle:
> > 
> > cc->clen = lzo1x_worst_compress(PAGE_SIZE << cc->log_cluster_size);
> > 
> > As we can't limited clen as we did for lz4/zstd:
> > 
> > cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
> 
> Yes, I've seen some memory corruption in lzo test. Here is another patch to fix
> mem leak.
> 
One more fix:

---
 fs/f2fs/compress.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index ba2d4897744d8..b9557865d627b 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -662,7 +662,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	/* Now we're going to cut unnecessary tail pages */
 	new_cpages = page_array_alloc(cc->inode, new_nr_cpages);
-	if (new_cpages) {
+	if (!new_cpages) {
 		ret = -ENOMEM;
 		goto out_vunmap_cbuf;
 	}
@@ -1186,7 +1186,7 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		 */
 		down_read(&sbi->node_write);
 	} else if (!f2fs_trylock_op(sbi)) {
-		return -EAGAIN;
+		goto out_free;
 	}
 
 	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
@@ -1325,8 +1325,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 			continue;
 		f2fs_put_page(cc->cpages[i], 1);
 	}
-	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
-	cc->cpages = NULL;
 out_put_cic:
 	kmem_cache_free(cic_entry_slab, cic);
 out_put_dnode:
@@ -1336,6 +1334,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		up_read(&sbi->node_write);
 	else
 		f2fs_unlock_op(sbi);
+out_free:
+	page_array_free(cc->inode, cc->cpages, cc->nr_cpages);
+	cc->cpages = NULL;
 	return -EAGAIN;
 }
 
-- 
2.28.0.709.gb0816b6eb0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
