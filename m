Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C354863CB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Jan 2022 12:40:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n5R8O-0000Jp-Hh; Thu, 06 Jan 2022 11:40:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <antoine@lesviallon.fr>) id 1n5R8M-0000Jj-OI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 11:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Cc:To:Subject:Message-ID:
 From:Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2o0gvbQopB+4G68jrEFs5E0gRUjCXLdEimP4Pb9UyM=; b=b+1PEv9hf7BBMC9BMr0hr+hW/M
 +RObByN8MAa1i/MAwcJzkBiE0QCXA5y3hSQuZjEg12+VphKQR+gxdyDH2t6GIdnNOauha0HQ6wuPn
 FzWTqDXhDN1In0daC/rVitftJ3CAJkxJpvCwwiE3q4TE7xiGS5dNB84blJ5771MY+Qz4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=References:In-Reply-To:Cc:To:Subject:Message-ID:From:
 Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D2o0gvbQopB+4G68jrEFs5E0gRUjCXLdEimP4Pb9UyM=; b=N1y2MQbgZFoHSAZPjyNSyAYDzJ
 MMjiy0jbNnU4GDoNg86DE4WrusxX3lyp/XX47S+9aLe5MFuPMc8iLqR22HBc0VxGK3/crikooTQyD
 0aMHZYKApfK11e+mqFeTGom4EuzMkp17Ay/fdmiuTktrps7j0a9PLp7pcQHPGkIcLBwc=;
Received: from [82.66.80.223] (helo=lesviallon.fr)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n5R8H-0008Uo-52
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 06 Jan 2022 11:40:42 +0000
Received: from authenticated-user (lesviallon.fr [82.66.80.223])
 by lesviallon.fr (Postfix) with ESMTPA id 66FFA62A3C0C;
 Thu,  6 Jan 2022 11:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lesviallon.fr;
 s=dkim; t=1641469218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D2o0gvbQopB+4G68jrEFs5E0gRUjCXLdEimP4Pb9UyM=;
 b=CNZ8GEl+1nOBsecwB28v1prmIRqGDC9vbVuRr6lDCiP/sPYS/awpKwIgHPqa9ehoTrPK1M
 1HDj/QZ7Tx8n6ZqBujMYKSRWPlb2n4GDrIa3eaqjpAIFPTQ8PzdrJ0uu3Toj+5GAVRl4+R
 FbSnWIcKE18Jovw2mGnCLjxdeW/xn7o=
MIME-Version: 1.0
Date: Thu, 06 Jan 2022 11:40:18 +0000
Message-ID: <e78cb718fe6350f8f544d6ac5c9a3e91@lesviallon.fr>
To: "Antoine Viallon" <antoine@lesviallon.fr>, jaegeuk@kernel.org
In-Reply-To: <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
References: <e8b0f25177675008c0eb234220ceb31f@lesviallon.fr>
 <20211230002942.298407-1-antoine@lesviallon.fr>
X-Spamd-Bar: /
Authentication-Results: lesviallon.fr;
 auth=pass smtp.auth=antoine@lesviallon.fr smtp.mailfrom=antoine@lesviallon.fr
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA256 Hello, I know
 you are probably busy. However, even though my patch is pretty bad, I'd like
 to know if the general idea of having some progress feedback interests you
 at all. Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Headers-End: 1n5R8H-0008Uo-52
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: Add progression feedback
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
From: Antoine Viallon via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Antoine Viallon <antoine@lesviallon.fr>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello, I know you are probably busy.
However, even though my patch is pretty bad, I'd like to know if the general idea
of having some progress feedback interests you at all.

Perhaps it could be opt-in, using a --progress flag?
Please tell me what is your opinion on the matter,
Antoine Viallon

> On large SSDs filled with lots of data, fsck.f2fs can be very long to finish.
> For instance, on my 1TB SSD filled at 99%, it takes literally 5 minutes to
> complete.
>
> Currently, the only way to have some feedback is to enable debug output,
> but it is very verbose and doesn't tell the actual progress.
>
> This patch implements a simple progress report in the longest
> running part of the check (in fsck_chk_node_blk).
> The number of checked node / total valid nodes is printed
> every 1000 nodes checked, and the percentage of progress
> is also calculated and printed.

-----BEGIN PGP SIGNATURE-----
Version: OpenPGP.js v2.6.2
Comment: https://openpgpjs.org

wsBcBAEBCAAQBQJh1tUaCRDRJrE6tVXhbwAADlsIAJnmen7XeO10Mi82fQwp
LizYs/oT1bxXro564y7ggKXHcEr8cqAgo4yHxQJUMpSYo7Pe+3YO6c7ONQhO
rOi7SfKsEI41YhWIzfv0dpwUgOrkwrkfuytQ4OpfUdR8zqFl2whA962qsCQi
nRgAnOAmhdQl3HFD2ZvcXfdaU/sXzlY9vGCkSeL1aGph1gaPmaWXY4K/y0Ip
7tk/ZssXJgzdtGZL5FHBopnEXAfm3Hk06oKL96VLQJ6OAH4+kUdAVY7P7FYM
BtSUzGzQRJQKfxBR+jYEVPi9x/hpWKGxxekOWPHTrISYX5fQMmrNi8fCSO5Y
cP8YcIwUfCT+WXAdOLrvI58=
=6UQI
-----END PGP SIGNATURE-----


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
