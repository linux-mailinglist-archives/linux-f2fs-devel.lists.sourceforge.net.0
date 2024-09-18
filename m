Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB8497BBDC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 14:02:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqtNw-0000uj-NS;
	Wed, 18 Sep 2024 12:02:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sqtNv-0000uc-2O
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 12:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sLzKTKWg3g0du0egesNyuK5+3sKuXjEkiax0B9e4gJs=; b=e8w4aVHXbxDiEgB9Bx4l1kSJr2
 Bx78KEb6Arq87H2Bw2qOvs6l6S/W5GDVoYQ2seZntw71UpkzzQd+R+C9n1vk2d8hO5KtM+RDk8opH
 aLg43Y59PRdcRJ3w5umRvdpvEeRIbIjrN+0vc63pymoRpBgDOX2MQOxdrpan2NClkNSY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sLzKTKWg3g0du0egesNyuK5+3sKuXjEkiax0B9e4gJs=; b=bBzTntKqUBe4n+iUK7x0Ht66RS
 l8k0WuhEPrIQOPuRECNKl2/vIqEMlsapoZ/re32X7JaodHKK0qlw0o+tNiSz4Ao1Yr+4/Z7CQ97c+
 +E+r9ILxk1XzknbESdEWf4dcczxIzm1p1Fjy4IlodvusHrnt8cq08scoWbiT+xvXI3/U=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqtNt-0003Ef-Eq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 12:02:14 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6B102227AAD; Wed, 18 Sep 2024 14:01:59 +0200 (CEST)
Date: Wed, 18 Sep 2024 14:01:59 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240918120159.GA20658@lst.de>
References: <CGME20240910151057epcas5p3369c6257a6f169b4caa6dd59548b538c@epcas5p3.samsung.com>
 <20240910150200.6589-5-joshi.k@samsung.com> <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
 <20240917062007.GA4170@lst.de>
 <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
 <20240918064258.GA32627@lst.de>
 <197b2c1a-66d2-5f5a-c258-7e2f35eff8e4@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <197b2c1a-66d2-5f5a-c258-7e2f35eff8e4@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 18, 2024 at 01:42:51PM +0530,
 Kanchan Joshi wrote:
 > Would you prefer a new queue attribute (say nr_streams) that tells that?
 No. For one because using the same file descriptors as the one used to set
 the hind actually makes it usable - finding the block device does not. And
 second as told about half a dozend time for this s [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sqtNt-0003Ef-Eq
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

On Wed, Sep 18, 2024 at 01:42:51PM +0530, Kanchan Joshi wrote:
> Would you prefer a new queue attribute (say nr_streams) that tells that?

No.  For one because using the same file descriptors as the one used
to set the hind actually makes it usable - finding the block device
does not.  And second as told about half a dozend time for this scheme
to actually work on a regular file the file system actually needs the
arbiter, as it can work on top of multiple block devices, consumes
streams, might export streams even if the underlying devices don't and
so on.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
