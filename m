Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225C1D5208
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 May 2020 16:42:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZbXr-0003Ma-Kd; Fri, 15 May 2020 14:42:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+e5f7f93d3739a79b60a3+6109+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1jZbXq-0003MQ-HM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 14:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3iIrLwrSNZL+S3txYZ5ooYztJBCNqoUdcfH+RABdtvQ=; b=bnz6WDYTgLuDW2k/dhxgEYhzZu
 aNkerO4Zb6jRU49cGvDmAHom3JxQ6Qz5ekmezwrFmQfqmczSiSD0ZVjjlYa5sG3yj+EKufbLL9Nlp
 u65ImAeW25uBbZSKGb8Teqt/bLcUyDzfJvx42/4pQyoLzo+DwrI7EbgztzOFhcRRpMrw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3iIrLwrSNZL+S3txYZ5ooYztJBCNqoUdcfH+RABdtvQ=; b=GIUrYFr/F0Boq37SHJvtjP0vun
 jK9gRs9qnA3qL8erPVUQ/R0zn18lpSe4BD6h6o5YT80wyMhQaMlaGEy6zNqLiWcFgkt3Gg0TO9tGU
 yYDOtdSX/sGPoaVmAdcjuROnoFHdH5L5DsLpumJmOVs8THP1sYLSnBj5ioEVs4FkvOQs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZbXm-00Bhfu-5g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 15 May 2020 14:42:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3iIrLwrSNZL+S3txYZ5ooYztJBCNqoUdcfH+RABdtvQ=; b=UR/nOTlnhIjsUEaBJZCcE3BngJ
 mfu05i2j+WxKcr7aadUXmtCEMRqOGo8WlZiQcx/CF8O8Rt7VlltOFibGIiO9P22FMxwIm7yBF8pe9
 eEuctwJJMTPdOLuB8TUsI66Z8LbJfV8pRhC6x0MIbl2R5sDpGINXt46eX1O7UBNhHMd1KH7QjKpiZ
 /5Zl8grCV+zYizEQ8IUVoKnDv4so/Q+I9YBcJP6FHitob64xgOTqY8THukAMIu6SoYdmnPlFrqER/
 Sz/OPP9samLEqnBB+HoFo8cCU8Zk0RqWmPgXOuI9l/9nOTkQMdZWW+2MZHgH6F/gb7Upu6y68wMpy
 mKCQoBMg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jZbXc-00040w-57; Fri, 15 May 2020 14:42:24 +0000
Date: Fri, 15 May 2020 07:42:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200515144224.GA12040@infradead.org>
References: <20200514003727.69001-1-satyat@google.com>
 <20200514051053.GA14829@sol.localdomain>
 <8fa1aafe-1725-e586-ede3-a3273e674470@kernel.dk>
 <20200515074127.GA13926@infradead.org>
 <20200515122540.GA143740@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515122540.GA143740@google.com>
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
X-Headers-End: 1jZbXm-00Bhfu-5g
Subject: Re: [f2fs-dev] [PATCH v13 00/12] Inline Encryption Support
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-scsi@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>, Kim Boojin <boojin.kim@samsung.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, Christoph Hellwig <hch@infradead.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 15, 2020 at 12:25:40PM +0000, Satya Tangirala wrote:
> One of the nice things about the current design is that regardless of what
> request queue an FS sends an encrypted bio to, blk-crypto will be able to handle
> the encryption (whether by using hardware inline encryption, or using the
> blk-crypto-fallback). The FS itself does not need to worry about what the
> request queue is.

True.  Which just makes me despise that design with the pointless
fallback even more..


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
