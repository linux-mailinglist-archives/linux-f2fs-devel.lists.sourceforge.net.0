Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62B3CF99F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 14:32:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5ouz-0004YX-Hi; Tue, 20 Jul 2021 12:32:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1m5oux-0004YR-FL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 12:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:
 Message-ID:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aSGc8E9xaopmoIEkqKrpHEuNNn6z/u06t690RBGZ5k=; b=estrtH1BbWg489QXJSinCEhJMi
 NSMLWImGmBZNLV1lEaMDSVERPA+/IxKJgMsEGReVch718Rolab+n4M6ovH3iAx19BFJRUkxDG9G7l
 YFigcWVOK17ONBEtKCR8Uj9DM6YlEih0LweIaLAu3Ii5z1+Wk7wDGU+rJ5DsE4VRFBVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Date:From:MIME-Version:In-Reply-To:Subject:Cc:To:Message-ID:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3aSGc8E9xaopmoIEkqKrpHEuNNn6z/u06t690RBGZ5k=; b=EDL4XH4/nNbGE8oxF6omWKKiAG
 qpT/XuhYX3vvVqji1knAhHDJ/izPs0uI80LQ1HcYWwx1Ms+hWwaIK6m4d4nIUGCC1HkYojcYbt5H+
 CL/Dzeb623diXDhRuUv+ALKadgRPUR+2nmc0PEvAJdM4WS2vtmrL2P+y7anc+gkcDeas=;
Received: from mail-m17652.qiye.163.com ([59.111.176.52])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5ouo-00Ebau-Rf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 12:32:11 +0000
DKIM-Signature: a=rsa-sha256;
 b=fYXXoAplvpuwubi+JVYieORa2vHlU3KQKPKtIdrHxZj76ootDvb8xC29OkoZBC0+GeJGUvkW+UJClW5Wwjjm5LeGhTxPSBsfJ4XrHCYNk9OVYl0+Kp9a1eA3p4bKHGrJbnknUbJgEqMfscOcq8Yzn26c9D4LboleZn0q2C4RmPI=;
 c=relaxed/relaxed; s=default; d=vivo.com; v=1;
 bh=3aSGc8E9xaopmoIEkqKrpHEuNNn6z/u06t690RBGZ5k=;
 h=date:mime-version:subject:message-id:from;
Received: from vivo.com (localhost [127.0.0.1])
 by mail-m17652.qiye.163.com (Hmail) with ESMTP id 4EF533C01E5;
 Tue, 20 Jul 2021 20:31:55 +0800 (CST)
Message-ID: <AJcAmwDXD1QzgUCoyu2cQKql.3.1626784315314.Hmail.frank.li@vivo.com>
To: Chao Yu <chao@kernel.org>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2016-163.com
X-Originating-IP: 59.36.4.5
In-Reply-To: <9f221a92-6c95-8f2f-a3d9-1d7abf5a6a6e@kernel.org>
MIME-Version: 1.0
Received: from frank.li@vivo.com( [59.36.4.5) ] by ajax-webmail ( [127.0.0.1]
 ) ; Tue, 20 Jul 2021 20:31:55 +0800 (GMT+08:00)
From: =?UTF-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>
Date: Tue, 20 Jul 2021 20:31:55 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRlNT0tWGBpOTx4ZSR9CGk
 sYVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQU1OSUNIT0JJSExMN1dZDB4ZWUEPCQ4eV1kSHx4VD1lB
 WUc6MRg6Fgw*Iz9KKgEcLjgUAg5JGCowChdVSFVKTUlNTENPSEpOTkxLVTMWGhIXVR0JGhUQVRcS
 Ow0SDRRVGBQWRVlXWRILWUFZTkJVSE1VT1VOWVdZCAFZQU5KSEg3Bg++
X-HM-Tid: 0a7ac3e6b7bdd9fckuws4ef533c01e5
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1m5ouo-00Ebau-Rf
Subject: Re: [f2fs-dev] 
 =?utf-8?q?=5BPATCH_v3=5D_f2fs=3A_Reduce_the_scope_of_?=
 =?utf-8?q?setting_fsck_tag_when_de-=3Ename=5Flen_is_zero?=
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SEkgQ2hhb++8jAoKRnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgpEYXRlOiAyMDIxLTA3
LTIwIDE4OjIzOjE1ClRvOiAgWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+LGphZWdldWtA
a2VybmVsLm9yZwpDYzogIGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0LGxp
bnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKU3ViamVjdDogUmU6IFtQQVRDSCB2M10gZjJmczog
UmVkdWNlIHRoZSBzY29wZSBvZiBzZXR0aW5nIGZzY2sgdGFnIHdoZW4gZGUtPm5hbWVfbGVuIGlz
IHplcm8+T24gMjAyMS83LzIwIDE1OjA2LCBZYW5ndGFvIExpIHdyb3RlOgo+PiBJIHJlY2VudGx5
IGZvdW5kIGEgY2FzZSB3aGVyZSBkZS0+bmFtZV9sZW4gaXMgMCBpbiBmMmZzX2ZpbGxfZGVudHJp
ZXMoKSBlYXNpbHkgcmVwcm9kdWNlZCwKPj4gYW5kIGZpbmFsbHkgc2V0IHRoZSBmc2NrIGZsYWcu
Cj4+IAo+PiBUaHJlYWQgQQkJCQkJVGhyZWFkIEIKPj4gCj4+IGYyZnNfcmVhZGRpcgo+PiAJZjJm
c19yZWFkX2lubGluZV9kaXIKPj4gCQljdHgtPnBvcyA9IGQubWF4Cj4+IAkJCQkJCWYyZnNfYWRk
X2RlbnRyeQo+PiAJCQkJCQkJZjJmc19hZGRfaW5saW5lX2VudHJ5Cj4+IAkJCQkJCQkJZG9fY29u
dmVydF9pbmxpbmVfZGlyCj4+IAkJCQkJCQlmMmZzX2FkZF9yZWd1bGFyX2VudHJ5Cj4+IGYyZnNf
cmVhZGRpcgo+PiAJZjJmc19maWxsX2RlbnRyaWVzCj4+IAkJc2V0X3NiaV9mbGFnKHNiaSwgU0JJ
X05FRURfRlNDSykKPj4gCj4+IFByb2Nlc3MgQSBvcGVucyB0aGUgZm9sZGVyLCBhbmQgaGFzIGJl
ZW4gcmVhZGluZyB3aXRob3V0IGNsb3NpbmcgaXQuIER1cmluZyB0aGlzIHBlcmlvZCwKPj4gUHJv
Y2VzcyBCIGNyZWF0ZWQgYSBmaWxlIHVuZGVyIHRoZSBmb2xkZXIgKG9jY3VweWluZyBtdWx0aXBs
ZSBmMmZzX2Rpcl9lbnRyeSwgZXhjZWVkaW5nCj4+IHRoZSBkLm1heCBvZiB0aGUgaW5saW5lIGRp
cikuIEFmdGVyIGNyZWF0aW9uLCBwcm9jZXNzIEEgdXNlcyB0aGUgZC5tYXggb2YgaW5saW5lIGRp
ciB0bwo+PiByZWFkIGl0IGFnYWluLCBhbmQgaXQgd2lsbCByZWFkIHRoYXQgZGUtPm5hbWVfbGVu
IGlzIDAuCj4+IAo+PiBBbmQgQ2hhbyBwb2ludGVkIG91dCB0aGF0IHcvbyBpbmxpbmUgY29udmVy
c2lvbiwgdGhlIHJhY2UgY29uZGl0aW9uIHN0aWxsIGNhbiBoYXBwZW4gYXMgYmVsb3cKPj4gCj4+
IGRpcl9lbnRyeTE6IEEKPj4gZGlyX2VudHJ5MjogQgo+PiBkaXJfZW50cnkzOiBDCj4+IGZyZWUg
c2xvdDogXwo+PiBjdHgtPnBvczogXgo+PiAKPj4gQmVmb3JlOgo+PiBBQUFBQkJCQl9fXwo+PiAJ
IF4KPgo+cGxlYXNlIHVzZSBibGFuayBpbnN0ZWFkIG9mIHRhYiBiZWZvcmUgJ14nCgpJIGRvbid0
IGtub3cgZXhhY3RseSB3aGF0IGhhcHBlbmVkLiBJbiBmYWN0LCBpbiB2Miwgc3BhY2VzIHdlcmUg
dXNlZC4gVGhlbiBpdCB3YXMgY2hhbmdlZCB0byB0YWIgaW4gdjMuCgo+Cj4+IFRocmVhZCBCIGRl
bGV0ZSBkaXJfZW50cnkyLCBhbmQgY3JlYXRlIGRpcl9lbnRyeTMuCj4+IAo+PiBBZnRlcjoKPj4g
QUFBQUNDQ0NDX18KPj4gCSBeCj4KPkRpdHRvCj4KPj4gCj4+IEluIHRoZXNlIHNjZW5hcmlvcywg
dGhlIGZpbGUgc3lzdGVtIGlzIG5vdCBkYW1hZ2VkLCBhbmQgaXQncyBoYXJkIHRvIGF2b2lkIGl0
LiBCdXQgd2UgY2FuIGJ5cGFzcwo+PiB0YWdnaW5nIEZTQ0sgZmxhZyBpZjoKPj4gYSkgYml0X3Bv
cyAoOj0gY3R4LT5wb3MgJSBkLT5tYXgpIGlzIG5vbi16ZXJvICYgYikgYmVmb3JlIGJpdF9wb3Mg
bW92ZXMgdG8gZmlyc3QKPj4gdmFsaWQgZGlyX2VudHJ5Lgo+PiAKPj4gU2lnbmVkLW9mZi1ieTog
WWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+IC0tLQo+PiAgIGZzL2YyZnMvZGlyLmMg
fCAxNCArKysrKysrKystLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDUgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kaXIuYyBiL2ZzL2Yy
ZnMvZGlyLmMKPj4gaW5kZXggNDU2NjUxNjgyZGFmLi5iZmU5NDI3MzNiNWUgMTAwNjQ0Cj4+IC0t
LSBhL2ZzL2YyZnMvZGlyLmMKPj4gKysrIGIvZnMvZjJmcy9kaXIuYwo+PiBAQCAtMTAwMCw2ICsx
MDAwLDcgQEAgaW50IGYyZnNfZmlsbF9kZW50cmllcyhzdHJ1Y3QgZGlyX2NvbnRleHQgKmN0eCwg
c3RydWN0IGYyZnNfZGVudHJ5X3B0ciAqZCwKPj4gICAJc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
ID0gRjJGU19JX1NCKGQtPmlub2RlKTsKPj4gICAJc3RydWN0IGJsa19wbHVnIHBsdWc7Cj4+ICAg
CWJvb2wgcmVhZGRpcl9yYSA9IHNiaS0+cmVhZGRpcl9yYSA9PSAxOwo+PiArCWJvb2wgZm91bmRf
dmFsaWRfZGlyZW50ICA9IGZhbHNlOwo+Cj5PbmUgbW9yZSBibGFuayBiZWZvcmUgJz0nLgo+Cj5i
b29sIGZvdW5kX3ZhbGlkX2RpcmVudCA9IGZhbHNlOwo+CgpPSy4KClRoeO+8jAoKDQoNCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
