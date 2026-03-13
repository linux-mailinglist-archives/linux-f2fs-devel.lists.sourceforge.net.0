Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4IeaESq0s2lYZwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:52:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E04127E5F1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 07:52:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZoJNExAE7yVRTbE9MjjrsGjvFNrJ55/kwguiOq3970=; b=IQLZ7pjv3rfM+oQJS7PpklPxAu
	KMXdEYt2CInjdcH/WbWxSIZGPmMU3Y7ovZgpntQGrUdWpc/U9+V67vN3Epx6nSvt83gHzA3u44oUd
	iKzPXFGTUn9wL1FqgK9RfG/0P6jUcrNy1n6YYIT0i8f/89TCpg7On9NdbLzxS/Z5MhUg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0wNe-00055i-1P;
	Fri, 13 Mar 2026 06:52:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0wNb-00055c-Ur
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jax4LQ3jCHPyWqdijk3/1R2IbjPJijwg8x+k5AGKGHc=; b=CTbKs12VdEquCAna8bJir9JVAH
 njJ/nvP3hVq5QbRyHh+TsVhIj+KLaTXapMg0YGzfBZ5jvNlm+RrKnfQyVj8kbU2xThhIjWbwP84x7
 1JnJNOOBxblCWLJp4O0l99CHAqkn4Bxqts+sdeAQZlZhDuIee4rEWxv5cvo5JpPqHqh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jax4LQ3jCHPyWqdijk3/1R2IbjPJijwg8x+k5AGKGHc=; b=aLegRUINkhkXgWIlC5S1GnNZgv
 BKs33Wt/ctxE96HrSyZOPaSlAvdQJNTdgjEywvypC9JRFtGNoj+GQHec0YB3ZZjT9Gw5Nhk67If6A
 pP8hUbdXifqo2u+gSfqSmfb2OQXKCfSfGzJTG5At2kn5hmoG8ir+VLH+kHd2t0GT4YYw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0wNb-0005tl-6K for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 06:52:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 49F5460130;
 Fri, 13 Mar 2026 06:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F183C19421;
 Fri, 13 Mar 2026 06:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773384729;
 bh=sdE01EQ48CShBexzOdkYeBWovo9FKJc2G9Jp0vuYhdg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ektjnVWcc5tX5sgOIcBYhzU9LXwaLA3mh/taMrAu3tvqkJnu4f3uHz7g+/YAhc42i
 vhBnb/o/ZxXFzuiK/gk+T7PVZMwd/IperLjK6JEOfoiB6aZSHiGcwS8OQXgVYCUJz1
 b9V7L2FyW8XKUEKHL/ICBrhFM2sWyrKA30ciKdOvR2Pw53a20vKwtjIOGZSZkfN9Is
 Yo4opbttnwyyQjLdzP7HmcpzaJWOQUeca1tqDB2lHFA7fum49Uv+0UUxPFvszExgPU
 kfCyhdGE/XNTKueaZWbr+5caA0IsumiFjcl5WHSBdKC6yB5DfXoSMDRDdS7vcCK+aB
 EWZ39dOiDZKTg==
Message-ID: <ca1c433f-e10e-4421-9a00-7fd3016a9a28@kernel.org>
Date: Fri, 13 Mar 2026 14:52:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260312155330.2670199-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260312155330.2670199-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/12/2026 11:53 PM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Suspend can fail if kernel threads do not freeze
 for a while. > f2fs_gc and f2fs_discard threads can perform l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0wNb-0005tl-6K
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to freeze GC and discard
 threads quickly
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,android.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 8E04127E5F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/2026 11:53 PM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Suspend can fail if kernel threads do not freeze for a while.
> f2fs_gc and f2fs_discard threads can perform long-running operations
> that prevent them from reaching a freeze point in a timely manner.
> 
> This patch adds explicit freezing checks in the following locations:
> 1. f2fs_gc: Added a check at the 'retry' label to exit the loop quickly
>     if freezing is requested, especially during heavy GC rounds.
> 2. __issue_discard_cmd: Added a 'suspended' flag to break both inner and
>     outer loops during discard command issuance if freezing is detected
>     after at least one command has been issued.
> 3. __issue_discard_cmd_orderly: Added a similar check for orderly discard
>     to ensure responsiveness.
> 
> These checks ensure that the threads release locks safely and enter the
> frozen state.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> v2: add freezing check in do_garbage_collect()
> ---
>   fs/f2fs/gc.c      | 10 ++++++++++
>   fs/f2fs/segment.c | 14 ++++++++++++--
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 981eac629fe9..f07746a14aa4 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1883,12 +1883,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   				sbi->next_victim_seg[gc_type] =
>   					(cur_segno + 1 < sec_end_segno) ?
>   					cur_segno + 1 : NULL_SEGNO;
> +
> +			if (unlikely(freezing(current))) {
> +				folio_put_refs(sum_folio, 2);
> +				goto stop;
> +			}
>   		}
>   next_block:
>   		folio_put_refs(sum_folio, 2);
>   		segno = block_end_segno;
>   	}
>   
> +stop:
>   	if (submitted)
>   		f2fs_submit_merged_write(sbi, data_type);
>   
> @@ -1962,6 +1968,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
>   retry:
> +	if (unlikely(freezing(current))) {
> +		ret = 0;
> +		goto stop;
> +	}
>   	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
>   	if (ret) {
>   		/* allow to search victim from sections has pinned data */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index e9b6d774b985..a6c82ab28288 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -1606,6 +1606,9 @@ static void __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
>   		if (dc->state != D_PREP)
>   			goto next;
>   
> +		if (*issued > 0 && unlikely(freezing(current)))
> +			break;
> +
>   		if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
>   			io_interrupted = true;
>   			break;
> @@ -1645,6 +1648,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   	struct blk_plug plug;
>   	int i, issued;
>   	bool io_interrupted = false;
> +	bool suspended = false;
>   
>   	if (dpolicy->timeout)
>   		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
> @@ -1675,6 +1679,11 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   		list_for_each_entry_safe(dc, tmp, pend_list, list) {
>   			f2fs_bug_on(sbi, dc->state != D_PREP);
>   
> +			if (issued > 0 && unlikely(freezing(current))) {
> +				suspended = true;
> +				break;
> +			}
> +
>   			if (dpolicy->timeout &&
>   				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
>   				break;
> @@ -1694,11 +1703,12 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   next:
>   		mutex_unlock(&dcc->cmd_lock);
>   
> -		if (issued >= dpolicy->max_requests || io_interrupted)
> +		if (issued >= dpolicy->max_requests || io_interrupted ||
> +					suspended)
>   			break;
>   	}
>   
> -	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
> +	if (dpolicy->type == DPOLICY_UMOUNT && issued && !suspended) {

We don't need to change this line due to we don't care about suspend
during umount()? Right?

Thanks,

>   		__wait_all_discard_cmd(sbi, dpolicy);
>   		goto retry;
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
