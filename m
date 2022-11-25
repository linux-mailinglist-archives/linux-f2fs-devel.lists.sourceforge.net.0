Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B7639040
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Nov 2022 20:22:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oyeH7-0003jd-K4;
	Fri, 25 Nov 2022 19:22:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oyeH5-0003jX-5m
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 19:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LGUJ6kcS9fTraLJh4ELVqjAk1s2vH7cihFTflRixyo4=; b=gAEYBaV7oFFT7IxoSWAy8Xyvy+
 M8QS1VA3vWnjUDUdYtqWXFQRruS+RF6RXeods95ONSE+c7aJ5Zl24ugdTZNRnWnSzi3TDn1d1hL0Q
 FQlE8MSkkYYo5P3jSODLtm+ilTR4smI/i3691daDFc/Or/I14Wi/9ceGn/BxnUJ7q13E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LGUJ6kcS9fTraLJh4ELVqjAk1s2vH7cihFTflRixyo4=; b=Mfg4GgodJHJ8rK6tDeLn3EK0bm
 qdqmVgIL9EZm3aSnN41w9kGAonOpBkeVXMUn3Yc7anU6R0/qJfK1M1El8ZslDavcHnVYVyHsf5HHR
 UiA1QXMDgw17DuezgJwLH7Ix6i1UdjgOVAi2XMMdkmAL81zK663FW9cwU9+0dX16sDRU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oyeH4-00BsvA-LP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Nov 2022 19:22:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E11360C7E;
 Fri, 25 Nov 2022 19:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B799C433D6;
 Fri, 25 Nov 2022 19:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669404124;
 bh=KrOiWwXDrPvGkEAn2LB7RpjRNfGbTiRZkWJjSt4RC8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CPFBZj5sInDrrO6haYS/sTWeJTkias4f/BcMHkF1L6JEUbgV5mWsbFMpvn5uMpF6f
 TJCnD0bXT/sY56bIRES8+yrqZ7+UoL9yb8CJa2JSsowup80KWFEOqutG4GkoQFi9If
 ZEWKNQXRszfPq618gUgsErEv5+XY2kLZ4HsJF3A+zNWT2okwAN0bcZpqrRHfV9qPHy
 Co2V1+1DiFXVqtvUbb1JHb2+iynCjzRL8m0Z2GezOg6bI6V0vatPT9INxGT7m6Kx3Q
 e+B8UyDMRIR64AAzx61Pn2wdwiXD3/DwB88uMsGNkfZ684U+NuNKNA++dHr8Gjki4J
 kNXPahX58Lx1Q==
Date: Fri, 25 Nov 2022 11:22:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Y4EV2rNfdNWfzF9+@sol.localdomain>
References: <20221028175807.55495-1-ebiggers@kernel.org>
 <6bce9afb-2561-7937-caea-8aadaa5a21cd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6bce9afb-2561-7937-caea-8aadaa5a21cd@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Nov 25, 2022 at 11:36:14AM +0800, Chao Yu wrote: >
 On 2022/10/29 1:58, Eric Biggers wrote: > > @@ -116,43 +116,51 @@ struct
 bio_post_read_ctx { > > struct f2fs_sb_info *sbi; > > struct work_st [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oyeH4-00BsvA-LP
Subject: Re: [f2fs-dev] [PATCH v3] fsverity: stop using PG_error to track
 error status
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Nov 25, 2022 at 11:36:14AM +0800, Chao Yu wrote:
> On 2022/10/29 1:58, Eric Biggers wrote:
> > @@ -116,43 +116,51 @@ struct bio_post_read_ctx {
> >   	struct f2fs_sb_info *sbi;
> >   	struct work_struct work;
> >   	unsigned int enabled_steps;
> > +	bool decompression_attempted;
> 
> How about adding some comments for decompression_attempted? Otherwise it
> looks good to me.
> 

I added the following:

	/*
 	 * decompression_attempted keeps track of whether
 	 * f2fs_end_read_compressed_page() has been called on the pages in the
 	 * bio that belong to a compressed cluster yet.
 	 */

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
