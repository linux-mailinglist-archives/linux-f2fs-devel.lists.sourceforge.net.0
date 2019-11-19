Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B47EC101266
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Nov 2019 05:19:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iWuye-0000fd-Gu; Tue, 19 Nov 2019 04:18:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <gregkh@linuxfoundation.org>) id 1iWuyc-0000fJ-DF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 04:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1VtsblUwGnT9vKdMJkPs1IdEzsaKS8APb24bkjmXYrU=; b=B84X+IT+PPh8rGuOD4ocOt/dys
 3LIdZRznXaBDh6qBz64pNacQYudngiqEEvYwyc8qBvcyy7jQ0lcj2ah9v5SkRhr6QNXVzbrJ2oKLl
 DDvtgbT5d5YEl5fs562UAzaCXYdVxDnoxD0yYDxySAhltMywDew/2NjYZxjW6ThpBsBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1VtsblUwGnT9vKdMJkPs1IdEzsaKS8APb24bkjmXYrU=; b=E2p9IE1yWLxNdrgXEDRRNpOkFp
 5qwnrg4KoGmOFOXl8nA1GRe9Or31scZZfbAYqT+gwSpwTGl+t3ebWmIC6PdFWelTZ5goh2N+PrA0W
 nxAFVSxl9TJpCNij1seXRt2FnSV8xZ+P2fg6ovsWBl4zIcZ4f8bW9D+VndcgeyAtMR1Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iWuyY-005OYW-3e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Nov 2019 04:18:54 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5597C222DD;
 Tue, 19 Nov 2019 04:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574136007;
 bh=XOQs9ta5TxZwJ5dIi/FfReFIvk/BCYdbBHqI+NdCsy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=w1iC/DrKlMF9uRE+pAYttXB9ALq77DUfKp9NxLKMxVE8TbzPELoZLZgvR6SZBfIb3
 +0BdEotMfOGZB0X7rCpZdR9/JNNr+ojIhYWKA+r7+77fo0rJ6klHhWNzaLUXx7uxru
 Ne7TL2w0vxd99mxvaR9xG3NPTCH3ftiLdszasurY=
Date: Tue, 19 Nov 2019 05:00:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Andrew Norrie <andrew.norrie@cgg.com>
Message-ID: <20191119040004.GA1445767@kroah.com>
References: <20190617210848.GB57907@jaegeuk-macbookpro.roam.corp.google.com>
 <1574102176-23804-1-git-send-email-andrew.norrie@cgg.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1574102176-23804-1-git-send-email-andrew.norrie@cgg.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iWuyY-005OYW-3e
Subject: Re: [f2fs-dev] loop: avoid EAGAIN,
 if offset or block_size are changed
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
Cc: axboe@kernel.dk, bvanassche@acm.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 18, 2019 at 11:36:16AM -0700, Andrew Norrie wrote:
> This email and any accompanying attachments are confidential. If you received this email by mistake, please delete
> it from your system. Any review, disclosure, copying, distribution, or use of the email by others is strictly prohibited.

Now deleted.  This is not compatible with Linux mailing lists, sorry.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
