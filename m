Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C511C45A96
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 10:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlx48RN/9hnfHq1yFZVIw0148i7//AQ4/tsyNVfUndM=; b=mJslvl5OCt+teGeC2q9hJuEFND
	/SggNckF1l0sOdLCzl1uQGYLonG5rhavqNsGa4odqpIelxFLtdeUAvavpAEJs00w1qtiH9nQIwkME
	3Q5RzGBqF2DN0e5GqoNZ95oDaSYXjAGBUEEr/YYYU6dRNMSFnl0hFShFulwtGg9ULLsY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIOIQ-0005wL-Ku;
	Mon, 10 Nov 2025 09:34:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIOIO-0005wB-Hq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ofuoA1cA/0jK5TtxEGrf+B/n2AShj2mYKOvFAfECJ+0=; b=CStupSXs+9HA8JgZS5qgMVTh0A
 Hn+7jDS8G9A//xb37SXUMhGfp7Qf2p42Og0iAXVloOxRg9+zyNq/BspKRZ+4efW6qWZHmSaxgLrIm
 cxMZ5gBhq9240+u9JaenrxpN7bS2jyrBBbJp4FtPuAxKbSTwAwJOPBBrAv3WMS+0d24g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ofuoA1cA/0jK5TtxEGrf+B/n2AShj2mYKOvFAfECJ+0=; b=I4IlBUkOqvTR9LNjnRAh9krDOe
 mStGVoG5pMSReiqt/nkG8fiyKi4HyjRoBOnRGznRyq575T2MqTZ8yXfZYkx+r4OaXh2QOpWqrulya
 88l33nZ4ka79uYGgBjRLpfRgWJakqBbeP+Hg8ADjo7q1IVmmxYZeDIqpSMi59VF0i+yg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIOIO-0005Jn-5X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6B8D1601A7;
 Mon, 10 Nov 2025 09:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060A4C116B1;
 Mon, 10 Nov 2025 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762767273;
 bh=242u/5JWnKwthFc4/MJPpyVedYpd9B3QGwdQFONP7ps=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=G6WD9e+wamU4jrkcYMOwl0062C4ltynCYDlbyUGam7plLQ4Z+KKETpgROM2HX0U6u
 /5/PMjBkSGVGHrj+lX1BOffBh3ZkPlCLv1h/uhL9Nvt25k0dJTTG1Tjw15KwenbRBk
 ULiH4C+8KLNBo5TFRSkbwKInywtE+9bYUVcbYR5z+I+1g5yNGPCvfhfRlmIDbZnmBN
 cqHKWf/LpdmNhlK/YdzNVQpOEnPjogeYRCUJMm8FGrpUnPjl7fONfo2TlTKaIdyNW1
 RxulGa4lDSpHIp/R1ZLtty1/NjwQKuNY0FSMGCplqhLXHW0LPqqhfTi+AJXIVFS7k/
 KfA3qZu/ryiSQ==
Message-ID: <dc863744-49ff-4b7e-96d4-acbf2a07ef7f@kernel.org>
Date: Mon, 10 Nov 2025 17:34:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 16:22, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > The usage of unusable_blocks_per_sec is already
 wrapped by > CONFIG_BLK_DEV_ZONED, except for its declaratio [...] 
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
X-Headers-End: 1vIOIO-0005Jn-5X
Subject: Re: [f2fs-dev] [PATCH v2 1/3] f2fs: wrap all
 unusable_blocks_per_sec code in CONFIG_BLK_DEV_ZONED
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

On 11/10/25 16:22, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> The usage of unusable_blocks_per_sec is already wrapped by
> CONFIG_BLK_DEV_ZONED, except for its declaration and the definitions of
> CAP_BLKS_PER_SEC and CAP_SEGS_PER_SEC. This patch ensures that all code
> related to unusable_blocks_per_sec is properly wrapped under the
> CONFIG_BLK_DEV_ZONED option.
> 
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
