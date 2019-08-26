Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2955F9D5A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Aug 2019 20:18:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i2JZB-0006v8-AK; Mon, 26 Aug 2019 18:18:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <corbet@lwn.net>) id 1i2JZA-0006rx-AP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 18:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnBst0pbbLwIvATVAyjLKpJqUSPdgA5pWQefkHZ0dyc=; b=KrzgbRK3Q3t3XlaZk2C+UcPaNv
 1phyydU048KJOpUwMHGV//FUT2HVZaqbJS5bhsR+EIovHA+jA8EDeoTTuqVcE2ZeyYsMLSTcT1hNP
 Di/Y3IDdEp1ilepIvfFss1gIeMhlTKYh6ArGD6jiQUUYn2PM/5Smi9ScR6m+vXBYmRWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MnBst0pbbLwIvATVAyjLKpJqUSPdgA5pWQefkHZ0dyc=; b=d+Qqy/OEx9+C3UmFyrJglm0Uq0
 /qungwpP8Zu3s2gysijz/sEKS+K4pxLj+agpnNw5i1bHXrDoy79Rk0hS2iOD0CqsgEQ3paJfb2lOJ
 kkWrFZGTHvHQjyXsALB2F2eNb2uP7M+9ipjMFeeajWb7VzhrYRluUah4hf7FTxa1thJI=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i2JZ8-003aTQ-UL
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Aug 2019 18:18:08 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id C72BB300;
 Mon, 26 Aug 2019 18:18:00 +0000 (UTC)
Date: Mon, 26 Aug 2019 12:17:59 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20190826121759.6fa594b7@lwn.net>
In-Reply-To: <20190821075714.65140-4-satyat@google.com>
References: <20190821075714.65140-1-satyat@google.com>
 <20190821075714.65140-4-satyat@google.com>
Organization: LWN.net
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [45.79.88.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i2JZ8-003aTQ-UL
Subject: Re: [f2fs-dev] [PATCH v4 3/8] block: blk-crypto for Inline
 Encryption
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCAyMSBBdWcgMjAxOSAwMDo1NzowOSAtMDcwMApTYXR5YSBUYW5naXJhbGEgPHNhdHlh
dEBnb29nbGUuY29tPiB3cm90ZToKCj4gV2UgaW50cm9kdWNlIGJsay1jcnlwdG8sIHdoaWNoIG1h
bmFnZXMgcHJvZ3JhbW1pbmcga2V5c2xvdHMgZm9yIHN0cnVjdAo+IGJpb3MuIFdpdGggYmxrLWNy
eXB0bywgZmlsZXN5c3RlbXMgb25seSBuZWVkIHRvIGNhbGwgYmlvX2NyeXB0X3NldF9jdHggd2l0
aAo+IHRoZSBlbmNyeXB0aW9uIGtleSwgYWxnb3JpdGhtIGFuZCBkYXRhX3VuaXRfbnVtOyB0aGV5
IGRvbid0IGhhdmUgdG8gd29ycnkKPiBhYm91dCBnZXR0aW5nIGEga2V5c2xvdCBmb3IgZWFjaCBl
bmNyeXB0aW9uIGNvbnRleHQsIGFzIGJsay1jcnlwdG8gaGFuZGxlcwo+IHRoYXQuIEJsay1jcnlw
dG8gYWxzbyBtYWtlcyBpdCBwb3NzaWJsZSBmb3IgbGF5ZXJlZCBkZXZpY2VzIGxpa2UgZGV2aWNl
Cj4gbWFwcGVyIHRvIG1ha2UgdXNlIG9mIGlubGluZSBlbmNyeXB0aW9uIGhhcmR3YXJlLgo+IAo+
IEJsay1jcnlwdG8gZGVsZWdhdGVzIGNyeXB0byBvcGVyYXRpb25zIHRvIGlubGluZSBlbmNyeXB0
aW9uIGhhcmR3YXJlIHdoZW4KPiBhdmFpbGFibGUsIGFuZCBhbHNvIGNvbnRhaW5zIGEgc29mdHdh
cmUgZmFsbGJhY2sgdG8gdGhlIGtlcm5lbCBjcnlwdG8gQVBJLgo+IEZvciBtb3JlIGRldGFpbHMs
IHJlZmVyIHRvIERvY3VtZW50YXRpb24vYmxvY2svYmxrLWNyeXB0by50eHQuCgpTbyB0aGF0IGZp
bGUgZG9lc24ndCBzZWVtIHRvIGV4aXN0OyBkaWQgeW91IG1lYW4gaW5saW5lLWVuY3J5cHRpb24u
dHh0CmhlcmU/Cgo+IFNpZ25lZC1vZmYtYnk6IFNhdHlhIFRhbmdpcmFsYSA8c2F0eWF0QGdvb2ds
ZS5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vYmxvY2svaW5saW5lLWVuY3J5cHRpb24udHh0
IHwgMTg2ICsrKysrKwo+ICBibG9jay9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArCj4gIGJsb2NrL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICstCj4gIGJsb2NrL2Jpby1jcnlwdC1jdHguYyAgICAgICAgICAgICAgICAgICAgIHwgICA3
ICstCj4gIGJsb2NrL2Jpby5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsK
PiAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKy0KPiAg
YmxvY2svYmxrLWNyeXB0by5jICAgICAgICAgICAgICAgICAgICAgICAgfCA3MzcgKysrKysrKysr
KysrKysrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L2Jpby1jcnlwdC1jdHguaCAgICAgICAgICAg
ICB8ICAgNyArCj4gIGluY2x1ZGUvbGludXgvYmxrLWNyeXB0by5oICAgICAgICAgICAgICAgIHwg
IDQ3ICsrCj4gIDkgZmlsZXMgY2hhbmdlZCwgMTAwMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9ibG9jay9pbmxpbmUtZW5j
cnlwdGlvbi50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGJsb2NrL2Jsay1jcnlwdG8uYwo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9ibGstY3J5cHRvLmgKPiAKPiBkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi9ibG9jay9pbmxpbmUtZW5jcnlwdGlvbi50eHQgYi9Eb2N1bWVu
dGF0aW9uL2Jsb2NrL2lubGluZS1lbmNyeXB0aW9uLnR4dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi45MjU2MTFhNWVhNjUKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi9ibG9jay9pbmxpbmUtZW5jcnlwdGlvbi50eHQKClNvIHdlJ3ZlIGJl
ZW4gZG9pbmcgb3VyIGJlc3QgdG8gZ2V0IHJpZCBvZiAudHh0IGZpbGVzIGluIHRoZSBkb2N1bWVu
dGF0aW9uCnRyZWUuICBJJ2QgcmVhbGx5IGJlIGEgbG90IGhhcHBpZXIgaWYgdGhpcyB3ZXJlIGFu
IFJTVCBmaWxlIGluc3RlYWQuICBUaGUKZ29vZCBuZXdzIGlzIHRoYXQgaXQncyBhbHJlYWR5IDk5
JSBSU1QsIHNvIGxpdHRsZSB3b3VsZCBoYXZlIHRvIGNoYW5nZS4KClNlZSB0aGUgaW5mbyBpbiBE
b2N1bWVudGF0aW9uL2RvYy1ndWlkZSBmb3IgZGV0YWlscy4KCj4gQEAgLTAsMCArMSwxODYgQEAK
PiArQkxLLUNSWVBUTyBhbmQgS0VZU0xPVCBNQU5BR0VSCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PQo+ICsKPiArQ09OVEVOVFMKPiArMS4gT2JqZWN0aXZlCj4gKzIuIENvbnN0cmFpbnRz
IGFuZCBub3Rlcwo+ICszLiBEZXNpZ24KPiArNC4gQmxrLWNyeXB0bwo+ICsgNC0xIFdoYXQgZG9l
cyBibGstY3J5cHRvIGRvIG9uIGJpbyBzdWJtaXNzaW9uCj4gKzUuIExheWVyZWQgRGV2aWNlcwo+
ICs2LiBGdXR1cmUgb3B0aW1pemF0aW9ucyBmb3IgbGF5ZXJlZCBkZXZpY2VzCgpSU1Qgd291bGQg
Z2VuZXJhdGUgdGhpcyBUT0MgZm9yIHlvdSwgc28geW91IGNhbiB0YWtlIGl0IG91dC4KCj4gKzEu
IE9iamVjdGl2ZQo+ICs9PT09PT09PT09PT0KPiArCj4gK1dlIHdhbnQgdG8gc3VwcG9ydCBpbmxp
bmUgZW5jcnlwdGlvbiAoSUUpIGluIHRoZSBrZXJuZWwuCj4gK1RvIGFsbG93IGZvciB0ZXN0aW5n
LCB3ZSBhbHNvIHdhbnQgYSBjcnlwdG8gQVBJIGZhbGxiYWNrIHdoZW4gYWN0dWFsCj4gK0lFIGhh
cmR3YXJlIGlzIGFic2VudC4gV2UgYWxzbyB3YW50IElFIHRvIHdvcmsgd2l0aCBsYXllcmVkIGRl
dmljZXMKPiArbGlrZSBkbSBhbmQgbG9vcGJhY2sgKGkuZS4gd2Ugd2FudCB0byBiZSBhYmxlIHRv
IHVzZSB0aGUgSUUgaGFyZHdhcmUKPiArb2YgdGhlIHVuZGVybHlpbmcgZGV2aWNlcyBpZiBwcmVz
ZW50LCBvciBlbHNlIGZhbGwgYmFjayB0byBjcnlwdG8gQVBJCj4gK2VuL2RlY3J5cHRpb24pLgo+
ICsKPiArCj4gKzIuIENvbnN0cmFpbnRzIGFuZCBub3Rlcwo+ICs9PT09PT09PT09PT09PT09PT09
PT09PT0KPiArCj4gKzEpIElFIGhhcmR3YXJlIGhhdmUgYSBsaW1pdGVkIG51bWJlciBvZiDigJxr
ZXlzbG90c+KAnSB0aGF0IGNhbiBiZSBwcm9ncmFtbWVkCgpTb21lIHBlb3BsZSBnZXQgaXJhdGUg
d2hlbiB0aGV5IGVuY291bnRlciBub24tQVNDSUkgY2hhcmFjdGVycyBpbiB0aGUgZG9jczsKdGhh
dCBpbmNsdWRlcyAic21hcnQgcXVvdGVzIi4KCkFsc28sIHMvaGF2ZS9oYXMvCgo+ICt3aXRoIGFu
IGVuY3J5cHRpb24gY29udGV4dCAoa2V5LCBhbGdvcml0aG0sIGRhdGEgdW5pdCBzaXplLCBldGMu
KSBhdCBhbnkgdGltZS4KPiArT25lIGNhbiBzcGVjaWZ5IGEga2V5c2xvdCBpbiBhIGRhdGEgcmVx
dWVzdCBtYWRlIHRvIHRoZSBkZXZpY2UsIGFuZCB0aGUKPiArZGV2aWNlIHdpbGwgZW4vZGVjcnlw
dCB0aGUgZGF0YSB1c2luZyB0aGUgZW5jcnlwdGlvbiBjb250ZXh0IHByb2dyYW1tZWQgaW50bwo+
ICt0aGF0IHNwZWNpZmllZCBrZXlzbG90LiBXaGVuIHBvc3NpYmxlLCB3ZSB3YW50IHRvIG1ha2Ug
bXVsdGlwbGUgcmVxdWVzdHMgd2l0aAo+ICt0aGUgc2FtZSBlbmNyeXB0aW9uIGNvbnRleHQgc2hh
cmUgdGhlIHNhbWUga2V5c2xvdC4KPiArCj4gKzIpIFdlIG5lZWQgYSB3YXkgZm9yIGZpbGVzeXN0
ZW1zIHRvIHNwZWNpZnkgYW4gZW5jcnlwdGlvbiBjb250ZXh0IHRvIHVzZSBmb3IKPiArZW4vZGVj
cnlwdGluZyBhIHN0cnVjdCBiaW8sIGFuZCBhIGRldmljZSBkcml2ZXIgKGxpa2UgVUZTKSBuZWVk
cyB0byBiZSBhYmxlCj4gK3RvIHVzZSB0aGF0IGVuY3J5cHRpb24gY29udGV4dCB3aGVuIGl0IHBy
b2Nlc3NlcyB0aGUgYmlvLgo+ICsKPiArMykgV2UgbmVlZCBhIHdheSBmb3IgZGV2aWNlIGRyaXZl
cnMgdG8gZXhwb3NlIHRoZWlyIGNhcGFiaWxpdGllcyBpbiBhIHVuaWZpZWQKPiArd2F5IHRvIHRo
ZSB1cHBlciBsYXllcnMuCj4gKwo+ICsKPiArMy4gRGVzaWduCj4gKz09PT09PT09PQo+ICsKPiAr
V2UgYWRkIGEgc3RydWN0IGJpb19jcnlwdF9jdHggdG8gc3RydWN0IGJpbyB0aGF0IGNhbiByZXBy
ZXNlbnQgYW4KPiArZW5jcnlwdGlvbiBjb250ZXh0LCBiZWNhdXNlIHdlIG5lZWQgdG8gYmUgYWJs
ZSB0byBwYXNzIHRoaXMgZW5jcnlwdGlvbgo+ICtjb250ZXh0IGZyb20gdGhlIEZTIGxheWVyIHRv
IHRoZSBkZXZpY2UgZHJpdmVyIHRvIGFjdCB1cG9uLgo+ICsKPiArV2hpbGUgSUUgaGFyZHdhcmUg
d29ya3Mgb24gdGhlIG5vdGlvbiBvZiBrZXlzbG90cywgdGhlIEZTIGxheWVyIGhhcyBubwo+ICtr
bm93bGVkZ2Ugb2Yga2V5c2xvdHMgLSBpdCBzaW1wbHkgd2FudHMgdG8gc3BlY2lmeSBhbiBlbmNy
eXB0aW9uIGNvbnRleHQgdG8KPiArdXNlIHdoaWxlIGVuL2RlY3J5cHRpbmcgYSBiaW8uCj4gKwo+
ICtXZSBpbnRyb2R1Y2UgYSBrZXlzbG90IG1hbmFnZXIgKEtTTSkgdGhhdCBoYW5kbGVzIHRoZSB0
cmFuc2xhdGlvbiBmcm9tCj4gK2VuY3J5cHRpb24gY29udGV4dHMgc3BlY2lmaWVkIGJ5IHRoZSBG
UyB0byBrZXlzbG90cyBvbiB0aGUgSUUgaGFyZHdhcmUuCgpTby4uLmlmIHRoaXMgd2VyZSBSU1Qs
IHlvdSBjb3VsZCBoYXZlIGRpcmVjdGl2ZXMgdG8gcHVsbCBpbiB0aGUgbmljZQprZXJuZWxkb2Mg
Y29tbWVudHMgeW91J3ZlIGFscmVhZHkgcHV0IGludG8gdGhlIHNvdXJjZS4KCkknbGwgc3RvcCBo
ZXJlLi4ucHJlc3VtYWJseSBJJ3ZlIG1hZGUgbXkgcG9pbnQgYnkgbm93IDopCgpUaGFua3MgZm9y
IGRvY3VtZW50aW5nIHRoaXMgc3Vic3lzdGVtIQoKam9uCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
