Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D6B1684D4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 18:22:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j5C0t-0004tV-8c; Fri, 21 Feb 2020 17:22:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j5C0s-0004tP-61
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+9zPArLElNepmFofDfBeZ2fYd9Ky2C/8KNsJoicGJSs=; b=fJ89nAdjdWNNikMLp5KfKCdYTK
 1FWRwi62P7QnZDLcWk5LKOVi8PV1Giu3SsWjH/dmuUlmkoPC6toOkRDaWeoXRKOMwIaxSuXkRNkao
 1wNBtJOCtxofyw99oCBPEktpBsPt7OELQYvmSu6tDNFi53J4GGzZZhW3X84knMN1rG78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+9zPArLElNepmFofDfBeZ2fYd9Ky2C/8KNsJoicGJSs=; b=SiETqF3cPOwLsgY7s5Gci05DfY
 ovG6DzXiujZI8l2yojlxoVvhCF0ON6Jry27c0M3lbZnQbcOkZZvetlJCcOZrDwx9Rb+aRUnAanQyC
 niA/7qYPuDD3Tj3iOQlCQNbdpF3lYx8n27c+k/YCkvBixKU1DUY3LLPaPXr113hPANn4=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j5C0o-003TBJ-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 17:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+9zPArLElNepmFofDfBeZ2fYd9Ky2C/8KNsJoicGJSs=; b=ZtZ/zzjY4QZauehBMVxj/JluwD
 ttlA/fYN6KD+QSaa+9jUB3VqWsDBsferiztcwCniVqNoF2ha+FpTKL5OYooAz/UWnxnMRkL0Tr61M
 ECpP1oIkN5m1Oiwa0fCw1H+aEEkmHuM6wTaT0XPFWOkOBHon+CU+NwflwkJUepw0ySejq4gZrgV7T
 bB9uMG4ytHCrq1FyXdhLV+ZVej6lXAfjQKiBYznpFK8uxQ/uEETJtLs6dyXIg2gD/RdjLdYYwl2kt
 21LcQdDeGezUMi1eSmieYK2Ue79KohVX8CVofhlg+syNjZEj1wpcEXKw8Sr6/nRFek9UH7v2vCqmA
 11AtBGCg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j5C0i-00067Z-QR; Fri, 21 Feb 2020 17:22:44 +0000
Date: Fri, 21 Feb 2020 09:22:44 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221172244.GC438@infradead.org>
References: <20200221115050.238976-1-satyat@google.com>
 <20200221115050.238976-7-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221115050.238976-7-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j5C0o-003TBJ-Jd
Subject: Re: [f2fs-dev] [PATCH v7 6/9] scsi: ufs: Add inline encryption
 support to UFS
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

On Fri, Feb 21, 2020 at 03:50:47AM -0800, Satya Tangirala wrote:
> Wire up ufshcd.c with the UFS Crypto API, the block layer inline
> encryption additions and the keyslot manager.
> 
> Also, introduce UFSHCD_QUIRK_BROKEN_CRYPTO that certain UFS drivers
> that don't yet support inline encryption need to use - taken from
> patches by John Stultz <john.stultz@linaro.org>
> (https://android-review.googlesource.com/c/kernel/common/+/1162224/5)
> (https://android-review.googlesource.com/c/kernel/common/+/1162225/5)
> (https://android-review.googlesource.com/c/kernel/common/+/1164506/1)

Between all these quirks, with what upstream SOC does this feature
actually work?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
