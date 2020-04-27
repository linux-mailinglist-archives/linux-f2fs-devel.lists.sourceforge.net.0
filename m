Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC561BA1E1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2020 13:04:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jT1ZD-0004Zb-7P; Mon, 27 Apr 2020 11:04:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <spo@iasl.com>) id 1jT1ZB-0004ZU-S6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 11:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W18FlU6dYZ9T8PxQAN5cwXV5ZyTJnoaW0bRwpDF0mXY=; b=J8jajm9erLpvqvfu6z8yg5Tj0c
 mPVYL1mjy5q+rBIGCFPRO3IJy0GoKLslvujkhjmqsvC3qxkvuXh1Yo5fJ0iHbymCfrVt3thOuUYwQ
 +JgBNbKj6ERpV4DZ4QYimEjrZMnKtctLcZyYrlQ9vA7QjfsQqJvuOE0tfQXJ1PCWj3cI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W18FlU6dYZ9T8PxQAN5cwXV5ZyTJnoaW0bRwpDF0mXY=; b=Q3rAWnr89t3XD56fqlT7Hn8MK/
 zMQ34kML3Ztng/jAHNBmnnYRGnMGtinEnyx+34ie47JSKZv5PfPShwFvfqEl0t7ZhMimgPHaAgIK3
 vUdgb3Ax8bmp4PGCWl1hx8RPBJbsjIyKWa5ikPIsGxczlMbQ1xuDLIZqPnX0xFUZYGpM=;
Received: from wajo-holdings.jp ([153.120.11.189] helo=www.wajo-holdings.jp)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1jT1Z7-00GM6x-8m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 11:04:49 +0000
Received: from [167.114.42.90] (unknown [167.114.42.90])
 by www.wajo-holdings.jp (Postfix) with ESMTPA id 45177224116E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Apr 2020 20:00:51 +0900 (JST)
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Mr. Ali Ahmed Mohammed" <spo@iasl.com>
Date: Mon, 27 Apr 2020 04:01:05 -0700
X-Spam-Score: 8.6 (++++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [153.120.11.189 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 1.0 MISSING_MID            Missing Message-Id: header
 0.0 HK_NAME_MR_MRS         No description available.
 0.0 LOTS_OF_MONEY          Huge... sums of money
 2.2 FORGED_SPF_HELO        No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
 0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1jT1Z7-00GM6x-8m
Subject: [f2fs-dev] [SPAM] Good Day,
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
Reply-To: mohammedhadinbd@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1jT1ZD-0004Zb-7P@sfs-ml-4.v29.lw.sourceforge.com>

Hello,



Contacting you officially is my pleasure for a great unique business investment in your region.
However, I need your official consent and co-operation that will be of best interest and great
achievement in our favor, over the investment sum of ($12.6Millions US Dollars or more).

I'll appreciate your response for more business details to proceed officially.
Thanks in anticipation.



Yours Sincerely
.
Ali Ahmed Mohammed Hamad.
Tel:+61488874006
whatsapp:+61488874006


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
