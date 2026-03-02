Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAkNCPlMpWmt8AUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 09:40:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3D91D4BC5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 09:40:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxzEakkPrY8bp2OjsBYrnI46GtMU4c3Eo3oHd1x99SE=; b=ZARrh2CU72o6JWIkGBjDLVew6c
	l2CXQMHzokPG7PCbBpVyCdgzWAqbxUOSKYhQvy9LaETueAtC2yC+QAjTZ2ezcA7SvCEq7BB/j1S/M
	khs4MYnPPB7YZo9KCa/T22CxXoNyohAgwsNVNFmHcng1Ze+O24Z62fj2zN0ejZ4nLqYE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vwyox-000678-6V;
	Mon, 02 Mar 2026 08:40:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vbabka@kernel.org>) id 1vwyov-00066P-AT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 08:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e6veCh/SKJpVIoMBxewv4OAAHnUrDVHhYJ0IaoIRGlA=; b=JT5Ik6s9yEjJ+zJG8GvZ5vZ1jR
 ul5ncox0l42jVgaAGdGfcRP0HtzCAfXqtLafjqX30qBDHx7M4W4B8w8t4F3Vvx4PP3MPozoyUXwaQ
 Gt0LHY1ZyMWIwuKoTcka4KRS6WZ/fnJzvRzlhcBNTaNeXgeur4EP6PD7KMxfX6fQ4vRw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e6veCh/SKJpVIoMBxewv4OAAHnUrDVHhYJ0IaoIRGlA=; b=ZvA6jt+Cm3mOXcZy56V9CuweFn
 pOWRBCbSPKMHcYOXVWZvt6R9EtZUBjJTbU85aL007ymqxV5iIw8rte6tkDLAWYTXn4EBRxKimFSMi
 vTI3mgXJn3WvPUxKtHJHnX52qyycJKAg9cj/nPJA3pyRfmcHlMkOsnjM59yXqq2azxZA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vwyou-0007MS-UI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 08:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8244840360;
 Mon,  2 Mar 2026 08:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCE99C19423;
 Mon,  2 Mar 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772440794;
 bh=IK6yz5KkVHkPj52iCRrJqonMHigRB4kCqBYdPevwYOQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=rR6hqX6k7Jy2Fsq/qNTQTzsicRzKK5XKCMn38lSUnx79QM1kS0YTg+FZdrPkMHhAM
 xRPvlxsCD6cQ7hnoBGUd8fKi6lPHVSYnu198wRmEaOO7qtN1DTs/uXwmUi3YCIDUCs
 HvW95YTyPNv5VrWq0kLVxiuE+I2fMO7oWMOuu/Z8PHG5PLDCFmzza5g4Mq6FdMwfwk
 5pLAmKlWAb3GNqbbp7VGzgnzcjHDwEoI65qHQk4nXNMC4EzvWhOKLaQEKojCQX++Fo
 Nmwq8cQ95fgGX+Bpr/QA7y3zMbx0y7W8w9wHiIFn0XBXFaFsSr6yHrEcGQ7Vrx/Iul
 d2CRZOgiHQyCQ==
Message-ID: <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
Date: Mon, 2 Mar 2026 09:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Qing Wang <wangqing7171@gmail.com>,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
In-Reply-To: <20260302034102.3145719-1-wangqing7171@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/2/26 04:41, Qing Wang wrote: > #syz test > > diff --git
 a/mm/slub.c b/mm/slub.c > index cdc1e652ec52..387979b89120 100644 > ---
 a/mm/slub.c
 > +++ b/mm/slub.c > @@ -6307,15 +6307,21 @@ bool __kfre [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vwyou-0007MS-UI
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: "Vlastimil Babka \(SUSE\) via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>
Cc: lorenzo.stoakes@oracle.com, jannh@google.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 Liam.Howlett@oracle.com, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Harry Yoo <harry.yoo@oracle.com>,
 Hao Li <hao.li@linux.dev>, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org, sj1557.seo@samsung.com,
 linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:wangqing7171@gmail.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:harry.yoo@oracle.com,m:hao.li@linux.dev,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,syzkaller.appspotmail.com];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-0.987];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[vbabka@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 5E3D91D4BC5
X-Rspamd-Action: no action

On 3/2/26 04:41, Qing Wang wrote:
> #syz test
> 
> diff --git a/mm/slub.c b/mm/slub.c
> index cdc1e652ec52..387979b89120 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -6307,15 +6307,21 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
>  			goto fail;
>  
>  		if (!local_trylock(&s->cpu_sheaves->lock)) {
> -			barn_put_empty_sheaf(barn, empty);
> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
> +				barn_put_empty_sheaf(barn, empty);
> +			else
> +				free_empty_sheaf(s, empty);
>  			goto fail;
>  		}
>  
>  		pcs = this_cpu_ptr(s->cpu_sheaves);
>  
> -		if (unlikely(pcs->rcu_free))
> -			barn_put_empty_sheaf(barn, empty);
> -		else
> +		if (unlikely(pcs->rcu_free)) {
> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
> +				barn_put_empty_sheaf(barn, empty);
> +			else
> +				free_empty_sheaf(s, empty);
> +		} else
>  			pcs->rcu_free = empty;
>  	}

I don't think this would fix any leak, and syzbot agrees. It would limit the
empty sheaves in barn more strictly, but they are not leaked.
Hm I don't see any leak in __kfree_rcu_sheaf() or rcu_free_sheaf(). Wonder
if kmemleak lacks visibility into barns or pcs's as roots for searching what
objects are considered referenced, or something?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
