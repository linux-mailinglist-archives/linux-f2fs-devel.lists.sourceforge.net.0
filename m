Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHg9HsC0uGmtiAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 02:56:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B349B2A2B04
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 02:56:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HX6YR2UNZ0mIVl7ofdHDSL/xY3cBcvzP51WYhLOw47c=; b=Q6GjSXdzYj+MCDZrpA8IsmZcph
	yLOGtfybu8fiyE5X5kpxz8wyFVx3vmb9h0FLgkun3aZTCjyxW1W/+i4pZHuN5frcBJ/62Lm/tiqNh
	Zp2VKSQbKxDtaZJUmsrb61iMiz/ISQsymnYRvnY7JML3Qa8+1ROy7LljzcC26t+Mz128=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2JfH-0002NF-CD;
	Tue, 17 Mar 2026 01:56:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2JfF-0002Mx-BW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 01:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aMT+3H4cKqukiKSIWJJ+8NA0eyLC1yBs9lxmjE/WBb4=; b=CQ393YX8uG7EfVkbTccaGKeh72
 z8Hyu8e3np8m3PCU1NVg1MhxV83zJLwM26t0ne001jaPxfgKgoxLrrP4rR0yOFgyORoEibj6sejAD
 qNd5Y5+KXM8WjSz+nCDHNdwwW1rtIt5jfMH9GZ0S6enRFklG8DpMo7hVU/g+9NwBONWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aMT+3H4cKqukiKSIWJJ+8NA0eyLC1yBs9lxmjE/WBb4=; b=KADbFN+smW4PD26/+FMm2YyTEb
 PDNMUErrBvzlhsVNWm6vzTlTGFAdj3OWrfXfbrN033qdO5lW1lqxuyQmvkh2qzKGugkSucnfhEHTY
 wcPy0Tyh4b+drCcZNioSPwY1AlkeYipAzhX+pxu7HzkeLOz5bkiTIKMv2m+hNoxGrxRc=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2JfF-0008Mo-JN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 01:56:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 474F543640;
 Tue, 17 Mar 2026 01:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE736C19421;
 Tue, 17 Mar 2026 01:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773712564;
 bh=bNzgCH1zcg1vaCTtDXv9WviZYRGhQjAkK1TxfRJrIqo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lvR9zDGaLl4ZxpOymtruRPo6HWH/dPrKDCqbN8DXjKLVUR/byP+zLmSV3cqifEzza
 ghV3SiDqbWOLOUf1W4Fa2IZTWWy6z7wVc52b0W3n1ZACwhNgxCfMYx+cuBxQlc+z6E
 azhC7p+d3so1qc7mXfKojkw2PCSJduWH6BSp2o+duH0/0H1MWcwLtCvL8GC12b2mCc
 dRxA3+R31uxne84BlrJCwf8CJxA51Vsbw49zG1zAoIxsb8w6imckUMwu/3t8tgrXTQ
 +qZ+ihtZ4bFaOwJCl9UVvbRnxqhVTpwMQ8mVGh3h9oLEQVmyTBHkVdoiXzqYdmop7P
 R/E7Qpn767PTQ==
Message-ID: <db5de842-0833-4041-9263-2496da738567@kernel.org>
Date: Tue, 17 Mar 2026 09:56:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260316185954.2185806-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260316185954.2185806-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/17 02:59, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Suspend can fail if kernel threads do not freeze
 for a while. > f2fs_gc and f2fs_discard threads can perform long [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2JfF-0008Mo-JN
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:daehojeong@google.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: B349B2A2B04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/17 02:59, Daeho Jeong wrote:
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
> v3: removed unnecessary suspended check
> v2: add freezing check in do_garbage_collect()
> ---
>   fs/f2fs/gc.c      | 10 ++++++++++
>   fs/f2fs/segment.c | 12 +++++++++++-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 246496fbe5e5..2305f16cbabb 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -1889,12 +1889,18 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
>   				sbi->next_victim_seg[gc_type] =
>   					(cur_segno + 1 < sec_end_segno) ?
>   					cur_segno + 1 : NULL_SEGNO;
> +
> +			if (unlikely(freezing(current))) {
> +				folio_put_refs(sum_folio, 2);
> +				goto stop;

Do we need to return EBUSY or something like that to indicate GC was
interrupted?

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
> @@ -1968,6 +1974,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
>   		goto stop;
>   	}
>   retry:
> +	if (unlikely(freezing(current))) {
> +		ret = 0;

Ditto.

Thanks,

> +		goto stop;
> +	}
>   	ret = __get_victim(sbi, &segno, gc_type, gc_control->one_time);
>   	if (ret) {
>   		/* allow to search victim from sections has pinned data */
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index e9b6d774b985..0c4fb4270185 100644
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
> @@ -1694,7 +1703,8 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
>   next:
>   		mutex_unlock(&dcc->cmd_lock);
>   
> -		if (issued >= dpolicy->max_requests || io_interrupted)
> +		if (issued >= dpolicy->max_requests || io_interrupted ||
> +					suspended)
>   			break;
>   	}
>   



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
