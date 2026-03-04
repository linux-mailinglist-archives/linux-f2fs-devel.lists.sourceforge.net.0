Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RzZOANL7p2mvnAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB821FD991
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 10:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyYXDfJEIzbG6aQPdQ2cxf/sMTv9BSqdOuszew+eeaM=; b=FFeKsfXLAp0xl8la0imoxaYiIs
	xKitNgd9i64VcRU/VdqQolgecfgeDhxuVZeOWnNP1+xmKZy7LMidFsqb9eWu9RQa1px/NDWgsgOyF
	JS7sSPCZjzIEV0aUE1xh/xahYDaUaCIxub+4ryGML2fE9uwHGpLlcXKN/bxnScT4auBA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxiZ9-0000L4-7A;
	Wed, 04 Mar 2026 09:30:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vxiZ7-0000Kx-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:30:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=79OI9JwIefZbueQOgzxAEWo+yGPBQi3vj/3C2ic2udw=; b=nHS+fj/Vz5VtivkKXONbT82U2n
 23i1VEvKrPT3UAnBzEmEjYq1gVDgKGj51GAVy8UfAffizavuFZBmJOc0CFAXjsGwlsPggyUKSQ43r
 TxM4qnD1qoLLQs1uRP+TjXFr0mFPpvb0kfxh9IIygv8YxtlOtM/O+BbReqg3SZR2A5NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=79OI9JwIefZbueQOgzxAEWo+yGPBQi3vj/3C2ic2udw=; b=fYZ3l/DHHxDD4o3o+V+IweYAU4
 Yg0g6U6gEKXa7KOIczWolHG18gN8OOlNHQgU5z5FXFsGXfxTv6lJI320ef/0UgYyJnqgCBhDGReYz
 BsXGoKDP1vEHyJ5QcySzMxYKtcUpML9d++/zxWjUqmt+R1HxMLlPNDgJbllxLgihUAjo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxiZ7-0007eZ-6M for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 09:30:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 04EB76057A;
 Wed,  4 Mar 2026 09:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84D5BC2BC87;
 Wed,  4 Mar 2026 09:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772616642;
 bh=WucTBZ9u1VxOfbnsH4BJZ/EIjPyoWAz7Jt7BbtxApvQ=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=O4wZ0iz6VYjwXGgXkrcFcqr+kI77lK26R2Y91Y3yQJMQo7ojOQXoXlERAF8HaCNx2
 eqkU78BG12/vRPHyQnF+U4zODwyLbkavrUvd9o+K2InuvTkIfYJw0o8BfIE3U19xXp
 y5vHs3v3LZ4QYAJfVmFseVcoMkGpE6TdfOY4wnTb+GPfRavWagXqFfYv1OsnH3Xe2d
 GuHKTRKcFN6DTzqdc/OlELPgkaTzK0mQFsoA2613CeuyE2e1/cuQBw9TFpokHVWpnw
 oykdwa+RksxAeErCYCX0OnP+R/PpdKHPW9CVZX7nF6/AE5xOzeJbNDhfQ4TyR9hl/7
 fvMHOWvvnPuzQ==
Message-ID: <de786f84-ff11-428b-b9e2-7063c95e9cc8@kernel.org>
Date: Wed, 4 Mar 2026 17:30:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260203133635.3942502-2-monty_pavel@sina.com>
 <20260203133635.3942502-6-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260203133635.3942502-6-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/2/3 21:37, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When f2fs_fiemap() is called with
 `fileinfo->fi_flags`
 containing the > FIEMAP_FLAG_SYNC flag, it attempts t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxiZ7-0007eZ-6M
Subject: Re: [f2fs-dev] [PATCH 4/4] f2fs: fix inline data not being written
 to disk in writeback path
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 3DB821FD991
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vm:email,xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026/2/3 21:37, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
> FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before

Can we fix this in f2fs_fiemap()? rather than in f2fs_write_single_data_page(),
since it affects more.

f2fs_inline_data_fiemap()
...

if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC)
	write single node page if it is dirty?

Thanks,

> retrieving file mappings via filemap_write_and_wait(). However, there is
> an issue where the file does not get mapped as expected. The following
> scenario can occur:
> 
> root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
> root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
> data.3k:
>   EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>     0: [0..5]:          0..5                 6 0x307
> 
> The root cause of this issue is that f2fs_write_single_data_page() only
> calls f2fs_write_inline_data() to copy data from the data folio to the
> inode folio, and it clears the dirty flag on the data folio. However, it
> does not mark the data folio as writeback. When
> __filemap_fdatawait_range() checks for folios with the writeback flag,
> it returns early, causing f2fs_fiemap() to report that the file has no
> mapping.
> 
> To fix this issue, the solution is to call f2fs_sync_node_pages() after
> f2fs_write_inline_data() successfully returns, which will write back the
> inode folio and wait for the writeback to complete.
> 
> Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
>   fs/f2fs/checkpoint.c |  1 +
>   fs/f2fs/data.c       | 19 ++++++++++++++++++-
>   fs/f2fs/node.c       | 21 ++++++++++++++++-----
>   3 files changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 5172396c0b01..d0bca57854da 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1347,6 +1347,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
>   	struct writeback_control wbc = {
>   		.sync_mode = WB_SYNC_ALL,
>   		.nr_to_write = LONG_MAX,
> +		.range_cyclic = 1,
>   	};
>   	int err = 0, cnt = 0;
>   
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index eedadccf86bb..ccc5e4ddf547 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3126,8 +3126,25 @@ int f2fs_write_single_data_page(struct folio *folio, int *submitted,
>   	err = -EAGAIN;
>   	if (f2fs_has_inline_data(inode)) {
>   		err = f2fs_write_inline_data(inode, folio);
> -		if (!err)
> +		if (!err) {
> +			struct folio *ifolio;
> +			struct writeback_control iwbc = {
> +				.sync_mode = WB_SYNC_ALL,
> +				.range_start = inode->i_ino << PAGE_SHIFT,
> +				.range_end = inode->i_ino << PAGE_SHIFT,
> +				.nr_to_write = 1,
> +				.range_cyclic = 0,
> +			};
> +
> +			if (!f2fs_sync_node_pages(sbi, &iwbc, true, FS_NODE_IO)) {
> +				ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
> +				if (!IS_ERR(ifolio)) {
> +					f2fs_folio_wait_writeback(ifolio, NODE, true, true);
> +					f2fs_folio_put(ifolio, true);
> +				}
> +			}
>   			goto out;
> +		}
>   	}
>   
>   	if (err == -EAGAIN) {
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 74992fd9c9b6..47bff89bafe6 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2083,7 +2083,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>   				struct writeback_control *wbc,
>   				bool do_balance, enum iostat_type io_type)
>   {
> -	pgoff_t index;
> +	pgoff_t index, wbc_index;
> +	pgoff_t end, wbc_end;
>   	struct folio_batch fbatch;
>   	int step = 0;
>   	int nwritten = 0;
> @@ -2092,14 +2093,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>   
>   	folio_batch_init(&fbatch);
>   
> +	wbc_index = 0;
> +	wbc_end = LONG_MAX;
> +	if (!wbc->range_cyclic) {
> +		wbc_index = wbc->range_start >> PAGE_SHIFT;
> +		wbc_end = wbc->range_end >> PAGE_SHIFT;
> +	}
>   next_step:
> -	index = 0;
> +	index = wbc_index;
> +	end = wbc_end;
>   
> -	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
> -				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> -				&fbatch))) {
> +	while (!done && (index <= end)) {
>   		int i;
>   
> +		nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
> +				&index, end, PAGECACHE_TAG_DIRTY,
> +				&fbatch);
> +		if (nr_folios == 0)
> +			break;
>   		for (i = 0; i < nr_folios; i++) {
>   			struct folio *folio = fbatch.folios[i];
>   			bool submitted = false;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
