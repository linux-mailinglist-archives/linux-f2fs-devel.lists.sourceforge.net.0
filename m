Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52913C884C1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 07:41:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KnnIq7OPOpnNA1MpLl7zj5M4Zp0uEPVpUZxkZmMzTA=; b=KGw1pakPOQOA0cgtnRdUlRV0kd
	NokXbSvI75SDUerwmQolA8aeTSkVD0Uuc3Z88iVAZA7Yd96iZx6Ca9YpUqAJFpuTN46Sx2rw4Do0m
	faRO38UjzDq+Y4K6YDxK9tR+c4hA5xy8+PFVaL9P24pXSfzJEYD42B6j+htwFcfBQms8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vO9Da-0001hw-Qj;
	Wed, 26 Nov 2025 06:41:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+3e1e1a7ad219de85a036+8130+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vO9DZ-0001hq-14 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 06:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MoIpT92AR0jYhRT/he4nwYsbYANRrOzAz0xRMUECV50=; b=grSLw9E0tjMsudQs4Cxl0eiKmd
 uh55U8IFG+fnGuN8NZJMo0luJhDFX+OlpbV9vaNvBapb4ek0w/Lfjuh5yKzhdZ0s8zmt656rTicfH
 uDol7ERyPHk4E+TVH3bYUq4YJKn2LJV/wvk2O8amFW/ywpx7BMJhGLQSK2hnNxZCzoFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MoIpT92AR0jYhRT/he4nwYsbYANRrOzAz0xRMUECV50=; b=kHjNuePYJgLD0PqSCsEvMdC0Pp
 G5rqKKHBd7Z+GcX7C1dV9GnvFDUP0XwWG7Q4Gh4e0ngSVOMjehuQK2KCFWv9iiIgDs8hUHVmr5x6b
 pXwTEcHCq8E6CXX827um6auFBZaMiO5UoKdRDfm/amZnu0E1o+/zVbjTnItcFxVcG7gM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vO9DY-0007PA-PU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 06:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=MoIpT92AR0jYhRT/he4nwYsbYANRrOzAz0xRMUECV50=; b=x4d7s5+e7z2Cs4Qly6l0S+LVQZ
 UOwJ134Qob6aIW1h88N7ivRwC+SfLGFP24EbVOtLwr9evwnM41+N48pHdKB07TKKwSeTNl48eHp7r
 xeFRpmKuer02A2waepad6RTqWEU8FXMmAO8J48EaYTQ/29TgwJgSV0Ibuda5AtP0Rn5Lf0wFI0jcW
 4j/WkeBqG91v5CxJQxWSeCd0L/s/P9YNTcZdtyHEhIO01AHcecDgvR4bG4MBXipDEyj+jKy/u45Tp
 eSW0YJLhqieRGeb2d6ZTK2omgpHQ/FEyl8KhDoC6rJSwn/pghdGphNs7z/2q4BItv4Pod9J15OJwl
 87zRildA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1vO9DO-0000000ES8y-0GG5;
 Wed, 26 Nov 2025 06:41:22 +0000
Date: Tue, 25 Nov 2025 22:41:22 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <aSahEs04brIrBcue@infradead.org>
References: <20251126061437.658896-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126061437.658896-1-chao@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Nov 26, 2025 at 02:14:37PM +0800, Chao Yu wrote: >
 Previously, __blkdev_issue_discard() will always returned valid bio, > after
 commit e8b4869bc78d ("block: add a blk_alloc_discard_bio helper" [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1vO9DY-0007PA-PU
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to check bio after
 __blkdev_issue_discard()
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
Cc: jaegeuk@kernel.org, stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Nov 26, 2025 at 02:14:37PM +0800, Chao Yu wrote:
> Previously, __blkdev_issue_discard() will always returned valid bio,
> after commit e8b4869bc78d ("block: add a blk_alloc_discard_bio helper"),
> it can return bio w/ NULL value, which may trigger panic or warning
> in __submit_discard_cmd(), let's fix to check bio instread of return
> value after __blkdev_issue_discard().

It can only return blk_alloc_discard_bio if the the gfp_mask doesn't
allow sleeping (which isn't the case here), or nr_sect is zero,
which I hope is also not the case as __submit_discard_cmd would
run into various other problems.  So no, I don't think this is
patch makes any sense.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
