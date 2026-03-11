Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4B0uHxmUsWnkDAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:11:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C40192670D0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 17:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lsqo7GVKW0vCOfF0MH/DU9Cd6PGWdvrZyxYm1+/656A=; b=e3H7TTjkwQs+lY9Wl7RCiOHkQh
	kHczXXRzuo3l6hl9zjcgu5mCfWwFRJVUrSe6dI+Y3rickjdIg768jXu4OBC0kuGkzE4CqjMbQ7Cu8
	3L2/MV/ApkQ1gKHWNH/57WBKCaPXLkmn6WR3rh8n9ZX3v+vkjte7CRCIyvwsgyn69q9k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0M96-00066t-M9;
	Wed, 11 Mar 2026 16:10:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w0M8s-00066d-Nn
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jTSsaSwH0SyhBDIOLJIgrBIaHkvNX+GUh3ijmW54UjY=; b=JZfDZXgIk87WX+NfVAnwWBKPmQ
 2n5jkj7k6m+PzE2rGrqhnJ7rEAiFiDIVPeUgUrXqRVDngybEaY7118GpRF97My/C6X/7cscm1fEep
 cHC7hR0vfVDa/b0tbgULk9Xpu5ujyVz9ALtfUZQK9fNbti3VulnwegnG3/7dbPaof4uU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jTSsaSwH0SyhBDIOLJIgrBIaHkvNX+GUh3ijmW54UjY=; b=ORpmCntft5PFh8epL/jDUVLdVg
 q8e3F50qNZcC4I3jM+w8PL277HHcP8MP8vEMjNG1wvaXSa5HdzFFnbD9O2p57K2CQsENCg88nunT6
 Ly/DSjQjfm5MSKo3eCQgo4DkN95byHlT0/+7I/p2C+iFzGKYfq05DRF4OqJOOr2mEIaA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0M8r-0007i9-V3 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 16:10:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 22F1E44460;
 Wed, 11 Mar 2026 13:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38BEAC4CEF7;
 Wed, 11 Mar 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773236649;
 bh=OD21PrssA79FIcWIFDQaYFQnABNyQry8BnIpPYlAW5k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dso26tImuBnrdem09GdQ3Ix/mRG/Fa9tr1n3i89YtRRhgtw2QyzekfboosrH1WMmB
 nHeyXHVfzpWi3kVNcjUbvVG6xjQimSB2/bWbuzWz77CcDsJaBZgvMozqjp0s5i21m7
 RclE4EwcliBAEqN5f1cAUlMSnGgyFeQYZSJiDKZ7asgUgcVaSWsRkXN9I15QczBxmy
 ofkAQfvQb8zABOdisx2+GRb1lVEcw1bhSz3M0ckiOyLrLH51o9GwU/Ec2/EGk/aC4h
 I+6FbLxTW+RuMmqvJ2TU8jq5wiRHs7iVxl/FPdBFVwOtoUbTF+WNsU76p7qc/D3OyG
 +thI2B3+88KsQ==
Message-ID: <fbaaef01-5a66-407e-b447-b5741b42d309@kernel.org>
Date: Wed, 11 Mar 2026 21:44:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20260310175428.1156719-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20260310175428.1156719-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/11 01:54, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > In age-based victim selection (ATGC, AT_SSR,
 or GC_CB), f2fs_get_victim > can encounter sections with zero valid [...] 
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
X-Headers-End: 1w0M8r-0007i9-V3
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to skip empty sections in
 f2fs_get_victim
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
X-Rspamd-Queue-Id: C40192670D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026/3/11 01:54, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> In age-based victim selection (ATGC, AT_SSR, or GC_CB), f2fs_get_victim
> can encounter sections with zero valid blocks. This situation often
> arises when checkpoint is disabled or due to race conditions between
> SIT updates and dirty list management.
> 
> In such cases, f2fs_get_section_mtime() returns INVALID_MTIME, which
> subsequently triggers a fatal f2fs_bug_on(sbi, mtime == INVALID_MTIME)
> in add_victim_entry() or get_cb_cost().
> 
> This patch adds a check in f2fs_get_victim's selection loop to skip
> sections with no valid blocks. This prevents unnecessary age
> calculations for empty sections and avoids the associated kernel panic.
> This change also allows removing redundant checks in add_victim_entry().
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/gc.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 2e0f67946914..981eac629fe9 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -521,12 +521,6 @@ static void add_victim_entry(struct f2fs_sb_info *sbi,
>   	struct sit_info *sit_i = SIT_I(sbi);
>   	unsigned long long mtime = 0;
>   
> -	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> -		if (p->gc_mode == GC_AT &&
> -			get_valid_blocks(sbi, segno, true) == 0)
> -			return;
> -	}
> -
>   	mtime = f2fs_get_section_mtime(sbi, segno);
>   	f2fs_bug_on(sbi, mtime == INVALID_MTIME);
>   
> @@ -889,6 +883,9 @@ int f2fs_get_victim(struct f2fs_sb_info *sbi, unsigned int *result,
>   		if (sec_usage_check(sbi, secno))
>   			goto next;
>   
> +		if (!get_valid_blocks(sbi, segno, true))
> +			goto next;

Well, for f2fs_get_victim(, AT_SSR), once there are no dirty segment, if we
don't count free segment as candidates, then, we can not find any valid victim?

Thanks,

> +
>   		/* Don't touch checkpointed data */
>   		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
>   			if (p.alloc_mode == LFS) {



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
