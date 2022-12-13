Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EA464BCDB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 20:11:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p5AgQ-0004G4-4p;
	Tue, 13 Dec 2022 19:11:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p5AgP-0004Fy-7o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 19:11:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3w72/8K2CauCfvYEcYmQl8MJZ0gtvghHUWYDFYbGCvA=; b=ErZc6888PEnT5irMCcBpyb0L7h
 KxbiQF6PQX1b4eRq8+SfZ04Kl16TWAtG+g7yEb8wO/IsAL7pugBxFJuduqw7CuDSExeiIv01eKCaC
 2Te4IJTXNtYaMHj7qnBA538N50qLgeKU5u1GmRc+gAXJdcu53S/CBMODWcxTPuoraJIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3w72/8K2CauCfvYEcYmQl8MJZ0gtvghHUWYDFYbGCvA=; b=nDdvlomO0FGO4xQsfrrD4la+gq
 lQZ1AfBQfDMO9vrKHHDj/7HiJG/rSXPpz+dJbUP5zPQnQnWViBbuH0ts1BFmuvBY2xnhgusZO0Ece
 uHz/PknkUMKLynIqPDaoCEacgZjBw1kdbpQD6tGsh8ylx8LDPpFUh9lkST7gjGcQh6yE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p5AgO-00GB4q-LX for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 19:11:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 443A5616F4;
 Tue, 13 Dec 2022 19:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBCDC433D2;
 Tue, 13 Dec 2022 19:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670958670;
 bh=/VeZtsI4jZz7Y++Dl+hs6w4K2j0s34Gujm/rr1i5/0Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CwexaBGc4Uanr5oZfvr1a+liupkMwiLS8HTgnuvrJMxuRL8N7fHajOG3D9jOVdMSE
 0T8M4szF7ZcMocoKrz8KSmbxFRM2XL7Uwhr9tCjXWqZAPK7Jbsz2aQbdwh0f94Bb+7
 GGN5Hf9EsJzWP0NEIvcEtYph2rPdgy83eljNcCwUbPt+8GYnF6GDsNUiKjCS9iyoKg
 NxNDDeYY2gZN8tP9ZgY1ONKPwn2P3Y1l72BeWNthnYYMVFJXTQwAOOaHJJIfkkvcrZ
 +VFIjTAOD3SA3GuX/lur1fXMmFXRSjcFc0yFq34yQrZS0g3qc/ZRTiWgswSYEAk8/q
 t1FnCE5y4q6yg==
Date: Tue, 13 Dec 2022 11:11:08 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Yangtao Li <frank.li@vivo.com>
Message-ID: <Y5jOTL66ph3Nq/Hr@google.com>
References: <ddf243c9-f557-7f11-1964-8d2324f84092@kernel.org>
 <20221213115454.14885-1-frank.li@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221213115454.14885-1-frank.li@vivo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/13,
 Yangtao Li wrote: > > What do you think of extending
 this function to support io_counts? > > > > void f2fs_update_iostat(struct
 f2fs_sb_info *sbi, struct inode *inode, > > enum iostat_type t [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p5AgO-00GB4q-LX
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/13, Yangtao Li wrote:
> > What do you think of extending this function to support io_counts?
> > 
> > void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
> > 			enum iostat_type type, unsigned long long io_bytes,
> > 			unsigned long long io_counts)
> 
> Support to have extra io_count.
> 
> But I don't think there is any need to add additional parameters to f2fs_update_iostat.
> IIUC, each call to f2fs_update_iostat means that the corresponding count increases by 1,
> so only the internal processing of the function is required.
> 
> BTW, let's type out the iocount of the additional record in the following way?
> 
> time:           1670930162
> [WRITE]
> app buffered data:      4096(1)

How about giving in another columns with additional stats like avg. len/call or max. len?

app buffered data:      4096	1

> 
> Thx,
> Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
