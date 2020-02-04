Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E7E151881
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Feb 2020 11:11:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iyvAV-0005qq-HT; Tue, 04 Feb 2020 10:10:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <admin@moxiege.cf>) id 1iyvAT-0005qD-4T
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 10:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=521li4DmxBYdw5SGbiitj1S9SqHOcWV7YwmdJMILtbY=; b=O/vaZzJ83IplDu6DaCT2MvKqnN
 BLlGSrC4DhWFJ7s28n/sGce/MWjX7xjnASBK7MjUJZPiim1ssJFnvczy3uqaKMgSz2a3Nz/93OyA3
 Fsj2Fb1mD5U7+pBC2WKVlDw/rwUlJPUDpn9A3V3z62Wzt63pMxsFtn12bmxqEEPfLA7g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=521li4DmxBYdw5SGbiitj1S9SqHOcWV7YwmdJMILtbY=; b=m2NNI/S8J+MUXdAIPlCtJ46ZS/
 7GtZ+cEgLVGf0flA8yx5tfo5Zb0JyIg2g7/TT5DUJGygeNdvm5tht7/hQysTd4IUzV5lvTL9Ffute
 KHDLd7TeHVWovA1F4yTfiuQpDui30t9ywhA5BKiQifNJTUgEuH9MvIJ8DoFaVDfN3Zc8=;
Received: from [94.177.232.49] (helo=mail.moxiege.cf)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1iyvAQ-009uav-E4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 04 Feb 2020 10:10:53 +0000
Received: from [86.106.131.147] (unknown [86.106.131.147])
 by mail.moxiege.cf (Postfix) with ESMTPA id 912091F117
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Feb 2020 03:40:04 -0500 (EST)
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: admin@moxiege.cf
Date: Tue, 04 Feb 2020 08:40:01 -0800
X-Spam-Score: 5.3 (+++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.5 SUBJ_ALL_CAPS          Subject is all capitals
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 DATE_IN_FUTURE_06_12   Date: is 6 to 12 hours after Received: date
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (elmirafernandez1960[at]gmail.com)
 1.0 MISSING_MID            Missing Message-Id: header
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iyvAQ-009uav-E4
Subject: [f2fs-dev] WARM GREETINGS
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
Reply-To: elmirafernandez1960@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1iyvAV-0005qq-HT@sfs-ml-1.v29.lw.sourceforge.com>

Hello,
I am Mrs Elmira Fernandez and it's my pleasure to meet you, I saw your profile and i want to discuss an interesting project with you, I am hoping to get your response to give you more details.

Best regards,
Mrs Elmira Fernandez
Account Executive


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
