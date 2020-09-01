Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2872525A1A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Sep 2020 00:50:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDF6s-0001dq-OF; Tue, 01 Sep 2020 22:50:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <didier@slint.fr>) id 1kDF6r-0001dj-PC
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Sep 2020 22:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=04OLH/+Raxsj05TYwHBTVond1Ny0ERkEShG45YG4tBU=; b=U7Pe9M/57f1Inbqi758D2Bc4bL
 GyDYmT8uR8c9cES1R2ulnj2mRUghHF79oSLBvG1bCNq53N1a/Z1l2rpCdYAMd96S93jLZCrkrPKkf
 O06ab8wqIuyHCQpr/+/eEAiaLzkd+V7E4sKooEG99e0vldIG66WU6vwX+wBDsuBzKGsM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:Cc:From:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=04OLH/+Raxsj05TYwHBTVond1Ny0ERkEShG45YG4tBU=; b=A5gWO+7b7zVIT7AXhX1gZJ+QD5
 kVMYpDRkHmMJzYj89HmZlzWcuE7xHux2RUvXZtFQpUnXCRimzonKmdmhVA3jBr1ctAXjV/AD221BH
 L4b0gpFc6v7VAEoRhyYAijFMX+fb+fnmRmglK9tszt8Ua+MbcujT+MtWXdmDcynL8AkQ=;
Received: from darkstar.slint.fr ([172.105.89.79])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.92.2)
 id 1kDF6j-008N7x-2s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 01 Sep 2020 22:50:37 +0000
Received: from darkstar.machine.fr (static-176-175-66-67.ftth.abo.bbox.fr
 [176.175.66.67])
 by darkstar.slint.fr (Postfix) with ESMTPSA id 4596FBE797;
 Tue,  1 Sep 2020 23:49:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=slint.fr; s=default;
 t=1598996970; bh=h9dpkNeMhhMvAZrGD5wVFHXzoGUo/QAWDNMO+9UYjn4=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=G0568oK9n/o9O+qz87T+rXbmj3MYnXomsAr3foAqW7NcrtjhN17ApHwEt1/ixIg+I
 FkyEXcEE/KteitL+ws01I2Mbl9tfRcBmGZKbX2m8BYCMJokDGadwvZoR2z4a9/GeQx
 0+bUsQfxSWVTm5In2ZnuGpNBR/SKp+B6WbSi3SVQDOqgt2V8/camXdHGYWWf6sgVom
 c8RAs42xNFF07MIym2hnkkj4VLEn8QVWFg68ZuLAHx+4CHDXbu9cSPqnjWKyRQ+PrT
 haU7dmZsl25ytTnwbTpCRQP1g+9fKfEgcbh0cT4VS++YVIsv5dkAqoCpsfnOHmgGB2
 9zRtu+HYfFsbw==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <13e19af7-69d5-6db3-441e-3be4921983de@slint.fr>
 <20200625003543.GA34187@google.com>
 <f153c668-5463-eb2e-d232-64c0d9df7d49@slint.fr>
 <20200831174235.GA3665231@google.com>
From: Didier Spaier <didier@slint.fr>
Message-ID: <801cef77-cbbd-e8ff-8ef1-f88f25e726f2@slint.fr>
Date: Wed, 2 Sep 2020 00:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200831174235.GA3665231@google.com>
Content-Language: fr
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mail-archive.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
 -2.1 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kDF6j-008N7x-2s
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

SGksCgpMZSAzMS8wOC8yMDIwIMOgIDE5OjQyLCBKYWVnZXVrIEtpbSBhIMOpY3JpdMKgOgo+IEhp
LAo+IAo+IE9uIDA4LzIzLCBEaWRpZXIgU3BhaWVyIHdyb3RlOgo+PiBIaSwKPj4KPj4gdGhhbmtz
IGZvciB5b3VyIGFuc3dlciwgd2hpY2ggbGVhZHMgdG8gbW9yZSBxdWVzdGlvbnMgYW5kIGEgcmVx
dWVzdC4KPj4KPj4gSSB3aWxsIHF1b3RlIG9ubHkgdGhlIHJlbGV2YW50IHBhcnRzIG9mIHRoaXMg
YW5zd2VyIGJlbG93Lgo+Pgo+PiBMZSAyNS8wNi8yMDIwIMOgIDAyOjM1LCBKYWVnZXVrIEtpbSBh
IMOpY3JpdCA6Cj4+PiBPbiAwNi8yNSwgRGlkaWVyIFNwYWllciB3cm90ZToKPj4KPj4+PiB0aGlz
IGVtYWlsIGlzIGEgZm9sbG93LXVwIG9mOgo+Pj4+IGh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5j
b20vbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQvbXNnMTQzOTAuaHRtbAo+
Pgo+PiAuLi4KPj4KPj4+PiBRMTogQ29tbWVudHMgYWJvdXQgdGhpcyBjaG9pY2Ugb2YgdGFyZ2V0
IGRldmljZXMgZm9yIGYyZnMsIGtub3dpbmcgdGhhdAo+Pj4+IEkgZmF2b3Igc2VjdXJpdHkgb3Zl
ciBwZXJmb3JtYW5jZXMgYW5kIHRoYXQgdGhlICJhdXRvIiBvcHRpb24gb2YgdGhlCj4+Pj4gaW5z
dGFsbGVyIGlzIGludGVuZGVkIGZvciB5b3VyIGdyYW5kLW1vdGhlcj8gSSBhbSBhIGdyYW5kIGZh
dGhlciBteXNlbGYKPj4+PiA8c21pbGU+Lgo+Pj4KPj4+IFdoaWNoIHNlY3VyaXR5IGFuZCBwZXJm
b3JtYW5jZSBmZWF0dXJlIGRvIHlvdSB3YW50IHRvIHVzZSBpbiB0aGUgc3lzdGVtPwo+Pj4gRm9y
IGV4YW1wbGUsIG1rZnMuZjJmcyByZXF1aXJlcyBzb21lIG9wdGlvbnMgbGlrZToKPj4+IC0gZnNj
cnlwdCA6IC1PIGVuY3J5cHQKPj4+IC0gcXVvdGEgOiAtTyBxdW90YQo+Pj4gLSBmc3Zlcml0eSA6
IC1PIHZlcml0eQo+Pj4gLSBjb21wcmVzc2lvbiA6IC1PIGNvbXByZXNzaW9uIC1PIGV4dHJhX2F0
dHIKPj4+IC0gY2FzZWZvbGRpbmcgOiAtTyBjYXNlZm9sZCAtQyB1dGY4Cj4+IERvIEkgdW5kZXJz
dGFuZCB3ZWxsIHRoYXQgdGhlc2UgZmVhdHVyZXMgYXJlIGRlZmluZWQgaW4gZjJmcy5oPwo+PiBJ
biBMaW51eCA1LjQuNjA6Cj4+ICNkZWZpbmUgRjJGU19GRUFUVVJFX0VOQ1JZUFQJCTB4MDAwMQo+
PiAjZGVmaW5lIEYyRlNfRkVBVFVSRV9CTEtaT05FRAkJMHgwMDAyCj4+ICNkZWZpbmUgRjJGU19G
RUFUVVJFX0FUT01JQ19XUklURQkweDAwMDQKPj4gI2RlZmluZSBGMkZTX0ZFQVRVUkVfRVhUUkFf
QVRUUgkJMHgwMDA4Cj4+ICNkZWZpbmUgRjJGU19GRUFUVVJFX1BSSlFVT1RBCQkweDAwMTAKPj4g
I2RlZmluZSBGMkZTX0ZFQVRVUkVfSU5PREVfQ0hLU1VNCTB4MDAyMAo+PiAjZGVmaW5lIEYyRlNf
RkVBVFVSRV9GTEVYSUJMRV9JTkxJTkVfWEFUVFIJMHgwMDQwCj4+ICNkZWZpbmUgRjJGU19GRUFU
VVJFX1FVT1RBX0lOTwkJMHgwMDgwCj4+ICNkZWZpbmUgRjJGU19GRUFUVVJFX0lOT0RFX0NSVElN
RQkweDAxMDAKPj4gI2RlZmluZSBGMkZTX0ZFQVRVUkVfTE9TVF9GT1VORAkJMHgwMjAwCj4+ICNk
ZWZpbmUgRjJGU19GRUFUVVJFX1ZFUklUWQkJMHgwNDAwCj4+ICNkZWZpbmUgRjJGU19GRUFUVVJF
X1NCX0NIS1NVTQkJMHgwODAwCj4+ICNkZWZpbmUgRjJGU19GRUFUVVJFX0NBU0VGT0xECQkweDEw
MDAKPj4gICAKPj4gSSBhc2sgYmVjYXVzZSBJIGRvbid0IHNlZSB0aGVtIGxpc3RlZCBpbiBhIG1h
biBwYWdlIHdoZXJlIEkgd291bGQgaGF2ZQo+PiBleHBlY3RlZCB0byBmaW5kIHRoZW0sIGxpa2Ug
bWtmcy5mMmZzICg4KSBvciBtb3VudCAoOCkKPj4KPj4gSSBkb24ndCBzZWUgdGhlbSBsaXN0ZWQg
aW46Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51eC9ibG9iL21hc3Rlci9Eb2N1
bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0Cj4+Cj4+IC4uLiAKPiAKPiBTb3JyeSBmb3Ig
aW5jb252ZW5pZW5jZS4gTGV0IG1lIGVuaGFuY2UgZG9jdW1lbnRhdGlvbiBhIGJpdC4KClRoYW5r
cyBpbiBhZHZhbmNlLiBJIGtub3cgdGhhdCBpdCB0YWtlcyB0aW1lIHRvIHVwZGF0ZSBkb2N1bWVu
dGF0aW9uCmFuZCB0aGF0IHlvdSBhcmUgYnVzeSBlbm91Z2ggYWxyZWFkeS4gCgo+Pj4+IFEzLiBX
aGF0IHdvdWxkIGJlIHRoZSBzYWZlc3Qgb3B0aW9ucyB0byBpbmNsdWRlIGluIHRoZSByZWxldmFu
dCBsaW5lIG9mCj4+Pj4gL2V0Yy9mc3RhYiBmb3J0aGUgcm9vdCBwYXJ0aXRpb24gdXNpbmcgZjJm
cz8KPj4+Cj4+PiBkZWZhdWx0ICsgYW55IGZlYXR1cmVzIHRoYXQgeW91J3JlIGludGVyZXN0ZWQg
aW4/Cj4+PiBXZSd2ZSBiZWVuIHVzaW5nIHRoZSBiZWxvdyBvcHRpb24gZm9yIHNldmVyYWwgeWVh
cnMgaW4gQW5kcm9pZC4KPj4+IGh0dHBzOi8vYW5kcm9pZC5nb29nbGVzb3VyY2UuY29tL2Rldmlj
ZS9nb29nbGUvY29yYWwvKy9yZWZzL2hlYWRzL21hc3Rlci9mc3RhYi5oYXJkd2FyZSMxMQo+Pgo+
PiBUaGUgbW91bnQgZmxhZ3MgYW5kIG9wdGlvbnMgYXJlIGRlc2NyaWJlZCBpbiBmMmZzLnJzdCBi
dXQgSSBkb24ndCBleHBlY3QgYQo+PiBjYXN1YWwgdXNlciB0byByZWFkIHRoYXQuCj4+Cj4+IFNv
IEkgc3VnZ2VzdCB0aGF0IGFsbCB0aGUgbW91bnQgb3B0aW9ucyBzcGVjaWZpYyB0byBmMmZzIGJl
IGxpc3RlZCBpbiBhbgo+PiBkb2N1bWVudCBpbnRlbmRlZCBmb3IgZW5kIHVzZXJzIChtYW4gZjJm
cz8pIGFzIHRoYXQgY291bGQgaGVscCBmYXZvciBpdHMKPj4gYWRvcHRpb24gYnkgTGludXggZGlz
dHJpYnV0aW9ucyBhcyBhbiBhbHRlcm5hdGl2ZSB0byBleHQ0IHdoZW4gcmVsZXZhbnQuCj4+Cj4+
IE1heWJlIHlvdSBjb3VsZCBjb25zdWx0IHdpdGggdXRpbC1saW51eCBkZXZzLCBhcyBtYW4gbW91
bnQgaXMgcGFydCBvZiB0aGUKPj4gdXRpbC1saW51eCBwYWNrYWdlOyB0byBqdXN0IGFkZCBhIGxp
bmUgdG8gdGhlIHRleHQgcXVvdGVkIGJlbG93Pwo+Pgo+PiBGSUxFU1lTVEVNLVNQRUNJRklDIE1P
VU5UIE9QVElPTlMKPj4gICAgICAgIFRoaXMgc2VjdGlvbiBsaXN0cyBvcHRpb25zIHRoYXQgYXJl
IHNwZWNpZmljIHRvIHBhcnRpY3VsYXIKPj4gICAgICAgIGZpbGVzeXN0ZW1zLiAgV2hlcmUgIHBv
c3NpYmxlLCB5b3UgIHNob3VsZCAgZmlyc3QgIGNvbnN1bHQKPj4gICAgICAgIGZpbGVzeXN0ZW0t
c3BlY2lmaWMgbWFudWFsIHBhZ2VzIGZvciBkZXRhaWxzLiAgU29tZSBvZiB0aG9zZSBwYWdlcwo+
PiAgICAgICAgYXJlIGxpc3RlZCBpbiB0aGUgZm9sbG93aW5nIHRhYmxlLgo+PiAgICAgICAgICAg
ICAgIAo+PiAgICAgICAgRmlsZXN5c3RlbShzKSAgICAgIE1hbnVhbCBwYWdlCj4+ICAgICAgICBi
dHJmcyAgICAgICAgICAgICAgYnRyZnMoNSkKPj4gICAgICAgIGNpZnMgICAgICAgICAgICAgICBt
b3VudC5jaWZzKDgpCj4+ICAgICAgICBleHQyLCBleHQzLCBleHQ0ICAgZXh0NCg1KQo+PiAgICAg
ICAgZnVzZSAgICAgICAgICAgICAgIGZ1c2UoOCkKPj4gICAgICAgIG5mcyAgICAgICAgICAgICAg
ICBuZnMoNSkKPj4gICAgICAgIHRtcGZzICAgICAgICAgICAgICB0bXBmcyg1KQo+PiAgICAgICAg
eGZzICAgICAgICAgICAgICAgIHhmcyg1KQo+Pgo+PiB0aGUgYWRkZWQgbGluZSB3b3VsZCBqdXN0
IGJlIGZvciBpbnN0YW5jZToKPj4KPj4gICAgICAgIGYyZnMgICAgICAgICAgICAgICBmMmZzKDgp
Cj4gCj4gSXQgc2VlbXMgcmVjZW50ICJtYW4gbW91bnQoOCkiIG1vdmVzIHRvIGd1aWRlIERvY3Vt
ZW50YXRpb24vZmlsZXN5c3RlbXMgYXMgd2VsbC4KPiBCdXQsIEkgdGhpbmsgSSBuZWVkIHRvIHBy
ZXBhcmUgYSBzb3J0IG9mICJtYW4gZjJmcyg1KSIgaW4gZjJmcy10b29scy4KCkknZCBiZSBnbGFk
IGZvciB0aGF0LCBzaG91bGQgYmUgdmVyeSB1c2VmdWwuCgo+IEZJTEVTWVNURU0tU1BFQ0lGSUMg
TU9VTlQgT1BUSU9OUwo+ICAgICAgICBZb3Ugc2hvdWxkIGNvbnN1bHQgdGhlIHJlc3BlY3RpdmUg
bWFuIHBhZ2UgZm9yIHRoZSBmaWxlc3lzdGVtIGZpcnN0LiAgSWYgeW91IHdhbnQgdG8ga25vdyB3
aGF0IG9wdGlvbnMgIHRoZSAgZXh0NAo+ICAgICAgICBmaWxlc3lzdGVtICBzdXBwb3J0cywgdGhl
biBjaGVjayB0aGUgZXh0NCg1KSBtYW4gcGFnZS4gIElmIHRoYXQgZG9lc24ndCBleGlzdCwgeW91
IGNhbiBhbHNvIGNoZWNrIHRoZSBjb3JyZXNwb25k4oCQCj4gICAgICAgIGluZyBtb3VudCBwYWdl
IGxpa2UgbW91bnQuY2lmcyg4KS4gIE5vdGUgdGhhdCB5b3UgbWlnaHQgaGF2ZSB0byBpbnN0YWxs
IHRoZSByZXNwZWN0aXZlIHVzZXJsYW5kIHRvb2xzLgo+IAo+ICAgICAgICBUaGUgZm9sbG93aW5n
IG9wdGlvbnMgYXBwbHkgb25seSB0byBjZXJ0YWluIGZpbGVzeXN0ZW1zLiAgV2Ugc29ydCB0aGVt
IGJ5IGZpbGVzeXN0ZW0uICBUaGV5ICBhbGwgIGZvbGxvdyAgdGhlICAtbwo+ICAgICAgICBmbGFn
Lgo+IAo+ICAgICAgICBXaGF0IG9wdGlvbnMgYXJlIHN1cHBvcnRlZCBkZXBlbmRzIGEgYml0IG9u
IHRoZSBydW5uaW5nIGtlcm5lbC4gIE1vcmUgaW5mbyBtYXkgYmUgZm91bmQgaW4gdGhlIGtlcm5l
bCBzb3VyY2Ugc3Vi4oCQCj4gICAgICAgIGRpcmVjdG9yeSBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zLgo+IAo+Pgo+PiBJbmRlZWQgCj4+Cj4+IEkga25vdyBJIHNob3VsZCBwcm9wb3NlIHRvIGNv
bnRyaWJ1dGUgd3JpdGluZyBtYW4gZjJmcywgdW5mb3J0dW5hdGVseSBteQo+PiBrbm93bGVkZ2Ug
b2YgZjJmcyBpcyB2ZXJ5IGNsb3NlIHRvIG5vbiBleGlzdGVudC4KPj4KPj4gSW5jaWRlbnRhbGx5
LCB0aGUgb3B0aW9ucyBsaXN0ZWQgaW4KPj4gaHR0cHM6Ly9hbmRyb2lkLmdvb2dsZXNvdXJjZS5j
b20vZGV2aWNlL2dvb2dsZS9jb3JhbC8rL3JlZnMvaGVhZHMvbWFzdGVyL2ZzdGFiLmhhcmR3YXJl
IzExCj4+IGluZGljYXRlIHRoYXQgZjJmcyBpcyBvbmx5IHVzZWQgZm9yIHRoZSBwYXJ0aXRpb24g
bW91bnRlZCBhcyAvZGF0YS4KPj4KPj4gSSBkb24ndCBrbm93IEFuZHJvaWQgYXQgYWxsIGJ1dCB0
aG91Z2h0IHRoYXQgL3N5c3RlbSBpcyBtb3JlIG9yIGxlc3MgdGhlCj4+IGVxdWl2YWxlbnQgb2Yg
cm9vdCAoLykgaW4gb3RoZXIgTGludXggZGlzdHJpYnV0aW9ucy4gSWYgdGhhdCdzIHRoZSBjYXNl
LAo+PiB3aHkgbm90IHVzIGFsc28gZjJmcyBmb3IgaXQ/IE1heWJlIEkgYW0gZnVsbHkgd3Jvbmcs
IHBsZWFzZSBjb3JyZWN0IG1lLgo+PiBJIHdvdWxkIGJlIGdyYXRlZnVsIGZvciBhbnkgcG9pbnRl
ciB0byBhIGRvY3VtZW50IGV4cGxhaW5pbmcgdGhlIHB1cnBvc2VzCj4+IG9mIHRoZSB2YXJpb3Vz
IG1vdW50IHBvaW50cyBpbiBBbmRyb2lkIGFzIHRoZXkgZGlmZmVyIGZyb20gdGhlIEZIUzoKPj4g
aHR0cHM6Ly9yZWZzcGVjcy5saW51eGZvdW5kYXRpb24ub3JnL2Zocy5zaHRtbAo+IAo+IEFuZHJv
aWQgL3N5c3RlbSBpcyBhIHJlYWQtb25seSBwYXJ0aXRpb24gd2hpY2ggcHJvdmlkZXMgYSBkZXZp
Y2UgYm9vdC11cCwgd2hpbGUKPiBhbGwgdGhlIGRhdGEgZm9yIGFwcGxpY2F0aW9ucyBhbmQgdXNl
cnMgYXJlIHN0b3JlZCBpbiAvZGF0YSBhcyByZWFkLXdyaXRlLgo+IEZvciBub3csIHRoZXJlJ3Mg
bm8gc3Ryb25nIG1vdGl2YXRpb24gdG8gcmVwbGFjZSB0aGUgZmlsZXN5c3RlbSBmb3IgL3N5c3Rl
bS4gOikKPiAKPj4KPj4gQmVzdCByZWdhcmRzLAo+Pgo+PiBEaWRpZXIKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
