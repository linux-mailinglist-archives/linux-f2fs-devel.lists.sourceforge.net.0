Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D905612027
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Oct 2022 06:46:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oodjp-0002BV-UI;
	Sat, 29 Oct 2022 04:46:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oodjo-0002BO-Hb
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xK0Gix4Nng4+bxsJBxIBs/C47KThO3x8jttgKijokEw=; b=is1DSAx5shXA9ASJ1ysiIcUtz7
 8rR9jNY+VlvnkMRMh1MdD8z+nrn3orm+XiV36wKxaq9lK/820ZKYtydNHNI0z8NrbXdrbylwjNG01
 hJWYIHIS00baY7u8JNtdCT/hbHCZ+Hy53iPsrfHJ7/yyUGAUk1jeeAETanr9YfUPrziw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xK0Gix4Nng4+bxsJBxIBs/C47KThO3x8jttgKijokEw=; b=Vr0mbn5Ic0bamE1Z+EfP/PQPQX
 E118CmdfdpBqFqtThAKVyTbNxqUdRqNkyITCNo+nP21KGa9p8+2kbMCYm3PwI1TyxN5EMHDCMrjE1
 jICu0Sz4yH8bNr9IoWwcXmMiKLZhEFJBzBifesSE3WTpN1UoYdd+cIu7EWTfim7dh5nQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oodjn-004AUN-T1 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Oct 2022 04:46:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 81D3160A67;
 Sat, 29 Oct 2022 04:46:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968C2C433D6;
 Sat, 29 Oct 2022 04:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667018781;
 bh=80lU3QpeiitIVawK91PHV+p4z43WIDD4Rouks6i2Gj8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=uStOgrQ+MB0RzqQUR2IfSfKEroJt+tBJ1eUXiuGJdVpHPU65B4Wndy12I7NwulNEH
 QLUNGsb9gPkhyPjLpOHxZest61y+4N8W4qWlHOMrKXoINg0FcDDDOjXxHaefByx+f/
 8kBWsq7LLWaUOqILmEqMSRc+s3mc9FckVC7dRltlA3gueYJyLaWQeeWS7ZpJzaVFRR
 3jqmb9wVl/FmxMezeNEb5Mt6NqqRQIo9nqBur1wO2lEpw78o6TPaG3b+pYYYWCgZiM
 1KYPHhw1mZSVn8629ziSH0yjYWEjxqX/XkcIejJBjvO5Ogm4Ov/+SG8x91NwiUvL6B
 J+nrTC2V/HxDA==
Message-ID: <cee7fa24-5699-9777-d157-f03a8dd18a00@kernel.org>
Date: Sat, 29 Oct 2022 12:46:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
 linux-fsdevel@vger.kernel.org
References: <20221017202451.4951-1-vishal.moola@gmail.com>
 <20221017202451.4951-12-vishal.moola@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221017202451.4951-12-vishal.moola@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/18 4:24, Vishal Moola (Oracle) wrote: > Convert
 function to use a folio_batch instead of pagevec. This is in > preparation
 for the removal of find_get_pages_range_tag(). > > Signed-off-by: [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oodjn-004AUN-T1
Subject: Re: [f2fs-dev] [PATCH v3 11/23] f2fs: Convert
 f2fs_fsync_node_pages() to use filemap_get_folios_tag()
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
Cc: linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-mm@kvack.org, ceph-devel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/18 4:24, Vishal Moola (Oracle) wrote:
> Convert function to use a folio_batch instead of pagevec. This is in
> preparation for the removal of find_get_pages_range_tag().
> 
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>

Acked-by: Chao Yu <chao@kernel.org>

Thanks,

> ---
>   fs/f2fs/node.c | 19 ++++++++++---------
>   1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 983572f23896..e8b72336c096 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1728,12 +1728,12 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			unsigned int *seq_id)
>   {
>   	pgoff_t index;
> -	struct pagevec pvec;
> +	struct folio_batch fbatch;
>   	int ret = 0;
>   	struct page *last_page = NULL;
>   	bool marked = false;
>   	nid_t ino = inode->i_ino;
> -	int nr_pages;
> +	int nr_folios;
>   	int nwritten = 0;
>   
>   	if (atomic) {
> @@ -1742,20 +1742,21 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   			return PTR_ERR_OR_ZERO(last_page);
>   	}
>   retry:
> -	pagevec_init(&pvec);
> +	folio_batch_init(&fbatch);
>   	index = 0;
>   
> -	while ((nr_pages = pagevec_lookup_tag(&pvec, NODE_MAPPING(sbi), &index,
> -				PAGECACHE_TAG_DIRTY))) {
> +	while ((nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi), &index,
> +					(pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> +					&fbatch))) {
>   		int i;
>   
> -		for (i = 0; i < nr_pages; i++) {
> -			struct page *page = pvec.pages[i];
> +		for (i = 0; i < nr_folios; i++) {
> +			struct page *page = &fbatch.folios[i]->page;
>   			bool submitted = false;
>   
>   			if (unlikely(f2fs_cp_error(sbi))) {
>   				f2fs_put_page(last_page, 0);
> -				pagevec_release(&pvec);
> +				folio_batch_release(&fbatch);
>   				ret = -EIO;
>   				goto out;
>   			}
> @@ -1821,7 +1822,7 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   				break;
>   			}
>   		}
> -		pagevec_release(&pvec);
> +		folio_batch_release(&fbatch);
>   		cond_resched();
>   
>   		if (ret || marked)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
