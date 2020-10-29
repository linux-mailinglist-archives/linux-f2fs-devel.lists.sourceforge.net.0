Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF3329F25B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Oct 2020 17:57:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYBF9-0006Qm-9l; Thu, 29 Oct 2020 16:57:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kitestramuort@autistici.org>) id 1kYBF6-0006QM-HT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 16:57:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Content-Type
 :Date:To:From:Subject:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sRYdO1U06zUJEMFfgNsafr7qsPqudd5p2nV8QfRfPD4=; b=YlHuD6ZqjInuN6aynFToirnMsi
 PpXyMuLg2Q5qnLaX9AZCIFJMk7WSYH1Bv4LM6uCXInTjo0pfWaYcqnLj9u7xiRbZh0JB61iR7qiqn
 LJEVOYLjxwGG7/rYKGN1N2uBEiTwvXnBv2NPp4kgBoYaDF1eEaIkb+WGlRmLM0JCioH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:To:From:Subject:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sRYdO1U06zUJEMFfgNsafr7qsPqudd5p2nV8QfRfPD4=; b=C
 kDP6JP0SZUwlT5j4s9ox3Zm0a4jKmQ0I00NzTjfx18jdzijRDqSMhtXySY5/s0qHmKNXpqCW9sFpH
 KNyXrxR5nvFLzs8j4SGU/t+n+nJomHVxutpFbrHncCYrmVimBf+7D1ojatXqsPwwRHU4YpU2TC2Ie
 G8auv+9eRL8umZ/U=;
Received: from devianza.investici.org ([198.167.222.108])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYBEp-001GmJ-MD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 16:57:40 +0000
Received: from mx2.investici.org (unknown [127.0.0.1])
 by devianza.investici.org (Postfix) with ESMTP id 4CMWQp5NXdz6vJj
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Oct 2020 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
 s=stigmate; t=1603989650;
 bh=sRYdO1U06zUJEMFfgNsafr7qsPqudd5p2nV8QfRfPD4=;
 h=Subject:From:To:Date:From;
 b=hUPkruUybB0brjjrlyW/DM1IA+lTgxJz+V+0z8X/+rgcFQNaNkuf28qkwtZ99Hwb/
 qk8RPW9FX1500Tmu7D0/osfTXZnJn6HsAgjCSoB4e7KfmGr/B4FWOspnqpcbkyq3X0
 LmtGmFqmaAy4EwucosIXimhIvXweiTTupJ7YxYaU=
Received: from [198.167.222.108] (mx2.investici.org [198.167.222.108])
 (Authenticated sender: kitestramuort@autistici.org) by localhost (Postfix)
 with ESMTPSA id 4CMWQp2XJPz6v2d
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Oct 2020 16:40:50 +0000 (UTC)
Message-ID: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
From: kitestramuort <kitestramuort@autistici.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 29 Oct 2020 17:40:47 +0100
User-Agent: Evolution 3.38.1 
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kYBEp-001GmJ-MD
Subject: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG8swqAKdGhlIG5ldyByYyBpcyBnZW5lcmF0aW5nwqB0aGUgZXJyb3IgYmVsb3cgbXVsdGlw
bGUgdGltZXMgYSBmZXcgbWludXRlcwphZnRlciBib290LgoKVGhpcyBpcyBhIDk3MCBldm8gbnZt
ZSBkcml2ZSBmb3JtYXR0ZWQgd2l0aCBmMmZzIGFuZCBtb3VudGVkIHdpdGggdGhlCmZvbGxvd2lu
ZyBwYXJhbXM6CgovZGV2L252bWUwbjFwNAkvaG9tZSAgICBmMmZzICAKcncsbm9hdGltZSxiYWNr
Z3JvdW5kX2djPW9uLGZzeW5jX21vZGU9bm9iYXJyaWVyLGlubGluZV94YXR0cixpbmxpbmVfZGEK
dGEsaW5saW5lX2RlbnRyeSxmbHVzaF9tZXJnZSxleHRlbnRfY2FjaGUsbW9kZT1hZGFwdGl2ZSxh
Y3RpdmVfbG9ncz02CgkwIDAKCjUuOSB3b3JrcyBmaW5lCgpGMkZTLWZzIChudm1lMG4xcDQpOiBh
Y2Nlc3MgaW52YWxpZCBibGthZGRyOjI2OTI4MDQ1MTkKWyAxNDA1LjUzMjQxNF0gLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tClsgMTQwNS41MzI0MThdIFdBUk5JTkc6IENQVTog
NCBQSUQ6IDI2NTAgYXQgMHhmZmZmZmZmZmE1MzhhYmI3ClsgMTQwNS41MzI0MjBdIE1vZHVsZXMg
bGlua2VkIGluOiB1dmN2aWRlbyB2aWRlb2J1ZjJfdjRsMgp2aWRlb2J1ZjJfdm1hbGxvYyB2aWRl
b2J1ZjJfbWVtb3BzIHZpZGVvYnVmMl9jb21tb24gdmlkZW9kZXYgbWMKWyAxNDA1LjUzMjQ0Ml0g
Q1BVOiA0IFBJRDogMjY1MCBDb21tOiBDYWNoZTIgSS9PIFRhaW50ZWQ6IEcgUyAgIFUgICAKNS4x
MC4wLXJjMS1TICM4ClsgMTQwNS41MzI0NDVdIEhhcmR3YXJlIG5hbWU6IDUxTkIgWDIxM3MvWDIx
M3MsIEJJT1MgNC4xMi0zNjM3LQpnNmFkODU2ODI1YS1kaXJ0eSAxMC8yOC8yMDIwClsgMTQwNS41
MzI0NDhdIFJJUDogMDAxMDoweGZmZmZmZmZmYTUzOGFiYjcKWyAxNDA1LjUzMjQ1M10gQ29kZTog
MDEgYzggMzkgYzYgNzMgMDkgNDEgOGIgNDIgNWMgZTkgMjkgZmUgZmYgZmYgODkgZjIKNDggYzcg
YzYgNGQgODYgMmUgYTYgNDggODkgM2MgMjQgZTggMzggNTUgNzUgMDAgNDggOGIgM2MgMjQgZjAg
ODAgNGYgNDgKMDQgPDBmPiAwYiAzMSBjMCBlOSBhZiBmZSBmZiBmZiA0MSA1NyA0MSA1NiA0MSA1
NSA0MSA1NCA0MSA4OSBjYyAzMSBjOQpbIDE0MDUuNTMyNDU3XSBSU1A6IDAwMTg6ZmZmZjljMzZj
MzNiZjhlMCBFRkxBR1M6IDAwMDEwMjA2ClsgMTQwNS41MzI0NjFdIFJBWDogMDAwMDAwMDAwMDAw
MDAzNiBSQlg6IDAwMDAwMDAwMDAwMDAzNjkgUkNYOgowMDAwMDAwMDAwMDAwMDAwClsgMTQwNS41
MzI0NjRdIFJEWDogZmZmZjhlZjBlZjUxYzY4OCBSU0k6IGZmZmY4ZWYwZWY1MTc3YzAgUkRJOgpm
ZmZmOGVlZDgwZmJlMDAwClsgMTQwNS41MzI0NjddIFJCUDogZmZmZjhlZWRhYmVhZjYwMCBSMDg6
IGZmZmZmZmZmYTY2MDE2YTggUjA5OgowMDAwMDAwMGZmZmZmZmVhClsgMTQwNS41MzI0NzBdIFIx
MDogMDAwMDAwMDBmZmZmYmZmZiBSMTE6IDgwMDAwMDAwZmZmZmMwMDAgUjEyOgowMDAwMDAwMDAw
MDAwMDAxClsgMTQwNS41MzI0NzJdIFIxMzogZmZmZjhlZWVjYmFjODAwMCBSMTQ6IDAwMDAwMDAw
MDAwMDAwMDMgUjE1OgowMDAwMDAwMDAwMDAxMDAwClsgMTQwNS41MzI0NzZdIEZTOiAgMDAwMDdm
NDFiMWU3NTY0MCgwMDAwKSBHUzpmZmZmOGVmMGVmNTAwMDAwKDAwMDApCmtubEdTOjAwMDAwMDAw
MDAwMDAwMDAKWyAxNDA1LjUzMjQ3OV0gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDog
MDAwMDAwMDA4MDA1MDAzMwpbIDE0MDUuNTMyNDgyXSBDUjI6IDAwMDA3ZjQxYjBkMjg0MjUgQ1Iz
OiAwMDAwMDAwMWViNDQ2MDA0IENSNDoKMDAwMDAwMDAwMDE3MDZlMApbIDE0MDUuNTMyNDg1XSBD
YWxsIFRyYWNlOgpbIDE0MDUuNTMyNDg5XSAgPyAweGZmZmZmZmZmYTUzNzMxZmIKWyAxNDA1LjUz
MjQ5Ml0gID8gMHhmZmZmZmZmZmE1MzY4NzJmClsgMTQwNS41MzI0OTRdICA/IDB4ZmZmZmZmZmZh
NTM2OGU1NApbIDE0MDUuNTMyNDk3XSAgPyAweGZmZmZmZmZmYTUzNjk4ZTIKWyAxNDA1LjUzMjQ5
OV0gID8gMHhmZmZmZmZmZmE1MTE1MWFmClsgMTQwNS41MzI1MDRdICA/IDB4ZmZmZmZmZmZhNTM2
OWQ1NgpbIDE0MDUuNTMyNTA2XSAgPyAweGZmZmZmZmZmYTUzNjE0NzAKWyAxNDA1LjUzMjUwOV0g
ID8gMHhmZmZmZmZmZmE1MzY5ZWE2ClsgMTQwNS41MzI1MTBdICA/IDB4ZmZmZmZmZmZhNTM2MTQ5
MgpbIDE0MDUuNTMyNTEyXSAgPyAweGZmZmZmZmZmYTUyNzhkYTYKWyAxNDA1LjUzMjUxNV0gID8g
MHhmZmZmZmZmZmE1Mjk1MGJlClsgMTQwNS41MzI1MThdICA/IDB4ZmZmZmZmZmZhNTI4ZjM3MApb
IDE0MDUuNTMyNTIwXSAgPyAweGZmZmZmZmZmYTUyOTc4MzAKWyAxNDA1LjUzMjUyM10gID8gMHhm
ZmZmZmZmZmE1MjhmMzcwClsgMTQwNS41MzI1MjVdICA/IDB4ZmZmZmZmZmZhNTI4ZjM3MApbIDE0
MDUuNTMyNTI4XSAgPyAweGZmZmZmZmZmYTUyN2JmYmIKWyAxNDA1LjUzMjUzMF0gID8gMHhmZmZm
ZmZmZmE1YjE5MjZkClsgMTQwNS41MzI1MzFdICA/IDB4ZmZmZmZmZmZhNWMwMDA3YwpbIDE0MDUu
NTMyNTM5XSBDUFU6IDQgUElEOiAyNjUwIENvbW06IENhY2hlMiBJL08gVGFpbnRlZDogRyBTICAg
VSAgICAgCjUuMTAuMC1yYzEtUyAjOApbIDE0MDUuNTMyNTQxXSBIYXJkd2FyZSBuYW1lOiA1MU5C
IFgyMTNzL1gyMTNzLCBCSU9TIDQuMTItMzYzNy0KZzZhZDg1NjgyNWEtZGlydHkgMTAvMjgvMjAy
MApbIDE0MDUuNTMyNTQyXSBDYWxsIFRyYWNlOgpbIDE0MDUuNTMyNTQ1XSAgPyAweGZmZmZmZmZm
YTVhZTJhMGEKWyAxNDA1LjUzMjU0N10gID8gMHhmZmZmZmZmZmE1YWQzZTAwClsgMTQwNS41MzI1
NDhdICA/IDB4ZmZmZmZmZmZhNTM4YWJiNwpbIDE0MDUuNTMyNTUwXSAgPyAweGZmZmZmZmZmYTU0
YjUwMmQKWyAxNDA1LjUzMjU1Ml0gID8gMHhmZmZmZmZmZmE1YjE5NDRjClsgMTQwNS41MzI1NTVd
ICA/IDB4ZmZmZmZmZmZhNWIxOTZkOApbIDE0MDUuNTMyNTU3XSAgPyAweGZmZmZmZmZmYTVjMDBh
MGYKWyAxNDA1LjUzMjU2MF0gID8gMHhmZmZmZmZmZmE1MzhhYmI3ClsgMTQwNS41MzI1NjJdICA/
IDB4ZmZmZmZmZmZhNTM3MzFmYgpbIDE0MDUuNTMyNTY1XSAgPyAweGZmZmZmZmZmYTUzNjg3MmYK
WyAxNDA1LjUzMjU2N10gID8gMHhmZmZmZmZmZmE1MzY4ZTU0ClsgMTQwNS41MzI1NjldICA/IDB4
ZmZmZmZmZmZhNTM2OThlMgpbIDE0MDUuNTMyNTcyXSAgPyAweGZmZmZmZmZmYTUxMTUxYWYKWyAx
NDA1LjUzMjU3Nl0gID8gMHhmZmZmZmZmZmE1MzY5ZDU2ClsgMTQwNS41MzI1NzhdICA/IDB4ZmZm
ZmZmZmZhNTM2MTQ3MApbIDE0MDUuNTMyNTgwXSAgPyAweGZmZmZmZmZmYTUzNjllYTYKWyAxNDA1
LjUzMjU4Ml0gID8gMHhmZmZmZmZmZmE1MzYxNDkyClsgMTQwNS41MzI1ODRdICA/IDB4ZmZmZmZm
ZmZhNTI3OGRhNgpbIDE0MDUuNTMyNTg2XSAgPyAweGZmZmZmZmZmYTUyOTUwYmUKWyAxNDA1LjUz
MjU4OV0gID8gMHhmZmZmZmZmZmE1MjhmMzcwClsgMTQwNS41MzI1OTFdICA/IDB4ZmZmZmZmZmZh
NTI5NzgzMApbIDE0MDUuNTMyNTkzXSAgPyAweGZmZmZmZmZmYTUyOGYzNzAKWyAxNDA1LjUzMjU5
Nl0gID8gMHhmZmZmZmZmZmE1MjhmMzcwClsgMTQwNS41MzI1OThdICA/IDB4ZmZmZmZmZmZhNTI3
YmZiYgpbIDE0MDUuNTMyNjAwXSAgPyAweGZmZmZmZmZmYTViMTkyNmQKWyAxNDA1LjUzMjYwMl0g
ID8gMHhmZmZmZmZmZmE1YzAwMDdjClsgMTQwNS41MzI2MDVdIC0tLVsgZW5kIHRyYWNlIDE2ODY0
YjgyNzdlOTJiZmUgXS0tLQoKCgpyZWdhcmRzCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4
LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
