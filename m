Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JwkOsTys2nYdgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 12:19:32 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF44B282205
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 12:19:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=amHKxoBuCgiSIu9GLDLo2urmuyn8RCEspZxp9twIgew=; b=XmYwCF4Gw4Hz6XFJId/jpQB8zJ
	scZBJrMh3gPzd8BnO8mdiBfhF2yXhpGWGZ0J3j93hKQIuY+DsbDGXmLgXMDFIlumnLzpLFNhIC3ql
	ZtfXXDmob5ogCYTp+0aVlMcU2lc79xKr1EfIdcEOS5rcMWWqDniaoaIg1gzGPO7XsOZY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w10YB-0007um-AF;
	Fri, 13 Mar 2026 11:19:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w10Y9-0007uV-2W
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 11:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UUVTj4EeTuvJSYQ8gVVvxa0LAwxctIOCHPDpi2XY3HA=; b=AZEJm32jKb7VPAlPP8EPzPSL38
 K2a2cxiZSHz14EDt4GMfOfe/gpNjoT05BBPBKFvyF+o4Pas4izavqKMsRPs2Xx+bmdUJtNVpg32F5
 yggYJg1379CPZLUh2ntQ/fy0hkz9wxtzdR9Yy4+jy9evJEunxNlz4MikJ6XzQg0Zbob0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UUVTj4EeTuvJSYQ8gVVvxa0LAwxctIOCHPDpi2XY3HA=; b=DCQy8ZhCDqG4GOWgt6ovMEuuav
 Eojqmi1fLQ7CO521FUHQiRq9nIIS8jmAtbkmicqEHVc3xunU2ooc90FbleR+aYWIaVt5LVhhru9Aa
 6K9fR20hYIX0OiA9pEHRHXeZccsAC/0HX1kleLF4cgsu6i6NjvMWL+oyrLOG0Jrn0PiA=;
Received: from r3-20.sinamail.sina.com.cn ([202.108.3.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w10Y7-0006Om-Fj for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 11:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773400763; bh=UUVTj4EeTuvJSYQ8gVVvxa0LAwxctIOCHPDpi2XY3HA=;
 h=Message-ID:Date:Subject:From;
 b=uCr3fH8QCySX2SvShTT7ojEyszGfBMonEM4tbtqRiUa4Z32mzeaBkNFGwmgDa0mGy
 blki7OvyUGHuFXiTmEruZCaZ4tRSbT4FPpHIG/8H8EdTl/57YgYXVkwMEHzWID9IwU
 gutMutZREYyr2vvUfCk2rIwyiBHLMbkvXKqVyM5o=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69B3F2B000000B7E; Fri, 13 Mar 2026 19:19:14 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 6359534456632
X-SMAIL-UIID: C4026785DCCD4FB789CEC5644086DB8C-20260313-191914-1
Message-ID: <889e7f95-09b8-47f9-af05-48b7ccc05386@sina.com>
Date: Fri, 13 Mar 2026 19:19:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260308144013.2340225-3-monty_pavel@sina.com>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <20260308144013.2340225-3-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/8/26 22:40, Yongpeng Yang wrote: > From: Yongpeng Yang
 > > When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
 > FIEMAP_FLAG_SYNC flag, it attempts to write data to disk befor [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w10Y7-0006Om-Fj
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix inline data not being written
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: AF44B282205
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/8/26 22:40, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When f2fs_fiemap() is called with `fileinfo->fi_flags` containing the
> FIEMAP_FLAG_SYNC flag, it attempts to write data to disk before
> retrieving file mappings via filemap_write_and_wait(). However, there is
> an issue where the file does not get mapped as expected. The following
> scenario can occur:
> 
> root@vm:/mnt/f2fs# dd if=/dev/zero of=data.3k bs=3k count=1
> root@vm:/mnt/f2fs# xfs_io data.3k -c "fiemap -v 0 4096"
> data.3k:
>  EXT: FILE-OFFSET      BLOCK-RANGE      TOTAL FLAGS
>    0: [0..5]:          0..5                 6 0x307
> 
> The root cause of this issue is that f2fs_write_single_data_page() only
> calls f2fs_write_inline_data() to copy data from the data folio to the
> inode folio, and it clears the dirty flag on the data folio. However, it
> does not mark the data folio as writeback. When
> __filemap_fdatawait_range() checks for folios with the writeback flag,
> it returns early, causing f2fs_fiemap() to report that the file has no
> mapping.
> 
> To fix this issue, the solution is to call f2fs_sync_node_pages() in
> f2fs_inline_data_fiemap() when getting fiemap with FIEMAP_FLAG_SYNC
> flags. This patch ensures that the inode folio is written back and the
> writeback process completes before proceeding.
> 
> Fixes: 9ffe0fb5f3bb ("f2fs: handle inline data operations")
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
> - Call f2fs_sync_node_pages() in getting fiemap path rather than
> writeback path.
> ---
>  fs/f2fs/checkpoint.c |  1 +
>  fs/f2fs/inline.c     | 25 +++++++++++++++++++++++++
>  fs/f2fs/node.c       | 21 ++++++++++++++++-----
>  3 files changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6dd39b7de11a..c85276931c45 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1416,6 +1416,7 @@ static int block_operations(struct f2fs_sb_info *sbi)
>  	struct writeback_control wbc = {
>  		.sync_mode = WB_SYNC_ALL,
>  		.nr_to_write = LONG_MAX,
> +		.range_cyclic = 1,
>  	};
>  	int err = 0, cnt = 0;
>  
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 86d2abbb40ff..ab1e10b0f6a6 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -9,6 +9,7 @@
>  #include <linux/fs.h>
>  #include <linux/f2fs_fs.h>
>  #include <linux/fiemap.h>
> +#include <linux/writeback.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -814,6 +815,30 @@ int f2fs_inline_data_fiemap(struct inode *inode,
>  		goto out;
>  	}
>  
> +	if (fieinfo->fi_flags & FIEMAP_FLAG_SYNC) {
> +		struct writeback_control iwbc = {
> +			.sync_mode = WB_SYNC_ALL,
> +			.range_start = inode->i_ino << PAGE_SHIFT,
> +			.range_end = inode->i_ino << PAGE_SHIFT,
> +			.nr_to_write = 1,
> +			.range_cyclic = 0,
> +		};
> +
> +retry:
> +		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
> +		if (folio_test_dirty(ifolio)) {
> +			f2fs_folio_put(ifolio, true);
> +			err = f2fs_sync_node_pages(F2FS_I_SB(inode), &iwbc, true, FS_NODE_IO);
> +			if (!err) {
> +				ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
> +				if (IS_ERR(ifolio))
> +					return PTR_ERR(ifolio);
> +				goto retry;
> +			}
> +			return err;
> +		}
> +	}
> +
>  	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
>  	if (start >= ilen)
>  		goto out;
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index bbfa677ef46f..2fbfecaf3f7b 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2083,7 +2083,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  				struct writeback_control *wbc,
>  				bool do_balance, enum iostat_type io_type)
>  {
> -	pgoff_t index;
> +	pgoff_t index, wbc_index;
> +	pgoff_t end, wbc_end;
>  	struct folio_batch fbatch;
>  	int step = 0;
>  	int nwritten = 0;
> @@ -2092,14 +2093,24 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>  
>  	folio_batch_init(&fbatch);
>  
> +	wbc_index = 0;
> +	wbc_end = LONG_MAX;
> +	if (!wbc->range_cyclic) {
> +		wbc_index = wbc->range_start >> PAGE_SHIFT;
> +		wbc_end = wbc->range_end >> PAGE_SHIFT;
> +	}
>  next_step:
> -	index = 0;
> +	index = wbc_index;
> +	end = wbc_end;
>  
> -	while (!done && (nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
> -				&index, (pgoff_t)-1, PAGECACHE_TAG_DIRTY,
> -				&fbatch))) {
> +	while (!done && (index <= end)) {
>  		int i;
>  
> +		nr_folios = filemap_get_folios_tag(NODE_MAPPING(sbi),
> +				&index, end, PAGECACHE_TAG_DIRTY,
> +				&fbatch);
> +		if (nr_folios == 0)
> +			break;
>  		for (i = 0; i < nr_folios; i++) {
>  			struct folio *folio = fbatch.folios[i];
>  			bool submitted = false;

ping

Thanks
Yongpeng,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
