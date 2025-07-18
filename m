Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB679B09E72
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 10:55:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYO+9yi6ha4loNfUCDROzkemOQpvFrPZjxvH/fGE15I=; b=haw6bAF4xHQHqw4ibpb8jOmUlV
	vTNrKPONAi3MkzHMt20JMzAbI3/W/7EJjaYaDcSTyc33H+8y0ug1OCZhoLew9boFJbvQEX9REn3/m
	x7hFLj1VDW+NDZUwp++HvzKNLP2qvwpfVgW0Ai2aLSCKAVppAA82rkrULLRJae3yYhE4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucgsB-0007Td-Bg;
	Fri, 18 Jul 2025 08:55:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ucgs9-0007TL-M0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 08:55:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AzOugc9D7Id2NoVKTTvR+9rx1bAJ+P+e6wPz7hpM0IQ=; b=IiW3CCu+W3k4cGZ01F7VjyTg+9
 0DnMJ9BuCh39kiEOvefx3za8UbMA1jBoW/1pTeuiEt3OlXdymtAT8+ThVA70Nb/lRBXbnJS3h2kfc
 4r7l1ETmDvNUEynMtDaJ6l+dChSfQRuqRpcpTG0rvnhYrP2Bdyjg+wTQ9Evrz8/j/8aA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AzOugc9D7Id2NoVKTTvR+9rx1bAJ+P+e6wPz7hpM0IQ=; b=bhohrSrKhXBDUk473egJoWd6gO
 Uezi+WiRG90CazlznEU34ptO1Hmzt4Mu2winniPYM6vd2gxSX/ov5NzaQOv0hE5mhbwoGQu/knTZG
 lu1ejBhnPo2G142DyoPz5hhgh9HvKPTUSu/PnB1comzCd7ITRsKFeqB/RVKMLqsRkVd0=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ucgs9-0002av-Rb for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 08:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 33369A540E2;
 Fri, 18 Jul 2025 08:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4C4C4CEEB;
 Fri, 18 Jul 2025 08:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752828906;
 bh=cyyYC4GCUdH4dHLc5TtPJMdZ4pgoNGYwxNgllf/G4MA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=HjMHoJVGe7ZhBaJIdHLNREd6K31H14JNdg+XuegckUw1R0iIBVoALu8wwNF44QU/0
 a8wmBvZa44ztNyZtQ2cOPMEaezpC2jetXoM8xIbkaRtpHRdv+H83lFXnA/BjuLJxCc
 EQUhoKGLgxJ8P74A9jVd+5cmc/0wJv9LlcyryLdS6HQcjJfFqZoHlyiQHZ/aMPJYf3
 aAX0xwStE1y/VMh8krYXMODxUq42wWv3M3ecOCuIjpOHDXHrupcBsST40QtrwxXyza
 vEaCmFxv+grpf+7BvTaUHThi94tNedikoW3j0jeaBnLBBji4Pb/LcdJBcicFJq72yB
 X8vo12ISLzc5w==
Message-ID: <3f4b1e92-12b6-4d72-ad1c-e157ecafcb56@kernel.org>
Date: Fri, 18 Jul 2025 16:55:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?6rmA6rec7KeE?= <rolypolyvg295@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
References: <CAA_oFbL+kxddwhS9-PWeO1EE4yJBHk6uwMwjB+r9wAW6+Zb45Q@mail.gmail.com>
 <742d1cc4-38c0-4f87-aab2-ab76a3825d01@kernel.org>
Content-Language: en-US
In-Reply-To: <742d1cc4-38c0-4f87-aab2-ab76a3825d01@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/7/15 16:56, Chao Yu wrote: > Hi, > > Sorry for the
    delay. > > On 6/12/25 20:32, 김규진 wrote: >> Hi F2FS developers, >> >>
    I'm testing multi-threaded direct I/O in LFS mode on Linux kernel [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ucgs9-0002av-Rb
Subject: Re: [f2fs-dev] [question] Design rationale behind f2fs_map_blocks
 block reuse in LFS mode with DIO
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS83LzE1IDE2OjU2LCBDaGFvIFl1IHdyb3RlOgo+IEhpLAo+IAo+IFNvcnJ5IGZvciB0
aGUgZGVsYXkuCj4gCj4gT24gNi8xMi8yNSAyMDozMiwg6rmA6rec7KeEIHdyb3RlOgo+PiBIaSBG
MkZTIGRldmVsb3BlcnMsCj4+Cj4+IEknbSB0ZXN0aW5nIG11bHRpLXRocmVhZGVkIGRpcmVjdCBJ
L08gaW4gTEZTIG1vZGUgb24gTGludXgga2VybmVsCj4+IDYuOC4wLTU3LjU5LCBhbmQgbm90aWNl
ZCB3aGF0IHNlZW1zIHRvIGJlIGFuIGluZWZmaWNpZW5jeSBpbiBibG9jawo+PiBhbGxvY2F0aW9u
IGJlaGF2aW9yIGluc2lkZSBgZnMvZjJmcy9kYXRhLmNgIChzcGVjaWZpY2FsbHkKPj4gYGYyZnNf
bWFwX2Jsb2NrcygpYCk6Cj4+Cj4+IDEuIEluIExGUyBtb2RlIHdpdGggZGlyZWN0IEkvTywgYGYy
ZnNfbWFwX2Jsb2NrcygpYCBhbHdheXMgY2FsbHMKPj4gYF9fYWxsb2NhdGVfZGF0YV9ibG9jaygp
YCB0byByZXNlcnZlIGEgbmV3IGJsb2NrIGFuZCB1cGRhdGVzIHRoZQo+PiBub2RlL05BVCBlbnRy
eSwgcmVnYXJkbGVzcyBvZiBleHRlbnQgY29udGludWl0eS4KPj4KPj4gMi4gSWYgdGhlIG5ldyBi
bG9jayBpcyBub3QgcGh5c2ljYWxseSBjb250aWd1b3VzIHdpdGggdGhlIGN1cnJlbnQKPj4gZXh0
ZW50LCBpdCBzdWJtaXRzIHRoZSBjdXJyZW50IGJpbyBhbmQgZGVmZXJzIHRoZSB3cml0ZSBvZiB0
aGUgbmV3bHkKPj4gcmVzZXJ2ZWQgYmxvY2sgKHdoaWNoIGlzIG5vdyByZWNvcmRlZCBpbiB0aGUg
bm9kZSkgdG8gdGhlIG5leHQKPj4gbWFwcGluZy4KPj4KPj4gMy4gT24gdGhlIG5leHQgYGYyZnNf
bWFwX2Jsb2NrcygpYCBjYWxsLCBpdCBmaW5kcyB0aGF0IHRoZSBsb2dpY2FsCj4+IGJsb2NrIGlz
IGFscmVhZHkgbWFwcGVkIGluIHRoZSBub2RlL05BVCBlbnRyeSBhbmQgc2tpcHMgb3Zlcgo+PiBp
dOKAlGRlc3BpdGUgdGhlIGJsb2NrIG5ldmVyIGhhdmluZyBiZWVuIHdyaXR0ZW7igJRyZXN1bHRp
bmcgaW4gYWxsb2NhdGlvbgo+PiBvZiB5ZXQgYW5vdGhlciBibG9jay4gT3ZlciB0aW1lLCB0aGlz
IGxlYXZlcyBiZWhpbmQgaG9sZXMgaW4gdGhlCj4+IGN1cnJlbnQgc2VnbWVudCwgZXNwZWNpYWxs
eSB1bmRlciBoZWF2eSBtdWx0aS10aHJlYWRlZCBESU8uCj4gCj4gSUlVQywKPiAKPiBUaGUgcHJv
YmxlbSBpcyBzb21ldGhpbmcgbGlrZSB0aGlzLCBpcyBteSB1bmRlcnN0YW5kaW5nIHJpZ2h0Pwo+
IAo+IC0gdXNlciB0cmllcyB0byB3cml0ZSA3NjggYmxvY2tzIHcvIGRpcmVjdCBJTy4KPiAtIGYy
ZnNfaW9tYXBfYmVnaW4ob2ZzOjAsIGxlbjo3NjgpCj4gICAtIGYyZnNfbWFwX2Jsb2NrcyBhbGxv
Y2F0ZXMgdHdvIGV4dGVudHMgW29mczowLCBibGs6NTEyLCBsZW46NTEyXSBhbmQKPiAgICAgW29m
czo1MTIsIGJsazowLCBsZW46MF0sIGhvd2V2ZXIgZjJmc19tYXBfYmxvY2tzKCkgb25seSByZXR1
cm4gdGhlIGZpcnN0Cj4gICAgIGV4dGVudCwKPiAgIC0gZjJmc19pb21hcF9iZWdpbihvZnM6NTEy
LCBsZW46MjU2KQo+ICAgICBmMmZzX21hcF9ibG9ja3MgYWxsb2NhdGVzIGFub3RoZXIgcGh5c2lj
YWwgYmxvY2sgZm9yIG9mczo1MTIgZXZlbiB0aGVyZSBpcwo+ICAgICBhIHVud3JpdHRlbiBwaHlz
aWNhbCBibG9jayBhbGxvY2F0ZWQgZHVyaW5nIHByZXZpb3VzIGYyZnNfbWFwX2Jsb2Nrcy4KCklm
IEknbSBub3QgbWlzc2luZyBhbnkgdGhpbmcsIHRoaXMgaXNzdWUgaGFzIGJlZW4gZml4ZWQgdy8g
YmVsb3cgcGF0Y2g6Cgpjb21taXQgMDYzOGEzMTk3YzE5NGJlZDgzN2MxNTdjMzU3NDY4NWUzNmZl
YmM3YgpBdXRob3I6IERhZWp1biBQYXJrIDxkYWVqdW43LnBhcmtAc2Ftc3VuZy5jb20+CkRhdGU6
ICAgVGh1IFNlcCA1IDE0OjI0OjMzIDIwMjQgKzA5MDAKCiAgICAgZjJmczogYXZvaWQgdW51c2Vk
IGJsb2NrIHdoZW4gZGlvIHdyaXRlIGluIExGUyBtb2RlCgogICAgIFRoaXMgcGF0Y2ggYWRkcmVz
c2VzIHRoZSBwcm9ibGVtIHRoYXQgd2hlbiB1c2luZyBMRlMgbW9kZSwgdW51c2VkIGJsb2Nrcwog
ICAgIG1heSBvY2N1ciBpbiBmMmZzX21hcF9ibG9ja3MoKSBkdXJpbmcgYmxvY2sgYWxsb2NhdGlv
biBmb3IgZGlvIHdyaXRlcy4KCiAgICAgSWYgYSBuZXcgc2VjdGlvbiBpcyBhbGxvY2F0ZWQgZHVy
aW5nIGJsb2NrIGFsbG9jYXRpb24sIGl0IHdpbGwgbm90IGJlCiAgICAgaW5jbHVkZWQgaW4gdGhl
IG1hcCBzdHJ1Y3QgYnkgbWFwX2lzX21lcmdlYWJsZSgpIGlmIHRoZSBMQkEgb2YgdGhlCiAgICAg
YWxsb2NhdGVkIGJsb2NrIGlzIG5vdCBjb250aWd1b3VzLiBIb3dldmVyLCB0aGUgYmxvY2sgYWxy
ZWFkeSBhbGxvY2F0ZWQKICAgICBpbiB0aGlzIHByb2Nlc3Mgd2lsbCByZW1haW4gdW51c2VkIGR1
ZSB0byB0aGUgTEZTIG1vZGUuCgogICAgIFRoaXMgcGF0Y2ggYXZvaWRzIHRoZSBwb3NzaWJpbGl0
eSBvZiB1bnVzZWQgYmxvY2tzIGJ5IGVzY2FwaW5nCiAgICAgZjJmc19tYXBfYmxvY2tzKCkgd2hl
biBhbGxvY2F0aW5nIHRoZSBsYXN0IGJsb2NrIGluIGEgc2VjdGlvbi4KCiAgICAgU2lnbmVkLW9m
Zi1ieTogRGFlanVuIFBhcmsgPGRhZWp1bjcucGFya0BzYW1zdW5nLmNvbT4KICAgICBSZXZpZXdl
ZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgogICAgIFNpZ25lZC1vZmYtYnk6IEphZWdl
dWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CgpUaGFua3MsCgo+IAo+IFRoYW5rcywKPiAKPj4K
Pj4KPj4gU2luY2UgSSdtIHN0aWxsIG5ldyB0byBGMkZTIGludGVybmFscywgSSBtYXkgYmUgbWlz
c2luZyBzb21ldGhpbmcg4oCUCj4+IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQgdGhlIGRlc2lnbiBy
YXRpb25hbGUgYmVoaW5kIHRoaXMgYmVoYXZpb3IgaW4KPj4gTEZTIG1vZGUsIGlmIHBvc3NpYmxl
Lgo+Pgo+PiAqKk15IHF1ZXN0aW9ucyBhcmU6KioKPj4KPj4gLSBJcyB0aGVyZSBhIHNwZWNpZmlj
IHJlYXNvbiBGMkZTIGRvZXMgbm90IGRpc3Rpbmd1aXNoIGJldHdlZW4KPj4gcmVzZXJ2ZWQtYnV0
LXVud3JpdHRlbiBhbmQgYWxyZWFkeS13cml0dGVuIGJsb2NrcyBpbiB0aGlzIGNhc2U/Cj4+IC0g
V291bGQgaXQgYmUgcG9zc2libGUgKG9yIGJlbmVmaWNpYWwpIHRvOgo+Pgo+PiAgICAxLiBEZWxh
eSBibG9jayBhbGxvY2F0aW9uIHVudGlsIHRoZSBleHRlbnQgY2FuIGFjdHVhbGx5IGJlIGV4dGVu
ZGVkPwo+Pgo+PiAgICAyLiBUcmFjayAicmVzZXJ2ZWQtYnV0LXVud3JpdHRlbiIgYmxvY2tzIGRp
c3RpbmN0bHkgdG8gYXZvaWQgcmVhbGxvY2F0aW9uPwo+Pgo+Pgo+PiBUaGFua3MgaW4gYWR2YW5j
ZSBmb3IgYW55IGNsYXJpZmljYXRpb24gb3IgaW5zaWdodC4KPj4KPj4gQmVzdCByZWdhcmRzLAo+
Pgo+PiBHeWppbiBLaW0KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1h
aWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
