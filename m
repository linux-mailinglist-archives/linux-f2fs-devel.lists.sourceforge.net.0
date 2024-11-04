Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F35E9BAB85
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Nov 2024 04:40:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t7nxH-0005X0-1I;
	Mon, 04 Nov 2024 03:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1t7nxD-0005WW-JN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Iro9UJFSt0xic2wq1aJslviZ8AGqdSVUKyUYY5Tel4Q=; b=JU8Esx+39DGwgKgYv9hdhslEXs
 ZsKHYTRJCx0rz7YL5ec1HbUPFNAmtCOvzaoD1NURBqcFaPFPtWR/aGsp/RTXScEvI/Ytw52Bpr2ZC
 i0PN4gfcHjE+diEg1yCJX9mplGtcaPRx6OGZKS6BLBImpWgE74y/gOuD2lAO7ahtCO64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Iro9UJFSt0xic2wq1aJslviZ8AGqdSVUKyUYY5Tel4Q=; b=cs7yLvoiZdmY3VJRjRzeUdTSDA
 K4o4hELNDwRPvne79VkEnmMfq3ouixMl4hMbesMMl3HtLKrWtQU5y8/KKTTHTMBgvq+SKp16QaBtE
 h/wIVrWqU5PjOWslXOA8L+jRMdNQ9hRdj5hkhJfmcXvbNP+gC6HB524k51FB6XASul+E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t7nxC-0005vW-SJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Nov 2024 03:40:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B0DE75C3D04;
 Mon,  4 Nov 2024 03:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12D07C4CED0;
 Mon,  4 Nov 2024 03:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730691624;
 bh=ypH+68HSOJbIiIdIPZ7738g4MkZaWVv8H4tRN/NdEn0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=iaS8IHuLUv7B6/uOasNzXCcZPxpMWHI7zj71RYktoLPpVgfEY2IiI3CBd1Rw4Twxf
 /+mT1xbwAD7wp+U5mwRtV2fdreZvPAv4PHwnL3m6vn+nWCJXiVIniWHXtvttqYDEUn
 RdWUSzzKUgIGLECh478SiShVPyAByxMMKxEjAjB/lz6LY6tcUzW7J9k1N98/SU7nnU
 EiFdSDMER0ceeakFjCyWuD2Px9aQatUclZ5ExcBIKjA2bsmnET72Nvq74htRFFCxC5
 GaK/CvfFFkCdrhdpTJeTDrT5muClAht4r/DC6qfoEuSHMCYkPUi4IWdK8ij2ntLHUh
 XgJe6JcWnVIZw==
Message-ID: <7f5af1ac-ff50-4e9d-b4a8-94d7a6a2f378@kernel.org>
Date: Mon, 4 Nov 2024 11:40:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jinsu1.lee@samsung.com, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
References: <CGME20241104022816epcms2p2213e9a1b0003cfeb30521927252b6bbe@epcms2p2>
 <20241104022816epcms2p2213e9a1b0003cfeb30521927252b6bbe@epcms2p2>
Content-Language: en-US
In-Reply-To: <20241104022816epcms2p2213e9a1b0003cfeb30521927252b6bbe@epcms2p2>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/11/4 10:28, Jinsu Lee wrote: >> Jinsu Lee reported
 a performance regression issue, after commit > >> 5c8764f8679e ("f2fs: fix
 to force buffered IO on inline_data > >> inode"), we forced direct [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1t7nxC-0005vW-SJ
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid forcing direct write to
 use buffered IO on inline_data inode
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
Cc: "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC8xMS80IDEwOjI4LCBKaW5zdSBMZWUgd3JvdGU6Cj4+IEppbnN1IExlZSByZXBvcnRl
ZCBhIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24gaXNzdWUsIGFmdGVyIGNvbW1pdAo+IAo+PiA1Yzg3
NjRmODY3OWUgKCJmMmZzOiBmaXggdG8gZm9yY2UgYnVmZmVyZWQgSU8gb24gaW5saW5lX2RhdGEK
PiAKPj4gaW5vZGUiKSwgd2UgZm9yY2VkIGRpcmVjdCB3cml0ZSB0byB1c2UgYnVmZmVyZWQgSU8g
b24gaW5saW5lX2RhdGEKPiAKPj4gaW5vZGUsIGl0IHdpbGwgY2F1c2UgcGVyZm9ybWFjZSByZWdy
ZXNzaW9uIGR1ZSB0byBtZW1vcnkgY29weQo+IAo+PiBhbmQgZGF0YSBmbHVzaC4KPiAKPiAKPj4g
SXQncyBmaW5lIHRvIG5vdCBmb3JjZSBkaXJlY3Qgd3JpdGUgdG8gdXNlIGJ1ZmZlcmVkIElPLCBh
cyBpdAo+IAo+PiBjYW4gY29udmVydCBpbmxpbmUgaW5vZGUgYmVmb3JlIGNvbW1pdHRpbmcgZGly
ZWN0IHdyaXRlIElPLgo+IAo+IAo+PiBGaXhlczogNWM4NzY0Zjg2NzllICgiZjJmczogZml4IHRv
IGZvcmNlIGJ1ZmZlcmVkIElPIG9uIGlubGluZV9kYXRhIGlub2RlIikKPiAKPj4gUmVwb3J0ZWQt
Ynk6IEppbnN1IExlZSA8amluc3UxLmxlZUBzYW1zdW5nLmNvbT4KPiAKPj4gQ2xvc2VzOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsL2FmMDNkZDJjLWUzNjEtNGY4MC1i
MmZkLTM5NDQwNzY2Y2Y2ZUBrZXJuZWwub3JnCj4gCj4+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUg
PGNoYW9Aa2VybmVsLm9yZz4KPiAKPj4gLS0tCj4gCj4+IGZzL2YyZnMvZmlsZS5jIHwgNiArKysr
Ky0KPiAKPj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
IAo+IAo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+IAo+
PiBpbmRleCAwZTdhMDE5NWVjYTguLjM3N2ExMGI4MWJmMyAxMDA2NDQKPiAKPj4gLS0tIGEvZnMv
ZjJmcy9maWxlLmMKPiAKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiAKPj4gQEAgLTg4Myw3ICs4
ODMsMTEgQEAgc3RhdGljIGJvb2wgZjJmc19mb3JjZV9idWZmZXJlZF9pbyhzdHJ1Y3QgaW5vZGUg
Kmlub2RlLCBpbnQgcncpCj4gCj4+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIHRy
dWU7Cj4gCj4+wqAgwqAgwqAgwqAgwqAgaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkK
PiAKPj7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gdHJ1ZTsKPiAKPj4gLSDCoCDC
oCDCoCDCoGlmIChmMmZzX2hhc19pbmxpbmVfZGF0YShpbm9kZSkpCj4gCj4+ICsgwqAgwqAgwqAg
wqAvKgo+IAo+PiArIMKgIMKgIMKgIMKgICogb25seSBmb3JjZSBkaXJlY3QgcmVhZCB0byB1c2Ug
YnVmZmVyZWQgSU8sIGZvciBkaXJlY3Qgd3JpdGUsCj4gCj4+ICsgwqAgwqAgwqAgwqAgKiBpdCBl
eHBlY3RzIGlubGluZSBkYXRhIGNvbnZlcnNpb24gYmVmb3JlIGNvbW1pdHRpbmcgSU8uCj4gCj4+
ICsgwqAgwqAgwqAgwqAgKi8KPiAKPj4gKyDCoCDCoCDCoCDCoGlmIChmMmZzX2hhc19pbmxpbmVf
ZGF0YShpbm9kZSkgJiYgcncgPT0gUkVBRCkKPiAKPiAKPiBDaGFvIFl1LAo+IAo+IFRoZSBmaW8g
ZGlyZWN0IHBlcmZvcm1hbmNlIHByb2JsZW0gSSByZXBvcnRlZCBkaWQgbm90IGltcHJvdmUgd2hl
biByZWZsZWN0aW5nIHRoaXMgY29tbWl0Lgo+IAo+IFJhdGhlciwgaXQgaGFzIGJlZW4gaW1wcm92
ZWQgd2hlbiByZWZsZWN0aW5nIHlvdXIgY29tbWl0IGJlbG93Lgo+IAo+IAo+IFRoZSBwcmV2aW91
cyBjb21taXQgc2VlbXMgdG8gYmUgbWlzdGl0bGVkIGFzIHJlYWQgYW5kIHRoZSBmb2xsb3dpbmcg
Y29tbWl0IGFwcGVhcnMgdG8gYmUgdGhlIGZpbmFsIHZlcnNpb24uCj4gCj4gVGhlIHJlYXNvbiBm
b3IgdGhlIGltcHJvdmVtZW50IHdpdGggdGhlIGNvbW1pdCBiZWxvdyBpcyB0aGF0IHRoZXJlIGlz
IG5vICJtX21heV9jcmVhdGUiIGNvbmRpdGlvbgo+IAo+IHdoZW4gcGVyZm9ybWluZyAiaW9fc3Vi
bWl0IiBkaXJlY3RseSwgc28gcGVyZm9ybWFuY2UgcmVncmVzc2lvbiBpc3N1ZSBtYXkgb2NjdXIu
Cj4gCj4gCj4gSSB3b25kZXIgaWYgInJ3ID09IFJFQUQiIHNob3VsZCBiZSBhZGRpdGlvbmFsbHkg
cmVmbGVjdGVkLgoKQWxyaWdodCwgdGhhbmtzIGZvciB5b3VyIGZlZWRiYWNrLgoKSSB0aG91Z2h0
IHlvdSBoYXZlIGJpc2VjdGVkIHRoaXMgcGVyZm9ybWFuY2UgaXNzdWUgdG8gY29tbWl0CjVjODc2
NGY4Njc5ZSAoImYyZnM6IGZpeCB0byBmb3JjZSBidWZmZXJlZCBJTyBvbiBpbmxpbmVfZGF0YSBp
bm9kZSIpLApzbyBJIHNlbnQgdGhpcyBwYXRjaCBmb3IgY29tbWVudHMuCgpDYW4geW91IHBsZWFz
ZSBhcHBseSBib3RoIGJlbG93IGRpbyBmaXhlcywgYW5kIGhlbHAgdG8gY2hlY2sgZmluYWwKcGVy
Zm9ybWFuY2U/CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQx
MTA0MDE1MDE2LjIyODk2My0xLWNoYW9Aa2VybmVsLm9yZwpodHRwczovL2xvcmUua2VybmVsLm9y
Zy9saW51eC1mMmZzLWRldmVsLzIwMjQxMTA0MDEzNTUxLjIxODAzNy0xLWNoYW9Aa2VybmVsLm9y
ZwoKVGhhbmtzLAoKPiAKPiAKPiBjb21taXQgMmI2YmIwY2QzYmRjYjExMDgxODkzMDFlYzRlYzc2
Yzg5ZjkzOTMxMAo+IAo+IEF1dGhvcjogQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gCj4gRGF0ZTrCoCDCoE1vbiBO
b3YgNCAwOTozNTo1MSAyMDI0ICswODAwCj4gCj4gCj4gIMKgIMKgIFtmMmZzLWRldl0gW1BBVENI
IHYyXSBmMmZzOiBmaXggdG8gbWFwIGJsb2NrcyBjb3JyZWN0bHkgZm9yIGRpcmVjdCB3cml0ZQo+
IAo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
