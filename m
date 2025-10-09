Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E454BC748F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Oct 2025 05:22:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7piOky7bAd9WEDgaNwAsr3aCP2uFETnv0QAApIedfU=; b=gIbIzGUGrAp7lnJgioXlWFreVF
	9SA2alrTt+G1uGEqUS3YwWQVXyve3719GfSrFpX1IbwhETDB66OGN7axTxgKf0DgCv+J3V7/5QDah
	XMdAJHTmNFGoKnZSOjNTQaPpa0ULxW6h2ukSxabvlAl/YIV6S4Mgyx/922aWGWAe+sHQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v6hE4-0006QE-Sy;
	Thu, 09 Oct 2025 03:21:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1v6hE3-0006Q5-M3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6mq6WpMC2rQoWM7vbhJPO9uK8N/SxIEJJbeMuyl5lsU=; b=ATQeVPRoKTDZQtDnu3SmrlmA/v
 b+JqHodYdsZSdt8ziETt7gpbjuKX/oc72PqlXx3ZYlIzQy97xPTG8s1ITN6KRx4gSMz4KuoZGyJKa
 D7Ld32FJRZpkVmAofmYfmNXt3ukUoWUE8fWq8Kj77jzC2UFIA2i3h1MjhtnqaU9OUi8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6mq6WpMC2rQoWM7vbhJPO9uK8N/SxIEJJbeMuyl5lsU=; b=Acpj3xa+hV+cgZdam93xJwxHbc
 NkgeONlgGyk4SrBWb/6/0tgw4rZ7ssDWTJ/KhDs0gyXCE7+itt4JhpcAjBl+JvGkq6fNTml+qiF4w
 TvS5FNkPkErwyNllxx0+wRDzVwd30Yqq2YnoF99bCt/zJZz6a/nYfeQ4gTUmhPot0vDA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v6hE4-0005jO-3B for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Oct 2025 03:21:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A5253447CE;
 Thu,  9 Oct 2025 03:21:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D18C4CEE7;
 Thu,  9 Oct 2025 03:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759980110;
 bh=PtQ41OI35O60urs8xAZ826G4NPsJvGyXxDM4/4UAcaU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZpSnV+LVg5G/rjlqykPkHL+ovS+hmo2gxXU/MdmSaO+DamwlU8hZOb7qJCVbskqA9
 nmbboLA2bX9KtByKgylIf/9k5cbiv/Lf54C1Cp3zCtzklZNPuak5Hss+TcxLfkoBfc
 nMqzsysDgSuBg4HIXK3EJb2EkTt4kDqP/Hzd7PVQZLBm1Vwnh0z3quaGuSFcKRfHWZ
 VdNyL7j6G0by9bqF0P5wUbo2MD014XaIQVIfOMm0W7lPsU+6QasuvXNtuBBVF2YMp/
 EqXNlc6RjQrxwL7vj4wD9pDNvh96dxna1QJTCMm5qtk6vaZR3stdW3qKuWKmFRndnN
 ciLNt45LgNe2A==
Message-ID: <03cc9db0-9294-40d5-8638-d9f71066b5ed@kernel.org>
Date: Thu, 9 Oct 2025 11:21:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20251003224917.1950708-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20251003224917.1950708-1-daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/4/2025 6:49 AM, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Zoned storage devices provide marginal
 over-capacity
 space, typically > around 10%, for filesystem level storag [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v6hE4-0005jO-3B
Subject: Re: [f2fs-dev] [PATCH] f2fs: set default valid_thresh_ratio to 80
 for zoned devices
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

On 10/4/2025 6:49 AM, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Zoned storage devices provide marginal over-capacity space, typically
> around 10%, for filesystem level storage control.
> 
> By utilizing this extra capacity, we can safely reduce the default
> 'valid_thresh_ratio' to 80. This action helps to significantly prevent
> excessive garbage collection (GC) and the resulting power consumption,
> as the filesystem becomes less aggressive about cleaning segments
> that still hold a high percentage of valid data.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
