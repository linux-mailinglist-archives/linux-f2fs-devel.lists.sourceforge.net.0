Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1FA3266C1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 19:14:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFhcs-0001fn-B2; Fri, 26 Feb 2021 18:14:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hsamedysonmoi@mmafightland.com>) id 1lFhcq-0001ff-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 18:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Reply-To:From:Date:Message-ID:Subject:To:Sender:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KnVO2a825DPooBCOryg6jj0hfk9zZpjMVfkCaJbuwJ8=; b=eqVRI+3uRonTnGv8voZ8DuVu9b
 9WXWngm0AW0Q4Bb1rj9t4kvudVsblX9iR6Qvs0TA3VsCOObbQeFtF5N9wbaowI7mikaDm6+KrxWfK
 cHw8P2CJPADLKqvDoTJgVQP7YHU5fXt3Xx1LMXkLM/YExY/CFTDc7p0tBEGLkRGzBzlQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:From:Date:
 Message-ID:Subject:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KnVO2a825DPooBCOryg6jj0hfk9zZpjMVfkCaJbuwJ8=; b=N
 qpkfSobso79iryc4vebWIwrRFbvEZAXPPBYGeTcn66YAEYCeL81YEonHeiSJzmetdXQ8hX1Qi5vkD
 UdeM9tdFOGLjB048CgyTf8YgqTMx8/4/xKZ3Ye7ZoJ+UmafaCqb7OmFT2hAoHRBf3+y0p739+kbJ1
 RrDm9knfSuipLz1U=;
Received: from [173.254.228.69] (helo=mmawarfare.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1lFhch-006b86-NI
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 18:14:04 +0000
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <af6790693e004754b1e457147986857b@dronesgator.com>
Date: Fri, 26 Feb 2021 16:31:27 +0100
From: "Jan Wilson" <hsameaysonmoi@mmafightland.com>
MIME-Version: 1.0
X-Mailer-Sent-By: 1
X-Spam-Score: 6.9 (++++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.2 RCVD_IN_BL_SPAMCOP_NET RBL: Received via a relay in bl.spamcop.net
 [Blocked - see <https://www.spamcop.net/bl.shtml?173.254.228.69>]
 0.0 RCVD_IN_MSPIKE_L4      RBL: Bad reputation (-4)
 [173.254.228.69 listed in bl.mailspike.net]
 1.5 RCVD_IN_PSBL           RBL: Received via a relay in PSBL
 [173.254.228.69 listed in psbl.surriel.com]
 0.7 SPF_NEUTRAL            SPF: sender does not match SPF record (neutral)
 0.0 SPF_HELO_NEUTRAL       SPF: HELO does not match SPF record (neutral)
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 0.0 RCVD_IN_MSPIKE_BL      Mailspike blacklisted
 2.5 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Headers-End: 1lFhch-006b86-NI
Subject: [f2fs-dev] check again this smart drone
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
Reply-To: jindongshper@aliyun.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgpIb3BlIGFsbCBpcyB3ZWxsLgpJIGFtIHJlYWNoaW5nIHlvdSBhYm91dCBvdXIgZHJvbmUg
cHJvZHVjdCBJIGhhZCBzZW50IGFib3V0IGEgd2VlayBhZ28uCgpJbiBvdXIgc3RvY2sgd2UgaGF2
ZSB0aGlzIHNtYXJ0IGRyb25lIHJpZ2h0IG5vdywgcmVhZHkgdG8gc2hpcC4KCkZyZXF1ZW5jeTog
NUcKRlBWIGltYWdlIHRyYW5zbWlzc2lvbjogNUcgV2lGaSwgMTAwMG0KU3RhYmxlIHR3by1heGlz
IG1lY2hhbmljYWwgdW5pdmVyc2FsIGpvaW50CjRLIDExMMKwIHdpZGUtYW5nbGUgYWRqdXN0YWJs
ZSBjYW1lcmEuIEVTQyBjYW1lcmEKQ2hhbm5lbDogNkNICkJhdHRlcnk6IDExLjFWIDIzNTBtQWgg
bGl0aGl1bSBpb24gYmF0dGVyeSAoaW5jbHVkZWQpClRyYW5zbWl0dGVyIGJhdHRlcnk6IEFBKjMK
RmxpZ2h0IHRpbWU6IDMwIG1pbnV0ZXMKUmVtb3RlIGNvbnRyb2wgZGlzdGFuY2U6IGFib3V0IDEw
MDBtCkNvbG91cjogQmxhY2sKRmllbGQgb2YgdmlldzogMTEwwrAgd2lkZSBhbmdsZQo0SyBwaXhl
bHM6ClBpY3R1cmU6IDU3MDAqNDI3NQpWaWRlbzogMzg0MCAqIDEwODAKUXVhZHJpbGF0ZXJhbCBz
aXplOgpQcm9kdWN0IGZvbGRpbmcgc2l6ZSAoQ00pOiAxNyoxMS41KjYuN0NNClByb2R1Y3QgZGV2
ZWxvcG1lbnQgc2l6ZSAoQ00pOiAyNioyNio2LjdDTQoKUHJpY2VzOiAoc2hpcHBpbmcgaW5jbHVk
ZWQpCjI4OS41MCBlYWNoICgxLTIwIHVuaXRzKQoyNzkuNTAgZWFjaCAoMjEtNTAgdW5pdHMpCjI2
OS41MCBlYWNoICg1MS0xMDAgdW5pdHMpCmluIHUgcyBkCgpJZiB5b3Ugd2FudCB0byBvcmRlciBp
dCB0b2RheSwgcmVwbHkgb3VyIGVtYWlsIHdpdGggeW91ciBzaGlwcGluZyBhZGRyZXNzCmRldGFp
bHMsIHdlIHdpbGwgbWFrZSB0aGUgc2hpcG1lbnQgZm9yIHlvdS4KV2UgZG8gd29ybGR3aWRlIHNo
aXBwaW5nLCAxMC0xNSBkYXlzLgoKVGhhbmtzIGFuZCBSZWdhcmRzLApKYW4gV2lsc29uCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
