Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C40ECB3CF1C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Aug 2025 21:44:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WB1bggoHf+lnsiwiz/L5SveNNxRTJCOa3M2lv/YDbFg=; b=Bh3CrK/13kxKQhG8JLyJxFaCH8
	Xwjhd8BqqrpcfVUAwcGq4QtAE0KrKa2lVCQCamZD5woo21RGRXVyi19HOK7ZBP2gcAsXU+PLeeVOs
	AkcR14eotLx7UpSp/wqS5o0CbjXL4sXxbmTx4sC1mHPkIUoppiiY89zZwawnf399ujNY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1usRUv-0001CY-64;
	Sat, 30 Aug 2025 19:44:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <edwin.herrera@saluslaboris.com>) id 1usRUf-0001CD-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 19:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:To:From:Reply-To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=LR++otrf8CMNCDyLRfwkNXE0WJ
 rVqvY6oyH/CHco65ZmsPJ0UJzC4zXOOVNPLWlY6MNVPodXlQy75X4eHRY9k+ZrqMWrBOI3WqZcjVd
 71V/ZwgdAi4fYtyUyniASlQncgjVwQHagWFw+9mumXYgffGKvmlfQw6H8qpRbINdyGzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:To:From:Reply-To:Sender:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E2sh7PkU99v95gXhyMFBk9zs8wQA9SBmo0ZEWgF1/ao=; b=b
 vkzHSwS7vgGutF6efSvPbpll6yxsDvMvcdfbghn1ncNqirEG3+muaOswBeSIv5+J37lroV2S7BUMs
 r6vm72+wPFybrANco3eOglXaYHVG2sXnyurYkht0YN3xffHw+s1DaIPUWRSXSFIlI7ciWMFyN9LfB
 A89lR950O4LAJHG8=;
Received: from mail.saluslaboris.com ([170.231.171.166])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1usRUe-0001O9-Il for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 30 Aug 2025 19:44:09 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.saluslaboris.com (Postfix) with ESMTP id 154A7DD138B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 13:30:55 -0500 (-05)
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id 6Yc5jr92-Hsn for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 13:30:55 -0500 (-05)
Received: from localhost (localhost [127.0.0.1])
 by mail.saluslaboris.com (Postfix) with ESMTP id AEC13DD142C3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 13:26:49 -0500 (-05)
X-Virus-Scanned: amavis at saluslaboris.com
Received: from mail.saluslaboris.com ([127.0.0.1])
 by localhost (mail.saluslaboris.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id iSj_dvmLyKX6 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 13:26:49 -0500 (-05)
Received: from [45.138.16.152] (unknown [45.138.16.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.saluslaboris.com (Postfix) with ESMTPSA id 824CDDD138B0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Aug 2025 13:21:16 -0500 (-05)
To: linux-f2fs-devel@lists.sourceforge.net
Date: 30 Aug 2025 11:21:15 -0700
Message-ID: <20250830112115.FCA6A30B94FE7D65@saluslaboris.com>
MIME-Version: 1.0
X-Spam-Score: 4.6 (++++)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Wir freuen uns, Ihnen mitteilen zu können, dass Sie zu den
    Gewinnern der jüngsten SuperEnalotto-Ziehung in Zusammenarbeit mit Lotto24,
    EuroMillions und Powerball gehören. Sie haben einen einmaligen [...] 
 
 Content analysis details:   (4.6 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
                             was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
                              for more information.
                             [170.231.171.166 listed in list.dnswl.org]
  0.0 LOTS_OF_MONEY          Huge... sums of money
  1.8 MONEY_NOHTML           Lots of money in plain text
  0.3 MONEY_FREEMAIL_REPTO   Lots of money from someone using free email?
  2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1usRUe-0001O9-Il
Subject: [f2fs-dev] xls
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
From: "edwin.herrera--- via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: info.superenalotto@gmail.com
Cc: edwin.herrera@saluslaboris.com
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
aW4KQ29kZS1OYWNocmljaHQ6IDczN0dIUzk4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
