Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOAiOUU2qGm+pQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 14:40:21 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD892008DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 14:40:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhiY6dFnwLv5LCvfwQF/j9gqb+Nay7wnZCMpo1PGQc8=; b=dIV6RsCVWUOr5W8IAeRqEaqREk
	6b/VX1dmkFdiJVd7jfINE34FrWLRPhyidIPL2c6ezRxwGbdg3G8USUa5n7U1sNh+S5e+J5G1lQizO
	3N9LTMiNSwOz8s0+aWDLHoqt9yD+VD5ypEdWVCjOVPcC2yLYuP+8269M7ssDs7ekFWZA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxmSL-00014v-Mb;
	Wed, 04 Mar 2026 13:40:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <vbabka@kernel.org>) id 1vxmSK-00014p-B4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 13:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQIxw/Z/MQdGpERM5wxCSHfUwJz5mLloHMNRL2tJ/vM=; b=nFhxdC6GhA4YhxGgu3EyVsbBwP
 W/ygoUk93dYyfH5r8bxryES/0rcxVTYlwS1yAguf2EM4x7H6h5sv7RhQU/v2rACcN7j6PnjydyMEE
 xqwj2LxDq87MuI8dOxbPnGYjXtBmhXlrHs11WG1uxTu0F4PDzsYqAKTfA6qU3JMBgCko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gQIxw/Z/MQdGpERM5wxCSHfUwJz5mLloHMNRL2tJ/vM=; b=ZkNSxuyejtwKm3roYkaVWdHKP6
 eXyyzwj58zeB4P2rIxK+qGLFojfH7TSNrtA351ApHuad8nj6TMyDvturVsevkEQGOf7X/RYYKeNfG
 oMHmKHsmD5S1bVQ/fM+mMA8Zp0eMEjR+oboQDYq4yzkquVoy3nTY0SFdaY8MWjOjV4tM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxmSJ-0002r4-OG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 13:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4145D437E1;
 Wed,  4 Mar 2026 13:39:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33ECAC19423;
 Wed,  4 Mar 2026 13:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772631593;
 bh=tBg/hfXGbB8kC2UwsbFj4SllrfktIr46ew/BFF078eA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OmVfd74fEjgnoLPP+YJzeIx2IjGp7V0GPXUHue1QkmLdIDIJNgfvesZsuVutlPBPW
 +yQiwp2wzAl2OLloNNG3I2H2o37SlIBQSx1Rsr77wESVy6yIsEI0BXcjm757AwgLvk
 cCNHhAxwddyuzkM8oL9xzu7pls0y/+yGaISktJWKXtdvuanO2ssGqIDXLs1BXwxqMR
 mh5dRFdKmFHHrG7CGzHxpkANcEmqQ5quTPgCDxT9g7elPNd+JeTHPAMdILHfdhzBi+
 ryjJRBLNPlFp77s7IDc7SvOxX9exg6SGTVH4daWRSbgz7J/oiu3Qby6/Q4O3Xy10qU
 +7EkbTJUJjvqQ==
Message-ID: <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
Date: Wed, 4 Mar 2026 14:39:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Harry Yoo <harry.yoo@oracle.com>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org> <aaeLT8mnMMj_kPJc@hyeyoo>
Content-Language: en-US
In-Reply-To: <aaeLT8mnMMj_kPJc@hyeyoo>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/4/26 2:30 AM, Harry Yoo wrote: > [+Cc adding Catalin
 for kmemleak bits] > > On Mon, Mar 02, 2026 at 09:39:48AM +0100, Vlastimil
 Babka (SUSE) wrote: >> On 3/2/26 04:41, Qing Wang wrote: >>> #syz t [...]
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxmSJ-0002r4-OG
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
Cc: Qing Wang <wangqing7171@gmail.com>, Hao Li <hao.li@linux.dev>,
 lorenzo.stoakes@oracle.com, jannh@google.com,
 Catalin Marinas <catalin.marinas@arm.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 sj1557.seo@samsung.com, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 1AD892008DA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:harry.yoo@oracle.com,m:wangqing7171@gmail.com,m:hao.li@linux.dev,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:catalin.marinas@arm.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,oracle.com,google.com,arm.com,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,samsung.com,suse.de,kernel.org,linux-foundation.org,lists.sourceforge.net,suse.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Action: no action

On 3/4/26 2:30 AM, Harry Yoo wrote:
> [+Cc adding Catalin for kmemleak bits]
> 
> On Mon, Mar 02, 2026 at 09:39:48AM +0100, Vlastimil Babka (SUSE) wrote:
>> On 3/2/26 04:41, Qing Wang wrote:
>>> #syz test
>>>
>>> diff --git a/mm/slub.c b/mm/slub.c
>>> index cdc1e652ec52..387979b89120 100644
>>> --- a/mm/slub.c
>>> +++ b/mm/slub.c
>>> @@ -6307,15 +6307,21 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
>>>  			goto fail;
>>>  
>>>  		if (!local_trylock(&s->cpu_sheaves->lock)) {
>>> -			barn_put_empty_sheaf(barn, empty);
>>> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
>>> +				barn_put_empty_sheaf(barn, empty);
>>> +			else
>>> +				free_empty_sheaf(s, empty);
>>>  			goto fail;
>>>  		}
>>>  
>>>  		pcs = this_cpu_ptr(s->cpu_sheaves);
>>>  
>>> -		if (unlikely(pcs->rcu_free))
>>> -			barn_put_empty_sheaf(barn, empty);
>>> -		else
>>> +		if (unlikely(pcs->rcu_free)) {
>>> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
>>> +				barn_put_empty_sheaf(barn, empty);
>>> +			else
>>> +				free_empty_sheaf(s, empty);
>>> +		} else
>>>  			pcs->rcu_free = empty;
>>>  	}
>>
>> I don't think this would fix any leak, and syzbot agrees. It would limit the
>> empty sheaves in barn more strictly, but they are not leaked.
>> Hm I don't see any leak in __kfree_rcu_sheaf() or rcu_free_sheaf(). Wonder
>> if kmemleak lacks visibility into barns or pcs's as roots for searching what
>> objects are considered referenced, or something?
> 
> Objects that are allocated from slab and percpu allocator should be
> properly tracked by kmemleak. But those allocated with
> gfpflags_allow_spinning() == false are not tracked by kmemleak.
> 
> When barns and sheaves are allocated early (!gfpflags_allow_spinning()
> due to gfp_allowed_mask) and it skips kmemleak_alloc_recursive(), 
> it could produce false positives because from kmemleak's point of view,
> the objects are not reachable from the root set (data section, stack,
> etc.).

Good point.

> To me it seems kmemleak should gain allow_spin == false support
> sooner or later.

Or we figure out how to deal with the false allow_spin == false during
boot. Here I'm a bit confused how exactly it happens because AFAICS in
slub we apply gfp_allowed_mask only when allocating a new slab, and in
slab_post_alloc_hook() we apply it to init_mask. That is indeed passed
to kmemleak_alloc_recursive() but not used for the
gfpflags_allow_spinning() decision. kmemleak_alloc_recursive() should
succeed because nobody should be holding any locks that would require
spinning.

Unless it's some interaction with deferred pages like the one fixed by
commit fd3634312a04f33?




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
