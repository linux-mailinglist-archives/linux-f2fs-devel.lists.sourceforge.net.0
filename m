Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8006B644C90
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 20:34:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2dhu-0007Mt-P0;
	Tue, 06 Dec 2022 19:34:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <accounts1@shinzuyo.jp>) id 1p2dhs-0007Mm-LA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 19:34:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kYxKs6i70vrhaHoTHB/sG6ZrzEMyq4WKTcLNZTsApGg=; b=W0kqkEqw+vXmH5yvdYEDdhAUie
 uxsgsJxFEsMo9VqgmD58DWJw5fkMbBOImtWfxG09nPjV/chqBqOVFrVwsKpQ56tyML/qcpHK/Gr4x
 MNLxFxUi0839IxXl7VyNqfluXWKi1s0Lu6OnBeoIUioq2/sl2Ybo1y9kRpjeuy9lwDd8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kYxKs6i70vrhaHoTHB/sG6ZrzEMyq4WKTcLNZTsApGg=; b=l
 AqDkTiuB3qsezpAIScYpcZBDuPoJHm8DqqfbckT3CSkR0nBRzAidQy0c+1GrZ8DAWkqInQp4/+FNc
 84MZSsTq9vOvYCY7twCGBeJPlEXz1Knk4DbVhCoMhEPdALBwSbEbNdU5pJA8i+/VWhwHcpaeoWBL3
 s0cF8KwHO9XXarvM=;
Received: from mm66.poltra.pl ([89.231.24.66] helo=mail2.poltra.pl)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2dhr-0001Fq-2F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 19:34:20 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail2.poltra.pl (Postfix) with ESMTP id 48BCC1DC66B3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 20:16:14 +0100 (CET)
Received: from mail2.poltra.pl ([127.0.0.1])
 by localhost (mail2.poltra.pl [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ox3_uO8gfks3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 20:16:12 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail2.poltra.pl (Postfix) with ESMTP id 9160C1DC66AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 20:16:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at poltra.pl
Received: from mail2.poltra.pl ([127.0.0.1])
 by localhost (mail2.poltra.pl [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QRmQw8h1L561
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 20:16:12 +0100 (CET)
Received: from shinzuyo.jp (ec2-54-211-86-81.compute-1.amazonaws.com
 [54.211.86.81])
 by mail2.poltra.pl (Postfix) with ESMTPSA id 0D1941DC6696
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 20:16:11 +0100 (CET)
From: SHINZUYO Metal Industry Limited <accounts1@shinzuyo.jp>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 06 Dec 2022 19:16:11 +0000
Message-ID: <20221206155302.C82ADEE09CC68C4B@shinzuyo.jp>
MIME-Version: 1.0
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Dear linux-f2fs-devel Compliments of the season, our company
 needs a representative in the United States of America, will you be interested
 in being our rep. if yes, do return back so we can share mor [...] 
 Content analysis details:   (1.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: shinzuyo.jp]
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1p2dhr-0001Fq-2F
Subject: [f2fs-dev] We have an Offer for a North American REP.
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
Reply-To: kent.yoshitaka@shinzuyo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Dear linux-f2fs-devel
Compliments of the season, our company needs a representative in 
the United States of America, will you be interested in being our 
rep. if yes, do return back so we can share more details for your 
consideration.

All expenses shall be borne by us; therefore, you are not 
expected to contribute a dime while working with us. Also, all 
our transactions are absolutely legal.

Your reply shall be well acknowledged.

Kent Yoshitaka
Consultant
SHINZUYO Metal Industry Co., Ltd
(Trading as-Shintoyo Metal Industry Co)
Email: kent.yoshitaka@shinzuyo.com
www. shinzuyo.jp
Intepr. Email: grahamsbell2020@126.com
ADD: 1-5-8 Hirano, Kawanishi City, 
Hyogo Prefecture 666-0121 Japan



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
