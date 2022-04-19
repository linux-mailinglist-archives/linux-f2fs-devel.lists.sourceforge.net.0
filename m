Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0F3506256
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 04:56:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nge2j-0001s1-1m; Tue, 19 Apr 2022 02:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nge2h-0001rv-Ev
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 02:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aZ87ey5QGWaGM9e8OoYqhsxJDZKH4Rf2Wh396FJx7IA=; b=hMf+rW6HmkcJEfjA/xPNFWImpn
 QNZcC1W/Trbq21ZyaWlWJnt+SVmGMyQpl2Y4rGwxuHfJWr1kQ6hSpjYyFzotz+cT4OIucqGxxA1to
 HGeiOkYVI2v/Cw4jR+8gpZb3o3WAHkZhyI6yhqPBGHeQhzpktya1rEl3VxhbjQM0dKTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aZ87ey5QGWaGM9e8OoYqhsxJDZKH4Rf2Wh396FJx7IA=; b=UaP+zwTALaf6n1yJtor2jnxJ43
 QRPAMPkYF95zy0YwQLzgjpZYrJBDel1YMZ37j6LMDx6XJtq+wpFfajoQehgf0dNTnXhActKYNasRK
 SCTtKtnPD536lEDMyjLv3SwxabFCrZJznbzD7O5f2Wc3Q04XZ5OPcZ786BGUHpQBP/1A=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nge2e-003VKE-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 02:56:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0FD82B81132;
 Tue, 19 Apr 2022 02:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECAB9C385A7;
 Tue, 19 Apr 2022 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650336982;
 bh=ZB1kIJDd9rKP0zmC2YwLqe3ENzZ5SL9YXQYi5U2ZSIQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=vIuPv+gHAisg2jyl9g0xvmdCp/pW6YAiMViNMaxEkdORXSvaQKMDqHa265gglfYRU
 noWM850x4IDTOGc2x/dnfnGzLlaHqL0mMQm9y+zpoEJGk9SJijdp6LEPaJ5PkMbQCp
 wkz1dGnFkqWY7FOj8e8N9MpZFpfhGdZumTB5EWs7JZDOGOBoWy/BdilSLq6ca0AEmj
 KPN2KuuuNdZVWI2ykv8GbY1EQiEuUS1nyIzUanz6yrs2CDEzzVFeGAJx9FYT/9FzaC
 40y2LW+0pYf7T9SNtEtb188nrmp4h2xqz5ir4eZzwgdoTOQJImc36VTDDYU49urCQ0
 Cwy3IrcRRjnQw==
Message-ID: <752a79ff-aaf5-d2a8-02a7-1ec63ca954e0@kernel.org>
Date: Tue, 19 Apr 2022 10:56:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220401071909.505086-1-yuyufen@huawei.com>
 <20220401071909.505086-5-yuyufen@huawei.com>
 <0c134e0e-b2d0-0bc0-42fc-cd220ff77e72@kernel.org>
 <25a24259-3ac3-81ab-1c28-f2a4886888b5@huawei.com>
 <778b1f04-a71b-a226-f7a7-4833fc9bf7c2@kernel.org>
 <YlSbqay8y6oaCxR6@google.com>
 <7c6a3d09-0215-cb7d-cf82-0c4fd801d998@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <7c6a3d09-0215-cb7d-cf82-0c4fd801d998@huawei.com>
X-Spam-Score: -9.0 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/12 19:04, Yufen Yu via Linux-f2fs-devel wrote: >
 > > On 2022/4/12 5:20, Jaegeuk Kim wrote: >> On 04/11, Chao Yu wrote: >>>
 On 2022/4/6 11:01, Yufen Yu via Linux-f2fs-devel wrote: >>>> Hi, >> [...]
 Content analysis details:   (-9.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.2 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nge2e-003VKE-Ay
Subject: Re: [f2fs-dev] [PATCH 4/5] f2fs: get rid of stale fault injection
 code
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi80LzEyIDE5OjA0LCBZdWZlbiBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiAKPiAKPiBPbiAyMDIyLzQvMTIgNToyMCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4+IE9uIDA0LzEx
LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMi80LzYgMTE6MDEsIFl1ZmVuIFl1IHZpYSBMaW51
eC1mMmZzLWRldmVsIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gMjAyMi80LzEgMTY6Mjgs
IENoYW8gWXUgd3JvdGU6Cj4+Pj4+IE9uIDIwMjIvNC8xIDE1OjE5LCBZdWZlbiBZdSB2aWEgTGlu
dXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+Pj4+IE5vd2x5LCB3ZSBjYW4gdXNlIG5ldyBmYXVsdCBp
bmplY3Rpb24gZnJhbWV3b3JrLiBKdXN0IGRlbGV0ZSB0aGUKPj4+Pj4+IHN0YWxlIGZhdWx0IGlu
amVjdGlvbiBjb2RlLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1ZmVuIFl1IDx5dXl1
ZmVuQGh1YXdlaS5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+IMKgwqAgZnMvZjJmcy9jaGVja3BvaW50
LmMgfMKgIDIgKy0KPj4+Pj4+IMKgwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqAgfCA1MSAr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+IMKgwqAgZnMv
ZjJmcy9zdXBlci5jwqDCoMKgwqDCoCB8IDUzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tCj4+Pj4+PiDCoMKgIGZzL2YyZnMvc3lzZnMuY8KgwqDCoMKgwqAgfCAy
MyAtLS0tLS0tLS0tLS0tLS0tLS0tCj4+Pj4+PiDCoMKgIDQgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAxMjYgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Cj4+Pj4gLi4uCj4+Pj4KPj4+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+Pj4+PiBAQCAtMTk2Mywx
NCArMTkyMCw2IEBAIHN0YXRpYyBpbnQgZjJmc19zaG93X29wdGlvbnMoc3RydWN0IHNlcV9maWxl
ICpzZXEsIHN0cnVjdCBkZW50cnkgKnJvb3QpCj4+Pj4+PiDCoMKgwqDCoMKgwqAgaWYgKEYyRlNf
SU9fU0laRV9CSVRTKHNiaSkpCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRm
KHNlcSwgIixpb19iaXRzPSV1IiwKPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBGMkZTX09QVElPTihzYmkpLndyaXRlX2lvX3NpemVfYml0cyk7Cj4+Pj4+PiAtI2lm
ZGVmIENPTkZJR19GMkZTX0ZBVUxUX0lOSkVDVElPTgo+Pj4+Pj4gLcKgwqDCoCBpZiAodGVzdF9v
cHQoc2JpLCBGQVVMVF9JTkpFQ1RJT04pKSB7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgc2VxX3By
aW50ZihzZXEsICIsZmF1bHRfaW5qZWN0aW9uPSV1IiwKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgRjJGU19PUFRJT04oc2JpKS5mYXVsdF9pbmZvLmluamVjdF9yYXRlKTsK
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBzZXFfcHJpbnRmKHNlcSwgIixmYXVsdF90eXBlPSV1IiwK
Pj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRjJGU19PUFRJT04oc2JpKS5m
YXVsdF9pbmZvLmluamVjdF90eXBlKTsKPj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4gLSNlbmRpZgo+
Pj4+Pgo+Pj4+PiBUaGlzIHdpbGwgY2F1c2UgcmVncmVzc2lvbiBkdWUgdG8gaXQgYnJlYWtzIGFw
cGxpY2F0aW9uIHVzYWdlIHcvIC1vCj4+Pj4+IGZhdWx0XyogbW91bnRvcHRpb24uLi4sIEkgZG9u
J3QgdGhpbmsgdGhpcyBpcyB0aGUgcmlnaHQgd2F5Lgo+Pj4+Cj4+Pj4KPj4+PiBUaGFua3MgZm9y
IGNhdGNoaW5nIHRoaXMuIEkgYWRtaXQgaXQncyBhIHByb2JsZW0uIEJ1dCwgSU1PIGZhdWx0Xyog
bW91bnQKPj4+PiBvcHRpb24gYXJlIG1vc3RseSBiZWVuIHVzZWQgaW4gdGVzdCwgbm90IGluIGFj
dHVhbCBwcm9kdWN0LiBTbywgSSB0aGluawo+Pj4+IGl0IG1heSBqdXN0IGFmZmVjdCBzb21lIHRl
c3QgYXBwbGljYXRpb25zLiBXaXRoIHRoZSBjb21tb24gZmF1bHQgaW5qZWN0aW9uCj4+Pj4gZnJh
bWV3b3JrLCBpdCBjYW4gYmUgbW9yZSBlYXN5IGFuZCBmbGV4aWJsZSB0byBkbyBmYXVsdCBpbmpl
Y3Rpb24gdGVzdC4KPj4+PiBUaGVyZWZvcmUsIEkgd2FudCB0byByZW1vdmUgdGhlIHR3byBtb3Vu
dCBvcHRpb25zIGRpcmVjdGx5Lgo+Pj4+Cj4+Pj4gSWYgeW91IHJlYWxseSB3b3JyaWVkIGFib3V0
IGNvbXBhdGliaWxpdHksIGhvdyBhYm91dCBqdXN0IHJlc2VydmluZyB0aGUKPj4+PiB0d28gaW5q
ZWN0Xyogb3B0aW9ucyBidXQgd2l0aG91dCBkb2luZyBhbnkgdGhpbmcgZm9yIHRoZW0uIFdlIGFj
dHVhbGx5Cj4+Pj4gY29uZmlndXJlIGZhdWx0IGluamVjdGlvbnMgYnkgZGVidWdmcyBpbiB0aGlz
IHBhdGNoLgo+Pj4+Cj4+Pj4gT3IgZG8geW91IGhhdmUgbW9yZSBiZXR0ZXIgc3VnZ2VzdGlvbj8K
Pj4+Cj4+PiBDb3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyIHRvIGtlZXAgb3JpZ2luYWwgbG9naWMg
b2YgZjJmcyBmYXVsdCBpbmplY3Rpb24KPj4+IGlmIHVzZXIgdXNlIGluamVjdF8qIG9wdGlvbnMs
IG90aGVyd2lzZSBmb2xsb3dpbmcgY29tbW9uIGZhdWx0IGluamVjdGlvbgo+Pj4gZnJhbWV3b3Jr
Pwo+Pj4KPj4+IFRob3VnaHRzPwo+Pgo+PiBJIHRoaW5rIGl0J2QgYmUgdXNlZnVsIHRvIHRlc3Qg
cm9sbC1mb3J3YXJkIHJlY292ZXJ5IGZsb3cgYnkgdXNpbmcgdGhvc2UgbW91bnQKPj4gb3B0aW9u
cywgc2luY2UgcnVudGltZSBmYXVsdCBpbmplY3Rpb24gY2Fubm90IGVuYWJsZSBpdCBkdXJpbmcg
bW91bnQuCj4+Cj4gCj4gWWVhaCwgSSBoYXZlIG5vdCBjYXRjaCB0aGlzIHBvaW50IGJlZm9yZS4K
PiAKPj4gQlRXLCB3aGF0IGlzIHRoZSByZWFsIGJlbmVmaXQgdG8gdXNlIHRoZSBmYXVsdCBpbmpl
Y3Rpb24gZnJhbWV3b3JrPwo+Pgo+IAo+IEkgdGhpbmsgZmF1bHQgaW5qZWN0aW9uIGZyYW1ld29y
ayBjYW4gcHJvdmlkZSBtb3JlIGVhc2llciBhbmQgZmxleGlibGUKPiBmdW5jdGlvbiB0aGFuIHRo
ZSBjdXJyZW50IG9uZS4gRnVydGhlcm1vcmUsIHdlIGNhbiBqdXN0IGZvbGxvd2luZyBpdCBhbmQK
PiBkb24ndCBuZWVkIHRvIG1haW50YWluIGYyZnMgb3duIGZhdWx0IGluamVjdGlvbiBjb2xkLgoK
WXVmZW4sCgpBcyBKYWVnZXVrIG1lbnRpb25lZCwgaXQgbmVlZHMgdG8ga2VlcCBvcmlnaW5hbCBm
MmZzIGZhdWx0IGluamVjdGlvbgpmcmFtZXdvcmsgY29kZSBpbiBvcmRlciB0byBjb3ZlciB0ZXN0
IGR1cmluZyBtb3VudCgpLiBJSVVDLgoKSU1PLCBvbmUgd2F5IHRvIGFkZCB0aGlzIGZyYW1ld29y
ayBpcyBtYWtpbmcgdGhvc2UgdHdvIGZyYW1ld29yawpjb21wYXRpYmxlLCBidXQgYmVmb3JlIHRo
YXQsIGNvdWxkIHlvdSBwbGVhc2UgZXhwbGFpbiB0aGUgZGV0YWlscwpvZiBiZW5lZml0IGZvciBh
ZGFwdGluZyB0aGUgY29tbW9uIGZyYW1ld29yaz8KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IFl1
ZmVuCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
