Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F916071F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 10:19:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olnF5-0000hQ-Ot;
	Fri, 21 Oct 2022 08:18:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1olnF3-0000ga-QP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xBaO0y3ovENdfCH8ef+W4RQJqPyEoL/a6Kwsa84n1W4=; b=OolhhKI/tbYZVBCLVGBsnh8vfO
 hPaAe9v8B0H7b+Pz89Vv36hnAlKchEnMPIclDMo0Cli0w59VRzvAHnju41wD0i4liICK8rsMLnjIU
 p6ioy0zBH37IGa5u1b9+Mz1JTH5j0X+SXN/XsIjVjUNxoiPQGNCYGDpzZfkKAe4g2qC0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xBaO0y3ovENdfCH8ef+W4RQJqPyEoL/a6Kwsa84n1W4=; b=ikPSDdBlaMScCtLZ0RHgzVSpQ6
 2W1xD6wmoDDrdjR+eZparf7U4A/jX9ksCoEKrfJ2GipnToqrokVER+q/ZutYNTwAWPmNgaAstNYF3
 xW8gFoXtIDMJ9vNQKZC0w0o3Q9HPgLt2onvzhqVXdZVOUMTkO5wJ16kZeKTXFRaNYWnI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olnF0-0000cf-JT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B7F2B82B49;
 Fri, 21 Oct 2022 08:18:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C09FC433D7;
 Fri, 21 Oct 2022 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666340313;
 bh=8++5V96CRoT3offEW1sfGPjlBhG5kCvkZ9nTWWOETBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jgzWKnVMDL4jjfh3rpyIZnQ6lzYGvVQFOfB2Sz0ckbK8TSaMML0PB6ejva6LPIpVh
 ec2TKJYGoaFx30SX5W4+m5zVlvfmFnd1+qS08e2EpH9AWzJBI41sDGDR+b9qaC68rY
 UySyAc400Lqb6/UqLIyGB/GHeIBa76ZzCFASzYBo=
Date: Fri, 21 Oct 2022 10:18:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Luben Tuikov <luben.tuikov@amd.com>
Message-ID: <Y1JV1wxf/7ERAMhl@kroah.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com>
 <Y1IwLOUGayjT9p6d@kroah.com>
 <5efd73b0-d634-d34f-3d7a-13d674e40d04@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5efd73b0-d634-d34f-3d7a-13d674e40d04@amd.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Oct 21, 2022 at 03:55:18AM -0400, Luben Tuikov wrote:
 > On 2022-10-21 01:37, Greg KH wrote: > > On Fri, Oct 21, 2022 at 01:29:31AM
 -0400, Luben Tuikov wrote: > >> On 2022-10-20 22:20, Yang Yin [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olnF0-0000cf-JT
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
 Yang Yingliang <yangyingliang@huawei.com>, hsiangkao@linux.alibaba.com,
 somlo@cmu.edu, jlbec@evilplan.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Oct 21, 2022 at 03:55:18AM -0400, Luben Tuikov wrote:
> On 2022-10-21 01:37, Greg KH wrote:
> > On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
> >> On 2022-10-20 22:20, Yang Yingliang wrote:
> >>> The previous discussion link:
> >>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F0db486eb-6927-927e-3629-958f8f211194%40huawei.com%2FT%2F&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7C65b33f087ef245a9f23708dab3264840%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019274318153227%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=1ZoieEob62iU9kI8fvpp20qGut9EeHKIHtCAT01t%2Bz8%3D&amp;reserved=0
> >>
> >> The very first discussion on this was here:
> >>
> >> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg368077.html&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7C65b33f087ef245a9f23708dab3264840%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019274318153227%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=9joWxGLUxZZMvrfkxCR8KbkoXifsqoMK0vGR%2FyEG62w%3D&amp;reserved=0
> >>
> >> Please use this link, and not the that one up there you which quoted above,
> >> and whose commit description is taken verbatim from the this link.
> >>
> >>>
> >>> kset_register() is currently used in some places without calling
> >>> kset_put() in error path, because the callers think it should be
> >>> kset internal thing to do, but the driver core can not know what
> >>> caller doing with that memory at times. The memory could be freed
> >>> both in kset_put() and error path of caller, if it is called in
> >>> kset_register().
> >>
> >> As I explained in the link above, the reason there's
> >> a memory leak is that one cannot call kset_register() without
> >> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
> >> in this case, i.e. kset_register() fails with -EINVAL.
> >>
> >> Thus, the most common usage is something like this:
> >>
> >> 	kobj_set_name(&kset->kobj, format, ...);
> >> 	kset->kobj.kset = parent_kset;
> >> 	kset->kobj.ktype = ktype;
> >> 	res = kset_register(kset);
> >>
> >> So, what is being leaked, is the memory allocated in kobj_set_name(),
> >> by the common idiom shown above. This needs to be mentioned in
> >> the documentation, at least, in case, in the future this is absolved
> >> in kset_register() redesign, etc.
> > 
> > Based on this, can kset_register() just clean up from itself when an
> > error happens?  Ideally that would be the case, as the odds of a kset
> > being embedded in a larger structure is probably slim, but we would have
> > to search the tree to make sure.
> 
> Looking at kset_register(), we can add kset_put() in the error path,
> when kobject_add_internal(&kset->kobj) fails.
> 
> See the attached patch. It needs to be tested with the same error injection
> as Yang has been doing.
> 
> Now, struct kset is being embedded in larger structs--see amdgpu_discovery.c
> starting at line 575. If you're on an AMD system, it gets you the tree
> structure you'll see when you run "tree /sys/class/drm/card0/device/ip_discovery/".
> That shouldn't be a problem though.

Yes, that shouldn't be an issue as the kobject embedded in a kset is
ONLY for that kset itself, the kset structure should not be controling
the lifespan of the object it is embedded in, right?

Note, the use of ksets by a device driver like you are doing here in the
amd driver is BROKEN and will cause problems by userspace tools.  Don't
do that please, just use a single subdirectory for an attribute.  Doing
deeper stuff like this is sure to cause problems and be a headache.

thanks,

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
