Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE72D8C9498
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 May 2024 14:10:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s8fMv-0001A7-Gx;
	Sun, 19 May 2024 12:10:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sales@keystrokesmt.com>) id 1s8fMt-0001A0-TX
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 May 2024 12:10:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Cc:Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V66w0oHAwkL+IXhRI3NlQ8JpAr2fRpTNFtScpkjgXgE=; b=YEJ/j/n7JoC115kTTFXkMwvYt3
 3AVFJ5CAZ+bhmnV3ZJ3Y6HgP9nWr2tXPTn6yUB5mGLIMUYHR+6bwP6P8ELY6Dzz6gUP1C8yD5xyvg
 CRr8Im6175jBDVkt57dr2i0kZd1vpqURtn72w3dk2R3eCmmquyl6qfRKfJQGsPcVg4RI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Reply-To:Date:From:To:Subject:Content-Description:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Cc:Content-ID:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V66w0oHAwkL+IXhRI3NlQ8JpAr2fRpTNFtScpkjgXgE=; b=QMPIvamA+HROBX/9CniYR9lBlq
 R3VdrF3/9JuwhdRcOX9/fgjweX4MRm0DWjM1vpD/3KTD0v0RMfIgKmr1NexmR5z6hrFG7AvrEp6Hj
 CIHRzIY3BgM6IRwTij9lwx9fYQ/1IlsWfa8f9shd5O4gNwQTC8v7Dv+liAS4T1B+NSzk=;
Received: from ksimail.keystrokesmt.com ([204.248.56.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1s8fMu-0005TD-Bi for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 May 2024 12:10:24 +0000
Received: from [74.50.82.199] [74.50.82.199] by keystrokesmt.com with ESMTP
 (SMTPD-12.5.3.99) id b4020002cef80aa1; Sun, 19 May 2024 06:28:10 -0500
MIME-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: "Agnes Jansson" <sales@keystrokesmt.com>
Date: Sun, 19 May 2024 04:20:58 -0700
Message-Id: <202405190628555.SM184056@[74.50.82.199]>
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: I hope that you are at your best and doing well. The purpose
 of this letter is seeking for a pen pal like friendship and I'd love to and
 be honored to be friends with you if you do not mind.. If the I [...] 
 Content analysis details:   (2.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
 digit [janage2023[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [204.248.56.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [204.248.56.69 listed in list.dnswl.org]
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1s8fMu-0005TD-Bi
Subject: [f2fs-dev] HI
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
Reply-To: janage2023@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I hope that you are at your best and doing well. The purpose of this letter is seeking for a pen pal like friendship and I'd love to and be honored to be friends with you if you do not mind.. If the Idea sounds OK with you, just say yes and we can take it on from there. I look forward tohear hearing from you.. My name is Agnes Jansson From Sweden 36 years , this will mean a lot to me to hear back from you.

Warm Regards.

Agnes



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
