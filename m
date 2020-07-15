Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA07C2209F2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 12:25:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvebY-0001Fm-Js; Wed, 15 Jul 2020 10:25:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jvebU-0001ED-9R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 10:25:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wMCGvpghoQdTtGzCBINuWhujx+3yBF8iQ87gq+2R4pY=; b=TzupxbFbFxbmTAymbSuD4/qV5n
 dqpoBoicWOM2kmla+gQgCAVvJcuYno07Hno9BsBMiHJj/kcY9Hq9K7B8FIR6QEfvSGQoFgvDeBHyf
 wBDVJFrlZJpJpKeGFz/N5N4ynmA5viKfo0cLXv4zQszoWKXgyOrM7dJKvPj9Ul/PSmAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wMCGvpghoQdTtGzCBINuWhujx+3yBF8iQ87gq+2R4pY=; b=PVMwJOQ6oTbN3OHI82O2zRN6O8
 Znxgnt+8QOpQZxT6UpcudfASvesLdGlY8BBBvXcZ3hBw7i6mLE8snmCpqAb7waa0k9kkJ36frvgvd
 XZzv6W0s2llZhk1GV43rMrdCYFBngHWmAPDWrXgj9+Wn1RZunAbPiOI3UBRXz/od05XY=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jvebS-008Zfp-Rb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 10:25:32 +0000
Received: by mail-lj1-f193.google.com with SMTP id e8so2036173ljb.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Jul 2020 03:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wMCGvpghoQdTtGzCBINuWhujx+3yBF8iQ87gq+2R4pY=;
 b=NGrrnHDIh5f5mctDSbbNKn9DdZB7QZuJWrPEv0C70mqxmOZ/6Z2bSxEMCD/NatuGZo
 s026VJpk0MgoR3CHBPN8181zAf14Z6szL06IiEty1AH7QWfUxSno/yfSp1d71kU+EeTr
 jwepNOeSOKAG1PwwGiMZXE2/8JbEeS4V51XnagKeiG+SYHD4UwPJYV5vcJAl875WxrXy
 pDV6J6qPmBiVZjH+7LBR1xGp/Kj/h+x8rC9GG3TGT54SCfD3xdXVmqpmeiJDfWcfYX9p
 098jmjBGzWIhCb8VDdjELVP3YUE8Ogg7m1cFZIweBMC01quO/3/o1X8wn7wMRshI2siW
 hsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wMCGvpghoQdTtGzCBINuWhujx+3yBF8iQ87gq+2R4pY=;
 b=RyB1DTMd8UsZheM2kiSrzMomQgp3EWTVf1WH6RnfkinN9R/97q6umPbDKBIqHvYojH
 2TLSgp/Epz3Bw3NwZpZVIIIM7EOVLtpVUY3DtDEcUH6UXH/qTe/Q2g8cWqCl1YyPH5vF
 A++C73/IUqFJ2E33nUwBiq5zAmrsEHDkruq9GXGa8sB3LQ3OhxtzgTCxAJDmkvTKntex
 GMCgCjk7wz+UfwEeYNkSk6URb/f3JLbj+dQ5RvSUKfueDLpbVP7TSwTJNzfytciuoQ77
 2yJHgqxBtd08JZ3oOSXrMOciemd3/mNaqdT068KW7BTPZRiIFNaiIkroNv1ENR9RgW2d
 dVOg==
X-Gm-Message-State: AOAM533unguEmSqPE02zncp7x1luhcD2ptPqtGqyOzyopKztaZV8mBHq
 Wpkbm+YQ7HuNdGFdG2crv35UgIVmLZGjGwqfj4M=
X-Google-Smtp-Source: ABdhPJyimMG/Ma2iimxUSJfE93i+M7JIET4HVgLTzZBykiEmZNkys+pKUNyTMPuufo6Ur5rBf+CET6aKXzkC5ECAJ74=
X-Received: by 2002:a2e:9644:: with SMTP id z4mr4528136ljh.333.1594808724090; 
 Wed, 15 Jul 2020 03:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200713031252.3873546-1-daeho43@gmail.com>
 <20200713181152.GC2910046@google.com>
 <3b02263d-a5e1-136c-40ed-514d34e4c895@huawei.com>
 <CACOAw_wBD_ourGJSdRTDM-wzeH97aGE966QDB6bpjiyXRrh47A@mail.gmail.com>
 <f4a594a1-464f-3a74-90cb-fd536bed9962@huawei.com>
 <CACOAw_w3OWDVXSYHuTEEVv1HaBZir1CWcRAmxOt00MB4vXBKVg@mail.gmail.com>
 <1d84bc01-fece-df55-6e33-07a705cfb432@huawei.com>
In-Reply-To: <1d84bc01-fece-df55-6e33-07a705cfb432@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 15 Jul 2020 19:25:13 +0900
Message-ID: <CACOAw_xaS7qB22EPsZvHoC=uPiPtqGMAK5cP4Vk20xO21GQ-Kg@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jvebS-008Zfp-Rb
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: change the way of handling
 range.len in F2FS_IOC_SEC_TRIM_FILE
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbywKCkkgY2FuJ3QgZmluZCBmc2NyeXB0X3plcm9vdXRfcmFuZ2VfaW5saW5lX2NyeXB0KCkg
ZnVuY3Rpb24uIERvIHlvdQptZWFuIHdlIG5lZWQgdG8gaW1wbGVtZW50IHRoaXMgb25lIGZvciBp
bmxpbmUgZW5jcnlwdGlvbj8KCjIwMjDrhYQgN+yblCAxNeydvCAo7IiYKSDsmKTtm4QgNDoxNywg
Q2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzcv
MTUgMTQ6NTQsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gWW91IG1lYW4gd2UgY2FuIHN1cHBvcnQg
WkVST09VVCBvcHRpb24gb25seSBmb3IgZW5jcnlwdGVkIGZpbGVzIG9mCj4gPiBub24tbXVsdGlk
ZXZpY2UgZjJmcywKPiA+IGFuZCByZXR1cm4gLUVPUE5PVFNVUFAgaW4gdGhlIG11bHRpZGV2aWNl
IGNhc2UsIHJpZ2h0IG5vdz8KPgo+IFllcywgc29tZXRoaW5nIGxpa2U6Cj4KPiBmMmZzX3NlY190
cmltX2ZpbGUoKQo+Cj4gaWYgKChyYW5nZS5mbGFncyAmIEYyRlNfVFJJTV9GSUxFX1pFUk9PVVQp
ICYmCj4gICAgICAgICBmMmZzX2VuY3J5cHRlZF9maWxlKCkgJiYgZjJmc19pc19tdWx0aV9kZXZp
Y2UoKSkKPiAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPgo+Cj4gZjJmc19zZWN1cmVfZXJh
c2UoKQo+Cj4gaWYgKCFyZXQgJiYgKGZsYWdzICYgRjJGU19UUklNX0ZJTEVfWkVST09VVCkpIHsK
PiAgICAgICAgIGlmIChmMmZzX2VuY3J5cHRlZF9maWxlKCkpIHsKPiAgICAgICAgICAgICAgICAg
aWYgKGZzY3J5cHRfaW5vZGVfdXNlc19mc19sYXllcl9jcnlwdG8pCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gZnNjcnlwdF96ZXJvb3V0X3JhbmdlKCk7Cj4gICAgICAgICAgICAgICAg
IGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBmc2NyeXB0X3plcm9vdXRfcmFu
Z2VfaW5saW5lX2NyeXB0KCk7Cj4gICAgICAgICB9IGVsc2Ugewo+ICAgICAgICAgICAgICAgICBy
ZXQgPSBibGtkZXZfaXNzdWVfemVyb291dCgpOwo+ICAgICAgICAgfQo+IH0KPgo+IFRoYW5rcywK
Pgo+ID4KPiA+IDIwMjDrhYQgN+yblCAxNeydvCAo7IiYKSDsmKTtm4QgMzoxNywgQ2hhbyBZdSA8
eXVjaGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4gPj4KPiA+PiBPbiAyMDIwLzcvMTUg
MTI6MDYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4+PiBXZSBjb3VsZCB1c2UgZnNjcnlwdF96ZXJv
b3V0X3JhbmdlKCkgZm9yIGFuIGVuY3J5cHRlZCBmaWxlLgo+ID4+PiBCdXQsIG9uZSBwcm9ibGVt
IGlzIGZzY3J5cHRfemVyb291dF9yYW5nZSgpIGFzc3VtZXMgdGhhdCBmaWxlc3lzdGVtcwo+ID4+
PiBvbmx5IHVzZSBhIHNpbmdsZSBibG9jayBkZXZpY2UuCj4gPj4+IEl0IG1lYW5zIGl0IGRvZXNu
J3QgcmVjZWl2ZSBiZGV2IGFzIGEgcGFyYW1ldGVyLgo+ID4+PiBIb3cgYWJvdXQgY2hhbmdpbmcg
dGhlIGludGVyZmFjZSBvZiBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBmaXJzdCBhbmQgdXNpbmcg
aXQ/Cj4gPj4KPiA+PiBZZXMsIHBsZWFzZSBsaW1pdGVkIHRvIHVzZSBmc2NyeXB0X3plcm9vdXRf
cmFuZ2UoKSBvbiBub24tbXVsdGlkZXZpY2UgZjJmcyBpbWFnZQo+ID4+IGZpcnN0LCB3ZSBjYW4g
YWRkIGEgY29uZGl0aW9uIHRvIGNoZWNrIHRoYXQgaW4gdGhlIGJlZ2lubmluZyBvZiBpb2N0bCBp
bnRlcmZhY2UsCj4gPj4gb25jZSBmc2NyeXB0X3plcm9vdXRfcmFuZ2UoKSBhY2NlcHRzIGJkZXYg
YXMgcGFyYW1ldGVyLCB3ZSBjYW4gcmVtb3ZlIHRoYXQgbGltaXRhdGlvbi4KPiA+Pgo+ID4+IFRo
YW5rcywKPiA+Pgo+ID4+Pgo+ID4+PiAyMDIw64WEIDfsm5QgMTTsnbwgKO2ZlCkg7Jik7ZuEIDk6
MzYsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+ID4+Pj4KPiA+
Pj4+IE9uIDIwMjAvNy8xNCAyOjExLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+Pj4+PiBIaSBEYWVo
bywKPiA+Pj4+Pgo+ID4+Pj4+IFBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzLgo+ID4+Pj4+Cj4g
Pj4+Pj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvamFl
Z2V1ay9mMmZzLmdpdC9jb21taXQvP2g9ZGV2JmlkPTM1MjQ1MTgwNDU5YWViZjZkNzBmZGU4OGE1
MzhmMDQwMGE3OTRhYTYKPiA+Pj4+Cj4gPj4+PiBJJ20gY3VyaW91cyBhYm91dCB3aGF0IHdpbGwg
aGFwcGVuIGlmIHdlIGNhbGwKPiA+Pj4+IHNlY190cmltX2ZpbGUoRjJGU19UUklNX0ZJTEVfWkVS
T09VVCkgb24gYW4gZW5jcnlwdGVkIGZpbGUsIHdpbGwKPiA+Pj4+IGl0IHVzZSB6ZXJvIGJpdHMg
Y292ZXJpbmcgZW5jcnlwdGVkIGRhdGEgb24gZGlzaz8KPiA+Pj4+Cj4gPj4+PiBUaGFua3MsCj4g
Pj4+Pgo+ID4+Pj4+Cj4gPj4+Pj4gVGhhbmtzLAo+ID4+Pj4+Cj4gPj4+Pj4gT24gMDcvMTMsIERh
ZWhvIEplb25nIHdyb3RlOgo+ID4+Pj4+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bn
b29nbGUuY29tPgo+ID4+Pj4+Pgo+ID4+Pj4+PiBDaGFuZ2VkIHRoZSB3YXkgb2YgaGFuZGxpbmcg
cmFuZ2UubGVuIG9mIEYyRlNfSU9DX1NFQ19UUklNX0ZJTEUuCj4gPj4+Pj4+ICAxLiBBZGRlZCAt
MSB2YWx1ZSBzdXBwb3J0IGZvciByYW5nZS5sZW4gdG8gc2VjdXJlIHRyaW0gdGhlIHdob2xlIGJs
b2Nrcwo+ID4+Pj4+PiAgICAgc3RhcnRpbmcgZnJvbSByYW5nZS5zdGFydCByZWdhcmRsZXNzIG9m
IGlfc2l6ZS4KPiA+Pj4+Pj4gIDIuIElmIHRoZSBlbmQgb2YgdGhlIHJhbmdlIHBhc3NlcyBvdmVy
IHRoZSBlbmQgb2YgZmlsZSwgaXQgbWVhbnMgdW50aWwKPiA+Pj4+Pj4gICAgIHRoZSBlbmQgb2Yg
ZmlsZSAoaV9zaXplKS4KPiA+Pj4+Pj4gIDMuIGlnbm9yZWQgdGhlIGNhc2Ugb2YgdGhhdCByYW5n
ZS5sZW4gaXMgemVybyB0byBwcmV2ZW50IHRoZSBmdW5jdGlvbgo+ID4+Pj4+PiAgICAgZnJvbSBt
YWtpbmcgZW5kX2FkZHIgemVybyBhbmQgdHJpZ2dlcmluZyBkaWZmZXJlbnQgYmVoYXZpb3VyIG9m
Cj4gPj4+Pj4+ICAgICB0aGUgZnVuY3Rpb24uCj4gPj4+Pj4+Cj4gPj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+Pj4+IC0tLQo+ID4+
Pj4+PiBDaGFuZ2VzIGluIHYyOgo+ID4+Pj4+PiAgLSBDaGFuZ2VkIC0xIHJhbmdlLmxlbiBvcHRp
b24gdG8gbWVhbiB0aGUgd2hvbGUgYmxvY2tzIHN0YXJ0aW5nIGZyb20KPiA+Pj4+Pj4gICAgcmFu
Z2Uuc3RhcnQgcmVnYXJkbGVzcyBvZiBpX3NpemUKPiA+Pj4+Pj4gLS0tCj4gPj4+Pj4+ICBmcy9m
MmZzL2ZpbGUuYyB8IDIzICsrKysrKysrKysrKy0tLS0tLS0tLS0tCj4gPj4+Pj4+ICAxIGZpbGUg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gPj4+Pj4+Cj4gPj4+
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPj4+Pj4+
IGluZGV4IDM2OGM4MGY4ZTJhMS4uMjQ4NTg0MWUzYjJkIDEwMDY0NAo+ID4+Pj4+PiAtLS0gYS9m
cy9mMmZzL2ZpbGUuYwo+ID4+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+Pj4+PiBAQCAt
Mzc5Miw3ICszNzkyLDcgQEAgc3RhdGljIGludCBmMmZzX3NlY190cmltX2ZpbGUoc3RydWN0IGZp
bGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+Pj4+PiAgICAgIHBnb2ZmX3QgaW5kZXgs
IHBnX2VuZDsKPiA+Pj4+Pj4gICAgICBibG9ja190IHByZXZfYmxvY2sgPSAwLCBsZW4gPSAwOwo+
ID4+Pj4+PiAgICAgIGxvZmZfdCBlbmRfYWRkcjsKPiA+Pj4+Pj4gLSAgICBib29sIHRvX2VuZDsK
PiA+Pj4+Pj4gKyAgICBib29sIHRvX2VuZCA9IGZhbHNlOwo+ID4+Pj4+PiAgICAgIGludCByZXQg
PSAwOwo+ID4+Pj4+Pgo+ID4+Pj4+PiAgICAgIGlmICghKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dS
SVRFKSkKPiA+Pj4+Pj4gQEAgLTM4MTMsMjMgKzM4MTMsMjMgQEAgc3RhdGljIGludCBmMmZzX3Nl
Y190cmltX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGxvbmcgYXJnKQo+ID4+Pj4+
PiAgICAgIGZpbGVfc3RhcnRfd3JpdGUoZmlscCk7Cj4gPj4+Pj4+ICAgICAgaW5vZGVfbG9jayhp
bm9kZSk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+IC0gICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5v
ZGUpIHx8IGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkgewo+ID4+Pj4+PiArICAgIGlmIChm
MmZzX2lzX2F0b21pY19maWxlKGlub2RlKSB8fCBmMmZzX2NvbXByZXNzZWRfZmlsZShpbm9kZSkg
fHwKPiA+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgcmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlf
c2l6ZSkgewo+ID4+Pj4+PiAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+Pj4+Pj4gICAg
ICAgICAgICAgIGdvdG8gZXJyOwo+ID4+Pj4+PiAgICAgIH0KPiA+Pj4+Pj4KPiA+Pj4+Pj4gLSAg
ICBpZiAocmFuZ2Uuc3RhcnQgPj0gaW5vZGUtPmlfc2l6ZSkgewo+ID4+Pj4+PiAtICAgICAgICAg
ICAgcmV0ID0gLUVJTlZBTDsKPiA+Pj4+Pj4gKyAgICBpZiAocmFuZ2UubGVuID09IDApCj4gPj4+
Pj4+ICAgICAgICAgICAgICBnb3RvIGVycjsKPiA+Pj4+Pj4gLSAgICB9Cj4gPj4+Pj4+Cj4gPj4+
Pj4+IC0gICAgaWYgKGlub2RlLT5pX3NpemUgLSByYW5nZS5zdGFydCA8IHJhbmdlLmxlbikgewo+
ID4+Pj4+PiAtICAgICAgICAgICAgcmV0ID0gLUUyQklHOwo+ID4+Pj4+PiAtICAgICAgICAgICAg
Z290byBlcnI7Cj4gPj4+Pj4+ICsgICAgaWYgKGlub2RlLT5pX3NpemUgLSByYW5nZS5zdGFydCA+
IHJhbmdlLmxlbikgewo+ID4+Pj4+PiArICAgICAgICAgICAgZW5kX2FkZHIgPSByYW5nZS5zdGFy
dCArIHJhbmdlLmxlbjsKPiA+Pj4+Pj4gKyAgICB9IGVsc2Ugewo+ID4+Pj4+PiArICAgICAgICAg
ICAgZW5kX2FkZHIgPSByYW5nZS5sZW4gPT0gKHU2NCktMSA/Cj4gPj4+Pj4+ICsgICAgICAgICAg
ICAgICAgICAgIHNiaS0+c2ItPnNfbWF4Ynl0ZXMgOiBpbm9kZS0+aV9zaXplOwo+ID4+Pj4+PiAr
ICAgICAgICAgICAgdG9fZW5kID0gdHJ1ZTsKPiA+Pj4+Pj4gICAgICB9Cj4gPj4+Pj4+IC0gICAg
ZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gLSAg
ICB0b19lbmQgPSAoZW5kX2FkZHIgPT0gaW5vZGUtPmlfc2l6ZSk7Cj4gPj4+Pj4+ICAgICAgaWYg
KCFJU19BTElHTkVEKHJhbmdlLnN0YXJ0LCBGMkZTX0JMS1NJWkUpIHx8Cj4gPj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICghdG9fZW5kICYmICFJU19BTElHTkVEKGVuZF9hZGRyLCBGMkZTX0JM
S1NJWkUpKSkgewo+ID4+Pj4+PiAgICAgICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiA+Pj4+Pj4g
QEAgLTM4NDYsNyArMzg0Niw4IEBAIHN0YXRpYyBpbnQgZjJmc19zZWNfdHJpbV9maWxlKHN0cnVj
dCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKPiA+Pj4+Pj4gICAgICBkb3duX3dyaXRl
KCZGMkZTX0koaW5vZGUpLT5pX2djX3J3c2VtW1dSSVRFXSk7Cj4gPj4+Pj4+ICAgICAgZG93bl93
cml0ZSgmRjJGU19JKGlub2RlKS0+aV9tbWFwX3NlbSk7Cj4gPj4+Pj4+Cj4gPj4+Pj4+IC0gICAg
cmV0ID0gZmlsZW1hcF93cml0ZV9hbmRfd2FpdF9yYW5nZShtYXBwaW5nLCByYW5nZS5zdGFydCwg
ZW5kX2FkZHIgLSAxKTsKPiA+Pj4+Pj4gKyAgICByZXQgPSBmaWxlbWFwX3dyaXRlX2FuZF93YWl0
X3JhbmdlKG1hcHBpbmcsIHJhbmdlLnN0YXJ0LAo+ID4+Pj4+PiArICAgICAgICAgICAgICAgICAg
ICB0b19lbmQgPyBMTE9OR19NQVggOiBlbmRfYWRkciAtIDEpOwo+ID4+Pj4+PiAgICAgIGlmIChy
ZXQpCj4gPj4+Pj4+ICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4KPiA+Pj4+Pj4gLS0K
PiA+Pj4+Pj4gMi4yNy4wLjM4My5nMDUwMzE5YzJhZS1nb29nCj4gPj4+Pj4KPiA+Pj4+Pgo+ID4+
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4+
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+Pj4+PiBMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiA+Pj4+PiAuCj4gPj4+Pj4KPiA+
Pj4gLgo+ID4+Pgo+ID4gLgo+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
