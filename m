Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B8BDD07F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 09:29:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0pDgZYtux+SMaonubh3Xjb76FPJwE9fUBEtf2xRxnrg=; b=ZBgX6rta/LCiD9jaPildHWWHmM
	WInRLRuPRihsb7c9jTh5ZfKr2Eymi33zgS1i4FSB4LtEg6Y3xHMAoqtLS2vWlsW8K5qPEJTJFIHbK
	e0gSXqXrmwbOBCeXYGmBjR6qAQH2Ug887osZ1Q5gxRNSwnUsD9ak6uP0jAnhmZqBXGPQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8vwx-0002Eg-TE;
	Wed, 15 Oct 2025 07:29:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1v8vws-0002EG-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 07:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jqV4kzoi87kR6CjE870xFxBQep7fEAX3ZGebZY8SQ4=; b=MtcVAD2fcK2o2cEEF0v/tNSRkg
 Nmpl6tn06gqWJeF2dN/NXAAflg4Gieyh3umeWO8LDKdXoHX/sspJULd2SS64WManklcAk1z8Zz0jw
 a9PieeCNdqMyqA61paR5dDRV6tu/Y7bE8Z1k6jUtqy33KM9qKyGkJeB4LS0S9GNC1w74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/jqV4kzoi87kR6CjE870xFxBQep7fEAX3ZGebZY8SQ4=; b=RnwJ49WpRAFGFjtl5nFnz3DnB8
 Ru1r7pItofdDKDA8VZVrXFQL+S6wBgfMuLBzOpl00/mHbgtSIRxnnTg922K9kKIHrU3o77BJVNnG7
 JH1H1f0XgvKClX5AERpQd+/teMZwzkR6+MB1WQYcQQsdrGi/apbn//zXdigU8KWpXQ1o=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8vws-0004I2-UG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 07:29:27 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 66DAC227A88; Wed, 15 Oct 2025 09:29:12 +0200 (CEST)
Date: Wed, 15 Oct 2025 09:29:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20251015072912.GA11294@lst.de>
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121102epcas5p3280cd3e6bf16a2fb6a7fe483751f07a7@epcas5p3.samsung.com>
 <20251014120845.2361-10-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-10-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Oct 14, 2025 at 05:38:38PM +0530, Kundan Kumar wrote:
 > Add support to handle multiple writeback contexts and check for >
 dirty_exceeded
 across all the writeback contexts. As said last time, please do a preparation
 series with all these cleanups for file systems poking into writeback
 internals
 that can go in ASAP and sets the stage for multithreaded writeback. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1v8vws-0004I2-UG
Subject: Re: [f2fs-dev] [PATCH v2 09/16] f2fs: add support in f2fs to handle
 multiple writeback contexts
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
Cc: ritesh.list@gmail.com, vishak.g@samsung.com, jack@suse.cz,
 djwong@kernel.org, amir73il@gmail.com, david@fromorbit.com,
 gfs2@lists.linux.dev, linux-mm@kvack.org, clm@meta.com, hch@lst.de,
 dave@stgolabs.net, agruenba@redhat.com, miklos@szeredi.hu,
 gost.dev@samsung.com, willy@infradead.org, anuj20.g@samsung.com,
 linux-nfs@vger.kernel.org, viro@zeniv.linux.org.uk, jaegeuk@kernel.org,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, anna@kernel.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Oct 14, 2025 at 05:38:38PM +0530, Kundan Kumar wrote:
> Add support to handle multiple writeback contexts and check for
> dirty_exceeded across all the writeback contexts.

As said last time, please do a preparation series with all these
cleanups for file systems poking into writeback internals that can
go in ASAP and sets the stage for multithreaded writeback.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
