Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C84560AE39
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 16:52:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1omyou-00037M-EF;
	Mon, 24 Oct 2022 14:52:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1omyom-00037F-MY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 14:52:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=taryaQqhDU8DO2nlD8gYIfcALNfWHO/93rLVKCPhD8g=; b=cX2tqGqc7lEV40Or3PdSlMqUpv
 7PyqQzg9sp2MXThmgipasFooHMXpwzRFBzRrXhHlnGbKco+cKQhkxZ8e6bEIBxyRh+KYib5mMv7eK
 g3Tt5LhYKrLh5RmwG1IrQoYhViHzKro55YhqYSH9c6bZoA4qlUfnJdSAsuEauRy6PT3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=taryaQqhDU8DO2nlD8gYIfcALNfWHO/93rLVKCPhD8g=; b=b1POzU4vLbvQq7leatsUAV3GDI
 uFdzFb7jH1FgpImREz51xlhJdD7qhs024qrKZzXDEDbh6/JPg105wRwUFJFA2CTEXDFEQ690ElPl7
 l0PBVSmhTQIUb/cEPlr+qN7OkSpcFq2PBN9Z9t8XdBk9DMW1vg06sMZpiDeKDilTF9L4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1omyoi-00FqFu-PV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 14:52:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62D49B816A2;
 Mon, 24 Oct 2022 14:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EFBC433C1;
 Mon, 24 Oct 2022 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666623153;
 bh=iIf7CBp4DRtS4RK5w27tn1+7LfTAdJA8NimWQF9sSvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0R1tizG1JTD1VZMfei9eZUwBceJMo27F3IPhrwxgizVbdIXR/VebztKIjUAfm+TJ2
 cpiPAbSdylVk4YR/PmDNZIIZzoMbWnp7XnOykqA3Po0XqNtgjvxOXuMeqXyiEX1VR+
 i+cMHZA9GYInHS3HEvmT7UEBSkL+YkXi0BemMqzI=
Date: Mon, 24 Oct 2022 16:53:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <Y1am4mjS+obAbUTJ@kroah.com>
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <Y1aYuLmlXBRvMP1Z@kroah.com>
 <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Oct 24, 2022 at 10:39:44PM +0800,
 Yang Yingliang wrote:
 > > On 2022/10/24 21:52, Greg KH wrote: > > On Mon, Oct 24, 2022 at 08:19:10PM
 +0800, Yang Yingliang wrote: > > > Inject fault while loa [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1omyoi-00FqFu-PV
Subject: Re: [f2fs-dev] [PATCH v2] kset: fix memory leak when
 kset_register() returns error
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
Cc: rafael@kernel.org, qemu-devel@nongnu.org, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, richard@nod.at,
 mark@fasheh.com, mst@redhat.com, amd-gfx@lists.freedesktop.org,
 luben.tuikov@amd.com, hsiangkao@linux.alibaba.com, somlo@cmu.edu,
 jlbec@evilplan.org, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, alexander.deucher@amd.com,
 akpm@linux-foundation.org, linux-erofs@lists.ozlabs.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Oct 24, 2022 at 10:39:44PM +0800, Yang Yingliang wrote:
> 
> On 2022/10/24 21:52, Greg KH wrote:
> > On Mon, Oct 24, 2022 at 08:19:10PM +0800, Yang Yingliang wrote:
> > > Inject fault while loading module, kset_register() may fail.
> > > If it fails, the name allocated by kobject_set_name() which
> > > is called before kset_register() is leaked, because refcount
> > > of kobject is hold in kset_init().
> > > 
> > > As a kset may be embedded in a larger structure which needs
> > > be freed in release() function or error path in callers, we
> > > can not call kset_put() in kset_register(), or it will cause
> > > double free, so just call kfree_const() to free the name and
> > > set it to NULL.
> > > 
> > > With this fix, the callers don't need to care about the name
> > > freeing and call an extra kset_put() if kset_register() fails.
> > > 
> > > Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > > v1 -> v2:
> > >    Free name inside of kset_register() instead of calling kset_put()
> > >    in drivers.
> > > ---
> > >   lib/kobject.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/kobject.c b/lib/kobject.c
> > > index a0b2dbfcfa23..3409a89c81e5 100644
> > > --- a/lib/kobject.c
> > > +++ b/lib/kobject.c
> > > @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
> > >   /**
> > >    * kset_register() - Initialize and add a kset.
> > >    * @k: kset.
> > > + *
> > > + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> > > + * which is called before kset_register() in caller need be freed.
> > This comment doesn't make any sense anymore.  No caller needs to worry
> > about this, right?
> With this fix, the name is freed inside of kset_register(), it can not be
> accessed,

Agreed.

> if it allocated dynamically, but callers don't know this if no comment here,
> they may use it in error path (something like to print error message with
> it),
> so how about comment like this to tell callers not to use the name:
> 
> NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> is freed, it can not be used any more.

Sure, that's a better way to word it.

> > >    */
> > >   int kset_register(struct kset *k)
> > >   {
> > > @@ -844,8 +847,11 @@ int kset_register(struct kset *k)
> > >   	kset_init(k);
> > >   	err = kobject_add_internal(&k->kobj);
> > > -	if (err)
> > > +	if (err) {
> > > +		kfree_const(k->kobj.name);
> > > +		k->kobj.name = NULL;
> > Why are you setting the name here to NULL?
> I set it to NULL to avoid accessing bad pointer in callers,
> if callers use it in error path, current callers won't use this
> name pointer in error path, so we can remove this assignment?

Ah, I didn't think about using it on error paths.  Ideally that would
never happen, but that's good to set just to make it obvious.  How about
adding a small comment here saying why you are setting it so we all
remember it in 5 years when we look at the code again.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
