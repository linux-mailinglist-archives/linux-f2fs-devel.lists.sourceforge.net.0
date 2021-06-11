Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14D3A4A01
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Jun 2021 22:15:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lrnYp-00078V-SI; Fri, 11 Jun 2021 20:15:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <glff-linux-f2fs-devel@m.gmane-mx.org>)
 id 1lrnYn-00078J-DP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Jun 2021 20:15:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:Message-ID:Date:Subject:From:To:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uKIkIheBkMZmt+Bs8HlTmLxlz0bB/KpyDWqPI/f0QVw=; b=fMEM9RGEWzRLr/B3iym1v+Phit
 5dpn57W+/u/YLo6drrwiDXAKrFs3nafKE+rm996jokJk5BpYGADoKjXbg9pSgy0YQK4MJ+ggiVEKm
 C7fQHJ+xAakoX252gZ/z7/CJ6k0Teco1neiTLkH0EaxZYDgcW01msqERaUfC/+mEtTkQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:In-Reply-To:Content-Transfer-Encoding:Content-Type:Mime-Version:
 References:Message-ID:Date:Subject:From:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uKIkIheBkMZmt+Bs8HlTmLxlz0bB/KpyDWqPI/f0QVw=; b=eNnywAYqh+0PeHecc+xzq2yrET
 uZmw7pgdEpLmtwUpdPjaPsNv8fvIUTEWx/f3K2QoRLEyDpSmCmuDRq8FHDXEmnHthhSXVysob5gyy
 ltpZbpVkH1nfzJqxIV6qkRDjLu7krpIF4whGUIiCuRmigITDj43LuKrJYQHO9/dKB7iw=;
Received: from ciao.gmane.io ([116.202.254.214])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lrnYf-005Ymh-MT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Jun 2021 20:15:24 +0000
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <glff-linux-f2fs-devel@m.gmane-mx.org>)
 id 1lrnYU-0009Xh-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 11 Jun 2021 22:15:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-f2fs-devel@lists.sourceforge.net
From: Jean-Denis Girard <jd.girard@sysnux.pf>
Date: Fri, 11 Jun 2021 10:06:58 -1000
Message-ID: <sa0fp3$12s9$1@ciao.gmane.io>
References: <20210430013157.747152-1-nickrterrell@gmail.com>
Mime-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210430013157.747152-1-nickrterrell@gmail.com>
Content-Language: fr
X-Spam-Score: 4.3 (++++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: sysnux.pf]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 1.6 FORGED_MUA_MOZILLA     Forged mail pretending to be from Mozilla
X-Headers-End: 1lrnYf-005Ymh-MT
Subject: Re: [f2fs-dev] [GIT PULL][PATCH v11 0/4] Update to zstd-1.4.10
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgbGlzdCwKCkxlIDI5LzA0LzIwMjEgw6AgMTU6MzEsIE5pY2sgVGVycmVsbCBhIMOpY3JpdMKg
Ogo+IEZyb206IE5pY2sgVGVycmVsbCA8dGVycmVsbG5AZmIuY29tPgo+IAo+IFBsZWFzZSBwdWxs
IGZyb20KPiAKPiAgICBnaXRAZ2l0aHViLmNvbTp0ZXJyZWxsbi9saW51eC5naXQgdGFncy92MTEt
enN0ZC0xLjQuMTAKPiAKPiB0byBnZXQgdGhlc2UgY2hhbmdlcy4gQWx0ZXJuYXRpdmVseSB0aGUg
cGF0Y2hzZXQgaXMgaW5jbHVkZWQuCj4gCj4gVGhpcyBwYXRjaHNldCBsaXN0cyBtZSBhcyB0aGUg
bWFpbnRhaW5lciBmb3IgenN0ZCBhbmQgdXBncmFkZXMgdGhlIHpzdGQgbGlicmFyeQo+IHRvIHRo
ZSBsYXRlc3QgdXBzdHJlYW0gcmVsZWFzZS4gVGhlIGN1cnJlbnQgenN0ZCB2ZXJzaW9uIGluIHRo
ZSBrZXJuZWwgaXMgYQo+IG1vZGlmaWVkIHZlcnNpb24gb2YgdXBzdHJlYW0genN0ZC0xLjMuMS4g
QXQgdGhlIHRpbWUgaXQgd2FzIGludGVncmF0ZWQsIHpzdGQKPiB3YXNuJ3QgcmVhZHkgdG8gYmUg
dXNlZCBpbiB0aGUga2VybmVsIGFzLWlzLiBCdXQsIGl0IGlzIG5vdyBwb3NzaWJsZSB0byB1c2UK
PiB1cHN0cmVhbSB6c3RkIGRpcmVjdGx5IGluIHRoZSBrZXJuZWwuCj4gCj4gSSBoYXZlIG5vdCB5
ZXQgcmVsZWFzZWQgenN0ZC0xLjQuMTAgdXBzdHJlYW0uIEkgd2FudCB0aGUgenN0ZCB2ZXJzaW9u
IGluIHRoZQo+IGtlcm5lbCB0byBtYXRjaCB1cCB3aXRoIGEga25vd24gdXBzdHJlYW0gcmVsZWFz
ZSwgc28gd2Uga25vdyBleGFjdGx5IHdoYXQgY29kZQo+IGlzIHJ1bm5pbmcuIFdoZW5ldmVyIHRo
aXMgcGF0Y2hzZXQgaXMgcmVhZHkgZm9yIG1lcmdlLCBJIHdpbGwgY3V0IGEgcmVsZWFzZSBhdAo+
IHRoZSB1cHN0cmVhbSBjb21taXQgdGhhdCBnZXRzIG1lcmdlZC4gVGhpcyBzaG91bGQgbm90IGJl
IG5lY2Vzc2FyeSBmb3IgZnV0dXJlCj4gcmVsZWFzZXMuCj4gCj4gVGhlIGtlcm5lbCB6c3RkIGxp
YnJhcnkgaXMgYXV0b21hdGljYWxseSBnZW5lcmF0ZWQgZnJvbSB1cHN0cmVhbSB6c3RkLiBBIHNj
cmlwdAo+IG1ha2VzIHRoZSBuZWNlc3NhcnkgY2hhbmdlcyBhbmQgaW1wb3J0cyBpdCBpbnRvIHRo
ZSBrZXJuZWwuIFRoZSBjaGFuZ2VzIGFyZToKPiAKPiAxLiBSZXBsYWNlIGFsbCBsaWJjIGRlcGVu
ZGVuY2llcyB3aXRoIGtlcm5lbCByZXBsYWNlbWVudHMgYW5kIHJld3JpdGUgaW5jbHVkZXMuCj4g
Mi4gUmVtb3ZlIHVubmNlc3NhcnkgcG9ydGFiaWxpdHkgbWFjcm9zIGxpa2U6ICNpZiBkZWZpbmVk
KF9NU0NfVkVSKS4KPiAzLiBVc2UgdGhlIGtlcm5lbCB4eGhhc2ggaW5zdGVhZCBvZiBidW5kbGlu
ZyBpdC4KPiAKPiBUaGlzIGF1dG9tYXRpb24gZ2V0cyB0ZXN0ZWQgZXZlcnkgY29tbWl0IGJ5IHVw
c3RyZWFtJ3MgY29udGludW91cyBpbnRlZ3JhdGlvbi4KPiBXaGVuIHdlIGN1dCBhIG5ldyB6c3Rk
IHJlbGVhc2UsIHdlIHdpbGwgc3VibWl0IGEgcGF0Y2ggdG8gdGhlIGtlcm5lbCB0byB1cGRhdGUK
PiB0aGUgenN0ZCB2ZXJzaW9uIGluIHRoZSBrZXJuZWwuCj4gCj4gSSd2ZSB1cGRhdGVkIHpzdGQg
dG8gdXBzdHJlYW0gd2l0aCBvbmUgYmlnIHBhdGNoIGJlY2F1c2UgZXZlcnkgY29tbWl0IG11c3Qg
YnVpbGQsCj4gc28gdGhhdCBwcmVjbHVkZXMgcGFydGlhbCB1cGRhdGVzLiBTaW5jZSB0aGUgY29t
bWl0IGlzIDEwMCUgZ2VuZXJhdGVkLCBJIGhvcGUgdGhlCj4gcmV2aWV3IGJ1cmRlbiBpcyBsaWdo
dGVuZWQuIEkgY29uc2lkZXJlZCByZXBsYXlpbmcgdXBzdHJlYW0gY29tbWl0cywgYnV0IHRoYXQg
aXMKPiBub3QgcG9zc2libGUgYmVjYXVzZSB0aGVyZSBoYXZlIGJlZW4gfjM1MDAgdXBzdHJlYW0g
Y29tbWl0cyBzaW5jZSB0aGUgbGFzdCB6c3RkCj4gaW1wb3J0LCBhbmQgdGhlIGNvbW1pdHMgZG9u
J3QgYWxsIGJ1aWxkIGluZGl2aWR1YWxseS4gVGhlIGJ1bGsgdXBkYXRlIHByZXNlcnZlcwo+IGJp
c2VjdGFibGl0eSBiZWNhdXNlIGJ1Z3MgY2FuIGJlIGJpc2VjdGVkIHRvIHRoZSB6c3RkIHZlcnNp
b24gdXBkYXRlLiBBdCB0aGF0Cj4gcG9pbnQgdGhlIHVwZGF0ZSBjYW4gYmUgcmV2ZXJ0ZWQsIGFu
ZCB3ZSBjYW4gd29yayB3aXRoIHVwc3RyZWFtIHRvIGZpbmQgYW5kIGZpeAo+IHRoZSBidWcuIEFm
dGVyIHRoaXMgYmlnIHN3aXRjaCBpbiBob3cgdGhlIGtlcm5lbCBjb25zdW1lcyB6c3RkLCBmdXR1
cmUgcGF0Y2hlcwo+IHdpbGwgYmUgc21hbGxlciwgYmVjYXVzZSB0aGV5IHdpbGwgb25seSBoYXZl
IG9uZSB1cHN0cmVhbSByZWxlYXNlIHdvcnRoIG9mCj4gY2hhbmdlcyBlYWNoLgo+IAo+IFRoaXMg
cGF0Y2hzZXQgYWRkcyBhIG5ldyBrZXJuZWwtc3R5bGUgd3JhcHBlciBhcm91bmQgenN0ZC4gVGhp
cyB3cmFwcGVyIEFQSSBpcwo+IGZ1bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIHRoZSBzdWJzZXQg
b2YgdGhlIGN1cnJlbnQgenN0ZCBBUEkgdGhhdCBpcyBjdXJyZW50bHkKPiB1c2VkLiBUaGUgd3Jh
cHBlciBBUEkgY2hhbmdlcyB0byBiZSBrZXJuZWwgc3R5bGUgc28gdGhhdCB0aGUgc3ltYm9scyBk
b24ndAo+IGNvbGxpZGUgd2l0aCB6c3RkJ3Mgc3ltYm9scy4gVGhlIHVwZGF0ZSB0byB6c3RkLTEu
NC42IG1haW50YWlucyB0aGUgc2FtZSBBUEkKPiBhbmQgcHJlc2VydmVzIHRoZSBzZW1hbnRpY3Ms
IHNvIHRoYXQgbm9uZSBvZiB0aGUgY2FsbGVycyBuZWVkIHRvIGJlIHVwZGF0ZWQuCj4gCj4gVGhp
cyBwYXRjaHNldCBjb21lcyBpbiAyIHBhcnRzOgo+IDEuIFRoZSBmaXJzdCAyIHBhdGNoZXMgcHJl
cGFyZSBmb3IgdGhlIHpzdGQgdXBncmFkZS4gVGhlIGZpcnN0IHBhdGNoIGFkZHMgdGhlCj4gICAg
IG5ldyBrZXJuZWwgc3R5bGUgQVBJIHNvIHpzdGQgY2FuIGJlIHVwZ3JhZGVkIHdpdGhvdXQgbW9k
aWZ5aW5nIGFueSBjYWxsZXJzLgo+ICAgICBUaGUgc2Vjb25kIHBhdGNoIGFkZHMgYW4gaW5kaXJl
Y3Rpb24gZm9yIHRoZSBsaWIvZGVjb21wcmVzc191bnpzdGQuYwo+ICAgICBpbmNsdWRpbmcgb2Yg
YWxsIGRlY29tcHJlc3Npb24gc291cmNlIGZpbGVzLgo+IDIuIEltcG9ydCB6c3RkLTEuNC4xMC4g
VGhpcyBwYXRjaCBpcyBjb21wbGV0ZWx5IGdlbmVyYXRlZCBmcm9tIHVwc3RyZWFtIHVzaW5nCj4g
ICAgIGF1dG9tYXRlZCB0b29saW5nLgo+IAo+IEkgdGVzdGVkIGV2ZXJ5IGNhbGxlciBvZiB6c3Rk
IG9uIHg4Nl82NC4gSSB0ZXN0ZWQgYm90aCBhZnRlciB0aGUgMS40LjEwIHVwZ3JhZGUKPiB1c2lu
ZyB0aGUgY29tcGF0aWJpbGl0eSB3cmFwcGVyLCBhbmQgYWZ0ZXIgdGhlIGZpbmFsIHBhdGNoIGlu
IHRoaXMgc2VyaWVzLgo+IAo+IEkgdGVzdGVkIGtlcm5lbCBhbmQgaW5pdHJhbWZzIGRlY29tcHJl
c3Npb24gaW4gaTM4NiBhbmQgYXJtLgo+IAo+IEkgcmFuIGJlbmNobWFya3MgdG8gY29tcGFyZSB0
aGUgY3VycmVudCB6c3RkIGluIHRoZSBrZXJuZWwgd2l0aCB6c3RkLTEuNC42Lgo+IEkgYmVuY2ht
YXJrZWQgb24geDg2XzY0IHVzaW5nIFFFTVUgd2l0aCBLVk0gZW5hYmxlZCBvbiBhbiBJbnRlbCBp
OS05OTAway4KPiBJIGZvdW5kOgo+ICogQnRyRlMgenN0ZCBjb21wcmVzc2lvbiBhdCBsZXZlbHMg
MSBhbmQgMyBpcyA1JSBmYXN0ZXIKPiAqIEJ0ckZTIHpzdGQgZGVjb21wcmVzc2lvbityZWFkIGlz
IDE1JSBmYXN0ZXIKPiAqIFNxdWFzaEZTIHpzdGQgZGVjb21wcmVzc2lvbityZWFkIGlzIDE1JSBm
YXN0ZXIKPiAqIEYyRlMgenN0ZCBjb21wcmVzc2lvbit3cml0ZSBhdCBsZXZlbCAzIGlzIDglIGZh
c3Rlcgo+ICogRjJGUyB6c3RkIGRlY29tcHJlc3Npb24rcmVhZCBpcyAyMCUgZmFzdGVyCj4gKiBa
UkFNIGRlY29tcHJlc3Npb24rcmVhZCBpcyAzMCUgZmFzdGVyCj4gKiBLZXJuZWwgenN0ZCBkZWNv
bXByZXNzaW9uIGlzIDM1JSBmYXN0ZXIKPiAqIEluaXRyYW1mcyB6c3RkIGRlY29tcHJlc3Npb24r
YnVpbGQgaXMgNSUgZmFzdGVyCj4gCj4gVGhlIGxhdGVzdCB6c3RkIGFsc28gb2ZmZXJzIGJ1ZyBm
aXhlcy4gRm9yIGV4YW1wbGUgdGhlIHByb2JsZW0gd2l0aCBsYXJnZSBrZXJuZWwKPiBkZWNvbXBy
ZXNzaW9uIGhhcyBiZWVuIGZpeGVkIHVwc3RyZWFtIGZvciBvdmVyIDIgeWVhcnMKPiBodHRwczov
L2xrbWwub3JnL2xrbWwvMjAyMC85LzI5LzI3Lgo+IAo+IFBsZWFzZSBsZXQgbWUga25vdyBpZiB0
aGVyZSBpcyBhbnl0aGluZyB0aGF0IEkgY2FuIGRvIHRvIGVhc2UgdGhlIHdheSBmb3IgdGhlc2UK
PiBwYXRjaGVzLiBJIHRoaW5rIGl0IGlzIGltcG9ydGFudCBiZWNhdXNlIGl0IGdldHMgbGFyZ2Ug
cGVyZm9ybWFuY2UgaW1wcm92ZW1lbnRzLAo+IGNvbnRhaW5zIGJ1ZyBmaXhlcywgYW5kIGlzIHN3
aXRjaGluZyB0byBhIG1vcmUgbWFpbnRhaW5hYmxlIG1vZGVsIG9mIGNvbnN1bWluZwo+IHVwc3Ry
ZWFtIHpzdGQgZGlyZWN0bHksIG1ha2luZyBpdCBlYXN5IHRvIGtlZXAgdXAgdG8gZGF0ZS4KPiAK
PiBCZXN0LAo+IE5pY2sgVGVycmVsbAoKCkkndmUgYmVlbiB1c2luZyB0aGlzIHNlcmllcyBvbiBz
dGFibGUga2VybmVsIHNpbmNlIDUuMTIuMyAobm93IG9uIAo1LjEyLjEwKSBvbiBteSBtYWluIHN5
c3RlbSB3aXRob3V0IGlzc3Vlcy4KClRlc3RlZC1ieTogSmVhbi1EZW5pcyBHaXJhcmQgPGpkLmdp
cmFyZEBzeXNudXgucGY+CgoKVGhhbmtzLAotLSAKSmVhbi1EZW5pcyBHaXJhcmQKClN5c051eCAg
ICAgICAgICAgICAgICAgICBTeXN0w6htZXMgICBMaW51eCAgIGVuICAgUG9seW7DqXNpZSAgZnJh
bsOnYWlzZQpodHRwczovL3d3dy5zeXNudXgucGYvICAgVMOpbDogKzY4OSA0MC41MC4xMC40MCAv
IEdTTTogKzY4OSA4Ny43OTcuNTI3CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
