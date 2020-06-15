Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BF91F8E91
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 08:51:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkixz-0002s7-JV; Mon, 15 Jun 2020 06:51:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jkixy-0002rn-0i
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 06:51:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vb4AmLZifP8UNxID/uqjMobXkHVOgS5xOGXxxiKZMrA=; b=WSO4p06nUGt8nsGgz/1LkKjFjU
 PMTePWFi+21Tpi6kpaIKBCsgQBGsNMGUeXevBbKEo501UDxxxcQwwRi+GG4F0Ka41yNhCbTNIfcEj
 xmBtgXPON6kij1y+M9Kxweei125ZtiFEMmvQpTMa9z2e9sO6SGrA6nB1YlCgiPZFO2Sk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vb4AmLZifP8UNxID/uqjMobXkHVOgS5xOGXxxiKZMrA=; b=b
 fiPYlPzUYhBKxcGRd6rjn55xx0rNa0eR714+U84h43lNS5AnV1YgyzK/288tsafwv9MmDyDhgLEkG
 Sr4MznPZkHpA0YBI+c0GOIRkQEQ/dyKAaui9l8fx38GXMD+5+FRAXZisw1EpcI4aUJIAJTQ13k/+P
 8rvIu2L21eBfN2Wk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkixw-0069Oo-Lz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 06:51:33 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 297942067B;
 Mon, 15 Jun 2020 06:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592203887;
 bh=w7KcDakz00qrDKT+3PtQZ1TMTfHGZvcgWnYT3lZBW60=;
 h=Date:From:To:Cc:Subject:From;
 b=zS/qdo8jfgzfP64P5IT1agUm247hUGFAeKjtri9UwCyUnMmJwBj705ZN1niz3r+JJ
 NquKJ4EoAeXnQtTilv1CZkjH6egDROoXwaHm3LHy/LnJaEHliBRDRPw+ok8pLV9CT9
 oZ64APSoq9K3WwTLp5F19CmKLkPDpXBDW/yoNNw0=
Date: Sun, 14 Jun 2020 23:51:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <20200615065125.GB3100@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkixw-0069Oo-Lz
Subject: [f2fs-dev] [ANNOUNCE] fsverity-utils v1.1
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
Cc: Jes Sorensen <jsorensen@fb.com>, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I've released fsverity-utils v1.1:

Git: https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git/tag/?h=v1.1
Tarball: https://kernel.org/pub/linux/kernel/people/ebiggers/fsverity-utils/v1.1/

Release notes:

  * Split the file measurement computation and signing functionality
    of the `fsverity` program into a library `libfsverity`.  See
    `README.md` and `Makefile` for more details.

  * Improved the Makefile.

  * Added some tests.  They can be run using `make check`.  Also added
    `scripts/run-tests.sh` which does more extensive prerelease tests.

  * Lots of cleanups and other small improvements.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
