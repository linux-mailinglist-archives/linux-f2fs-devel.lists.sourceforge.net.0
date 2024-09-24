Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 035AF984218
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 11:29:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1st1ql-000277-Sp;
	Tue, 24 Sep 2024 09:28:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1st1qk-000270-2s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 09:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5m4RQ4VNBFMhAoRV2E/TBCUs2t7JhJdQ63Itw1dMMK4=; b=bMybGGixSimv1SfA7Kl/ea+L3y
 7/E/WBj1LUM6ytr7hOraYuMXSlWqJE7n32lwqfkfvmIUVegXvhhTXdhCcKuZfTicw2VRW8GONDYg3
 9GGSODxFtA9437TSI+OJU0zDDtAHhsBl1HKkborUwfpSOs3fygQ60zK9lfVMqPq7OU6E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5m4RQ4VNBFMhAoRV2E/TBCUs2t7JhJdQ63Itw1dMMK4=; b=X548n47m7e4j8L+TXaDe/RK8Dw
 6BtftDN7pLgruO3hzVH3Ixoi6bc+bcDWEW5W4o3GmmL6qpyA2z5PEu0A4I4Qqi4iRaRmgZnPBVl+c
 BtsJDAVdsXrKz5Q5EqwTEneYS9mH6FosMWFRQmsG9p8RLGxtsnBl2YloTbMHR2MbHCLY=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1st1qh-00069I-VZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 09:28:49 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id EE8A1227A8E; Tue, 24 Sep 2024 11:28:32 +0200 (CEST)
Date: Tue, 24 Sep 2024 11:28:32 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240924092832.GA26208@lst.de>
References: <20240912130235.GB28535@lst.de>
 <e6ae5391-ae84-bae4-78ea-4983d04af69f@samsung.com>
 <20240913080659.GA30525@lst.de>
 <4a39215a-1b0e-3832-93bd-61e422705f8b@samsung.com>
 <20240917062007.GA4170@lst.de>
 <b438dddd-f940-dd2b-2a6c-a2dbbc4ee67f@samsung.com>
 <20240918064258.GA32627@lst.de>
 <197b2c1a-66d2-5f5a-c258-7e2f35eff8e4@samsung.com>
 <20240918120159.GA20658@lst.de>
 <edcbf69e-9ae9-06df-60c0-47393371fcd8@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <edcbf69e-9ae9-06df-60c0-47393371fcd8@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 24, 2024 at 02:54:51PM +0530,
 Kanchan Joshi wrote:
 > FS managed/created hints is a different topic altogether, > and honestly
 > that is not the scope of this series. That needs to be thoug [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1st1qh-00069I-VZ
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

On Tue, Sep 24, 2024 at 02:54:51PM +0530, Kanchan Joshi wrote:
> FS managed/created hints is a different topic altogether,
> and honestly 
> that is not the scope of this series. That needs to be thought at per-FS 
> level due to different data/meta layouts.

No, it is not.  If you design an API where hints bypass the file
system you fundamentally do the wrong thing when there is a file
system.  No one is asking to actually implement file system
support in this series, but we need to consider the fundamental
problem in the API design.

And yes, the actual implementation will be highly dependent on the
file system.

> This scope of this series is to enable application-managed hints passing 
> through the file system. FS only needs to pass what it receives.

Which fundamentally can't work for even a semi-intelligent file system.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
