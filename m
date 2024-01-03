Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B21B823979
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jan 2024 01:15:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rLBNt-00076b-4A;
	Thu, 04 Jan 2024 00:14:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <smsmailapp01@ukraine.lviv.bakhmut-independently.shop>)
 id 1rLBNr-00076L-Iz for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jan 2024 00:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h+aeR0rVATWwFKI57HfwFKde8iyf2tko4lecGzM2U9A=; b=VO3N1myYM9FU3K5/o8ZraftR+o
 leiUKTYbrX7Ec3SFAOz1117nBzo7WgBCYucNGmYZXazsNrB+L73dkvgLWc8lT7n+Ir6R2MkMtJu70
 fcHVTF4phf8srzQ520AC5CpEEZg/CbnG/EKeX+xWF6akJhZ6R6PaP03PN463lGHAgBfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h+aeR0rVATWwFKI57HfwFKde8iyf2tko4lecGzM2U9A=; b=i
 B2qDs14cdOyycKfL07VC2SP0VR6GXaN6xVyXMI15pwHziYBElZIKAoELSq7dftHNDLJyZKcpSVT+z
 hXtwg3LR6pwS0mpzZ3sz93/dOyusMBY5ru782eHNAxnmbtWIPfvs37DsPnimO8kLMheewngNISTxe
 QCw2vKjthIQKVBcA=;
Received: from mx.ukraine.lviv.bakhmut-independently.shop ([205.185.123.37])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rLBNr-0007I9-HI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jan 2024 00:14:52 +0000
Received: from ukraine.lviv.bakhmut-independently.shop (whcm.berkospecial.com
 [209.141.48.157])
 by mx.ukraine.lviv.bakhmut-independently.shop (Postfix) with ESMTPA id
 6B78C1573 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  3 Jan 2024 23:57:25 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: 03 Jan 2024 15:57:23 -0800
Message-ID: <20240103155606.234103C5B6343ADC@ukraine.lviv.bakhmut-independently.shop>
MIME-Version: 1.0
X-Spam-Score: 6.5 (++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  My name is Evan from Ukraine.I have tried to reach you but
 find it difficult due to internet scarcity here in this town. I am contacting
 you because I want to flee Ukraine and come over to you country [...] 
 Content analysis details:   (6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [205.185.123.37 listed in dnsbl-1.uceprotect.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 0.0 FSL_BULK_SIG           Bulk signature with no Unsubscribe
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 3.5 ADVANCE_FEE_3_NEW      Appears to be advance fee fraud (Nigerian 419)
X-Headers-End: 1rLBNr-0007I9-HI
Subject: Re: [f2fs-dev] Dear Respectable,
 I awaits for your response to my message!!!
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
From: "E. Petrova via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: evpet@ukraine.bakhmut.wheatexporters.shop
Cc: "E. Petrova" <smsmailapp01@ukraine.lviv.bakhmut-independently.shop>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

My name is Evan from Ukraine.I have tried to reach you but find 
it difficult due to internet scarcity here in this town.
I am contacting you because I want to flee Ukraine and come over 
to you country,I have some funds I plan to invest in your country 
because I want to relocate my Late Father business due to ongoing 
war in my country Ukraine and visit your country to set up new 
investment business you may advice profitable in your area.
I also have some millions of dollars i want to invest and 995kg 
of 24carat gold I want to ship to your country and establish gold 
jewelry manufacturing company.
I will offer you good monetary rewards for your help,due to how 
russian drone boambards this town frequently,phone network is 
disrupted because of attacks on network installations,please for 
fast discussion, you can add me on whats up and let's talk,this 
is my whatsapp number below
whatsapp:+380-97-296-2642
Thanking you as i wait to hear from you soon so i can tell you 
more details.
God bless you for your care.
 
Regards,
Evan.
whatsapp:+380-97-296-2642


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
