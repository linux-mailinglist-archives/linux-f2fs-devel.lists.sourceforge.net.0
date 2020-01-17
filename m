Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 656D31409C3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jan 2020 13:32:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1isQnI-0004Wh-Kz; Fri, 17 Jan 2020 12:32:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+99029fa5cb4ba764ed81+5990+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1isQnG-0004WB-1x
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 12:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZrBKTkYJeqcb/cXGamX396QKjxFmliww7OTt1Ylid8=; b=mrzcc9IXOro1oPFM8edDsskbqW
 lI2pKQFq0q7maVXjEAfXZVDsLeJ0dRRYEWZyIdt5ZcPyAUqdULWrid2ffnhcQcb2NM9HLBx+D0WRi
 AyBpB6xyHnb40bM70TBwscxlqdKFvt5FQxQJkOATstyhajMObPD+4aT5hP5vukO0oUA0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nZrBKTkYJeqcb/cXGamX396QKjxFmliww7OTt1Ylid8=; b=SHhgZy3JfZ4+cyfFZMKyCVHnG/
 ASYfE0aSzAygo+NoIYM1uKpTxxzsP1ZVFMiPE4vAK409Og90ofI+sBuEntkWs45oCW5vPnIftzs04
 qE97wwCQCj4OAFx/NTdTh7lFVJNQHPUxvSiQ6NzW4Z+sKV/7dwQHbnJgX0KWPbCsMCBQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1isQnE-008C09-SO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jan 2020 12:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nZrBKTkYJeqcb/cXGamX396QKjxFmliww7OTt1Ylid8=; b=hiJtxfwjhqJa9nokZWYLYX7OI
 JRfsiyJjs5tsU8pvG6Yh3cLx3vmXA729b5fQ7PMcI+nPi9x4rqNa1RRLmQdwmrZExc11yVHoGCGZj
 +RzNKQoyfueuOTnuZvIoKfoThLiNl+srvy7F3ZZj5+ghKIL8zRRp8Du5Ka/vJgh8dBBj8ZL5MU4Rk
 vPtJFort+fWwLuty8vXNdf4Ta2IobUr5txSUbfaiOwHkZDpF8RTymGAS+AcsWs88pxnTqiVUb9gHG
 Ky4u+cjUGLIzLLBxSjwRvbkFpp5MUNbw01aXQ9cAV9uJGHAYL+a3Etebo8EUWilSvtc0IRIhFcwax
 m34ReJbiw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1isQn7-0002E1-OF; Fri, 17 Jan 2020 12:31:57 +0000
Date: Fri, 17 Jan 2020 04:31:57 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200117123157.GA8481@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
 <20191218145136.172774-5-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-5-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1isQnE-008C09-SO
Subject: Re: [f2fs-dev] [PATCH v6 4/9] scsi: ufs: UFS driver v2.1 spec
 crypto additions
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
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 18, 2019 at 06:51:31AM -0800, Satya Tangirala wrote:
> Add the crypto registers and structs defined in v2.1 of the JEDEC UFSHCI
> specification in preparation to add support for inline encryption to
> UFS.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  drivers/scsi/ufs/ufshcd.c |  2 ++
>  drivers/scsi/ufs/ufshcd.h |  5 +++
>  drivers/scsi/ufs/ufshci.h | 67 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 72 insertions(+), 2 deletions(-)

I'd merge this into the next patch.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
