Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALfRISUur2l1PQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 21:31:33 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7441240D63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 21:31:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BL1UkAyXsrVLRBw6qtElLOQkX6rvpzzNsVO++SYKw78=; b=acotHRMuQwKSJ9wdi16RUSDXTl
	3th8uRyA2WLHL0Z3NoDDx4mtXeLIdT0pyjD4s5sBUx66bm/gLIX8m3hacj5mK8SwFkXoeFWS2Vrhf
	+LK1eZfmHzhb9BCqXPir7ejlJA/ykkHYk+8CBIqCPNmUtH9vHkNG8ePl0+Mc8TdOhuKg=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzhG5-0001hi-Lw;
	Mon, 09 Mar 2026 20:31:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <catalin.marinas@arm.com>) id 1vzhG4-0001hc-LP
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 20:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UpMe9qAQLVZX21QZGzY8yvBvKTcFga0dy76omWmS/LE=; b=DDdmNpNUZu6ZABgjDAv0qoP8J/
 kWag2niCwWypUXJ46pjMABaYl8nA9kA2n+g99/rjzbvmCnk8lhe9rNrC5ezNbnRwGYir4dvjggll4
 2BKDEDfPpdb7OAqSJg2gSsGXM9yJUdNKDkOIzM8sZuAaGISkdVtwLV8dIYn5AcTtQGWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UpMe9qAQLVZX21QZGzY8yvBvKTcFga0dy76omWmS/LE=; b=KnJpkk0Labze02P88GrTgo3R8m
 0tYEdrVYf4l//Wa+MRbB4qS1qkXJ/CFLJkA5JtJkgKX9IEV8He/2vIlEMNB3p22XsUkXDU/kt9trW
 /dMn36FGinXs8OFJQuhLquBZ3cK4hmXywDe18pfpieivkswKF8GT7bu9H/kCmjbOlD/4=;
Received: from foss.arm.com ([217.140.110.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1vzhG3-0004V6-BK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 20:31:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 992821516;
 Mon,  9 Mar 2026 13:31:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C777A3F7BD;
 Mon,  9 Mar 2026 13:31:05 -0700 (PDT)
Date: Mon, 9 Mar 2026 20:31:03 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Harry Yoo <harry.yoo@oracle.com>
Message-ID: <aa8uByvL9GwsGfnO@arm.com>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
 <aaeLT8mnMMj_kPJc@hyeyoo>
 <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
 <aassZV5PjgFx8dSI@arm.com> <aa66XJDX4QfmEbNA@hyeyoo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa66XJDX4QfmEbNA@hyeyoo>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 09:17:32PM +0900, Harry Yoo wrote:
 > On Fri, Mar 06, 2026 at 07:35:01PM +0000,
 Catalin Marinas wrote: > > [...snip...]
 > > > I wonder whether some early kmem_cache_node allocat [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vzhG3-0004V6-BK
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
Cc: Qing Wang <wangqing7171@gmail.com>,
 "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, lorenzo.stoakes@oracle.com,
 jannh@google.com, Hao Li <hao.li@linux.dev>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 sj1557.seo@samsung.com, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B7441240D63
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
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,linux.dev,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,samsung.com,suse.de,linux-foundation.org,lists.sourceforge.net,suse.cz];
	FORGED_RECIPIENTS(0.00)[m:harry.yoo@oracle.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:hao.li@linux.dev,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[catalin.marinas@arm.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:17:32PM +0900, Harry Yoo wrote:
> On Fri, Mar 06, 2026 at 07:35:01PM +0000, Catalin Marinas wrote:
> 
> [...snip...]
> 
> > I wonder whether some early kmem_cache_node allocations like the ones in
> > early_kmem_cache_node_alloc() are not tracked and then kmemleak cannot
> > find n->barn. I got lost in the slub code, but something like this:
> 
> This sounds plausible. Before sheaves, kmem_cache_node just maintained
> a list of slabs. Because struct page (and struct slab overlaying on it)
> is not tracked by kmemleak (as Vlastimil pointed out off-list),
> not calling kmemleak_alloc() for kmem_cache_node was not a problem.
> 
> But now it maintains barns and sheaves,
> and they are tracked by kmemleak...

We could simply add kmemleak_ignore(), especially as we don't need the
data in these structures to be scanned. We can assume the slab allocator
doesn't leak it's own data structures. But I couldn't figure out why
kmemleak couldn't track down the pointer in the first place and any
random kmemleak_alloc() I added did not solve it.

> > -----------8<-----------------------------------
> > diff --git a/mm/slub.c b/mm/slub.c
> > index 0c906fefc31b..401557ff5487 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -7513,6 +7513,7 @@ static void early_kmem_cache_node_alloc(int node)
> >  	slab->freelist = get_freepointer(kmem_cache_node, n);
> >  	slab->inuse = 1;
> >  	kmem_cache_node->node[node] = n;
> > +	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);
> >  	init_kmem_cache_node(n, NULL);
> >  	inc_slabs_node(kmem_cache_node, node, slab->objects);
> 
> But this function is called for kmem_cache_node cache
> (in kmem_cache_init()), even before kmemleak_init()?

That's fine, kmemleak starts as enabled by default and tracks early
allocations in a local mem_pool[] array. kmemleak_init() just
initialises its kmem_caches for the long run.

> kmem_cache and kmalloc caches should call kmemleak_alloc() when
> allocating kmem_cache_node structures, but as they are also created
> before kmemleak_init(), I doubt that's actually doing its job...

It does. I just added a kmemleak_alloc() in create_kmalloc_cache() and
kmemleak complained that the object from the kmem_cache_zalloc() is
already registered. Of course, no stack trace saved for these early
allocations but it does track them.

> > -------------8<----------------------------------------
> > 
> > Another thing I noticed, not sure it's related but we should probably
> > ignore an object once it has been passed to kvfree_call_rcu(), similar
> > to what we do on the main path in this function. Also see commit
> > 5f98fd034ca6 ("rcu: kmemleak: Ignore kmemleak false positives when
> > RCU-freeing objects") when we added this kmemleak_ignore().
> > 
> > ---------8<-----------------------------------
> > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > index d5a70a831a2a..73f4668d870d 100644
> > --- a/mm/slab_common.c
> > +++ b/mm/slab_common.c
> > @@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
> >  	if (!head)
> >  		might_sleep();
> >  
> > -	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
> > +	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
> > +		/*
> > +		 * The object is now queued for deferred freeing via an RCU
> > +		 * sheaf. Tell kmemleak to ignore it.
> > +		 */
> > +		kmemleak_ignore(ptr);
> 
> As Vlastimil pointed out off-list, we need to let kmemleak ignore
> sheaves when they are submitted to call_rcu() and ideally undo
> kmemleak_ignore() in __kfree_rcu_sheaf() when they are going to be reused.
> 
> But looking at mm/kmemleak.c, undoing kmemleak_ignore() doesn't seem to
> be a thing.

If that's needed, something like below:

----------------------8<---------------------------------
diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
index 7d784e03f3f9..da2c849d4735 100644
--- a/Documentation/dev-tools/kmemleak.rst
+++ b/Documentation/dev-tools/kmemleak.rst
@@ -163,6 +163,7 @@ See the include/linux/kmemleak.h header for the functions prototype.
 - ``kmemleak_not_leak``	 - mark an object as not a leak
 - ``kmemleak_transient_leak``	 - mark an object as a transient leak
 - ``kmemleak_ignore``		 - do not scan or report an object as leak
+- ``kmemleak_unignore``		 - undo a previous kmemleak_ignore()
 - ``kmemleak_scan_area``	 - add scan areas inside a memory block
 - ``kmemleak_no_scan``	 - do not scan a memory block
 - ``kmemleak_erase``		 - erase an old value in a pointer variable
diff --git a/include/linux/kmemleak.h b/include/linux/kmemleak.h
index fbd424b2abb1..4eec0560be09 100644
--- a/include/linux/kmemleak.h
+++ b/include/linux/kmemleak.h
@@ -28,6 +28,7 @@ extern void kmemleak_update_trace(const void *ptr) __ref;
 extern void kmemleak_not_leak(const void *ptr) __ref;
 extern void kmemleak_transient_leak(const void *ptr) __ref;
 extern void kmemleak_ignore(const void *ptr) __ref;
+extern void kmemleak_unignore(const void *ptr, int min_count) __ref;
 extern void kmemleak_ignore_percpu(const void __percpu *ptr) __ref;
 extern void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp) __ref;
 extern void kmemleak_no_scan(const void *ptr) __ref;
@@ -104,6 +105,10 @@ static inline void kmemleak_ignore_percpu(const void __percpu *ptr)
 static inline void kmemleak_ignore(const void *ptr)
 {
 }
+
+static inline void kmemleak_unignore(const void *ptr, int min_count)
+{
+}
 static inline void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp)
 {
 }
diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d79acf5c5100..99b7ebd03737 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -1292,6 +1292,24 @@ void __ref kmemleak_ignore(const void *ptr)
 }
 EXPORT_SYMBOL(kmemleak_ignore);
 
+/**
+ * kmemleak_unignore - undo a previous kmemleak_ignore() on an object
+ * @ptr:	pointer to beginning of the object
+ * @min_count:	minimum number of references the object must have to be
+ *		considered a non-leak (see kmemleak_alloc() for details)
+ *
+ * Calling this function undoes a prior kmemleak_ignore() by restoring the
+ * given min_count, making the object visible to kmemleak again.
+ */
+void __ref kmemleak_unignore(const void *ptr, int min_count)
+{
+	pr_debug("%s(0x%px)\n", __func__, ptr);
+
+	if (kmemleak_enabled && ptr && !IS_ERR(ptr))
+		paint_ptr((unsigned long)ptr, min_count, 0);
+}
+EXPORT_SYMBOL(kmemleak_unignore);
+
 /**
  * kmemleak_scan_area - limit the range to be scanned in an allocated object
  * @ptr:	pointer to beginning or inside the object. This also
----------------------8<---------------------------------

-- 
Catalin


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
