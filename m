Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB60869D56
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 18:18:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rf164-0001d6-63;
	Tue, 27 Feb 2024 17:18:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rf161-0001cp-HT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:18:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T+xKtShsyg4hPn0Lea1X2RNZYuCICSi192ab601oMtU=; b=I/2Rb29y0Lo1DHqzIqYCMnABB5
 NDq/fmDP7vaSLjjMCIA+tbhXjykY5Yn3N7yUB9EuA48vpfdm3jROqFRJ43MA24Z8v7p7vf80lqV05
 6rKE4V37QxP0vEQVjfRSto7cJbhMb8KpsY7XLIt+Eu9zEeDBCc5Y5Qrht/Qc9Fi0f4us=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T+xKtShsyg4hPn0Lea1X2RNZYuCICSi192ab601oMtU=; b=aQd+OYzSJZJqoFhi6DJlmby4k6
 tPkz70zNV131twWeU9oZ3K+R0HgTGceNKdsjWYv3+/ZTl0Hfs/ELSPt96RPMIeTbRCMaKxrxxeTp6
 LFzZy7bhVYuxNN5yAmvN2nt3CCa1r/QRimFeUikMHpokGyAB3dikJgDlOt1Ux9CvOQpU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rf15x-0005jf-2U for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 17:18:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5B58CCE1D67;
 Tue, 27 Feb 2024 17:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630F4C433F1;
 Tue, 27 Feb 2024 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709054288;
 bh=PNcverg+Hnzn6bxfuKU8MPQAP1RyaRFBgEEPtrpOxP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n47AI41lyDiASUiQ+7+Ka7jnVNx44uAlZIIiw/2vtr+Jh1NlNMdvyZu2cIZbfctPA
 03ag85vrwI2a2OZiN6aaKGwzrqsOkNPGhMm2q8kAIoyJn4/TNGMs7KwsUitolkke+v
 Y2R546VXGEQFb3I6PChiSisk0ar++TD8RlD20s93dcmWl1Qtz847EpiDqqTCSZqLgO
 iJ/Qn5K3DjZMwuuuzoVc3/IPfE2Bt5RwRkc8QMGmcC1xZppCvrW/cQFo4sHw6nNEN8
 8utuSTBYgQ+DAYIh97kCLxnJTCWJn8LidcaQHx6HTbcwjT86XtcwYHSwHbRbgxmvJn
 R1gsKer9Jz6yA==
Date: Tue, 27 Feb 2024 09:18:06 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <niuzhiguo84@gmail.com>
Message-ID: <Zd4ZTokbVPkj5gy4@google.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
 <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
 <Zd03RHMKBqv1f6GF@google.com>
 <CAHJ8P3Lj_1pa=npkAsMfeStEY3nWgf591tFndKTT_skFYLv+GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHJ8P3Lj_1pa=npkAsMfeStEY3nWgf591tFndKTT_skFYLv+GQ@mail.gmail.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 02/27, Zhiguo Niu wrote: > On Tue, Feb 27, 2024 at 9:13â€¯AM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > On 02/26, Zhiguo Niu wrote:
    > > > Dear Chao, > > > > > > On Fri, Feb 23, 2024 at 10:38â€ [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rf15x-0005jf-2U
Subject: Re: [f2fs-dev] [PATCH v2 0/4] f2fs: fix panic issue in small
 capacity device
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDIvMjcsIFpoaWd1byBOaXUgd3JvdGU6Cj4gT24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgOTox
M+KAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9u
IDAyLzI2LCBaaGlndW8gTml1IHdyb3RlOgo+ID4gPiBEZWFyIENoYW8sCj4gPiA+Cj4gPiA+IE9u
IEZyaSwgRmViIDIzLCAyMDI0IGF0IDEwOjM44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIDIwMjQvMi8yMyAxMDowMSwgWmhpZ3VvIE5pdSB3
cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBGZWIgMjIsIDIwMjQg
YXQgODozMOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZyA8bWFpbHRvOmNoYW9Aa2VybmVs
Lm9yZz4+IHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBPbiAyMDI0LzIvNyAxMDowMSwg
WmhpZ3VvIE5pdSB3cm90ZToKPiA+ID4gPiA+ICAgICAgPiBBIHBhbmljIGlzc3VlIGhhcHBlbmVk
IGluIGEgcmVib290IHRlc3QgaW4gc21hbGwgY2FwYWNpdHkgZGV2aWNlCj4gPiA+ID4gPiAgICAg
ID4gYXMgZm9sbG93aW5nOgo+ID4gPiA+ID4gICAgICA+IDEuVGhlIGRldmljZSBzaXplIGlzIDY0
TUIsIGFuZCBtYWluIGFyZWEgaGFzIDI0IHNlZ21lbnRzLCBhbmQKPiA+ID4gPiA+ICAgICAgPiBD
T05GSUdfRjJGU19DSEVDS19GUyBpcyBub3QgZW5hYmxlZC4KPiA+ID4gPiA+ICAgICAgPiAyLlRo
ZXJlIGlzIG5vIGFueSBmcmVlIHNlZ21lbnRzIGxlZnQgc2hvd24gaW4gZnJlZV9zZWdtYXBfaW5m
bywKPiA+ID4gPiA+ICAgICAgPiB0aGVuIGFub3RoZXIgd3JpdGUgcmVxdWVzdCBjYXVzZSBnZXRf
bmV3X3NlZ21lbnQgZ2V0IGEgb3V0LW9mLWJvdW5kCj4gPiA+ID4gPiAgICAgID4gc2VnbWVudCB3
aXRoIHNlZ25vIDI0Lgo+ID4gPiA+ID4gICAgICA+IDMucGFuaWMgaGFwcGVuIGluIHVwZGF0ZV9z
aXRfZW50cnkgYmVjYXVzZSBhY2Nlc3MgaW52YWxpZCBiaXRtYXAKPiA+ID4gPiA+ICAgICAgPiBw
b2ludGVyLgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICBaaGlndW8sCj4gPiA+ID4gPgo+ID4gPiA+
ID4gICAgIENhbiB5b3UgcGxlYXNlIHRyeSBiZWxvdyBwYXRjaCB0byBzZWUgd2hldGhlciBpdCBj
YW4gZml4IHlvdXIgcHJvYmxlbT8KPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGludXgtZjJmcy1kZXZlbC8yMDI0MDIyMjEyMTg1MS44ODMxNDEtMy1jaGFv
QGtlcm5lbC5vcmcgPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAy
NDAyMjIxMjE4NTEuODgzMTQxLTMtY2hhb0BrZXJuZWwub3JnPgo+ID4gPiA+ID4KPiA+ID4gPiA+
ICAgICBUaGFua3MsCj4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IERlYXIgQ2hhbywKPiA+
ID4gPiA+IEkgbmVlZCB0byBjb29yZGluYXRlIHRoZSB0ZXN0aW5nIHJlc291cmNlcy4gVGhlIHBy
ZXZpb3VzIHRlc3RpbmcgaGFzIGJlZW4gc3RvcHBlZCBiZWNhdXNlIGl0IHdhcyBmaXhlZCB3aXRo
IHRoZSBjdXJyZW50IHBhdGNoLiBJbiBhZGRpdGlvbiwgdGhpcyByZXF1aXJlcyBzdGFiaWxpdHkg
dGVzdGluZyB0byByZXByb2R1Y2UsIHNvIGl0IHdpbGwgdGFrZSBhIGNlcnRhaW4gYW1vdW50IG9m
IHRpbWUuIElmIHRoZXJlIGlzIGFueSBzaXR1YXRpb24sIEkgd2lsbCB0ZWxsIHlvdSBpbiB0aW1l
Lgo+ID4gPiA+Cj4gPiA+ID4gWmhpZ3VvLCB0aGFuayB5b3UhCj4gPiA+Cj4gPiA+IFdlIHRlc3Rl
ZCB0aGlzIHBhdGNoICB0aGlzIHdlZWtlbmQgb24gdGhlIHByZXZpb3VzIHZlcnNpb24gd2l0aAo+
ID4gPiBwcm9ibGVtLCBhbmQgaXQgY2FuIG5vdCByZXByb2R1Y2UgcGFuaWMgaXNzdWVzLAo+ID4g
PiBzbyB0aGlzIHBhdGNoIHNob3VsZCBmaXggdGhlIG9yaWdpbmFsIGlzc3VlLgo+ID4gPiB0aGFu
a3PvvIEKPiA+Cj4gRGVhciBKYWVnZXVrLAo+ID4gSGV5LCBkbyB5b3UgZ3V5cyBwbGVhc2UgcG9p
bnQgb3V0IHdoaWNoIHBhdGNoZXMgd2VyZSB0ZXN0ZWQgd2l0aG91dCB3aGF0Pwo+IFRoaXMgcHJv
YmxlbSBvY2N1cnJlZCBkdXJpbmcgb3VyIHBsYXRmb3JtIHN0YWJpbGl0eSB0ZXN0aW5nLgo+IGl0
IGNhbiBiZSBmaXhlZCBieSBteSAgdGhpcyBwYXRjaCBzZXQsIG1haW5seSBiZSBmaXhlZCBieToK
PiBmMmZzOiBmaXggcGFuaWMgaXNzdWUgaW4gdXBkYXRlX3NpdF9lbnRyeSAmIGYyZnM6IGVuaGFu
Y2UganVkZ21lbnQKPiBjb25kaXRpb25zIG9mIEdFVF9TRUdOTwo+IGFuZCBDaGFvJ3MgcGF0Y2gg
Y2FuIGFsc28gZml4IHRoaXMgcHJvYmxlbXMgdGVzdGluZyB3aXRob3V0IG15IHBhdGNoCj4gPiBJ
T1dzLCB3aGljaCBwYXRjaGVzIHNob3VsZCBJIHJlbW92ZSBhbmQga2VlcCBDaGFvJ3MgcGF0Y2g/
Cj4gSSB0aGluayBjaGFvJ3MgcGF0Y2ggaXMgbW9yZSByZWFzb25hYmxlLCBpdCBkb2VzIGVycm9y
IGhhbmRsaW5nIG1vcmUgY29tcGxldGUuCj4gYnV0IG15IHBhdGNoIGp1c3QgZG8gc29tZSBzYW5p
dHkgY2hlY2sgZm9yIHJldHVybiB2YWx1ZSBvZiBHRVRfU0VHTk8KPiBTYW1lIGFzIG90aGVyIGNv
ZGVzKHVwZGF0ZV9zZWdtZW50X210aW1lKQo+IGFuZCBpIHRoaW5rIGl0IGFsc28gbmVlZGVkIGV4
Y2VwdCB0aGlzIHBhcnQ6CgpUaGFua3MgZm9yIGNvbmZpcm1hdGlvbi4gSXQgc2VlbXMgaXQnZCBi
ZSBiZXR0ZXIgdG8gcmV2ZXJ0IHlvdXJzIGFuZCBhcHBseQpDaGFvJ3MgcGF0Y2ggZmlyc3QuIElm
IHlvdSB0aGluayB0aGVyZSdzIHNvbWV0aGluZyB0byBpbXByb3ZlIG9uIHRvcCBvZiBpdCwKY291
bGQgeW91IHBsZWFzZSBzZW5kIGFub3RoZXIgcGF0Y2ggYWZ0ZXJ3YXJkcz8KCj4gCj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmgKPiBpbmRleCAzYmYy
Y2U0NmZhMDkwNy4uYmIyMmZlZWFlMWNmY2IgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50
LmgKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuaAo+IEBAIC05Niw3ICs5Niw4IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBzYW5pdHlfY2hlY2tfc2VnX3R5cGUoc3RydWN0Cj4gZjJmc19zYl9pbmZvICpz
YmksCj4gKEdFVF9TRUdPRkZfRlJPTV9TRUcwKHNiaSwgYmxrX2FkZHIpICYgKEJMS1NfUEVSX1NF
RyhzYmkpIC0gMSkpCj4gI2RlZmluZSBHRVRfU0VHTk8oc2JpLCBibGtfYWRkcikgXAo+IC0gKCgh
X19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrX2FkZHIpKSA/IFwKPiArICgoIV9faXNfdmFsaWRf
ZGF0YV9ibGthZGRyKGJsa19hZGRyKSB8fCBcCj4gKyAhZjJmc19pc192YWxpZF9ibGthZGRyKHNi
aSwgYmxrX2FkZHIsIERBVEFfR0VORVJJQykpID8gXAo+IE5VTExfU0VHTk8gOiBHRVRfTDJSX1NF
R05PKEZSRUVfSShzYmkpLCBcCj4gR0VUX1NFR05PX0ZST01fU0VHMChzYmksIGJsa19hZGRyKSkp
Cj4gI2RlZmluZSBDQVBfQkxLU19QRVJfU0VDKHNiaSkKPiBiZWNhdXNlIENoYW8ncyBwYXRjaCBs
ZXQgbmV3X2FkZHI9bnVsbF9hZGRyIHdoZW4gIGdldF9uZXdfc2VnbWVudAo+IHJldHVybnMgTk9T
UEFDRSwKPiBzbyBJIHRoaW5rIHRoaXMgY2FuIGJlIHJldmVydGVkIGFuZCBpdCBhbHNvIHNhdmVz
IGNvZGUgcnVubmluZyB0aW1lLgo+IEhvdyBhYm91dCBDaGFvJ3Mgb3BpbmlvbnM/Cj4gdGhhbmtz
IQo+ID4KPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEJUVywgSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBm
b3IgYSB3aGlsZSwgYW5kIGl0IGxvb2tzIHRoZXJlIGlzIG5vIGlzc3VlIHcvCj4gPiA+ID4gRkFV
TFRfTk9fU0VHTUVOVCBmYXVsdCBpbmplY3Rpb24gaXMgb24uCj4gPiA+ID4KPiA+ID4gPiA+IGJ0
dywgV2h5IGNhbuKAmXQgSSBzZWUgdGhpcyBwYXRjaCBvbiB5b3VyIGJyYW5jaF5ePwo+ID4gPiA+
ID4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvY2hhby9s
aW51eC5naXQvbG9nLz9oPWRldi10ZXN0IDxodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cvP2g9ZGV2LXRlc3Q+Cj4gPiA+ID4K
PiA+ID4gPiBUb28gbGF6eSB0byBwdXNoIHBhdGNoZXMgaW4gdGltZSwgd2lsbCBkbyBpdCBpbiB0
aGlzIHdlZWtlbmQuIDpQCj4gPiA+ID4KPiA+ID4gPiA+IHRoYW5rc++8gQo+ID4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiAgICAgID4KPiA+ID4gPiA+ICAgICAgPiBNb3JlIGRldGFpbCBzaG93
biBpbiBmb2xsb3dpbmcgcGF0Y2ggc2V0cy4KPiA+ID4gPiA+ICAgICAgPiBUaGUgdGhyZWUgcGF0
Y2hlcyBhcmUgc3BsaXRlZCBoZXJlIGJlY2F1c2UgdGhlIG1vZGlmaWNhdGlvbnMgYXJlCj4gPiA+
ID4gPiAgICAgID4gcmVsYXRpdmVseSBpbmRlcGVuZGVudCBhbmQgbW9yZSByZWFkYWJsZS4KPiA+
ID4gPiA+ICAgICAgPgo+ID4gPiA+ID4gICAgICA+IC0tLQo+ID4gPiA+ID4gICAgICA+IENoYW5n
ZXMgb2YgdjI6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1vZi1ib3VuZCBzZWdtZW50
Cj4gPiA+ID4gPiAgICAgID4gLS0tCj4gPiA+ID4gPiAgICAgID4KPiA+ID4gPiA+ICAgICAgPiBa
aGlndW8gTml1ICg0KToKPiA+ID4gPiA+ICAgICAgPiAgICBmMmZzOiBjb3JyZWN0IGNvdW50aW5n
IG1ldGhvZHMgb2YgZnJlZV9zZWdtZW50cyBpbiBfX3NldF9pbnVzZQo+ID4gPiA+ID4gICAgICA+
ICAgIGYyZnM6IGZpeCBwYW5pYyBpc3N1ZSBpbiB1cGRhdGVfc2l0X2VudHJ5Cj4gPiA+ID4gPiAg
ICAgID4gICAgZjJmczogZW5oYW5jZSBqdWRnbWVudCBjb25kaXRpb25zIG9mIEdFVF9TRUdOTwo+
ID4gPiA+ID4gICAgICA+ICAgIGYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1v
Zi1ib3VuZHMgc2VnbWVudAo+ID4gPiA+ID4gICAgICA+Cj4gPiA+ID4gPiAgICAgID4gICBmcy9m
MmZzL2ZpbGUuYyAgICAgICAgICB8ICA3ICsrKysrKy0KPiA+ID4gPiA+ICAgICAgPiAgIGZzL2Yy
ZnMvc2VnbWVudC5jICAgICAgIHwgMjEgKysrKysrKysrKysrKysrKy0tLS0tCj4gPiA+ID4gPiAg
ICAgID4gICBmcy9mMmZzL3NlZ21lbnQuaCAgICAgICB8ICA3ICsrKystLS0KPiA+ID4gPiA+ICAg
ICAgPiAgIGluY2x1ZGUvbGludXgvZjJmc19mcy5oIHwgIDEgKwo+ID4gPiA+ID4gICAgICA+ICAg
NCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiA+
ID4gICAgICA+Cj4gPiA+ID4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
