Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5F3A4CBE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2019 01:33:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4ZLO-00020d-Pa; Sun, 01 Sep 2019 23:33:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <didier@slint.fr>) id 1i4ZLN-00020W-8r
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 23:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tltitfquTIrBueyYnaf5bvlTSsdc7bNyiX9Nid+NGp0=; b=c7oMU+8o2ds/VfdFjnNw1vsDWe
 l7bPF3JScW1gVTjRpYp+Q3338E7I3yqsgYDvkK9qITMmHcL9NSI1Ps+YAH4VnwCHWwo1FgQqlfA1w
 87fOKdM7OaUGh6rq3hqy7nhsvMekbS2DiMebSzAxP52P/ftD+O9FzReq7bJ6lCL1ocqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:
 Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tltitfquTIrBueyYnaf5bvlTSsdc7bNyiX9Nid+NGp0=; b=H
 Hk7A8IRugynBtowdfs1jPY5SUVoQaQGMrDPX4Qu+l8m5OXEtdP3VpMjNQKEeWNm2oMYOnSaqTSgd+
 n4riBzW2UJIdEgxFvftMiXzqAlGdFxnSm8HpyWQfECRBjcPubNz4qb5m4m0FTJdadFHq94Wb8xjlg
 LqhOQlNEcaWN2BkI=;
Received: from boudin.jabatus.com ([109.234.162.62])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4ZLJ-00CXvG-1r
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 01 Sep 2019 23:33:13 +0000
X-Spam-Status: No
X-MailPropre-MailScanner-From: didier@slint.fr
X-MailPropre-MailScanner-SpamScore: ss
X-MailPropre-MailScanner-SpamCheck: not spam, SpamAssassin (not cached,
 score=2.502, required 5, autolearn=disabled, IN_BARA_SPAM 2.50,
 SPF_HELO_NONE 0.00, SPF_NONE 0.00)
X-MailPropre-MailScanner: Not scanned: please contact your Internet E-Mail
 Service Provider for details
X-MailPropre-MailScanner-ID: B5C7510088A.A3B30
X-MailPropre-MailScanner-Information: Please contact the ISP for more
 information
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slint.fr;
 s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:
 Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tltitfquTIrBueyYnaf5bvlTSsdc7bNyiX9Nid+NGp0=; b=uZe2aNi7SE7Abz596O7egc5dye
 7kN37lJzY7o7iBuf/+ExBEUWdGch7gxaP/TM5NbzyQt5Ekgy/SrNfryE4Mz1DTmrqbjB/DTGOKQGf
 3OuP5N2zntQkBGQ6GXIc5vhPE2U2jQWiaNfyJq8Cgi4U7laz87LkCm1/tXbxbggFoupA=;
To: linux-f2fs-devel@lists.sourceforge.net
From: Didier Spaier <didier@slint.fr>
Message-ID: <dcaa1e31-f47f-1570-f870-6d4d975e6067@slint.fr>
Date: Mon, 2 Sep 2019 01:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - fox.o2switch.net
X-AntiAbuse: Original Domain - lists.sourceforge.net
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - slint.fr
X-Get-Message-Sender-Via: fox.o2switch.net: authenticated_id: didier@slint.fr
X-Authenticated-Sender: fox.o2switch.net: didier@slint.fr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i4ZLJ-00CXvG-1r
Subject: [f2fs-dev] Which kind of devices would benefit of f2fs?
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I plan to provide a more "newbie friendly" installer for the Slint Linux
distribution that I maintain.

It will include an "auto" feature intended for newbies, that will
partition a whole drive and install filesystems with a minimum of user
input. It would install ext4 file systems in case of hard drives (but
the ESP and the Bios Boot partition, that is), or f2fs when
appropriate, without asking.

I am trying to determine for which kinds of devices f2fs should be
preferred over ext4 (or maybe xfs, I have yet to choose)

I understand that I should target devices equipped of a NAND flash
memory and interfaced with a FTL.

I think that nowadays most devices of types eMMC, SSD (both SATA and
PCIe connected, aka NVMe), SD card and flash drives (aka USB sticks)
have these characteristics thus are good candidates for f2fs.

Simply put, that loks like "everything but hard drives".

Is this correct?

If yes, I could just check the value of
/sys/block/<device name>/queue/rotational or the ROTA field of lsblk.

However, I understand that not all flash drives and SSD are based on
NAND and not all these devices interfaced through a NTL.

Thus my questions are:
1. Is the assumption "all devices but hards disks" are potential
candidate for using f2fs valid?
2. If this assumption is not valid, what are the drawbacks using f2fs
for all, in terms of performances and security?
3. Is there a way to tell for a given device if it would benefit of
using f2fs, that could be implemented in a distribution installer,
without human intervention?

Thanks for any clue. and if this is the wrong list for such questions,
please tell me where I should ask them.

Best regards,

Didier

PS I ship currently a kernel 4.19.x. Is this OK?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
