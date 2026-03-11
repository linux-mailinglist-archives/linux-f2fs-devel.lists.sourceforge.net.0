Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMO7MveEsWmjCwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 16:06:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CE4266013
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 16:06:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yy7inr6yHalfAqeagk19vCQy2X0LnUT7L6l5TPy+JGk=; b=EIR2wH1zReGSglb4AKWw345e0q
	ybwwgAj9cm9TEpdmhK3wKiqzK+FYz38W8Pjqh9Wgmrw7nLjLg5+s0KxMlPCvkejTZBRY+t/Yy3iGm
	gNtJOtSOxp70kKRanYFK5SFI55PQkc6J3OmRrIYdm3AWk4sORJOcwAnyr3ViLwIGwK6w=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0L8W-0001WO-EX;
	Wed, 11 Mar 2026 15:06:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0L8V-0001WG-GM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 15:06:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zg/ea103tv4Oko8P0H07gyJ3c/KZT9+uZC4v2/dW2aY=; b=ROt+8jpa2Y98xQ8FRbyJGAQjLn
 0wdfJmCPk88J+xfM8dMC3RinCgvqqzlWszGnJ7BMTa+iaa8KQy8c6gdkZBV3vQMSyd1FXn9O6tc5s
 Y58xXuY1Bf6fuMcA++qJ0lb/NZKhVCZh9W8BwbLjsM4Leh/eTVYOkwFQl95Ui7l1thP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zg/ea103tv4Oko8P0H07gyJ3c/KZT9+uZC4v2/dW2aY=; b=INL4YnnJR5aKNqZuO36PmR4M1i
 VpIMdZT0P2D1mwTJD73hMSJGRPfxPPXjtwqxmEvcUir8Y4DiEDSJ994bqAG56u3iaoivLqvu0IPld
 ckeJKfXDOT+205tEwZz7P7mNKOnvfQAizb2nNEpyMJnrNXmwdXVvutr53ToQyTRl5nUw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0L8U-0003S3-RH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 15:06:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 831796013E;
 Wed, 11 Mar 2026 14:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58847C4CEF7;
 Wed, 11 Mar 2026 14:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773241173;
 bh=mw/8hbJKOG8I5VOQn0pnHUxCpXScj6z6l8URrqggSxY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=cCaGh0KZeg13jJ2hRapjjtYEJlpAOGFAIqC6OttIPQnqngVcdbMFIgMxK+GFp8cDp
 rpWw87pbGUTmAqDvoX+qRHWuKgWx80vHYO/0RFCUupYZescJ1lhSTkZWAnwmtS2GjJ
 YjSK63yIR5EtUxqaWJUmICoGbHjod7FIc+qYpsCstye6pGGwuDGY6eVyiyyVACSWDq
 IV7w+mYOHIbqK/N4ybicV+qf3lBYC779KialhavuL+OQLRUcGVuZOXY9FVMN7w4Rh2
 I5LgRjxFqJcX5GLUhNoK38oE58H5vq1forKI1t1ulMJZp6a+8BKNb14ShutJziVa7w
 tpa4h7z5Xulmw==
Message-ID: <2ab52a8d-a21b-4b74-a2a1-d7b51fb60ca6@kernel.org>
Date: Wed, 11 Mar 2026 22:59:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260310204916.1265736-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260310204916.1265736-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/11 04:49, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Suspend can fail if kernel threads do not freeze
 for a while. > f2fs_gc and f2fs_discard threads can perform long [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0L8U-0003S3-RH
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to freeze GC and discard threads
 quickly
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.sourceforge.net,android.com];
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
X-Rspamd-Queue-Id: 18CE4266013
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/11 04:49, Daeho Jeong wrote:
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
>   fs/f2fs/gc.c      |  4 ++++
>   fs/f2fs/segment.c | 14 ++++++++++++--
>   2 files changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 981eac629fe9..fdc3366c4db3 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1962,6 +1962,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
>   retry:
> +	if (unlikely(freezing(current))) {
> +		ret = 0;
> +		goto stop;
> +	}

Do we need to check freezing() during multiple segments migration?
especially in large section, e.g. zufs case.

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

If we're umounting data partition, it doesn't need to consider suspend?

Thanks,

>   		__wait_all_discard_cmd(sbi, dpolicy);
>   		goto retry;
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
