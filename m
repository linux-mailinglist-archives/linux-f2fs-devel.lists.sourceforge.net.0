Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5DF29FAC8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 02:51:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYJZD-00059i-68; Fri, 30 Oct 2020 01:50:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kYJZ7-00059H-40
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bl/js1l9IBR4x91cqaWvXN+l7e+Eyo7PAKnfPC3m8sc=; b=DOqQVlfuNlCnFXR6nTzJzgykxu
 O645/Pw8WLclatNKeKBUL41XBvvbOABOOtXzmS/GEdkrhDpLRdc14pOleVia7NPLzKuLCrfktdWmk
 MQVpc02vWOBdVJUZK9CAxDaj6n4NxCDOqmxKELC1VCTRbtgSEqJ6wCzaUXPOyfV0KMa4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bl/js1l9IBR4x91cqaWvXN+l7e+Eyo7PAKnfPC3m8sc=; b=RODfFAbyTxES69fGfeLR22TkK0
 rbtgX4byoEMoFf3cVrSC8RHbhbgm8Ny64jr8h7b1q34wXvECy2xNjQcI7w+NzzXxlFDFbyzFBAHbE
 2ZL2B+puZs/pXm2PO7XFTP6jU7jra0Ao+Kdm6Lgmg6OldmchLtfuYt7H8usb7VX+qzeY=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kYJZ3-00CLfV-5A
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:50:53 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMldD0GxvzLrBT;
 Fri, 30 Oct 2020 09:50:40 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Fri, 30 Oct
 2020 09:50:34 +0800
To: kitestramuort <kitestramuort@autistici.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1c0ea7b6-73b5-9027-e67f-3dfff8e50855@huawei.com>
Date: Fri, 30 Oct 2020 09:50:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4c3d4693b7e60d6e87b6255986c9b21f42f58cf8.camel@autistici.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kYJZ3-00CLfV-5A
Subject: Re: [f2fs-dev] Linux 5.10-rc1: F2FS-fs access invalid blkaddr
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8xMC8zMCAwOjQwLCBraXRlc3RyYW11b3J0IHdyb3RlOgo+IEhlbGxvLAo+IHRoZSBu
ZXcgcmMgaXMgZ2VuZXJhdGluZ8KgdGhlIGVycm9yIGJlbG93IG11bHRpcGxlIHRpbWVzIGEgZmV3
IG1pbnV0ZXMKPiBhZnRlciBib290Lgo+IAo+IFRoaXMgaXMgYSA5NzAgZXZvIG52bWUgZHJpdmUg
Zm9ybWF0dGVkIHdpdGggZjJmcyBhbmQgbW91bnRlZCB3aXRoIHRoZQo+IGZvbGxvd2luZyBwYXJh
bXM6Cj4gCj4gL2Rldi9udm1lMG4xcDQJL2hvbWUgICAgZjJmcwo+IHJ3LG5vYXRpbWUsYmFja2dy
b3VuZF9nYz1vbixmc3luY19tb2RlPW5vYmFycmllcixpbmxpbmVfeGF0dHIsaW5saW5lX2RhCj4g
dGEsaW5saW5lX2RlbnRyeSxmbHVzaF9tZXJnZSxleHRlbnRfY2FjaGUsbW9kZT1hZGFwdGl2ZSxh
Y3RpdmVfbG9ncz02Cj4gCTAgMAo+IAo+IDUuOSB3b3JrcyBmaW5lCj4gCj4gRjJGUy1mcyAobnZt
ZTBuMXA0KTogYWNjZXNzIGludmFsaWQgYmxrYWRkcjoyNjkyODA0NTE5CgpUaGUgYmxrYWRkciBz
aG91bGQgaGF2ZSBleGNlZWRlZCBkZXZpY2UncyBzcGFjZSBib3VuZGFyeS4KCkl0IGxvb2tzIGl0
IGRvZXNuJ3QgcHJpbnQgZnVuY3Rpb24gbmFtZSBpbiBjYWxsIHN0YWNrLCBJIGNhbid0IHRyYWNr
IGludG8KZGV0YWlsIGZ1bmN0aW9uIGFueSBmdXJ0aGVyLCBJIGNoZWNrZWQgcGF0Y2hlcyBtZXJn
ZWQgaW4gNS4xMHJjMSwgaG93ZXZlcgpJIGdvdCBub3RoaW5nLgoKQ291bGQgeW91IHBsZWFzZSB0
cnkgZnNjayAtLWRyeS1ydW4sIGFuZCBzaGFyZSB0aGUgb3V0cHV0PwoKVGhhbmtzLAoKCj4gWyAx
NDA1LjUzMjQxNF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCj4gWyAxNDA1
LjUzMjQxOF0gV0FSTklORzogQ1BVOiA0IFBJRDogMjY1MCBhdCAweGZmZmZmZmZmYTUzOGFiYjcK
PiBbIDE0MDUuNTMyNDIwXSBNb2R1bGVzIGxpbmtlZCBpbjogdXZjdmlkZW8gdmlkZW9idWYyX3Y0
bDIKPiB2aWRlb2J1ZjJfdm1hbGxvYyB2aWRlb2J1ZjJfbWVtb3BzIHZpZGVvYnVmMl9jb21tb24g
dmlkZW9kZXYgbWMKPiBbIDE0MDUuNTMyNDQyXSBDUFU6IDQgUElEOiAyNjUwIENvbW06IENhY2hl
MiBJL08gVGFpbnRlZDogRyBTICAgVQo+IDUuMTAuMC1yYzEtUyAjOAo+IFsgMTQwNS41MzI0NDVd
IEhhcmR3YXJlIG5hbWU6IDUxTkIgWDIxM3MvWDIxM3MsIEJJT1MgNC4xMi0zNjM3LQo+IGc2YWQ4
NTY4MjVhLWRpcnR5IDEwLzI4LzIwMjAKPiBbIDE0MDUuNTMyNDQ4XSBSSVA6IDAwMTA6MHhmZmZm
ZmZmZmE1MzhhYmI3Cj4gWyAxNDA1LjUzMjQ1M10gQ29kZTogMDEgYzggMzkgYzYgNzMgMDkgNDEg
OGIgNDIgNWMgZTkgMjkgZmUgZmYgZmYgODkgZjIKPiA0OCBjNyBjNiA0ZCA4NiAyZSBhNiA0OCA4
OSAzYyAyNCBlOCAzOCA1NSA3NSAwMCA0OCA4YiAzYyAyNCBmMCA4MCA0ZiA0OAo+IDA0IDwwZj4g
MGIgMzEgYzAgZTkgYWYgZmUgZmYgZmYgNDEgNTcgNDEgNTYgNDEgNTUgNDEgNTQgNDEgODkgY2Mg
MzEgYzkKPiBbIDE0MDUuNTMyNDU3XSBSU1A6IDAwMTg6ZmZmZjljMzZjMzNiZjhlMCBFRkxBR1M6
IDAwMDEwMjA2Cj4gWyAxNDA1LjUzMjQ2MV0gUkFYOiAwMDAwMDAwMDAwMDAwMDM2IFJCWDogMDAw
MDAwMDAwMDAwMDM2OSBSQ1g6Cj4gMDAwMDAwMDAwMDAwMDAwMAo+IFsgMTQwNS41MzI0NjRdIFJE
WDogZmZmZjhlZjBlZjUxYzY4OCBSU0k6IGZmZmY4ZWYwZWY1MTc3YzAgUkRJOgo+IGZmZmY4ZWVk
ODBmYmUwMDAKPiBbIDE0MDUuNTMyNDY3XSBSQlA6IGZmZmY4ZWVkYWJlYWY2MDAgUjA4OiBmZmZm
ZmZmZmE2NjAxNmE4IFIwOToKPiAwMDAwMDAwMGZmZmZmZmVhCj4gWyAxNDA1LjUzMjQ3MF0gUjEw
OiAwMDAwMDAwMGZmZmZiZmZmIFIxMTogODAwMDAwMDBmZmZmYzAwMCBSMTI6Cj4gMDAwMDAwMDAw
MDAwMDAwMQo+IFsgMTQwNS41MzI0NzJdIFIxMzogZmZmZjhlZWVjYmFjODAwMCBSMTQ6IDAwMDAw
MDAwMDAwMDAwMDMgUjE1Ogo+IDAwMDAwMDAwMDAwMDEwMDAKPiBbIDE0MDUuNTMyNDc2XSBGUzog
IDAwMDA3ZjQxYjFlNzU2NDAoMDAwMCkgR1M6ZmZmZjhlZjBlZjUwMDAwMCgwMDAwKQo+IGtubEdT
OjAwMDAwMDAwMDAwMDAwMDAKPiBbIDE0MDUuNTMyNDc5XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4gWyAxNDA1LjUzMjQ4Ml0gQ1IyOiAwMDAwN2Y0
MWIwZDI4NDI1IENSMzogMDAwMDAwMDFlYjQ0NjAwNCBDUjQ6Cj4gMDAwMDAwMDAwMDE3MDZlMAo+
IFsgMTQwNS41MzI0ODVdIENhbGwgVHJhY2U6Cj4gWyAxNDA1LjUzMjQ4OV0gID8gMHhmZmZmZmZm
ZmE1MzczMWZiCj4gWyAxNDA1LjUzMjQ5Ml0gID8gMHhmZmZmZmZmZmE1MzY4NzJmCj4gWyAxNDA1
LjUzMjQ5NF0gID8gMHhmZmZmZmZmZmE1MzY4ZTU0Cj4gWyAxNDA1LjUzMjQ5N10gID8gMHhmZmZm
ZmZmZmE1MzY5OGUyCj4gWyAxNDA1LjUzMjQ5OV0gID8gMHhmZmZmZmZmZmE1MTE1MWFmCj4gWyAx
NDA1LjUzMjUwNF0gID8gMHhmZmZmZmZmZmE1MzY5ZDU2Cj4gWyAxNDA1LjUzMjUwNl0gID8gMHhm
ZmZmZmZmZmE1MzYxNDcwCj4gWyAxNDA1LjUzMjUwOV0gID8gMHhmZmZmZmZmZmE1MzY5ZWE2Cj4g
WyAxNDA1LjUzMjUxMF0gID8gMHhmZmZmZmZmZmE1MzYxNDkyCj4gWyAxNDA1LjUzMjUxMl0gID8g
MHhmZmZmZmZmZmE1Mjc4ZGE2Cj4gWyAxNDA1LjUzMjUxNV0gID8gMHhmZmZmZmZmZmE1Mjk1MGJl
Cj4gWyAxNDA1LjUzMjUxOF0gID8gMHhmZmZmZmZmZmE1MjhmMzcwCj4gWyAxNDA1LjUzMjUyMF0g
ID8gMHhmZmZmZmZmZmE1Mjk3ODMwCj4gWyAxNDA1LjUzMjUyM10gID8gMHhmZmZmZmZmZmE1Mjhm
MzcwCj4gWyAxNDA1LjUzMjUyNV0gID8gMHhmZmZmZmZmZmE1MjhmMzcwCj4gWyAxNDA1LjUzMjUy
OF0gID8gMHhmZmZmZmZmZmE1MjdiZmJiCj4gWyAxNDA1LjUzMjUzMF0gID8gMHhmZmZmZmZmZmE1
YjE5MjZkCj4gWyAxNDA1LjUzMjUzMV0gID8gMHhmZmZmZmZmZmE1YzAwMDdjCj4gWyAxNDA1LjUz
MjUzOV0gQ1BVOiA0IFBJRDogMjY1MCBDb21tOiBDYWNoZTIgSS9PIFRhaW50ZWQ6IEcgUyAgIFUK
PiA1LjEwLjAtcmMxLVMgIzgKPiBbIDE0MDUuNTMyNTQxXSBIYXJkd2FyZSBuYW1lOiA1MU5CIFgy
MTNzL1gyMTNzLCBCSU9TIDQuMTItMzYzNy0KPiBnNmFkODU2ODI1YS1kaXJ0eSAxMC8yOC8yMDIw
Cj4gWyAxNDA1LjUzMjU0Ml0gQ2FsbCBUcmFjZToKPiBbIDE0MDUuNTMyNTQ1XSAgPyAweGZmZmZm
ZmZmYTVhZTJhMGEKPiBbIDE0MDUuNTMyNTQ3XSAgPyAweGZmZmZmZmZmYTVhZDNlMDAKPiBbIDE0
MDUuNTMyNTQ4XSAgPyAweGZmZmZmZmZmYTUzOGFiYjcKPiBbIDE0MDUuNTMyNTUwXSAgPyAweGZm
ZmZmZmZmYTU0YjUwMmQKPiBbIDE0MDUuNTMyNTUyXSAgPyAweGZmZmZmZmZmYTViMTk0NGMKPiBb
IDE0MDUuNTMyNTU1XSAgPyAweGZmZmZmZmZmYTViMTk2ZDgKPiBbIDE0MDUuNTMyNTU3XSAgPyAw
eGZmZmZmZmZmYTVjMDBhMGYKPiBbIDE0MDUuNTMyNTYwXSAgPyAweGZmZmZmZmZmYTUzOGFiYjcK
PiBbIDE0MDUuNTMyNTYyXSAgPyAweGZmZmZmZmZmYTUzNzMxZmIKPiBbIDE0MDUuNTMyNTY1XSAg
PyAweGZmZmZmZmZmYTUzNjg3MmYKPiBbIDE0MDUuNTMyNTY3XSAgPyAweGZmZmZmZmZmYTUzNjhl
NTQKPiBbIDE0MDUuNTMyNTY5XSAgPyAweGZmZmZmZmZmYTUzNjk4ZTIKPiBbIDE0MDUuNTMyNTcy
XSAgPyAweGZmZmZmZmZmYTUxMTUxYWYKPiBbIDE0MDUuNTMyNTc2XSAgPyAweGZmZmZmZmZmYTUz
NjlkNTYKPiBbIDE0MDUuNTMyNTc4XSAgPyAweGZmZmZmZmZmYTUzNjE0NzAKPiBbIDE0MDUuNTMy
NTgwXSAgPyAweGZmZmZmZmZmYTUzNjllYTYKPiBbIDE0MDUuNTMyNTgyXSAgPyAweGZmZmZmZmZm
YTUzNjE0OTIKPiBbIDE0MDUuNTMyNTg0XSAgPyAweGZmZmZmZmZmYTUyNzhkYTYKPiBbIDE0MDUu
NTMyNTg2XSAgPyAweGZmZmZmZmZmYTUyOTUwYmUKPiBbIDE0MDUuNTMyNTg5XSAgPyAweGZmZmZm
ZmZmYTUyOGYzNzAKPiBbIDE0MDUuNTMyNTkxXSAgPyAweGZmZmZmZmZmYTUyOTc4MzAKPiBbIDE0
MDUuNTMyNTkzXSAgPyAweGZmZmZmZmZmYTUyOGYzNzAKPiBbIDE0MDUuNTMyNTk2XSAgPyAweGZm
ZmZmZmZmYTUyOGYzNzAKPiBbIDE0MDUuNTMyNTk4XSAgPyAweGZmZmZmZmZmYTUyN2JmYmIKPiBb
IDE0MDUuNTMyNjAwXSAgPyAweGZmZmZmZmZmYTViMTkyNmQKPiBbIDE0MDUuNTMyNjAyXSAgPyAw
eGZmZmZmZmZmYTVjMDAwN2MKPiBbIDE0MDUuNTMyNjA1XSAtLS1bIGVuZCB0cmFjZSAxNjg2NGI4
Mjc3ZTkyYmZlIF0tLS0KPiAKPiAKPiAKPiByZWdhcmRzCj4gCj4gCj4gCj4gX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
