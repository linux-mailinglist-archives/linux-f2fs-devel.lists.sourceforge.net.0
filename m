Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39215BDD0B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Oct 2025 09:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwDINWtJmuVQrWmmS3nfDrL1tyEfzXLFQioltpK6cdA=; b=jzUV1J29pn1bakU8YdKvLhcq9j
	V85S00IMSMuuZ1+TiqR3Z2GmIagJNRmlnqYFTrssbJcgCgFreB5q+XfDKOvWO0dot9PJFqaLYt5cr
	aAeW96P21asrvOUWszz8+TYii1maCFTLb1HFVBXvA4kmLc7nxsJDW2j0nZI2/cAl6ofo=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8vxy-0007Dz-Nk;
	Wed, 15 Oct 2025 07:30:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1v8vxs-0007Do-FC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 07:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wwsMcO8kxKDe39xAaR0wfWWvJXHr4ArjIXG9EGSFt8A=; b=LraGG5gvkBDZaMOEd0NxKguzuz
 k8bge/1ObhuGnhiSe/tCrOrgyPPOjM2Nd64O891Z1BcLGUDHroZ5IjQTDQIfYkBVz9htsWmQsU2HU
 I2JuUGq61GkVAHaEbPiKrF6mNk65/9RBkkLP+e2aeavjOWyBsMnoHN6UOeSwG9ClUNr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wwsMcO8kxKDe39xAaR0wfWWvJXHr4ArjIXG9EGSFt8A=; b=Ml2VUsrrgTc8f97fiMWhnbiDlE
 ZYafi9VtEASsuw65TIYGwa/9oXty5jN9mS1KCY3qx0gGrvMIPZXWbBro6Yb/ZlJar6hG8JpoCQrWN
 krK8Ts479OvIybnDJAnsqCHcBukLLvI583ZKDkY9F35vDGqNebE1d6PkR5tSnwzyuIRU=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8vxr-0004LD-0q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Oct 2025 07:30:27 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7A8E9227A8E; Wed, 15 Oct 2025 09:30:18 +0200 (CEST)
Date: Wed, 15 Oct 2025 09:30:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <20251015073017.GB11294@lst.de>
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121135epcas5p2aa801677c0561db10291c51d669873e2@epcas5p2.samsung.com>
 <20251014120845.2361-17-kundan.kumar@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014120845.2361-17-kundan.kumar@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Please split this into the writeback infrastructure and an
 XFS patch. Adding infrastructure and the user in the same patch is really
 annoying for bisecting, reverting or even just reading commit logs. [...]
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1v8vxr-0004LD-0q
Subject: Re: [f2fs-dev] [PATCH v2 16/16] writeback: added XFS support for
 matching writeback count to allocation group count
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

Please split this into the writeback infrastructure and an XFS patch.
Adding infrastructure and the user in the same patch is really annoying
for bisecting, reverting or even just reading commit logs.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
