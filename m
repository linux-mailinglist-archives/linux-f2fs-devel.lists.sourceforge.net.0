Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4594700111
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 May 2023 09:09:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pxMu6-0008A7-Cj;
	Fri, 12 May 2023 07:09:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rtresidd@electromag.com.au>) id 1pxMu4-0008A0-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 07:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eguqGhr/A1VRZgXYJCl5KkGe5QE7+3aKmbjCPInmtcY=; b=c8uNzbmP8EIu1dq7+PrOqU0hk5
 bAIxZ9KB7M3lCzwPdGgc12qxyNnQafmUrsusZtfCv9EHkOvpUSV/RJL5sBcEYG06tFNOO//Zksy4H
 E4HVPyGpl+60iIkjItXAKhFBWlYJO/MEa8617qjnJ1ZFUOmeOBGV3WXaLibd4GGbq25I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:From:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eguqGhr/A1VRZgXYJCl5KkGe5QE7+3aKmbjCPInmtcY=; b=H
 uqYFVwiUZbS4yJ4i1TcCKtRzgOICUqlsRwgcg9FGdycqt5QLKb/uToXRDo6YRVDFiOz2ZNbEqfeX2
 LCnrjyoRxF91pJwjc4xTWx9u+JtfHRlGEdk4jmZUFpYl9IJa28+QR0Xs+QnFy/zSz6endH+Qx32Qb
 +YAZZdNFzdKYHALg=;
Received: from anchovy2.45ru.net.au ([203.30.46.146])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pxMu2-0003ll-FG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 May 2023 07:09:24 +0000
Received: (qmail 10205 invoked by uid 5089); 12 May 2023 06:42:34 -0000
Received: by simscan 1.2.0 ppid: 9993, pid: 9994, t: 0.8962s
 scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950 spam: 3.1.4
X-Spam-Checker-Version: SpamAssassin 3.4.5 (2021-03-20) on anchovy2
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=6.0 tests=ALL_TRUSTED=-1,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=disabled version=3.4.5
Received: from unknown (HELO ?192.168.2.4?)
 (rtresidd@electromag.com.au@203.59.235.95)
 by anchovy3.45ru.net.au with ESMTPA; 12 May 2023 06:42:33 -0000
Message-ID: <8be01849-02ae-0829-b8f0-c9eb7f3f4065@electromag.com.au>
Date: Fri, 12 May 2023 14:42:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi    We're upgrading our systems from using a 5.1.7 based
    kernel to a 6.3.1 based kernel. I'm experiencing some warnings popping out
    occasionally from the f2fs driver [  137.225376] WARNING: CPU: 0 PID: 32
    at fs/f2fs/extent_cache.c:755 __update_extent_tree_range+0x424/0x760 ** [...]
    
 
 Content analysis details:   (-0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [203.30.46.146 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [203.30.46.146 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pxMu2-0003ll-FG
Subject: [f2fs-dev] Kernel warnings 6.3.1
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
From: Richard Tresidder via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Richard Tresidder <rtresidd@electromag.com.au>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkKIMKgwqAgV2UncmUgdXBncmFkaW5nIG91ciBzeXN0ZW1zIGZyb20gdXNpbmcgYSA1LjEuNyBi
YXNlZCBrZXJuZWwgdG8gYSAKNi4zLjEgYmFzZWQga2VybmVsLgpJJ20gZXhwZXJpZW5jaW5nIHNv
bWUgd2FybmluZ3MgcG9wcGluZyBvdXQgb2NjYXNpb25hbGx5IGZyb20gdGhlIGYyZnMgZHJpdmVy
CgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqClvCoCAxMzcuMjI1Mzc2XSBXQVJOSU5H
OiBDUFU6IDAgUElEOiAzMiBhdCBmcy9mMmZzL2V4dGVudF9jYWNoZS5jOjc1NSAKX191cGRhdGVf
ZXh0ZW50X3RyZWVfcmFuZ2UrMHg0MjQvMHg3NjAKKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKgoKYW5kIGEgdHJhY2U6CioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKW8KgIDQ2
MC4yMDYwMTZdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpbwqAgNDYwLjIw
ODM0MF0gV0FSTklORzogQ1BVOiAwIFBJRDogMTU0IGF0IGZzL2YyZnMvZXh0ZW50X2NhY2hlLmM6
NzU1IApfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZSsweDQyNC8weDc2MApbwqAgNDYwLjIxMzE4
M10gTW9kdWxlcyBsaW5rZWQgaW46ClvCoCA0NjAuMjEzMjAwXSBDUFU6IDAgUElEOiAxNTQgQ29t
bToga3dvcmtlci91NDo1IFRhaW50ZWQ6IEfCoMKgwqDCoMKgwqDCoCAKV8KgwqDCoMKgwqDCoMKg
wqDCoCA2LjMuMS0wMDI1Ni1nNjAxNjQ0OThkODZiLWRpcnR5ICM3ClvCoCA0NjAuMjEzMjE2XSBI
YXJkd2FyZSBuYW1lOiBBbHRlcmEgU09DRlBHQQpbwqAgNDYwLjIxMzIyNl0gV29ya3F1ZXVlOiB3
cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVzaC0xNzk6MCkKW8KgIDQ2MC4yMTMyNzFdwqAgdW53aW5k
X2JhY2t0cmFjZSBmcm9tIHNob3dfc3RhY2srMHgxOC8weDFjClvCoCA0NjAuMjEzMzA2XcKgIHNo
b3dfc3RhY2sgZnJvbSBkdW1wX3N0YWNrX2x2bCsweDQwLzB4NGMKW8KgIDQ2MC4yMTMzMzVdwqAg
ZHVtcF9zdGFja19sdmwgZnJvbSBfX3dhcm4rMHg4NC8weDE1YwpbwqAgNDYwLjIxMzM2NV3CoCBf
X3dhcm4gZnJvbSB3YXJuX3Nsb3dwYXRoX2ZtdCsweGM0LzB4MWMwClvCoCA0NjAuMjEzMzkxXcKg
IHdhcm5fc2xvd3BhdGhfZm10IGZyb20gCl9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlKzB4NDI0
LzB4NzYwClvCoCA0NjAuMjEzNDE4XcKgIF9fdXBkYXRlX2V4dGVudF90cmVlX3JhbmdlIGZyb20g
Cl9fdXBkYXRlX2V4dGVudF9jYWNoZSsweDI0NC8weDQ0NApbwqAgNDYwLjIxMzQ0MF3CoCBfX3Vw
ZGF0ZV9leHRlbnRfY2FjaGUgZnJvbSAKZjJmc19vdXRwbGFjZV93cml0ZV9kYXRhKzB4ODAvMHhl
YwpbwqAgNDYwLjIxMzQ2MV3CoCBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGEgZnJvbSAKZjJmc19k
b193cml0ZV9kYXRhX3BhZ2UrMHg0ZTQvMHg3MDAKW8KgIDQ2MC4yMTM0ODddwqAgZjJmc19kb193
cml0ZV9kYXRhX3BhZ2UgZnJvbSAKZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKzB4NTI0LzB4
NzIwClvCoCA0NjAuMjEzNTEzXcKgIGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSBmcm9tIApm
MmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4MjRjLzB4NTkwClvCoCA0NjAuMjEzNTM5XcKgIGYyZnNf
d3JpdGVfY2FjaGVfcGFnZXMgZnJvbSAKZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4MjM4LzB4Mzg4
ClvCoCA0NjAuMjEzNTYzXcKgIGYyZnNfd3JpdGVfZGF0YV9wYWdlcyBmcm9tIGRvX3dyaXRlcGFn
ZXMrMHg4MC8weDFhNApbwqAgNDYwLjIxMzU5N13CoCBkb193cml0ZXBhZ2VzIGZyb20gX193cml0
ZWJhY2tfc2luZ2xlX2lub2RlKzB4NGMvMHg0Y2MKW8KgIDQ2MC4yMTM2MjldwqAgX193cml0ZWJh
Y2tfc2luZ2xlX2lub2RlIGZyb20gCndyaXRlYmFja19zYl9pbm9kZXMrMHgxZjgvMHg0Y2MKW8Kg
IDQ2MC4yMTM2NThdwqAgd3JpdGViYWNrX3NiX2lub2RlcyBmcm9tIF9fd3JpdGViYWNrX2lub2Rl
c193YisweDQwLzB4ZTAKW8KgIDQ2MC4yMTM2ODZdwqAgX193cml0ZWJhY2tfaW5vZGVzX3diIGZy
b20gd2Jfd3JpdGViYWNrKzB4MjUwLzB4M2FjClvCoCA0NjAuMjEzNzEzXcKgIHdiX3dyaXRlYmFj
ayBmcm9tIHdiX3dvcmtmbisweDJkNC8weDVhYwpbwqAgNDYwLjIxMzc0MV3CoCB3Yl93b3JrZm4g
ZnJvbSBwcm9jZXNzX29uZV93b3JrKzB4MWUwLzB4NTFjClvCoCA0NjAuMjEzNzc2XcKgIHByb2Nl
c3Nfb25lX3dvcmsgZnJvbSB3b3JrZXJfdGhyZWFkKzB4NjAvMHg1MTgKW8KgIDQ2MC4yMTM4MDZd
wqAgd29ya2VyX3RocmVhZCBmcm9tIGt0aHJlYWQrMHhmNC8weDEyNApbwqAgNDYwLjIxMzgzNl3C
oCBrdGhyZWFkIGZyb20gcmV0X2Zyb21fZm9yaysweDE0LzB4MmMKW8KgIDQ2MC4yMTM4NTZdIEV4
Y2VwdGlvbiBzdGFjaygweGYwY2M1ZmIwIHRvIDB4ZjBjYzVmZjgpClvCoCA0NjAuMjEzODY4XSA1
ZmEwOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAwMDAwMDAwMCAKMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAK
W8KgIDQ2MC4yMTM4NzldIDVmYzA6IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAw
IDAwMDAwMDAwIAowMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMApbwqAgNDYwLjIxMzg5MF0gNWZl
MDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDAK
W8KgIDQ2MC4yMTM4OTldIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQoqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqCgpUaGlzIGlzIGFmdGVyIHBlcmZvcm1pbmcgYSBm
b3JtYXQgb24gdGhlIGRldmljZSBpbiBzeXN0ZW0gdG8gbWFrZSBzdXJlIAp0aGUgZmlsZXN5c3Rl
bSB3YXMgdXAgdG8gdGhlIHNhbWUga2VybmVsIHJldmlzaW9uLgpIb3cgY29uY2VybmVkIHNob3Vs
ZCB3ZSBiZT8KCk5vdGUgcHJpb3IgdG8gdGhlIGZvcm1hdCB3ZSB3ZXJlIGdldHRpbmcgYSBMT1Qg
b3IgZXJyb3JzLCBzb21lIGxpa2UgCmFib3ZlIGFuZCBvdGhlcnMgd2l0aCBhIGRpZmZlcmVudCBz
aWduYXR1cmU6CgoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqClvCoCAxNjcuNjc1MTA3
XSBXQVJOSU5HOiBDUFU6IDAgUElEOiAzMiBhdCBmcy9mMmZzL2V4dGVudF9jYWNoZS5jOjI0OCAK
X19pbnNlcnRfZXh0ZW50X3RyZWUrMHgxNWMvMHgxNzQKKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKgoKVGhhdCBvbmUgcmVzdWx0ZWQgaW4gdGhlIGVudGlyZSBzeXN0ZW0gY29taW5nIHRv
IGEgYSBoYWx0Li4KCkNoZWVycwogwqDCoCBSaWNoYXJkIFQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
