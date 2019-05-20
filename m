Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6636023BE2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2019 17:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Date:Message-Id:MIME-Version:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7aqeqmPYgEztIhWBNlxjPvJnzXCLFDRIB5WSIZzKBG4=; b=jRyGOI9EzL5X7oKWM7ouUQ3ryh
	n1ZYrla1QlR7+hJuYcxiuuUW9wgtqVxEz8US5nmhGTUbeonnYcarZf4ixyHa13JqFKdU8O1f66rGa
	k6SlCB9PN1qqDXQa2wiR7TuXUR5uy+eZXUrHKJb0u+YFMhRm7fugVrb5oC0v0AHs/nRY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hSk4x-0002wr-EY; Mon, 20 May 2019 15:19:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <apache@boombf2am.ga>) id 1hSk4w-0002wj-9n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 15:19:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Reply-To:From:Subject:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aCJ/pbIQmsvJs70kR3RErYMMvKB8ywWN1hLGEcVH/yE=; b=ihwqN5JkPhjU3TPdfv+Wo1l2wL
 00ddsan05uw9jpMx25PmcXFMgQx2haf68KhVqS6m2OWZbBWvDoUwBxWzwpg+le6gKhC1S7gfHUurj
 1zbm7njh5mx2GiS75/FKygF780etHOinp2w0c7oVhas8kIjHSG5s3YYyF1wK5Uz/hYvE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Reply-To:From:Subject:To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aCJ/pbIQmsvJs70kR3RErYMMvKB8ywWN1hLGEcVH/yE=; b=e
 AxMp1lIAAux0nW1Am9feOA4s2i0v+2mlZVcCZWUF2fOsHgb9vZOTmN/2ZPciN8aklB+43TYxdKGIT
 hiKU5GceDDqcmKbF3Jx3RvjQ3G7en9DtBWYVEQQVV1eDYStsmONK0JxKtXKM3vjYUXI47dVDPUoiH
 9iLvaIVrG/XaGvvw=;
Received: from [159.89.172.223] (helo=mail.boombf2am.ga)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.90_1)
 id 1hSk4f-00BCNX-Be
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 May 2019 15:19:54 +0000
Received: by mail.boombf2am.ga (Postfix, from userid 48)
 id 5A32258AA37; Mon, 20 May 2019 13:31:07 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Originating-Script: 0:nfhdgeds.php
MIME-Version: 1.0
Message-Id: <20190520143624.5A32258AA37@mail.boombf2am.ga>
Date: Mon, 20 May 2019 13:31:07 +0000 (UTC)
X-Spam-Score: 4.8 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [159.89.172.223 listed in zen.spamhaus.org]
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [159.89.172.223 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1hSk4f-00BCNX-Be
Subject: [f2fs-dev] Inquiry 20/May/2019
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
From: Daniel Murray via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: sinara-group@list.ru
Cc: Daniel Murray <sinara-group@bk.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,friend,

This is Daniel Murray and i am from Sinara Group Co.Ltd in Russia.
We are glad to know about your company from the web and we are interested in your products.
Could you kindly send us your Latest catalog and price list for our trial order.

Best Regards,

Daniel Murray
Purchasing Manager




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
