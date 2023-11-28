Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 446457FAF4A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Nov 2023 01:52:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r7mL2-0000Cp-Hc;
	Tue, 28 Nov 2023 00:52:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <drosen@google.com>) id 1r7mL1-0000Cj-BH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 00:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kVl1jI0eDgA04NFUW7NmcL+osjVyFAl01KHg8BFmfMg=; b=TcuqM8fJY6Dijs2jXG84hMBGXZ
 O1CUozfYhYGm0mGt30fFSdLIBA54foLISSTKhjKEqO1Kkm3tlvcgmCEy3wRznF95HGn7vpfxYfi9x
 QMUZ9yreLUTldwSCjvlc+IMdOXy7mJr4YiAtjpJMR/44lQ21DN/4QR40VEOPCnc4TITc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kVl1jI0eDgA04NFUW7NmcL+osjVyFAl01KHg8BFmfMg=; b=brrbSQnFRZL5oxuH48Uzran06G
 VXnhjVMpHLLPG7LNBxU2xY/NePCuqnqNBdecNBbxaI6DkWaAPOUCkjBaKdrBSdwy65MstRCq5mX07
 Im48R2Qcjhcxi97q3ugPqHLH3JA5TIqzZElk2e98tUqUHYP+Ni15Z7oQhVCMnGYr2g1g=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r7mL0-00049W-Kn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Nov 2023 00:52:31 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-332c7d4a6a7so3235658f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Nov 2023 16:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1701132744; x=1701737544;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVl1jI0eDgA04NFUW7NmcL+osjVyFAl01KHg8BFmfMg=;
 b=HvYOtvYuyQVYiJGj0WLYZUnomN0gSPcISvbORRDogog+ORKLIu1xhYazo93k2dvU4X
 N9xsgtxLAvutSG4wFgGlDIwjzLAXVRyFgjCQV7294QMvCpP8VI8WdLL6QjTbWPoOm1Ac
 RTBYzkkW6xT9NOSj9pfCVzI9OM8DeBx1ONZ4FLzaAXYvKL2nOdh8BYdXjxq24rWdfZUX
 bbYRScsJE+TWPJdQyWES8bTbLzMztgFS082lGneJTCuMfWENTlcaQiF6dCEf9NA1qL+E
 ggaqriqaTzbhIyEynk3iI/i4QmSHq09Teb0LQoAtNz1uxJscnWhs5rhZfg+Kgd9ntEmW
 MYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701132744; x=1701737544;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVl1jI0eDgA04NFUW7NmcL+osjVyFAl01KHg8BFmfMg=;
 b=n0VLdAx8oDb9wAEucCPZtjBjDs/UjTtW8xG2Svg+/07mj9eWqW3ef3znf//+KOMMdx
 IjAuW+6VWrC+cecpqRPswOA33XGUnz5jqdBQ8JmYvZnWBfvlZe6hepQ1NR4tYM0pTsPh
 FxGUP2w/msFodLtb/DLBXfRhALDN5phXAIP+AZFXSmwf9uc+LGYuyXqZoQfBfabrPDML
 6eIoy3zxDoIdY7IeEHh1+cG3CbfAXTuE+T0llEA/m0FDrwJNdcyO0VpGW6hOi8QqIpwN
 n1ExK/exDywMYVP4cNDcMjYoJ01n0ILB9MDmeNULakjImMcar4Ll+/nt/yA+iVUQ83pN
 /kvw==
X-Gm-Message-State: AOJu0YxBNAffM152Z3ERLby37GzQO2A644j8149WZ2WQHrIk0W4cozi6
 fLCDXfn7ZwBmH0ReM7ZcAqIW9fKfJ7orouj1dXXs/w==
X-Google-Smtp-Source: AGHT+IFLj7P62jDv/04HUDKN0Y0QVu4nrbH88aYMBm3mzdU3si1bDEZP7bJ0TxQuBPMwDPSgr8E1fHJE/cD6YwDNbLE=
X-Received: by 2002:a05:6000:4d0:b0:332:f578:8760 with SMTP id
 h16-20020a05600004d000b00332f5788760mr5352936wri.39.1701132744039; Mon, 27
 Nov 2023 16:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20231118020309.1894531-1-drosen@google.com>
 <20231118020309.1894531-3-drosen@google.com>
 <b68dfcda-5e30-d752-1539-e88db98949ee@kernel.org>
In-Reply-To: <b68dfcda-5e30-d752-1539-e88db98949ee@kernel.org>
Date: Mon, 27 Nov 2023 16:52:11 -0800
Message-ID: <CA+PiJmRh0pGjdAqobB74VEWuS+EW9YXRsvWwfigmNdEe0G+c-A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Nov 26, 2023 at 5:42 PM Chao Yu <chao@kernel.org>
    wrote: > > Hi Daniel, > > How about this? It be more explicit to indicate
    the logic? > > --- > fsck/mount.c | 2 ++ > include/f2fs_fs.h | 3 + [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.44 listed in list.dnswl.org]
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.44 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1r7mL0-00049W-Kn
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs-tools: Wait for Block Size to
 initialize Cache
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBOb3YgMjYsIDIwMjMgYXQgNTo0MuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBIaSBEYW5pZWwsCj4KPiBIb3cgYWJvdXQgdGhpcz8gSXQgYmUgbW9yZSBl
eHBsaWNpdCB0byBpbmRpY2F0ZSB0aGUgbG9naWM/Cj4KPiAtLS0KPiAgIGZzY2svbW91bnQuYyAg
ICAgIHwgMiArKwo+ICAgaW5jbHVkZS9mMmZzX2ZzLmggfCAzICsrKwo+ICAgbGliL2xpYmYyZnNf
aW8uYyAgfCA0ICsrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBk
aWZmIC0tZ2l0IGEvZnNjay9tb3VudC5jIGIvZnNjay9tb3VudC5jCj4gaW5kZXggNzI1MTZmNC4u
NGRmYjk5NiAxMDA2NDQKPiAtLS0gYS9mc2NrL21vdW50LmMKPiArKysgYi9mc2NrL21vdW50LmMK
PiBAQCAtMTIzOCw2ICsxMjM4LDggQEAgaW50IGluaXRfc2JfaW5mbyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmkpCj4gICAgICAgICBNU0coMCwgIkluZm86IHRvdGFsIEZTIHNlY3RvcnMgPSAlIlBS
SXU2NCIgKCUiUFJJdTY0IiBNQilcbiIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0b3RhbF9zZWN0b3JzLCB0b3RhbF9zZWN0b3JzID4+Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKDIwIC0gZ2V0X3NiKGxvZ19zZWN0b3JzaXplKSkp
Owo+ICsKPiArICAgICAgIGMuY2FjaGVfY29uZmlnLmJsa3NpemVfaW5pdGlhbGl6ZWQgPSB0cnVl
Owo+ICAgICAgICAgcmV0dXJuIDA7Cj4gICB9Cj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZz
X2ZzLmggYi9pbmNsdWRlL2YyZnNfZnMuaAo+IGluZGV4IDZkZjJlNzMuLmUzNzdkNDggMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9mMmZzX2ZzLmgKPiArKysgYi9pbmNsdWRlL2YyZnNfZnMuaAo+IEBA
IC00NjAsNiArNDYwLDkgQEAgdHlwZWRlZiBzdHJ1Y3Qgewo+ICAgICAgICAgdW5zaWduZWQgbWF4
X2hhc2hfY29sbGlzaW9uOwo+Cj4gICAgICAgICBib29sIGRiZ19lbjsKPiArCj4gKyAgICAgICAv
KiB3aGV0aGVyIGJsa3NpemUgaGFzIGJlZW4gaW5pdGlhbGl6ZWQgKi8KPiArICAgICAgIGJvb2wg
Ymxrc2l6ZV9pbml0aWFsaXplZDsKPiAgIH0gZGV2X2NhY2hlX2NvbmZpZ190Owo+Cj4gICAvKiBm
MmZzX2NvbmZpZ3JhdGlvbiBmb3IgY29tcHJlc3Npb24gdXNlZCBmb3Igc2xvYWQuZjJmcyAqLwo+
IGRpZmYgLS1naXQgYS9saWIvbGliZjJmc19pby5jIGIvbGliL2xpYmYyZnNfaW8uYwo+IGluZGV4
IDM5ZDM3NzcuLmJiNzc0MTggMTAwNjQ0Cj4gLS0tIGEvbGliL2xpYmYyZnNfaW8uYwo+ICsrKyBi
L2xpYi9saWJmMmZzX2lvLmMKPiBAQCAtMTk5LDYgKzE5OSwxMCBAQCB2b2lkIGRjYWNoZV9pbml0
KHZvaWQpCj4gICB7Cj4gICAgICAgICBsb25nIG47Cj4KPiArICAgICAgIC8qIE11c3Qgbm90IGlu
aXRpYXRlIGNhY2hlIHVudGlsIGJsb2NrIHNpemUgaXMga25vd24gKi8KPiArICAgICAgIGlmICgh
Yy5jYWNoZV9jb25maWcuYmxrc2l6ZV9pbml0aWFsaXplZCkKPiArICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsKPiAgICAgICAgIGlmIChjLmNhY2hlX2NvbmZpZy5udW1fY2FjaGVfZW50cnkgPD0g
MCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLS0KPiAyLjQwLjEKPgo+CkkgdGhpbmsg
dGhhdCB3b3JrcyB0b28uIEkgd2FzIGluaXRpYWxseSBnb2luZyB0byBnbyB3aXRoIGNvZGUgbGlr
ZQp0aGF0LCBidXQgSSB3YXMgdW5zdXJlIGlmIHJlYWQvd3JpdGVzIHRoYXQgYXJlbid0IGluIHRo
ZSBmc2NrIHBhdGgKdXNlZCBjYWNoaW5nIGFzIHdlbGwuIFRoZXJlJ3MgYSBmZXcgdXNlcyBvZiB0
aG9zZSBpbiB0aGUgbWtmcy8gcGF0aHMsCmJ1dCBJIGRvbid0IHRoaW5rIHRoZXJlJ3MgYW55dGhp
bmcgdGhhdCBzZXRzCmNhY2hlX2NvbmZpZy5udW1fY2FjaGVfZW50cnkgdGhlcmUuIEkgd2FzIHdv
cnJpZWQgYWJvdXQgbWlzc2luZyBjb2RlCnBhdGhzIGxpa2UgdGhhdCwgc28gSSBoYWQgcmVzdHJp
Y3RlZCB0aGUgY2hhbmdlcyB0byB3aGVyZSBJIGtuZXcgd2UKd2VyZSByZWFkaW5nIHRoZSBzdXBl
cmJsb2NrIG9mZiBkaXNrLiBJZiB0aGVyZSBpcyBhIHByb2JsZW0sIGl0IGNvdWxkCmJlIGNvdmVy
ZWQgYnkgc2V0dGluZyBjLmNhY2hlX2NvbmZpZy5ibGtzaXplX2luaXRpYWxpemVkID0gdHJ1ZSB3
aXRoaW4KdGhlIG1rZnMgY29kZSBhZnRlciB0aGUgYmxvY2tzaXplIGlzIHNldCBpbiBmMmZzX3Bh
cnNlX29wdGlvbnMuIEJ1dAp0aGF0IGlzbid0IG5lZWRlZCBpZiB0aGVyZSdzIG5vIGNhY2hpbmcg
aW4gbWtmcy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
