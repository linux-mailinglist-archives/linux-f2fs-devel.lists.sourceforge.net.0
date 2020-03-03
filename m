Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A75177561
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Mar 2020 12:39:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j95t5-0000AQ-53; Tue, 03 Mar 2020 11:38:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j95t3-0000AC-V3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 11:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KrX6twvdzjvf/QqZQ07WYOlRgWiJH19xtKwWuX2QUt8=; b=lGaC4mHMaUdy6iY0xqazIx0Md6
 RtwRJ3x245lvEiPjU54uzz6YQQsWVpCO/x7q3tyhhJCR+UtnT2ZufV31IBEbTtnwibVrvrhXMMVCE
 hTZvsY4QMEbsvAjT/Exf7pNdMxy+Eb4WHql8FSgUZkwZFa6b7dT6GiTSiGAyXVBozFnM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KrX6twvdzjvf/QqZQ07WYOlRgWiJH19xtKwWuX2QUt8=; b=VwJk7xiwgttiKG1QZ3CwlOQfIi
 LF46MiheDEqsnIr6RpKpA1hUF11b/qfxwbX8tPglgl8HS+Zvnu321gqcORrOB/Uo3fk1vqbogpv4r
 nLilnPtsF/Md5VE8bMgQWlcJl9Epg7Ra8bJUnH7q1f9KABxrIaC/iaONxBXSbulpIT4g=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j95t0-00FTaT-8m
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 Mar 2020 11:38:57 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 4AEF57A5CF33EEC39902;
 Tue,  3 Mar 2020 19:38:41 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 3 Mar 2020
 19:38:37 +0800
To: =?UTF-8?B?546L55+b?= <spearmao@126.com>, Sahitya Tummala
 <stummala@codeaurora.org>
References: <381334f9.10021.1704dcbf102.Coremail.spearmao@126.com>
 <cc33bd7d-a2df-ee10-db58-445cfbfeef07@huawei.com>
 <20200217052829.GD20234@codeaurora.org>
 <4a686a8b.6490.1709f940c2a.Coremail.spearmao@126.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <3c5e1cc4-3354-866b-593a-fa58ca48baae@huawei.com>
Date: Tue, 3 Mar 2020 19:38:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4a686a8b.6490.1709f940c2a.Coremail.spearmao@126.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j95t0-00FTaT-8m
Subject: Re: [f2fs-dev] F2fs panic | update_sit_entry() | no free segment |
 se invalid
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8zLzMgMTY6NDcsIOeOi+efmyB3cm90ZToKPiAKPiBIaSBDaGFvLAo+IAo+IENhbiB1
IGtpbmRseSBoZWxwIHRvIGNoZWNrIFNhaGl0eWEncyBjb21tZW50cz8KPiAKPiBUaGFua3MsCj4g
TWFvCj4gCj4gCj4gQXQgMjAyMC0wMi0xNyAxMzoyODoyOSwgIlNhaGl0eWEgVHVtbWFsYSIgPHN0
dW1tYWxhQGNvZGVhdXJvcmEub3JnPiB3cm90ZToKPj5IaSBDaGFvLAo+Pgo+Pk9uIE1vbiwgRmVi
IDE3LCAyMDIwIGF0IDExOjUwOjU2QU0gKzA4MDAsIENoYW8gWXUgd3JvdGU6Cj4+PiBIaSDnjovn
n5vvvIwKPj4+IAo+Pj4gT24gMjAyMC8yLzE2IDE5OjM5LCDnjovnn5sgd3JvdGU6Cj4+PiA+ICpT
byB0aGUgcHJvYmxlbSBpczoqCj4+PiA+IAo+Pj4gPiAxLiBpbiBuZXdfY3Vyc2VnKCksIGlmIHRo
ZSBzZWdubyBhbGxvY2F0ZWQgaXMgaW52YWxpZChubyBmcmVlIHNlZ21lbnQsIG1heCBzZWdubwo+
Pj4gPiBpcyByZXR1cm5lZCkuCj4+PiA+IAo+Pj4gPiBGMmZzIHNob3VsZCBkbyBzb21ldGhpbmcg
dG8gaW5kaWNhdGUgdGhpcyBleGNlcHRpb24uCj4+PiA+IAo+Pj4gPiAyLiBvdGhlcndpc2UsIHdl
IG1heSBoaXQgdGhlIGYyZnMgcGFuaWMoc2UgaW52YWxpZCkuCj4+PiA+IAo+Pj4gPiBNYXliZSB3
ZSBzaG91bGQgZG8gc2FuaXR5IGNoZWNrIGluIHVwZGF0ZV9zaXRfZW50cnkoKSB0byBzZWUgaWYg
c2Vnbm8gaXMgcmVhbGx5Cj4+PiA+IG91dCBvZiByYW5nZSBhbmQgY2F1c2VkIHRoaXMgcGFuaWMu
Cj4+PiAKPj4+IEknbSBhZnJhaWQgaXQncyB0b28gbGF0ZSB0byBoYW5kbGUgc3VjaCBlcnJvciBp
biB1cGRhdGVfc2l0X2VudHJ5KCksIHNpbmNlIHdlCj4+PiBleHBlY3QgYWxsIHByb2NlZHVyZXMg
aW4gZG9fd3JpdGVfcGFnZSgpIHdpbGwgYmUgc3VjY2Vzc2Z1bCwgaXQncyBhIGxpdHRsZSBoYXJk
Cj4+PiB0byBoYW5kbGUgc3VjaCBlcnJvciBpbiB0aGF0IGNvbnRleHQuCj4+PiAKPj4+IFNvIHRo
ZSBwcm9ibGVtIGhlcmUgaXMgd2h5IHdlIGNhbiBub3QgZmluZCBhbnkgZnJlZSBzZWdtZW50cyB3
LyBMRlMgYWxsb2NhdGlvbiwKPj4+IGJlY2F1c2UgaW4gY2FzZSBvZiBsYWNrIG9mIGZyZWUgc2Vn
bWVudHMgKGNoZWNrIHZpYSBoYXNfbm90X2Vub3VnaF9mcmVlX3NlY3MoKSksCj4+PiBmMmZzIHdp
bGwgZm9yY2UgdG8gdHJpZ2dlciBmMmZzX2djKCkgdG8gcmVjeWNsZSBmcmVlIHNlY3Rpb25zLgo+
Pj4gCj4+Cj4+SSB0aGluayB0aGlzIGlzc3VlIGNhbiBoYXBwZW4gd2hlbiB0aGUgX193cml0ZV9k
YXRhX3BhZ2UgaXMgaW52b2tlZCBpbgo+Pm5vbi1yZWNsYWltIHBhdGggKHdiYy0+Zm9yX3JlY2xh
aW0gaXMgZmFsc2UpIGFuZCB0aGVyZSBhcmVuJ3QgZW5vdWdoIGZyZWVfc2Vjcwo+PmF2YWlsYWJs
ZS4gSW4gdGhpcyBjYXNlLCB3ZSB3b24ndCBhdCBhbGwgY2hlY2sgZm9yIGhhc19ub3RfZW5vdWdo
X2ZyZWVfc2VjcygpIGFuZAo+PmRvbid0IGRvIGYyZnNfYmFsYW5jZV9mcygpLgo+Pgo+PkkgdGhp
bmsgX193cml0ZV9kYXRhX3BhZ2UoKSBjYW4gYmUgZW5oYW5jZWQgdG8gZml4IHRoaXMgY2FzZSBh
cyBiZWxvdy4KPj5DYW4geW91IHBsZWFzZSBjaGVjayBhbmQgcHJvdmlkZSB5b3VyIGZlZWRiYWNr
Pwo+Pgo+PmRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+aW5k
ZXggNjZiMDJkMy4uNzFlMTIyMSAxMDA2NDQKPj4tLS0gYS9mcy9mMmZzL2RhdGEuYwo+PisrKyBi
L2ZzL2YyZnMvZGF0YS5jCj4+QEAgLTIxNzYsMTAgKzIxNzYsMTggQEAgc3RhdGljIGludCBfX3dy
aXRlX2RhdGFfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSwgYm9vbCAqc3VibWl0dGVkLAo+Pgo+PiAg
ICAgICAgaWYgKCF3YmMtPmZvcl9yZWNsYWltKQo+PiAgICAgICAgICAgICAgICBuZWVkX2JhbGFu
Y2VfZnMgPSB0cnVlOwo+Pi0gICAgICAgZWxzZSBpZiAoaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNz
KHNiaSwgMCwgMCkpCj4+LSAgICAgICAgICAgICAgIGdvdG8gcmVkaXJ0eV9vdXQ7Cj4+LSAgICAg
ICBlbHNlCj4+LSAgICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9IT1RfREFU
QSk7Cj4+Kwo+PisgICAgICAgaWYgKGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDAp
KSB7Cj4+KyAgICAgICAgICAgICAgIGlmICghd2JjLT5mb3JfcmVjbGFpbSAmJiAhZnJlZV9zZWN0
aW9ucyhzYmkpKQoKSXQncyBzdGlsbCB0b28gbGF0ZSBpZiB0aGVyZSBpcyBubyBmcmVlIHNlY3Rp
b25zLCBhcyBldmVuIHdlIHRyaWdnZXIgZjJmc19iYWxhbmNlX2ZzCnRvIHJ1biBmb3JlZ3JvdW5k
IEdDLCB3ZSBtYXkgbmVlZCBhIGRpcnR5IHNlZ21lbnQgdG8gd3JpdGUgZGF0YSB3LyBTU1IgbW9k
ZSwgaG93ZXZlcgphbGwgZGlydHkgc2VnbWVudCBjb3VsZCBiZSBub2RlIHR5cGUuLi5hbmQgcHJl
ZnJlZSBzZWdtZW50IGNvdWxkbid0IGJlIHJldXNlZCBhcyB3ZQpkaWRuJ3QgZmluaXNoIGNhbGxp
bmcgbGFzdCBjaGVja3BvaW50IGR1cmluZyBGR0dDLgoKQW5kIHdpdGggdGhpcyB3YXksIHdlIG1h
eSBjb3ZlciB0aGUgcm9vdCBjYXVzZSBvZiB0aGlzIGlzc3VlLCBJIGd1ZXNzIHdlJ2QgYmV0dGVy
CmNoZWNrIHdoeSB3ZSBoYXZlIG5vIGZyZWUgc2VjdGlvbnMgaGVyZSBmaXJzdC4KClRoYW5rcywK
Cj4+KyAgICAgICAgICAgICAgICAgICAgICAgZ290byByZWRpcnR5X291dDsKPj4rICAgICAgICAg
ICAgICAgaWYgKHdiYy0+Zm9yX3JlY2xhaW0pIHsKPj4rICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoIWZyZWVfc2VjdGlvbnMoc2JpKSkKPj4rICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IG5lZWRfYmFsYW5jZV9mcyA9IHRydWU7Cj4+KyAgICAgICAgICAgICAgICAgICAgICAgZ290byBy
ZWRpcnR5X291dDsKPj4rICAgICAgICAgICAgICAgfQo+PisgICAgICAgfQo+PisKPj4rICAgICAg
IHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9IT1RfREFUQSk7Cj4+Cj4+ICAgICAgICBlcnIgPSAt
RUFHQUlOOwo+PiAgICAgICAgaWYgKGYyZnNfaGFzX2lubGluZV9kYXRhKGlub2RlKSkgewo+PkBA
IC0yMjUyLDYgKzIyNjAsOSBAQCBzdGF0aWMgaW50IF9fd3JpdGVfZGF0YV9wYWdlKHN0cnVjdCBw
YWdlICpwYWdlLCBib29sICpzdWJtaXR0ZWQsCj4+ICAgICAgICBpZiAoIWVyciB8fCB3YmMtPmZv
cl9yZWNsYWltKQo+PiAgICAgICAgICAgICAgICByZXR1cm4gQU9QX1dSSVRFUEFHRV9BQ1RJVkFU
RTsKPj4gICAgICAgIHVubG9ja19wYWdlKHBhZ2UpOwo+PisgICAgICAgaWYgKCFlcnIgJiYgIVNf
SVNESVIoaW5vZGUtPmlfbW9kZSkgJiYgIUlTX05PUVVPVEEoaW5vZGUpICYmCj4+KyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICFGMkZTX0koaW5vZGUpLT5jcF90YXNrKQo+
PisgICAgICAgICAgICAgICBmMmZzX2JhbGFuY2VfZnMoc2JpLCBuZWVkX2JhbGFuY2VfZnMpOwo+
PiAgICAgICAgcmV0dXJuIGVycjsKPj4gfQo+Pgo+PlRoYW5rcywKPj4KPj4+IEkgZG91YnQgdGhl
cmUgbWF5IGJlIHNvbWUgY29ybmVyIGNhc2Ugd2UgaGF2ZW4ndCBjb25zaWRlcmVkLCByZXN1bHQg
YWxsIGZyZWUKPj4+IHNlZ21lbnRzIChpbmNsdWRpbmcgcmVzZXJ2ZWQgZnJlZSBzZWdtZW50cykg
d2FzIGV4aGF1c3RlZCBieSBkYXRhL25vZGUgd3JpdGVzCj4+PiB3aGVuIGxhc3QgY2hlY2twb2lu
dCBpcyB0cmlnZ2VyZWQgZHVyaW5nIHVtb3VudC4KPj4+IAo+Pj4gSWYgdGhpcyBpc3N1ZSBjYW4g
YmUgcmVwcm9kdWNlZCAoZHVyaW5nIHVtb3VudCwgZnJlZV9zZWdtZW50cygpIDwKPj4+IHJlc2Vy
dmVkX3NlZ21lbnRzKCkpLCB3ZSBjYW4gYWRkIHNvbWUgbG9ncyB0byBzZWUgd2h5IGYyZnNfYmFs
YW5jZV9mcygpIGZhaWwgdG8KPj4+IHJlY3ljbGUgZW5vdWdoIGZyZWUgc2VnbWVudHMgcHJldmlv
dXNseS4KPj4+IAo+Pj4gVGhhbmtzLAo+Pj4gCj4+PiA+IAo+Pj4gPiAKPj4+ID4gVGhhbmtzLAo+
Pj4gPiBNYW8KPj4+ID4gCj4+PiA+IAo+Pj4gPiAKPj4+ID4gwqAKPj4+ID4gCj4+PiAKPj4+IAo+
Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo+Pgo+Pi0tIAo+Pi0tCj4+U2VudCBieSBhIGNvbnN1bHRh
bnQgb2YgdGhlIFF1YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuCj4+VGhlIFF1YWxjb21t
IElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1cm9yYSBG
b3J1bS4KPiAKPiAKPiAKPiDCoAo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
