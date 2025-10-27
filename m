Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C979C0D6DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Oct 2025 13:13:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xakWnfRQd1D6uJ5ktNwvCn+oi8mdCCd3uGc2Oob1yz0=; b=Lqc6PE7nA5nmueepZ8WJ6n0jr5
	ohIxIMc/hjXBRrbmVCICKZDLNz8ReSeY/DxdaNU61yKy5hy/1Y4fFdHxrtH0uuFEDBaFXjxXQcJ/l
	BJ1LmOWbVML10w5KfrvQLA0VBrCeIXdRMaYMfK/wuC/pXEPaIrIxs1qCgZx3xwNtOonA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vDM5r-0002Ax-Ja;
	Mon, 27 Oct 2025 12:12:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vDM5q-0002Ar-2h
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V+f+KdoBmEhYsJItqD2xb82DYK/x3+ogqq4Xu3wGjU0=; b=O1ypmUqGT3F3X/w/zjbGoAIMFH
 f+2OGWJyQSLpUGj1pB0MkOjzPmIkZHFeEolxfeGmPNuw5roiJdeJ4sFEwHd4NpRemqHgrP7FlHtI+
 X+h3d0Y2yvpmap73RqPV3/RL1jSwz5mu52/q5vk7FS/aIYNZuARBQJysibYaLAhR7ElA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=V+f+KdoBmEhYsJItqD2xb82DYK/x3+ogqq4Xu3wGjU0=; b=MUueLj/JOCnCNx5NqwXQqyx8nf
 h46aihpUz6GeNZpOphjMSRC5umshYKS0Sk7ywDk0u9i1kcveQPOJfyO1lH0Ou/RCgoqy09OjuTNA4
 NmYnUodaUy3kwfhJE3Pt/ScRi7GF9uQrmzIJ1ejiIqjQcruT6aDLxSiNUxjHikRPkJHg=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vDM5p-0007Qs-HM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Oct 2025 12:12:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1B68E44935;
 Mon, 27 Oct 2025 12:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A34C4CEF1;
 Mon, 27 Oct 2025 12:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761567167;
 bh=yxef0NHM2utsOMEg/gVqcZ+hf2V0uBp9qRNolXJ3x/0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=XDDV/f6noadEpzW+gSKkl93XGLApBf9BgaCFvb6fd70xPGsXjhLK0Sfr0WxNgdYIh
 wnAplGkIVTm/DcHNIC9xY2BNjc2Oq70m1HlEd65yGUHytNOtF7SyT72u21LO0n+vTh
 GwH/p5NDlcOF0a1V+FDoKCeiobTaOB/Er3gDM+kXQresqWyY6gbiY+jwoxx+JEXvdi
 QsWI9q8A8Y43GM1JTFLPGa5jGJRYHVNIzVUPD/2rKtH/jfbuYZBLvezuhIhDYXLsfc
 xrXUu7wNoHU6HHd83EU4dQ0O12lezvFmM9zV09fOoxw3VywRP2trGIVtUJySFFnm1h
 jeoKyjZOuH+NA==
Message-ID: <a6dc6438-7aaa-4c21-8df7-ecd618b826ea@kernel.org>
Date: Mon, 27 Oct 2025 20:12:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Deepanshu Kartikey <kartikey406@gmail.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20251022233349.102728-1-kartikey406@gmail.com>
Content-Language: en-US
In-Reply-To: <20251022233349.102728-1-kartikey406@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/23/25 07:33, Deepanshu Kartikey wrote: > F2FS can mount
 filesystems with corrupted directory depth values that > get runtime-clamped
 to MAX_DIR_HASH_DEPTH. When RENAME_WHITEOUT > operations are [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vDM5p-0007Qs-HM
Subject: Re: [f2fs-dev] [PATCH] f2fs: invalidate dentry cache on failed
 whiteout creation
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
Cc: syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjMvMjUgMDc6MzMsIERlZXBhbnNodSBLYXJ0aWtleSB3cm90ZToKPiBGMkZTIGNhbiBt
b3VudCBmaWxlc3lzdGVtcyB3aXRoIGNvcnJ1cHRlZCBkaXJlY3RvcnkgZGVwdGggdmFsdWVzIHRo
YXQKPiBnZXQgcnVudGltZS1jbGFtcGVkIHRvIE1BWF9ESVJfSEFTSF9ERVBUSC4gV2hlbiBSRU5B
TUVfV0hJVEVPVVQKPiBvcGVyYXRpb25zIGFyZSBwZXJmb3JtZWQgb24gc3VjaCBkaXJlY3Rvcmll
cywgZjJmc19yZW5hbWUgcGVyZm9ybXMKPiBkaXJlY3RvcnkgbW9kaWZpY2F0aW9ucyAodXBkYXRp
bmcgdGFyZ2V0IGVudHJ5IGFuZCBkZWxldGluZyBzb3VyY2UKPiBlbnRyeSkgYmVmb3JlIGF0dGVt
cHRpbmcgdG8gYWRkIHRoZSB3aGl0ZW91dCBlbnRyeSB2aWEgZjJmc19hZGRfbGluay4KPiAKPiBJ
ZiBmMmZzX2FkZF9saW5rIGZhaWxzIGR1ZSB0byB0aGUgY29ycnVwdGVkIGRpcmVjdG9yeSBzdHJ1
Y3R1cmUsIHRoZQo+IGZ1bmN0aW9uIHJldHVybnMgYW4gZXJyb3IgdG8gVkZTLCBidXQgdGhlIHBh
cnRpYWwgZGlyZWN0b3J5Cj4gbW9kaWZpY2F0aW9ucyBoYXZlIGFscmVhZHkgYmVlbiBjb21taXR0
ZWQgdG8gZGlzay4gVkZTIGFzc3VtZXMgdGhlCj4gZW50aXJlIHJlbmFtZSBvcGVyYXRpb24gZmFp
bGVkIGFuZCBkb2VzIG5vdCB1cGRhdGUgdGhlIGRlbnRyeSBjYWNoZSwKPiBsZWF2aW5nIHN0YWxl
IG1hcHBpbmdzLgoKTmljZSBjYXRjaCEKCk1vcmUgZGV0YWlsIGlzIGluIGVycm9yIHBhdGgsIHZm
cyB3b24ndCBjYWxsIGRfZXhjaGFuZ2UgdG8gZXhjaGFuZ2Ugb2xkX2RlbnRyeQphbmQgbmV3X2Rl
bnRyeSwgcmVzdWx0IGluIG5ld19kZW50cnkgc3RpbGwgbGluayB0byBuZXdfaW5vZGUgd2hpY2gg
aGFzIHplcm9lZApubGluaywgb25jZSB3ZSB0cnkgdG8gcmVtb3ZlIHRoaXMgbmV3X2lub2RlLCBp
dCB3aWxsIHRyaWdnZXIgdGhlIGJ1Zy4KCkNhbiB5b3UgcGxlYXNlIGFkZCBhYm92ZSBpbmZvIGlu
dG8geW91ciBkZXNjcmlwdGlvbj8KCj4gCj4gVGhpcyBjYXVzZXMgc3Vic2VxdWVudCBvcGVyYXRp
b25zIHRvIHVzZSBjYWNoZWQgZGVudHJ5IGluZm9ybWF0aW9uIHRoYXQKPiBubyBsb25nZXIgbWF0
Y2hlcyB0aGUgb24tZGlzayBzdGF0ZS4gV2hlbiBhIHNlY29uZCByZW5hbWUgdGFyZ2V0cyB0aGUK
PiBzYW1lIGVudHJ5LCBWRlMgYXR0ZW1wdHMgdG8gZGVjcmVtZW50IGlfbmxpbmsgb24gdGhlIHN0
YWxlIGlub2RlLCB3aGljaAo+IG1heSBhbHJlYWR5IGhhdmUgaV9ubGluaz0wLCB0cmlnZ2VyaW5n
IGEgV0FSTklORyBpbiBkcm9wX25saW5rKCkuCj4gCj4gRXhhbXBsZSBzZXF1ZW5jZToKPiAxLiBG
aXJzdCByZW5hbWUgKFJFTkFNRV9XSElURU9VVCk6IGZpbGUyIOKGkiBmaWxlMQo+ICAgIC0gZjJm
cyB1cGRhdGVzIGZpbGUxIGVudHJ5IG9uIGRpc2sgKHBvaW50cyB0byBpbm9kZSA4KQo+ICAgIC0g
ZjJmcyBkZWxldGVzIGZpbGUyIGVudHJ5IG9uIGRpc2sKPiAgICAtIGYyZnNfYWRkX2xpbmsod2hp
dGVvdXQpIGZhaWxzIChjb3JydXB0ZWQgZGlyZWN0b3J5KQo+ICAgIC0gUmV0dXJucyBlcnJvciB0
byBWRlMKPiAgICAtIFZGUyBjYWNoZSBzdGlsbCBoYXM6IGZpbGUxIOKGkiBpbm9kZSA3IChzdGFs
ZSEpCj4gCj4gMi4gU2Vjb25kIHJlbmFtZTogZmlsZTMg4oaSIGZpbGUxCj4gICAgLSBWRlMgdXNl
cyBzdGFsZSBjYWNoZTogZmlsZTEg4oaSIGlub2RlIDcKPiAgICAtIFRyaWVzIHRvIGRyb3Bfbmxp
bmsgb24gaW5vZGUgNyAoaV9ubGluayBhbHJlYWR5IDApCj4gICAgLSBXQVJOSU5HIGluIGRyb3Bf
bmxpbmsoKQo+IAo+IEZpeCB0aGlzIGJ5IGV4cGxpY2l0bHkgaW52YWxpZGF0aW5nIG9sZF9kZW50
cnkgYW5kIG5ld19kZW50cnkgd2hlbgo+IGYyZnNfYWRkX2xpbmsgZmFpbHMgZHVyaW5nIHdoaXRl
b3V0IGNyZWF0aW9uLiBUaGlzIGZvcmNlcyBWRlMgdG8KPiByZWZyZXNoIGZyb20gZGlzayBvbiBz
dWJzZXF1ZW50IG9wZXJhdGlvbnMsIGVuc3VyaW5nIGNhY2hlIGNvbnNpc3RlbmN5Cj4gZXZlbiB3
aGVuIHRoZSByZW5hbWUgcGFydGlhbGx5IHN1Y2NlZWRzLgo+IAo+IFJlcHJvZHVjZXI6Cj4gMS4g
TW91bnQgRjJGUyBpbWFnZSB3aXRoIGNvcnJ1cHRlZCBpX2N1cnJlbnRfZGVwdGgKPiAyLiByZW5h
bWVhdDIoZmlsZTIsIGZpbGUxLCBSRU5BTUVfV0hJVEVPVVQpCj4gMy4gcmVuYW1lYXQyKGZpbGUz
LCBmaWxlMSwgMCkKPiA0LiBTeXN0ZW0gdHJpZ2dlcnMgV0FSTklORyBpbiBkcm9wX25saW5rKCkK
PiAKCkNhbiB5b3UgcGxlYXNlIGFkZCBGaXhlcyBmbGFnIGFuZCBDYyBzdGFibGVAa2VybmVsLm9y
Zz8KCk90aGVyd2lzZSBpdCBsb29rcyBnb29kIHRvIG1lLgoKVGhhbmtzLAoKPiBSZXBvcnRlZC1i
eTogc3l6Ym90KzYzMmNmMzIyNzZhOWE1NjQxODhkQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20K
PiBUZXN0ZWQtYnk6IHN5emJvdCs2MzJjZjMyMjc2YTlhNTY0MTg4ZEBzeXprYWxsZXIuYXBwc3Bv
dG1haWwuY29tCj4gQ2xvc2VzOiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS9idWc/ZXh0
aWQ9NjMyY2YzMjI3NmE5YTU2NDE4OGQKPiBTaWduZWQtb2ZmLWJ5OiBEZWVwYW5zaHUgS2FydGlr
ZXkgPGthcnRpa2V5NDA2QGdtYWlsLmNvbT4KPiAtLS0KPiAgZnMvZjJmcy9uYW1laS5jIHwgNiAr
KysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9uYW1laS5jIGIvZnMvZjJmcy9uYW1laS5jCj4gaW5k
ZXggYjg4Mjc3MWU0Njk5Li43MTI0NzliN2I5M2QgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9uYW1l
aS5jCj4gKysrIGIvZnMvZjJmcy9uYW1laS5jCj4gQEAgLTEwNTMsOSArMTA1MywxMSBAQCBzdGF0
aWMgaW50IGYyZnNfcmVuYW1lKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3QgaW5vZGUg
Km9sZF9kaXIsCj4gIAlpZiAod2hpdGVvdXQpIHsKPiAgCQlzZXRfaW5vZGVfZmxhZyh3aGl0ZW91
dCwgRklfSU5DX0xJTkspOwo+ICAJCWVyciA9IGYyZnNfYWRkX2xpbmsob2xkX2RlbnRyeSwgd2hp
dGVvdXQpOwo+IC0JCWlmIChlcnIpCj4gKwkJaWYgKGVycikgewo+ICsJCQlkX2ludmFsaWRhdGUo
b2xkX2RlbnRyeSk7Cj4gKwkJCWRfaW52YWxpZGF0ZShuZXdfZGVudHJ5KTsKPiAgCQkJZ290byBw
dXRfb3V0X2RpcjsKPiAtCj4gKwkJfQo+ICAJCXNwaW5fbG9jaygmd2hpdGVvdXQtPmlfbG9jayk7
Cj4gIAkJd2hpdGVvdXQtPmlfc3RhdGUgJj0gfklfTElOS0FCTEU7Cj4gIAkJc3Bpbl91bmxvY2so
JndoaXRlb3V0LT5pX2xvY2spOwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
