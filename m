Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3F37167BA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 May 2023 17:50:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q41cA-0001lW-FR;
	Tue, 30 May 2023 15:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <alexlu@junglejuiceinternational.com>)
 id 1q41c7-0001l4-7S for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 15:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Reply-To:From:Date:Message-ID:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aSCsmhiPmkabHKTqdM4CZYmjEPQ4oowZJCPgWc+77NA=; b=bu3Fokq6wXkahACQaaBBHZaFtA
 +ZEuBlL28OAIA8U9v4+ayjgHqoVIOqDDILJjaaCU7oAmDzK15wZjeFL1qjWFuw7rgQy61oobHueFH
 sArYi7bhBCyyEo1naRP8mmpO6VwHsWNcten5+Q00rKOzc63aNEiqVCNKQaVSKZPpRKbw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:From
 :Date:Message-ID:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aSCsmhiPmkabHKTqdM4CZYmjEPQ4oowZJCPgWc+77NA=; b=J
 RmFKR5mbqoZ7GD0+pAxmPAHSTvTsjKskdp7I9xqktOpJIvLKALP2gBsZgn/ZY1+gFCqag+9iNkpFU
 UA+pm+2RdyGvirX/ki/Y5Dv+qpqSAedXlFGN5G1eksedcfLre1wA/oeCWcO0tJ/3QpXCvcrEXtUjU
 +HFEZre0oIqNAF0U=;
Received: from yncll.com ([69.12.91.126])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1q41c6-00042X-QI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 May 2023 15:50:23 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <b3ba457d5499c68982b2bc2f3d232cc3@vistaprint.com>
Date: Tue, 30 May 2023 17:18:48 +0200
From: "Christina Bevins" <alexva@junglejuiceinternational.com>
MIME-Version: 1.0
X-Helo-Check: bad, Forged Random Domain (yncll.com)
X-Spam-Score: 9.0 (+++++++++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has identified this incoming email as possible spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I hope this email finds you well. I wanted to reach out
 to you today to discuss the possibilities of logo products and apparel for
 your business. Quick question: Who would be the best contact to discu [...]
 Content analysis details:   (9.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE1           RBL: IP Listed in UCEPROTECT Level 1
 [69.12.91.126 listed in dnsbl-1.uceprotect.net]
 2.7 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [69.12.91.126 listed in psbl.surriel.com]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 0.0 SPF_HELO_NEUTRAL       SPF: HELO does not match SPF record (neutral)
 2.0 PYZOR_CHECK            Listed in Pyzor
 (https://pyzor.readthedocs.io/en/latest/)
 2.7 FSL_BULK_SIG           Bulk signature with no Unsubscribe
X-VA-Spam-Flag: YES
X-Spam-Flag: YES
X-Headers-End: 1q41c6-00042X-QI
Subject: [f2fs-dev] [SPAM] logo products and apparel
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
Reply-To: christina@pxo2o.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpJIGhvcGUgdGhpcyBlbWFpbCBmaW5kcyB5b3Ugd2VsbC4gSSB3YW50ZWQgdG8gcmVhY2gg
b3V0IHRvIHlvdSB0b2RheSB0bwpkaXNjdXNzCnRoZSBwb3NzaWJpbGl0aWVzIG9mIGxvZ28gcHJv
ZHVjdHMgYW5kIGFwcGFyZWwgZm9yIHlvdXIgYnVzaW5lc3MuClF1aWNrIHF1ZXN0aW9uOiBXaG8g
d291bGQgYmUgdGhlIGJlc3QgY29udGFjdCB0byBkaXNjdXNzIHlvdXIgY29tcGFueSBsb2dvCnBy
b2R1Y3RzIGFuZCBhcHBhcmVsIHN1Y2ggYXM6CgotVC1zaGlydHMKLW11Z3MKLXdhdGVyIGJvdHRs
ZXMKLVVTQiBmbGFzaCBkcml2ZXMKLXBlbnMKLXBsdXMgMzAwLDAwMCBvdGhlciBwcm9kdWN0cyBm
b3IgeW91ciBidXNpbmVzc+OAggoKT3VyIGNvbXBhbnkgaGFzIGJlZW4gaW4gdGhlIHByb21vdGlv
bmFsIHByb2R1Y3RzIGluZHVzdHJ5IHNpbmNlIDIwMDMsCmFuZCB3ZSBoYXZlIGEgdmFzdCBhbW91
bnQgb2YgZXhwZXJpZW5jZSBpbiBjcmVhdGluZyBjdXN0b20tYnJhbmRlZAptZXJjaGFuZGlzZQp0
aGF0IGNhbiBoZWxwIHlvdSBwcm9tb3RlIHlvdXIgYnJhbmQsIGluY3JlYXNlIGN1c3RvbWVyIGxv
eWFsdHksIGFuZCBkcml2ZQpzYWxlcy4KCldoZXRoZXIgeW914oCZcmUgbG9va2luZyB0byBjcmVh
dGUgYSB1bmlxdWUgcHJvbW90aW9uYWwgaXRlbSBmb3IgYSB0cmFkZQpzaG93LAplbXBsb3llZSBp
bmNlbnRpdmUgcHJvZ3JhbSwgb3IgY29ycG9yYXRlIGdpZnQsIG91ciB0ZWFtIG9mIHByb21vIHBy
b2R1Y3QKc3BlY2lhbGlzdHMgaXMgcmVhZHkgdG8gd29yayB3aXRoIHlvdSBldmVyeSBzdGVwIG9m
IHRoZSB3YXkuIFdl4oCZbGwgaGVscAp5b3Ugc2VsZWN0IHRoZSBwZXJmZWN0IGl0ZW1zIGZvciB5
b3VyIGJ1c2luZXNzLCBkZXNpZ24gYW5kIGNyZWF0ZQpjdXN0b21pemVkIGxvZ29zLAphbmQgZGVs
aXZlciB0b3AtcXVhbGl0eSBmaW5pc2hlZCBwcm9kdWN0cyByaWdodCB0byB5b3VyIGRvb3JzdGVw
LgoKU28sIHdobyB3b3VsZCBiZSB0aGUgYmVzdCBjb250YWN0IHRvIGRpc2N1c3Mgb3VyIHdpZGUg
cmFuZ2Ugb2YgcHJvZHVjdHMgZm9yCnlvdXIgYnVzaW5lc3M/CldlIHdvdWxkIGJlIGRlbGlnaHRl
ZCB0byBkaXNjdXNzIGZ1cnRoZXIgaG93IG91ciBwcm9tb3Rpb25hbCBwcm9kdWN0cyBjYW4KaGVs
cCB5b3UgaW5jcmVhc2UKYnJhbmQgYXdhcmVuZXNzIGFuZCBncm93IHlvdXIgYnVzaW5lc3MuCgpU
aGFuayB5b3UgZm9yIHlvdXIgdGltZSwgYW5kIHdlIGxvb2sgZm9yd2FyZCB0byBoZWFyaW5nIGZy
b20geW91IHNvb24uCgpCZXN0IHJlZ2FyZHMsCgpDaHJpc3RpbmEgQmV2aW5zClByb21vIFByb2R1
Y3QgU3BlY2lhbGlzdAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
