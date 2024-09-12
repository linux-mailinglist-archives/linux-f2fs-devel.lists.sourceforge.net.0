Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C32976A2E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 15:13:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sojdR-00072j-2V;
	Thu, 12 Sep 2024 13:13:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sojdL-00072Z-EZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5EXSZtRkQCw4Qi3kR+Uic0HAaSvYUloQ1763G4sdtoQ=; b=l2/pHhI6fOy8o1teir9Hu33gZ4
 AUFmfTyKgaWcO2jspMs6UZoqyZMMQ5DEum27NSlA0NJidBfzeQQYGGRDPKvbDIOknhLIYLY4rEQh2
 GjMMhFh+a77+KSmQ276YaKdDFtihwpAXR+aJ3s4sAFNMBBc9dBjHsEUNaa5VFla7IuUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5EXSZtRkQCw4Qi3kR+Uic0HAaSvYUloQ1763G4sdtoQ=; b=D578My2Lncm3l5B6VExSBlHMyk
 v3PpvIYbB2n3uzfXJuMF2IXd+0TgW65qnuKdV9EpEeGN3PuQZD3P6ORLrhvJeMJiJmPbPFyXzhyeR
 AMoKecDeg4Pi8zGJc7Xb/uQZC2UoPyWFP5p0u9dDKoLdMxB4UZVBeO5rEz6vkbTuzg74=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sojdL-0007jP-2A for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 61F9A227AB7; Thu, 12 Sep 2024 15:02:36 +0200 (CEST)
Date: Thu, 12 Sep 2024 15:02:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240912130235.GB28535@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910150200.6589-5-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 10, 2024 at 08:31:59PM +0530,
 Kanchan Joshi wrote:
 > From: Nitesh Shetty <nj.shetty@samsung.com> > > The incoming hint value
 maybe either lifetime hint or placement hint. .. may either be .. ? 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sojdL-0007jP-2A
Subject: Re: [f2fs-dev] [PATCH v5 4/5] sd: limit to use write life hints
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
Cc: vishak.g@samsung.com, jack@suse.cz, linux-nvme@lists.infradead.org,
 James.Bottomley@HansenPartnership.com, hch@lst.de, sagi@grimberg.me,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>, linux-block@vger.kernel.org,
 viro@zeniv.linux.org.uk, kbusch@kernel.org, jaegeuk@kernel.org,
 bvanassche@acm.org, axboe@kernel.dk, brauner@kernel.org,
 martin.petersen@oracle.com, jlayton@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, chuck.lever@oracle.com,
 linux-fsdevel@vger.kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 10, 2024 at 08:31:59PM +0530, Kanchan Joshi wrote:
> From: Nitesh Shetty <nj.shetty@samsung.com>
> 
> The incoming hint value maybe either lifetime hint or placement hint.

.. may either be .. ?

> Make SCSI interpret only temperature-based write lifetime hints.
> 
> Signed-off-by: Nitesh Shetty <nj.shetty@samsung.com>
> Signed-off-by: Kanchan Joshi <joshi.k@samsung.com>
> ---
>  drivers/scsi/sd.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> index dad3991397cf..82bd4b07314e 100644
> --- a/drivers/scsi/sd.c
> +++ b/drivers/scsi/sd.c
> @@ -1191,8 +1191,8 @@ static u8 sd_group_number(struct scsi_cmnd *cmd)
>  	if (!sdkp->rscs)
>  		return 0;
>  
> -	return min3((u32)rq->write_hint, (u32)sdkp->permanent_stream_count,
> -		    0x3fu);
> +	return min3((u32)WRITE_LIFETIME_HINT(rq->write_hint),

No fan of the screaming WRITE_LIFETIME_HINT.    Or the fact that multiple
things are multiplexed into the single rq->write_hint field to
start with.

This code could also use a bit of documentation already in the existing
version, but even more so now.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
