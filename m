Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB1B3F3A67
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Aug 2021 13:35:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mHPHr-000526-Ue; Sat, 21 Aug 2021 11:35:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <user@domain.com>) id 1mHPHq-00051z-SV
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Aug 2021 11:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Reply-To:From:
 Date:Subject:To:Sender:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jtHBPXwFqiIxaZ94xi9TronPpIthKaaCorcIfMEFAJM=; b=JU8kKUiC4px5fIfKRnhF91prcg
 rllPbECH+joSDJxZHlzv+EzaDdgy+YZcpCRO9Sdl+2HEMUVarIkqJuHK0zclHunhze5425AJ/XT8C
 WZ1jW8xxGOzWyaG8LUcCgHtFvz3E8qTUnvAHnZqY/EWm/Tq2bdP4v/3lgRm1ZkvySVIY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Reply-To:From:Date:Subject:To:Sender
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jtHBPXwFqiIxaZ94xi9TronPpIthKaaCorcIfMEFAJM=; b=N
 CwYyF1XRxmAQ0Q1xq7gk5qrvz/tlXKeIL9JiM/hQiFAMS0RYUYj6VrvYpAzDLhOu6rsT+BmBdMWtD
 LR4CwpA+B8y/gJzix1rrC9zpqba8imfK0tb5o5SwqYx+hTr7q1CidihwMBjKzt7DWKHWBPPBlIORJ
 GS12cll/oP8mBThI=;
Received: from [138.68.56.65] (helo=IdeaWebbMain.localdomain)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mHPHp-00050z-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 21 Aug 2021 11:35:42 +0000
Received: by IdeaWebbMain.localdomain (Postfix, from userid 1006)
 id 7A6383E056; Sat, 21 Aug 2021 11:06:47 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 21 Aug 2021 11:06:47 +0000
From: Gang Wu <user@domain.com>
Message-ID: <03d153f0f7878f368e89facd604206b5@beeculturecrafthoney.com>
MIME-Version: 1.0
X-Spam-Score: 8.0 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.6 RCVD_IN_SBL_CSS        RBL: Received via a relay in Spamhaus SBL-CSS
 [138.68.56.65 listed in zen.spamhaus.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.9 SPF_FAIL               SPF: sender does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.net/Why?s=mfrom;
 id=user%40domain.com; ip=138.68.56.65;
 r=util-malware-1.v13.lw.sourceforge.com]
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mHPHp-00050z-Nx
Subject: Re: [f2fs-dev] Hello
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
Reply-To: gngwuu@protonmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Greetings,

I wish to solicit for a moment of your bustling schedule to discuss a 100% legitimate
business preposition with you that is worth some fortune. If intrigued do reply and I
will finish you with full insights regarding the business.

Sincerely,
Gang Wu



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
