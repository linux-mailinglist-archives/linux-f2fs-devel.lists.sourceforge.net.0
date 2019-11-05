Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCFFEF72A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 09:24:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iRu8Z-00028Y-A5; Tue, 05 Nov 2019 08:24:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <choimj@isd.co.kr>) id 1iRu8X-00028R-EQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 08:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:Message-ID:To:Reply-To:From:Date:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QVoAY7YSm5gI0ETTIdpwA+a/b4d5ZDKFa9WgpDgqT58=; b=C1TNx4q0fKY4vcG8GB7C+UmsbV
 lQzwY6ftQZ9F41aFkWE52BYtg+oM2r4POELJaXgSxHiujsb3T8L2nhYYUr11c+JVktY9dyY/XV54N
 w9yczscFDH2koe/Pp1AtYlORFNbo7cAU7gtL1bLa1DaOY4+doJtJTebxY1z/a+YDj7Ec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Message-ID:To
 :Reply-To:From:Date:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QVoAY7YSm5gI0ETTIdpwA+a/b4d5ZDKFa9WgpDgqT58=; b=Z
 eHKEMlaMFQjJ6t9aglDV/8CiHAhyU6PXAJE7w9B5DxXi6N/CTUerwNtoefuDUBz7ZgVHXZYlZb1sj
 sXGDhe5C70tfB/BCxDKc5lN9GRXhaPDjFpxioxfG6CtiTaKZPdRnIwmtdC34XRksvKM/gB8g6wI3j
 Co6+kuDa5q5TT3+Q=;
Received: from [211.53.128.215] (helo=MAIL.isd.co.kr)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1iRu8V-000uV5-OC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 08:24:25 +0000
Received: from 192.168.1.3 (217.217.179.17) by MAIL.isd.co.kr (10.10.10.22)
 with Microsoft SMTP Server id 14.3.123.3; Tue, 5 Nov 2019 17:24:05 +0900
Date: Tue, 5 Nov 2019 09:24:03 +0100
From: Peter Wong <choimj@isd.co.kr>
To: <linux-f2fs-devel@lists.sourceforge.net>
Message-ID: <33062962.511339.1572942246026.JavaMail.cash@211.53.128.215>
MIME-Version: 1.0
X-Originating-IP: [217.217.179.17]
X-Spam-Score: 5.6 (+++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [211.53.128.215 listed in bl.score.senderscore.com]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iRu8V-000uV5-OC
Subject: [f2fs-dev] Investment opportunity
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
Reply-To: Peter Wong <peterwongpwhk@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Greetings,

Find the attached mail very confidential. reply for more details

Thanks.
Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
