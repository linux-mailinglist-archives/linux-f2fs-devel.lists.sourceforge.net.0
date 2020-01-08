Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEAC1344F7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jan 2020 15:29:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipCKn-0008CZ-7M; Wed, 08 Jan 2020 14:29:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+7810ff36a5d14e23d204+5981+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ipCKl-0008CR-OS
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 14:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5Zp5DraPm2b4G9FdcZzJFZL/5Lu3ash5oRZzFlJrrQ=; b=Oe83Rjir5bKnX6MqCzvGCoezEk
 0+5UubFLL/pPQ5yonPkZrv+OM6NioAIuIyt2RrcNGaMYRb9P3YgnC+l2Yknjp/t4loSh/+BV4VD18
 pj+RkOG8/eTokmvEapT4MhQG5JGVSR7YU7O4+e0KHiluS2s+nbauUXpfh2aG+of1P28Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y5Zp5DraPm2b4G9FdcZzJFZL/5Lu3ash5oRZzFlJrrQ=; b=VQ56aTnHmpqyMQ8Sfajm4LJbz0
 iToOuW6SpBVRijoEuVapcnuZ6xF6uBVTFXHfUpULIaO7aO5gpbMu6nAWzQcBNsvYXGFJJ3FqvE4Or
 bpjlCTeCKMCuzYUo1IievFDueE/BY0KeJ3xkKWHkYKXHcml7+zwafJkWVnCRH90Uwcsc=;
Received: from [198.137.202.133] (helo=bombadil.infradead.org)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipCKa-00DLwV-1K
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 08 Jan 2020 14:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y5Zp5DraPm2b4G9FdcZzJFZL/5Lu3ash5oRZzFlJrrQ=; b=ZeMiKnCPJGvzDo+O/UfvlAu/N
 sZUrBeXq9/DJgejEzJDxzf/u0MHMTCjzgqOmsbdOmsplpjSF+MkuW0DiAqEdNsTqfoUraHxNwAXbk
 i+aGIqK/w63kPTUn31L2QobgAZ2sdtvimXrYJLJ3R3ImQW6+o9UhbZ9Nz8dc9tG5TrZO/DXYVaW8/
 BDhX8Dsq/AtEbptlxAGgQ/JUdjA1Ym9PIeV+/4fkGukWoSaaYPAK+crtDFdUWjqOcbtQtFkZAQ4Ep
 oC76mAnRDykgejw3xuIYmk2Ev4MAzNf5BYpNLIfQTElSy/Orqb2coN+t9D2vtyZkweJH/95p4VxeN
 pMzqMtnIA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ipBy8-0008I6-HI; Wed, 08 Jan 2020 14:05:56 +0000
Date: Wed, 8 Jan 2020 06:05:56 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200108140556.GB2896@infradead.org>
References: <20191218145136.172774-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218145136.172774-1-satyat@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipCKa-00DLwV-1K
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I haven't been able to deep dive into the details, but the structure
of this still makes me very unhappy.

Most of it is related to the software fallback again.  Please split the
fallback into a separate file, and also into a separate data structure.
There is abslutely no need to have the overhead of the software only
fields for the hardware case.

On the counter side I think all the core block layer code added should
go into a single file instead of split into three with some odd
layering.

Also what I don't understand is why this managed key-slots on a per-bio
basis.  Wou;dn't it make a whole lot more sense to manage them on a
struct request basis once most of the merging has been performed?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
