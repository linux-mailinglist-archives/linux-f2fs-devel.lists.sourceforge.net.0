Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 024228584CF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Feb 2024 19:05:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rb2aK-0008IB-QG;
	Fri, 16 Feb 2024 18:05:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rb2aJ-0008I4-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 18:05:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ptgg+a2vjOJfeT+t90/1skb3OUVPT6JKBBohp0sBII4=; b=FjYlhdk1fWAXzKL5ye6k4o5bwU
 Bd9WAh4gVT6oEQ1RI+ow/jROwRD/ffyLDfb8PnAwT8Bl4g1JAfQpCwYNYYbODqO/8iwabucUGojVC
 5oiYRy/scjDM8TsK8KYanArWHJvpFzi+Zs9gMnv8Gi/ri6na5lhZK5QDmimd7aNuM0YE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ptgg+a2vjOJfeT+t90/1skb3OUVPT6JKBBohp0sBII4=; b=SkVTKDar1NOqQD99nNtZsf9YSg
 kx7ZgdHPei1bdQ2p7r0h7V3OStvADpAsRqac03ryidUeD8fiyTyqTESefX5M2uas0lHN1P87FSdAt
 533PWx1VSMBuF1U2tiphjkS6NcgnTaXdczIS5l6fp9PBS0sQyKr0YBD+drCuzO2vxsXg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rb2aD-00081L-Ln for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Feb 2024 18:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8EAE161EA1;
 Fri, 16 Feb 2024 18:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE75FC433C7;
 Fri, 16 Feb 2024 18:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708106705;
 bh=vG/RKSRTXzqAUxbAxGsYUW1wn0EAG4siYC+evNc+IOA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e5RpmDuUiTEP2FeBe2JgOBq/D8z+MLtqWSuSNSbCQMoEn1su+PuqgTIsbcKEOfJFl
 IbBwzFpiRVjZjkTuTWpO4QXHU5F4r1DD7Rly7RvJtLmtCVBJlJXa8PoxfMmh8iYkCs
 WGRoVikXPBHUT5XIbzQiPihfov+fuxTVlOB6owwytGPd+UPF3GCXKwmj1ilNTuGIfP
 TwHXvHLlc/fEUCYcVUm9TTjNNMKMgujpUCm1Gz89iu/mgyU82eT9/kq6BsdFKQlqLg
 HMPVR/Z3ZrOvaW90jqkMc4HFf+mldHcVZLhymeV+cjJSFKVi560NKyu5dbg249S6+d
 kkwuFi1XAg1Hw==
Date: Fri, 16 Feb 2024 10:05:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <Zc-jz93ECAgAbeON@google.com>
References: <20240202165208.4091800-1-quic_jhugo@quicinc.com>
 <ce40205b-25c6-6ba5-23a4-70a51b4e1b21@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ce40205b-25c6-6ba5-23a4-70a51b4e1b21@quicinc.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/16, Jeffrey Hugo wrote: > On 2/2/2024 9:52 AM, Jeffrey
 Hugo wrote: > > The servers for the @codeaurora domain are long retired and
 any messages > > addressed there will bounce. Sahitya Tummala h [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rb2aD-00081L-Ln
Subject: Re: [f2fs-dev] [PATCH] f2fs: doc: Fix bouncing email address for
 Sahitya Tummala
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
Cc: quic_stummala@quicinc.com, quic_bjorande@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/16, Jeffrey Hugo wrote:
> On 2/2/2024 9:52 AM, Jeffrey Hugo wrote:
> > The servers for the @codeaurora domain are long retired and any messages
> > addressed there will bounce.  Sahitya Tummala has a .mailmap entry to an
> > updated address, but the documentation files still list @codeaurora
> > which might be a problem for anyone reading the documentation directly.
> > Update the documentation files to match the .mailmap update.
> > 
> > Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Jaegeuk Kim will you apply this?

Thanks for reminding this. Applied.

> 
> -Jeff


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
