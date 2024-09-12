Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C383D976A2D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 15:13:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sojdT-0008K8-78;
	Thu, 12 Sep 2024 13:13:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1sojdQ-0008Jy-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pX/01c0Yoa9HfJRu/CnrO5GFbDkJs+9Nfn7vHKZ/1uk=; b=D32KWv2kK3WBp9iL3hFqAHxuVz
 sNVxFm1sZrv8BlAGb2od+hTSLr7UrQmzRj7OeQHsJqJwgaxGk4eng37ynymewwnTpk27G9PB7EH6+
 fWvlAV8QUK+pUzoP73krI6Xio/Vcqn/0jkU12RDfUHrUbxkpN17RuLDnD+UnYUj7bzfc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pX/01c0Yoa9HfJRu/CnrO5GFbDkJs+9Nfn7vHKZ/1uk=; b=mQUFSHf2wALEU2rDePmtT1UfA3
 7LCg/6J35ZB9JJDet+s4UvIxH0rJp1i5N2PtLOpGyPNINSNWFpUL9HDqS7zDacw85Dp7A5KsqW8gM
 JUWEimXaasXJijY/v6yKowlzbNgT+j27rN4mwRQDc6OI8LjkJnHLpZa4dSZQH7sDGzSE=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sojdQ-0007jd-6c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:13:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B2EFE227AB5; Thu, 12 Sep 2024 14:54:38 +0200 (CEST)
Date: Thu, 12 Sep 2024 14:54:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kanchan Joshi <joshi.k@samsung.com>
Message-ID: <20240912125438.GB28068@lst.de>
References: <20240910150200.6589-1-joshi.k@samsung.com>
 <CGME20240910151048epcas5p3c610d63022362ec5fcc6fc362ad2fb9f@epcas5p3.samsung.com>
 <20240910150200.6589-3-joshi.k@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910150200.6589-3-joshi.k@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Sep 10, 2024 at 08:31:57PM +0530,
 Kanchan Joshi wrote:
 > F_GET/SET_RW_HINT fcntl handlers query/set write life hints. > Rename the
 handlers/helpers to be explicit that write life hints are > b [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sojdQ-0007jd-6c
Subject: Re: [f2fs-dev] [PATCH v5 2/5] fcntl: rename rw_hint_* to
 rw_lifetime_hint_*
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, brauner@kernel.org,
 jack@suse.cz, sagi@grimberg.me, martin.petersen@oracle.com,
 gost.dev@samsung.com, jlayton@kernel.org, vishak.g@samsung.com,
 linux-nvme@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net,
 James.Bottomley@HansenPartnership.com, linux-fsdevel@vger.kernel.org,
 chuck.lever@oracle.com, javier.gonz@samsung.com, viro@zeniv.linux.org.uk,
 linux-scsi@vger.kernel.org, kbusch@kernel.org, jaegeuk@kernel.org, hch@lst.de,
 bvanassche@acm.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Sep 10, 2024 at 08:31:57PM +0530, Kanchan Joshi wrote:
> F_GET/SET_RW_HINT fcntl handlers query/set write life hints.
> Rename the handlers/helpers to be explicit that write life hints are
> being handled.
> 
> This is in preparation to introduce a new interface that supports more
> than one type of write hint.

Wouldn't it make more sense to stick with the name as exposed in the
uapi?  The same minda applies to the previous patch - in fact IFF we
decide to do the rename I'd probably expect both parts to go together.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
