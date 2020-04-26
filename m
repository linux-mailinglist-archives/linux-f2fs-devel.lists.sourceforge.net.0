Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE01B9898
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2020 09:30:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jSyDV-0002fD-72; Mon, 27 Apr 2020 07:30:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <masud.m@ttx-group.com>) id 1jSyDU-0002f6-8z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 07:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdkKnXKpODu5KSLBUytxsncgrtr37kakgTEOJ+IzAwA=; b=Rw5zDao+hbmIVd4J826yN/voKX
 E7Igr1BFd8uNHLImZ97S9N9Z5JgS6bwijFcyigsuOrW2hJ5E6X8WiX6fsDn+0xiG/6pGLDTpKSF70
 YlnnZQNZ1qqFohQvZSL5m1Te/Ebd8HYDzUEoEFRudpWlOGMjBsCmLpoiINngMFanxZj8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdkKnXKpODu5KSLBUytxsncgrtr37kakgTEOJ+IzAwA=; b=Kk5iaQncT0umFgVHZ+ds/0PHGj
 cOFnJVA0OUC0km2+QUtQpkkXSA8i0akBTbKWxgwOElwxRPGomgDee0DD8Gqk2pv4PY8NRvZjXJgKV
 crzPsFo3hIOEFgo/QE1ko2fuGImQ23UbzbVS7iO0K1AydMDr7SUsJTLEQNGgtjBPSjOw=;
Received: from mail.ttx-group.com ([182.160.106.194] helo=ttx-group.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jSyDP-00HB5r-IE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Apr 2020 07:30:12 +0000
Received: (qmail 23900 invoked by uid 1008); 27 Apr 2020 05:18:57 +0600
Received: from unknown (HELO ?204.10.162.134?)
 (masud.m@ttx-group.com@204.10.162.134)
 by ttx-group.com with SMTP; 27 Apr 2020 05:18:57 +0600
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Mr. Okrapah Adjei" <masud.m@ttx-group.com>
Date: Sun, 26 Apr 2020 16:16:44 -0700
X-Spam-Score: 6.8 (++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.3 RCVD_IN_RP_RNBL        RBL: Relay in RNBL,
 https://senderscore.org/blacklistlookup/
 [182.160.106.194 listed in bl.score.senderscore.com]
 1.7 DEAR_SOMETHING         BODY: Contains 'Dear (something)'
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in digit
 (okrapahadjei233[at]gmail.com)
 1.0 MISSING_MID            Missing Message-Id: header
 0.0 HK_NAME_MR_MRS         No description available.
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jSyDP-00HB5r-IE
Subject: [f2fs-dev] Product Inquiry
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
Reply-To: okrapahadjei233@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1jSyDV-0002fD-72@sfs-ml-4.v29.lw.sourceforge.com>

Dear Sir,

We got your company information through an exhaustive search.

Our scope is basically to search for foreign companies to bid for contract supply on commission basis.

We are interested in buying your products in a larger quantity if only you can supply and open for business.

Best Regard,
Mr. Okrapah Adjei
CEO
OK-Adjei Sourcing Ltd
Accra,Ghana


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
