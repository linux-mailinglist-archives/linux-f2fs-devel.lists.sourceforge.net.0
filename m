Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F457B02B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Jul 2022 07:03:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oE1rz-0007vi-FE; Wed, 20 Jul 2022 05:03:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+59bb276a4702f876c99d+6905+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1oE1rv-0007vb-9Z
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 05:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RyhzVxMbaoPbL9A0bk3Afb4Ipszyt1fT4jChXme2gxQ=; b=a0uiyN4TqjHZyRF3Gf2XK8tUs/
 qvdGPpTB8BN0w6vIHpLERWDNUSl68zv46cC/bHmQ9NC29UaeNWrlyk7hjFFJib8mX/ocoLd+vY1Mt
 NbFvfiSe6nAHBFjuUUrHkDjwMwK+zbPGFRAnGRUKoop+a7G3oVpBg/C/dXCPcdv0OQb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RyhzVxMbaoPbL9A0bk3Afb4Ipszyt1fT4jChXme2gxQ=; b=PVtbsiWiQVyMrjsy/CPeXuKHVz
 lXy68anTTZeZwz0Embm35hUqyjagXwIi4+4dI9jtWj/XlTtjGWtlxm6k2DxgKNWiedfl1pJ3HzwBA
 GjYsbQwuY2OOi802R5zhR/q1u+0fgV9LhgucUVc4YwV18sbzLECUyiKRWku1zzn7M0AA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oE1rt-004hIp-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 05:03:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RyhzVxMbaoPbL9A0bk3Afb4Ipszyt1fT4jChXme2gxQ=; b=KsBZ6uQJI0GUCu2vNLPOIKty/E
 Lw2T9B64G6PgVBoSaxdWVIPkaFMCo4m/bG1Ci+rki3dItqIevm/5AEdtFr99wOyOt02J+ygGCNNQ+
 E1QtxkZ1Hr4jeZBWXn7WNZR/fGDGrzqGKA1YnYTRvR4jK+sUVS/ClKSNxvV3mWpDhD+yjT3t6wAS8
 y6rv0cNaNgDEnesPoSp0fJZnP5zZ6CtqObut17EQHDARHoVl5P5lFsJQD63ueLWd8gkJV6ikWXh1M
 19ACAdzoCxFk8w2iCg8ToWtdIKPUnte1X8Nq6X3oBviEn0eJHXIxsoi+pO3R7QhKhSIZlI02c1J0z
 J/IDJNeQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oE1rf-000N1j-Da; Wed, 20 Jul 2022 05:03:15 +0000
Date: Tue, 19 Jul 2022 22:03:15 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YteMkySHHFOTKSAW@infradead.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220616201506.124209-1-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Eric,
 can you resend the series based on the received feedback?
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1oE1rt-004hIp-Ok
Subject: Re: [f2fs-dev] [PATCH v3 0/8] make statx() return DIO alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

can you resend the series based on the received feedback?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
