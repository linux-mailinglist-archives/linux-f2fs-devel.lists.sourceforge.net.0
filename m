Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBZWOCzV3GmcWQkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:36:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 285EE3EB5E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 13:36:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j6hjiAq3lP4+GF1IhLDyH9nQmY+dCf01OIo7afGhkaw=; b=CMEpYs30YH8/LnKKjAb70BQ9/z
	nPka63A9X0GWNjdFi0/Y2C8ELYp+34jarDfIOV+FESYLWcnG1JOaKLDfmMkzfSHSXOGQiZ/KSEAl0
	vfmtcij2c4SUPS7Iy/MVz2Nf7XvmlKBFOHcBaXLVm37nCgQuILzuugoKzzVsQkBFMLmg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCFaC-0006wJ-Hm;
	Mon, 13 Apr 2026 11:36:00 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCFa9-0006wC-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:35:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vMOFLIYFaJzGrxM9mrUwmvjgkwKk815OzRHF6qWIImk=; b=Bizcw1MMdzonLlcvaRpyF7VToC
 5HXM6eP5jd66eEnk/A1bAz0zDU3++q2MC0RKLPrdLf3ODHwS2mMq+geXi2rxSHU360I8bqG+ob7wN
 t7ZTGUDjLASanp355LbKsdgnv1LR2tDnrDZUGcE7KxwPo4c3YkJSDQeeHdAsXGFUXJN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vMOFLIYFaJzGrxM9mrUwmvjgkwKk815OzRHF6qWIImk=; b=XF1lutZ963wyNE1bTMdzzovg30
 iKO4623ArE7AlLeVFgeGXGTobb+jCbYjzgU5yniuIN//Uf6SVMQ6HyGygcIW8C83EXdwJe1eKBHBn
 MWT5xtpilLyjrOJAbJ6+UQ/k+clkTkh/v2QkHUB8n8Flx0D+MBTFHZ+xfz48N8FPAYdI=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCFa8-0003sE-Sa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 11:35:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4174E60172;
 Mon, 13 Apr 2026 11:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8660C116C6;
 Mon, 13 Apr 2026 11:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776080146;
 bh=gZpu/c5zzguUdsoAwuODrkDtYotcRT8T5XjV2Ca7kC8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=G1uYNsXmaq5U6HI7jYvlX5siiWGOODHi4/m2LEib2vQcKVDjshwspmWNx3yO1TZZ/
 0lqp3Xqr9g33+P3IG2e6GciNg6X4lIDDf6YLSg3j5skIe9SIje4I46artHCeFSchKP
 7VdNViDxJbLbIOAiwHHZ65KPjp+q+UJx9PJ5X9LFi2rgLlNGkbnXAf9vQ8o2ttTUbK
 En6aevWPHeDCujpMP/TFHahNziIGgZyRZDDoSUjEMsMh/3gO0IAKtOMnDg1odWSlq5
 qiTt6ZQSiRJ1JCxWQfLW+XDzT8GQdnnRwTLyl/b2kuIJF3FoQdPqwcYD6ofq+aQ3fk
 qe/ri0mezop3A==
Message-ID: <2ad55daf-5a1c-4777-8a06-689c554f4f5b@kernel.org>
Date: Mon, 13 Apr 2026 19:35:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Lee <chullee@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260408060840.316332-1-chullee@google.com>
Content-Language: en-US
In-Reply-To: <20260408060840.316332-1-chullee@google.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/8/2026 2:08 PM, Daniel Lee wrote: > Track read folio
 counts by order in F2FS iostat sysfs and tracepoints. > > Signed-off-by:
 Daniel
 Lee <chullee@google.com> > --- > fs/f2fs/data.c | 4 ++++ > fs/ [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wCFa8-0003sE-Sa
Subject: Re: [f2fs-dev] [PATCH] f2fs: add page-order information for large
 folio reads in iostat
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
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chullee@google.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 285EE3EB5E1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/2026 2:08 PM, Daniel Lee wrote:
> Track read folio counts by order in F2FS iostat sysfs and tracepoints.
> 
> Signed-off-by: Daniel Lee <chullee@google.com>
> ---
>   fs/f2fs/data.c              |  4 ++++
>   fs/f2fs/f2fs.h              |  3 +++
>   fs/f2fs/iostat.c            | 38 ++++++++++++++++++++++++++++++++++++-
>   fs/f2fs/iostat.h            |  4 ++++
>   include/trace/events/f2fs.h | 21 ++++++++++++++++----
>   5 files changed, 65 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index a210a7a627c6..965d4e6443c6 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -2508,6 +2508,8 @@ static int f2fs_read_data_large_folio(struct inode *inode,
>   	if (!folio)
>   		goto out;
>   
> +	f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
> +
>   	folio_in_bio = false;
>   	index = folio->index;
>   	offset = 0;
> @@ -2682,6 +2684,8 @@ static int f2fs_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
>   			prefetchw(&folio->flags);
>   		}
>   
> +		f2fs_update_read_folio_count(F2FS_I_SB(inode), folio);
> +
>   #ifdef CONFIG_F2FS_FS_COMPRESSION
>   		index = folio->index;
>   
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 56c4af4b1737..e40b6b2784ee 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -10,6 +10,7 @@
>   
>   #include <linux/uio.h>
>   #include <linux/types.h>
> +#include <linux/mmzone.h>
>   #include <linux/page-flags.h>
>   #include <linux/slab.h>
>   #include <linux/crc32.h>
> @@ -2034,6 +2035,8 @@ struct f2fs_sb_info {
>   	unsigned long long iostat_count[NR_IO_TYPE];
>   	unsigned long long iostat_bytes[NR_IO_TYPE];
>   	unsigned long long prev_iostat_bytes[NR_IO_TYPE];
> +	unsigned long long iostat_read_folio_count[NR_PAGE_ORDERS];
> +	unsigned long long prev_iostat_read_folio_count[NR_PAGE_ORDERS];
>   	bool iostat_enable;
>   	unsigned long iostat_next_period;
>   	unsigned int iostat_period_ms;
> diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
> index f8703038e1d8..ae265e3e9b2c 100644
> --- a/fs/f2fs/iostat.c
> +++ b/fs/f2fs/iostat.c
> @@ -34,6 +34,7 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>   {
>   	struct super_block *sb = seq->private;
>   	struct f2fs_sb_info *sbi = F2FS_SB(sb);
> +	int i;
>   
>   	if (!sbi->iostat_enable)
>   		return 0;
> @@ -76,6 +77,12 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
>   	IOSTAT_INFO_SHOW("fs node", FS_NODE_READ_IO);
>   	IOSTAT_INFO_SHOW("fs meta", FS_META_READ_IO);
>   
> +	/* print read folio order stats */
> +	seq_printf(seq, "%-23s", "fs read folio order:");
> +	for (i = 0; i < NR_PAGE_ORDERS; i++)
> +		seq_printf(seq, " %llu", sbi->iostat_read_folio_count[i]);
> +	seq_putc(seq, '\n');
> +
>   	/* print other IOs */
>   	seq_puts(seq, "[OTHER]\n");
>   	IOSTAT_INFO_SHOW("fs discard", FS_DISCARD_IO);
> @@ -113,6 +120,7 @@ static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
>   static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   {
>   	unsigned long long iostat_diff[NR_IO_TYPE];
> +	unsigned long long read_folio_count_diff[NR_PAGE_ORDERS];
>   	int i;
>   	unsigned long flags;
>   
> @@ -133,9 +141,15 @@ static inline void f2fs_record_iostat(struct f2fs_sb_info *sbi)
>   				sbi->prev_iostat_bytes[i];
>   		sbi->prev_iostat_bytes[i] = sbi->iostat_bytes[i];
>   	}
> +
> +	for (i = 0; i < NR_PAGE_ORDERS; i++) {
> +		read_folio_count_diff[i] = sbi->iostat_read_folio_count[i] -
> +					sbi->prev_iostat_read_folio_count[i];
> +		sbi->prev_iostat_read_folio_count[i] = sbi->iostat_read_folio_count[i];
> +	}
>   	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
>   
> -	trace_f2fs_iostat(sbi, iostat_diff);
> +	trace_f2fs_iostat(sbi, iostat_diff, read_folio_count_diff);
>   
>   	__record_iostat_latency(sbi);
>   }
> @@ -151,6 +165,10 @@ void f2fs_reset_iostat(struct f2fs_sb_info *sbi)
>   		sbi->iostat_bytes[i] = 0;
>   		sbi->prev_iostat_bytes[i] = 0;
>   	}
> +	for (i = 0; i < NR_PAGE_ORDERS; i++) {
> +		sbi->iostat_read_folio_count[i] = 0;
> +		sbi->prev_iostat_read_folio_count[i] = 0;
> +	}
>   	spin_unlock_irq(&sbi->iostat_lock);
>   
>   	spin_lock_irq(&sbi->iostat_lat_lock);
> @@ -165,6 +183,24 @@ static inline void __f2fs_update_iostat(struct f2fs_sb_info *sbi,
>   	sbi->iostat_count[type]++;
>   }
>   
> +void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi, struct folio *folio)
> +{
> +	unsigned int order = folio_order(folio);
> +	unsigned long flags;
> +
> +	if (!sbi->iostat_enable)
> +		return;
> +
> +	if (order >= NR_PAGE_ORDERS)
> +		order = NR_PAGE_ORDERS - 1;
> +
> +	spin_lock_irqsave(&sbi->iostat_lock, flags);
> +	sbi->iostat_read_folio_count[order]++;
> +	spin_unlock_irqrestore(&sbi->iostat_lock, flags);
> +
> +	f2fs_record_iostat(sbi);
> +}
> +
>   void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>   			enum iostat_type type, unsigned long long io_bytes)
>   {
> diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
> index eb99d05cf272..2025225b5bed 100644
> --- a/fs/f2fs/iostat.h
> +++ b/fs/f2fs/iostat.h
> @@ -34,6 +34,8 @@ extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
>   extern void f2fs_reset_iostat(struct f2fs_sb_info *sbi);
>   extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>   			enum iostat_type type, unsigned long long io_bytes);
> +extern void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
> +			struct folio *folio);
>   
>   struct bio_iostat_ctx {
>   	struct f2fs_sb_info *sbi;
> @@ -68,6 +70,8 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
>   #else
>   static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
>   		enum iostat_type type, unsigned long long io_bytes) {}
> +static inline void f2fs_update_read_folio_count(struct f2fs_sb_info *sbi,
> +		struct folio *folio) {}
>   static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
>   static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
>   		struct bio *bio, struct bio_post_read_ctx *ctx) {}
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 9364e6775562..49c6cbb6f989 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -2116,9 +2116,10 @@ DEFINE_EVENT(f2fs_zip_end, f2fs_decompress_pages_end,
>   #ifdef CONFIG_F2FS_IOSTAT
>   TRACE_EVENT(f2fs_iostat,
>   
> -	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat),
> +	TP_PROTO(struct f2fs_sb_info *sbi, unsigned long long *iostat,
> +			unsigned long long *read_folio_count),
>   
> -	TP_ARGS(sbi, iostat),
> +	TP_ARGS(sbi, iostat, read_folio_count),
>   
>   	TP_STRUCT__entry(
>   		__field(dev_t,	dev)
> @@ -2150,6 +2151,7 @@ TRACE_EVENT(f2fs_iostat,
>   		__field(unsigned long long,	fs_mrio)
>   		__field(unsigned long long,	fs_discard)
>   		__field(unsigned long long,	fs_reset_zone)
> +		__array(unsigned long long,	read_folio_count, 16)

We only print from read_folio_count[0] to read_folio_count[10], so is
__array(unsigned long long,	read_folio_count, 11) enough?

Thanks,

>   	),
>   
>   	TP_fast_assign(
> @@ -2182,6 +2184,9 @@ TRACE_EVENT(f2fs_iostat,
>   		__entry->fs_mrio	= iostat[FS_META_READ_IO];
>   		__entry->fs_discard	= iostat[FS_DISCARD_IO];
>   		__entry->fs_reset_zone	= iostat[FS_ZONE_RESET_IO];
> +		memset(__entry->read_folio_count, 0, sizeof(__entry->read_folio_count));
> +		memcpy(__entry->read_folio_count, read_folio_count,
> +				sizeof(unsigned long long) * min_t(int, NR_PAGE_ORDERS, 16));
>   	),
>   
>   	TP_printk("dev = (%d,%d), "
> @@ -2194,7 +2199,9 @@ TRACE_EVENT(f2fs_iostat,
>   		"app [read=%llu (direct=%llu, buffered=%llu), mapped=%llu], "
>   		"compr(buffered=%llu, mapped=%llu)], "
>   		"fs [data=%llu, (gc_data=%llu, cdata=%llu), "
> -		"node=%llu, meta=%llu]",
> +		"node=%llu, meta=%llu], "
> +		"read_folio_count [0=%llu, 1=%llu, 2=%llu, 3=%llu, 4=%llu, "
> +		"5=%llu, 6=%llu, 7=%llu, 8=%llu, 9=%llu, 10=%llu]",
>   		show_dev(__entry->dev), __entry->app_wio, __entry->app_dio,
>   		__entry->app_bio, __entry->app_mio, __entry->app_bcdio,
>   		__entry->app_mcdio, __entry->fs_dio, __entry->fs_cdio,
> @@ -2205,7 +2212,13 @@ TRACE_EVENT(f2fs_iostat,
>   		__entry->app_rio, __entry->app_drio, __entry->app_brio,
>   		__entry->app_mrio, __entry->app_bcrio, __entry->app_mcrio,
>   		__entry->fs_drio, __entry->fs_gdrio,
> -		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio)
> +		__entry->fs_cdrio, __entry->fs_nrio, __entry->fs_mrio,
> +		__entry->read_folio_count[0], __entry->read_folio_count[1],
> +		__entry->read_folio_count[2], __entry->read_folio_count[3],
> +		__entry->read_folio_count[4], __entry->read_folio_count[5],
> +		__entry->read_folio_count[6], __entry->read_folio_count[7],
> +		__entry->read_folio_count[8], __entry->read_folio_count[9],
> +		__entry->read_folio_count[10])
>   );
>   
>   #ifndef __F2FS_IOSTAT_LATENCY_TYPE



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
