Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F8D42A4DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Oct 2021 14:49:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1maHDa-0003cP-K3; Tue, 12 Oct 2021 12:49:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hch@lst.de>) id 1maHDZ-0003c4-0K
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 12:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7X/s+LDa8rTtWAZIkHSrARf3pGldfaarUzj53fsqHiY=; b=gvTRMQfXbLZYc2Bdf0URcR2vHM
 460p2sDsRvYTIE/Nmn6SQ7UPE+oDed+U3ZMwgu2zDov5t6Rtr9A+e0OfsDlYWMJO40L/BD3LcZ6U5
 AaNoqKpp6a+ppDPjj7M9w7J9Uz8+SAA6i1nik+p9b/cB0bPX7QO6EcbKibPWMRfsTkw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7X/s+LDa8rTtWAZIkHSrARf3pGldfaarUzj53fsqHiY=; b=Vj6f4unIXJDZwZ/58iSAQrMEQ6
 4Wb8icdD3tyjygFrsBlIVjGhtF+z8XRQL9cU5Z+ovv/t9vxHgGpe/9+ExHgnghWfExO+aWvJ/jCRu
 nvqwIV1+fiaOno3PlNAKzoGZpVmidG6sZlV7Bxvyma3E4VOIhmPYdJSKiJ3S6sPEfi2o=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1maHDW-005D0z-P0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Oct 2021 12:49:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8972067373; Tue, 12 Oct 2021 14:49:04 +0200 (CEST)
Date: Tue, 12 Oct 2021 14:49:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20211012124904.GB9518@lst.de>
References: <20210915070006.954653-1-hch@lst.de>
 <20210915070006.954653-11-hch@lst.de> <87wnmipjrw.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87wnmipjrw.fsf@collabora.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  [fullquote deleted] On Tue, Oct 12, 2021 at 08:25:23AM -0300,
 Gabriel Krisman Bertazi wrote: > > @@ -187,6 +207,7 @@
 EXPORT_SYMBOL(utf8_load); 
 > > > > void utf8_unload(struct unicode_map *um) > > { > > + symbol_put(utf8_
 [...] Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1maHDW-005D0z-P0
Subject: Re: [f2fs-dev] [PATCH 10/11] unicode: Add utf8-data module
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Shreeya Patel <shreeya.patel@collabora.com>, Christoph Hellwig <hch@lst.de>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

[fullquote deleted]

On Tue, Oct 12, 2021 at 08:25:23AM -0300, Gabriel Krisman Bertazi wrote:
> > @@ -187,6 +207,7 @@ EXPORT_SYMBOL(utf8_load);
> >  
> >  void utf8_unload(struct unicode_map *um)
> >  {
> > +	symbol_put(utf8_data_table);
> 
> This triggers a BUG_ON if the symbol isn't loaded/loadable,
> i.e. ext4_fill_super fails early.  I'm not sure how to fix it, though.

Does this fix it?

diff --git a/fs/unicode/utf8-core.c b/fs/unicode/utf8-core.c
index 38ca824f10158..67aaadc3ab072 100644
--- a/fs/unicode/utf8-core.c
+++ b/fs/unicode/utf8-core.c
@@ -207,8 +207,10 @@ EXPORT_SYMBOL(utf8_load);
 
 void utf8_unload(struct unicode_map *um)
 {
-	symbol_put(utf8_data_table);
-	kfree(um);
+	if (um) {
+		symbol_put(utf8_data_table);
+		kfree(um);
+	}
 }
 EXPORT_SYMBOL(utf8_unload);
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
