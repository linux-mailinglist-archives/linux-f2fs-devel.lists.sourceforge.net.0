Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC41168001
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 15:20:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j59AR-0003mA-FY; Fri, 21 Feb 2020 14:20:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+b8b070cac54c30a96dd5+6025+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1j59AQ-0003m3-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 14:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LytBCHQtySSQHC//YYsk3cTp1SDQnnhLtWFiulJBZy8=; b=iyAYVpKntmovUa0FN1Zvt2jH/r
 18DHFvRu4cEP1xUGERB1ihOtmTl8nVxjs0bxh+GKd//dNk2+sLkjQGfx3mJOIltP3OzcePxsvQGQi
 QBpXuRgjKxd7jRq9kwxoZ0K97S5+UtKIN1pP5qdbwHTjEHlZAttCg9+YSDMfT/lWocw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LytBCHQtySSQHC//YYsk3cTp1SDQnnhLtWFiulJBZy8=; b=YPSTAkiE9+Twc7dIRfFrQAFkYL
 wcX+tOx5O2VjPxRnT3CTXuHsZcduSR+WkHOINkyutaVEIDq7ZYyZPCdoAXsQTMKMgOvCZyEXHHXp/
 hhcQIDrjpPob3lLM8gv6Mh6eG+szgtiAZZkplw1ytKdjXjKuvpcqWTtt8BM40myxjaN8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j59AN-003N4w-QM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 14:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=LytBCHQtySSQHC//YYsk3cTp1SDQnnhLtWFiulJBZy8=; b=DZyV9UxLlQ1dXSvWlM5ACgoz8S
 66UCzAs+/vDp19vCMf/XiGjrgq/QpQ5MSmVm/cq7+gbhKX2cMIX1taXRr/28lPIKdmzmh69nv04Ah
 jwc9CKCejXv0Yp4mbSM/q3/tDIhqtMMSmNl9pu3s8tg24ZdjHzYMMgLs+rc7QJw5HNC07Z3yyMc8F
 LrWSlmph5HCQzhVD6l+1jhZTBzUgoCltUXUStnxF/6+NXmWhqg6fe/7W9ZhC1tQlUPJRTzQ06pK5k
 wVCnFwUDhQ7pTnQaf3ggXDyfYcZZNw61QTbu1cIlLeHfVXYoXnrImvysZ5JDQhd9ynz72vOhOetCJ
 eJPdKzew==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j59AA-0005Lk-DL; Fri, 21 Feb 2020 14:20:18 +0000
Date: Fri, 21 Feb 2020 06:20:18 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200221142018.GA27636@infradead.org>
References: <20200108184305.GA173657@google.com>
 <20200117085210.GA5473@infradead.org>
 <20200201005341.GA134917@google.com>
 <20200203091558.GA28527@infradead.org>
 <20200204033915.GA122248@google.com>
 <20200204145832.GA28393@infradead.org>
 <20200204212110.GA122850@gmail.com>
 <20200205073601.GA191054@sol.localdomain>
 <20200205180541.GA32041@infradead.org>
 <20200221123030.GA253045@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221123030.GA253045@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j59AN-003N4w-QM
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Inline Encryption Support
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-scsi@vger.kernel.org,
 Kim Boojin <boojin.kim@samsung.com>, Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Feb 21, 2020 at 04:30:30AM -0800, Satya Tangirala wrote:
> Hi Christoph,
> 
> I sent out v7 of the patch series. It's at
> https://lore.kernel.org/linux-fscrypt/20200221115050.238976-1-satyat@google.com/T/#t
> 
> It manages keyslots on a per-request basis now - I made it get keyslots
> in blk_mq_get_request, because that way I wouldn't have to worry about
> programming keys in an atomic context. What do you think of the new
> approach?

I'll try to review it soon, thanks!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
