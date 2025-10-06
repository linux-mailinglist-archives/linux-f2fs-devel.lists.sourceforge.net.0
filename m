Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E4CBBD146
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Oct 2025 07:11:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:MIME-Version:Message-ID:Date:To:From:Sender:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UlrEQLaYh7u8yg7ckLwUuBmwA6f675Y8hqQZHU378dw=; b=g1UziEci/xT88iwKCBaK+VAH3F
	E+LrmNMLvGjsBikuiPHC7Ct0kAZIpdyhrnwwmq7/8p62teB8JjlTeyygvM2Xq/KaN+F5lQ3jaOK42
	1ChNAzYDgzTYufGa9bqloEMu8BDKCIwbDnafSYchsMDnwcrASR6Cn8JY3bwSqu4YNiGs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v5dVi-0000Sg-JC;
	Mon, 06 Oct 2025 05:11:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <cwm@millersparty.com>) id 1v5dVh-0000SM-3z
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 05:11:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fXjCDdBKJtaqAnII1u9YIaRu2he3L9vFhcMRM/C1VJY=; b=dPxIgFYLPfSr1Teq8bvVGwtork
 l+bWdcsziKOS0ypXxEGqaC2PtNmSXdAg/ZswnxVL1m1JaF5JlAWCY/tq9zeoU8q3NcpMs8EcM79B2
 hOwHcWEjx/aHVen9jkNoLaeqhjmVM/4yvcKTlXA5WRq649bjdhdbqwHj/hCqnyQ4P8f0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fXjCDdBKJtaqAnII1u9YIaRu2he3L9vFhcMRM/C1VJY=; b=T
 tJ2BOGCxRlnqooaYprV8pHWXVdxGMxUKQvKx0OEGxZrPnEzKR2Nc938WCdLaHEYSZb6ce6aqg9lpX
 YKCReT9RbME9xHcza2jpQvpWrHyDEkV7DOOsYrzFsqMAoprcfqePe0FkORaQYGLIqDVUSXXIE544/
 2lUCwK9avA+fiW8U=;
Received: from [69.84.36.126] (helo=host12.cannet.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v5dVh-0004x7-C2 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Oct 2025 05:11:45 +0000
Received: from [45.138.16.152] (unknown [45.138.16.152])
 by host12.cannet.com (Postfix) with ESMTPSA id 448BC128356
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Oct 2025 00:45:16 -0400 (EDT)
From: cwm@millersparty.com
To: linux-f2fs-devel@lists.sourceforge.net
Date: 5 Oct 2025 21:45:15 -0700
Message-ID: <20251005214515.83D3161F6554C0E1@millersparty.com>
MIME-Version: 1.0
X-Spam-Score: 5.9 (+++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Wir freuen uns, Ihnen mitteilen zu können, dass Sie zu den
    Gewinnern der jüngsten SuperEnalotto-Ziehung in Zusammenarbeit mit Lotto24,
    EuroMillions und Powerball gehören. Sie haben einen einmaligen [...] 
 
 Content analysis details:   (5.9 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
  0.0 LOTS_OF_MONEY          Huge... sums of money
  1.3 RDNS_NONE              Delivered to internal network by a host with no rDNS
  1.8 MONEY_NOHTML           Lots of money in plain text
  0.3 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1v5dVh-0004x7-C2
Subject: [f2fs-dev] [SPAM] xls/
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
Reply-To: info.superenalotto@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

V2lyIGZyZXVlbiB1bnMsIElobmVuIG1pdHRlaWxlbiB6dSBrw7ZubmVuLCBkYXNzIFNpZSB6dSBk
ZW4gCkdld2lubmVybiBkZXIgasO8bmdzdGVuIFN1cGVyRW5hbG90dG8tWmllaHVuZyBpbiBadXNh
bW1lbmFyYmVpdCAKbWl0IExvdHRvMjQsIEV1cm9NaWxsaW9ucyB1bmQgUG93ZXJiYWxsIGdlaMO2
cmVuLiBTaWUgaGFiZW4gZWluZW4gCmVpbm1hbGlnZW4gR2V3aW5uIHZvbiDigqwzLjg1MC4wMDAg
IGluIGRlciB6d2VpdGVuIEdld2lubmtsYXNzZSAKZ2V3b25uZW4uIFVtIElocmVuIEdld2lubiBh
Ynp1d2lja2Vsbiwgc2VuZGVuIFNpZSB1bnMgYml0dGUgCmZvbGdlbmRlIEluZm9ybWF0aW9uZW4g
cGVyIEUtTWFpbDoKClZvbGxzdMOkbmRpZ2VyIE5hbWU6IExhbmQ6IFdvaG5hZHJlc3NlOiBBbHRl
cjogR2VzY2hsZWNodDogQmVydWY6IApIYW5keW51bW1lcjogV2hhdHNBcHAtTnVtbWVyLgoKSW0g
TmFtZW4gZGVyIE9ubGluZS1Mb3R0ZXJpZWFidGVpbHVuZ2VuIFN1cGVyRW5hbG90dG8sIApFdXJv
TWlsbGlvbnMgdW5kIFBvd2VyYmFsbCBncmF0dWxpZXJlbiB3aXIgSWhuZW4gaGVyemxpY2ggenUg
CklocmVtIEdld2lubi4KCk1pdCBmcmV1bmRsaWNoZW4gR3LDvMOfZW4KCkZyYXUgS2F0aGVyaW5l
IEZlZGVyaWNvCkxlaXRlcmluIE9ubGluZS1aYWhsdW5nZW4gLyBWYWxpZGllcnVuZ3NtYW5hZ2Vy
aW4KIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
