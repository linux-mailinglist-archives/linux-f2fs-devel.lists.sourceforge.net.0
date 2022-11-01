Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C93026143D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 05:09:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opiar-0008Ae-Sw;
	Tue, 01 Nov 2022 04:09:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sijielan@gmail.com>) id 1opiaq-0008AY-KE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 04:09:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cF8Xdl9bnZMP6PM/jkktbmXgdydLrtVZtbsNWEfml5U=; b=O/Z6nLNzrJ9GDucgY+de6Hz0qD
 qWBu18SGg0K22NRyNiiaKC9ScOTw5INzADai3u1IjbCKtbv/XfX6wPCHtNq3C3FuVcjcqitrlrasF
 EMLj/py39uy+NnMVwMMRAsRXLsfOEb2NlzjTYUQTlGuyUI875faF9ng4zmaNb1AT5Ras=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cF8Xdl9bnZMP6PM/jkktbmXgdydLrtVZtbsNWEfml5U=; b=F
 xUin0xxY99MfAMKtJa3Zpcz7qhrnHKFGkN8CBckuCGIS21qzYp16nzgUlxcy1Iwt8XnT06sP5BIE8
 MOuAUbPxW/WL9Q4hBaddBcdd/yTvvLe0sp0UNOCQvP+vuMiL5KBT7jtPv3hmJd9Yd8WQ6UJcPZb0/
 oolE7FWUnotYmjbA=;
Received: from mail-lj1-f174.google.com ([209.85.208.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opiam-0001Mn-4v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 04:09:40 +0000
Received: by mail-lj1-f174.google.com with SMTP id j14so19235917ljh.12
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Oct 2022 21:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cF8Xdl9bnZMP6PM/jkktbmXgdydLrtVZtbsNWEfml5U=;
 b=FcYPBsVGNwpLUaVZpBQpN2jDmWuSOvdtv3EXZzTUOoN03N+zmje8U7oXs61ElaPtPc
 dBR1CYPcPTURxarJfA7S56CUEQ/2MP4Tux6zXOszbp4ve9bgY8/mZdAdhP2eNrvpVl9C
 dGPMuLTkIMQfhsddoP3qJeaRx5X7OfqNoMo0EXrQyltiVmFmom7y/iCvztaUJLQsUXcl
 HaLw05/mY4FyYMDGibztfm9W+6OnvIipOLkiiUTO8b/d1eHs1I993fUuJmD/SC8wCXlP
 NSEIZfIfxYVhtLhBdaDB6IRvqZmT1fSkMiP0SbrsIdtydu5RqX+quAS202TEzQ2HcQdf
 fR9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cF8Xdl9bnZMP6PM/jkktbmXgdydLrtVZtbsNWEfml5U=;
 b=c7HBjlk4jVokBoTNDq/rh+PunjbrzEPCtKf5ZcTGgPYYWE+Dz4SV3SGI7Tw141CIck
 IVuffs50hxK+LB1F13HBCbKMbAdYwDbzuQd5KOy1SqCQE7fcbpPcODiGo9CbeLQzOs4w
 eJ45U+izlDYN+BVRXR0mbhPLPW+Or+KUhAqWevP9kJdRxPrknsaQe8dIpYWhsoJr+nVS
 UeYC+1u+s0LBh7rkMNAXEtv3U2gyv68kG7j1OyYzWNuBkyCiD+lyRYiMvdJycXHp30/r
 NkDH0jEa0qZPQe8/jo3zHbSPzXunjh3uJL88A9AoyksOsvYo0FkD7H0pa5LSzHdIcOXC
 rleA==
X-Gm-Message-State: ACrzQf3bWwGc2ic5kj157aPsBtKIyTvm5EjbdOAdFSqllJrQ0BD9vXN2
 XGrbiM1rcJVJAVdquJNE9EPxHXPUb0M2bWAz5W4=
X-Google-Smtp-Source: AMsMyM6UH75Sposa99DLgTit3IWe9pM+Mo8+QmlB6OHJ9TnMMhQsA5EnFYZqHUFNE6jOlDug3KLBAccTWhk0vmihMmY=
X-Received: by 2002:a2e:7c02:0:b0:277:54ee:e8d9 with SMTP id
 x2-20020a2e7c02000000b0027754eee8d9mr3497137ljc.309.1667275769528; Mon, 31
 Oct 2022 21:09:29 -0700 (PDT)
MIME-Version: 1.0
From: Sijie Lan <sijielan@gmail.com>
Date: Tue, 1 Nov 2022 00:09:18 -0400
Message-ID: <CAGAHmYA=QPJZy-NCRFF_17y-3HLb4UxcXVRiw=6c-1N7Fa7kQQ@mail.gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 kernel-team@android.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When I try to make f2fs on null_blk device, it always shows
 "Device size is not sufficient for F2FS volume", I am I gave enough space
 for the file system, i.e, 20GiB. I just want to know hot to fix it [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.174 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sijielan[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1opiam-0001Mn-4v
Subject: [f2fs-dev] Mkfs.f2fs on null_blk device
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

When I try to make f2fs on null_blk device, it always shows "Device
size is not sufficient for F2FS volume",
I am I gave enough space for the file system, i.e, 20GiB. I just want
to know hot to fix it.
this is the output message:
[sijie@fedora null_blk]$ sudo mkfs.f2fs -f -m  /dev/nullb1

    F2FS-tools: mkfs.f2fs Ver: 1.15.0 (2022-05-13)

Info: Disable heap-based policy
Info: Debug level = 0
Info: Trim is enabled
Info: Host-managed zoned block device:
      20 zones, 2147483648 zone size(bytes), 10 randomly writeable zones
      524288 blocks per zone
Info: Segments per section = 1024
Info: Sections per zone = 1
Info: sector size = 4096
Info: total sectors = 10485760 (40960 MB)
Info: zone aligned segment0 blkaddr: 524288
Error: Device size is not sufficient for F2FS volume
Error: Failed to prepare a super block!!!
Error: Could not format the device!!!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
