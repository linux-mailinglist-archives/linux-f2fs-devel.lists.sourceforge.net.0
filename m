Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F0A861BFF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 19:45:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdaXu-0006Ja-90;
	Fri, 23 Feb 2024 18:45:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=wkxO=KA=goodmis.org=rostedt@kernel.org>)
 id 1rdaXt-0006JQ-5e; Fri, 23 Feb 2024 18:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8EX5DyLLgT3KvmZlOZYE3EMTr2abrgesZfw6MHEUJYY=; b=WPDm/L8zGjzXV9eYDCba++Yj+f
 xNwI0EmAQwPJkTOJycJK9NF4QWfE8Algn5KAZgq1LOK6kRkT/oB2GPZBzbgftKPBRnQo5kF2AZ4sb
 j9dt3vBGkcUKaGAV+dtYQWcbKUYs05yqrXI03bJKO3A6VVSjnKBJetKtWY6YI/B9eOCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8EX5DyLLgT3KvmZlOZYE3EMTr2abrgesZfw6MHEUJYY=; b=mW74XeINt8L/aR+8ZenTP8wyOn
 glWtEX8WHzT8nA5ObG0lqp4j2iht0i6Qs/MW/phsDlERcjg6QMpYF+4Un5pVTCJnf3OjX4W4Ob2LO
 YgyUMVyq3ja+WIJc5krcLtbsECvxZkZPLkfOlRuV85hBHJOjfhDDOSFl+z9ze9vkqVZI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdaXo-00055m-Nc; Fri, 23 Feb 2024 18:45:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EF93861654;
 Fri, 23 Feb 2024 18:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C3ACC433C7;
 Fri, 23 Feb 2024 18:45:01 +0000 (UTC)
Date: Fri, 23 Feb 2024 13:46:53 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Message-ID: <20240223134653.524a5c9e@gandalf.local.home>
In-Reply-To: <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 23 Feb 2024 10:30:45 -0800 Jeff Johnson <quic_jjohnson@quicinc.com>
 wrote: > On 2/23/2024 9:56 AM, Steven Rostedt wrote: > > From: "Steven Rostedt
 (Google)" <rostedt@goodmis.org> > > > > [ > > This is a treewide change.
 I will likely re-create this patch again in > > the sec [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rdaXo-00055m-Nc
Subject: Re: [f2fs-dev] [FYI][PATCH] tracing/treewide: Remove second
 parameter of __assign_str()
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
Cc: linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org,
 kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 brcm80211@lists.linux.dev, ath10k@lists.infradead.org,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-s390@vger.kernel.org,
 dev@openvswitch.org, linux-cifs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 ath12k@lists.infradead.org, tipc-discussion@lists.sourceforge.net,
 Masami Hiramatsu <mhiramat@kernel.org>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 23 Feb 2024 10:30:45 -0800
Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > 
> > [
> >    This is a treewide change. I will likely re-create this patch again in
> >    the second week of the merge window of v6.9 and submit it then. Hoping
> >    to keep the conflicts that it will cause to a minimum.
> > ]
> > 
> > With the rework of how the __string() handles dynamic strings where it
> > saves off the source string in field in the helper structure[1], the
> > assignment of that value to the trace event field is stored in the helper
> > value and does not need to be passed in again.  
> 
> Just curious if this could be done piecemeal by first changing the
> macros to be variadic macros which allows you to ignore the extra
> argument. The callers could then be modified in their separate trees.
> And then once all the callers have be merged, the macros could be
> changed to no longer be variadic.

I weighed doing that, but I think ripping off the band-aid is a better
approach. One thing I found is that leaving unused parameters in the macros
can cause bugs itself. I found one case doing my clean up, where an unused
parameter in one of the macros was bogus, and when I made it a used
parameter, it broke the build.

I think for tree-wide changes, the preferred approach is to do one big
patch at once. And since this only affects TRACE_EVENT() macros, it
hopefully would not be too much of a burden (although out of tree users may
suffer from this, but do we care?)

Now one thing I could do is to not remove the parameter, but just add:

	WARN_ON_ONCE((src) != __data_offsets->item##_ptr_);

in the __assign_str() macro to make sure that it's still the same that is
assigned. But I'm not sure how useful that is, and still causes burden to
have it. I never really liked the passing of the string in two places to
begin with.

-- Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
