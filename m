Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKPYCxgwq2n2agEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 20:50:48 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5950D2273A5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 20:50:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqRtwBPfMjdBjE90KM5aJs3ThCFBJ5RY7hLl3rhHu4g=; b=Q1cNxjsqGE1PNADe/FmZxWZh/h
	hyU3cEA/7dOcYuHAwc/F4AIEE6OY39+lFxEvIz572asb5UVCrZ3BV+WNihYI42lr9MaERxhlFbsFa
	U5BMvH5H46lRuzjNs1vKGbOwSH6OweaXBS2ZP/dUKxlvZlp3VIFMDjPd+1I9B/Zy3+HI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vybC2-00076l-RM;
	Fri, 06 Mar 2026 19:50:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <catalin.marinas@arm.com>) id 1vybBo-00076V-84
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 19:50:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GxypWmVpYpVuttdZa2oWZ3CvwQ9hX7LB7kQQ7oXcnvI=; b=LJD8pqoAZnEhPab1W0gqY79nL9
 SUUJQ3YqGitdSdmV4ugUwXkwYriIgnVxVzQ6sutX0DYIBx4f5+ErOvax07JLJMsz+yBYfFjg9ruMi
 G6viF7bpctI+uHH72PcaxnWv+8E7v/YE80LQpApul8+0O8GyWddFdyC8E/qSywkUfBW4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GxypWmVpYpVuttdZa2oWZ3CvwQ9hX7LB7kQQ7oXcnvI=; b=G82haZFoC1gNOe0tpm+oe+v63P
 lqQqa/ZeS4ZHcxL0Ews8h1cybLc3cqtWTlvx90tWLazQp0q1ijLTdBppFJviYCgKcdQqYYhvNC+sI
 L5nfFF6BgleygWxpvuLybk1XFPdjXjmzvB/rOKMizuMZEn7ZjFQdv7ZCfrlOTLF5zAR0=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1vybBn-0008Rz-Ip for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 19:50:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3658D497;
 Fri,  6 Mar 2026 11:35:01 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F9B83F836;
 Fri,  6 Mar 2026 11:35:04 -0800 (PST)
Date: Fri, 6 Mar 2026 19:35:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Message-ID: <aassZV5PjgFx8dSI@arm.com>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
 <aaeLT8mnMMj_kPJc@hyeyoo>
 <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Mar 04, 2026 at 02:39:47PM +0100, Vlastimil Babka
 (SUSE) wrote: > On 3/4/26 2:30 AM, Harry Yoo wrote: > > [+Cc adding Catalin
 for kmemleak bits] > > On Mon, Mar 02, 2026 at 09:39:48AM +0100, V [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vybBn-0008Rz-Ip
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
Cc: Qing Wang <wangqing7171@gmail.com>, Hao Li <hao.li@linux.dev>,
 lorenzo.stoakes@oracle.com, jannh@google.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 vbabka@suse.cz, sj1557.seo@samsung.com, pfalcato@suse.de,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org,
 Harry Yoo <harry.yoo@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5950D2273A5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x];
	FORGED_SENDER(0.00)[catalin.marinas@arm.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vbabka@kernel.org,m:wangqing7171@gmail.com,m:hao.li@linux.dev,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:vbabka@suse.cz,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:harry.yoo@oracle.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,oracle.com,google.com,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,suse.cz,samsung.com,suse.de,kernel.org,linux-foundation.org,lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 02:39:47PM +0100, Vlastimil Babka (SUSE) wrote:
> On 3/4/26 2:30 AM, Harry Yoo wrote:
> > [+Cc adding Catalin for kmemleak bits]
> > On Mon, Mar 02, 2026 at 09:39:48AM +0100, Vlastimil Babka (SUSE) wrote:
> >> On 3/2/26 04:41, Qing Wang wrote:
> >>> #syz test
> >>>
> >>> diff --git a/mm/slub.c b/mm/slub.c
> >>> index cdc1e652ec52..387979b89120 100644
> >>> --- a/mm/slub.c
> >>> +++ b/mm/slub.c
> >>> @@ -6307,15 +6307,21 @@ bool __kfree_rcu_sheaf(struct kmem_cache *s, void *obj)
> >>>  			goto fail;
> >>>  
> >>>  		if (!local_trylock(&s->cpu_sheaves->lock)) {
> >>> -			barn_put_empty_sheaf(barn, empty);
> >>> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
> >>> +				barn_put_empty_sheaf(barn, empty);
> >>> +			else
> >>> +				free_empty_sheaf(s, empty);
> >>>  			goto fail;
> >>>  		}
> >>>  
> >>>  		pcs = this_cpu_ptr(s->cpu_sheaves);
> >>>  
> >>> -		if (unlikely(pcs->rcu_free))
> >>> -			barn_put_empty_sheaf(barn, empty);
> >>> -		else
> >>> +		if (unlikely(pcs->rcu_free)) {
> >>> +			if (barn && data_race(barn->nr_empty) < MAX_EMPTY_SHEAVES)
> >>> +				barn_put_empty_sheaf(barn, empty);
> >>> +			else
> >>> +				free_empty_sheaf(s, empty);
> >>> +		} else
> >>>  			pcs->rcu_free = empty;
> >>>  	}
> >>
> >> I don't think this would fix any leak, and syzbot agrees. It would limit the
> >> empty sheaves in barn more strictly, but they are not leaked.
> >> Hm I don't see any leak in __kfree_rcu_sheaf() or rcu_free_sheaf(). Wonder
> >> if kmemleak lacks visibility into barns or pcs's as roots for searching what
> >> objects are considered referenced, or something?
> > 
> > Objects that are allocated from slab and percpu allocator should be
> > properly tracked by kmemleak. But those allocated with
> > gfpflags_allow_spinning() == false are not tracked by kmemleak.
> > 
> > When barns and sheaves are allocated early (!gfpflags_allow_spinning()
> > due to gfp_allowed_mask) and it skips kmemleak_alloc_recursive(), 
> > it could produce false positives because from kmemleak's point of view,
> > the objects are not reachable from the root set (data section, stack,
> > etc.).
> 
> Good point.
> 
> > To me it seems kmemleak should gain allow_spin == false support
> > sooner or later.
> 
> Or we figure out how to deal with the false allow_spin == false during
> boot. Here I'm a bit confused how exactly it happens because AFAICS in
> slub we apply gfp_allowed_mask only when allocating a new slab, and in
> slab_post_alloc_hook() we apply it to init_mask. That is indeed passed
> to kmemleak_alloc_recursive() but not used for the
> gfpflags_allow_spinning() decision. kmemleak_alloc_recursive() should
> succeed because nobody should be holding any locks that would require
> spinning.

I don't fully understand what goes on. If kmemleak_alloc_recursive()
failed to allocate for some reason (other than SLAB_NOLEAKTRACE), it
would loudly disable kmemleak altogether and stop reporting leaks. Also
kmemleak doesn't care about allow_spin, it's only the slub code which
avoids calling kmemleak if spinning not allowed (as it takes some locks,
may call back into the slab allocator).

I wonder whether some early kmem_cache_node allocations like the ones in
early_kmem_cache_node_alloc() are not tracked and then kmemleak cannot
find n->barn. I got lost in the slub code, but something like this:

-----------8<-----------------------------------
diff --git a/mm/slub.c b/mm/slub.c
index 0c906fefc31b..401557ff5487 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7513,6 +7513,7 @@ static void early_kmem_cache_node_alloc(int node)
 	slab->freelist = get_freepointer(kmem_cache_node, n);
 	slab->inuse = 1;
 	kmem_cache_node->node[node] = n;
+	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
 	init_kmem_cache_node(n, NULL);
 	inc_slabs_node(kmem_cache_node, node, slab->objects);
 
-------------8<----------------------------------------

Another thing I noticed, not sure it's related but we should probably
ignore an object once it has been passed to kvfree_call_rcu(), similar
to what we do on the main path in this function. Also see commit
5f98fd034ca6 ("rcu: kmemleak: Ignore kmemleak false positives when
RCU-freeing objects") when we added this kmemleak_ignore().

---------8<-----------------------------------
diff --git a/mm/slab_common.c b/mm/slab_common.c
index d5a70a831a2a..73f4668d870d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 	if (!head)
 		might_sleep();
 
-	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
+		/*
+		 * The object is now queued for deferred freeing via an RCU
+		 * sheaf. Tell kmemleak to ignore it.
+		 */
+		kmemleak_ignore(ptr);
 		return;
+	}
 
 	// Queue the object but don't yet schedule the batch.
 	if (debug_rcu_head_queue(ptr)) {
----------------8<-----------------------------------

-- 
Catalin


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
