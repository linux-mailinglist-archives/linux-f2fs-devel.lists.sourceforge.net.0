Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 246F02CFF05
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  5 Dec 2020 22:02:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1klehY-0002Z5-Ow; Sat, 05 Dec 2020 21:02:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <support@finpec.agr.br>) id 1klehY-0002Yz-0z
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 21:02:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Reply-To:From:
 Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jedIcR6V72DMQ7GbcT/JCEoRP2YymgylAwccVVIlISY=; b=lPqbO39vcAWFIGojKZdFJdbGA/
 2A8hSntj1Yza9uqVWteH4dNEMuzl0KKhOBQCcmmliYW62MODPry0ZqMEG2fmEtaH19IoyuVyRXC6O
 43r1T2NDzCaqwTMcHNKLu3rBds846uzTgwcYSMG94qsN9+6+7ZWzkUiRByCQv1g7/lmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jedIcR6V72DMQ7GbcT/JCEoRP2YymgylAwccVVIlISY=; b=c
 /2bCcF4fSstxY5jKZED9FrWtDDp7bwp39yprDFoLt6BIXir2yKKQMuzb1aRk+QqGk0Qjmdn2tnFHp
 Mjxw+LK8YM6roegczWpNuRv0GBun3bLn8dLehjelwX4f/NFBY13kR/CpwhdX//6cAD0bDqLUiotFe
 ljWhCv7exQ3yWNVw=;
Received: from lin05.mandichost.com.br ([177.70.106.69])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1klehQ-00HOy4-MF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 05 Dec 2020 21:02:43 +0000
Received: by lin05.mandichost.com.br (Postfix, from userid 10256)
 id B5DDE28B990; Sat,  5 Dec 2020 18:00:59 -0300 (-03)
To: linux-f2fs-devel@lists.sourceforge.net
X-PHP-Originating-Script: 10256:ixczwpyxir.php
Date: Sat, 5 Dec 2020 21:00:59 +0000
From: Juaquin Dabeer <support@finpec.agr.br>
Message-ID: <7404a8930067ed1a1b787f6d3ad7b246@finpec.agr.br>
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [177.70.106.69 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1klehQ-00HOy4-MF
Subject: [f2fs-dev] linux-f2fs-devel confirm for me
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
Reply-To: juaquindabeer@mail.com.tr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Good day,

Please confirm receipt of the previous  mail I sent to  linux-f2fs-devel@lists.sourceforge.net or do I resend it again?

Regards

Juaquin Dabeer
juaquindabeer@mail.com.tr



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
