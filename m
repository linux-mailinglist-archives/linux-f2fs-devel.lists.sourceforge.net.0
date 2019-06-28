Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FD59CD0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 15:17:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgql0-0000IV-5a; Fri, 28 Jun 2019 13:17:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+00426530c3eef8181159+5787+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1hgqky-0000IC-WE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 13:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0/hz6XgQPsCy3uua9IImeoMXvDssJ/R5ac8DDPw74o=; b=HRLEo/cyZ9QewWtTd4E2Yej5WF
 po98hU3oqR0F5c4Gy5hVH5Czj1DxMH2XpD5yBQhsP48NrCS1rkBN3pOQ8cg1NmlnEsbKU6APPGjkm
 8gTNgpni/RgG+piwbpIhB9OpjrJo5iD6xRqM1jp0EsPMjICqloa5rewlJdjgB3dBfWjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=W0/hz6XgQPsCy3uua9IImeoMXvDssJ/R5ac8DDPw74o=; b=f7zJmjt10908mT04ZXNAL/tb9+
 z8y8PyIai03zcIUsrv1/Qc7gwC0SIbGm7t4+fYAHRZB+qiRJ3EocZM7HtjoRIiCJZcpUJSk1ng46N
 +38euFPDHPvuhzHGjWFa2DMGwjJUspZ68NQLQ/lCwt5S6R7AkCtekMTxRPoRD+qXzmdk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgqlD-00Ez5D-8g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 13:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W0/hz6XgQPsCy3uua9IImeoMXvDssJ/R5ac8DDPw74o=; b=u0wy6nRnO9Wc44TPu0YdFMn60
 t+JKbPbD1VytXfvJvgN4//OrbRPmDMxa0Y+bPGu5sqyHSq7+37cLQbTcmOWacvy7TH9hyz3yCTgCg
 R0gpyvTqHhJebFGBcu+WKvTM84/KIE6wcz4r0TRq3PS7YjMqqwQZ2yGVZ8uO+bZINuBTVKZxNfiF2
 dga7JfjQb4vY4nnecv1TwjbVoJE1OSWiwzSzX3MMVMnVcIoTGFIOmoC9jyI5bjiCAOyGiK4elw23X
 OvR+IGcz3RT2TIhHk4f7clsVWxWNgdu2ijAxhb1zVuyWpcXgUcSlqoZHH0pAu+yTo4SfmV1/uADWF
 wi0/ko1IQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hgql0-0000LR-BH; Fri, 28 Jun 2019 13:17:38 +0000
Date: Fri, 28 Jun 2019 06:17:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190628131738.GA994@infradead.org>
References: <20190628104007.2721479-1-arnd@arndb.de>
 <20190628124422.GA9888@infradead.org>
 <CAK8P3a1jwPQvX6f+eMZLdnF2ZawDB9obF3hjk2P9RJxDr6HUQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1jwPQvX6f+eMZLdnF2ZawDB9obF3hjk2P9RJxDr6HUQA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
X-Headers-End: 1hgqlD-00Ez5D-8g
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix 32-bit linking
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
Cc: Eric Biggers <ebiggers@google.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wang Shilong <wangshilong1991@gmail.com>, "Linux F2FS DEV,
 Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 03:09:47PM +0200, Arnd Bergmann wrote:
> I came across this on arm-nommu (which disables
> CONFIG_CPU_SPECTRE) during randconfig testing.
> 
> I don't see an easy way to add this in there, short of rewriting the
> whole __get_user_err() function. Any suggestions?

Can't we just fall back to using copy_from_user with a little wrapper
that switches based on sizeof()?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
