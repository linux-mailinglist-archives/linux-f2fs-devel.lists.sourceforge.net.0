Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7C7738BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Aug 2023 09:50:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qTHUK-0001tJ-8Q;
	Tue, 08 Aug 2023 07:50:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qTHUI-0001tD-VD
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 07:50:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=; b=dyj8co7faxf9SrVAHUW5RUnwTg
 oosEMgnb6oE0RhrrOIQ5S1IQuhTJQ15M8h1Tckujljt8mHQsn/AYwTMYsDfL9fJjHwy/9krFTUCTE
 Hde0huWG75qNdK3HGfEi0ExEgDpf2aKvCBc7MmK1xJwSie3r6H26N0gI7C3OWF+G3GP4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=; b=CNFH20DwLV5kDDWFUA8Y2FTIqL
 GB7F67qB47QRIGUcdrciJdsaa6lj+BzUWlfgmTCDHqUW3Kgz6NN/G/r4Dqza54c3GG+DUbUddyAa8
 xLBlWktFeLjDKRlaU5bIJjFxtYxq8Pe3iXmpEjI/e0oYCukLpD27S/Qd8fzcv/B5R9X4=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qTHUD-00GmA7-W6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Aug 2023 07:50:43 +0000
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-55b78bf0423so522683a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 08 Aug 2023 00:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691481032; x=1692085832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
 b=FcXFQj7o5xQr1tbRw7Pn9UcrCi1B232+uajLTiNwX9TdfSjMFaRRVdHzMiOaxlryr4
 TqsRZGIMtiNm6ZippcajS5s8BFNszaSa/g6yFRgc1b4Nrb+clf9RoWeRHJwEtReG4gDh
 LBwyybjoJjy6Q47GUlBU0hOxHJ5B5n+H+unsOBMRFGW3IeVtuYALwNVCTH0vLIY9qjFM
 CyLNGOebqxclIqP3q4eqEvOWKbqhuuoRiG1QYUPJbHFervGiVpOZhfBMii4BWNV8TQee
 jZz6YmXfb9rl1Oy5qXM+JWmVZktQ1qA2f5FKoSylWcG/GIFy7RhDcwYEdv8PeGx8L8zA
 uA1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691481032; x=1692085832;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wpg6aIffbYjICJhycB3Bph3fxU0UaKYZ32RPKTrhmtc=;
 b=AlXVHZFVuI3ED9T9N3wONKVOfMB0dYERs2EbuxynabPG+UI97itr8uP6NaTbtjs8H/
 IwCnr935x19+W7JrL022LVdYJVlEjhr6ND9NzHRNaOFi7GMK1dw/tk3amgXd8Ti0wpKQ
 rtDeB66Cq97WHMHszLUArdbuZpElqrvvWd3AU7uPw6os8Ky1gX3xXYodKDwqMclxyPwB
 9MpHVC0Xgns3KUsV/cHckX5KkN/yO46dI+5opEdJM2lCYtNOjVutpihmwVP9v4jFFXQa
 KS7BSVlaffckDgH8mv7MBHGhkLm/sL8pXTIkq0fNb1yp+RNTqVU9ib7A2jYlHSUzJ57D
 rxvQ==
X-Gm-Message-State: ABy/qLabCfeYe97hd/YpZKSbpZXSJCVljfPwfkjqJ9xv695vB9cnAlAL
 KXizSjck+FEhUd6vTQ/p5Ydtwd18XCHpfAjqW7s=
X-Google-Smtp-Source: APBJJlEd8UgUmVjTGODajLkItGQ9rG+lZy4ypLT00ATvxhzy6MYHUWJPNACQWVHeXI8Weqa+eylbDA==
X-Received: by 2002:a17:90a:6c97:b0:263:730b:f568 with SMTP id
 y23-20020a17090a6c9700b00263730bf568mr25207579pjj.3.1691481032358; 
 Tue, 08 Aug 2023 00:50:32 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a17090a410400b00263154aab24sm7244870pjf.57.2023.08.08.00.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Aug 2023 00:50:31 -0700 (PDT)
Message-ID: <5757e341-b261-14de-e052-46606d530460@bytedance.com>
Date: Tue, 8 Aug 2023 15:50:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-47-zhengqi.arch@bytedance.com>
 <ZNGr+1orhHaBORJG@dread.disaster.area>
In-Reply-To: <ZNGr+1orhHaBORJG@dread.disaster.area>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Dave, On 2023/8/8 10:44, Dave Chinner wrote: > On Mon,
 Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote: >> Like global slab shrink, 
 this commit also uses refcount+RCU method to make >> memcg slab shrink lo
 [...] Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qTHUD-00GmA7-W6
Subject: Re: [f2fs-dev] [PATCH v4 46/48] mm: shrinker: make memcg slab
 shrink lockless
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 cel@kernel.org, x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 simon.horman@corigine.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, paulmck@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-nfs@vger.kernel.org, rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
 dlemoal@kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Dave,

On 2023/8/8 10:44, Dave Chinner wrote:
> On Mon, Aug 07, 2023 at 07:09:34PM +0800, Qi Zheng wrote:
>> Like global slab shrink, this commit also uses refcount+RCU method to make
>> memcg slab shrink lockless.
> 
> This patch does random code cleanups amongst the actual RCU changes.
> Can you please move the cleanups to a spearate patch to reduce the
> noise in this one?

Sure, will do.

> 
>> diff --git a/mm/shrinker.c b/mm/shrinker.c
>> index d318f5621862..fee6f62904fb 100644
>> --- a/mm/shrinker.c
>> +++ b/mm/shrinker.c
>> @@ -107,6 +107,12 @@ static struct shrinker_info *shrinker_info_protected(struct mem_cgroup *memcg,
>>   					 lockdep_is_held(&shrinker_rwsem));
>>   }
>>   
>> +static struct shrinker_info *shrinker_info_rcu(struct mem_cgroup *memcg,
>> +					       int nid)
>> +{
>> +	return rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +}
> 
> This helper doesn't add value. It doesn't tell me that
> rcu_read_lock() needs to be held when it is called, for one....

How about adding a comment or an assertion here?

> 
>>   static int expand_one_shrinker_info(struct mem_cgroup *memcg, int new_size,
>>   				    int old_size, int new_nr_max)
>>   {
>> @@ -198,7 +204,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   		struct shrinker_info_unit *unit;
>>   
>>   		rcu_read_lock();
>> -		info = rcu_dereference(memcg->nodeinfo[nid]->shrinker_info);
>> +		info = shrinker_info_rcu(memcg, nid);
> 
> ... whilst the original code here was obviously correct.
> 
>>   		unit = info->unit[shriner_id_to_index(shrinker_id)];
>>   		if (!WARN_ON_ONCE(shrinker_id >= info->map_nr_max)) {
>>   			/* Pairs with smp mb in shrink_slab() */
>> @@ -211,7 +217,7 @@ void set_shrinker_bit(struct mem_cgroup *memcg, int nid, int shrinker_id)
>>   
>>   static DEFINE_IDR(shrinker_idr);
>>   
>> -static int prealloc_memcg_shrinker(struct shrinker *shrinker)
>> +static int shrinker_memcg_alloc(struct shrinker *shrinker)
> 
> Cleanups in a separate patch.

OK.

> 
>> @@ -253,10 +258,15 @@ static long xchg_nr_deferred_memcg(int nid, struct shrinker *shrinker,
>>   {
>>   	struct shrinker_info *info;
>>   	struct shrinker_info_unit *unit;
>> +	long nr_deferred;
>>   
>> -	info = shrinker_info_protected(memcg, nid);
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	unit = info->unit[shriner_id_to_index(shrinker->id)];
>> -	return atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	nr_deferred = atomic_long_xchg(&unit->nr_deferred[shriner_id_to_offset(shrinker->id)], 0);
>> +	rcu_read_unlock();
>> +
>> +	return nr_deferred;
>>   }
> 
> This adds two rcu_read_lock() sections to every call to
> do_shrink_slab(). It's not at all clear ifrom any of the other code
> that do_shrink_slab() now has internal rcu_read_lock() sections....

The xchg_nr_deferred_memcg() will only be called in shrink_slab_memcg(),
so other code doesn't need to know that information?

> 
>> @@ -464,18 +480,23 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   	if (!mem_cgroup_online(memcg))
>>   		return 0;
>>   
>> -	if (!down_read_trylock(&shrinker_rwsem))
>> -		return 0;
>> -
>> -	info = shrinker_info_protected(memcg, nid);
>> +again:
>> +	rcu_read_lock();
>> +	info = shrinker_info_rcu(memcg, nid);
>>   	if (unlikely(!info))
>>   		goto unlock;
>>   
>> -	for (; index < shriner_id_to_index(info->map_nr_max); index++) {
>> +	if (index < shriner_id_to_index(info->map_nr_max)) {
>>   		struct shrinker_info_unit *unit;
>>   
>>   		unit = info->unit[index];
>>   
>> +		/*
>> +		 * The shrinker_info_unit will not be freed, so we can
>> +		 * safely release the RCU lock here.
>> +		 */
>> +		rcu_read_unlock();
> 
> Why - what guarantees that the shrinker_info_unit exists at this
> point? We hold no reference to it, we hold no reference to any
> shrinker, etc. What provides this existence guarantee?

The shrinker_info_unit is never freed unless the memcg is destroyed.
Here we hold the refcount of this memcg (mem_cgroup_iter() -->
css_tryget()), so the shrinker_info_unit will not be freed.

> 
>> +
>>   		for_each_set_bit(offset, unit->map, SHRINKER_UNIT_BITS) {
>>   			struct shrink_control sc = {
>>   				.gfp_mask = gfp_mask,
>> @@ -485,12 +506,14 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   			struct shrinker *shrinker;
>>   			int shrinker_id = calc_shrinker_id(index, offset);
>>   
>> +			rcu_read_lock();
>>   			shrinker = idr_find(&shrinker_idr, shrinker_id);
>> -			if (unlikely(!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))) {
>> -				if (!shrinker)
>> -					clear_bit(offset, unit->map);
>> +			if (unlikely(!shrinker || !shrinker_try_get(shrinker))) {
>> +				clear_bit(offset, unit->map);
>> +				rcu_read_unlock();
>>   				continue;
>>   			}
>> +			rcu_read_unlock();
>>   
>>   			/* Call non-slab shrinkers even though kmem is disabled */
>>   			if (!memcg_kmem_online() &&
>> @@ -523,15 +546,20 @@ static unsigned long shrink_slab_memcg(gfp_t gfp_mask, int nid,
>>   					set_shrinker_bit(memcg, nid, shrinker_id);
>>   			}
>>   			freed += ret;
>> -
>> -			if (rwsem_is_contended(&shrinker_rwsem)) {
>> -				freed = freed ? : 1;
>> -				goto unlock;
>> -			}
>> +			shrinker_put(shrinker);
> 
> Ok, so why is this safe to call without holding the rcu read lock?
> The global shrinker has to hold the rcu_read_lock() whilst calling
> shrinker_put() to guarantee the validity of the list next pointer,
> but we don't hold off RCU here so what guarantees a racing global
> shrinker walk doesn't trip over this shrinker_put() call dropping
> the refcount to zero and freeing occuring in a different context...

This will not be a problem, even if shrinker::refcount is reduced to
0 here, the racing global shrinker walk already holds the rcu lock.

         shrink_slab            shrink_slab_memcg
         ===========            =================

         rcu_read_lock()
         shrinker_put()
                                shrinker_put()

And in shrink_slab_memcg(), the shrinker is not required to traverse the
next bit in the shrinker_info_unit::map, so there is no need to hold the
rcu lock to ensure the existence of this shrinker.

> 
> 
>> +		/*
>> +		 * We have already exited the read-side of rcu critical section
>> +		 * before calling do_shrink_slab(), the shrinker_info may be
>> +		 * released in expand_one_shrinker_info(), so reacquire the
>> +		 * shrinker_info.
>> +		 */
>> +		index++;
>> +		goto again;
> 
> With that, what makes the use of shrinker_info in
> xchg_nr_deferred_memcg() in do_shrink_slab() coherent and valid?

Holding rcu lock can ensure that the old shrinker_info will not be
freed, and the shrinker_info_unit::nr_deferred can also be indexed from
the old shrinker_info::unit[x], so the updated nr_deferred will not be
lost.

Thanks,
Qi

> 
> -Dave.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
