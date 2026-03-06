Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOWwM0/GqmnVWwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 13:19:27 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296A2206C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 13:19:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2pjs23Raa05VVKMYpM1JrBxp01lMqrVMNJ6NG8wuBg=; b=BMoc/gkGuTLpzp2pTtzt0KyXux
	2gvzOqw43nuadmSsPrv1mrxrJAHM5jK5dLLtKLP9KnvAExMCU9lPRBGsfdmCQBtbNm9CtTY98E6SM
	LIPmYBKgAt3wmz597faetrJOg+p3Frw87NkwjQx9zpo6tQqZzGfbpHAAz2rKkSApn1fo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyU9F-000634-11;
	Fri, 06 Mar 2026 12:19:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vyU9D-00062u-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 12:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQC8FOTtUYk+S91CEGul0g1vm+GlkPqHeN8IyWbgR/c=; b=kEfN5J/Ck534F2tqpyP7Vt9wyn
 Ati/3yqOfbVwtlKCfnCU0PFz17ccnkxXjtjl1LMeV16PpEm9NHtOtucupJRujBvlKTXOVHe9pRJ6S
 pboDVJkKXKFTiacMrcihU6f/7wgdhfZ40Ejd0VZq0lpyk4zSNDMbGChR1YZWrRab0oZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MQC8FOTtUYk+S91CEGul0g1vm+GlkPqHeN8IyWbgR/c=; b=SIIEGm7Rq00EDaPK0Dsgqo+31L
 gdJphGtl3+jFvYDiSzkdPbMk+2/aFBDh4p3xnCt61Qo4NMWb5NH/xWmy4o+8pYBdinVMN++4fXnDP
 +JfUWDPufL+XlZVkTNN59c90lvsjJv5qNYK/AiN2TsGCBNS4bGAQ1uDseX4gs6a7FKa4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyU9C-0007rY-QG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 12:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7411C40B13;
 Fri,  6 Mar 2026 12:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D49FDC2BC86;
 Fri,  6 Mar 2026 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772799544;
 bh=Dyb/xOH2aboS6U+eiEohs1Jy1PbbM45dc8lXBLLWnzs=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=oExzOnBjM4juLE/iW0bD8KsCUs1QISQ0rCCb49EKC5cKUUP6TVZss3XZ5FaGCZDer
 p6GX8PEy+2PgEyxGCJQcNR2ShYYnJAmyyqLefNN4iiqijp1KXGXmU5CyxdrkSBGKaj
 9visD+qWXd3gR/Hj5gkzFm8aGuz2+/vqdT8Gdo/PdcGSad/YG40p+7tM3zTj3IMLGs
 P3KK97nqHE8EZPik+CW7EVMMGbH24saOPU4ugaoNAVyeepPQLiSl+iUZYzs4Lk+8hy
 lpKtElhVW8EoOdtFyvMrUYR0XGcWQqSpH67n5bMcIsjWMVnDhAkUdVP13I4VN9AuBs
 2k3n8yzc36Q0w==
Message-ID: <a295f201-2552-4593-b302-6113761f2601@kernel.org>
Date: Fri, 6 Mar 2026 20:18:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
References: <20260218125237.3340441-1-shinichiro.kawasaki@wdc.com>
 <20260218125237.3340441-2-shinichiro.kawasaki@wdc.com>
 <aZ0aVDSWpRRqFwl9@google.com> <aZ1C-Cdrwoxp0VCJ@shinmob>
 <aaH_XCGbYOt6dpba@google.com> <aae5x_9gpi7utuf0@shinmob>
 <da969409-ce10-46fe-8620-b0dfb0cea201@kernel.org>
 <cb8b545f-0bbc-4747-a2ce-7432fa1e6ef2@kernel.org> <aajhnCU8KjUaoCl_@shinmob>
 <4e22d920-37dc-4414-b512-87343625f1e5@kernel.org> <aalBX7IlREU-Yc4R@shinmob>
Content-Language: en-US
In-Reply-To: <aalBX7IlREU-Yc4R@shinmob>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/5 16:49, Shinichiro Kawasaki wrote: > On Mar 05,
 2026 / 10:03, Chao Yu wrote: > [...] >> Updated link as below which includes
 compile error fix. >> >> https://git.kernel.org/pub/scm/linux/ke [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vyU9C-0007rY-QG
Subject: Re: [f2fs-dev] [PATCH v2 1/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5296A2206C1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:jaegeuk@kernel.org,m:dlemoal@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026/3/5 16:49, Shinichiro Kawasaki wrote:
> On Mar 05, 2026 / 10:03, Chao Yu wrote:
> [...]
>> Updated link as below which includes compile error fix.
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/syzbot&id=ef20840493da6cb26bb910a73c46413a17ea58e7
>>
> 
> I applied the patch above and ran my test workload, then I observed the
> BUG below.
> 
> Mar 05 14:27:51 redsun40 kernel: BUG: key ff1100011a6b5ea0 has not been registered!
> Mar 05 14:27:51 redsun40 kernel: ------------[ cut here ]------------
> Mar 05 14:27:51 redsun40 kernel: DEBUG_LOCKS_WARN_ON(1)
> Mar 05 14:27:51 redsun40 kernel: WARNING: kernel/locking/lockdep.c:4976 at lockdep_init_map_type+0x122/0x220, CPU#11: mount/1829
> 
>   4969         /*                                                                      |
>   4970          * Sanity check, the lock-class key must either have been allocated     |
>   4971          * statically or must have been registered as a dynamic key.            |
>   4972          */                                                                     |
>   4973         if (!static_obj(key) && !is_dynamic_key(key)) {                         |
>   4974                 if (debug_locks)                                                |
>   4975                         printk(KERN_ERR "BUG: key %px has not been registered!\n", key);
>   4976                 DEBUG_LOCKS_WARN_ON(1);                                         |
>   4977                 return;                                                         |
>   4978         }                                                                       |
> 
>  From the comment, I learned that cp_global_sem_key should be registered. I made
> the additional patch below. With this, I observed no lockdep splat, no WARN :)
> Great.

Shinichiro,

Nice catch on the bug and thanks a lot for the fix and test!

I've tested the updated patch w/ xfstests locally, seems no regression, let me send
the new version for review.

> 
> Chao, thank you again for the solution idea. I would like to ask you to take the
> next step to upstream the fix. If it helps, I can post the patch on behalf of
> you, but your action might be faster.

I'm good to send the patch, let me know if you have any other concern. :)

Thanks,

> 
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index 23ef8816c04..1d97dded4ee 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -4949,6 +4949,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   	mutex_init(&sbi->writepages);
>   	init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
>   #ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	lockdep_register_key(&sbi->cp_global_sem_key);
>   	lockdep_set_class(&sbi->cp_global_sem.internal_rwsem,
>   					&sbi->cp_global_sem_key);
>   #endif
> @@ -5423,6 +5424,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   free_sb_buf:
>   	kfree(raw_super);
>   free_sbi:
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +	lockdep_unregister_key(&sbi->cp_global_sem_key);
> +#endif
>   	kfree(sbi);
>   	sb->s_fs_info = NULL;
>   
> @@ -5504,6 +5508,9 @@ static void kill_f2fs_super(struct super_block *sb)
>   	/* Release block devices last, after fscrypt_destroy_keyring(). */
>   	if (sbi) {
>   		destroy_device_list(sbi);
> +#ifdef CONFIG_DEBUG_LOCK_ALLOC
> +		lockdep_unregister_key(&sbi->cp_global_sem_key);
> +#endif
>   		kfree(sbi);
>   		sb->s_fs_info = NULL;
>   	}



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
