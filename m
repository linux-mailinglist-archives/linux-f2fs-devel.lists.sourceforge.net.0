Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AQNjI/gy9Gk5/QEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 06:58:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9504AA6C6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 01 May 2026 06:58:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LhamEKDmzzDGVDBl3lqrrgfrkXnI3b3VlyYeE1bnsDo=; b=cwMuTKToU8g3E/l5yAUBAdOOv5
	hQFv4GL5PS2vJv03Zb5nKeA9AtYraiX2BQY8XWAnxk7IZBdMG0BafBhYyblFKqTqJkRnbK8P5HmRa
	Dyngs48f0s2235qJ76l6DvaED0cVWXn/Lp7R8Gw1PX1htUP3G1J2XBdGg4lQS59ABIj8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wIfxL-0005y7-IQ;
	Fri, 01 May 2026 04:58:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wIfxJ-0005y0-UT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 04:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdVHEQ6iz0BiWRpociUzMOmYLz61Qu+2SeiNujbcLGw=; b=b10cwynKEzfURjOQmn7+ZHeSpB
 jeNrfoyzWgrpKSEustuLAE4yJE6S6J29s1zxdI+UYFHIMay4dDt0CNUOts94IAUX+I5vjZMRRmSdT
 PxkeuRYAkITJ8US/OnNjSEHhqAz/muTJ/WRkAVRx/QInmEt+iY0NiDKIe6c1ne+rjHHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tdVHEQ6iz0BiWRpociUzMOmYLz61Qu+2SeiNujbcLGw=; b=MrJBxVkVQLtBBBjQxhxJiY6kWV
 UG4MM1OIYG/DgKAmRgw6NzaN8F1jDQJZHJ+W6y+u4dD+Ai8hxMZPdLwc8upDJYgFerPb0UdVXPrCK
 HgXbI0MTskleAGfj/Wk0GB9oBQSQN4UFOInB1GphZAFpSyiPj8Lf6o8ATBxfOl4JsDRg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wIfxJ-0000VE-D5 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 May 2026 04:58:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A7E3D60142;
 Fri,  1 May 2026 04:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF11C2BCB7;
 Fri,  1 May 2026 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777611499;
 bh=kyJrnFd/aS78Z7xe5ptixG/ZAXKtEa4eCYJ3qFTGDpg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o+YrYa5bhBAdPhdmZpfLl4anvgzGnY4UyS6fLGSVPZ9njXSdUH9MomqqpFcId2cSc
 fVSr0wsxKz2wnJdcecLxqpkH76TBdbvU1NEsrAn0KDSSTNyCWVfQRr8kGH6Clubya8
 W9zQgH0eYLp5byseNmZQl3CajlUZfRfQ1+5+p+vPNILJa787Ir8ztCht+meCT4kK4R
 SWPtSDuEXOigPTzR1wWjNBF4c81WIsrqvlaU41i79hz3BvVZNUs+dcV8jwYCii/D87
 2airncbB84JzTWzBaBoYxUCDgdtKVN1AI+RjeZr0ln39ipl82s08RvHZbgodn1q8g+
 MKQ7d6iZEEmLQ==
Date: Fri, 1 May 2026 04:58:17 +0000
To: liujinbao1 <jinbaoliu365@gmail.com>
Message-ID: <afQy6Vy_d2ySs6xC@google.com>
References: <20260415114237.3089952-1-jinbaoliu365@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415114237.3089952-1-jinbaoliu365@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It seems this patch fails to build on linux-next. Could you
 please check? On 04/15,
 liujinbao1 wrote: > From: liujinbao1 <liujinbao1@xiaomi.com>
 > > Add trace_f2fs_fault_report to trigger reporting upon f2fs_bug_on, >
 need_fsck, stop_checkpoint, and handle_eio. Since f2fs_b [...] 
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
X-Headers-End: 1wIfxJ-0000VE-D5
Subject: Re: [f2fs-dev] [PATCH] [PATCH v2] f2fs: Add trace_f2fs_fault_report
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
Cc: shengyong1 <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: CA9504AA6C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,xiaomi.com:email]

It seems this patch fails to build on linux-next. Could you please check?

On 04/15, liujinbao1 wrote:
> From: liujinbao1 <liujinbao1@xiaomi.com>
> 
> Add trace_f2fs_fault_report to trigger reporting upon f2fs_bug_on,
> need_fsck, stop_checkpoint, and handle_eio. Since f2fs_bug_on and
> need_fsck can be triggered in hundreds of scenarios, define set_sbi_flag
> as a macro to help capture the effective fault function and line number.
> 
> Signed-off-by: shengyong1 <shengyong1@xiaomi.com>
> Signed-off-by: liujinbao1 <liujinbao1@xiaomi.com>
> ---
>  fs/f2fs/f2fs.h              | 18 +++++++++++++++++-
>  fs/f2fs/super.c             |  9 +++++++++
>  include/trace/events/f2fs.h | 28 ++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 56c4af4b1737..2249a68d6bf5 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -97,6 +97,15 @@ extern const char *f2fs_fault_name[FAULT_MAX];
>  #define DEFAULT_FAILURE_RETRY_COUNT		1
>  #endif
>  
> +enum {
> +	REPORT_FAULT_NEED_FSCK,
> +	REPORT_FAULT_STOP_CP,
> +	REPORT_FAULT_MAX,
> +};
> +
> +void f2fs_fault_report(struct super_block *sb, unsigned int err_code,
> +			const char *func, unsigned int data);
> +
>  /*
>   * For mount options
>   */
> @@ -2278,11 +2287,18 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
>  	return test_bit(type, &sbi->s_flag);
>  }
>  
> -static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
> +static inline void __set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>  {
>  	set_bit(type, &sbi->s_flag);
>  }
>  
> +#define set_sbi_flag(sbi, type)				\
> +do {							\
> +	__set_sbi_flag(sbi, type);			\
> +	if ((type) == SBI_NEED_FSCK)			\
> +		f2fs_fault_report(sbi->sb, REPORT_FAULT_NEED_FSCK, __func__, __LINE__);	\
> +} while (0)
> +
>  static inline void clear_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
>  {
>  	clear_bit(type, &sbi->s_flag);
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index ccf806b676f5..b431842751d6 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4724,9 +4724,18 @@ static void f2fs_handle_critical_error(struct f2fs_sb_info *sbi,
>  	 */
>  }
>  
> +void f2fs_fault_report(struct super_block *sb, unsigned int err_code,
> +			const char *func, unsigned int data)
> +{
> +	trace_f2fs_fault_report(sb, err_code, func, data);
> +}
> +
>  void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
>  						unsigned char reason)
>  {
> +	if (reason != STOP_CP_REASON_SHUTDOWN)
> +		f2fs_fault_report(sbi->sb, REPORT_FAULT_STOP_CP, __func__, reason);
> +
>  	f2fs_build_fault_attr(sbi, 0, 0, FAULT_ALL);
>  	if (!end_io)
>  		f2fs_flush_merged_writes(sbi);
> diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> index 9364e6775562..b97bc3bf499a 100644
> --- a/include/trace/events/f2fs.h
> +++ b/include/trace/events/f2fs.h
> @@ -2582,6 +2582,34 @@ DEFINE_EVENT(f2fs_priority_update, f2fs_priority_restore,
>  	TP_ARGS(sbi, lock_name, is_write, p, orig_prio, new_prio)
>  );
>  
> +TRACE_EVENT(f2fs_fault_report,
> +
> +	TP_PROTO(struct super_block *sb, unsigned int err_code,
> +		const char *func, unsigned int data),
> +
> +	TP_ARGS(sb, err_code, func, data),
> +
> +	TP_STRUCT__entry(
> +		__field(dev_t, dev)
> +		__field(unsigned int, err_code)
> +		__string(func, func)
> +		__field(unsigned int, data)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->dev		= sb->s_dev;
> +		__entry->err_code	= err_code;
> +		__assign_str(func, func);
> +		__entry->data		= data;
> +	),
> +
> +	TP_printk("dev = (%d,%d), err_code = %u, func = %s, data = %u",
> +		show_dev(__entry->dev),
> +		__entry->err_code,
> +		__get_str(func),
> +		__entry->data)
> +);
> +
>  #endif /* _TRACE_F2FS_H */
>  
>   /* This part must be outside protection */
> -- 
> 2.43.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
