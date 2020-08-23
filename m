Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D3C24EE15
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Aug 2020 18:12:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k9sbW-0001sK-Sd; Sun, 23 Aug 2020 16:12:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <didier@slint.fr>) id 1k9sbV-0001sC-EO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Aug 2020 16:12:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRc3W0Qk2p7CYsgQhUGCoq9KkdlVhBZZI7iJGoQrzsE=; b=h73PdJgBZvE1SVmFzjlbLRkSMY
 RYLH0ai4W5uHSbYU0z/qASwMA324LCZrfIoGCSty+nHhMnyf3Gi++p6ZPSuEnNievbpRiyvargAwW
 8a4G4luJDqSmXfCCK4lWJjk6p49Bx6eDmm5hOyhKTrPoERP2QqcdPNaYkldK5ug6hwOo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRc3W0Qk2p7CYsgQhUGCoq9KkdlVhBZZI7iJGoQrzsE=; b=cvbS7MPY3bb6SFhz0koROC2arg
 9RB6O3Rtepp0miw7DQ+1bMBKhczmKqCIUhTUAdncLhU6eDOahg9guzCRcgKvgV+7h5X1tzAuRwOK7
 Gm6BP1XcjSjdWhAhKRnjDONUgQAGx7nAV0LPCdBKHATt8GbbGtkkg93yUikuCLg8EJyc=;
Received: from darkstar.slint.fr ([172.105.89.79])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1k9sbS-00GIhd-VW
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 23 Aug 2020 16:12:21 +0000
Received: from ici.slint.fr (men75-h08-176-172-247-100.dsl.sta.abo.bbox.fr
 [176.172.247.100])
 by darkstar.slint.fr (Postfix) with ESMTPSA id 03C10BE797;
 Sun, 23 Aug 2020 16:52:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=slint.fr; s=default;
 t=1598194343; bh=ChTla2m80R5GRJQq21wdejIRB1dfjzUjtoQye+DhtFg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L0VIgiJ4fHySQx4dcq/fQspuP1JDrhI4mWmCQv6984yHPnY20zlvYjXapj5radGl4
 EHU+lLqYJuiZiKF6YWnXB5wCVm2xPiXAIvjW0BdOurgTUqdD8bG8inPa83kwPMmQid
 pnhE9trpKq4ynnwKfqnuArTVbIg3/YsavC5IZhukSGzh9K8hTdQFNk0CcqrBGgfZAI
 5ZoGCzFFuNwepDdbrcOVc+rsi+ebRckwsZhDzDUKq9Ysnh69et4z4y3jV8n6sm9qT8
 wxF1l+qdCBwM4xAp0ueTOcCOHNasOjShm1HQByYYfl6uzQMeqs0ev4CYIwbe10xk4N
 scR3RT2+gcFRw==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <13e19af7-69d5-6db3-441e-3be4921983de@slint.fr>
 <20200625003543.GA34187@google.com>
From: Didier Spaier <didier@slint.fr>
Message-ID: <f153c668-5463-eb2e-d232-64c0d9df7d49@slint.fr>
Date: Sun, 23 Aug 2020 17:53:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200625003543.GA34187@google.com>
Content-Language: en-US
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -1.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1k9sbS-00GIhd-VW
Subject: Re: [f2fs-dev] Questions about using f2fs to format the root
 partition during Slint installation.
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgp0aGFua3MgZm9yIHlvdXIgYW5zd2VyLCB3aGljaCBsZWFkcyB0byBtb3JlIHF1ZXN0aW9u
cyBhbmQgYSByZXF1ZXN0LgoKSSB3aWxsIHF1b3RlIG9ubHkgdGhlIHJlbGV2YW50IHBhcnRzIG9m
IHRoaXMgYW5zd2VyIGJlbG93LgoKTGUgMjUvMDYvMjAyMCDDoCAwMjozNSwgSmFlZ2V1ayBLaW0g
YSDDqWNyaXQgOgo+IE9uIDA2LzI1LCBEaWRpZXIgU3BhaWVyIHdyb3RlOgoKPj4gdGhpcyBlbWFp
bCBpcyBhIGZvbGxvdy11cCBvZjoKPj4gaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9saW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldC9tc2cxNDM5MC5odG1sCgouLi4KCj4+
IFExOiBDb21tZW50cyBhYm91dCB0aGlzIGNob2ljZSBvZiB0YXJnZXQgZGV2aWNlcyBmb3IgZjJm
cywga25vd2luZyB0aGF0Cj4+IEkgZmF2b3Igc2VjdXJpdHkgb3ZlciBwZXJmb3JtYW5jZXMgYW5k
IHRoYXQgdGhlICJhdXRvIiBvcHRpb24gb2YgdGhlCj4+IGluc3RhbGxlciBpcyBpbnRlbmRlZCBm
b3IgeW91ciBncmFuZC1tb3RoZXI/IEkgYW0gYSBncmFuZCBmYXRoZXIgbXlzZWxmCj4+IDxzbWls
ZT4uCj4gCj4gV2hpY2ggc2VjdXJpdHkgYW5kIHBlcmZvcm1hbmNlIGZlYXR1cmUgZG8geW91IHdh
bnQgdG8gdXNlIGluIHRoZSBzeXN0ZW0/Cj4gRm9yIGV4YW1wbGUsIG1rZnMuZjJmcyByZXF1aXJl
cyBzb21lIG9wdGlvbnMgbGlrZToKPiAtIGZzY3J5cHQgOiAtTyBlbmNyeXB0Cj4gLSBxdW90YSA6
IC1PIHF1b3RhCj4gLSBmc3Zlcml0eSA6IC1PIHZlcml0eQo+IC0gY29tcHJlc3Npb24gOiAtTyBj
b21wcmVzc2lvbiAtTyBleHRyYV9hdHRyCj4gLSBjYXNlZm9sZGluZyA6IC1PIGNhc2Vmb2xkIC1D
IHV0ZjgKRG8gSSB1bmRlcnN0YW5kIHdlbGwgdGhhdCB0aGVzZSBmZWF0dXJlcyBhcmUgZGVmaW5l
ZCBpbiBmMmZzLmg/CkluIExpbnV4IDUuNC42MDoKI2RlZmluZSBGMkZTX0ZFQVRVUkVfRU5DUllQ
VAkJMHgwMDAxCiNkZWZpbmUgRjJGU19GRUFUVVJFX0JMS1pPTkVECQkweDAwMDIKI2RlZmluZSBG
MkZTX0ZFQVRVUkVfQVRPTUlDX1dSSVRFCTB4MDAwNAojZGVmaW5lIEYyRlNfRkVBVFVSRV9FWFRS
QV9BVFRSCQkweDAwMDgKI2RlZmluZSBGMkZTX0ZFQVRVUkVfUFJKUVVPVEEJCTB4MDAxMAojZGVm
aW5lIEYyRlNfRkVBVFVSRV9JTk9ERV9DSEtTVU0JMHgwMDIwCiNkZWZpbmUgRjJGU19GRUFUVVJF
X0ZMRVhJQkxFX0lOTElORV9YQVRUUgkweDAwNDAKI2RlZmluZSBGMkZTX0ZFQVRVUkVfUVVPVEFf
SU5PCQkweDAwODAKI2RlZmluZSBGMkZTX0ZFQVRVUkVfSU5PREVfQ1JUSU1FCTB4MDEwMAojZGVm
aW5lIEYyRlNfRkVBVFVSRV9MT1NUX0ZPVU5ECQkweDAyMDAKI2RlZmluZSBGMkZTX0ZFQVRVUkVf
VkVSSVRZCQkweDA0MDAKI2RlZmluZSBGMkZTX0ZFQVRVUkVfU0JfQ0hLU1VNCQkweDA4MDAKI2Rl
ZmluZSBGMkZTX0ZFQVRVUkVfQ0FTRUZPTEQJCTB4MTAwMAogIApJIGFzayBiZWNhdXNlIEkgZG9u
J3Qgc2VlIHRoZW0gbGlzdGVkIGluIGEgbWFuIHBhZ2Ugd2hlcmUgSSB3b3VsZCBoYXZlCmV4cGVj
dGVkIHRvIGZpbmQgdGhlbSwgbGlrZSBta2ZzLmYyZnMgKDgpIG9yIG1vdW50ICg4KQoKSSBkb24n
dCBzZWUgdGhlbSBsaXN0ZWQgaW46Cmh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9i
bG9iL21hc3Rlci9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0CgouLi4gCgo+PiBR
My4gV2hhdCB3b3VsZCBiZSB0aGUgc2FmZXN0IG9wdGlvbnMgdG8gaW5jbHVkZSBpbiB0aGUgcmVs
ZXZhbnQgbGluZSBvZgo+PiAvZXRjL2ZzdGFiIGZvcnRoZSByb290IHBhcnRpdGlvbiB1c2luZyBm
MmZzPwo+IAo+IGRlZmF1bHQgKyBhbnkgZmVhdHVyZXMgdGhhdCB5b3UncmUgaW50ZXJlc3RlZCBp
bj8KPiBXZSd2ZSBiZWVuIHVzaW5nIHRoZSBiZWxvdyBvcHRpb24gZm9yIHNldmVyYWwgeWVhcnMg
aW4gQW5kcm9pZC4KPiBodHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS9kZXZpY2UvZ29v
Z2xlL2NvcmFsLysvcmVmcy9oZWFkcy9tYXN0ZXIvZnN0YWIuaGFyZHdhcmUjMTEKClRoZSBtb3Vu
dCBmbGFncyBhbmQgb3B0aW9ucyBhcmUgZGVzY3JpYmVkIGluIGYyZnMucnN0IGJ1dCBJIGRvbid0
IGV4cGVjdCBhCmNhc3VhbCB1c2VyIHRvIHJlYWQgdGhhdC4KClNvIEkgc3VnZ2VzdCB0aGF0IGFs
bCB0aGUgbW91bnQgb3B0aW9ucyBzcGVjaWZpYyB0byBmMmZzIGJlIGxpc3RlZCBpbiBhbgpkb2N1
bWVudCBpbnRlbmRlZCBmb3IgZW5kIHVzZXJzIChtYW4gZjJmcz8pIGFzIHRoYXQgY291bGQgaGVs
cCBmYXZvciBpdHMKYWRvcHRpb24gYnkgTGludXggZGlzdHJpYnV0aW9ucyBhcyBhbiBhbHRlcm5h
dGl2ZSB0byBleHQ0IHdoZW4gcmVsZXZhbnQuCgpNYXliZSB5b3UgY291bGQgY29uc3VsdCB3aXRo
IHV0aWwtbGludXggZGV2cywgYXMgbWFuIG1vdW50IGlzIHBhcnQgb2YgdGhlCnV0aWwtbGludXgg
cGFja2FnZTsgdG8ganVzdCBhZGQgYSBsaW5lIHRvIHRoZSB0ZXh0IHF1b3RlZCBiZWxvdz8KCkZJ
TEVTWVNURU0tU1BFQ0lGSUMgTU9VTlQgT1BUSU9OUwogICAgICAgVGhpcyBzZWN0aW9uIGxpc3Rz
IG9wdGlvbnMgdGhhdCBhcmUgc3BlY2lmaWMgdG8gcGFydGljdWxhcgogICAgICAgZmlsZXN5c3Rl
bXMuICBXaGVyZSAgcG9zc2libGUsIHlvdSAgc2hvdWxkICBmaXJzdCAgY29uc3VsdAogICAgICAg
ZmlsZXN5c3RlbS1zcGVjaWZpYyBtYW51YWwgcGFnZXMgZm9yIGRldGFpbHMuICBTb21lIG9mIHRo
b3NlIHBhZ2VzCiAgICAgICBhcmUgbGlzdGVkIGluIHRoZSBmb2xsb3dpbmcgdGFibGUuCiAgICAg
ICAgICAgICAgCiAgICAgICBGaWxlc3lzdGVtKHMpICAgICAgTWFudWFsIHBhZ2UKICAgICAgIGJ0
cmZzICAgICAgICAgICAgICBidHJmcyg1KQogICAgICAgY2lmcyAgICAgICAgICAgICAgIG1vdW50
LmNpZnMoOCkKICAgICAgIGV4dDIsIGV4dDMsIGV4dDQgICBleHQ0KDUpCiAgICAgICBmdXNlICAg
ICAgICAgICAgICAgZnVzZSg4KQogICAgICAgbmZzICAgICAgICAgICAgICAgIG5mcyg1KQogICAg
ICAgdG1wZnMgICAgICAgICAgICAgIHRtcGZzKDUpCiAgICAgICB4ZnMgICAgICAgICAgICAgICAg
eGZzKDUpCgp0aGUgYWRkZWQgbGluZSB3b3VsZCBqdXN0IGJlIGZvciBpbnN0YW5jZToKCiAgICAg
ICBmMmZzICAgICAgICAgICAgICAgZjJmcyg4KQoKSW5kZWVkIAoKSSBrbm93IEkgc2hvdWxkIHBy
b3Bvc2UgdG8gY29udHJpYnV0ZSB3cml0aW5nIG1hbiBmMmZzLCB1bmZvcnR1bmF0ZWx5IG15Cmtu
b3dsZWRnZSBvZiBmMmZzIGlzIHZlcnkgY2xvc2UgdG8gbm9uIGV4aXN0ZW50LgoKSW5jaWRlbnRh
bGx5LCB0aGUgb3B0aW9ucyBsaXN0ZWQgaW4KaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5j
b20vZGV2aWNlL2dvb2dsZS9jb3JhbC8rL3JlZnMvaGVhZHMvbWFzdGVyL2ZzdGFiLmhhcmR3YXJl
IzExCmluZGljYXRlIHRoYXQgZjJmcyBpcyBvbmx5IHVzZWQgZm9yIHRoZSBwYXJ0aXRpb24gbW91
bnRlZCBhcyAvZGF0YS4KCkkgZG9uJ3Qga25vdyBBbmRyb2lkIGF0IGFsbCBidXQgdGhvdWdodCB0
aGF0IC9zeXN0ZW0gaXMgbW9yZSBvciBsZXNzIHRoZQplcXVpdmFsZW50IG9mIHJvb3QgKC8pIGlu
IG90aGVyIExpbnV4IGRpc3RyaWJ1dGlvbnMuIElmIHRoYXQncyB0aGUgY2FzZSwKd2h5IG5vdCB1
cyBhbHNvIGYyZnMgZm9yIGl0PyBNYXliZSBJIGFtIGZ1bGx5IHdyb25nLCBwbGVhc2UgY29ycmVj
dCBtZS4KSSB3b3VsZCBiZSBncmF0ZWZ1bCBmb3IgYW55IHBvaW50ZXIgdG8gYSBkb2N1bWVudCBl
eHBsYWluaW5nIHRoZSBwdXJwb3NlcwpvZiB0aGUgdmFyaW91cyBtb3VudCBwb2ludHMgaW4gQW5k
cm9pZCBhcyB0aGV5IGRpZmZlciBmcm9tIHRoZSBGSFM6Cmh0dHBzOi8vcmVmc3BlY3MubGludXhm
b3VuZGF0aW9uLm9yZy9maHMuc2h0bWwKCkJlc3QgcmVnYXJkcywKCkRpZGllcgogIAoKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
