Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5DD1039D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 02:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcqbPBLVVArDPCsUSLXZF1JSVZ0CpgabJteMBxbsNns=; b=DISHcSDC/sAdYxtVSc7n4YLYZZ
	IqIvz4SLnUAiwVt9ECYHSohp8idcbcLPOduSVQg2wW/vVeIBfSerOWA6CHBYRFQuiHWi8JUyGgNW4
	JoMB8ftJ6+HQUGyIbp4lwlnq9kok0zHSFY/IwYOUqHsXPANuF9V/cccwOi9U66DPTTnQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf6NV-0000KD-QI;
	Mon, 12 Jan 2026 01:05:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vf6N4-0000Jc-Pk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRUl5SuzqPflpUUcLRwfcmuVgR2QFgYGjgJe1BBH/Ww=; b=ScwkOW7U4E3Vrt+hE/Dts10EeE
 2MlhYghNQRfe+D0WV7UJnHUbFCvaihh07oQkk52Px5Y8+B+hk1Nlk9X32GbKavciV4Ile6DRXQ6Hl
 7H1A/uFrLU9FLj/8PmFhGL0342zxwZr6Lo0XGgyenFthXAhSbmxi5zkRQHcy2QDFbHIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aRUl5SuzqPflpUUcLRwfcmuVgR2QFgYGjgJe1BBH/Ww=; b=XArytx+4iPh5Fp6KHv3Uu/BjxD
 gvBwNGT7kQgWBMus+oU7hiqGvYBFbsEMbq7QPPE+UqChjANgHG29jJC5MDWnuklXkayJrCw4sEgcA
 gBhWphmjMhOfJajjesY57EYdZA99nguNXYpLn0vFN3eISpr86n/u96G1gSzB3lc+89dE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vf6N4-00081H-Cw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:05:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C517360197;
 Mon, 12 Jan 2026 01:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A4ABC4CEF7;
 Mon, 12 Jan 2026 01:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768179915;
 bh=4Hsd5MiEaKDmvN+p4lvI5P37r7aec8VFwFgJQnPsuYo=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=p2ClDUtoxb5+XRBlfTR9LM7qOmJK0ziWlfwALsmQ6cBySbr17r7thk9oFGw3gZeBm
 lC79CznSt7gJBQhdEXrlH2xMAjjYT2Vu7o5ZJ+LawFR00u34Hvc/zdFG1BJNrbGAIM
 +iYf7+3INRnSw0zuM5Z6fMre7S1merD9w7imdDoHmsLXRHePE286jV6T6cT2ZAqQy1
 Gk/8YNZBExA2AIDGBWLdDjBJ7NF6/28O49Ga7QswDs8VAT9VhrmF9djwbeMa3vSo1B
 tEqPG5jnVD9d6NTkirGOorvc2wuJxNKS6mqgBwXcNHOr9tC27IIx0L9+UzQHkwur+K
 v0aY7e9tjQQew==
Message-ID: <4408fb19-5fd4-4ff9-865c-edc28f0c1c11@kernel.org>
Date: Mon, 12 Jan 2026 09:05:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260109144617.3282553-2-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260109144617.3282553-2-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/2026 10:46 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > In the second call to f2fs_map_blocks
 within f2fs_read_data_large_folio, > map.m_len exceeds the logical [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vf6N4-00081H-Cw
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: avoid unnecessary block mapping
 lookups in f2fs_read_data_large_folio
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/9/2026 10:46 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> In the second call to f2fs_map_blocks within f2fs_read_data_large_folio,
> map.m_len exceeds the logical address space to be read. This patch
> ensures map.m_len does not exceed the required address space.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
