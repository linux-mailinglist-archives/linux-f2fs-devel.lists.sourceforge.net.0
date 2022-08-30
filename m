Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CFA5A5D61
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 09:51:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSw1s-0007rE-Gc;
	Tue, 30 Aug 2022 07:51:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1oSw1d-0007qy-4G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 07:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kXUaAb/eO9j+Va90OQKEpydTO7Ve/KIQoNepbUu9NNk=; b=Z4zEzrLZCYsvk8i74hBZaQiLjz
 3cmWekBrfdKeiwsPdha0289OJtZgvn3AMEApu47nivNK/MEmDBwJPjN0zUNS/7o57amZp5pFLLyub
 WiqzCt3Yyz82X++/UXQVd05IvUxcEARhqQzggP6uLdIo4w5M/v9qsbcjxxtYC9gV0ey0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kXUaAb/eO9j+Va90OQKEpydTO7Ve/KIQoNepbUu9NNk=; b=jrobZdptfEFVpca+cwRQl2G4h9
 Lik+FPkCVfFeUxUo5hwiILGbSb05RvbrGheWkPEfUCaOCjk9AjZ3tD4zVF/jJY7MuHd3NTO9AsZKe
 j6CBeAocvZeKDVnRuF7Z5q6JQQJhFZy2c16j4dvKR1CPUagn3ft9DlwoG/zc9UwDhaTE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oSw1c-00088n-CH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Aug 2022 07:51:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7A20BB816D5;
 Tue, 30 Aug 2022 07:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70961C433D7;
 Tue, 30 Aug 2022 07:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661845855;
 bh=V9S3aBs4N0TJEeCInTFam7IGstEqe66vGG4c6Q5jZdU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NubS6Lw7jV0SrKzMDts1xRLPUlPLPQSJonlyl579ZTXzN9Dl4b76xlLOWgkZ2IyVs
 bFnfTlyzs5LFFzcvko9BT4KGcApFqg/FtQsF41GCqGYJ2wK93jNxrWlRrwF9vxy4EM
 rkpmwtmzYTx5WFwzZHl7z7XHpg1TJpr9crdxHZ9MTWRRtp3HiI6PdYpZ7vl1mEG9a+
 pLaZuVGEjQWbJz0xpAS4wqG/I04dAVZWKOcQrnOVLPl9FkYzq9jfBQ3CRxrNgVORGa
 78KejWa6N5LJ21+MhNUhur2VfQVM1KvBCK/SGDQJPACjIui0lEmrVN0ORPBlrPehUh
 BT0RnvhIhKaEg==
Date: Tue, 30 Aug 2022 09:50:50 +0200
From: Christian Brauner <brauner@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <20220830075050.eizxl7emdrmyij6w@wittgenstein>
References: <20220829235429.17902-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829235429.17902-1-rdunlap@infradead.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 29, 2022 at 04:54:29PM -0700, Randy Dunlap wrote:
 > Change occurrences of "it's" that are possessive to "its" > so that they
 don't read as "it is". > > Signed-off-by: Randy Dunlap <rdunlap [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oSw1c-00088n-CH
Subject: Re: [f2fs-dev] [PATCH] Documentation: filesystems: correct
 possessive "its"
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Seth Forshee <sforshee@kernel.org>, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 29, 2022 at 04:54:29PM -0700, Randy Dunlap wrote:
> Change occurrences of "it's" that are possessive to "its"
> so that they don't read as "it is".
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-f2fs-devel@lists.sourceforge.net
> Cc: linux-xfs@vger.kernel.org
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Seth Forshee <sforshee@kernel.org>
> ---

Thank you!
Reviewed-by: Christian Brauner (Microsoft) <brauner@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
