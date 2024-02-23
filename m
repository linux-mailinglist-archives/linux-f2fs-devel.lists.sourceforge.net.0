Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6893861D2C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Feb 2024 21:02:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rdbkB-0004Bg-5K;
	Fri, 23 Feb 2024 20:02:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=wkxO=KA=goodmis.org=rostedt@kernel.org>)
 id 1rdbk9-0004BO-Fa; Fri, 23 Feb 2024 20:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DU2NoxvEkiqB91Rg1/kTiKe/8v9P5M7YGnkA7Gr32Yc=; b=klw/TBVwv/Xh/JbRdhCUnRCYYr
 BKNh3ZAE+FngBoIfgwZ1txBh+zbYW83UBVSab6fg/fO4LLW9yEGKe4SmhAotrN8X06jT6eOseaDil
 1qt3b4ORgiK7g5MXQYAkxSmkQcoqzjbI/NAJfLyVmgE7Yes+wRnRfkiTFIjfYC6kVetw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DU2NoxvEkiqB91Rg1/kTiKe/8v9P5M7YGnkA7Gr32Yc=; b=VklyecM+3g8z+CqILe2n1t1LX0
 1o69/5oc0nSaFgQSWU/7R5KkOiXH1OIwmbNXbf9cTITsSLk8Cb/QfQjDsSYsUC8i/EYCj93Xp5LK1
 uwe7htyUd6OmX98QoyI/njJ3nRsKS395yFgZxYxhfHuFK4G80fI3oF4mIuRtKgZwFij0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rdbk7-0000i5-I0; Fri, 23 Feb 2024 20:02:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8B5A9CE2E7B;
 Fri, 23 Feb 2024 20:01:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C71C433F1;
 Fri, 23 Feb 2024 20:01:46 +0000 (UTC)
Date: Fri, 23 Feb 2024 15:03:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Kent Overstreet <kent.overstreet@linux.dev>
Message-ID: <20240223150339.2249bc95@gandalf.local.home>
In-Reply-To: <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
References: <20240223125634.2888c973@gandalf.local.home>
 <0aed6cf2-17ae-45aa-b7ff-03da932ea4e0@quicinc.com>
 <20240223134653.524a5c9e@gandalf.local.home>
 <qsksxrdinia3cxr52tfe4p3pafsy4biktnodlfn4vyzud73p2j@6ycnhrhzwsv6>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 23 Feb 2024 14:50:49 -0500 Kent Overstreet <kent.overstreet@linux.dev>
 wrote: > Tangentially related though, what would make me really happy is
 if we > could create the string with in the TP__fast_assign() section. I have
 to > have a bunch of annoying wrappers right now because [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rdbk7-0000i5-I0
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

On Fri, 23 Feb 2024 14:50:49 -0500
Kent Overstreet <kent.overstreet@linux.dev> wrote:

> Tangentially related though, what would make me really happy is if we
> could create the string with in the TP__fast_assign() section. I have to
> have a bunch of annoying wrappers right now because the string length
> has to be known when we invoke the tracepoint.

You can use __string_len() to determine the string length in the tracepoint
(which is executed in the TP_fast_assign() section).

My clean up patches will make __assign_str_len() obsolete too (I'm working
on them now), and you can just use __assign_str().

I noticed that I don't have a string_len example in the sample code and I'm
actually writing it now.

// cutting out everything else:

TRACE_EVENT(foo_bar,

	TP_PROTO(const char *foo, int bar),

	TP_ARGS(foo, bar),

	TP_STRUCT__entry(
		__string_len(	lstr,	foo,	bar < strlen(foo) ? bar : strlen(foo) )
	),

	TP_fast_assign(
		__assign_str(lstr, foo);

// Note, the above is with my updates, without them, you need to duplicate the logic

//		__assign_str_len(lstr, foo, bar < strlen(foo) ? bar : strlen(foo));
	),

	TP_printk("%s", __get_str(lstr))
);


The above will allocate "bar < strlen(foo) ? bar : strlen(foo)" size on the
ring buffer. As the size is already stored, my clean up code uses that
instead of requiring duplicating the logic again.

-- Steve


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
