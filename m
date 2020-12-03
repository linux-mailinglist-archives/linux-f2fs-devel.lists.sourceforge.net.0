Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C758F2CD13C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 09:26:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:Message-ID:To:MIME-Version:References:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g9rpEzAFhbTWllRuFbGfsRStbiFRbe3SgPkGdPtPBnI=; b=U3H6iReyPbMhqS0g4gjPnXwEe
	W27vJq6SOP0Qd/G238Osi6PGFrxaMy4PNGid+OpvnkYvBg8MW5DNFfoDfimMu8BjEnqKJHFIp5Q1L
	s7xWuacbT/cDbVMgm5ZpQJQBs539p98r1+WrzWZTS8OzrIxOK3oKnt3eybdYG+zfe9HCk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkjwg-0000RJ-O6; Thu, 03 Dec 2020 08:26:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <m.novosyolov@rosalinux.ru>) id 1kkjvv-0000PI-Ae
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:25:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-ID:From:CC:To:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bidM2M1ywi3r83SPiBb/PN4EXmal6ZV2eqOVYa7LVzE=; b=EnvfcoOd4GQ3YRqvtHnC4xU+TE
 O/mdZmLHwTUF8RtDmT+wd0QlonCkKoHjOZRuESCFYNRmg11+WlEI7YVVCp3UneVR65Sr5hMKLsaY6
 hNWoSFfO5uNFu2t11r1Jytk2eNJuT4zcHfGO+y5BF0ERKBVe+VcdqjMvRxqepo3dcrLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-ID:From:CC:To:Subject:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bidM2M1ywi3r83SPiBb/PN4EXmal6ZV2eqOVYa7LVzE=; b=FyDvv2LX3EXi1Q93YGtPk/zKcD
 z9yqFJUAz3j3dxo9Q1JF10nhicWMnXWSHOMQbIbUuBXIxOurJ82S0Wtgwnq+smLsx/tWZaz8G1GXS
 Kj6wkFE8PxE41AYXAfqeiTkyalKrsqqDD4a+StaJTxbPVNGelbffJrJXCxWnoV6CnuAo=;
Received: from mail.rosalinux.ru ([195.19.76.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkjvj-00D0BW-Uy
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 08:25:47 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id B4C43DE4D0A48;
 Thu,  3 Dec 2020 11:25:26 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ddHawO-Wn-6S; Thu,  3 Dec 2020 11:25:26 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 0C6CEDE4FA043;
 Thu,  3 Dec 2020 11:25:26 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 0C6CEDE4FA043
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1606983926;
 bh=bidM2M1ywi3r83SPiBb/PN4EXmal6ZV2eqOVYa7LVzE=;
 h=Date:MIME-Version:To:From:Message-ID;
 b=uFWFtt6KLUE0qCSW2uWLb4FAS7fc7m3mQfGqmFfpfIEpVglqxMfX2nxXRumhf2gUy
 AwX/HrNQuRckMKdNcimTx6tHV+JpzlaLEeVS5TIPPqLlwsLssNFvq7amUK1lfhvA2d
 PRDrxFwf3ST0rlJQbEXaIln0ZOAcG5W1EUKztFlwwQdwpptpDdl27eosX3rcuq+hfK
 Q8+l/k43paS1fAxys/kK1ztgiJ2xQabzEEBKD22G3LPuUv9ZO6PD7WwUguvByRHTpT
 mwuHrB3Le8mtjkUcIs02HbegAiZ/mE6svUwLEVxavbOn1JtphESnO5z8f25QGoGw73
 CP5kNNo03I52g==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id xXR5FXFbdKcj; Thu,  3 Dec 2020 11:25:25 +0300 (MSK)
Received: from [192.168.1.243] (broadband-90-154-70-173.ip.moscow.rt.ru
 [90.154.70.173])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id D48E6DE4D0A48;
 Thu,  3 Dec 2020 11:25:25 +0300 (MSK)
Date: Thu, 03 Dec 2020 11:25:24 +0300
User-Agent: K-9 Mail for Android
In-Reply-To: <CACOAw_yTGNWS0Jnxs5btSGPqWdYK-J0n394=-MAH6UbcNXWYDw@mail.gmail.com>
References: <6ab5fbf4-5c78-8edc-14f0-f280a330d23d@rosalinux.ru>
 <371efcfc-581b-2dcf-c2d7-ca7801fdb273@rosalinux.ru>
 <CACOAw_yTGNWS0Jnxs5btSGPqWdYK-J0n394=-MAH6UbcNXWYDw@mail.gmail.com>
MIME-Version: 1.0
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <AAFE3621-3AAC-4F77-9F63-95E9E3546165@rosalinux.ru>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kkjvj-00D0BW-Uy
Subject: Re: [f2fs-dev] Using secure erase in f2fs
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
From: Mikhail Novosyolov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgozINC00LXQutCw0LHRgNGPIDIwMjAg0LMuIDI6NDE6MTQgR01UKzAzOjAwLCBEYWVobyBKZW9u
ZyA8ZGFlaG80M0BnbWFpbC5jb20+INC/0LjRiNC10YI6Cj5IaSBNaWtoYWlsLAo+Cj5BcyB5b3Ug
bm90aWNlZCwgZjJmcyBhbHJlYWR5IHNlbmRzIGRpc2NhcmQgY29tbWFuZHMgb24gcmVsZWFzZWQg
YmxvY2tzLgo+RG8geW91IHdhbnQgdG8gZmlsbCB0aGUgYmxvY2tzIHdpdGggemVybyBkYXRhLCBp
bnN0ZWFkIG9mIHNlbmRpbmcKPmRpc2NhcmQgY29tbWFuZHM/CgpZZXMsIEkgd2FudCB0byBmaWxs
IHRoZSBibG9ja3Mgd2l0aCB6ZXJvIGRhdGEgZm9yIG11bHRpcGxlIHRpbWVzICgyIHRpbWVzLCBm
b3IgZXhhbXBsZSksIGJlY2F1c2UgdGhlcmUgYXJlIHNvbWUgZ292ZXJubWVudGFsIHJ1bGVzIHdo
aWNoIHJlcXVpcmUgdG8gZG8gdGhpcy4KCkkgdGhpbmsgaXQgZG9lcyBub3QgbWFrZSBtdWNoIHNl
bnNlIG9uIGZsYXNoIG1lbW9yeSBhbmQgSEREcyB3aXRoIFNNUiBhbmQgb3RoZXIgdG9vIGNsZXZl
ciBtaWNyb2NvbnRyb2xsZXJzLCBidXQgaXQgY2FuIHRoZW9yZXRpY2FsbHkgc3RpbGwgaGF2ZSBz
ZW5zZSBwcm9iYWJseS4KCkFsc28sIEkgdGhpbmssIHNlbmRpbmcgYSBkaXNjYXJkIGNvbW1hbWQg
YWZ0ZXIgemVyb2luZyBibG9ja3Mgd2lsbCBiZSBzdGlsbCB1c2VmdWwgYmVjYXVzZSBpdCBpcyB3
aGF0IHRoZSBtZW1vcnkgY29udHJvbGxlciBpcyB0YXVnaHQgdG8gZGVhbCB3aXRoLgoKVGhhbmtz
IGZvciByZXBseWluZyEKCj4KPjIwMjDrhYQgMTLsm5QgM+ydvCAo66qpKSDsmKTsoIQgNDoyNCwg
TWlraGFpbCBOb3Zvc3lvbG92IHZpYSBMaW51eC1mMmZzLWRldmVsCj48bGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+64uY7J20IOyekeyEsToKPj4KPj4gMDIuMTIuMjAyMCAy
MToyNCwgTWlraGFpbCBOb3Zvc3lvbG92INC/0LjRiNC10YI6Cj4+ID4gSGVsbG8sIGYyZnMgZGV2
ZWxvcGVycyEKPj4gPgo+PiA+IEkgc2F3IGNvbW1pdCA5YWY4NDY0ODZkNzgxYTYzICJmMmZzOiBh
ZGQgRjJGU19JT0NfU0VDX1RSSU1fRklMRQo+aW9jdGwiIGluIExpbnV4IGtlcm5lbAo+PiA+Cj5o
dHRwczovL2dpdGh1Yi5jb20vdG9ydmFsZHMvbGludXgvY29tbWl0LzlhZjg0NjQ4NmQ3ODFhNjNk
ZTAyNWE1ZjUwMmM1MTUyNjhlNDg3OTAjCj4+ID4KPj4gPiBJIHNhdyB1c2FnZSBvZiBpdCBpbiBB
bmRyb2lkIG9ubHkKPj4gPgo+aHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5jb20vcGxhdGZv
cm0vc3lzdGVtL3ZvbGQvKy9tYXN0ZXIvc2VjZGlzY2FyZC5jcHAKPj4gPgo+PiA+IERvIEkgdW5k
ZXJzdGFuZCBjb3JyZWN0bHkgdGhhdCB1c2Vyc3BhY2UgY29kZSBkZWNpZGVzIGhpbXNlbGYgd2hl
cmUKPnRoZSByZWdpb24gdG8gZXJhc2Ugc3RhcnRzIGFuZCB3aGVuIHRvIGNhbGwgdGhhdCBpb2N0
bD8KPj4gPgo+PiA+IEkgYW0gaW50ZXJlc3RlZCBpbiBpdCB0byBpbXBsZW1lbnQgcmVhbHRpbWUg
c2VjdXJlIGVyYXNlIC0KPm92ZXJ3cml0aW5nIGZpbGVzIHdpdGggemVyb3Mgb3IgcmFuZG9tIGRh
dGEgKEkgYW0gbm90IGludGVyZXN0aWVkIGluCj5zZW5kaW5nIGEgZGlzY2FyZC90cmltIGNvbW1h
bmQpIC0gd2hlbiBmaWxlcyBhcmUgZGVsZXRlZCBvciBhcmUgcmVtb3ZlZAo+Y29tcGxldGVseS4K
Pj4gPiBUaGlzIGNvZGUgc2VlbXMgdG8gYmUgYSBnb29kIHNvbHV0aW9uIG9mIHRoaXMgcHJvYmxl
bSwgYnV0IHRoZQo+cHJvYmxlbSBpcyB0aGF0IGtlcm5lbCBjYW5ub3QgdHJpZ2dlciBpdCBieSBp
dHNlbGYuCj4+IFdoYXQgaWYgZG8gc29tZXRoaW5nIGxpa2UgdGhpcz8KPj4KPj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4gaW5kZXggN2Q4NTc4
NDAxMjY3Li4xZTcyYWMyN2JmZGYgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVudC5jCj4+
ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+IEBAIC0xMTY2LDYgKzExNjYsMTAgQEAgc3RhdGlj
IGludCBfX3N1Ym1pdF9kaXNjYXJkX2NtZChzdHJ1Y3QKPmYyZnNfc2JfaW5mbyAqc2JpLAo+PiAg
ICAgICAgICAgICAgICAgICAgICBTRUNUT1JfRlJPTV9CTE9DSyhzdGFydCksCj4+ICAgICAgICAg
ICAgICAgICAgICAgIFNFQ1RPUl9GUk9NX0JMT0NLKGxlbiksCj4+ICAgICAgICAgICAgICAgICAg
ICAgIEdGUF9OT0ZTLCAwLCAmYmlvKTsKPj4gKyAgICAgICAgX19ibGtkZXZfaXNzdWVfd3JpdGVf
emVyb2VzKGJkZXYsCj4+ICsgICAgICAgICAgICAgICAgICAgIFNFQ1RPUl9GUk9NX0JMT0NLKHN0
YXJ0KSwKPj4gKyAgICAgICAgICAgICAgICAgICAgU0VDVE9SX0ZST01fQkxPQ0sobGVuKSwKPj4g
KyAgICAgICAgICAgICAgICAgICAgR0ZQX05PRlMsIDAsICZiaW8pOwo+PiAgc3VibWl0Ogo+PiAg
ICAgICAgICBpZiAoZXJyKSB7Cj4+ICAgICAgICAgICAgICBzcGluX2xvY2tfaXJxc2F2ZSgmZGMt
PmxvY2ssIGZsYWdzKTsKPj4KPj4gYWZ0ZXIgb2YgYmVmb3JlIF9fYmxrZGV2X2lzc3VlX2Rpc2Nh
cmQoKT8KPj4KPj4gSXMgaXQgc2FmZSB0byBmaWxsIHRoZSByZWdpb24gd2hpY2ggaXMgYmVpbmcg
ZGlzY2FyZGVkIHdpdGggemVyb2VzPwo+Pgo+PiBXaWxsIGl0IHdvcmsgYW5kIHdpbGwgaXQgZml0
IHdpdGggYmFja2dyb3VuZCBob3VzZWtlZXBpbmcgYW5kIGRpc2NhcmQKPnF1ZXVlPwo+Pgo+PiA+
Cj4+ID4gSSB0aGluayBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gY2FsbCB0aGlzIGZyb20gYW5v
dGhlciBwYXJ0IG9mCj5mMmZzIHdoZW4gYSBmaWxlIGlzIGJlaW5nIGVkaXRlZCBvciB1bmxpbmtl
ZCwgYnV0IEkgYW0gbm90IHN1cmUgZnJvbQo+d2hlcmUgZXhhY3RseS4KPj4gPgo+PiA+IEYyRlMg
aGFzIGJhY2tncm91bmQgaG91c2VrZWVwaW5nLCBpdCB3b3VsZCBiZSBuaWNlIGlmIGl0IGNvdWxk
Cj5pc3N1ZSBzZWN1cmUgdHJpbSBpbiB0aGUgYmFja2dyb3VuZC4KPj4gPgo+PiA+IEFsc28sIEkg
YW0gbm90IHN1cmUgdGhhdCBpdCB3aWxsIHdvcmsgd2l0aCBzeW1saW5rcyBjb3JyZWN0bHksIGZv
cgo+ZXhhbXBsZS4KPj4gPgo+PiA+IFBsZWFzZSBnaXZlIGEgZGlyZWN0aW9uLgo+PiA+Cj4+Cj4+
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwKCi0tIArQn9GA0L7RgdGC0LjRgtC1INC30LAg0LrRgNCw0YLQ
utC+0YHRgtGMLCDRgdC+0LfQtNCw0L3QviDQsiBLLTkgTWFpbC4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
