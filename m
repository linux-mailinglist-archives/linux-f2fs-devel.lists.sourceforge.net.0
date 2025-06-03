Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67043ACCB71
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 18:53:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gN8OhJBJQ8BDy+IDfdpbwmj5VKK1tvaDY95HQ9vPQXY=; b=U0vrV/T33mrXE44sFb/RJ1iEuN
	KGse6fqePZvzVeimGC9FJAysxIROcaz++8VA2OMfjtrp1+6Gmtu92R4HzPOkZdZ1itIYJo1jVYkj0
	pe7xQI4EZUddohnBb/MGQiYNbukilW+tU4NDlSythDSIEFR3yfw/3XI/w1BmA/EC1YPQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMUso-0005jn-5y;
	Tue, 03 Jun 2025 16:53:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uMUsh-0005jQ-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 16:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8FEWjBFGusBqDi2embU/D0epft2HC85Uqd3UD/1Dd6U=; b=Y0a/NEdiCAuVSKOq71msKq/OA5
 foyDxvLxQ5zbfW5a6+18R8RTgp2Ltsd0dYC5u7jpfSMo60Igjd/q0m853i1B2aN7pFQ+NPyyVZFED
 pjaKSme4f9GRCh5HntmK3unfBoF9Nh6QuEGsB8BZTXbzjakjEHyMwMpeGssCcetcAZJI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8FEWjBFGusBqDi2embU/D0epft2HC85Uqd3UD/1Dd6U=; b=jIHYuG7NS7/p/mld+xawXADamd
 FzA7JpWQflre2jyuIL6yvSf/Hcg3hguALPLpvxXzkkbyW61fQYS7DctmjWERUdVbWzC8+uRptw//b
 OtQsl/OWHFNOb3uRCRmBOTk+TxEPX7pAwDGa1DjjebvFe081BIixBcNw9gjYIrcUfMvg=;
Received: from mail-vk1-f179.google.com ([209.85.221.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMUsg-00050e-49 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 16:52:55 +0000
Received: by mail-vk1-f179.google.com with SMTP id
 71dfb90a1353d-52f05bb975bso1599295e0c.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Jun 2025 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748969563; x=1749574363; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8FEWjBFGusBqDi2embU/D0epft2HC85Uqd3UD/1Dd6U=;
 b=Y3AIP6Ny5c9uSzJKSNVwRDYLIqXm70G44jsFute4ozCyYHknnSdyXPcsNXi/5h8mwG
 Yn4haZ/5ZWzXEBb9yDApVrjGLDY4mJzFn9d/rTg+ySd5Qgg8FEXRCtitqZRNl2KKkVBR
 Lm6wf9Bv5kR79L2NsxA8hdkJQQ3GtrppScHKS01bZVr6a8csGC+lEJc+fCWAXmuPzuJ6
 5B9141OtxcABT48B90l1ZOZYG/G0SmMkSY6R0ueEZiKDRgjsbsZy2Pe3WfJ+ElLGxOkn
 3EmMZ/ViiBi19Xg1qQppR22YoeGw6Uh8PD44AEuvMOEXr9Qq7ws/rcPKFs4fiPsz6bSm
 IZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748969563; x=1749574363;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8FEWjBFGusBqDi2embU/D0epft2HC85Uqd3UD/1Dd6U=;
 b=kMg+qBVIqV0SbLerVZMh/og2IbHv2aHe1ykdF3keyeVWBGbv5AFqOoqxOhknIUaSHP
 lmED6eGJ+i/HLeoLAPikRXPH9mgh/xNv5GKukZDbtMWGK8Hgy3R9Vhe0fPUQxznN2FIm
 A/enckx+RFTb9r5Kxu+pdM5E1PNNaPi3r3n4qmrcIXQbJwylLlbmMlRRxxMmWQwNXE32
 fMfB52ESF54ti/RQ/Eg1+7H6AmcwmSqWBu15KtY3Qkg3ot7Ouc831XhWXqVFvl0fGTNZ
 A0ljKvQLk8VLIhwjEhPNOS+RkRC5QXzo2TU7viipdHrV7xU3xyiL1hp+Vk1CjBEss/vg
 Xa1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjYNyiL3lY+rS5UASa2E9WGam1grwora6wmt++t1eI3/XvHhttZbmjExId46wpBEEP5D7Fk++lcuVRy4yvCL8I@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzP0xHbsKIRqgZJ6rON8VLQtRkVhXlv9rKrn5Sk9QNs7L7DBD2T
 Jnr7jLXp1J0fsro9O3/UX4INKkpDChudAMkDO2aMgNf+4zXBj3ASUK7627IMwuPGYu/tq1wk1GG
 rRNdb2sa6gcINGFlKPBMgehT/WPmJGce6+YUt
X-Gm-Gg: ASbGncvatO24GxNqOQI9/nCp8mTFY/VWSkgx4VaX+hvcIFmQ+5Bul6/bBjbg8CkrLHF
 9OcsjcHFPUEwOocdmFEY044oaANiUblGPbyynIPQy1KBDuWKDNgxBG3PhbXt2pWz8GlUONlE6wr
 xMnOrp0VuSsX87aIomIBg25afjGLqo1qawe93Xq9iV+hn3Fb5BxQh1yTqNG5p1zQVPOZwMMCqVO
 g==
X-Google-Smtp-Source: AGHT+IGeV8aemiSfGvSSDU3NoI5P/4VYMV8Z3wtV2nj74gHfQhHi/u0/vmojJE2ZFStpgHpZ7bzLRuMnE+jDZJBKcP4=
X-Received: by 2002:a05:6122:922:b0:530:626b:7d43 with SMTP id
 71dfb90a1353d-53093688599mr10821736e0c.2.1748969563058; Tue, 03 Jun 2025
 09:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250603072618.16171-1-chao@kernel.org>
In-Reply-To: <20250603072618.16171-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 3 Jun 2025 09:52:32 -0700
X-Gm-Features: AX0GCFsajHQpqynwhceEMsvWZKjzw5W3QNpWzSeyQ_Y2qAgxLLznklx8MS5jNq4
Message-ID: <CACOAw_wNX1Bn2FofztAujxSZ3n+R3genZ-_SwvZHs=8K5Lt-Jw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Jun 3, 2025 at 12:29 AM Chao Yu via Linux-f2fs-devel
    wrote: > > fsck.c: In function ‘chk_and_fix_wp_with_sit’: > fsck.c:3529:17:
    error: variable-sized object may not be initialized > 3 [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.179 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.179 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.179 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.179 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1uMUsg-00050e-49
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: fix to avoid using uninitialized
 buffer
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
Cc: jaegeuk@kernel.org, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBKdW4gMywgMjAyNSBhdCAxMjoyOeKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IGZzY2suYzogSW4gZnVuY3Rpb24g4oCYY2hrX2FuZF9maXhfd3Bfd2l0aF9zaXTigJk6Cj4gZnNj
ay5jOjM1Mjk6MTc6IGVycm9yOiB2YXJpYWJsZS1zaXplZCBvYmplY3QgbWF5IG5vdCBiZSBpbml0
aWFsaXplZAo+ICAzNTI5IHwgICAgICAgICAgICAgICAgIGNoYXIgYnVmZmVyW0YyRlNfQkxLU0la
RV0gPSB7fTsKPiAgICAgICB8ICAgICAgICAgICAgICAgICBefn5+Cj4KPiBUaGUgcmVhc29uIGlz
IEYyRlNfQkxLU0laRSBtYWNybyBpcyBkZWZpbmVkIHcvIGMuYmxrc2l6ZSwgbGV0J3MgdXNlCj4g
Y2FsbG9jKCkgdG8gYWxsb2NhdGUgemVyb2VkIG1lbW9yeSB0byBmaXggdGhpcyBpc3N1ZS4KPgo+
IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnNjay9mc2NrLmMgfCA3ICsrKysr
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMKPiBpbmRleCA0ZDA1ZTFiLi5i
YjM5ZjhiIDEwMDY0NAo+IC0tLSBhL2ZzY2svZnNjay5jCj4gKysrIGIvZnNjay9mc2NrLmMKPiBA
QCAtMzUyNiw3ICszNTI2LDcgQEAgc3RhdGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRoX3NpdChp
bnQgVU5VU0VEKGkpLCB2b2lkICpibGt6b25lLCB2b2lkICpvcGFxdWUpCj4KPiAgICAgICAgIHJl
dCA9IGYyZnNfZmluaXNoX3pvbmUod3BkLT5kZXZfaW5kZXgsIGJsa3opOwo+ICAgICAgICAgaWYg
KHJldCkgewo+IC0gICAgICAgICAgICAgICB1OCBidWZmZXJbRjJGU19CTEtTSVpFXSA9IHt9Owo+
ICsgICAgICAgICAgICAgICB1OCAqYnVmZmVyOwo+ICAgICAgICAgICAgICAgICB1NjQgYmxrX2Fk
ZHIgPSB3cF9ibG9jazsKPiAgICAgICAgICAgICAgICAgdTY0IGZpbGxfc2VjdHMgPSBibGtfem9u
ZV9sZW5ndGgoYmxreikgLQo+ICAgICAgICAgICAgICAgICAgICAgICAgIChibGtfem9uZV93cF9z
ZWN0b3IoYmxreikgLSBibGtfem9uZV9zZWN0b3IoYmxreikpOwo+IEBAIC0zNTM0LDYgKzM1MzQs
OSBAQCBzdGF0aWMgaW50IGNoa19hbmRfZml4X3dwX3dpdGhfc2l0KGludCBVTlVTRUQoaSksIHZv
aWQgKmJsa3pvbmUsIHZvaWQgKm9wYXF1ZSkKPiAgICAgICAgICAgICAgICAgc3RydWN0IHNlZ19l
bnRyeSAqc2UgPSBnZXRfc2VnX2VudHJ5KHNiaSwgd3Bfc2Vnbm8pOwo+ICAgICAgICAgICAgICAg
ICBlbnVtIHJ3X2hpbnQgd2hpbnQgPSBmMmZzX2lvX3R5cGVfdG9fcndfaGludChzZS0+dHlwZSk7
Cj4KPiArICAgICAgICAgICAgICAgYnVmZmVyID0gY2FsbG9jKEYyRlNfQkxLU0laRSwgMSk7Cj4g
KyAgICAgICAgICAgICAgIEFTU0VSVChidWZmZXIpOwo+ICsKPiAgICAgICAgICAgICAgICAgcHJp
bnRmKCJbRlNDS10gRmluaXNoaW5nIHpvbmUgZmFpbGVkOiAlc1xuIiwgZGV2LT5wYXRoKTsKPiAg
ICAgICAgICAgICAgICAgd2hpbGUgKGxlbi0tKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0ID0gZGV2X2ZpbGxfYmxvY2soYnVmZmVyLCBibGtfYWRkcisrLCB3aGludCk7Cj4gQEAgLTM1
NDIsNiArMzU0NSw4IEBAIHN0YXRpYyBpbnQgY2hrX2FuZF9maXhfd3Bfd2l0aF9zaXQoaW50IFVO
VVNFRChpKSwgdm9pZCAqYmxrem9uZSwgdm9pZCAqb3BhcXVlKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAg
ICAgICAgICAgICB9Cj4gKwo+ICsgICAgICAgICAgICAgICBmcmVlKGJ1ZmZlcik7Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIGlmICghcmV0KQo+IC0tCj4gMi40MC4xCj4KClJldmlld2VkLWJ5OiBD
aGFvIFl1IDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3MsCgo+Cj4KPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
