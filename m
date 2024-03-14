Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D720C87C1A9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Mar 2024 17:58:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkoPN-0004ma-Kw;
	Thu, 14 Mar 2024 16:58:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <alison.schofield@intel.com>) id 1rkoPM-0004mR-Tl;
 Thu, 14 Mar 2024 16:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Xthtgc6epJ48b8mPPUX33mNuxBQopUdr8M3EQRllsI=; b=BCQIOV001/KSy/+a91K5O7KHfe
 lQWXVO+Lhl3Fdmfm4DXkrP5RGKpRWt+fpxsQBkdV6p9aTpLatCvFcIc49QNk6PIaCWb6xcSvgf3an
 2rOQTBjO7o+80kfYKrpefx2o0f2i66RkJ3mX9k4R1e6ZxeQIWg9OE7bs/hODSE49hOyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Xthtgc6epJ48b8mPPUX33mNuxBQopUdr8M3EQRllsI=; b=ilZZWupxJqGgkYVrHYPre2Rz5n
 taBUSpmEc5ktPCQzCc+gdbtIF4Idcglf7o46SJ8KTvGEA1IME3CyTRBjKwwu+OLRbt9NrDVv6yPDz
 n11nIdFNSJdjB9ji7d+6cNCacmR4k/axH0/ixnAa3Gtj1BykbSgXnL6BihAp4JhZCH1E=;
Received: from mgamail.intel.com ([198.175.65.10])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rkoP8-0004eO-Se; Thu, 14 Mar 2024 16:58:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710435493; x=1741971493;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fcf8GvnNI2NlxwWa/BLBUBs674hhRLyrkoAa66D2RKo=;
 b=I4FDjxvu8SufGZfpUNtH2100ioCAEo9NCnMxjfUrC+xSX7zQTuRzKFn8
 pVSs1Qm+rexEK8wGwZ1sDrNky27ScoVCfPU4ssOJxj4Iwg404zuHe441h
 NozCDhUhgQBlwKI102VgV2vzk6H6dz+W5Kn4Vlhd/qQMkZG7avnwYNh4K
 EeNeeCC9p+rfSqFSEmO9nEhOMS3X3jRlknor9wHpM0BK/lV/xM4Zp/mv8
 LZwKHCCXbminJk4tEG3Ssb2A7/Y7x8NHahzQbitMKmCw40nTeycStNZQq
 +ulMtpEBC/sj3BcMYoCcxFRYhHEoCK3/dgDvqJnvadiMdn9/AzMCSVWGV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="22731666"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="22731666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:58:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; d="scan'208";a="16952403"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO aschofie-mobl2)
 ([10.209.72.214])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 09:57:59 -0700
Date: Thu, 14 Mar 2024 09:57:57 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <ZfMslbCmCtyEaEWN@aschofie-mobl2>
References: <20240223125634.2888c973@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240223125634.2888c973@gandalf.local.home>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Feb 23, 2024 at 12:56:34PM -0500,
 Steven Rostedt wrote:
 > From: "Steven Rostedt (Google)" <rostedt@goodmis.org> > > [ > This is a
 treewide change. I will likely re-create this patch again in > [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [198.175.65.10 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkoP8-0004eO-Se
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

On Fri, Feb 23, 2024 at 12:56:34PM -0500, Steven Rostedt wrote:
> From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
> 
> [
>    This is a treewide change. I will likely re-create this patch again in
>    the second week of the merge window of v6.9 and submit it then. Hoping
>    to keep the conflicts that it will cause to a minimum.
> ]
> 
> With the rework of how the __string() handles dynamic strings where it
> saves off the source string in field in the helper structure[1], the
> assignment of that value to the trace event field is stored in the helper
> value and does not need to be passed in again.
> 
> This means that with:
> 
>   __string(field, mystring)
> 
> Which use to be assigned with __assign_str(field, mystring), no longer
> needs the second parameter and it is unused. With this, __assign_str()
> will now only get a single parameter.
> 
> There's over 700 users of __assign_str() and because coccinelle does not
> handle the TRACE_EVENT() macro I ended up using the following sed script:
> 
>   git grep -l __assign_str | while read a ; do
>       sed -e 's/\(__assign_str([^,]*[^ ,]\) *,[^;]*/\1)/' $a > /tmp/test-file;
>       mv /tmp/test-file $a;
>   done
> 
> I then searched for __assign_str() that did not end with ';' as those
> were multi line assignments that the sed script above would fail to catch.
> 
> Note, the same updates will need to be done for:
> 
>   __assign_str_len()
>   __assign_rel_str()
>   __assign_rel_str_len()
>   __assign_bitmask()
>   __assign_rel_bitmask()
>   __assign_cpumask()
>   __assign_rel_cpumask()
> 
> [1] https://lore.kernel.org/linux-trace-kernel/20240222211442.634192653@goodmis.org/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/arm64/kernel/trace-events-emulation.h    |   2 +-
>  arch/powerpc/include/asm/trace.h              |   4 +-
>  arch/x86/kvm/trace.h                          |   2 +-
>  drivers/base/regmap/trace.h                   |  18 +--
>  drivers/base/trace.h                          |   2 +-
>  drivers/block/rnbd/rnbd-srv-trace.h           |  12 +-
>  drivers/cxl/core/trace.h                      |  24 ++--

snip to CXL


> diff --git a/drivers/cxl/core/trace.h b/drivers/cxl/core/trace.h
> index bdf117a33744..07ba4e033347 100644
> --- a/drivers/cxl/core/trace.h
> +++ b/drivers/cxl/core/trace.h

snip to poison

> @@ -668,8 +668,8 @@ TRACE_EVENT(cxl_poison,
>  	    ),
>  
>  	TP_fast_assign(
> -		__assign_str(memdev, dev_name(&cxlmd->dev));
> -		__assign_str(host, dev_name(cxlmd->dev.parent));
> +		__assign_str(memdev);
> +		__assign_str(host);

I think I get that the above changes work because the TP_STRUCT__entry for
these did:
	__string(memdev, dev_name(&cxlmd->dev))
	__string(host, dev_name(cxlmd->dev.parent))

>  		__entry->serial = cxlmd->cxlds->serial;
>  		__entry->overflow_ts = cxl_poison_overflow(flags, overflow_ts);
>  		__entry->dpa = cxl_poison_record_dpa(record);
> @@ -678,12 +678,12 @@ TRACE_EVENT(cxl_poison,
>  		__entry->trace_type = trace_type;
>  		__entry->flags = flags;
>  		if (region) {
> -			__assign_str(region, dev_name(&region->dev));
> +			__assign_str(region);
>  			memcpy(__entry->uuid, &region->params.uuid, 16);
>  			__entry->hpa = cxl_trace_hpa(region, cxlmd,
>  						     __entry->dpa);
>  		} else {
> -			__assign_str(region, "");
> +			__assign_str(region);
>  			memset(__entry->uuid, 0, 16);
>  			__entry->hpa = ULLONG_MAX;

For the above 2, there was no helper in TP_STRUCT__entry. A recently
posted patch is fixing that up to be __string(region, NULL) See [1],
with the actual assignment still happening in TP_fast_assign.

Does that assign logic need to move to the TP_STRUCT__entry definition
when you merge these changes? I'm not clear how much logic is able to be
included, ie like 'C' style code in the TP_STRUCT__entry.

[1]
https://lore.kernel.org/linux-cxl/20240314044301.2108650-1-alison.schofield@intel.com/

Thanks for helping,
Alison


>  		}





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
