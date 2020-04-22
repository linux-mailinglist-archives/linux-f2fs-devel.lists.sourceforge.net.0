Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D691B3B8D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2020 11:38:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jRBpG-0005RB-IX; Wed, 22 Apr 2020 09:37:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+f4d323def9086acb1ddf+6086+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jRBpD-0005R1-IO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Apr 2020 09:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G38QTqd03XPOTHFdtqcSzRlDM6JatBVOJOrQ7ob42Ow=; b=H5XzR/jfLJ9fy0Vk+7WYRPo3hS
 UdOW0jNM6zO8bL498zno6aOnvfSmyp/bxDexh/89RSFhGWBo+pS0Y+DACj/dbcAgvsZ8V6dWuzHWF
 AACazVYgtMHs163eg9tPQyxBlI2U6ztv0E3kq7cnbfRurLKabZg9RNgJ6NSA+W1IPn7M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G38QTqd03XPOTHFdtqcSzRlDM6JatBVOJOrQ7ob42Ow=; b=L8rtTshPEMMgXb9bMnf+j0WV+M
 OFhONzSUs3jZTqlNo6bCSG5OuaXYSDDaIVv2c6i9cjmVZUvcJd6gUHnOmfXmIAYHh9OX1zEyosJ3T
 Prapi2DDwJ9oHaoelhFB8RrCShUs0S8VBmZOP4jBXYlg2tvbd8gBywfzQ8Fisp9AKo1c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jRBpC-009p7V-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Apr 2020 09:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=G38QTqd03XPOTHFdtqcSzRlDM6JatBVOJOrQ7ob42Ow=; b=MAVw0+I/MkbE50pi9z8IP/6u8H
 Zqt42jz5vGkjspCyFke5X6et7WjLfrLoyp9MuQcxSytUf4BuyN/n8SAymOtRAWBeoPJKKFyKpyWl2
 6ZGdi1/8UW6T55vKFcMsQF9ygiZRP1/hOMt5yXvtcnokLgt0hGJ20zuCt/DFY8kx6nz4Ihl7hV41y
 6152jruxoJnBvfjG8cwOqT7bTrSl1T0QEkoNsJHjYRlcPOPUVcsQG3RNiSAX2FMfGKbI52GNhg8TU
 p9jx9Zgts1vMcy+G4v9UZ6rKlVMFLs2qrP/hu19ihTBFL9UairBjBvUzfk7ykaytxi+VUcySsEMfI
 +bEmxnog==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jRBow-0000kB-An; Wed, 22 Apr 2020 09:37:30 +0000
Date: Wed, 22 Apr 2020 02:37:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200422093730.GC12290@infradead.org>
References: <20200408035654.247908-1-satyat@google.com>
 <20200408035654.247908-6-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408035654.247908-6-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jRBpC-009p7V-Ay
Subject: Re: [f2fs-dev] [PATCH v10 05/12] block: blk-crypto-fallback for
 Inline Encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> diff --git a/Documentation/block/index.rst b/Documentation/block/index.rst
> index 3fa7a52fafa46..026addfc69bc9 100644
> --- a/Documentation/block/index.rst
> +++ b/Documentation/block/index.rst
> @@ -14,6 +14,7 @@ Block
>     cmdline-partition
>     data-integrity
>     deadline-iosched
> +   inline-encryption
>     ioprio
>     kyber-iosched
>     null_blk

> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index 7546363dc584e..18e1a4d64bd33 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -3,6 +3,10 @@
>   * Copyright 2019 Google LLC
>   */
>  
> +/*
> + * Refer to Documentation/block/inline-encryption.rst for detailed explanation.
> + */
> +

These hunks should be in other patches.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
