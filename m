Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA76AAAF2D8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:24:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Z1Xe06X6s9oBpGHLNT/V0keQQRcrNeQvEPWlhbIEG4=; b=LdhnZ/YRzf+8ud7UfhW//dwP/l
	eJWmFhw2G2vxreMdma/5U7Rh92JqAFEZjI3UeMXdRacEwhVbVUOh1x98Cru71JwpWWzT2Be0+itZF
	6JT6+pYgGdazPZapLFmNB4Rdybjn4YzoSR/h3AcLO4lm4eKZvnkppy21Pj0GeWJojIs0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtkX-0004Cm-Qd;
	Thu, 08 May 2025 05:24:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCtkV-0004CS-JD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ev6jIx7ohozicYiIJ24TOyl+BBn1TztBGwUEBZYlY24=; b=f0ACrEKZ3yeVvjUUWXspMm6rpg
 BEna0J3ofJsNzJ03MEvqKzHGLhdix8Dpioym2yQNAA+cFLVNXF5SRCQuck5TILu0vo1ocMsnj+JQz
 5oFvwHXJ8rXCLYsd5zKQv6pSwO8O/xjATs9gPOpa7s1HrPFkE7ajRZVnHCFALoxSsRlc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ev6jIx7ohozicYiIJ24TOyl+BBn1TztBGwUEBZYlY24=; b=TKGqgb2G9hEscaD+2dNpipZ7h4
 Pi/oYAxe6z8V/km9dOoXbanW1PfRWPxsgeffuAGKOc7YaXPnBpoUAWW5r51hekFmGAhJT5GX5l50I
 kOG/gUf9AdcbhbeEciyUGBkXCuBx2u3nw2UY9HKzMIVwUZq9muOFSZS3CgHSKCg5nRYk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtkU-00042g-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:24:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 29670629EA;
 Thu,  8 May 2025 05:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD5EC4CEEB;
 Thu,  8 May 2025 05:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746681875;
 bh=3sYe3SmDr32t4jdhPdpNaRqMy/gCrEWYAFqENM23+Ck=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=nkKcndVCogLG2QFxCShVKwWUcJz8xGvEWSYkRNmvM4xLuumnKVyoxdK0n+bRWaOHH
 69NynTzXm41IkDnHNnGz4Hiv8U94iEXY+/TL9GE8OXBVfoS0AiqGVjy/k1C9SwNiS9
 0Mxov+V4kN/yu32FWbBq7Y0ixBYSkQ+4onq5ojritBQ2tKziBviyCXqgLQl0vqrkxg
 /JsUXuDhXTf5kmJbGpcr8Dsb8rqy4435zWlWKgVrbmAomXWqthsC5IqEPoMvCkUK8J
 Pb/5yQ7R/fFvuPslzaF7UrSSVWOXh/skb3Xrc5mZ47V0MVuGPPG+rSQ81TAY9kGZJC
 +TSa50/mAXxKg==
Message-ID: <d747da62-d8ea-4e92-854d-50e8c849cb11@kernel.org>
Date: Thu, 8 May 2025 13:24:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Eric Sandeen <sandeen@redhat.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20250423170926.76007-1-sandeen@redhat.com>
 <20250423170926.76007-2-sandeen@redhat.com>
Content-Language: en-US
In-Reply-To: <20250423170926.76007-2-sandeen@redhat.com>
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/24/25 01:08,
 Eric Sandeen wrote: > From: Hongbo Li <lihongbo22@huawei.com>
 > > Use an array of `fs_parameter_spec` called f2fs_param_specs to > hold
 the mount option specifications for the new mo [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCtkU-00042g-Tx
Subject: Re: [f2fs-dev] [PATCH V3 1/7] f2fs: Add fs parameter specifications
 for mount options
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
Cc: linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, lihongbo22@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/24/25 01:08, Eric Sandeen wrote:
> From: Hongbo Li <lihongbo22@huawei.com>
> 
> Use an array of `fs_parameter_spec` called f2fs_param_specs to
> hold the mount option specifications for the new mount api.
> 
> Add constant_table structures for several options to facilitate
> parsing.
> 
> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
> [sandeen: forward port, minor fixes and updates, more fsparam_enum]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
