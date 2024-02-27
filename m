Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 893888685A2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Feb 2024 02:14:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rem2b-00063x-O3;
	Tue, 27 Feb 2024 01:13:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rem2a-00063l-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 01:13:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FsrXJj33nBsxDisz56uF8YdXqMtH0gjbQixjASNz2Xc=; b=XcBF+/BM8zZMZV6RnuBr1GaOMG
 yrL4CXmWQDHpU39oiFLfvhAvMODv9d6GrE3IQ3KI2abNFsry6XRB4oCdG2RkRbjfp71+OoR62KoT8
 0ivJ6ymhhChGRVS/0c4F5322jDKIB189eraoC7sKfTL3Qgl3WIDsZQ42ByiAQT2xytNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FsrXJj33nBsxDisz56uF8YdXqMtH0gjbQixjASNz2Xc=; b=ObgB/3lJUYW6OjCug21IPnNC5i
 rZNfD9q1qfSqFKAUCcd6PafoZsO8dx/pHut7v/s5wA+2RsHqsNdNmuoBikLxdjKJxuZ9N4qgP/9MP
 8sHcUpDGOlzuf17ohItES7VCM4uenL3HHXpqtJ17XXpRTbLbkQdFO2LtGRhF/5CBQFKs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rem2a-0000ag-Jd for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Feb 2024 01:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3446561281;
 Tue, 27 Feb 2024 01:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E9CC433F1;
 Tue, 27 Feb 2024 01:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708996421;
 bh=5PDnWAX4phBCOwS98U0hZVMe7Y5bjQHTEVxEgZmGQLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QzaEeX4U6DGk4Oc2KOe2Mh3QpYN9uWdFBH8WFYrpqPb5zgM0igI+2dq/QOlIdkWDB
 ncNdyn4+9FrMkJc9RPrROepm83uKiY8OTcWgpfg1Mf1SqwhRrOMj28RJRaZsDv2WMi
 VpnIseD6XXb5arpLY27XkrpXokarc9PbIu6jNkQ64tA2P32Q8ZbIYm7YJzXeqqmx8Z
 nYM7SZacYwhNQI7Pp5WObE7TpFXYDYHipWdAJvlQ/vM8u7yuMhc1xKceooJfeDRRyz
 wJWqZ9TvUxLVyJfBbRyAyOjJCUvp/xv4oMIWj4yyjjipVOQJOGYMTTsqSeUJC6k726
 PAb1oz+UAQwiA==
Date: Mon, 26 Feb 2024 17:13:40 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Zhiguo Niu <niuzhiguo84@gmail.com>
Message-ID: <Zd03RHMKBqv1f6GF@google.com>
References: <1707271264-5551-1-git-send-email-zhiguo.niu@unisoc.com>
 <88459a22-a21c-4c3d-8371-31d7d713b536@kernel.org>
 <CAHJ8P3KYY27M3v=9Lu-yD2ufxU1fdG-bg=G92AbpnLUx0zLz3g@mail.gmail.com>
 <f36ef5d0-8922-449e-b19c-de009c89e712@kernel.org>
 <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHJ8P3KS2YAXm=GND8DknZqvGqTvm38Nv_9z1nEq4cTJjir-sA@mail.gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 02/26, Zhiguo Niu wrote: > Dear Chao, > > On Fri, Feb 23,
    2024 at 10:38 AM Chao Yu <chao@kernel.org> wrote: > > > > On 2024/2/23
   10:01, Zhiguo Niu wrote: > > > > > > > > > On Thu, Feb 22, 2024 at [...] 
 
 Content analysis details:   (-5.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rem2a-0000ag-Jd
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

T24gMDIvMjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gRGVhciBDaGFvLAo+IAo+IE9uIEZyaSwgRmVi
IDIzLCAyMDI0IGF0IDEwOjM44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToK
PiA+Cj4gPiBPbiAyMDI0LzIvMjMgMTA6MDEsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiA+Cj4gPiA+
Cj4gPiA+IE9uIFRodSwgRmViIDIyLCAyMDI0IGF0IDg6MzDigK9QTSBDaGFvIFl1IDxjaGFvQGtl
cm5lbC5vcmcgPG1haWx0bzpjaGFvQGtlcm5lbC5vcmc+PiB3cm90ZToKPiA+ID4KPiA+ID4gICAg
IE9uIDIwMjQvMi83IDEwOjAxLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gPiAgICAgID4gQSBwYW5p
YyBpc3N1ZSBoYXBwZW5lZCBpbiBhIHJlYm9vdCB0ZXN0IGluIHNtYWxsIGNhcGFjaXR5IGRldmlj
ZQo+ID4gPiAgICAgID4gYXMgZm9sbG93aW5nOgo+ID4gPiAgICAgID4gMS5UaGUgZGV2aWNlIHNp
emUgaXMgNjRNQiwgYW5kIG1haW4gYXJlYSBoYXMgMjQgc2VnbWVudHMsIGFuZAo+ID4gPiAgICAg
ID4gQ09ORklHX0YyRlNfQ0hFQ0tfRlMgaXMgbm90IGVuYWJsZWQuCj4gPiA+ICAgICAgPiAyLlRo
ZXJlIGlzIG5vIGFueSBmcmVlIHNlZ21lbnRzIGxlZnQgc2hvd24gaW4gZnJlZV9zZWdtYXBfaW5m
bywKPiA+ID4gICAgICA+IHRoZW4gYW5vdGhlciB3cml0ZSByZXF1ZXN0IGNhdXNlIGdldF9uZXdf
c2VnbWVudCBnZXQgYSBvdXQtb2YtYm91bmQKPiA+ID4gICAgICA+IHNlZ21lbnQgd2l0aCBzZWdu
byAyNC4KPiA+ID4gICAgICA+IDMucGFuaWMgaGFwcGVuIGluIHVwZGF0ZV9zaXRfZW50cnkgYmVj
YXVzZSBhY2Nlc3MgaW52YWxpZCBiaXRtYXAKPiA+ID4gICAgICA+IHBvaW50ZXIuCj4gPiA+Cj4g
PiA+ICAgICBaaGlndW8sCj4gPiA+Cj4gPiA+ICAgICBDYW4geW91IHBsZWFzZSB0cnkgYmVsb3cg
cGF0Y2ggdG8gc2VlIHdoZXRoZXIgaXQgY2FuIGZpeCB5b3VyIHByb2JsZW0/Cj4gPiA+Cj4gPiA+
ICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzIwMjQwMjIyMTIx
ODUxLjg4MzE0MS0zLWNoYW9Aa2VybmVsLm9yZyA8aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtZjJmcy1kZXZlbC8yMDI0MDIyMjEyMTg1MS44ODMxNDEtMy1jaGFvQGtlcm5lbC5vcmc+Cj4g
PiA+Cj4gPiA+ICAgICBUaGFua3MsCj4gPiA+Cj4gPiA+Cj4gPiA+IERlYXIgQ2hhbywKPiA+ID4g
SSBuZWVkIHRvIGNvb3JkaW5hdGUgdGhlIHRlc3RpbmcgcmVzb3VyY2VzLiBUaGUgcHJldmlvdXMg
dGVzdGluZyBoYXMgYmVlbiBzdG9wcGVkIGJlY2F1c2UgaXQgd2FzIGZpeGVkIHdpdGggdGhlIGN1
cnJlbnQgcGF0Y2guIEluIGFkZGl0aW9uLCB0aGlzIHJlcXVpcmVzIHN0YWJpbGl0eSB0ZXN0aW5n
IHRvIHJlcHJvZHVjZSwgc28gaXQgd2lsbCB0YWtlIGEgY2VydGFpbiBhbW91bnQgb2YgdGltZS4g
SWYgdGhlcmUgaXMgYW55IHNpdHVhdGlvbiwgSSB3aWxsIHRlbGwgeW91IGluIHRpbWUuCj4gPgo+
ID4gWmhpZ3VvLCB0aGFuayB5b3UhCj4gCj4gV2UgdGVzdGVkIHRoaXMgcGF0Y2ggIHRoaXMgd2Vl
a2VuZCBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiB3aXRoCj4gcHJvYmxlbSwgYW5kIGl0IGNhbiBu
b3QgcmVwcm9kdWNlIHBhbmljIGlzc3VlcywKPiBzbyB0aGlzIHBhdGNoIHNob3VsZCBmaXggdGhl
IG9yaWdpbmFsIGlzc3VlLgo+IHRoYW5rc++8gQoKSGV5LCBkbyB5b3UgZ3V5cyBwbGVhc2UgcG9p
bnQgb3V0IHdoaWNoIHBhdGNoZXMgd2VyZSB0ZXN0ZWQgd2l0aG91dCB3aGF0PwpJT1dzLCB3aGlj
aCBwYXRjaGVzIHNob3VsZCBJIHJlbW92ZSBhbmQga2VlcCBDaGFvJ3MgcGF0Y2g/Cgo+IAo+ID4K
PiA+IEJUVywgSSd2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCBmb3IgYSB3aGlsZSwgYW5kIGl0IGxvb2tz
IHRoZXJlIGlzIG5vIGlzc3VlIHcvCj4gPiBGQVVMVF9OT19TRUdNRU5UIGZhdWx0IGluamVjdGlv
biBpcyBvbi4KPiA+Cj4gPiA+IGJ0dywgV2h5IGNhbuKAmXQgSSBzZWUgdGhpcyBwYXRjaCBvbiB5
b3VyIGJyYW5jaF5ePwo+ID4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9jaGFvL2xpbnV4LmdpdC9sb2cvP2g9ZGV2LXRlc3QgPGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NoYW8vbGludXguZ2l0L2xvZy8/aD1k
ZXYtdGVzdD4KPiA+Cj4gPiBUb28gbGF6eSB0byBwdXNoIHBhdGNoZXMgaW4gdGltZSwgd2lsbCBk
byBpdCBpbiB0aGlzIHdlZWtlbmQuIDpQCj4gPgo+ID4gPiB0aGFua3PvvIEKPiA+ID4KPiA+ID4K
PiA+ID4gICAgICA+Cj4gPiA+ICAgICAgPiBNb3JlIGRldGFpbCBzaG93biBpbiBmb2xsb3dpbmcg
cGF0Y2ggc2V0cy4KPiA+ID4gICAgICA+IFRoZSB0aHJlZSBwYXRjaGVzIGFyZSBzcGxpdGVkIGhl
cmUgYmVjYXVzZSB0aGUgbW9kaWZpY2F0aW9ucyBhcmUKPiA+ID4gICAgICA+IHJlbGF0aXZlbHkg
aW5kZXBlbmRlbnQgYW5kIG1vcmUgcmVhZGFibGUuCj4gPiA+ICAgICAgPgo+ID4gPiAgICAgID4g
LS0tCj4gPiA+ICAgICAgPiBDaGFuZ2VzIG9mIHYyOiBzdG9wIGNoZWNrcG9pbnQgd2hlbiBnZXQg
YSBvdXQtb2YtYm91bmQgc2VnbWVudAo+ID4gPiAgICAgID4gLS0tCj4gPiA+ICAgICAgPgo+ID4g
PiAgICAgID4gWmhpZ3VvIE5pdSAoNCk6Cj4gPiA+ICAgICAgPiAgICBmMmZzOiBjb3JyZWN0IGNv
dW50aW5nIG1ldGhvZHMgb2YgZnJlZV9zZWdtZW50cyBpbiBfX3NldF9pbnVzZQo+ID4gPiAgICAg
ID4gICAgZjJmczogZml4IHBhbmljIGlzc3VlIGluIHVwZGF0ZV9zaXRfZW50cnkKPiA+ID4gICAg
ICA+ICAgIGYyZnM6IGVuaGFuY2UganVkZ21lbnQgY29uZGl0aW9ucyBvZiBHRVRfU0VHTk8KPiA+
ID4gICAgICA+ICAgIGYyZnM6IHN0b3AgY2hlY2twb2ludCB3aGVuIGdldCBhIG91dC1vZi1ib3Vu
ZHMgc2VnbWVudAo+ID4gPiAgICAgID4KPiA+ID4gICAgICA+ICAgZnMvZjJmcy9maWxlLmMgICAg
ICAgICAgfCAgNyArKysrKystCj4gPiA+ICAgICAgPiAgIGZzL2YyZnMvc2VnbWVudC5jICAgICAg
IHwgMjEgKysrKysrKysrKysrKysrKy0tLS0tCj4gPiA+ICAgICAgPiAgIGZzL2YyZnMvc2VnbWVu
dC5oICAgICAgIHwgIDcgKysrKy0tLQo+ID4gPiAgICAgID4gICBpbmNsdWRlL2xpbnV4L2YyZnNf
ZnMuaCB8ICAxICsKPiA+ID4gICAgICA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+ID4gPiAgICAgID4KPiA+ID4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
