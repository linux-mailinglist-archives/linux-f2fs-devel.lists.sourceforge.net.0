Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 463DD84BB67
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Feb 2024 17:51:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXOfU-00009V-OQ;
	Tue, 06 Feb 2024 16:51:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ap@sieca.int>) id 1rXOfT-00009C-L0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 16:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ITmAOvy9c9TwyyqoVbD3iOvhZtY5+uG9xcw/PaZGbhE=; b=LKD3Q7zVHm1T78twvFNaWyuZ6o
 7P9dDsmw/3aXFzV0xE0Lsq/7AZ4+pT7cVl6+dGzJAAWVfaDk/kTJRkZdN+zd1+CeILAmwRZ1K/Ri6
 1rfe6xpr2SILtCnjw+9lIDFKg4SeK37A1aR1UZN92o0JIbWAhg0E2otriRgGQmqsTMZc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Cc:Content-ID:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ITmAOvy9c9TwyyqoVbD3iOvhZtY5+uG9xcw/PaZGbhE=; b=HnXYwdPWrc8abdJxY0vvtywDFQ
 EzKENEqMFLtBHyVptwlh7QW4vo5SGDMdFdMAo5v/x8ZQkKohl/zOjkp2M5t4Zslb9DW4qpdd+BeAl
 m/v0gr7Fq+7WC7Bx/6FBrDdwGqidVhTPAG+m+3a8ACvbCPj/jltE6jFp2qkOx3mt8P38=;
Received: from mail.sieca.int ([168.194.73.35] helo=antispam.sieca.int)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXOfT-00031A-6g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 16:51:32 +0000
Received: from mail.sieca.int ([192.168.32.102])
 by antispam.sieca.int  with ESMTP id 413BWE7F006579-413BWE7S006579
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NO)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sat, 3 Feb 2024 05:32:16 -0600
Received: from SRVEXG02.sieca.local (172.16.100.151) by SRVEXG02.sieca.local
 (172.16.100.151) with Microsoft SMTP Server (TLS) id 15.1.466.34; Sat, 3 Feb
 2024 04:38:49 -0600
Received: from [156.96.112.132] (192.168.32.1) by SRVEXG02.sieca.local
 (192.168.32.102) with Microsoft SMTP Server id 15.1.466.34 via Frontend
 Transport; Sat, 3 Feb 2024 04:38:49 -0600
MIME-Version: 1.0
Content-Description: Mail message body
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Sat, 3 Feb 2024 02:39:02 -0800
Message-ID: <99184f6d-32ba-4208-a2b2-0015147fbb4c@SRVEXG02.sieca.local>
X-Spam-Score: 5.1 (+++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Hello I hope you are well and high in spirit? Before I
 continue, 
 let me humbly apologize for coming into your space unsolicited. Nonetheless,
 I take solace in the fact that it is with the best intention and [...] 
 Content analysis details:   (5.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 2.6 ADVANCE_FEE_3_NEW      Appears to be advance fee fraud (Nigerian 419)
X-Headers-End: 1rXOfT-00031A-6g
Subject: [f2fs-dev] I AWAIT
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
From: Anna Pechorin via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: anna.pechorin@yahoo.com
Cc: Anna Pechorin <ap@sieca.int>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello

I hope you are well and high in spirit? Before I continue, let me humbly apologize for coming into your space unsolicited. Nonetheless, I take solace in the fact that it is with the best intention and for our mutual benefit.

I chose you among other contacts that I came across in my search for someone who can partner with me in investment venture. It took a great deal of brain storming for me to arrive at this decision owing to my present predicament, which I will explain to you in my follow up email. I hope that my contact with you will be private, confidential and fruitful.

Presently I am totally indisposed to carry out financial transactions due to restrictions relating to the suspicious death of my husband, Ivan Pechorin who was totally against the Ukraine war. Before long it would be discovered that President Vladimir Putin murdered my husband. My strongest desire is to partner with you in investing my family money domiciled outside the shores of Russia with you as my fund manager. I have no problem investing this money in your country if it offers investment friendly conditions. 

It will be an absolute pleasure, if you would have the wherewithal to handle this project to my satisfaction. Every detail concerning this project would be laid bare to you upon indication of your interest.

Please strictly respond to anna.pechorin@yahoo.com


Best regards

Anna Pechorin.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
