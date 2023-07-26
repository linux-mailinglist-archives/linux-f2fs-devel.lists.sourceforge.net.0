Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16D76426B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 01:10:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOndo-0004m2-Vv;
	Wed, 26 Jul 2023 23:09:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <david@fromorbit.com>) id 1qOndo-0004ls-15
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 23:09:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bNBWi9BFA7oJZNyI/XnA5H8tHZCJl01gNE0DBxlvZ40=; b=U97YhWS5huqKRKn9Fm1chDdgKB
 Nd+fnxF98p0MNRLTS2qVmTDXPh1sXHWndM4Bykg6DhLFdX92VD2jS8JLSgc7C+FRYczx/1F4CWr8t
 mQjgNef6RInbtHP+1o927POnIpCVGC0/v0h//BMUlvIy4+EUUZGIcTxl18DCPa5iDqTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bNBWi9BFA7oJZNyI/XnA5H8tHZCJl01gNE0DBxlvZ40=; b=P0sdrVPYADhkW/zhnNmSFIN1Bl
 YSkuwkjBOjzSB8o8Wwq7yr1zF3bhp4Tr7PY6cX0/dO4J05AymIuiLUJcHan/gKkj+/Q8EKDrgb+U0
 qHK8HcjDFN00dRDM5UOxIuwJnxqPh2nCDb0OYJ7umnm/081khtesnV70j8Azy2rZ2Evw=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOndg-003rZ9-3y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Jul 2023 23:09:58 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-686e0213c0bso314529b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Jul 2023 16:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1690412986; x=1691017786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bNBWi9BFA7oJZNyI/XnA5H8tHZCJl01gNE0DBxlvZ40=;
 b=Lnuap/X4mLRvumv8rxik6XXAmLQssX2LaTRnfxOwbhhRA6q+4W8DfrIsG7kVikG4Iw
 ozUx9bZZDKNb4aqqrWuoDs7rpphs2fFB4IjiULQPXjflO/XhZA2vc5TzngrkqmMIM5UL
 tCjpn3hCX/GmJvs5MwDi73VFwiTs9hADB2Cru8fy0ICxuL68/fE/7pFEUcb8ihUp2Ey5
 GxMGCc+rwQuZGeGguv2m2EFaBOeJPE6kWVGxSMJPh4gYWl2FbXQzGnA0u5AYkb1ckWFe
 PYG7wUThiNHKJJU/Kftp/PqqvyLMK20NIq4IuXuyA0M1JDxZWj46ZkNyp0CVDzf4FlQ+
 b/TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690412986; x=1691017786;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bNBWi9BFA7oJZNyI/XnA5H8tHZCJl01gNE0DBxlvZ40=;
 b=ghbt1+M5L8kFskxBu0iTHnSzY4uqFcHAUeWNuDUoWItY6JhQFzNVd4an9LdADw3faT
 UBdk0Eq+AdozTrbOwr3C13H/Ea5RcFQQ+iFIzvHd0diwkPA+7b23SNajZXlcwIpy5UG4
 ZoUQw7A8iJt5aI2p/SkKokk1IGZnJZYt6hqWmz1zDKTwZlOznHWsN9p9iI346WuvA2Lh
 8alcWUkQj7P07xOEsBC+AZFUH6SxCpMqLJtwark+RiaYZHmSmih9W6HYYf2SPqYv16wY
 gpeTmTsQXo/Hn/d4I/a07D8B5lgnrKonjb2U7CvZvTaxnYyDFzCp7B1M1xeZZR7LR2/J
 uYjA==
X-Gm-Message-State: ABy/qLYYu0xxbL5SAzD8DaR/g+RjETp+aa2zgkoGXdl44OctkluDCL90
 0qwpm6eKZQM/A1P6hmBHZm42rw==
X-Google-Smtp-Source: APBJJlHUt9d2hTqe2ud94c6lNUCrPn/cPviOHGLjkBp5h1xJnkt7lTpPKllT1sxo0CM9mi2vK7HwDA==
X-Received: by 2002:a17:902:c10c:b0:1b8:b382:f6c3 with SMTP id
 12-20020a170902c10c00b001b8b382f6c3mr2914213pli.13.1690412986476; 
 Wed, 26 Jul 2023 16:09:46 -0700 (PDT)
Received: from dread.disaster.area (pa49-186-119-116.pa.vic.optusnet.com.au.
 [49.186.119.116]) by smtp.gmail.com with ESMTPSA id
 u9-20020a17090341c900b001ac95be5081sm58846ple.307.2023.07.26.16.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 16:09:45 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qOndW-00AvaD-0j;
 Thu, 27 Jul 2023 09:09:42 +1000
Date: Thu, 27 Jul 2023 09:09:42 +1000
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZMGnthZAh48JF+eV@dread.disaster.area>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-45-zhengqi.arch@bytedance.com>
 <ZMDUkoIXUlTkCSYL@dread.disaster.area>
 <19ad6d06-8a14-6102-5eae-2134dc2c5061@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19ad6d06-8a14-6102-5eae-2134dc2c5061@bytedance.com>
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 26, 2023 at 05:14:09PM +0800, Qi Zheng wrote:
 > On 2023/7/26 16:08, Dave Chinner wrote: > > On Mon, Jul 24,
 2023 at 05:43:51PM
 +0800, Qi Zheng wrote: > > > @@ -122,6 +126,13 @@ void shrink [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOndg-003rZ9-3y
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
From: Dave Chinner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Chinner <david@fromorbit.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Jul 26, 2023 at 05:14:09PM +0800, Qi Zheng wrote:
> On 2023/7/26 16:08, Dave Chinner wrote:
> > On Mon, Jul 24, 2023 at 05:43:51PM +0800, Qi Zheng wrote:
> > > @@ -122,6 +126,13 @@ void shrinker_free_non_registered(struct shrinker *shrinker);
> > >   void shrinker_register(struct shrinker *shrinker);
> > >   void shrinker_unregister(struct shrinker *shrinker);
> > > +static inline bool shrinker_try_get(struct shrinker *shrinker)
> > > +{
> > > +	return READ_ONCE(shrinker->registered) &&
> > > +	       refcount_inc_not_zero(&shrinker->refcount);
> > > +}
> > 
> > Why do we care about shrinker->registered here? If we don't set
> > the refcount to 1 until we have fully initialised everything, then
> > the shrinker code can key entirely off the reference count and
> > none of the lookup code needs to care about whether the shrinker is
> > registered or not.
> 
> The purpose of checking shrinker->registered here is to stop running
> shrinker after calling shrinker_free(), which can prevent the following
> situations from happening:
> 
> CPU 0                 CPU 1
> 
> shrinker_try_get()
> 
>                        shrinker_try_get()
> 
> shrinker_put()
> shrinker_try_get()
>                        shrinker_put()

I don't see any race here? What is wrong with having multiple active
users at once?

> > 
> > This should use a completion, then it is always safe under
> > rcu_read_lock().  This also gets rid of the shrinker_lock spin lock,
> > which only exists because we can't take a blocking lock under
> > rcu_read_lock(). i.e:
> > 
> > 
> > void shrinker_put(struct shrinker *shrinker)
> > {
> > 	if (refcount_dec_and_test(&shrinker->refcount))
> > 		complete(&shrinker->done);
> > }
> > 
> > void shrinker_free()
> > {
> > 	.....
> > 	refcount_dec(&shrinker->refcount);
> 
> I guess what you mean is shrinker_put(), because here may be the last
> refcount.

Yes, I did.

> > 	wait_for_completion(&shrinker->done);
> > 	/*
> > 	 * lookups on the shrinker will now all fail as refcount has
> > 	 * fallen to zero. We can now remove it from the lists and
> > 	 * free it.
> > 	 */
> > 	down_write(shrinker_rwsem);
> > 	list_del_rcu(&shrinker->list);
> > 	up_write(&shrinker_rwsem);
> > 	call_rcu(shrinker->rcu_head, shrinker_free_rcu_cb);
> > }
> > 
> > ....
> > 
> > > @@ -686,11 +711,14 @@ EXPORT_SYMBOL(shrinker_free_non_registered);
> > >   void shrinker_register(struct shrinker *shrinker)
> > >   {
> > > -	down_write(&shrinker_rwsem);
> > > -	list_add_tail(&shrinker->list, &shrinker_list);
> > > -	shrinker->flags |= SHRINKER_REGISTERED;
> > > +	refcount_set(&shrinker->refcount, 1);
> > > +
> > > +	spin_lock(&shrinker_lock);
> > > +	list_add_tail_rcu(&shrinker->list, &shrinker_list);
> > > +	spin_unlock(&shrinker_lock);
> > > +
> > >   	shrinker_debugfs_add(shrinker);
> > > -	up_write(&shrinker_rwsem);
> > > +	WRITE_ONCE(shrinker->registered, true);
> > >   }
> > >   EXPORT_SYMBOL(shrinker_register);
> > 
> > This just looks wrong - you are trying to use WRITE_ONCE() as a
> > release barrier to indicate that the shrinker is now set up fully.
> > That's not necessary - the refcount is an atomic and along with the
> > rcu locks they should provides all the barriers we need. i.e.
> 
> The reason I used WRITE_ONCE() here is because the shrinker->registered
> will be read and written concurrently (read in shrinker_try_get() and
> written in shrinker_free()), which is why I added shrinker::registered
> field instead of using SHRINKER_REGISTERED flag (this can reduce the
> addition of WRITE_ONCE()/READ_ONCE()).

Using WRITE_ONCE/READ_ONCE doesn't provide memory barriers needed to
use the field like this. You need release/acquire memory ordering
here. i.e. smp_store_release()/smp_load_acquire().

As it is, the refcount_inc_not_zero() provides a control dependency,
as documented in include/linux/refcount.h, refcount_dec_and_test()
provides release memory ordering. The only thing I think we may need
is a write barrier before refcount_set(), such that if
refcount_inc_not_zero() sees a non-zero value, it is guaranteed to
see an initialised structure...

i.e. refcounts provide all the existence and initialisation
guarantees. Hence I don't see the need to use shrinker->registered
like this and it can remain a bit flag protected by the
shrinker_rwsem().


> > void shrinker_register(struct shrinker *shrinker)
> > {
> > 	down_write(&shrinker_rwsem);
> > 	list_add_tail_rcu(&shrinker->list, &shrinker_list);
> > 	shrinker->flags |= SHRINKER_REGISTERED;
> > 	shrinker_debugfs_add(shrinker);
> > 	up_write(&shrinker_rwsem);
> > 
> > 	/*
> > 	 * now the shrinker is fully set up, take the first
> > 	 * reference to it to indicate that lookup operations are
> > 	 * now allowed to use it via shrinker_try_get().
> > 	 */
> > 	refcount_set(&shrinker->refcount, 1);
> > }
> > 
> > > diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> > > index f1becfd45853..c5573066adbf 100644
> > > --- a/mm/shrinker_debug.c
> > > +++ b/mm/shrinker_debug.c
> > > @@ -5,6 +5,7 @@
> > >   #include <linux/seq_file.h>
> > >   #include <linux/shrinker.h>
> > >   #include <linux/memcontrol.h>
> > > +#include <linux/rculist.h>
> > >   /* defined in vmscan.c */
> > >   extern struct rw_semaphore shrinker_rwsem;
> > > @@ -161,17 +162,21 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
> > >   {
> > >   	struct dentry *entry;
> > >   	char buf[128];
> > > -	int id;
> > > -
> > > -	lockdep_assert_held(&shrinker_rwsem);
> > > +	int id, ret = 0;
> > >   	/* debugfs isn't initialized yet, add debugfs entries later. */
> > >   	if (!shrinker_debugfs_root)
> > >   		return 0;
> > > +	down_write(&shrinker_rwsem);
> > > +	if (shrinker->debugfs_entry)
> > > +		goto fail;
> > > +
> > >   	id = ida_alloc(&shrinker_debugfs_ida, GFP_KERNEL);
> > > -	if (id < 0)
> > > -		return id;
> > > +	if (id < 0) {
> > > +		ret = id;
> > > +		goto fail;
> > > +	}
> > >   	shrinker->debugfs_id = id;
> > >   	snprintf(buf, sizeof(buf), "%s-%d", shrinker->name, id);
> > > @@ -180,7 +185,8 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
> > >   	entry = debugfs_create_dir(buf, shrinker_debugfs_root);
> > >   	if (IS_ERR(entry)) {
> > >   		ida_free(&shrinker_debugfs_ida, id);
> > > -		return PTR_ERR(entry);
> > > +		ret = PTR_ERR(entry);
> > > +		goto fail;
> > >   	}
> > >   	shrinker->debugfs_entry = entry;
> > > @@ -188,7 +194,10 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
> > >   			    &shrinker_debugfs_count_fops);
> > >   	debugfs_create_file("scan", 0220, entry, shrinker,
> > >   			    &shrinker_debugfs_scan_fops);
> > > -	return 0;
> > > +
> > > +fail:
> > > +	up_write(&shrinker_rwsem);
> > > +	return ret;
> > >   }
> > >   int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
> > > @@ -243,6 +252,11 @@ struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
> > >   	shrinker->name = NULL;
> > >   	*debugfs_id = entry ? shrinker->debugfs_id : -1;
> > > +	/*
> > > +	 * Ensure that shrinker->registered has been set to false before
> > > +	 * shrinker->debugfs_entry is set to NULL.
> > > +	 */
> > > +	smp_wmb();
> > >   	shrinker->debugfs_entry = NULL;
> > >   	return entry;
> > > @@ -266,14 +280,26 @@ static int __init shrinker_debugfs_init(void)
> > >   	shrinker_debugfs_root = dentry;
> > >   	/* Create debugfs entries for shrinkers registered at boot */
> > > -	down_write(&shrinker_rwsem);
> > > -	list_for_each_entry(shrinker, &shrinker_list, list)
> > > +	rcu_read_lock();
> > > +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
> > > +		if (!shrinker_try_get(shrinker))
> > > +			continue;
> > > +		rcu_read_unlock();
> > > +
> > >   		if (!shrinker->debugfs_entry) {
> > > -			ret = shrinker_debugfs_add(shrinker);
> > > -			if (ret)
> > > -				break;
> > > +			/* Paired with smp_wmb() in shrinker_debugfs_detach() */
> > > +			smp_rmb();
> > > +			if (READ_ONCE(shrinker->registered))
> > > +				ret = shrinker_debugfs_add(shrinker);
> > >   		}
> > > -	up_write(&shrinker_rwsem);
> > > +
> > > +		rcu_read_lock();
> > > +		shrinker_put(shrinker);
> > > +
> > > +		if (ret)
> > > +			break;
> > > +	}
> > > +	rcu_read_unlock();
> > >   	return ret;
> > >   }
> > 
> > And all this churn and complexity can go away because the
> > shrinker_rwsem is still used to protect shrinker_register()
> > entirely....
> 
> My consideration is that during this process, there may be a
> driver probe failure and then shrinker_free() is called (the
> shrinker_debugfs_init() is called in late_initcall stage). In
> this case, we need to use RCU+refcount to ensure that the shrinker
> is not freed.

Yeah, you're trying to work around the lack of a
wait_for_completion() call in shrinker_free().

With that, this doesn't need RCU at all, and the iteration can be
done fully under the shrinker_rwsem() safely and so none of this
code needs to change.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
