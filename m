Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6cvwChy/MGr9WwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:12:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4168BA2F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:12:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=iPXOkowL;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=iE9kax86;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=JlCw3Kko;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=crbIPo0P;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UXYma2VgeOdBUNxPYQRrv6CLacoySaSUKWUBwsQwe4=; b=iPXOkowLdWAjyEXypDWGpNogii
	kxlg8ms9qOjrnz4AsOkDT8vd54Tzkw2oY+bCYgyOIOnN5cBJ61/81984r5ZOi+U59b+dp76oYMfAR
	D+ruhB320Z9I8MzURYI6oeS1qvcQu9Ww3FuEQzoFLO47llTSLpNQ5TYCxBL58K1j6Ag0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKDs-0005C8-OY;
	Tue, 16 Jun 2026 03:12:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZKDr-0005C2-RN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1daviKBTe3I0BPjWbMQ93JmV9BZKckBx+2gdvFdWuZ0=; b=iE9kax86zmVIMLRWehD2O84ecJ
 rbPt/ZwCCOMcK6Y1o63Fa+NNWUe4XO9nqDTvPYxc1u4KMgnBWnIsbvyy6FMNqlXj0uwed25oQld6V
 CGFPe5zLbMTNpCuK7vwx8Yv8WbHy75iWuy8gWHwvzNETGh1nmLyV03Lrjk9Ft88qcuGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1daviKBTe3I0BPjWbMQ93JmV9BZKckBx+2gdvFdWuZ0=; b=JlCw3Kko72rNKjaGAvsic4gQnM
 QzlvmdWyzP8iAwCRhpp+rqvYwmX0cqDyDYLbxg/6h4OuD/Paok/eFIvzioRx/dAewzQCAxm2mm4Bz
 YlAiAtxf6btPGH56ChLAAwymtXNBccDYCR+hSnpczRbk9/DYvIaLgqurYtnEvnvamvqY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZKDq-000303-3b for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:12:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 33D414373A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 03:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F2D71F000E9;
 Tue, 16 Jun 2026 03:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781579533;
 bh=1daviKBTe3I0BPjWbMQ93JmV9BZKckBx+2gdvFdWuZ0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=crbIPo0P/cZQ0OthV0YoAyt0hE1jsMkN9RnsNZekW5jl7ZWVi0CPb25OewlNf58KD
 IznUCGeCCKJSfw0KKnQr39s4Gmiuw+YvFOovPrcUGb5+qHEdpuWB2AaCEIrM7LG04/
 MaDkBXc/CIzioURGWn8/i2VitUu2VhjxwGumqI5fksH4LaRjFWeB9R2vT8BpToBdzL
 B0PU4gS8FNrYrGfJHxmzwm5Wma498FzFRAKZenC+Ortze9UhIWqwvgxuFNpLLM5jpl
 OU9fzwCpk0JI8bMbDFhyI9UBoUVJpdWW3OQrgWuaQcW+2G6lV1tixZuBzad9ZCnE+r
 1jeWMaXguJXNg==
Message-ID: <59e4eeb8-ff3e-434b-844c-08038e1883a5@kernel.org>
Date: Tue, 16 Jun 2026 11:12:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260615130822.2576088-1-chao@kernel.org>
 <20260615130822.2576088-4-chao@kernel.org> <ajB5K8SPT3Jq9480@google.com>
Content-Language: en-US
In-Reply-To: <ajB5K8SPT3Jq9480@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/26 06:14, Jaegeuk Kim wrote: > On 06/15, Chao Yu via
 Linux-f2fs-devel wrote: >> fscrypt_finalize_bounce_page() should be called
 only if we use fs layer >> crypto, let's avoid unnecessary fscry [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZKDq-000303-3b
Subject: Re: [f2fs-dev] [PATCH 4/6] f2fs: avoid unnecessary
 fscrypt_finalize_bounce_page()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	RCPT_COUNT_THREE(0.00)[3];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FB4168BA2F

On 6/16/26 06:14, Jaegeuk Kim wrote:
> On 06/15, Chao Yu via Linux-f2fs-devel wrote:
>> fscrypt_finalize_bounce_page() should be called only if we use fs layer
>> crypto, let's avoid unnecessary fscrypt_finalize_bounce_page() in error
>> path of f2fs_write_compressed_pages().
>>
>> BTW, fscrypt_finalize_bounce_page() will check mapping of bounced page
>> before retrieving original page, so, previously it won't cause any issue
>> w/ fscrypt_finalize_bounce_page(), but still we'd better avoid coupling
>> w/ any logic inside fscrypt_finalize_bounce_page().
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>  fs/f2fs/compress.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index caf522d667d6..aaa0813eabcd 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1455,10 +1455,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>>  out_destroy_crypt:
>>  	page_array_free(sbi, cic->rpages, cc->cluster_size);
>>  
>> -	for (--i; i >= 0; i--) {
>> -		if (!cc->cpages[i])
>> -			continue;
>> -		fscrypt_finalize_bounce_page(&cc->cpages[i]);
>> +	if (fio.encrypted) {
>> +		for (--i; i >= 0; i--) {
>> +			if (!cc->cpages[i])
>> +				continue;
>> +			fscrypt_finalize_bounce_page(&cc->cpages[i]);
>> +		}
> 
> Applied as:
> 
> --- a/fs/f2fs/compress.c
> +++ b/fs/f2fs/compress.c
> @@ -1455,6 +1455,9 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
>  out_destroy_crypt:
>         page_array_free(sbi, cic->rpages, cc->cluster_size);
> 
> +       if (!fio.encrypted)
> +               goto out_put_cic;

Looks fine to me.

Thanks,

> +
>         for (--i; i >= 0; i--) {
>                 if (!cc->cpages[i])
>                         continue;
> 
> 
>>  	}
>>  out_put_cic:
>>  	kmem_cache_free(cic_entry_slab, cic);
>> -- 
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
