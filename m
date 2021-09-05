Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118D401000
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Sep 2021 15:27:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MFQXqJj1/INKsQsVHfGj8HE8q/5BsKnivQKlWlCoJqY=; b=I95wD3SBCviWqyFEp/kYKOSI1A
	TEOcGzepWMus0Dk4yvbwk8o4ROWIWL052xAfxSOUtjzaauMsOMEiLI4QDoHO0BW84OXje7S7gQTda
	+ab6+a0v1wC84jkCJrxHSaphlfI7sM190URtauYRj7OScLE7L7+H6VbkDhs9tCFLXB7E=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMsBO-00017I-T3; Sun, 05 Sep 2021 13:27:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <lsk20@tutamail.com>) id 1mMsBC-00015F-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Sep 2021 13:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVAOURMRXkR0R9wzqMM9dqLEH+kgl3vQjjw5oyKUSdY=; b=hMZO4Nyh6CBrGJZzdbPK3mROAC
 YWk7VQWUIhAY7BANgUNhG5wnOicv7grcLbjg0T8EWLtS44JxnTPK4qfP4z4F+XoEmyvYpqZpaVkEX
 WL5KiETBY/5NQVv/uKzLOFnsb0PqRfFom5IFQZWBSwCFfvv4h+FOZShswE7/oZfq9508=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mVAOURMRXkR0R9wzqMM9dqLEH+kgl3vQjjw5oyKUSdY=; b=D
 gDwWXKgYJo4doet4V1GcOkSJKQaPNRV+mUejWQwnMovdZjRTa5lUvNyYxXAypLQ4Hum+jn0uTcK7+
 CWySECNHa9hrsARTXJ0r1AOiQBQt/gxpf8SituJCA7wziJwR9kkIzFxO50qVXkUD/aCp0iYDToBPF
 asp9Y8G4TmqP71iU=;
Received: from [185.241.149.195] (helo=tutamail.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.92.3)
 id 1mMsB3-0001uK-Iv
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Sep 2021 13:27:18 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Date: 05 Sep 2021 15:27:12 +0200
Message-ID: <20210905152711.647D96D57C1FBCB1@tutamail.com>
MIME-Version: 1.0
X-Spam-Score: 8.1 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (j.bonnafe01[at]gmail.com)
 0.9 SPF_FAIL               SPF: sender does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.net/Why?s=mfrom;
 id=lsk20%40tutamail.com; ip=185.241.149.195;
 r=util-malware-1.v13.lw.sourceforge.com]
 0.0 SPF_HELO_FAIL          SPF: HELO does not match SPF record (fail)
 [SPF failed: Please see http://www.openspf.net/Why?s=helo; id=tutamail.com;
 ip=185.241.149.195; r=util-malware-1.v13.lw.sourceforge.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [185.241.149.195 listed in wl.mailspike.net]
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.9 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1mMsB3-0001uK-Iv
Subject: [f2fs-dev] [SPAM] FINAL NOTICE!
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
From: LSK Foundation via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: j.bonnafe01@gmail.com
Cc: LSK Foundation <lsk20@tutamail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

YOU'VE BEEN GIFTED 2M US DOLLARS, REPLY FOR FURTHER INFORMATION.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
