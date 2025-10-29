Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 81996C196D3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Oct 2025 10:43:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qps2CeCFBe/IeOH+ZXqL8ne6Fet7ILCF8LqlyHTLLY=; b=LX1Qv6KaQc619wuhmpNNqCYEa9
	LmOrqWbcVWWpOEQJyv/Nk1Ncbc1G+t/HYTHNoIlGFm6DASqTqguxg4daDD3DwlGt4I7O8GQREsQYs
	x1e5FORbqvrpqHbqwT3aRKARZ7S6XiP4l1Oek+BzwhqjAl6AERMA2/ubGY1y6q63HAR8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vE2hx-0000Y7-2C;
	Wed, 29 Oct 2025 09:43:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vE2hp-0000Xj-93
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lZtH8l9ii9WFWtdhvDFJatsqQ1DO+WBQPSswf72aAmg=; b=VFoMjgzH7jRjnXBEuV9XcG4mjs
 ujmb+0UcsEm0wP7EB+wRnLFdeJk3CfJKDtppnngsxIQ3TLwLoqgXP3E50+GDvflTjdFio5am7Svck
 t9LCFkxwyrWDMXco5v5Diwd5eCx0Co6ceTBBg1+eVmZC/vsu8M05Tn59SZ6tBdpQl3jg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lZtH8l9ii9WFWtdhvDFJatsqQ1DO+WBQPSswf72aAmg=; b=jv79lIlNiidsJpAeykVGHTJVmb
 SOZACEeZ8yxWG3hWXgt7pD1dajLFFQpLI5MprlwDkoXTMtqN/jMnTF/R+pjTC4EID/YKSgPgW2k77
 JXhksWHU2FyS4eVLgAhShanxYhplkUkV59M695CMA9Yb2TcFIyGxiTQoHcpSWxJ4de+A=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vE2hl-0000YC-7E for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 Oct 2025 09:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B956D44146;
 Wed, 29 Oct 2025 09:42:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E72DC116C6;
 Wed, 29 Oct 2025 09:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761730971;
 bh=A0KvEPZKedt+BNmjVqc2PdQGPU4FQVR4YaURlU21yXg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=MKunsliMK8nEJJBDZwyuiZsJFCO60e+jSibl3QjzN0ABhYr5V88bXpRsLCRuvik29
 rx5xOQJm0OKUSeal32NO/0E7kgJJnyijAYv3AVoAzP2ii4rnaDbTM4uNBXfYaV6iee
 +Ib3jmwoFDL2iYJOFEbZYNYXsuzQC0O/g9QDAl8DmM5bHh8BIUhyEQiTxDQKvgHlU2
 YFX/mCHtX8sywKGJEdhTY0iUnHzCi+6+YyW3eGCYTw5DYMw1l1SB/nmXx/pt669Pm1
 aXcXBY3egb/xvEfP8A7aI/kt3RY82WQQaVdfhhh+A00Y652EOuScTq+BaAv9xs0f1r
 3YNjBzf77zOQg==
Message-ID: <880b87d8-8c82-490b-9b41-5e6aaadaab18@kernel.org>
Date: Wed, 29 Oct 2025 17:42:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/24/25 22:37, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > When F2FS uses multiple block devices, each
 device may have a > different discard granularity. The minimum t [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vE2hl-0000YC-7E
Subject: Re: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity
 accounts for all devices
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/24/25 22:37, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> When F2FS uses multiple block devices, each device may have a
> different discard granularity. The minimum trim granularity must be
> at least the maximum discard granularity of all devices, excluding
> zoned devices. Use max_t instead of the max() macro to compute the
> maximum value.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
