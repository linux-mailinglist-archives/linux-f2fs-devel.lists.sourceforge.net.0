Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EC1ED46F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Jun 2020 18:36:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jgWNE-0008Hw-W1; Wed, 03 Jun 2020 16:36:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <pmenzel@molgen.mpg.de>) id 1jgWND-0008Ho-2C
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 16:36:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mlv0lfllGuYXDokRiS7+1hg8+1IEsmnkDVjAR/9dGiQ=; b=jdluPd3d4tD1vFabcQRFNpFBrM
 97/humihPgBL//EZeLlGBlMDp6UTIn2u5hsuOjg2NHRMJcxGTsHR3vrs4+pgFlvsnm5c9zIT2QrQw
 HS3aT6vR3zOSLX5nVly/TN306ycQCrLYqxle35FzI5K18r9LRyBY+F6RQHnJWOSu0hUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:Cc:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mlv0lfllGuYXDokRiS7+1hg8+1IEsmnkDVjAR/9dGiQ=; b=P
 U25g0tfFNRj/PHQNSO9z28zhVPi/O9qxWa6Q3IMzP1vVOyQF8fJVbF1aywpB2vRCrKAs6akymi+9b
 XkwkFLnRyQ9iAzkqewewxM8gmFTEowUFQmOrO0yjED/iFH/noge7bPk1ED+5PBzbOR2vOHBW0LsXW
 hI6zeeJ7UGwkloag=;
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jgWNA-0048ix-Kc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Jun 2020 16:36:15 +0000
Received: from [192.168.0.7] (ip5f5af288.dynamic.kabel-deutschland.de
 [95.90.242.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 09D9520643CC0;
 Wed,  3 Jun 2020 18:09:29 +0200 (CEST)
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <92704294-45ae-7c3a-8cd5-e6f2352f2c53@molgen.mpg.de>
Date: Wed, 3 Jun 2020 18:09:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jgWNA-0048ix-Kc
Subject: [f2fs-dev] fsck.f2fs output on screen during start-up
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear F2FS folks,


With Debian Sid/unstable using a F2FS formatted Samsung SSD 850 PRO 
512GB as root partition, it looks like systemd always run a file system 
check and fsck.f2fs always prints something to the screen (frame 
buffer), saying something with *Fix corruption*.

     Info: Fix the reported corruption.

Unfortunately, I am unable to find the message in the systemd journal or 
Linux log (`dmesg`).

Do you know, what fsck.f2fs is doing differently from the other file 
system check variants?


Kind regards,

Paul


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
