Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2CDF08D4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Nov 2019 22:56:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iS6ob-0003vb-Dp; Tue, 05 Nov 2019 21:56:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <robertmatare200@email.com>) id 1iS6oa-0003vH-8y
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 21:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/nSnVDrwyw3RCWQ5yYXBgjh4EhVxvdoUhsx8sTUl81o=; b=BP7EB6mZTn117l40gCnzG6akyc
 Ft/6HbZoCvY41KO6HCHy7Aa6lXMl86tqMNzPApQgESc0CDg97OkuCSxcnshB2VUh47kg7erZL/Pnt
 /wRPdoNhVP2opxwufli29iAcpbmQv8tYV65mJI+uXm8RQeUfizkafYMdiK1u8guKb4ac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/nSnVDrwyw3RCWQ5yYXBgjh4EhVxvdoUhsx8sTUl81o=; b=Z
 0lpoinounnD07qwdMzxZesW3RnMI+dv2tB9pXZk8LmYUYwQSGrSbdy/Cmgk9Y/udver4utPX0B5Ns
 rhSgsLJUoGuakWfSypQX+OdAWX9TBs10zk33vMauoa0KNPF1nmRjYRfDZdoCyojbaQCb4Pi+utMWZ
 i37jhdBLEpcZsjQU=;
Received: from [104.168.52.104] (helo=host.colocrossing.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iS6oY-001Ot2-SB
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 05 Nov 2019 21:56:40 +0000
Received: from email.com (unknown [23.249.167.181])
 by host.colocrossing.com (Postfix) with ESMTPA id A4FED2BD73
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  5 Nov 2019 16:42:40 -0500 (EST)
From: Robert <robertmatare200@email.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: 05 Nov 2019 20:43:40 -0800
Message-ID: <20191105204340.E0717839A287F9C9@email.com>
MIME-Version: 1.0
X-Spam-Score: 5.5 (+++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [23.249.167.181 listed in psbl.surriel.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (robertmatare200[at]email.com)
 0.0 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.9 SPF_FAIL               SPF: sender does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.net/Why?s=mfrom;
 id=robertmatare200%40email.com; ip=104.168.52.104;
 r=util-malware-1.v13.lw.sourceforge.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (robertmatare200[at]email.com)
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 SPOOFED_FREEMAIL_NO_RDNS From SPOOFED_FREEMAIL and no rDNS
 2.0 SPOOFED_FREEMAIL       No description available.
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iS6oY-001Ot2-SB
Subject: [f2fs-dev] Please Read Carefully
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
Reply-To: robertmatare200@secsuremail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello there, I got your contact from an online directory and I 
have a proposition that may be of interest to you. I am a 
Personal Assistant to a former minister in the South African 
government cabinet. During my bosses time as a minister, he used 
his position as a minister to amass to amass lots of wealth 
through kickbacks from deliberate over-invoicing of  oil and 
aviation contracts done through his ministry. He is currently 
being investigated by the Government and all his assets have been 
seized locally. He has also been restricted from traveling 
abroad.

Fortunately for him, he has a high value financial asset in 
Europe that has not been seized yet and he wants this asset moved 
and secured ASAP. This asset is very safe at the moment as he did 
not declare it and he used a proxy to help him deposit the asset. 
Unfortunately, the proxy has passed away and my boss now needs 
the help of a foreigner that can help him secure this asset 
discretely and invest it in a stable business in their country. I 
am contacting you with the intention of collaborating with you on 
this project. Should you decide to help, you will be generously 
compensated for your efforts. Please let me know if you are 
interested so that I can give you more details.

Regards,

Robert.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
