Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 180BC16C0C2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Feb 2020 13:27:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6ZJ6-0001JE-EO; Tue, 25 Feb 2020 12:27:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1j6ZJ5-0001J1-KS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 12:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sHgRr3fiepcRJQJpYnmOqDGph8jvwe5UnN6DlfallGw=; b=SrrFAON20+Kt6I8ugczMBdthpX
 nDVejAvGZbQYIC2RfBQd6EZlu/BwChrV78dOda4Mnq3eYLxc+I6KM8rFq2ZciBc1KTwZuUxhKYjoC
 vS6zo4+MC3CDWHt5Xo06DoLT+o4g5R72RiFpwStzR0HazVeKRTJz/cT3ODxwr0FATZ34=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sHgRr3fiepcRJQJpYnmOqDGph8jvwe5UnN6DlfallGw=; b=Q6yaNAXK3EHjJ+QupcqmdnC7V0
 qHUs7h/4R9mu+E13z8TlCuejhv4VSKU4hZIHXVIjE29V1/RlpMU43cGaZs9wuN9T4gyFyNRs+j+Lr
 QvIVwAvWHjS+A3hXTjh8qnMIF2XHnXKUPwaDO5RQVoNcEZVUYqo6giKbbgnWJ6hbgaFg=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6ZIz-009QFb-Km
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Feb 2020 12:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1582633626; bh=jODQ6T7oQ2+AV1GKAMVcUlItvawkW9XBOLOlOP3MO/M=;
 h=Date:From:To:Subject:References:X-My-GPG-KeyId:From;
 b=QxGkSpFM3dUSZ7AEots+oCFkWmEEmkDFGu8AeLdmReCGnlHFbXv+uGqG4lWe0fghx
 0CIodYVENX5LYZaw36m9Y9Cs521uVfHyxQXdwPrGHgqF9yI82/PmpkH0jGXaPwlZ4g
 WRMh8OIcGzOjtzgRpvoeaAQLDnMSg5SQ4El7xSAc=
Date: Tue, 25 Feb 2020 13:27:06 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20200225122706.d6pngz62iwyowhym@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <yuchao0@huawei.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20191209222345.1078-1-jaegeuk@kernel.org>
 <20200222044617.pfrhnz2iavkrtdn6@core.my.home>
 <20200222181721.tzrrohep5l3yklpf@core.my.home>
 <bec3798b-f861-b132-9138-221027bb5195@huawei.com>
 <b1eb9b22-b570-41ab-5177-2c89105428a2@huawei.com>
 <20200224135837.k54ke4ppca26ibec@core.my.home>
 <20200224140349.74yagjdwewmclx4v@core.my.home>
 <20200224143149.au6hvmmfw4ajsq2g@core.my.home>
 <39712bf4-210b-d7b6-cbb1-eb57585d991a@huawei.com>
 <20200225120814.gjm4dby24cs22lux@core.my.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225120814.gjm4dby24cs22lux@core.my.home>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: megous.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1j6ZIz-009QFb-Km
Subject: Re: [f2fs-dev] Writes stoped working on f2fs after the compression
 support was added
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

T24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDE6MDg6MTRQTSArMDEwMCwgbWVnaSB4ZmYgd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gT24gVHVlLCBGZWIgMjUsIDIwMjAgYXQgMDc6MjQ6MTJQTSArMDgwMCwg
Q2hhbyBZdSB3cm90ZToKPiA+IE9uIDIwMjAvMi8yNCAyMjozMSwgT25kxZllaiBKaXJtYW4gd3Jv
dGU6Cj4gPiA+PiBKdXN0IGJ5IGEgbG9va3Mgb2YgaXQ6Cj4gPiA+Pgo+ID4gPj4gcm9vdEB0YnMy
Wy9wcm9jL3N5cy9rZXJuZWxdICMgZG1lc2cgfCBncmVwIHVwX3dyaXRlIHwgd2MgLWwKPiA+ID4+
IDMyNAo+ID4gPj4gcm9vdEB0YnMyWy9wcm9jL3N5cy9rZXJuZWxdICMgZG1lc2cgfCBncmVwIGRv
d25fd3JpdGUgfCB3YyAtbAo+ID4gPj4gMzQ3Cj4gPiA+Pgo+ID4gPj4gdGhlcmUgc2VlbXMgdG8g
YmUgYSBtaXNtYXRjaCBvZiBsb2NrL3VubG9jayBjb3VudHMuCj4gPiA+ICAKPiA+ID4gU29ycnks
IGEgd3JvbmcgZ3JlcCBleHByZXNzaW9uLgo+ID4gPiAKPiA+ID4gcm9vdEB0YnMyW35dICMgZG1l
c2cgfCBncmVwIGlub2RlX2Rvd25fd3JpdGUgfCB3YyAtbAo+ID4gPiAzNTcKPiA+ID4gcm9vdEB0
YnMyW35dICMgZG1lc2cgfCBncmVwIGlub2RlX3VwX3dyaXRlIHwgd2MgLWwKPiA+ID4gMzU3Cj4g
PiA+IHJvb3RAdGJzMlt+XSAjIGRtZXNnIHwgZ3JlcCBpbm9kZV91cF9yZWFkIHwgd2MgLWwKPiA+
ID4gMTYKPiA+ID4gcm9vdEB0YnMyW35dICMgZG1lc2cgfCBncmVwIGlub2RlX2Rvd25fcmVhZCB8
IHdjIC1sCj4gPiA+IDE2Cj4gPiAKPiA+IEkgZG9uJ3Qga25vdyB3aHkgd2UgaGF2ZSBjb25zaXN0
ZW50IGRvd24vdXAgcGFpciwgYnV0IHRocm91Z2ggZGlzYXNzZW1ibGVkCj4gPiBjb2RlLCBJIGRv
dWJ0IGl0J3MgdGhlIGYyZnNfaW5vZGUtPmlfc2VtLgo+IAo+IEJlY2F1c2Ugd2Ugd2VyZSBjb3Vu
dGluZyBhdHRlbXB0cywgYW5kIG5vdCBhIHN1Y2Nlc3NmdWwgbG9jay4gOykKPiAKPiA+IGMwNDM1
ZDdjOiAgICAgICBlYmY1NGFmOCAgICAgICAgYmwgICAgICBjMDE4ODk2NCA8cHJpbnRrPgo+ID4g
YzA0MzVkODA6ICAgICAgIGUxYTAwMDA2ICAgICAgICBtb3YgICAgIHIwLCByNgo+ID4gYzA0MzVk
ODQ6ICAgICAgIGViMTM4MTM1ICAgICAgICBibCAgICAgIGMwOTE2MjYwIDxkb3duX3dyaXRlPgo+
ID4gCj4gPiBpbm9kZV9kb3duX3dyaXRlKCkKPiA+IAo+ID4gYzA0MzVkODg6ICAgICAgIGUyODRj
ZTFkICAgICAgICBhZGQgICAgIGlwLCByNCwgIzQ2NCAgICA7IDB4MWQwCj4gPiAKPiA+IFdlIGFy
ZSBzdHVjayBoZXJlLgo+ID4gCj4gPiBbICA0MzAuNjc1NzU0XSBbPGMwOTE2MjYwPl0gKGRvd25f
d3JpdGUpIGZyb20gWzxjMDQzNWQ4OD5dIChmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHg2
MDAvMHg3ZDgpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeXl5eXl5eXl4KPiA+IFsgIDQzMC42NzU3NjRdIFs8YzA0MzU3ODg+XSAoZjJmc193cml0
ZV9zaW5nbGVfZGF0YV9wYWdlKSBmcm9tIFs8YzA0MzYyMTQ+XSAoZjJmc193cml0ZV9jYWNoZV9w
YWdlcysweDJiNC8weDdjNCkKPiA+IAo+ID4gCj4gPiBjMDQzNWQ4YzogICAgICAgZTE0YjBhZDQg
ICAgICAgIGxkcmQgICAgcjAsIFtmcCwgIy0xNjRdIDsgMHhmZmZmZmY1Ywo+ID4gYzA0MzVkOTA6
ICAgICAgIGUxY2MyMGQwICAgICAgICBsZHJkICAgIHIyLCBbaXBdCj4gPiBjMDQzNWQ5NDogICAg
ICAgZTE1MjAwMDAgICAgICAgIGNtcCAgICAgcjIsIHIwCj4gPiBjMDQzNWQ5ODogICAgICAgZTBk
MzMwMDEgICAgICAgIHNiY3MgICAgcjMsIHIzLCByMQo+ID4gYzA0MzVkOWM6ICAgICAgIGIxY2Mw
MGYwICAgICAgICBzdHJkbHQgIHIwLCBbaXBdCj4gPiBjMDQzNWRhMDogICAgICAgZTFhMDAwMDYg
ICAgICAgIG1vdiAgICAgcjAsIHI2Cj4gPiBjMDQzNWRhNDogICAgICAgZWJmNTIyMjcgICAgICAg
IGJsICAgICAgYzAxN2U2NDggPHVwX3dyaXRlPgo+ID4gYzA0MzVkYTg6ICAgICAgIGU1MWIyMDk4
ICAgICAgICBsZHIgICAgIHIyLCBbZnAsICMtMTUyXSA7IDB4ZmZmZmZmNjgKPiA+IGMwNDM1ZGFj
OiAgICAgICBlMzBjMDczMCAgICAgICAgbW92dyAgICByMCwgIzUwOTkyICAgICAgOyAweGM3MzAK
PiA+IGMwNDM1ZGIwOiAgICAgICBlNTlmMTFhNCAgICAgICAgbGRyICAgICByMSwgW3BjLCAjNDIw
XSAgOyBjMDQzNWY1YyA8ZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlKzB4N2Q0Pgo+ID4gYzA0
MzVkYjQ6ICAgICAgIGUzNGMwMGI2ICAgICAgICBtb3Z0ICAgIHIwLCAjNDkzMzQgICAgICA7IDB4
YzBiNgo+ID4gYzA0MzVkYjg6ICAgICAgIGViZjU0YWU5ICAgICAgICBibCAgICAgIGMwMTg4OTY0
IDxwcmludGs+Cj4gPiAKPiA+IGlub2RlX3VwX3dyaXRlKCkKPiAKPiBUaGUgcGF0Y2ggeW91IHNl
bnQgaGVscGVkIHNvIGZhci4gSSdsbCBrZWVwIHRoZSB0YWJsZXQgcnVubmluZyBmb3IgYSB3aGls
ZSwKPiBidXQgc28gZmFyIHRoZSBpc3N1ZSBkaWQgbm90IHJlYXBwZWFyIHdpdGhpbiBhIGZldyBt
aW51dGVzIGFmdGVyIGJvb3QgYXMKPiB1c3VhbC4KClNvIHRoaXMgdGltZSBpdCBqdXN0IHRvb2sg
c2V2ZXJhbCB0aW1lcyBsb25nZXIgdG8gYXBwZWFyICg4LTIwbWlucyB0byB0aGUgaGFuZyk6Cgpo
dHRwczovL21lZ291cy5jb20vZGwvdG1wL2RtZXNnMQpodHRwczovL21lZ291cy5jb20vZGwvdG1w
L2RtZXNnMgoKdGhhbmsgeW91IGFuZCByZWdhcmRzLAoJby4KCj4gdGhhbmsgeW91IGFuZCByZWdh
cmRzLAo+IAlvLgo+IAo+ID4gVGhhbmtzLAo+ID4gCj4gPiA+IAo+ID4gPiBTbyBpdCdzIHByb2Jh
Ymx5IG5vdCBpbm9kZSBsb2NraW5nLgo+ID4gPiAKPiA+ID4+IHJvb3RAdGJzMlsvcHJvYy9zeXMv
a2VybmVsXSAjIGRtZXNnIHwgZ3JlcCBkb3duX3JlYWQgfCB3YyAtbAo+ID4gPj4gMTYKPiA+ID4+
IHJvb3RAdGJzMlsvcHJvYy9zeXMva2VybmVsXSAjIGRtZXNnIHwgZ3JlcCB1cF9yZWFkIHwgd2Mg
LWwKPiA+ID4+IDE2Cj4gPiA+Pgo+ID4gPj4gcmVnYXJkcywKPiA+ID4+IAlvLgo+ID4gPj4KPiA+
ID4+PiB0aGFuayB5b3UsCj4gPiA+Pj4gCW8uCj4gPiA+Pj4KPiA+ID4+Pj4+IFRoYW5rcywKPiA+
ID4+Pj4+Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODE5MF0gIHI1OmVmZjIxM2IwIHI0OmRhMjgzYzYw
Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODE5OF0gWzxjMDQzNTU3OD5dIChmMmZzX3dyaXRlX3Npbmds
ZV9kYXRhX3BhZ2UpIGZyb20gWzxjMDQzNWZkOD5dIChmMmZzX3dyaXRlX2NhY2hlX3BhZ2VzKzB4
MmI0LzB4N2M0KQo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgyMDRdICByMTA6ZGE2NDVjMjggcjk6ZGEy
ODNkNjAgcjg6ZGEyODNjNjAgcjc6MDAwMDAwMGYgcjY6ZGE2NDVkODAgcjU6MDAwMDAwMDEKPiA+
ID4+Pj4+PiBbICAyNDYuNzU4MjA2XSAgcjQ6ZWZmMjEzYjAKPiA+ID4+Pj4+PiBbICAyNDYuNzU4
MjE0XSBbPGMwNDM1ZDI0Pl0gKGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMpIGZyb20gWzxjMDQzNjgy
Yz5dIChmMmZzX3dyaXRlX2RhdGFfcGFnZXMrMHgzNDQvMHgzNWMpCj4gPiA+Pj4+Pj4gWyAgMjQ2
Ljc1ODIyMF0gIHIxMDowMDAwMDAwMCByOTpkOWVkMDAyYyByODpkOWVkMDAwMCByNzowMDAwMDAw
NCByNjpkYTI4M2Q2MCByNTpkYTI4M2M2MAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgyMjNdICByNDpk
YTY0NWQ4MAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgyMzhdIFs8YzA0MzY0ZTg+XSAoZjJmc193cml0
ZV9kYXRhX3BhZ2VzKSBmcm9tIFs8YzAyNjdlZTg+XSAoZG9fd3JpdGVwYWdlcysweDNjLzB4ZDQp
Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI0NF0gIHIxMDowMDAwMDAwYSByOTpjMGUwM2QwMCByODow
MDAwMGMwMCByNzpjMDI2NGRkYyByNjpkYTY0NWQ4MCByNTpkYTI4M2Q2MAo+ID4gPj4+Pj4+IFsg
IDI0Ni43NTgyNDZdICByNDpkYTI4M2M2MAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgyNTRdIFs8YzAy
NjdlYWM+XSAoZG9fd3JpdGVwYWdlcykgZnJvbSBbPGMwMzEwY2JjPl0gKF9fd3JpdGViYWNrX3Np
bmdsZV9pbm9kZSsweDQ0LzB4NDU0KQo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgyNTldICByNzpkYTI4
M2Q2MCByNjpkYTY0NWVhYyByNTpkYTY0NWQ4MCByNDpkYTI4M2M2MAo+ID4gPj4+Pj4+IFsgIDI0
Ni43NTgyNjZdIFs8YzAzMTBjNzg+XSAoX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKSBmcm9tIFs8
YzAzMTEyZDA+XSAod3JpdGViYWNrX3NiX2lub2RlcysweDIwNC8weDRiMCkKPiA+ID4+Pj4+PiBb
ICAyNDYuNzU4MjcyXSAgcjEwOjAwMDAwMDBhIHI5OmMwZTAzZDAwIHI4OmRhMjgzY2M4IHI3OmRh
MjgzYzYwIHI2OmRhNjQ1ZWFjIHI1OmRhMjgzZDA4Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI3NF0g
IHI0OmQ5ZGM5ODQ4Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI4MV0gWzxjMDMxMTBjYz5dICh3cml0
ZWJhY2tfc2JfaW5vZGVzKSBmcm9tIFs8YzAzMTE1Y2M+XSAoX193cml0ZWJhY2tfaW5vZGVzX3di
KzB4NTAvMHhlNCkKPiA+ID4+Pj4+PiBbICAyNDYuNzU4Mjg3XSAgcjEwOmRhMzc5N2E4IHI5OmMw
ZTAzZDAwIHI4OmQ5ZGM5ODVjIHI3OmRhNjQ1ZWFjIHI2OjAwMDAwMDAwIHI1OmQ5ZGM5ODQ4Cj4g
PiA+Pj4+Pj4gWyAgMjQ2Ljc1ODI4OV0gIHI0OmRhNWE4ODAwCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1
ODI5Nl0gWzxjMDMxMTU3Yz5dIChfX3dyaXRlYmFja19pbm9kZXNfd2IpIGZyb20gWzxjMDMxMThm
ND5dICh3Yl93cml0ZWJhY2srMHgyOTQvMHgzMzgpCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODMwMl0g
IHIxMDpmZmZiZjIwMCByOTpkYTY0NDAwMCByODpjMGUwNGU2NCByNzpkOWRjOTg0OCByNjpkOWRj
OTg3NCByNTpkYTY0NWVhYwo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgzMDVdICByNDpkOWRjOTg0OAo+
ID4gPj4+Pj4+IFsgIDI0Ni43NTgzMTJdIFs8YzAzMTE2NjA+XSAod2Jfd3JpdGViYWNrKSBmcm9t
IFs8YzAzMTJkYWM+XSAod2Jfd29ya2ZuKzB4MzVjLzB4NTRjKQo+ID4gPj4+Pj4+IFsgIDI0Ni43
NTgzMThdICByMTA6ZGE1ZjIwMDUgcjk6ZDlkYzk4NGMgcjg6ZDlkYzk5NDggcjc6ZDlkYzk4NDgg
cjY6MDAwMDAwMDAgcjU6ZDlkYzk5NTQKPiA+ID4+Pj4+PiBbICAyNDYuNzU4MzIxXSAgcjQ6MDAw
MDMxZTYKPiA+ID4+Pj4+PiBbICAyNDYuNzU4MzM0XSBbPGMwMzEyYTUwPl0gKHdiX3dvcmtmbikg
ZnJvbSBbPGMwMTRmMmI4Pl0gKHByb2Nlc3Nfb25lX3dvcmsrMHgyMTQvMHg1NDQpCj4gPiA+Pj4+
Pj4gWyAgMjQ2Ljc1ODM0MF0gIHIxMDpkYTVmMjAwNSByOTowMDAwMDIwMCByODowMDAwMDAwMCBy
NzpkYTVmMjAwMCByNjplZjA0NDQwMCByNTpkYTVlYjAwMAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgz
NDNdICByNDpkOWRjOTk1NAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTgzNTBdIFs8YzAxNGYwYTQ+XSAo
cHJvY2Vzc19vbmVfd29yaykgZnJvbSBbPGMwMTRmNjM0Pl0gKHdvcmtlcl90aHJlYWQrMHg0Yy8w
eDU3NCkKPiA+ID4+Pj4+PiBbICAyNDYuNzU4MzU3XSAgcjEwOmVmMDQ0NDAwIHI5OmMwZTAzZDAw
IHI4OmVmMDQ0NDE4IHI3OjAwMDAwMDg4IHI2OmVmMDQ0NDAwIHI1OmRhNWViMDE0Cj4gPiA+Pj4+
Pj4gWyAgMjQ2Ljc1ODM1OV0gIHI0OmRhNWViMDAwCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM2OF0g
WzxjMDE0ZjVlOD5dICh3b3JrZXJfdGhyZWFkKSBmcm9tIFs8YzAxNTY0ZmM+XSAoa3RocmVhZCsw
eDE0NC8weDE3MCkKPiA+ID4+Pj4+PiBbICAyNDYuNzU4Mzc0XSAgcjEwOmVjOWU1ZTkwIHI5OmRh
YmYzMjVjIHI4OmRhNWViMDAwIHI3OmRhNjQ0MDAwIHI2OjAwMDAwMDAwIHI1OmRhNWZlMDAwCj4g
PiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM3N10gIHI0OmRhYmYzMjQwCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1
ODM4Nl0gWzxjMDE1NjNiOD5dIChrdGhyZWFkKSBmcm9tIFs8YzAxMDEwZTg+XSAocmV0X2Zyb21f
Zm9yaysweDE0LzB4MmMpCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODM5MV0gRXhjZXB0aW9uIHN0YWNr
KDB4ZGE2NDVmYjAgdG8gMHhkYTY0NWZmOCkKPiA+ID4+Pj4+PiBbICAyNDYuNzU4Mzk3XSA1ZmEw
OiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwMDAwMDAwMCAwMDAwMDAwMCAw
MDAwMDAwMCAwMDAwMDAwMAo+ID4gPj4+Pj4+IFsgIDI0Ni43NTg0MDJdIDVmYzA6IDAwMDAwMDAw
IDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAwMDAwMDAwIDAw
MDAwMDAwCj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODQwN10gNWZlMDogMDAwMDAwMDAgMDAwMDAwMDAg
MDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMTMgMDAwMDAwMDAKPiA+ID4+Pj4+PiBbICAyNDYuNzU4
NDEzXSAgcjEwOjAwMDAwMDAwIHI5OjAwMDAwMDAwIHI4OjAwMDAwMDAwIHI3OjAwMDAwMDAwIHI2
OjAwMDAwMDAwIHI1OmMwMTU2M2I4Cj4gPiA+Pj4+Pj4gWyAgMjQ2Ljc1ODQxNl0gIHI0OmRhNWZl
MDAwCj4gPiA+Pj4+Pj4gLgo+ID4gPj4+Pj4+Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4KPiA+ID4+Pj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+Pj4+
PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPj4+Pj4gTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+ID4+Pj4+Cj4gPiA+IC4K
PiA+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
