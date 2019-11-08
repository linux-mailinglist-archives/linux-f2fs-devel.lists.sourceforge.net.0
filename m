Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8610F4064
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 07:31:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iSxoC-0001Qb-Hh; Fri, 08 Nov 2019 06:31:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+829b58a2b74f0bf5023d+5920+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1iSxoB-0001QU-TH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 06:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=GDioyW2HZS9ZG6Eh8vNIMvFuZj
 mrDvFKt0PaRAzDOy+RzrucwsYI1NCSKCEjyzNyfeW+36jXK4eH0IGATV+MOULQV1SULoK/HBfOLML
 kAKwRVC1+ALoozcrWWn3YT/mDxv9ddq7MrTjyt3MPz4+JwNB0DZMtUKiprmnEB04uzHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=JCcfQuifRCDj6mnY+tfSy+t1zb
 IMcIOeVWVMrPZMf89DNZSIeGhpTJQg5oOBmrbAOwRLcaMqoFUtwWlGpg3xQ6Ppf5KyGeW/8NS3sLM
 e5rysfObXyVDsiM4DqaJEQcRnTmsqmti3Co8i558Sa/6PaUYXo8S+bYZx4UtrvCGMw48=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iSxoA-0063fh-JF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 06:31:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=SyaFinVAOJGf26GHxQs4vf52O
 4Ebbqe5EGU6buMJU/ipHuaROeUSOqMIj1u3vHEaOb9l3C8PFAUvNfwxsUnWFOgGsKMU+MK8NpFyT3
 k0VzGAtl03S1xxzg+aKjuJKwmdJ0KYvVpAeZ8rvJt7lqk8HNCimkRAOtFtsNiUb766QBs7FjtTpZ5
 LVGfIe+UhXWzWLU6yoIrXmh2I9c//ZjEpdGxqRnTqByj6whLtwsQxcP/UA6Z3zc8GpRqWbXIWB3ZM
 IFvsnspH1kDVIW+nuRPXT5A8y7PyXe+mnAN7fTyN7X2fT9NUmUSrXib3vT9VYp1BIBP2Oy0vKfsBD
 QRd9nkkzQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iSxo2-0004oZ-5P; Fri, 08 Nov 2019 06:31:38 +0000
Date: Thu, 7 Nov 2019 22:31:38 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191108063138.GC12413@infradead.org>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
 <20191108015702.233102-9-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108015702.233102-9-damien.lemoal@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: lst.de]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iSxoA-0063fh-JF
Subject: Re: [f2fs-dev] [dm-devel] [PATCH 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, dm-devel@redhat.com, linux-scsi@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
