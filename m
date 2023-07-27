Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8EF76446A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 05:35:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOrmF-0003jp-I5;
	Thu, 27 Jul 2023 03:34:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOrmD-0003jj-RC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 03:34:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pSHiqW/1Kwa6XMfrutppYGKtzk0jA+6GZMwxRhGaywI=; b=Q0KJGRLc9KjWqbdzAtgT9iqLnx
 li0IWaywV6iSL1/LG0hlDbYW2HJnKS3LRs9Xn9S683itIxDUAefjHpNcRMbCl/jzOw8r+e+zfPKjW
 2QywYqpNeN/Ti/GmmMQkPt4Lzo9BIZB2rBbDNR5/OvXorra8frRYepc2Mm6eTl7/Ln60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pSHiqW/1Kwa6XMfrutppYGKtzk0jA+6GZMwxRhGaywI=; b=eokJXJYZ72zeoBzaqggI1oOxU1
 FDiXQ5KoRnI0zt3/zWJrtPiUqKl4anHx1jMrsAZ3zP599bpK1R0az9nOgqiLBSZ5Rf5OBwAxnDqsm
 4/DO70NB0owUyel6w13sCnnCSveQTXiYiHqAcNyBqx5cI6B12epzbScC9b2kumSmIZuc=;
Received: from mail-pf1-f171.google.com ([209.85.210.171])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOrmA-0049Ie-GC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 03:34:58 +0000
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-686f6231bdeso51612b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 20:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690428886; x=1691033686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pSHiqW/1Kwa6XMfrutppYGKtzk0jA+6GZMwxRhGaywI=;
 b=JH3Gdn8erluTpD0SiBv0fHlvH29QoJbVthZHImXx40T/IvgK0JIjZ0GSYiuzzLmgEA
 bHXNFFpOY9uD+vNkdeoyqNVINpCZUHYDiHMEBDkcaaYiJnpqdxqxP9HCH+uCZSOxVPaX
 a40KLwmD/5OmsTBlZF8d2TLCkDFfaCI3tBilLI9wA3S9O/RNu5Wh5IyCFOIuf9bbZc9M
 BojY8O58Av3dHh2cjAZwQFUo45GIDCrR2qRfQCljzavnidON0gNgsmWW0OgyxUqV3yLa
 +g0Rro6R0vH8urzZTF9hLw+CTeEMI8A36Bu5e/fFgdet0UR9Esy2HUMsL8V+5OEcbFBS
 k6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690428886; x=1691033686;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pSHiqW/1Kwa6XMfrutppYGKtzk0jA+6GZMwxRhGaywI=;
 b=LDfNa5M2VWAdD8D+ADq1AKeGHrgjJ3MWTkZIU6j9katRbh7ixX5RNVfMU9f3zna8S4
 67M6d6j3HKg8RRakoZzpVfcEreVuSgzo3XnDfTU5xf9PRIot4ZADtonckyfJh15Sg937
 wVvUrhTutuZKGroepOioU7SQhxHwMU6FJ4M2tCvXJdXkZ72s5IDGqvTDV7W7CIdBs8nL
 AEEPUD0cQq+e8H/XdEE+dnyifiGwMBGvpZCRa5iXGyn86TD2R81zRaFdEWj7OAO7Yvko
 BrjrisKdvG4UVDul10raFFj2M+kVhjwJPR82B44njV7kJM1ligQJo/dY6rN4nBez8PWw
 CnKg==
X-Gm-Message-State: ABy/qLbJKWvE6QjXdee9vUihrS8QFHT8nYXv2ofBPPdlZ/Hnj5q+2412
 iJIdG0c4G5ErkiCShbdvofPpWg==
X-Google-Smtp-Source: APBJJlGnfHXNUKtpZ8goterp0kPe1+GeF2c87BsTqhWXyrNp01VQ9DDS/+17IDHKN7LAqAttouOeag==
X-Received: by 2002:a05:6a21:339b:b0:137:4fd0:e2e6 with SMTP id
 yy27-20020a056a21339b00b001374fd0e2e6mr5017607pzb.6.1690428886364; 
 Wed, 26 Jul 2023 20:34:46 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 z25-20020aa791d9000000b006828ee9fa69sm328803pfa.206.2023.07.26.20.34.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 20:34:46 -0700 (PDT)
Message-ID: <c942e424-276d-4df7-4917-d61063ab8502@bytedance.com>
Date: Thu, 27 Jul 2023 11:34:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-45-zhengqi.arch@bytedance.com>
 <ZMDUkoIXUlTkCSYL@dread.disaster.area>
 <19ad6d06-8a14-6102-5eae-2134dc2c5061@bytedance.com>
 <ZMGnthZAh48JF+eV@dread.disaster.area>
In-Reply-To: <ZMGnthZAh48JF+eV@dread.disaster.area>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Dave, On 2023/7/27 07:09, Dave Chinner wrote: > On Wed,
 Jul 26, 2023 at 05:14:09PM +0800, Qi Zheng wrote: >> On 2023/7/26 16:08,
 Dave Chinner wrote: >>> On Mon, Jul 24, 2023 at 05:43:51PM +0800, Qi Zheng
 wr [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.171 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qOrmA-0049Ie-GC
Subject: Re: [f2fs-dev] [PATCH v2 44/47] mm: shrinker: make global slab
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
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
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

On 2023/7/27 07:09, Dave Chinner wrote:
> On Wed, Jul 26, 2023 at 05:14:09PM +0800, Qi Zheng wrote:
>> On 2023/7/26 16:08, Dave Chinner wrote:
>>> On Mon, Jul 24, 2023 at 05:43:51PM +0800, Qi Zheng wrote:
>>>> @@ -122,6 +126,13 @@ void shrinker_free_non_registered(struct shrinker *shrinker);
>>>>    void shrinker_register(struct shrinker *shrinker);
>>>>    void shrinker_unregister(struct shrinker *shrinker);
>>>> +static inline bool shrinker_try_get(struct shrinker *shrinker)
>>>> +{
>>>> +	return READ_ONCE(shrinker->registered) &&
>>>> +	       refcount_inc_not_zero(&shrinker->refcount);
>>>> +}
>>>
>>> Why do we care about shrinker->registered here? If we don't set
>>> the refcount to 1 until we have fully initialised everything, then
>>> the shrinker code can key entirely off the reference count and
>>> none of the lookup code needs to care about whether the shrinker is
>>> registered or not.
>>
>> The purpose of checking shrinker->registered here is to stop running
>> shrinker after calling shrinker_free(), which can prevent the following
>> situations from happening:
>>
>> CPU 0                 CPU 1
>>
>> shrinker_try_get()
>>
>>                         shrinker_try_get()
>>
>> shrinker_put()
>> shrinker_try_get()
>>                         shrinker_put()
> 
> I don't see any race here? What is wrong with having multiple active
> users at once?

Maybe I'm overthinking. What I think is that if there are multiple users
at once, it may cause the above-mentioned livelock, which will cause
shrinker_free() to wait for a long time. But this probability should be
very low.

> 
>>>
>>> This should use a completion, then it is always safe under
>>> rcu_read_lock().  This also gets rid of the shrinker_lock spin lock,
>>> which only exists because we can't take a blocking lock under
>>> rcu_read_lock(). i.e:
>>>
>>>
>>> void shrinker_put(struct shrinker *shrinker)
>>> {
>>> 	if (refcount_dec_and_test(&shrinker->refcount))
>>> 		complete(&shrinker->done);
>>> }
>>>
>>> void shrinker_free()
>>> {
>>> 	.....
>>> 	refcount_dec(&shrinker->refcount);
>>
>> I guess what you mean is shrinker_put(), because here may be the last
>> refcount.
> 
> Yes, I did.
> 
>>> 	wait_for_completion(&shrinker->done);
>>> 	/*
>>> 	 * lookups on the shrinker will now all fail as refcount has
>>> 	 * fallen to zero. We can now remove it from the lists and
>>> 	 * free it.
>>> 	 */
>>> 	down_write(shrinker_rwsem);
>>> 	list_del_rcu(&shrinker->list);
>>> 	up_write(&shrinker_rwsem);
>>> 	call_rcu(shrinker->rcu_head, shrinker_free_rcu_cb);
>>> }
>>>
>>> ....
>>>
>>>> @@ -686,11 +711,14 @@ EXPORT_SYMBOL(shrinker_free_non_registered);
>>>>    void shrinker_register(struct shrinker *shrinker)
>>>>    {
>>>> -	down_write(&shrinker_rwsem);
>>>> -	list_add_tail(&shrinker->list, &shrinker_list);
>>>> -	shrinker->flags |= SHRINKER_REGISTERED;
>>>> +	refcount_set(&shrinker->refcount, 1);
>>>> +
>>>> +	spin_lock(&shrinker_lock);
>>>> +	list_add_tail_rcu(&shrinker->list, &shrinker_list);
>>>> +	spin_unlock(&shrinker_lock);
>>>> +
>>>>    	shrinker_debugfs_add(shrinker);
>>>> -	up_write(&shrinker_rwsem);
>>>> +	WRITE_ONCE(shrinker->registered, true);
>>>>    }
>>>>    EXPORT_SYMBOL(shrinker_register);
>>>
>>> This just looks wrong - you are trying to use WRITE_ONCE() as a
>>> release barrier to indicate that the shrinker is now set up fully.
>>> That's not necessary - the refcount is an atomic and along with the
>>> rcu locks they should provides all the barriers we need. i.e.
>>
>> The reason I used WRITE_ONCE() here is because the shrinker->registered
>> will be read and written concurrently (read in shrinker_try_get() and
>> written in shrinker_free()), which is why I added shrinker::registered
>> field instead of using SHRINKER_REGISTERED flag (this can reduce the
>> addition of WRITE_ONCE()/READ_ONCE()).
> 
> Using WRITE_ONCE/READ_ONCE doesn't provide memory barriers needed to
> use the field like this. You need release/acquire memory ordering
> here. i.e. smp_store_release()/smp_load_acquire().
> 
> As it is, the refcount_inc_not_zero() provides a control dependency,
> as documented in include/linux/refcount.h, refcount_dec_and_test()
> provides release memory ordering. The only thing I think we may need
> is a write barrier before refcount_set(), such that if
> refcount_inc_not_zero() sees a non-zero value, it is guaranteed to
> see an initialised structure...
> 
> i.e. refcounts provide all the existence and initialisation
> guarantees. Hence I don't see the need to use shrinker->registered
> like this and it can remain a bit flag protected by the
> shrinker_rwsem().

Ah, I didn't consider the memory order with refcount when I added
WRITE_ONCE/READ_ONCE to shrinker->registered, just didn't want KCSAN
to complain (there are multiple visitors at the same time, one of which
is a writer).

And the livelock case mentioned above is indeed unlikely to happen, so
I will delete shrinker->registered in the next version.

> 
> 
>>> void shrinker_register(struct shrinker *shrinker)
>>> {
>>> 	down_write(&shrinker_rwsem);
>>> 	list_add_tail_rcu(&shrinker->list, &shrinker_list);
>>> 	shrinker->flags |= SHRINKER_REGISTERED;
>>> 	shrinker_debugfs_add(shrinker);
>>> 	up_write(&shrinker_rwsem);
>>>
>>> 	/*
>>> 	 * now the shrinker is fully set up, take the first
>>> 	 * reference to it to indicate that lookup operations are
>>> 	 * now allowed to use it via shrinker_try_get().
>>> 	 */
>>> 	refcount_set(&shrinker->refcount, 1);
>>> }
>>>
>>>> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
>>>> index f1becfd45853..c5573066adbf 100644
>>>> --- a/mm/shrinker_debug.c
>>>> +++ b/mm/shrinker_debug.c
>>>> @@ -5,6 +5,7 @@
>>>>    #include <linux/seq_file.h>
>>>>    #include <linux/shrinker.h>
>>>>    #include <linux/memcontrol.h>
>>>> +#include <linux/rculist.h>
>>>>    /* defined in vmscan.c */
>>>>    extern struct rw_semaphore shrinker_rwsem;
>>>> @@ -161,17 +162,21 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>>>>    {
>>>>    	struct dentry *entry;
>>>>    	char buf[128];
>>>> -	int id;
>>>> -
>>>> -	lockdep_assert_held(&shrinker_rwsem);
>>>> +	int id, ret = 0;
>>>>    	/* debugfs isn't initialized yet, add debugfs entries later. */
>>>>    	if (!shrinker_debugfs_root)
>>>>    		return 0;
>>>> +	down_write(&shrinker_rwsem);
>>>> +	if (shrinker->debugfs_entry)
>>>> +		goto fail;
>>>> +
>>>>    	id = ida_alloc(&shrinker_debugfs_ida, GFP_KERNEL);
>>>> -	if (id < 0)
>>>> -		return id;
>>>> +	if (id < 0) {
>>>> +		ret = id;
>>>> +		goto fail;
>>>> +	}
>>>>    	shrinker->debugfs_id = id;
>>>>    	snprintf(buf, sizeof(buf), "%s-%d", shrinker->name, id);
>>>> @@ -180,7 +185,8 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>>>>    	entry = debugfs_create_dir(buf, shrinker_debugfs_root);
>>>>    	if (IS_ERR(entry)) {
>>>>    		ida_free(&shrinker_debugfs_ida, id);
>>>> -		return PTR_ERR(entry);
>>>> +		ret = PTR_ERR(entry);
>>>> +		goto fail;
>>>>    	}
>>>>    	shrinker->debugfs_entry = entry;
>>>> @@ -188,7 +194,10 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>>>>    			    &shrinker_debugfs_count_fops);
>>>>    	debugfs_create_file("scan", 0220, entry, shrinker,
>>>>    			    &shrinker_debugfs_scan_fops);
>>>> -	return 0;
>>>> +
>>>> +fail:
>>>> +	up_write(&shrinker_rwsem);
>>>> +	return ret;
>>>>    }
>>>>    int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
>>>> @@ -243,6 +252,11 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
>>>>    	shrinker->name = NULL;
>>>>    	*debugfs_id = entry ? shrinker->debugfs_id : -1;
>>>> +	/*
>>>> +	 * Ensure that shrinker->registered has been set to false before
>>>> +	 * shrinker->debugfs_entry is set to NULL.
>>>> +	 */
>>>> +	smp_wmb();
>>>>    	shrinker->debugfs_entry = NULL;
>>>>    	return entry;
>>>> @@ -266,14 +280,26 @@ static int __init shrinker_debugfs_init(void)
>>>>    	shrinker_debugfs_root = dentry;
>>>>    	/* Create debugfs entries for shrinkers registered at boot */
>>>> -	down_write(&shrinker_rwsem);
>>>> -	list_for_each_entry(shrinker, &shrinker_list, list)
>>>> +	rcu_read_lock();
>>>> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>>>> +		if (!shrinker_try_get(shrinker))
>>>> +			continue;
>>>> +		rcu_read_unlock();
>>>> +
>>>>    		if (!shrinker->debugfs_entry) {
>>>> -			ret = shrinker_debugfs_add(shrinker);
>>>> -			if (ret)
>>>> -				break;
>>>> +			/* Paired with smp_wmb() in shrinker_debugfs_detach() */
>>>> +			smp_rmb();
>>>> +			if (READ_ONCE(shrinker->registered))
>>>> +				ret = shrinker_debugfs_add(shrinker);
>>>>    		}
>>>> -	up_write(&shrinker_rwsem);
>>>> +
>>>> +		rcu_read_lock();
>>>> +		shrinker_put(shrinker);
>>>> +
>>>> +		if (ret)
>>>> +			break;
>>>> +	}
>>>> +	rcu_read_unlock();
>>>>    	return ret;
>>>>    }
>>>
>>> And all this churn and complexity can go away because the
>>> shrinker_rwsem is still used to protect shrinker_register()
>>> entirely....
>>
>> My consideration is that during this process, there may be a
>> driver probe failure and then shrinker_free() is called (the
>> shrinker_debugfs_init() is called in late_initcall stage). In
>> this case, we need to use RCU+refcount to ensure that the shrinker
>> is not freed.
> 
> Yeah, you're trying to work around the lack of a
> wait_for_completion() call in shrinker_free().
> 
> With that, this doesn't need RCU at all, and the iteration can be
> done fully under the shrinker_rwsem() safely and so none of this
> code needs to change.

Oh, indeed, here does not need to be changed.

Thanks,
Qi

> 
> Cheers,
> 
> Dave.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
