Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA02524467
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 May 2022 06:40:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1np0cG-0007PD-Ll; Thu, 12 May 2022 04:39:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mathejohnson91@gmail.com>) id 1np0cF-0007P6-Db
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:Mime-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sE63p9PwzcSxJDQV5NZ80tysrrP/MMPT0cYo/+JAmrw=; b=QyNpAcO4cvPy8ADZof5qau8rtG
 wXBUznpHP4l9STjp73Abg6+LPvx97+R/OooZ+Hiexh0AtvoR05fvssyvszqjureapJ+5CrOXSwUVF
 dHINhloHXH/GsHxByebw46saJLE6nDLlQpyh+4B3iWRMd7sKDa0dwLhXgoDpL3bY1BS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ; h=Subject:Reply-To:Date:From:To:Content-Description:
 Content-Transfer-Encoding:Mime-Version:Content-Type:Sender:Message-ID:Cc:
 Content-ID:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:
 Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sE63p9PwzcSxJDQV5NZ80tysrrP/MMPT0cYo/+JAmrw=; b=Ktodz9/mwQO6RS0VHOm6CM5aEO
 rqaPzo54ne4TnF6yf6orkNxDR8bqsQZrOyqBMAgYetCOaW6Q6KAhxqA9mzkIMTWCTtH3yOPlGw+xp
 j+ra074lsT9z5riesIO140f2FXbgR0v+T556xBIUq8AXvRPAQeCVbf+dJ0hwweS2UgVY=;
Received: from [94.249.236.152] (helo=host.securemail.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.94.2)
 id 1np0cD-000556-37
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 May 2022 04:39:53 +0000
Received: from [103.252.117.68] (unknown [103.252.117.68])
 by host.securemail.com (Postfix) with ESMTPA id 317D0B52E32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 May 2022 07:32:46 +0300 (MSK)
Mime-Version: 1.0
Content-Description: Mail message body
To: linux-f2fs-devel@lists.sourceforge.net
From: mathejohnson91@gmail.com
Date: Thu, 12 May 2022 07:32:45 +0300
X-Spam-Score: 8.2 (++++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello there, My names are Mathew Johnson, I am representing
 the interest of a certain politically exposed person, we are looking for
 partners overseas that can manage high-value funds for a period of 5-10 years, 
 t [...] Content analysis details:   (8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [94.249.236.152 listed in dnsbl-1.uceprotect.net]
 1.0 FORGED_GMAIL_RCVD      'From' gmail.com does not match 'Received'
 headers
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [mathejohnson91[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [mathejohnson91[at]gmail.com]
 0.0 DKIM_ADSP_CUSTOM_MED   No valid author signature, adsp_override is
 CUSTOM_MED
 0.0 T_SPF_HELO_TEMPERROR   SPF: test of HELO record failed (temperror)
 1.0 SPF_SOFTFAIL           SPF: sender does not match SPF record (softfail)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [94.249.236.152 listed in wl.mailspike.net]
 1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.1 MISSING_MID            Missing Message-Id: header
 0.0 SPOOFED_FREEMAIL_NO_RDNS From SPOOFED_FREEMAIL and no rDNS
 1.2 NML_ADSP_CUSTOM_MED    ADSP custom_med hit, and not from a mailing
 list 1.0 SPOOFED_FREEMAIL       No description available.
 1.3 SPOOF_GMAIL_MID        From Gmail but it doesn't seem to be...
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1np0cD-000556-37
Subject: [f2fs-dev] [SPAM] Your kind attention
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
Reply-To: mathew@mjsconsortium.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
Message-Id: <E1np0cG-0007PD-Ll@sfs-ml-4.v29.lw.sourceforge.com>

SGVsbG8gdGhlcmUsCgpNeSBuYW1lcyBhcmUgTWF0aGV3IEpvaG5zb24sIEkgYW0gcmVwcmVzZW50
aW5nIHRoZSBpbnRlcmVzdCBvZiBhIGNlcnRhaW4gcG9saXRpY2FsbHkgZXhwb3NlZCBwZXJzb24s
IHdlIGFyZSBsb29raW5nIGZvciBwYXJ0bmVycyBvdmVyc2VhcyB0aGF0IGNhbiBtYW5hZ2UgaGln
aC12YWx1ZSBmdW5kcyBmb3IgYSBwZXJpb2Qgb2YgNS0xMCB5ZWFycywgdGhlIGZ1bmRzIGhhdmUg
YmVlbiBhY2NydWVkIGJ5IHRoZSBpbmZsdWVuY2Ugb2YgdGhlIHBvd2VyIG9mIG15IGJlbmVmYWN0
b3LigJlzIG9mZmljZS4KClBsZWFzZSBkbyBjb250YWN0IG1lIGlmIHlvdSBhcmUgaW50ZXJlc3Rl
ZCBhbmQgSSB3aWxsIGV4cGxhaW4gdGhlIGJ1c2luZXNzIHRvIHlvdSBpbiBkZXRhaWwgZm9yIHlv
dSB0byBiZXR0ZXIgdW5kZXJzdGFuZCB0aGUgdHJhbnNhY3Rpb24sIEkgY2FuIGFzc3VyZSB5b3Ug
dGhhdCB0aGlzIHdpbGwgYmUgb2YgbXV0dWFsIGJlbmVmaXQgdG8gYWxsLgoKWW91IGNhbiByZXNw
b25kIHRvIG1lIGFuZCBpbGwgc2VuZCB5b3UgYSBkZXRhaWxlZCBleHBsYW5hdGlvbgoKWW91cnMu
CgpNYXRoZXcgSm9obnNvbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
