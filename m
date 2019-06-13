Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2915C43502
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Jun 2019 11:55:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hbMRz-0001vJ-0M; Thu, 13 Jun 2019 09:55:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <missioni@stmarta.org>) id 1hbMRx-0001vC-LU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 09:55:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:Subject:Mime-Version:
 Content-Type:Content-Transfer-Encoding:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6vOczmsvCqZqm13h/kidrVWr98Q7hziLTpX2GQ16GAQ=; b=mZTM1kw6wdlCfHfxiNjLh63cKl
 Mn21URs+TlNn3BPTtJVdHvzAx8qWBBsMmYHp1NFjdrzJUO8PteedzwMt496na2AA2CwGc3YmS+Yq5
 9D9zvTAXAfSXARhG2qhqB9Bd99ex7ZXXsdmI4ISC5ahcs81HWYAF6bYeJlGl3fNktBJw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=To:Date:Message-Id:Subject:Mime-Version:Content-Type:
 Content-Transfer-Encoding:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6vOczmsvCqZqm13h/kidrVWr98Q7hziLTpX2GQ16GAQ=; b=U5q/ykbzJpEeQHydd7JusSE5/f
 SgHzvgZOaCIrQTmWTcyezd3O4KlVW7jVTP54Pcq+voZm9wshXx0gh6lxfiWtp+9UowZkiYD1L6WGw
 z5jU2Ln68Pahh6CZzU8WDZgUUTz6boRljeRJYSMt9oQPGHHGuGgk0kAkEFPgniE22h9s=;
Received: from jolietjake.heavybase.org ([176.9.53.144])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hbMRt-00BMiF-LX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 13 Jun 2019 09:55:15 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by jolietjake.heavybase.org (Postfix) with ESMTP id D485026877C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Jun 2019 11:35:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at jolietjake.heavybase.org
Received: from jolietjake.heavybase.org ([127.0.0.1])
 by localhost (jolietjake.heavybase.org [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bnhhZzbaFHjg
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Jun 2019 11:35:42 +0200 (CEST)
Received: from [127.0.0.1] (unknown [191.53.192.153])
 (Authenticated sender: missioni@stmarta.org)
 by jolietjake.heavybase.org (Postfix) with ESMTPSA id 8EF4526877AD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Jun 2019 11:35:40 +0200 (CEST)
From: missioni@stmarta.org
Mime-Version: 1.0 (1.0)
Message-Id: <08EFC2FD-8A6F-3D25-B0BB-E9E674C00394@stmarta.org>
Date: Thu, 13 Jun 2019 12:34:31 +0300
To: linux-f2fs-devel@lists.sourceforge.net
X-Mailer: iPad Mail (13E238)
X-Spam-Score: 5.8 (+++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 BITCOIN_DEADLINE       BitCoin with a deadline
 3.3 BITCOIN_MALWARE        BitCoin + malware
X-Headers-End: 1hbMRt-00BMiF-LX
Subject: [f2fs-dev] Security Notice. Someone have access to your system.
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

Hello!

I am a hacker who has access to your operating system.
I also have full access to your account.

I've been watching you for a few months now.
The fact is that you were infected with malware through an adult site that you visited.

If you are not familiar with this, I will explain.
Trojan Virus gives me full access and control over a computer or other device.
This means that I can see everything on your screen, turn on the camera and microphone, but you do not know about it.

I also have access to all your contacts and all your correspondence.

Why your antivirus did not detect malware?
Answer: My malware uses the driver, I update its signatures every 4 hours so that your antivirus is silent.

I made a video showing how you satisfy yourself in the left half of the screen, and in the right half you see the video that you watched.
With one click of the mouse, I can send this video to all your emails and contacts on social networks.
I can also post access to all your e-mail correspondence and messengers that you use.

If you want to prevent this,
transfer the amount of $500 to my bitcoin address (if you do not know how to do this, write to Google: "Buy Bitcoin").

My bitcoin address (BTC Wallet) is:  3CVy2H3aHGYBsexdGo7DEdLCgu1ZR9VTfM

After receiving the payment, I will delete the video and you will never hear me again.
I give you 50 hours (more than 2 days) to pay.
I have a notice reading this letter, and the timer will work when you see this letter.

Filing a complaint somewhere does not make sense because this email cannot be tracked like my bitcoin address.
I do not make any mistakes.

If I find that you have shared this message with someone else, the video will be immediately distributed.

Best regards!


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
