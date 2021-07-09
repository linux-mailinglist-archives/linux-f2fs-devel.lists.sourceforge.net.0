Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EE23C281D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 19:11:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1u2S-00047x-OL; Fri, 09 Jul 2021 17:11:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <5kft@5kft.org>) id 1m1u2R-00047k-2i
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 17:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Subject:To:From:Date:Message-Id:
 Mime-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=avLZt23tkRh2Roidi+GfAthMTQR2RBupcVB2ZA26s18=; b=hjMb2iFkAwemfonUJXqE30/mc8
 /ZIAYyvGkPK9BfdjRubdgP/kBN0S64O3TGRXYybMV+jRRp3aO1+K46zfsbWBNk3VtvOtS72PLDQ22
 zickPvGCy94O3XNfdFH9m9/VV/nu5IjJL7lfYrqvwDU8Q4EsuinX7D7LvmJCtUScBc+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Subject:To:From:Date:Message-Id:Mime-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=avLZt23tkRh2Roidi+GfAthMTQR2RBupcVB2ZA26s18=; b=H
 f4BUtzXS0dQY/1usTRg8mcdCmCaW5qcFaPfOgYdlURQfd34l11prDVLc5hbbHsBwM8f3KYUvcaatI
 E0+ZZAyrnhAJWEJ3wjyIPjeaMSBjmtVaFNzkQR5Yu/p2CVn2wLi4ZtZJNFTEPrnbnfwj1uSgPRU8O
 iGwuSSUALcZXrTdw=;
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1u2D-0002zI-I0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 17:11:43 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 85C623200922
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  9 Jul 2021 12:52:40 -0400 (EDT)
Received: from imap37 ([10.202.2.87])
 by compute3.internal (MEProxy); Fri, 09 Jul 2021 12:52:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=5kft.org; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm3; bh=avLZt23tkRh2Roidi+GfAthMTQR2RBupcVB2ZA26s18=; b=QrDadsns
 V3iODgWvmGQLdjkkKyaTE8/jP1SpldmPNFw6aKUw+5z52e2wgm0xODZdabFCfiO7
 6rmTB2WHXngiATzrbE/zui+zOpGo7cP8u89hCk7TU0p5BgTdLE4TyhXjSNFB3eK7
 +Wfy7Jajj/vD+FCdFYf1hIKqk9BRnXCvdSJ0vfcG46O6XNCHZO0V6plEI/V3ZmTI
 jCkfNIiu5MMRsRXj8ljrf1UjXJFloYvB60tlzc74hiIOI1kAE9fndcAiRxg5kE3a
 qUNRsyX6OPVNEPPAjs/19ysbSo3/q1+SU9IkLMgOTYazdVDYWKH5SoMlWKrIl64P
 0L0UDWuq3kGmFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=avLZt23tkRh2Roidi+GfAthMTQR2R
 BupcVB2ZA26s18=; b=s8sxTiHOKrtGm2vqPFhR/MAP6UMgTZZykiemh9fMqT2yi
 guZoNpUW+d/hdjDKoS8Oa368JHBeI0CAPo8cgBZZds4Boy/cwild6JqHV1sYw0GK
 HPsWSXv+tu3WNjXC/zxFjTT1xK4Ui32vppcvg8ZW2NguRBHTZbDwZoc7ZFfRDlxG
 7+BRc9fU53KXJr99aTTQQqR5sQK9oAvfM0vQkTMumT4eU38UOQxGqNPzqqMeEjcW
 Z7lwTL6dw27Y9tOZqtMOTYr1NHr6tI5eSDVZ6mbWVH9JQHtKRJknOPg9l8gmq9ef
 2ZY5npuRckQiYjD3TqbkJTaeNrnlHa8kouw4HKXuA==
X-ME-Sender: <xms:2H7oYF35u-J00Q4-ghRP7Y39KCh-AJGzEOnQvxZfJGHSKIQe3SvXUA>
 <xme:2H7oYMHWxDtLx_uVrbi281INJrnT9w-S-phjBeyrmhApRR_R-JgUyelKmhNYM364p
 Fly_nKF1R3nhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtdeigddutddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpeehkhhfthcuoeehkhhftheshehkfhhtrdhorhhgqeenucggtffr
 rghtthgvrhhnpefhfeevfefgveefleethfevffejteelheelheekueeutdehteegudfhtd
 eutefgjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhephehkfhhtseehkhhfthdrohhrgh
X-ME-Proxy: <xmx:2H7oYF4uDZvPlVvgrm7YNpre0yZiloL3le1DIcP3_bRFQjYPy17j7Q>
 <xmx:2H7oYC2e0GPjlR6lqTdYbih9lY7d2IOFYvli6ipOYA8-IHiMW2X9lw>
 <xmx:2H7oYIGLrwHrOcww8KBGYCUFGP1W_rirUps7sziiKhCzGShD_unlaQ>
 <xmx:2H7oYMRS3VNHEPXlfcB5K5R4CKnXnAoPkTHZGKNtZYNJ20W1RGR4NA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id E05DB6B4006A; Fri,  9 Jul 2021 12:52:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-531-g1160beca77-fm-20210705.001-g1160beca
Mime-Version: 1.0
Message-Id: <8e29f52b-6b0d-45ec-9520-e63eb254287a@www.fastmail.com>
Date: Fri, 09 Jul 2021 09:52:19 -0700
From: 5kft <5kft@5kft.org>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [64.147.123.20 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m1u2D-0002zI-I0
Subject: [f2fs-dev] f2fs compression level not actually set when using zstd
 compression?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It appears that the logic in "set_compress_context" (in https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/tree/fs/f2fs/f2fs.h, line 4021) does not actually set the compression level in the inode for zstd compression - it only sets it for lz4:

    if (F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 &&
             F2FS_OPTION(sbi).compress_level)
         F2FS_I(inode)->i_compress_flag |=
                  F2FS_OPTION(sbi).compress_level <<
                  COMPRESS_LEVEL_OFFSET;

Shouldn't this condition include "F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD" as part of the condition as well?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
