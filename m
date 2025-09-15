Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35002B5727D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Sep 2025 10:06:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TVBCl+gCUXghMNZ5eIYiNM2kpHI9l0z9rK9clJsUXw=; b=lpVo/gYPOyXv/p0AABpVEepkL3
	kVQS92uyGvYZluouZ4StuE/TxsOtXe0yhN6TMQy1S1fUGeemca0FBDLUzV16oIBQAF/6NRiQpmxbE
	aTRUBxZZN9pUXNJkqX7dxV0IWMi6+x7R2KPoaZ4SlXJupkiQl1td6Fue6av8kfrEkKps=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uy4E4-0007i1-AA;
	Mon, 15 Sep 2025 08:06:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uy4Dt-0007f8-6s
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 08:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ges7s1/t/dBLc8/HS4lUTHzgRk5Y3v7WrxpGegUmQts=; b=XV4Ql1mfSt3yTWRMqmc2joQY6e
 7nEVUyRZmEo9niX7N5EXHMp7L2yAJA+2HqvOncKMVCfS/o9R68BZcSzLYjuCis32j2orbuVv13c+3
 OHxgPaCEcMaChATT2SwyguIIwdqKzUubVV3zCC5yciBJ5a7fC21+dWpEFM5ewVIk7680=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ges7s1/t/dBLc8/HS4lUTHzgRk5Y3v7WrxpGegUmQts=; b=OzSiaiCav3XfEMgs0hz1BlbGNA
 sygV3t2jMlKlyZ52LVJEcXzFTLUFDzL6SRPfMycMYYjuiA5tilFr84yUMJ/W6ov88EnrYoBs4dEik
 O8ud81ONBL2Rp82W/NpNQh1SJJNnp4hWW5wHWnMNVidYeANtynuJpZiqRozNS2UN6E10=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uy4Ds-00075Y-SM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 08:06:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7F73340BBA;
 Mon, 15 Sep 2025 08:05:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05CFC4CEF1;
 Mon, 15 Sep 2025 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757923554;
 bh=I3JF6cOAPqmMnoVF1qL1n4PddVdDWphuLVxeTXkhXGw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qIH4zaWsJQmFui+Enjuy08n7j1Ovcw34EkO0bXRjIOY5UjGH4OYFOAhHgMW3YgZ+i
 vmvaS4g9JIEOMyFIpo3DDr3LbHIhr2VppLObYo8XpdPCO2uqztIncsdz9FpWHmKpir
 EMksVAhwjWq1AEaZV0WTv3d/Fyu5Wxj+CZ+YEjvYNQhfFkC2WLFPWzltcpO431sda3
 Rna0AkH5PGjZoQlhiHKwxEwZ9q0lJ2NrnJpXYe17amiS0g8i1z4ABl6B1lKLd6qZyj
 2AqfvgXniBEb1T0coH8oc5x83MRQb4W613J/yC/ubYNG2BTr4QXkZjxIBS4dqys+Mv
 ZB4skUPrluXYA==
Message-ID: <599690b3-469d-4498-ae6f-6c2e3ce4e303@kernel.org>
Date: Mon, 15 Sep 2025 16:05:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, jaegeuk@kernel.org
References: <20250915035246.98055-1-wangzijie1@honor.com>
 <20250915035246.98055-2-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250915035246.98055-2-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/15/25 11:52, wangzijie wrote: > When we get wrong extent
 info data, and look up extent_node in rb tree, > it will cause infinite loop
 (CONFIG_F2FS_CHECK_FS=n). Avoiding this by > return NULL. > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uy4Ds-00075Y-SM
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix infinite loop in
 __insert_extent_tree()
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
Cc: linux-kernel@vger.kernel.org, feng.han@honor.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 9/15/25 11:52, wangzijie wrote:
> When we get wrong extent info data, and look up extent_node in rb tree,
> it will cause infinite loop (CONFIG_F2FS_CHECK_FS=n). Avoiding this by
> return NULL.
> 
> Signed-off-by: wangzijie <wangzijie1@honor.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
