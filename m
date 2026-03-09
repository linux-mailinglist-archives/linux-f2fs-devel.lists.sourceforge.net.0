Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH/HH6Jsrml3EAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF732345C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 07:45:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kho8IB8ukyLnZrSMLDubGV+pN1esxSYamdNVyQiYnUw=; b=dYn7sm6vsP5sTGUlJUL+9ciYOE
	w5Y8YENHGocmEiH5aPGVWMAlkOlQBzf9kEywzT2Lp54HE6SZsXg86WDCjrIuLkyTipa1NkdRDLZuI
	cOAN94WO5TDoeFaagEJKFewlF9aTYu5KS2KK6yT06kRagqPHjRlfgE/okFFkMqomdFno=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzUNA-0001Eb-6E;
	Mon, 09 Mar 2026 06:45:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vzUN8-0001ET-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 06:45:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WT9yiKhJg7Dhg+PObWLxZ6v3+8b+AOJdlwAhWHbgevY=; b=TJEZ56emchVzdIUJy+tZaya70B
 +x+f14NRxSz7CviACUTu+gktebraDWeAFzhqPk/Zus6QDLFj8f0mY+cdLwU1hUKbZGDJwMSv1QMex
 gNDf6ptDP9LlMAIpKUdcAH0URhsKY0c0+OFPPyPMHP70Y0T5hTkpB76zFf/TdKBSO8G8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WT9yiKhJg7Dhg+PObWLxZ6v3+8b+AOJdlwAhWHbgevY=; b=mencu02DtFr1LXIGbLLvLXV/At
 QQSncj1DidxTCOn22Iuej/8qOh8RieIY2jEEFvoPzkcuum7ZI5/SQr7PnpC7I4RJY3wDRZRNaZLiO
 8Joh4uuzUbrapZU9Piufj3k4P0t8wuV386OHz/DwVSPY4c430uf9xsUYdvhQK4pSAy40=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzUN7-0003zR-SN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 06:45:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E0F6600AE;
 Mon,  9 Mar 2026 06:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6D2C4CEF7;
 Mon,  9 Mar 2026 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773038734;
 bh=tMVeVkawuVvjLfFIhvoD9/XZq5JQCXlkPX8yr/O0Bfo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ahhXMSXqdgmLByGeE5SnQc63kLcJndkfyXD9OYbFEP5GMPjiKzxGGIj6vNBrbUEkU
 g/jQDswbxGjFDv2N5S1D+7KmWzkwC02vEVqQYQFSm2V8RPJ3duhYJIq63QHHRphstw
 7tFJZO15TV5Qqas11mGWQxWoU/f4p5LdDstVXDlqcSlUpynI+a2nJ58F8kQY52aTEb
 WXm9BHXbOrNzq8I6lwtM/KzziFZIKOprHUl/bxiFqPbUeHjkG4pGX47JthBNwpIrQh
 kah9DiZYug1Kqc+RJ3BxEeSJBnxtTk/HyQsK6L33T7IKDvu3oUUcKuMQoXQO9viuu1
 Wi1B8yB+hwajQ==
Message-ID: <bbd1495d-74d0-4f02-a275-26e244ad21b6@kernel.org>
Date: Mon, 9 Mar 2026 14:45:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yangyang Zang <zangyangyang66@gmail.com>, jaegeuk@kernel.org,
 daehojeong@google.com
References: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
Content-Language: en-US
In-Reply-To: <20260305070426.1890753-1-zangyangyang1@xiaomi.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/5/26 15:04, Yangyang Zang wrote: > The number of SSA
 blocks after segment alignment is inconsistent with >
 get_newsb(segment_count).
 This could result in some SSA blocks not being > zeroed out or [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzUN7-0003zR-SN
Subject: Re: [f2fs-dev] [PATCH v2 1/2] resize.f2fs: fix to avoid zeroing
 main area blocks in migrate_ssa()
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
Cc: Yangyang Zang <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: CAF732345C3
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:zangyangyang66@gmail.com,m:jaegeuk@kernel.org,m:daehojeong@google.com,m:zangyangyang1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,google.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Action: no action

On 3/5/26 15:04, Yangyang Zang wrote:
> The number of SSA blocks after segment alignment is inconsistent with
> get_newsb(segment_count). This could result in some SSA blocks not being
> zeroed out or main area blocks being incorrectly zeroed out during SSA
> migration. Zeroing out main area blocks can corrupt the root inode, leading
> to file system corruption.

Yangyang,

Could you please provide the testcase for this issue?

> 
> Fixes: ad1357c34023 ("f2fs-tools: revert summary entry count from 2048 to 512 in 16kb block support")
> Signed-off-by: Yangyang Zang <zangyangyang1@xiaomi.com>
> ---
> Changes in v2:
>  - Modify the commit message
> ---
>  fsck/resize.c | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index e6502837b209..79db7eede65c 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -257,48 +257,48 @@ static void migrate_ssa(struct f2fs_sb_info *sbi,
>  	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
>  	block_t old_sum_blkaddr = get_sb(ssa_blkaddr);
>  	block_t new_sum_blkaddr = get_newsb(ssa_blkaddr);
> -	unsigned int expand_segno = MAIN_SEGS(sbi) - offset;
> -	unsigned int new_seg_total = get_newsb(segment_count);
> -	int new_segno;
> +	unsigned int expand_sum_blocks = MAIN_SEGS(sbi) - offset;
> +	unsigned int new_sum_blocks = get_newsb(main_blkaddr) - new_sum_blkaddr;

IIUC, the core change is above line, all other changes are cleanup, right?
Can we split the fix and cleanup into two patches? I guess that will be better
for review.

And, if this is a bug only when packed_ssa feature is on, do we need to check
packed_ssa feature before updating new_sum_blocks?

Thanks,

> +	int new_sum_blkoff;
>  	int ret = 0;
>  	void *zero_block = calloc(F2FS_SUM_BLKSIZE, 1);
>  	ASSERT(zero_block);
>  
>  	if (offset && new_sum_blkaddr <= (old_sum_blkaddr +
>  				offset / SUMS_PER_BLOCK)) {
> -		new_segno = 0;
> -		while (new_segno < new_seg_total) {
> -			if (new_segno < expand_segno)
> -				move_ssa(sbi, new_sb, offset++, new_segno);
> +		new_sum_blkoff = 0;
> +		while (new_sum_blkoff < new_sum_blocks) {
> +			if (new_sum_blkoff < expand_sum_blocks)
> +				move_ssa(sbi, new_sb, offset++, new_sum_blkoff);
>  			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
>  				ret = dev_write_4k_block(zero_block,
> -					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> -					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
> +					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
> +					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
>  					WRITE_LIFE_NONE);
>  			else
>  				ret = dev_write_block(zero_block,
> -					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
>  					WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
> -			new_segno++;
> +			new_sum_blkoff++;
>  		}
>  	} else {
> -		new_segno = new_seg_total - 1;
> +		new_sum_blkoff = new_sum_blocks - 1;
>  		offset = MAIN_SEGS(sbi) - 1;
> -		while (new_segno >= 0) {
> -			if (new_segno < expand_segno)
> -				move_ssa(sbi, new_sb, offset--, new_segno);
> +		while (new_sum_blkoff >= 0) {
> +			if (new_sum_blkoff < expand_sum_blocks)
> +				move_ssa(sbi, new_sb, offset--, new_sum_blkoff);
>  			else if (c.feature & F2FS_FEATURE_PACKED_SSA)
>  				ret = dev_write_4k_block(zero_block,
> -					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> -					GET_SUM_NEW_BLKOFF(new_sb, new_segno),
> +					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
> +					GET_SUM_NEW_BLKOFF(new_sb, new_sum_blkoff),
>  					WRITE_LIFE_NONE);
>  			else
>  				ret = dev_write_block(zero_block,
> -					GET_SUM_NEW_BLKADDR(new_sb, new_segno),
> +					GET_SUM_NEW_BLKADDR(new_sb, new_sum_blkoff),
>  					WRITE_LIFE_NONE);
>  			ASSERT(ret >= 0);
> -			new_segno--;
> +			new_sum_blkoff--;
>  		}
>  	}
>  



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
