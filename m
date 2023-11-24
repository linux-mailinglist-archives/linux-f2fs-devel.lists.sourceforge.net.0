Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCD07F6D99
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Nov 2023 09:03:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r6R9a-0002xq-AS;
	Fri, 24 Nov 2023 08:03:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r6R9Z-0002xh-5K
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Nov 2023 08:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j8BYPsGm53ifkECEDA5BuOzsZfa64kfWRFxbHWTuPQU=; b=PXmp9+ff2petpIh0zwOw+SVmX7
 UvVN6NuLqGWZywkGOjbNXB9SYyuzoO/DeJhtAcesZt4JXHOnEt0Yd4QsmOlZqOGu6fay223J30SCd
 3Zowd9t1Gnfhf/7MFpzhyG8VfjIFyyzqYEWyO7vuTohBgyqz59JAr1oeUARUQ2xKCcIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j8BYPsGm53ifkECEDA5BuOzsZfa64kfWRFxbHWTuPQU=; b=Cc7MFuctbUOIcoNV2/gBPG0NFU
 a5gmM6N22FoO3vhX/25Wl/jKw/s0zGL4F/ARGKacLOMKo0yTN9bjVrmNkIRJ3r86Cd3+fm4tm0FfZ
 K4yvp5rNoPL0uoTU9kcFUJFUTcrroP2BrRIHGNhDgEQUzbPB0YdDywTl/z05ANzfoLNs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r6R9V-00E7Ew-31 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Nov 2023 08:03:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 765CD61FBE;
 Fri, 24 Nov 2023 08:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF80C433C8;
 Fri, 24 Nov 2023 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700812976;
 bh=sBzSvuJ4CblFWXdVQH6A6MIoJi7BRHC78qIapG0MoN0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=oAv42OXygJGg57DtJoXcD2bs44UQ0LlgMlymsctEEebaaWI/h1rz5Zl6RtiFY44YB
 62135gf70qxSMPJrIdUwsApXdBAoUmNZjcbCuH8lv4lp9odrOYsb2GuLtOr+TZbtOx
 yRZG3dzDwb7gARvfSTwbvFL2NfWCMdels9SY3/o6FvnUm05DKX7DsvXG71Ju+IAKI+
 OtqaDms3AZYu++WsrzzETjOLfFZKzndc3RZ9Sf9DJMwpHFMr7c8teuT/+fVDAn7UZq
 rRpWmqt937Uda7Aatm90ACZNAMvy5OWqXHuiWRXmBcE7vtAlafq4zgYNpWCz+5Tz7o
 lcuXA0Pw/S0KQ==
Message-ID: <53283bde-7de1-4513-44d0-c4d90f0aad98@kernel.org>
Date: Fri, 24 Nov 2023 16:02:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <20231118020309.1894531-1-drosen@google.com>
 <20231118020309.1894531-2-drosen@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231118020309.1894531-2-drosen@google.com>
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/11/18 10:03, Daniel Rosenberg wrote: > The conversion
 from block size to MB in this debug statement assumes a > block size of 4K.
 This switches it to properly use the filesystem's > block size [...] 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r6R9V-00E7Ew-31
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs-tools: Fix debug size print
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/11/18 10:03, Daniel Rosenberg wrote:
> The conversion from block size to MB in this debug statement assumes a
> block size of 4K. This switches it to properly use the filesystem's
> block size.
> 
> Signed-off-by: Daniel Rosenberg <drosen@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
