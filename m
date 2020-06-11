Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A631F70AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 01:01:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjWBs-00077a-3i; Thu, 11 Jun 2020 23:00:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jjWBq-00077T-Dv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 23:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=te3H1eMiqJofDOsQbhZXeS+TsEUg308LSKnpP5L+OSs=; b=QdtuT7fry/2JRT7uOzfHrNZ3VW
 kXGWxcu8CWoT5seA1CXgRKGQNhoDNSKwQ+qcNe/dbRICK5+fRujKxP2PdUwEsPDYpVBPkTFdVSAUZ
 YI3iPphzxfpwlMZTEb9jD8AzrbthvJ/e5kruIYsrHIHyZleRuek2gnRkDDfNjsoesSJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=te3H1eMiqJofDOsQbhZXeS+TsEUg308LSKnpP5L+OSs=; b=RSreShFdtPS5oMADNTACZM796C
 mv1RfytbSOn0pqIlCzctGj0+dLiYNbMMY15gVdXEw/TU1iQhHmF94SwMGgJkSO3rClVO9adma/EHC
 ehR+1n76fMX/QXaCFpPYdmpbbQHCBKky49VtmGt/ctK1LHDTLtxCUABkEocd2A3uALds=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jjWBp-00H863-61
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 23:00:54 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 65F3F20656;
 Thu, 11 Jun 2020 23:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591916444;
 bh=fpXBct85M7YMNzdjuE/p3J94/BvpSvWQ9ehY7kS1kPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hl9lJDj5hMdqfdtxhXFJMgSjHN+Z/CraRbwwWCcLiVymydsNmB3cZjwGuB4HpozmD
 Bwdrx6KXC9oXmmBvLpv8srDeA6srkbd+0SKpM5r7oOmSaSupEhK8YLaTS/PTUxucLE
 /PbDlt1kdiPZHwwHWmdMy+l/uBsPPESB0Wm6GXaU=
Date: Thu, 11 Jun 2020 16:00:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <20200611230043.GA18185@gmail.com>
References: <20200611031652.200401-1-daeho43@gmail.com>
 <20200611162721.GB1152@sol.localdomain>
 <CACOAw_zKC24BhNOF2BpuRfuYzBEsis82MafU9HqXwLj2sZ3Azg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zKC24BhNOF2BpuRfuYzBEsis82MafU9HqXwLj2sZ3Azg@mail.gmail.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jjWBp-00H863-61
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBKdW4gMTIsIDIwMjAgYXQgMDc6NDk6MTJBTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gMjAyMOuFhCA27JuUIDEy7J28ICjquIgpIOyYpOyghCAxOjI3LCBFcmljIEJpZ2dlcnMg
PGViaWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiA+Cj4gPiBPbiBUaHUsIEp1biAx
MSwgMjAyMCBhdCAxMjoxNjo1MlBNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+ID4gKyAg
ICAgZm9yIChpbmRleCA9IHBnX3N0YXJ0OyBpbmRleCA8IHBnX2VuZDspIHsKPiA+ID4gKyAgICAg
ICAgICAgICBzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSBkbjsKPiA+ID4gKyAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgZW5kX29mZnNldDsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgIHNldF9uZXdf
ZG5vZGUoJmRuLCBpbm9kZSwgTlVMTCwgTlVMTCwgMCk7Cj4gPiA+ICsgICAgICAgICAgICAgcmV0
ID0gZjJmc19nZXRfZG5vZGVfb2ZfZGF0YSgmZG4sIGluZGV4LCBMT09LVVBfTk9ERSk7Cj4gPiA+
ICsgICAgICAgICAgICAgaWYgKHJldCkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8g
b3V0Owo+ID4gPiArCj4gPiA+ICsgICAgICAgICAgICAgZW5kX29mZnNldCA9IEFERFJTX1BFUl9Q
QUdFKGRuLm5vZGVfcGFnZSwgaW5vZGUpOwo+ID4gPiArICAgICAgICAgICAgIGlmIChwZ19lbmQg
PCBlbmRfb2Zmc2V0ICsgaW5kZXgpCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICBlbmRfb2Zm
c2V0ID0gcGdfZW5kIC0gaW5kZXg7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICBmb3IgKDsg
ZG4ub2ZzX2luX25vZGUgPCBlbmRfb2Zmc2V0Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBkbi5vZnNfaW5fbm9kZSsrLCBpbmRleCsrKSB7Cj4gPiA+ICsgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpjdXJfYmRldjsKPiA+ID4gKyAgICAgICAgICAg
ICAgICAgICAgIGJsb2NrX3QgYmxrYWRkciA9IGYyZnNfZGF0YV9ibGthZGRyKCZkbik7Cj4gPiA+
ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChfX2lzX3ZhbGlkX2RhdGFfYmxrYWRk
cihibGthZGRyKSkgewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWYy
ZnNfaXNfdmFsaWRfYmxrYWRkcihGMkZTX0lfU0IoaW5vZGUpLAo+ID4gPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIsIERBVEFfR0VORVJJQ19FTkhBTkNFKSkg
ewo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1FRlND
T1JSVVBURUQ7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290
byBvdXQ7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIH0gZWxzZQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgY3VyX2JkZXYg
PSBmMmZzX3RhcmdldF9kZXZpY2Uoc2JpLCBibGthZGRyLCBOVUxMKTsKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGlmIChmMmZzX2lzX211bHRpX2RldmljZShzYmkpKSB7Cj4gPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGludCBpID0gZjJmc190YXJnZXRfZGV2aWNlX2luZGV4
KHNiaSwgYmxrYWRkcik7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxrYWRkciAtPSBGREVWKGkpLnN0YXJ0X2JsazsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIH0KPiA+ID4gKwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgaWYgKGxlbikgewo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocHJldl9iZGV2ID09IGN1cl9iZGV2
ICYmCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkciA9
PSBwcmV2X2Jsb2NrICsgbGVuKSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGVuKys7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0gZWxz
ZSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gZjJm
c19zZWN1cmVfZXJhc2UocHJldl9iZGV2LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X2Jsb2NrLCBsZW4sIGZsYWdzKTsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4g
PiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSAw
Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICB9Cj4gPiA+ICsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmICghbGVu
KSB7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZXZfYmRldiA9IGN1cl9i
ZGV2Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X2Jsb2NrID0gYmxr
YWRkcjsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0gMTsKPiA+ID4g
KyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gKyAgICAgICAgICAgICB9Cj4gPiA+ICsKPiA+
ID4gKyAgICAgICAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+ID4gPiArICAgICB9Cj4gPgo+
ID4gVGhpcyBsb29wIHByb2Nlc3NlcyB0aGUgZW50aXJlIGZpbGUsIHdoaWNoIG1heSBiZSB2ZXJ5
IGxhcmdlLiAgU28gaXQgY291bGQgdGFrZQo+ID4gYSB2ZXJ5IGxvbmcgdGltZSB0byBleGVjdXRl
Lgo+ID4KPiA+IEl0IHNob3VsZCBhdCBsZWFzdCB1c2UgdGhlIGZvbGxvd2luZyB0byBtYWtlIHRo
ZSB0YXNrIGtpbGxhYmxlIGFuZCBwcmVlbXB0aWJsZToKPiA+Cj4gPiAgICAgICAgICAgICAgICAg
aWYgKGZhdGFsX3NpZ25hbF9wZW5kaW5nKGN1cnJlbnQpKSB7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICBlcnIgPSAtRUlOVFI7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91
dDsKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiAgICAgICAgICAgICAgICAgY29uZF9yZXNjaGVk
KCk7Cj4gPgo+IAo+IEdvb2QgcG9pbnQhCj4gCj4gPiBBbHNvLCBwZXJoYXBzIHRoaXMgaW9jdGwg
c2hvdWxkIGJlIG1hZGUgaW5jcmVtZW50YWwsIGkuZS4gdGFrZSBpbiBhbgo+ID4gKG9mZnNldCwg
bGVuZ3RoKSBsaWtlIHB3cml0ZSgpPwo+ID4KPiA+IC0gRXJpYwo+IAo+IERpc2NhcmQgYW5kIFpl
cm9pbmcgd2lsbCBiZSB0cmVhdGVkIGluIGEgdW5pdCBvZiBibG9jaywgd2hpY2ggaXMgNEtCCj4g
aW4gRjJGUyBjYXNlLgo+IERvIHlvdSByZWFsbHkgbmVlZCB0aGUgKG9mZnNldCwgbGVuZ3RoKSBv
cHRpb24gaGVyZSBldmVuIGlmIHRoZSB1bml0Cj4gaXMgYSA0S0IgYmxvY2s/IEkgZ3Vlc3MgdGhp
cyBvcHRpb24gbWlnaHQgbWFrZSB0aGUgdXNlciBldmVuCj4gaW5jb252ZW5pZW5jZWQgdG8gdXNl
IHRoaXMgaW9jdGwsIGJlY2F1c2UgdGhleSBoYXZlIHRvIGJlYXIgNEtCCj4gYWxpZ25tZW50IGlu
IG1pbmQuCgpUaGUgaW9jdGwgYXMgY3VycmVudGx5IHByb3Bvc2VkIGFsd2F5cyBlcmFzZXMgdGhl
IGVudGlyZSBmaWxlLCB3aGljaCBjb3VsZCBiZQpnaWdhYnl0ZXMuICBUaGF0IGNvdWxkIHRha2Ug
YSB2ZXJ5IGxvbmcgdGltZS4KCkknbSBzdWdnZXN0aW5nIGNvbnNpZGVyaW5nIG1ha2luZyBpdCBw
b3NzaWJsZSB0byBjYWxsIHRoZSBpb2N0bCBtdWx0aXBsZSB0aW1lcwp0byBwcm9jZXNzIHRoZSBm
aWxlIGluY3JlbWVudGFsbHksIGxpa2UgeW91IHdvdWxkIGRvIHdpdGggd3JpdGUoKSBvciBwd3Jp
dGUoKS4KClRoYXQgaW1wbGllcyB0aGF0IGZvciBlYWNoIGlvY3RsIGNhbGwsIHRoZSBsZW5ndGgg
d291bGQgbmVlZCB0byBiZSBzcGVjaWZpZWQKdW5sZXNzIGl0J3MgaGFyZGNvZGVkIHRvIDRLaUIg
d2hpY2ggd291bGQgYmUgdmVyeSBpbmVmZmljaWVudC4gIFVzZXJzIHdvdWxkCnByb2JhYmx5IHdh
bnQgdG8gcHJvY2VzcyBhIGxhcmdlciBhbW91bnQgYXQgYSB0aW1lLCBsaWtlIDEgTWlCLCByaWdo
dD8KCkxpa2V3aXNlIHRoZSBvZmZzZXQgd291bGQgbmVlZCB0byBiZSBzcGVjaWZpZWQgYXMgd2Vs
bCwgdW5sZXNzIGl0IHdlcmUgdG8gYmUKdGFrZW4gaW1wbGljaXRseSBmcm9tIGZfcG9zLgoKLSBF
cmljCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
