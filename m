Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4DCF73FA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 09:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqyuaCwyAm+CPK88fEIa3eyZCBGMmR7EGNBiNAEg1OU=; b=TNy3Zj/gvNA/ZwvOkcpYUAZSlt
	DbXvL+aFtP0aQEGcLEG5ZOSNQsztSgMYYm1/DW6fSES3I/b+rh19uyIpAlQBTpG/jNGl4Hg8L3fTB
	p3ArlySAuWpAfemcLstlGoJu0oHj0kMkyXox1FtxG9Oc+N/Y4cpkI78vZLrB0JOscnCk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd2DW-0007wE-0h;
	Tue, 06 Jan 2026 08:15:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd2DT-0007w6-Oi
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=77DADSDy2fqi3CIU+IhAXMeKl2ul70Z7IHa5Z8juFos=; b=Ni0jM5O7paJXeZ2LLWDTjqPEL4
 s4P2JE7VGA691sn47cGSoORVsRvK5fyVBbaYLGafUe6OOdyGmzG6gK7z9Tg3HkBSpsoFqvMB7Z2SD
 ZrxmKIhR0W+f6XimQ1An0EU6XbJd/pKVXemAJw7LklVwkpa/RVCC4eVIVsQje5KlfbrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=77DADSDy2fqi3CIU+IhAXMeKl2ul70Z7IHa5Z8juFos=; b=ahZVumnlO0ZLibyXTEKl1cml6G
 X8o2w30nqYe+EkUMDNu+I5vzx/mpXSnQEMDgp9scEhj2AygcGdxxl7yGzHbbzK2AJKfFGYZmtw8aV
 id19KgFo86gN4tthisTyHFDd9E9OpA7gL0Mxk2o1yvrOwpnNFQhI0HVw56Lki3FREnJw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd2DT-0005kE-5r for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:14:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8752E6014A;
 Tue,  6 Jan 2026 08:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA21CC19422;
 Tue,  6 Jan 2026 08:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767687288;
 bh=GLKnxRXS7x6QbMGNH9aXz2zmKBGtXZuBZtxcuG3vyw4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=aMG8Ji+oeKE1FHxuezo31BrbV5Sq1rZimkrdKujwiEUOXWv3bKB6iV07bvFT9NL/e
 e54pSBmf8Qko28J/RHoB5E3Tx0O0ghpe089rZuO+rBStkeHepNIpGQtnh/X7+5uTG2
 XcQAH+GXa6X5Qx6OvE+Rz0CI87/DMTdGSYCJwiGCzSADmrmPWYydl5uk1OtKH1IIvH
 HrDIjDjgOhrUciGHzjFfbk5GbpXuLH6tW35kZVxElyY6FrCR1TUbabbqracO0oZw0f
 4lUgcR+eRZnPbP/dEVKtw3eHsoeERABx2+qbnIW0iOUXzv2QLFtj2c/7Hkw4DfwSxA
 HaRXEr4kP8iiQ==
Message-ID: <5c079448-7bb6-4fe8-93a3-620657d2b8eb@kernel.org>
Date: Tue, 6 Jan 2026 16:14:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251230173845.2310677-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251230173845.2310677-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/31/2025 1:38 AM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > During the garbage collection process, F2FS submits
 readahead I/Os for > valid blocks. However, since the GC l [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd2DT-0005kE-5r
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush plug periodically during GC to
 maximize readahead effect
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/31/2025 1:38 AM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> During the garbage collection process, F2FS submits readahead I/Os for
> valid blocks. However, since the GC loop runs within a single plug scope
> without intermediate flushing, these readahead I/Os often accumulate in
> the block layer's plug list instead of being dispatched to the device
> immediately.
> 
> Consequently, when the GC thread attempts to lock the page later, the
> I/O might not have completed (or even started), leading to a "read try
> and wait" scenario. This negates the benefit of readahead and causes
> unnecessary delays in GC latency.
> 
> This patch addresses this issue by introducing an intermediate
> blk_finish_plug() and blk_start_plug() pair within the GC loop. This
> forces the dispatch of pending I/Os, ensuring that readahead pages are
> fetched in time, thereby reducing GC latency.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
