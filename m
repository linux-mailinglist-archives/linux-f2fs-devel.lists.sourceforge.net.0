Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEA84CABDD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 18:30:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPSoL-0005QH-Uh; Wed, 02 Mar 2022 17:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <tvrtko.ursulin@linux.intel.com>)
 id 1nPSoK-0005Pi-7Y; Wed, 02 Mar 2022 17:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GNUJTdx/CXqG0F6Gi3f79BsUb8LRzy8a1Ziwnr6YbJk=; b=KknKNmUBUdaDOHYo4OHGR2Xb1a
 KiX6u2R3XbGfdXDLmadYYlkBtYxFOSyMD/Zat9F/ak06q/+7o9zHeyFMiDOFnVSKCL9BuhgSMB0LH
 8onpwwIMlpXSCL832S3xJ0uQdsscUNP8ZK/WjlHAZcf1YPAxQlCJ3m9CSCPMjDwpIrLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GNUJTdx/CXqG0F6Gi3f79BsUb8LRzy8a1Ziwnr6YbJk=; b=MY/9Gg3x3F0ITKh/FlGe4IG+k6
 HMe7O2o3EgiZ8OfZ0kYdie3xCV7yUfxuFi7gV4gyaOmBc55+L2d+pRQBWkFlpz0jkJTLRwQ53VguY
 fR6Zku8RPnlW0gDD7VLQt6EIA5+F/ZVZmXFnqiUIfo0jGifWeoYI/cS5FxnEwWp0E6NI=;
Received: from mga17.intel.com ([192.55.52.151])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPSoE-002mwk-SL; Wed, 02 Mar 2022 17:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646242242; x=1677778242;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=quZJORXDoBJnmtXWeY1UEG0LMErZNbKWG4uR8GxuM8A=;
 b=Tlg52j4L9YqQx7uCl7JYC/5z+1oQykxSHEMjTS1WmNArK1SiTCtTPx5G
 WxL8QVGrRbj3IQzWWMfZHvPYe95mBBotQO4Ysad8rOZtGza0g49a4MOK8
 fJufrPJmQ5AMm4ifJT8bp9vKKB0laxJJe3JxPHT/oKaFRRZpWF212GiWQ
 lQAHl7ALLHPDKH2WvsWycMdr1E9SF4b9+R1hIf6JKRXaxBepfwk58XZr/
 k04VldBhAo3DBpxq/4OrsgzSYjlJ90GgpLfFi5yNh/hMaZFFS5mxIx7q6
 gHb8cT4gDwJlSybANlG0t9Nn02Kmz5im04oeqGQEZQW4DHNzu0li+PtX4 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="234073288"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="234073288"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:15:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="551343768"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:14:53 -0800
Message-ID: <ed52ce3c-0f4a-a1e8-4176-543657d6228d@linux.intel.com>
Date: Wed, 2 Mar 2022 17:14:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 28/02/2022 11:08,
 Jakob Koschel wrote: > When list_for_each_entry()
 completes the iteration over the whole list > without breaking the loop,
 the iterator value will be a bogus pointer > computed ba [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.55.52.151 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPSoE-002mwk-SL
Subject: Re: [f2fs-dev] [Intel-gfx] [PATCH 6/6] treewide: remove check of
 list iterator against head past the loop body
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
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org,
 kvm@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-iio@vger.kernel.org, nouveau@lists.freedesktop.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, dri-devel@lists.freedesktop.org,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, amd-gfx@lists.freedesktop.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev, "Bos,
 H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 intel-wired-lan@lists.osuosl.org, kgdb-bugreport@lists.sourceforge.net,
 bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, dmaengine@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


On 28/02/2022 11:08, Jakob Koschel wrote:
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
> 
> While it is safe to use the pointer to determine if it was computed
> based on the head element, either with list_entry_is_head() or
> &pos->member == head, using the iterator variable after the loop should
> be avoided.
> 
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element.
> 
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

[snip until i915 parts]

>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 14 +++---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++---
>   drivers/gpu/drm/i915/gt/intel_ring.c          | 15 ++++---

[snip]

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 00327b750fbb..80c79028901a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -107,25 +107,27 @@ static void lut_close(struct i915_gem_context *ctx)
>   	radix_tree_for_each_slot(slot, &ctx->handles_vma, &iter, 0) {
>   		struct i915_vma *vma = rcu_dereference_raw(*slot);
>   		struct drm_i915_gem_object *obj = vma->obj;
> -		struct i915_lut_handle *lut;
> +		struct i915_lut_handle *lut = NULL;
> +		struct i915_lut_handle *tmp;
> 
>   		if (!kref_get_unless_zero(&obj->base.refcount))
>   			continue;
> 
>   		spin_lock(&obj->lut_lock);
> -		list_for_each_entry(lut, &obj->lut_list, obj_link) {
> -			if (lut->ctx != ctx)
> +		list_for_each_entry(tmp, &obj->lut_list, obj_link) {
> +			if (tmp->ctx != ctx)
>   				continue;
> 
> -			if (lut->handle != iter.index)
> +			if (tmp->handle != iter.index)
>   				continue;
> 
> -			list_del(&lut->obj_link);
> +			list_del(&tmp->obj_link);
> +			lut = tmp;
>   			break;
>   		}
>   		spin_unlock(&obj->lut_lock);
> 
> -		if (&lut->obj_link != &obj->lut_list) {
> +		if (lut) {
>   			i915_lut_handle_free(lut);
>   			radix_tree_iter_delete(&ctx->handles_vma, &iter, slot);

Looks okay although personally I would have left lut as is for a smaller 
diff and introduced a new local like 'found' or 'unlinked'.

>   			i915_vma_close(vma);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 1736efa43339..fda9e3685ad2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2444,7 +2444,8 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   {
>   	struct intel_ring *ring = ce->ring;
>   	struct intel_timeline *tl = ce->timeline;
> -	struct i915_request *rq;
> +	struct i915_request *rq = NULL;
> +	struct i915_request *tmp;
> 
>   	/*
>   	 * Completely unscientific finger-in-the-air estimates for suitable
> @@ -2460,15 +2461,17 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   	 * claiming our resources, but not so long that the ring completely
>   	 * drains before we can submit our next request.
>   	 */
> -	list_for_each_entry(rq, &tl->requests, link) {
> -		if (rq->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
> -		if (__intel_ring_space(rq->postfix,
> -				       ring->emit, ring->size) > ring->size / 2)
> +		if (__intel_ring_space(tmp->postfix,
> +				       ring->emit, ring->size) > ring->size / 2) {
> +			rq = tmp;
>   			break;
> +		}
>   	}
> -	if (&rq->link == &tl->requests)
> +	if (!rq)
>   		return NULL; /* weird, we will check again later for real */

Alternatively, instead of break could simply do "return 
i915_request_get(rq);" and replace the end of the function after the 
loop with "return NULL;". A bit smaller diff, or at least less "spread 
out" over the function, so might be easier to backport stuff touching 
this area in the future. But looks correct as is.

> 
>   	return i915_request_get(rq);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
> index 2fdd52b62092..4881c4e0c407 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
> @@ -191,24 +191,27 @@ wait_for_space(struct intel_ring *ring,
>   	       struct intel_timeline *tl,
>   	       unsigned int bytes)
>   {
> -	struct i915_request *target;
> +	struct i915_request *target = NULL;
> +	struct i915_request *tmp;
>   	long timeout;
> 
>   	if (intel_ring_update_space(ring) >= bytes)
>   		return 0;
> 
>   	GEM_BUG_ON(list_empty(&tl->requests));
> -	list_for_each_entry(target, &tl->requests, link) {
> -		if (target->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
>   		/* Would completion of this request free enough space? */
> -		if (bytes <= __intel_ring_space(target->postfix,
> -						ring->emit, ring->size))
> +		if (bytes <= __intel_ring_space(tmp->postfix,
> +						ring->emit, ring->size)) {
> +			target = tmp;
>   			break;
> +		}
>   	}
> 
> -	if (GEM_WARN_ON(&target->link == &tl->requests))
> +	if (GEM_WARN_ON(!target))
>   		return -ENOSPC;
> 
>   	timeout = i915_request_wait(target,

Looks okay as well. Less clear here if there is a clean solution to make 
the diff smaller so no suggestions. I mean do I dare mention "goto 
found;" from inside the loop, where the break is, instead of the 
variable renames.. risky.. :) (And ofc "return -ENOSPC" immediately 
after the loop.)

As a summary changes looks okay, up to you if you want to try to make 
the diffs smaller or not. It doesn't matter hugely really, all I have is 
a vague and uncertain "maybe it makes backporting of something, someday 
easier". So for i915 it is good either way.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> # i915 bits only

Regards,

Tvrtko


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
