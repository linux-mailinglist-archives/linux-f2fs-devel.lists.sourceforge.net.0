Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E5E97B812
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 08:43:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqoPB-0007fS-49;
	Wed, 18 Sep 2024 06:43:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sqoP7-0007fJ-59
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 06:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mgkp1hVF8HPPXGHzeffL9DY1/PZ+CgypD5IansUpcKo=; b=dLiU+2OKBzXTsUA2kRj6AlFunU
 l9rcxZy/uMW9efWjryiKzxj9a+Kzd2m4/dRptmHqDyvnHG464ZXlMQZbdzDaTBjYYF7ukObEcsf8J
 o8pY4WAGZQJ9on2Kq8BSMmgd2jaCctlx71XwNLIf7kE/cgdHjiCL3lyL7C0xpT+OGVbs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mgkp1hVF8HPPXGHzeffL9DY1/PZ+CgypD5IansUpcKo=; b=Xno0U9AOxl72+puA71Zu7v90mN
 by90P4ps1sKNGboHIGckfPNWQqNl95vlwZHWOCuuF5LHcPjMXdbG7Qwx+He+qaiKC1vqxzH43Ev/x
 5UM3ISEdnmTXYWHZgXVK5AISXJ/8ffG0yFuRvsGGe2kg6744Go9DM8lN0DdE6h98lGL0=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqoP6-0005iA-Ri for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 06:43:09 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0186F227A88; Wed, 18 Sep 2024 08:42:59 +0200 (CEST)
Date: Wed, 18 Sep 2024 08:42:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240918064258.GA32627@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
 <20240917062007.GA4170@lst.de>
 <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > > If the device (or file system, which really needs to be
 in control > > for actual files vs just block devices) does not support all
 256 > > we need to reduce them to less than that. The kernel can [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1sqoP6-0005iA-Ri
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
 James.Bottomley@HansenPartnership.com, Christoph Hellwig <hch@lst.de>,
 sagi@grimberg.me, linux-scsi@vger.kernel.org, gost.dev@samsung.com,
 Nitesh Shetty <nj.shetty@samsung.com>, linux-block@vger.kernel.org,
 viro@zeniv.linux.org.uk, kbusch@kernel.org, jaegeuk@kernel.org,
 bvanassche@acm.org, axboe@kernel.dk, brauner@kernel.org,
 martin.petersen@oracle.com, jlayton@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, chuck.lever@oracle.com,
 linux-fsdevel@vger.kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> > If the device (or file system, which really needs to be in control
> > for actual files vs just block devices) does not support all 256
> > we need to reduce them to less than that.  The kernel can help with
> > that a bit if the streams have meanings (collapsing temperature levels
> > that are close), but not at all if they don't have meanings. 
> 
> Current patch (nvme) does what you mentioned above.
> Pasting the fragment that maps potentially large placement-hints to the 
> last valid placement-id.
> 
> +static inline void nvme_assign_placement_id(struct nvme_ns *ns,
> +					struct request *req,
> +					struct nvme_command *cmd)
> +{
> +	u8 h = umin(ns->head->nr_plids - 1,
> +				WRITE_PLACEMENT_HINT(req->write_hint));
> +
> +	cmd->rw.control |= cpu_to_le16(NVME_RW_DTYPE_DPLCMT);
> +	cmd->rw.dsmgmt |= cpu_to_le32(ns->head->plids[h] << 16);
> +}
> 
> But this was just an implementation choice (and not a failure avoidance 
> fallback).

And it completely fucks thing up as I said.  If I have an application
that wants to separate streams I need to know how many stream I
have available, and not fold all higher numbers into the last one
available.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
