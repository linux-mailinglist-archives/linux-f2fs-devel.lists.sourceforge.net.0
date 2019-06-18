Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C212497BC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Jun 2019 05:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Date:Message-ID:To:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GuBJ6Qstncl6AXEnpzXCZHYf4WRypVgr8uSwjGSaJxw=; b=L/PMpbllj0ItezGPzFUO78Fa+A
	N5LSUq3S+cOFrdGj7gUf7opJWul5CRFNas7frFmOcQ+ivJcBcsDeqfpE1VVLYVjPW2qB575BrTLY9
	F6yFYib7Kvhd5QfRyHKzUKWlSaDz9+niAMYkg5fJ9LHkpfknM1N56EWiLaUbREadwwk0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hd4fI-0002wK-5j; Tue, 18 Jun 2019 03:20:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fbm@hotelpromenade.co.id>) id 1hd4fD-0002vh-NX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 03:20:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:Date:
 Message-ID:Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qconJxnsFOvKw9VaPgv7hA3XyW7S9e4LCo76+iXmffY=; b=JJDw8/zodFAL//kMKT/jNdAYX4
 Q6jqCfNxAuxVoVtZ0vsHeNdsxLrYHvyhHpxrdvkfgaTw+u5Rvinp0sE2gCRzsdIaDT4J8xtMDSJaG
 Uu0cPQ2unaDaw/Oo3u2br2VYvNGvzD+JWXufgfSOWlQSMB6IOVVZDf6fHxL2sGYexUIM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:Date:Message-ID:Subject:To:From:
 Sender:Reply-To:Cc:MIME-Version:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qconJxnsFOvKw9VaPgv7hA3XyW7S9e4LCo76+iXmffY=; b=H
 H4nzq14EpOAsZVTUtzxbFoH+lfDncBqxSVttjBR1G9Sj6OWrWeSH+mOa2SFol6d0h9loQL63INBjt
 frU3nfOF64m4MukZuA1UH42+Qv9jt90qjAd5VU/mUqdRtSAxyqv21Ays2ACqH3sEUk7bYPUQ27lvv
 8EDUdTpKOoMidHkg=;
Received: from mail.hotelpromenade.co.id ([139.255.78.134])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hd4f2-002bE9-Nm
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Jun 2019 03:20:01 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hotelpromenade.co.id (Postfix) with ESMTP id 44E46388D33
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 10:04:58 +0700 (WIB)
Received: from mail.hotelpromenade.co.id ([127.0.0.1])
 by localhost (mail.hotelpromenade.co.id [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bMOcUzBSwEwW
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 10:04:58 +0700 (WIB)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.hotelpromenade.co.id (Postfix) with ESMTP id 151C8388D34
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 10:04:58 +0700 (WIB)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.hotelpromenade.co.id 151C8388D34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotelpromenade.co.id; s=A6760A4A-457D-11E8-A230-5E06A42B8C43;
 t=1560827098; bh=qconJxnsFOvKw9VaPgv7hA3XyW7S9e4LCo76+iXmffY=;
 h=From:To:Message-ID:Date;
 b=BRD8KlxtCaxiX3nR/Gk53mehvB36Nby36CJwwtHeKH2p0i9rb1WN25xOE0RBbEaU0
 KUKpF23GTjlLNQmDTM8uWoQrGeWj5iPcEmLy4Nwp0IBxrUjnxdjP2tTTau/NIOtz9B
 lMrsHiloWOU4iWCoMBWPoMIWQ40wxnlrBrYY0rXxRsvRZzlQ1rUBlKNLMp/es6d45g
 bnDSd8ZWWFL7SBceo2tLGC4sq0GO4309MZIpxhxKxsmivWbA4v3NNqk6Q1oO0GP0eC
 aV0A2+rhJ/Vy1A3q3Zugm/ANOemG/kUJZkmudtPgW2q0uUXsYrmcklEa9SWQONz6tv
 UZ/trFNEyRMTQ==
X-Virus-Scanned: amavisd-new at mail.hotelpromenade.co.id
Received: from mail.hotelpromenade.co.id ([127.0.0.1])
 by localhost (mail.hotelpromenade.co.id [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id E6ErRPrBgOUc
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 10:04:58 +0700 (WIB)
Received: from [127.0.0.1] (197-76-100-131.internetcentral.com.br
 [131.100.76.197])
 by mail.hotelpromenade.co.id (Postfix) with ESMTPSA id E4E7A388D32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 18 Jun 2019 10:04:54 +0700 (WIB)
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <1A6A7692.D2AC4690F5895D20@hotelpromenade.co.id>
X-Priority: 3
Importance: Normal
Date: Tue, 18 Jun 2019 06:02:59 +0300
X-Mailer: Infraware POLARIS Mobile Mailer v2.5
X-Spam-Score: 2.9 (++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 3.0 BITCOIN_DEADLINE       BitCoin with a deadline
X-Headers-End: 1hd4f2-002bE9-Nm
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
From: fbm--- via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: fbm@hotelpromenade.co.id
MIME-Version: 1.0
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
transfer the amount of $600 to my bitcoin address (if you do not know how to do this, write to Google: "Buy Bitcoin").

My bitcoin address (BTC Wallet) is:  39U4zmmjLCedwJBv8eLbjqJLzqXTKNp3qD

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
