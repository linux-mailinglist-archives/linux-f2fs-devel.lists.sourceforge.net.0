Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7916D99BF97
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Oct 2024 07:56:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t0E4L-0005Zd-G9;
	Mon, 14 Oct 2024 05:56:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+f913630adc52fe272e7a+7722+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1t0E4J-0005ZK-I3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 05:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K3iO/MnOLPS2CWyjua7B5ZvmEj83Ox3B2fumTWG/bgg=; b=FhinqnDfLbUZ4t4LSMM1iUDnRX
 2tlostG9IMRibheH6zry3HNXwIXfJYmTqWmf8sZmkHEtW49mTHK9+I9F32k26wbvfme+bndbt1F/p
 MO+6hMk1ScpzQTiLpENi84yTQkS6YhXnQDnFhbMKJTN2dLUjtYtA54GYZ+HE2bmjtAnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K3iO/MnOLPS2CWyjua7B5ZvmEj83Ox3B2fumTWG/bgg=; b=L7okurVNuOLtd6A06ipEy1RUDZ
 2U+ZasVIlyoBlA4hP5ngWW4KOEpDFU3icMjk/DTDaCWxMSvOU/z9PWLAjJIo/Ote1ay8TAXFV8wN0
 hsXBHwSdDsDDPUD/kh5h1P6V/Sz/9WQngy1gkFnOyUzWvuxeIN22NpJlNPSUXP8C4VmA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t0E4F-0005sy-LC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Oct 2024 05:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K3iO/MnOLPS2CWyjua7B5ZvmEj83Ox3B2fumTWG/bgg=; b=gs12Wgri1mfwwGkMz8JRS4bsuM
 iYHYSF+OGWpTWVnHTD0vJKAWcgORFLp23qPQqNoJ05G8tQd5XjAHRhGCyv7w0GfdgCNvh/V/h6pZv
 QC2SXZxYd/7A9asVfT83ZKS4e4mJCfXTw/HGK3yCN6hodPP76kjFJuwODDeSmyiR00tYRWdc49aer
 VS9iZK+jLBUJ8XPiCJP4ypCK1dhGIBSy2bk5gqoJGC5pvM+ioHlxZaHCojVk7XS28d2V/iHG2GDx9
 7hSmzTlj3TFDwB4l9JGTWlUz8B3T+YRtdpWKLkzCJPlikD/FMU1BtKVH7VF3jaJrYAkWw6bfMzzS8
 zofwzQog==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1t0E48-00000003oLv-3Jde; Mon, 14 Oct 2024 05:56:24 +0000
Date: Sun, 13 Oct 2024 22:56:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <ZwyyiG0pqXoBFIW5@infradead.org>
References: <20241010192626.1597226-1-daeho43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010192626.1597226-1-daeho43@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 10, 2024 at 12:26:26PM -0700, Daeho Jeong wrote:
 > From: Daeho Jeong <daehojeong@google.com> > > F2FS should understand how
 the device aliasing file works and support > deleting the file a [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1t0E4F-0005sy-LC
Subject: Re: [f2fs-dev] [PATCH v5] f2fs: introduce device aliasing file
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 10, 2024 at 12:26:26PM -0700, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> F2FS should understand how the device aliasing file works and support
> deleting the file after use. A device aliasing file can be created by
> mkfs.f2fs tool and it can map the whole device with an extrent, not

s/extrent/extent/g

> using node blocks. The file space should be pinned and normally used for
> read-only usages.

Is there an explanation somewhere what a 'device aliasing file' is?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
