Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB11CF7729
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 10:16:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Bf8oX50ij57gcaKaRhaoxXB2YXhSeIAIg6ij1B9U+4=; b=IM9rd2qFK3UIUj3G/3XxShrxBF
	cfl9olMTAkMnTyZT6IvpHlMquhc5lwLAJEnM4fLFKZMPVjm01nshEUoEDbdpTymOLq84vi70+sxff
	kYPwSw4AsG7HxxArK056RjD6tgXYfXZsrbpbaOWZZ0foSDSNuGGNqqpKHAiOtRAAo1fc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd3BN-0000vq-0W;
	Tue, 06 Jan 2026 09:16:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd3BL-0000vc-Bw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:16:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Z5obTnUVZvS/fOyWrA041afYQ3DtCj1nmRC2TPVmJU=; b=CFE8UwMnVmyMHjW0G2asT6xdNj
 DD3wiHacfF8UGlwhIhzfQJPp2oGU/QTsiGTx1vVWvdy0AXsjt0mMtTXgLvs2CbWR0GrmRMXZcqJ2N
 +akdje72XD7kP7spNDaSQZbFFYBi00jt5OHh2UY1PH8mg0Vmmu+duxDWH8Er6ZGk2BuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Z5obTnUVZvS/fOyWrA041afYQ3DtCj1nmRC2TPVmJU=; b=Yp0L2zs2BWjQTwCmjeXeef8vfe
 yQdk8sPmweEV+9C3HxxbZD36bGnT7L0OR6pnWEzXk4k1i+nVCCSiY1xEqut0shqTzI4InZQ5sIjnH
 dLlvtNXIt18NjShK3+PpD/gAIINNOolgWzyNeqMZ0SFx48uc/6d/eKASqqMTcrlQakZ0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd3BD-0001SW-0O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 09:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 55B3D60147;
 Tue,  6 Jan 2026 09:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10540C116C6;
 Tue,  6 Jan 2026 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767690997;
 bh=w+rWz+PbDxgIMU9MG/SZtQJ/F23YPFum6gNUrk/Kn8w=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=RYQpuaxAh++6fh9z2PVbSFNxV7jEz65wfL0bTad0fMA6QzM+inAmRnYyzXSj0N2lg
 MB/hSIRd9cczJac9k6qohQ477W71Cb9/qkubllnB9c6IEwWciZe5afYiMBkWTJcV0F
 TYCQEr6SmyEIcSoeTKbXM7T9+rxRKoF8mOLgaxL2j7RlzctAneSaFRzDSOLgT76i3+
 LXivIPmdeXtzUv8BaC9wrfKiXqUyy3F1xRHTKYgVsvSTaPA2Y+hZBf0RwEsZl3PR+Y
 VFUrA72lBRc36vBGupdNbrK79wOALx0NyLK493Jzcqr94GwoWhVBYbnIjpb5wa5sDF
 syPYfo3GBxofA==
Message-ID: <553c84d8-e0b3-4d02-a417-9e810142e8d6@kernel.org>
Date: Tue, 6 Jan 2026 17:16:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nanzhe Zhao <nzzhao@126.com>, Kim Jaegeuk <jaegeuk@kernel.org>
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-3-nzzhao@126.com>
Content-Language: en-US
In-Reply-To: <20260105153101.152892-3-nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/5/2026 11:30 PM,
 Nanzhe Zhao wrote: > In f2fs_read_data_large_folio(), 
 read_pages_pending is incremented only > after the subpage has been added
 to the BIO. With a heavily fragmented > file, each [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd3BD-0001SW-0O
Subject: Re: [f2fs-dev] [PATCH v1 2/5] f2fs: Accounting large folio subpages
 before bio submission
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/5/2026 11:30 PM, Nanzhe Zhao wrote:
> In f2fs_read_data_large_folio(), read_pages_pending is incremented only
> after the subpage has been added to the BIO.  With a heavily fragmented
> file, each new subpage can force submission of the previous BIO.
> 
> If the BIO completes quickly, f2fs_finish_read_bio() may decrement
> read_pages_pending to zero and call folio_end_read() while the read loop
> is still processing other subpages of the same large folio.
> 
> Fix the ordering by incrementing read_pages_pending before any possible
> BIO submission for the current subpage, matching the iomap ordering and
> preventing premature folio_end_read().
> 
> Signed-off-by: Nanzhe Zhao <nzzhao@126.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
