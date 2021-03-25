Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B67349B8A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Mar 2021 22:26:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPXUj-0004Fk-9k; Thu, 25 Mar 2021 21:26:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shreeya.patel@collabora.com>) id 1lPXUh-0004FX-UP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 21:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTPDHAEx6cg/Nfh48Vv4DDbzGnZKz5wHG/PEr3H5I4M=; b=aQbMdUBAlghyQ8hc2OR487J/p7
 RJ/sKCezjuk4Z6zJrmD8VvMsafIk0JjGgBcCQbDpahIedSCNxr4DP3Xp5fGZGcsEffWydE9aLRBFi
 E+qCz5nvIpb0C/Z/iFOHPAbkGZv7N3BgeVwfP/Pntz7dsgzXBBsW3vZaegNVJKqzLmww=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lTPDHAEx6cg/Nfh48Vv4DDbzGnZKz5wHG/PEr3H5I4M=; b=AXdgM/vdQaW0irWbp0MShmHwvy
 7U9FD5O4P3SnwwoSQkdokkt+mrpsBWWUvEwgma1aZ3S0a/klv4EMaZk+9FSKoUPakkxagWs0D+mUS
 ES8HnNwBv4yHhpnJkB8Zv7dmgo0qWB+YwtLAO+BVqHbE0HT43potAaVOdNfzvvaMOVtQ=;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lPXUf-0002HF-6W
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 25 Mar 2021 21:26:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shreeya) with ESMTPSA id F018A1F46934
From: Shreeya Patel <shreeya.patel@collabora.com>
To: Eric Biggers <ebiggers@kernel.org>
References: <20210325000811.1379641-1-shreeya.patel@collabora.com>
 <20210325000811.1379641-6-shreeya.patel@collabora.com>
 <YFznIVf/F68oEuC6@sol.localdomain>
 <2db48ab8-1297-e044-dcec-6c8b8875fdb0@collabora.com>
Message-ID: <cb4e2292-51dc-70af-1b5f-b8312f94d82f@collabora.com>
Date: Fri, 26 Mar 2021 02:56:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <2db48ab8-1297-e044-dcec-6c8b8875fdb0@collabora.com>
Content-Language: en-US
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lPXUf-0002HF-6W
Subject: Re: [f2fs-dev] [PATCH v4 5/5] fs: unicode: Add utf8 module and a
 unicode layer
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
Cc: tytso@mit.edu, drosen@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel@collabora.com,
 adilger.kernel@dilger.ca, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 andre.almeida@collabora.com, linux-ext4@vger.kernel.org, krisman@collabora.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDI2LzAzLzIxIDE6NTYgYW0sIFNocmVleWEgUGF0ZWwgd3JvdGU6Cj4KPiBPbiAyNi8wMy8y
MSAxOjEwIGFtLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+IE9uIFRodSwgTWFyIDI1LCAyMDIxIGF0
IDA1OjM4OjExQU0gKzA1MzAsIFNocmVleWEgUGF0ZWwgd3JvdGU6Cj4+PiBBbHNvLCBpbmRpcmVj
dCBjYWxscyB1c2luZyBmdW5jdGlvbiBwb2ludGVycyBhcmUgZWFzaWx5IGV4cGxvaXRhYmxlIGJ5
Cj4+PiBzcGVjdWxhdGl2ZSBleGVjdXRpb24gYXR0YWNrcywgaGVuY2UgdXNlIHN0YXRpY19jYWxs
KCkgaW4gdW5pY29kZS5oIGFuZAo+Pj4gdW5pY29kZS1jb3JlLmMgZmlsZXMgaW5vcmRlciB0byBw
cmV2ZW50IHRoZXNlIGF0dGFja3MgYnkgbWFraW5nIGRpcmVjdAo+Pj4gY2FsbHMgYW5kIGFsc28g
dG8gaW1wcm92ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgZnVuY3Rpb24gcG9pbnRlcnMuCj4+IEkgZG9u
J3QgdGhpbmsgeW91IG5lZWQgdG8gd29ycnkgYWJvdXQgYXZvaWRpbmcgaW5kaXJlY3QgY2FsbHMg
dG8gcHJldmVudAo+PiBzcGVjdWxhdGl2ZSBleGVjdXRpb24gYXR0YWNrcy7CoCBUaGF0J3Mgd2hh
dCB0aGUgbWl0aWdhdGlvbnMgbGlrZSAKPj4gUmV0cG9saW5lIGFyZQo+PiBmb3IuwqAgSW5zdGVh
ZCBteSBjb25jZXJuIHdhcyBqdXN0IHRoYXQgaW5kaXJlY3QgY2FsbHMgYXJlICpzbG93KiwgCj4+
IGVzcGVjaWFsbHkKPj4gd2hlbiB0aG9zZSBtaXRpZ2F0aW9ucyBhcmUgZW5hYmxlZC7CoCBTb21l
IG9mIHRoZSBjYXNlZm9sZGluZyAKPj4gb3BlcmF0aW9ucyBhcmUKPj4gY2FsbGVkIGEgbG90IChl
LmcuLCByZXBlYXRlZGx5IGR1cmluZyBwYXRoIHJlc29sdXRpb24pLCBhbmQgaXQgd291bGQgYmUK
Pj4gZGVzaXJhYmxlIHRvIGF2b2lkIGFkZGluZyBtb3JlIG92ZXJoZWFkIHRoZXJlLgo+Pgo+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL3VuaWNvZGUvS2NvbmZpZyBiL2ZzL3VuaWNvZGUvS2NvbmZpZwo+Pj4g
aW5kZXggMmMyN2I5YTVjZDZjLi4yOTYxYjAyMDZiNGQgMTAwNjQ0Cj4+PiAtLS0gYS9mcy91bmlj
b2RlL0tjb25maWcKPj4+ICsrKyBiL2ZzL3VuaWNvZGUvS2NvbmZpZwo+Pj4gQEAgLTgsNyArOCwx
NiBAQCBjb25maWcgVU5JQ09ERQo+Pj4gwqDCoMKgwqDCoMKgwqAgU2F5IFkgaGVyZSB0byBlbmFi
bGUgVVRGLTggTkZEIG5vcm1hbGl6YXRpb24gYW5kIE5GRCtDRiAKPj4+IGNhc2Vmb2xkaW5nCj4+
PiDCoMKgwqDCoMKgwqDCoCBzdXBwb3J0Lgo+Pj4gwqAgKyMgVVRGLTggZW5jb2RpbmcgY2FuIGJl
IGNvbXBpbGVkIGFzIGEgbW9kdWxlIHVzaW5nIFVOSUNPREVfVVRGOCAKPj4+IG9wdGlvbi4KPj4+
ICsjIEhhdmluZyBVVEYtOCBlbmNvZGluZyBhcyBhIG1vZHVsZSB3aWxsIGF2b2lkIGNhcnJ5aW5n
IGxhcmdlCj4+PiArIyBkYXRhYmFzZSB0YWJsZSBwcmVzZW50IGluIHV0ZjhkYXRhLmhfc2hpcHBl
ZCBpbnRvIHRoZSBrZXJuZWwKPj4+ICsjIGJ5IGJlaW5nIGFibGUgdG8gbG9hZCBpdCBvbmx5IHdo
ZW4gaXQgaXMgcmVxdWlyZWQgYnkgdGhlIGZpbGVzeXN0ZW0uCj4+PiArY29uZmlnIFVOSUNPREVf
VVRGOAo+Pj4gK8KgwqDCoCB0cmlzdGF0ZSAiVVRGLTggbW9kdWxlIgo+Pj4gK8KgwqDCoCBkZXBl
bmRzIG9uIFVOSUNPREUKPj4+ICvCoMKgwqAgZGVmYXVsdCBtCj4+PiArCj4+IFRoZSBoZWxwIGZv
ciBVTklDT0RFIHN0aWxsIHNheXMgdGhhdCBpdCBlbmFibGVzIFVURi04IHN1cHBvcnQuIEJ1dCAK
Pj4gbm93IHRoZXJlIGlzCj4+IGEgc2VwYXJhdGUgb3B0aW9uIHRoYXQgcGVvcGxlIHdpbGwgbmVl
ZCB0byByZW1lbWJlciB0byBlbmFibGUuCj4+Cj4+IFBsZWFzZSBkb2N1bWVudCBlYWNoIG9mIHRo
ZXNlIG9wdGlvbnMgcHJvcGVybHkuCj4+Cj4+IFBlcmhhcHMgRVhUNF9GUyBhbmQgRjJGU19GUyBq
dXN0IHNob3VsZCBzZWxlY3QgVU5JQ09ERV9VVEY4IGlmIAo+PiBVTklDT0RFLCBzbyB0aGF0Cj4+
IFVOSUNPREVfVVRGOCBkb2Vzbid0IGhhdmUgdG8gYmUgYSB1c2VyLXNlbGVjdGFibGUgc3ltYm9s
Pwo+Cj4KPiBJdCBpcyBub3QgYSB1c2VyLXNlbGVjdGFibGUgc3ltYm9sLiBJdCBkZXBlbmRzIG9u
IFVOSUNPREUgYW5kIGlmIAo+IHNvbWVvbmUgZW5hYmxlcyBpdCwKPiBieSBkZWZhdWx0IFVOSUNP
REVfVVRGOCB3aWxsIGJlIGVuYWJsZWQgYXMgYSBtb2R1bGUuCj4KPgoKU29ycnksIEkgdGhpbmsg
SSBtaXN1bmRlcnN0b29kIHdoZW4geW91IHNhaWQgRVhUNF9GUyBhbmQgRjJGU19GUyBzaG91bGQg
CnNlbGVjdApVTklDT0RFX1VURjggaWYgVU5JQ09ERSBpcyBlbmFibGVkLiBJIG5vdyBnZXQgaXQg
dGhhdCB5b3UgZG9uJ3Qgd2FudCAKdGhlbSB0byBiZSBkZXNlbGVjdGFibGUuCkknbGwgbWFrZSB0
aGlzIGNoYW5nZS4gVGhhbmtzCgoKPj4+ICtERUZJTkVfU1RBVElDX0NBTEwodmFsaWRhdGUsIHVu
aWNvZGVfdmFsaWRhdGVfc3RhdGljX2NhbGwpOwo+Pj4gK0VYUE9SVF9TVEFUSUNfQ0FMTCh2YWxp
ZGF0ZSk7Cj4+IEdsb2JhbCBzeW1ib2xzIGNhbid0IGhhdmUgZ2VuZXJpYyBuYW1lcyBsaWtlICJ2
YWxpZGF0ZSIuwqAgUGxlYXNlIGFkZCBhbgo+PiBhcHByb3ByaWF0ZSBwcmVmaXggbGlrZSAidW5p
Y29kZV8iLgo+Pgo+PiBBbHNvLCB0aGUgdGhpbmcgY2FsbGVkICJ1bmljb2RlX3ZhbGlkYXRlX3N0
YXRpY19jYWxsIiBpc24ndCBhY3R1YWxseSAKPj4gYSBzdGF0aWMKPj4gY2FsbCBhcyB0aGUgbmFt
ZSBzdWdnZXN0cywgYnV0IHJhdGhlciB0aGUgZGVmYXVsdCBmdW5jdGlvbiB1c2VkIGJ5IAo+PiB0
aGUgc3RhdGljCj4+IGNhbGwuwqAgSXQgc2hvdWxkIGJlIGNhbGxlZCBzb21ldGhpbmcgbGlrZSB1
bmljb2RlX3ZhbGlkYXRlX2RlZmF1bHQuCj4+Cj4+IExpa2V3aXNlIGZvciBhbGwgdGhlIG90aGVy
cy4KPgo+Cj4gVGhhbmtzIGZvciB5b3VyIHJldmlld3MsIEknbGwgbWFrZSB0aGUgY2hhbmdlIHN1
Z2dlc3RlZCBieSB5b3UgaW4gdjUuCj4KPgo+Pgo+PiAtIEVyaWMKPj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
