Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E59540AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2024 06:37:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1seoi6-0007ug-EJ;
	Fri, 16 Aug 2024 04:37:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+e28816062944b636f5b1+7663+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1seohz-0007uV-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 04:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=ibDQ1rVjfHGw/RnvN70yiErIZY
 /FObRpa+FuAHNihlnzo2QgW2ds9NN/A5iH5/hl0OftSDFxF8vysWKwaPK8vLyMJFYnG1UNl6Mmswe
 lOvGInoKZDcX/F/F/bqHkSzPM4rmrpD1Tt0HlgVon5wRzLBxkCKv8FP1C3ogj5gCXZCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=N+0gz8k63i8QFQ8pQL5gwu9tBR
 HzfOczd3+4hnqFDj8tHk0INInVaMHkHtVzF3ieHa0q/pAhqmQBL6RqBQqOBWeibHTOYcjeWcLY7WI
 q79hlxV4HYa3XHTfm1zZvTvNiLf6XTK8t9tmXYIyuX5/NWtcUtRJfQzRSbTTCctHAH3c=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1seohy-0000XQ-Cr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Aug 2024 04:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=paX6q5qqg9wcQ4CQy6sGb3UsE4
 wRq8bgDj6NIKYS5QojMDdVeV9JgmtBVYKX5SidRybriylLRktUj95TF9hcnJO9rdUW+Y9Y7QdV6Yk
 ORmtHo8gHHVyuTtpkfRW4W2u4t0wyPDOl6CmNta9E1AwvwG9F5RbHRrIQOdt+fdsUoexEGpd9jFir
 MpnTxNatWUdWbUWLoBokFMutSP1qQd1mZRb+vODs/zQnDZoXCVxezEkXYawNXUjyIZXMlR9hWQHgQ
 G7/QYx10XNvWkZg2m1jEw876rII9QydQ43iaoJkmaHDD2lhpd+3cxMwQ/q+pTfukg8ujsDPNiiij6
 hj26f+Ug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1seohs-0000000Bmlp-2Rb0;
 Fri, 16 Aug 2024 04:36:56 +0000
Date: Thu, 15 Aug 2024 21:36:56 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <Zr7XaCM4WstvTrTz@infradead.org>
References: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240816040703.736887-1-shinichiro.kawasaki@wdc.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good: Reviewed-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1seohy-0000XQ-Cr
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: check discard support for
 conventional zones
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
Cc: Christoph Hellwig <hch@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
