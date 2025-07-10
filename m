Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8290B0046B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 15:57:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1NU0TnrQMCdRkZSGNgfZ9Rwktfel4jDektx1TW1e+c=; b=Ob28E4oTVInnuQzBVQ4vAwQ5pl
	cR4XV+6aY+8obkdSWvHz3HVYzjkxAUX4wp+OPC22CE7WjpgjVLGjq8mZd5oAhzCdXR9YQJkjniifp
	y1J6BBUJXeWavdPz144+tPDEAswtBcxna/nVNbW1VQsrViv8uCryAKqWIaezVkNDQmOo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZrm2-0005kl-AO;
	Thu, 10 Jul 2025 13:57:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZrm0-0005kS-67
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 13:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQxFdwzzhqRzORfFKiQy6qbKfEcaU1zOltkbcG/O8Jc=; b=fqIImWEl24tnRhoWjDcNz+Ah+v
 ZkeLVgdB1balXZXMMSrF61oyUHno+p18tBpNeN4yUHbrDol/BLRDHgxgEvpwlGTdXeSjLl5jwXzYM
 X0qqaTqC9l679t54GedOYeBn8hhVhhmfyO467En5nV232oUMo3FFytXXGf1YleKFhgQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQxFdwzzhqRzORfFKiQy6qbKfEcaU1zOltkbcG/O8Jc=; b=e3wcaYSi+y3qielvsXhqPamdTb
 qz4boxP0DjMGVFYbCzvlDFxR8jDIynz5ctQD5F8CwgrteDI0tCA13sgPips02Ugy7gXNOY8svDTtk
 WNDs5u0ecKnFYNzkwdpO8ONWswl42Xu/fchQZI92SUu3bZX7lDNvn0XO0LrRqOYYlYl4=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZrlz-00078w-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 13:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tQxFdwzzhqRzORfFKiQy6qbKfEcaU1zOltkbcG/O8Jc=; b=Uic/fNiHgbMGnR8jpzsOuquy5W
 4F1bsOn2+Bk1fRJKQqQd0IEwB6e9iGLjFOlGlgxyz+laWsECV6FbFeI6+82SlQmt9wKjugNfzLf1y
 mI9Ii7r2Twfx9bCM7/8dVyIP7a3mEV8Ek5zzMIomDNkF3Oj2PxMC+gTLeN8VQevIX9DP+jmB0/0jC
 5lQTZB3XtPVQyucop1I9nc6v26RoGtGegsYRB/xGpEZlaFhoCtIYizmkKLfMaj0wiyA0pjMPfC/oO
 vypRAdUV89RNOiWLtIco+SmWYubjfc+llCoRO7CBZ7UDZqhZ/5kj3k1Bny6MQCuZIddxUXQ8kFyjR
 ZOzVDyRA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZrln-000000098if-1CZv;
 Thu, 10 Jul 2025 13:57:03 +0000
Date: Thu, 10 Jul 2025 14:57:03 +0100
From: Matthew Wilcox <willy@infradead.org>
To: kernel test robot <lkp@intel.com>
Message-ID: <aG_Gr8NvCiXC4SyU@casper.infradead.org>
References: <202507101412.50ND2WEX-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202507101412.50ND2WEX-lkp@intel.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot
 wrote: > >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to
 parameter of type 'struct folio *' discards qualifiers [-Werror,- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1uZrlz-00078w-Qa
Subject: Re: [f2fs-dev] [jaegeuk-f2fs:dev-test 65/93] fs/f2fs/data.c:58:56:
 error: passing 'const struct folio *' to parameter of type 'struct folio *'
 discards qualifiers
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, llvm@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 10, 2025 at 03:17:28PM +0800, kernel test robot wrote:
> >> fs/f2fs/data.c:58:56: error: passing 'const struct folio *' to parameter of type 'struct folio *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
>       58 |                 return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
>          |                                                                      ^~~~~
>    include/linux/fscrypt.h:527:67: note: passing argument to parameter 'bounce_folio' here
>      527 | static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)

Ah; I changed only one of the definitions of fscrypt_pagecache_folio.

Jaegeuk, can you fold in this fix?

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index b334c0538864..8d9127a0fdb3 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -524,7 +524,8 @@ static inline bool fscrypt_is_bounce_folio(const struct folio *folio)
 	return false;
 }
 
-static inline struct folio *fscrypt_pagecache_folio(struct folio *bounce_folio)
+static inline
+struct folio *fscrypt_pagecache_folio(const struct folio *bounce_folio)
 {
 	WARN_ON_ONCE(1);
 	return ERR_PTR(-EINVAL);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
