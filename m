Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GP2bIUq93GliVwkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:54:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA0E3EA136
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Apr 2026 11:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC+/o82HxhleYyHm4chxt8SFIuRW54mB1tTcympB4jA=; b=FLfinf+UeAYRi7cq2yQg4i2BTO
	yvLHRqeUcLZ0Zfn2TPNjus3myKXCeWgS0VJEfE51owsXKWy9CqP5HyyXej866/Tv+MY1TgbmpvR2d
	1sCk4GTLZKly1azEB3C/QG5T1GXHeEeXw3uWgmVgDb07qfH7Iz20cxrSYCxXkvTJ2Tag=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wCDze-0004jU-S5;
	Mon, 13 Apr 2026 09:54:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wCDzd-0004jN-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:54:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O1Y8SsALU0VPwgpvszBbrWx96etA0UEhirXpimiCtrM=; b=avqScsOIiIcYtzWl7gl8NkDHaJ
 S54rxgCqjVYyFNAwvuVixaE1MCy1bDG4yx0QzZQ1o3wUwWSFEgmFZQBnk/1Jy/JkBfPadMjriw59U
 wFy9ztzi8Q9NhGoepMEdTYFEhnRPlu7LSWZQPBtNVqIc0TYa4bgHpewHe4RqXpbyu44g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=O1Y8SsALU0VPwgpvszBbrWx96etA0UEhirXpimiCtrM=; b=YDNMVOimPEzUoZ8WZUnbtJoxMY
 fAK8S0O+y6qwKZjHOSns0TYjCWZx/g4DZNbLFii+Y9WpwPeQ+1mXqzQm6tHffwdz8tNPjqY5e/OlE
 k5N0KB42maSECezgAzy9rwfQkF0ChzOtM9MeszWaNaxcTdana7R7g4NmbsR4wCAtF82A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wCDzc-0006V4-Mp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Apr 2026 09:54:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CC684414E;
 Mon, 13 Apr 2026 09:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B6FC116C6;
 Mon, 13 Apr 2026 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776074043;
 bh=LZ84jfU53L0jzvN/b+Y0kvB0wMvLw74jrXSbVmbKK9g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=J6ymKspAa+gLD10CemrGCDaRGgYTG3luoQ/jLdcevde6QUFV6N1Jvge+5p93f21Yg
 8siGYp8LZZU54vH0fdN2i40TIE4KgKX3MESwef56g08i+xKfm6g8Z9JuPi2ucLcv2X
 eAEhdJuSuWjvs1VoKo7FMoYktPHwqQeliIdiUGpf4Q/V+RSL/3QkVV4c3n4wB3Yvv+
 p97/RWmvcetbvM3KOpW+6hBHnxxc0hqQGXf3vjxdvL1VF3GAsSDPkma07K2+JZ2JFQ
 Zp7k/epbuA8oTWl+qzWsv38Md+Px50IdgDgQo78LUGQUd0ffGeSJfWwTv1SyLmcTyo
 hdpdWtleXMcgA==
Message-ID: <51500762-ec13-4e3e-93e6-80484a7a2a8b@kernel.org>
Date: Mon, 13 Apr 2026 17:54:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260402114559.2030042-1-jinbaoliu365@gmail.com>
Content-Language: en-US
In-Reply-To: <20260402114559.2030042-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/2/2026 7:45 PM, liujinbao1 wrote: > From: liujinbao1
 <liujinbao1@xiaomi.com> > > Add trace_f2fs_fault_report to trigger reporting
 upon f2fs_bug_on, > need_fsck, stop_checkpoint, and handle_eio. S [...] 
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
X-Headers-End: 1wCDzc-0006V4-Mp
Subject: Re: [f2fs-dev] [PATCH] f2fs: Add trace_f2fs_fault_report
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
Cc: liujinbao1 <liujinbao1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
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
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: CDA0E3EA136
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/2/2026 7:45 PM, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> Add trace_f2fs_fault_report to trigger reporting upon f2fs_bug_on,
> need_fsck, stop_checkpoint, and handle_eio. Since f2fs_bug_on and
> need_fsck can be triggered in hundreds of scenarios, define set_sbi_flag
> as a macro to help capture the effective fault function and line number.
> 
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
> ---
>   fs/f2fs/checkpoint.c        | 10 ++++++++++
>   fs/f2fs/f2fs.h              | 20 +++++++++++++++++++-
>   include/trace/events/f2fs.h | 22 ++++++++++++++++++++++
>   3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 6dd39b7de11a..698540c0f619 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -24,6 +24,8 @@
>   #include "iostat.h"
>   #include <trace/events/f2fs.h>
>   
> +EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_fault_report);

I don't think we need to export this in upstream.

> +
>   static inline void get_lock_elapsed_time(struct f2fs_time_stat *ts)
>   {
>   	ts->total_time = ktime_get();
> @@ -232,9 +234,17 @@ static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
>   static struct kmem_cache *ino_entry_slab;
>   struct kmem_cache *f2fs_inode_entry_slab;
>   
> +void f2fs_fault_report(unsigned int err_code, const char *func, unsigned int data)
> +{
> +	trace_f2fs_fault_report(err_code, func, data);
> +}

What do you think just calling trace_f2fs_fault_report() directly?

> +
>   void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>   						unsigned char reason)
>   {
> +	if (reason != STOP_CP_REASON_SHUTDOWN)
> +		f2fs_fault_report(REPORT_FAULT_STOP_CP, __func__, reason);
> +
>   	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
>   	if (!end_io)
>   		f2fs_flush_merged_writes(sbi);
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bb34e864d0ef..ac2fa4b6bd37 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -97,6 +97,15 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>   #define DEFAULT_FAILURE_RETRY_COUNT		1
>   #endif
>   
> +enum {
> +	REPORT_FAULT_NEED_FSCK,
> +	REPORT_FAULT_PAGE_EIO,
> +	REPORT_FAULT_STOP_CP,
> +	REPORT_FAULT_MAX,
> +};
> +
> +void f2fs_fault_report(unsigned int err_code, const char *func, unsigned int data);
> +
>   /*
>    * For mount options
>    */
> @@ -2275,11 +2284,18 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>   	return test_bit(type, &sbi->s_flag);
>   }
>   
> -static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
> +static inline void __set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	set_bit(type, &sbi->s_flag);
>   }
>   
> +#define set_sbi_flag(sbi, type)				\
> +do {							\
> +	__set_sbi_flag(sbi, type);			\
> +	if ((type) == SBI_NEED_FSCK)			\
> +		f2fs_fault_report(REPORT_FAULT_NEED_FSCK, __func__, __LINE__);	\
> +} while (0)
> +
>   static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>   {
>   	clear_bit(type, &sbi->s_flag);
> @@ -5064,6 +5080,8 @@ static inline void f2fs_handle_page_eio(struct f2fs_sb_info *sbi,
>   	if (unlikely(f2fs_cp_error(sbi)))
>   		return;
>   
> +	f2fs_fault_report(REPORT_FAULT_PAGE_EIO, __func__, type);

We have changed to call f2fs_stop_checkpoint() directly in f2fs_handle_page_eio(),
so it's redundant here?

> +
>   	if (ofs == sbi->page_eio_ofs[type]) {
>   		if (sbi->page_eio_cnt[type]++ == MAX_RETRY_PAGE_EIO)
>   			set_ckpt_flags(sbi, CP_ERROR_FLAG);
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 9364e6775562..039c695c45a8 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -2582,6 +2582,28 @@ DEFINE_EVENT(f2fs_priority_update, f2fs_priority_restore,
>   	TP_ARGS(sbi, lock_name, is_write, p, orig_prio, new_prio)
>   );
>   
> +TRACE_EVENT(f2fs_fault_report,
> +
> +	TP_PROTO(unsigned int err_code, const char *func, unsigned int data),
> +
> +	TP_ARGS(err_code, func, data),
> +
> +	TP_STRUCT__entry(
> +		__field(unsigned int, err_code)
> +		__string(func, func)
> +		__field(unsigned int, data)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->err_code = err_code;
> +		__assign_str(func, func);
> +		__entry->data = data;
> +	),
> +
> +	TP_printk("err_code=%u func=%s data=%u",

Do we need dev information?

Thanks,

> +		__entry->err_code, __get_str(func), __entry->data)
> +);
> +
>   #endif /* _TRACE_F2FS_H */
>   
>    /* This part must be outside protection */



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
