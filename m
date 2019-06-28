Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B19EE59BE6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2019 14:44:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hgqEw-0004Qk-Ex; Fri, 28 Jun 2019 12:44:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+00426530c3eef8181159+5787+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1hgqEv-0004Qe-MF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 12:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1erKLyVVkGQjctq2VcYck1y9kJsOSAmy8euXP4sxFI=; b=JG+pFHc8aBwya/TrtGrAfIzR0p
 UYaxeqjFjDu26wtRHyKvcXDigWOINDgwpWBbUVnZwv2HFVOSCpIWVRIhjEDLNflO0gwkYrhvR5T0B
 zw2tCWb4kMiP9ezbYbin0brO31GNqUqSG6bTW8l3RwnzHQ94ts5G2d4QMhZqe33jPehc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E1erKLyVVkGQjctq2VcYck1y9kJsOSAmy8euXP4sxFI=; b=miprlrbNoIori/9ZUpEIiJnTAD
 i0AyL1UvBUZQk0+PXvjm+vtz6ZADIzqVThX6r7xEDgVL8GPSmOfix9W7sMnvCYd3pUHa73peb22YT
 Cz08JJ7MW5q/HC+lI1o/DzQHStYcBYu2F4stFtd5dx16hEHTsLiiTwbVZmrJwHNBY2RI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hgqF0-000odz-P1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jun 2019 12:44:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E1erKLyVVkGQjctq2VcYck1y9kJsOSAmy8euXP4sxFI=; b=K44JW2sUbtwUllYjEeoBoZXKP
 qpwZG+45pz50vTBjkMikPcqCzbATh/9kKuP9xcGJ7sEAvJKU2lfOgJzOnHTk2Aw/UWrBIX93T7dJ1
 eiSULrHWNpfDAkVATmv35yKsVmni6KnNZIrI6Hk9z4XsTgLuM3pvg3LEOL+QagIwmOAXxJTDU7ElV
 WwS7ABzdVsbHMjemSHU/3TYgMiE/r80EkvLeClJAn8Vt3KhbOcBT3P7bkm+6ZiCegLvdz85iT7z9w
 gDGxVzVLpfrY7zqrCpDD/vnGqcnkR2bpLZ8SJ2ToSZ9UnMbyGk3U00+H/Z4k6UQJx9O1kyHgBs9jY
 Z36trWmBQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hgqEo-00034F-Kp; Fri, 28 Jun 2019 12:44:22 +0000
Date: Fri, 28 Jun 2019 05:44:22 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20190628124422.GA9888@infradead.org>
References: <20190628104007.2721479-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628104007.2721479-1-arnd@arndb.de>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hgqF0-000odz-P1
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
Cc: Eric Biggers <ebiggers@google.com>, linux-kernel@vger.kernel.org,
 Wang Shilong <wangshilong1991@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Qiuyang Sun <sunqiuyang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jun 28, 2019 at 12:39:52PM +0200, Arnd Bergmann wrote:
> Not all architectures support get_user() with a 64-bit argument:

Which architectures are still missing?  I think we finally need to
get everyone in line instead of repeatedly working around the lack
of minor arch support.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
