Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFED52CC74
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 09:05:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nraEB-0002Da-0y; Thu, 19 May 2022 07:05:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+015a865715d1323b7cbd+6843+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1nraE8-0002DT-PG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 07:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=itWA/tfqRbBdgOj1sL0nnjn0p9
 r0iE423fCZ6KE3PNHH/cpQbZdYs5ee25gRQ7dbbNVPt6aOJmyAZRljqNlI4CR0G3csvcQQeIBa8PS
 zHUY2Z1FHiU+5rG+JfwOC+yQ77t34iKUGQl/XzZMgYsPlm00fzRX7M6lRsalx1ePpltI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=SPOPU5hZkIDL9/4uBHw/35MiKb
 VrRGVNvs/gClnqx0PN051E8zuhJ2e435MXheMJBv28Nu+NHGScLu3CVAMloABNNgLH6cqjkATlG9q
 atH9VMCoyhzZ7QuudpB9jf0kYkZVn9nppR/LSQTk6yJTgH9uaxqhGPGS+GqhQWy28JJU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nraE6-0008IX-1e
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 07:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=M7NmYC/Iylm9myghHwqILim55SAUt9QrM+UZYk0eJlw=; b=Y8eCw9I+3GvyTeVsRu3iF7t/os
 G5K0v/pABcPNYA/V0ySZ5E9fkOtBGPudPc7DriUmkcsyHFP8EsG9WxdN9TewBjWVOWV10Jxsbf/UN
 Kf3GgIakz9FIVHnUru632fnhkjetHZQYyPHNbFFyQ7cAMakjsZLeTkuapE48frmxWX2ocElecbgnJ
 JAZYj+qxEJPzjib8lR5dFxutcI0flYsVohHR/3ID1f0UiX+dAPFmPTCf4eqqurs0hfQvWqpQvlPRS
 16P3nvlTZBXQnBV4/y+ZgZ+hbxzxdE1V5qysznl2OlcRjhL3slS9C/QSVMbKHfsEdm7X7Iazzwm5z
 u4uWYH6g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nraDs-005QR0-D6; Thu, 19 May 2022 07:05:24 +0000
Date: Thu, 19 May 2022 00:05:24 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YoXsNDG/WMbCzz0x@infradead.org>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220518235011.153058-2-ebiggers@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Looks good: Reviewed-by: Christoph Hellwig <hch@lst.de> 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nraE6-0008IX-1e
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
