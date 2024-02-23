Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E801D861D54
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:16:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdbyN-0004Wd-CR;
	Fri, 23 Feb 2024 20:16:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kent.overstreet@linux.dev>) id 1rdbyM-0004WX-9f
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:16:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=; b=durdlxsc+Sxl0BOGL6SJxoYIHr
 VUFXVe8TND1WsP4ke0o3s5zVNq9tctk509GeU/ANsid7Nf4+f3+4wQlaGjzd50IenK5w/LXLxKD5+
 H3C6sXnBdvz/dFhT8H293OGvcSWnN0zcBYomh+egRh3KP3hpxecrawT1IwtiE9B0oVGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=; b=J54gLHeFldjaGd1hmlSCBQTSKz
 45eEeCuJgb0Re6b6j1ZZJq7zbn15y19jirTzk70PTxz0NSfEF7ENyTjaN4W44TbMM+0isjpnOrmQF
 cGM5s3s9qXeJQsEauQWGoHdhgCiO+Xk+0/vj4l6+Uw82M/uuu/eFFp4B3WHZp0bfj1M8=;
Received: from out-177.mta1.migadu.com ([95.215.58.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdbyL-0001HI-Hc for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Feb 2024 20:16:42 +0000
Date: Fri, 23 Feb 2024 14:50:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1708717865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G9nEEkfFGj8WFYt7yvHDxsoouHxXt+6aC7E5xhimc9A=;
 b=uWxPu15jxbBy5Qv8sUU4/FKz9vhwMVdq24ex7AxwdBDTkpdTty7N4oFt5H+WpItVhn5h2q
 QhDNbk6QMiXNrrlkBl7kMfsoV81d2NhOFvXWC0sVWqoHMtRJN5Tm42Zzvb2Qci9w4QIV6Q
 wpkGE4FwRbb7rZDimmKQkBl02FYhYXk=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223134653.524a5c9e@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Feb 23, 2024 at 01:46:53PM -0500,
 Steven Rostedt wrote:
 > On Fri, 23 Feb 2024 10:30:45 -0800 > Jeff Johnson <quic_jjohnson@quicinc.com>
 wrote: > > > On 2/23/2024 9:56 AM, Steven Rostedt wrote: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rdbyL-0001HI-Hc
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
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, brcm80211@lists.linux.dev,
 ath10k@lists.infradead.org, Julia Lawall <Julia.Lawall@inria.fr>,
 linux-s390@vger.kernel.org, dev@openvswitch.org, linux-cifs@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, io-uring@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, iommu@lists.linux.dev,
 ath11k@lists.infradead.org, linux-media@vger.kernel.org,
 linux-wpan@vger.kernel.org, linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-erofs@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, virtualization@lists.linux.dev,
 linux-block@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, linux-cxl@vger.kernel.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 brcm80211-dev-list.pdl@broadcom.com, Jeff Johnson <quic_jjohnson@quicinc.com>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, ath12k@lists.infradead.org,
 tipc-discussion@lists.sourceforge.net, Masami Hiramatsu <mhiramat@kernel.org>,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
 freedreno@lists.freedesktop.org, linux-nfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 23, 2024 at 01:46:53PM -0500, Steven Rostedt wrote:
> On Fri, 23 Feb 2024 10:30:45 -0800
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
> > On 2/23/2024 9:56 AM, Steven Rostedt wrote:
> > > From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> > > 
> > > [
> > >    This is a treewide change. I will likely re-create this patch again in
> > >    the second week of the merge window of v6.9 and submit it then. Hoping
> > >    to keep the conflicts that it will cause to a minimum.
> > > ]
> > > 
> > > With the rework of how the __string() handles dynamic strings where it
> > > saves off the source string in field in the helper structure[1], the
> > > assignment of that value to the trace event field is stored in the helper
> > > value and does not need to be passed in again.  
> > 
> > Just curious if this could be done piecemeal by first changing the
> > macros to be variadic macros which allows you to ignore the extra
> > argument. The callers could then be modified in their separate trees.
> > And then once all the callers have be merged, the macros could be
> > changed to no longer be variadic.
> 
> I weighed doing that, but I think ripping off the band-aid is a better
> approach. One thing I found is that leaving unused parameters in the macros
> can cause bugs itself. I found one case doing my clean up, where an unused
> parameter in one of the macros was bogus, and when I made it a used
> parameter, it broke the build.
> 
> I think for tree-wide changes, the preferred approach is to do one big
> patch at once. And since this only affects TRACE_EVENT() macros, it
> hopefully would not be too much of a burden (although out of tree users may
> suffer from this, but do we care?)

Agreed on doing it all at once, it'll be way less spam for people to
deal with.

Tangentially related though, what would make me really happy is if we
could create the string with in the TP__fast_assign() section. I have to
have a bunch of annoying wrappers right now because the string length
has to be known when we invoke the tracepoint.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
