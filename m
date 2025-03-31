Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C4BA76BF6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 18:31:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzI38-0007fY-EO;
	Mon, 31 Mar 2025 16:31:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1tzI37-0007fS-5O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 16:31:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=; b=FdB2aGa1qIJuK9kYQ1MP9toOOK
 Lh77D3IYRTDOPFMRd1qvFznAMffcJlFHhzESEM7K3viBTfCys68jXDMTN+hbgJRfsYPGK5V/UuIAj
 sSxmqbNYdJRWS0o7fS7J07jkSHdl3RmOYcFh7oWsHUmiKjsGJJVTaJwjurBEnY1dwuO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=; b=YaFfk9Ujtc/dKod0M/In1Qek/q
 3ZRU4EPV5MrWMWQ37a/Qgp2D1w6wQH2Kn8RPPAK4Ym2nVeipgA1GYImBZ5vTpAFmlhWRHRZLjpryK
 A5ajeXBgv8yjah0LNWBfnPB3ofMF4IJwxz9SOzyhe4ZPNuUBE3zmzCTx1NS/LjEytk3A=;
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tzI35-0007ee-QS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 16:31:44 +0000
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5dbfc122b82so52a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Mar 2025 09:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1743438692; x=1744043492;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=;
 b=153nVyz1rSrm3y8VxMJakAZUd2F1IOJvtgKgzmWppeqmm0hMAf8+XCqoMYjTYD3Zf1
 xaEVJHCZ6Tq4Dr/U3mm4pu/l33NrYf7wOXh4FCYaAeTl8SJCVKjXM0PH/pAX7+Ex/ezj
 Jd2ccBgK6QljIad3Rg4L5CValm1EUNynpjSUSxdIg65SZgRyXZd6D1tof8wNFXNISFT8
 w2jc+ad030XCegIZI+jeperMwbjjycJ0pv9pfU8+awDzZdv/xsKRvfb8Xi2nbeD0VGg6
 PacjDT/XndPY0bG8iiLLrAljfmI1qeokH+AiZtuqGXbBceON6eN+Fblzi0iznRn1SDC4
 HnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743438692; x=1744043492;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bCUNVEwXQjN/ZYMFDi8yyefx1Qb62gH/JvVinJDVFL0=;
 b=PwqkLiFiInH6RZXW+SrAV0Ya+to2hN7cuIekya+Guxtd+yn01HdzQ6h1xJktfxYLpk
 kP8zV4seEf9GW4GoEKqHm1CRITxUaJnyRf7kFIPAU8sPjoPBAIr0InQiVAwu4MYqECew
 VP9YBtiVcKpcw2FeX/tJvC6IGWOrPjlpu2YBUwPPQ5XoPuQzjgKibDq0ETNBwLeMqTp2
 U/TFRPgFSficiNHE/el/+K5G05UQTUJiEM3lpo749rDulElf04HZ9Bc2/U6kSlXJl77u
 iwq9DOHpC1OxqSbdC3q8ax38DTrKZCsvnLfuqSg5pU3hkgVwkr5tFPN6kQ0uGg6978Xt
 krkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWb34FI3Ttpb3mYzzkLuLM33j1JXfD2vG5BKQ19Gz6HL5FX0sppQcNog6ZL2ZoKtks7tLvPjvH8dsZRdhRPcN5d@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzQCe1H3xSaJfkYo/6qdUPa2+d/fVNPTpwDK32GcBgePuHCk4Yc
 gQRr0B9wz3Vb2/WEf1Jct4netXOOldm/5SAxITVk+VOWwQN1+PDCp4m211OwbX/OYQ5WSimFlTt
 A62VRideNzhTK6Dr1fmpL7V3OgRPlLcztLjys
X-Gm-Gg: ASbGncvjobkhV7oZ1B6OD1+SWarU/bAUP+MT9kolTlZVTd9Vc4fvF8yPUveVACW2HrG
 byyc+1uKsavdUuUOMPA8QvvCAlZI83T2RJefM1oB4tSkxeC1TsurSVhzcECklJT/4HFdOURrcT+
 Irh7XtxV6EBTfqd1DWoCx6kM/01s+KT0foA7LVHdwmtm9grl5FDSMylVI6
X-Google-Smtp-Source: AGHT+IFS75Z0XM5wuiNpOfgrNbtyh5kI8h29Nwu2aeDt7jd1u7vYMcdG/HRw0PtOOdN+1JfXFoeOy3TjhzP1Z5z0xXA=
X-Received: by 2002:a05:6402:1496:b0:5eb:5d50:4fec with SMTP id
 4fb4d7f45d1cf-5edfd9f7c30mr193132a12.0.1743438691972; Mon, 31 Mar 2025
 09:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250331025416.478380-1-chao@kernel.org>
In-Reply-To: <20250331025416.478380-1-chao@kernel.org>
Date: Mon, 31 Mar 2025 09:31:20 -0700
X-Gm-Features: AQ5f1Jo40vcwgWkYkmTPvqs1vtSU5KqyB2uPVh5Oo9YyNkgBQNmuj1T35rlyJpU
Message-ID: <CALBjLoDnzALdShsEzii6pK+fxgbeNVh8weKVtb=PyFJ3XgS1NA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -15.7 (---------------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Mar 30, 2025 at 7:54 PM Chao Yu <chao@kernel.org>
    wrote: > > After commit 91b587ba79e1 ("f2fs: Introduce linear search for
   > dentries"), f2fs forced to use linear lookup whenever a hash-base [...] 
 
 Content analysis details:   (-15.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.208.54 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.54 listed in bl.score.senderscore.com]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
                             welcome-list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_SPF_WL     From: address is in the default SPF
                             welcome-list
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.54 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.5 ENV_AND_HDR_SPF_MATCH  Env and Hdr From used in default SPF WL
                             Match
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1tzI35-0007ee-QS
Subject: Re: [f2fs-dev] [PATCH] f2fs: support to disable linear lookup
 fallback
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBNYXIgMzAsIDIwMjUgYXQgNzo1NOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBBZnRlciBjb21taXQgOTFiNTg3YmE3OWUxICgiZjJmczogSW50cm9kdWNl
IGxpbmVhciBzZWFyY2ggZm9yCj4gZGVudHJpZXMiKSwgZjJmcyBmb3JjZWQgdG8gdXNlIGxpbmVh
ciBsb29rdXAgd2hlbmV2ZXIgYSBoYXNoLWJhc2VkCj4gbG9va3VwIGZhaWxzIG9uIGNhc2Vmb2xk
ZWQgZGlyZWN0b3J5LCBpdCBtYXkgYWZmZWN0IHBlcmZvcm1hbmNlCj4gZm9yIHNjZW5hcmlvczog
YSkgY3JlYXRlIGEgbmV3IGZpbGUgdy8gZmlsZW5hbWUgaXQgZG9lc24ndCBleGlzdAo+IGluIGRp
cmVjdG9yeSwgYikgbG9va3VwIGEgZmlsZSB3aGljaCBtYXkgYmUgcmVtb3ZlZC4KPgo+IFRoaXMg
cGF0Y2ggc3VwcG9ydHMgdG8gZGlzYWJsZSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrLCBzbywgb25j
ZSB0aGVyZQo+IGlzIGEgc29sdXRpb24gZm9yIGNvbW1pdCA1YzI2ZDJmMWQzZjUgKCJ1bmljb2Rl
OiBEb24ndCBzcGVjaWFsIGNhc2UKPiBpZ25vcmFibGUgY29kZSBwb2ludHMiKSB0byBmaXggcmVk
IGhlYXJ0IHVuaWNvZGUgaXNzdWUsIHRoZW4gd2UgY2FuCj4gc2V0IGFuIGVuY29kZWluZyBmbGFn
IHRvIGRpc2FibGUgdGhlIGZhbGxiYWNrIGZvciBwZXJmb3JtYW5jZSByZWNvdmVyeS4KPgo+IFRo
ZSB3YXkgaXMga2VwdCBpbiBsaW5lIHcvIGV4dDQsIHJlZmVyIHRvIGNvbW1pdCA5ZTI4MDU5ZDU2
NjQgKCJleHQ0Ogo+IGludHJvZHVjZSBsaW5lYXIgc2VhcmNoIGZvciBkZW50cmllcyIpLgo+Cj4g
Q2M6IERhbmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNvbT4KPiBDYzogR2FicmllbCBLcmlzbWFu
IEJlcnRhemkgPGtyaXNtYW5Ac3VzZS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGZzL2YyZnMvZGlyLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9kaXIuYyBiL2ZzL2YyZnMvZGlyLmMKPiBpbmRleCA1YTYzZmYwZGYwM2IuLmUxMjQ0NWFm
Yjk1YSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2Rpci5jCj4gKysrIGIvZnMvZjJmcy9kaXIuYwo+
IEBAIC0zNjYsNyArMzY2LDggQEAgc3RydWN0IGYyZnNfZGlyX2VudHJ5ICpfX2YyZnNfZmluZF9l
bnRyeShzdHJ1Y3QgaW5vZGUgKmRpciwKPgo+ICBvdXQ6Cj4gICNpZiBJU19FTkFCTEVEKENPTkZJ
R19VTklDT0RFKQo+IC0gICAgICAgaWYgKElTX0NBU0VGT0xERUQoZGlyKSAmJiAhZGUgJiYgdXNl
X2hhc2gpIHsKPiArICAgICAgIGlmIChJU19DQVNFRk9MREVEKGRpcikgJiYgIWRlICYmIHVzZV9o
YXNoICYmCj4gKyAgICAgICAgICAgICAgICFzYl9ub19jYXNlZm9sZF9jb21wYXRfZmFsbGJhY2so
ZGlyLT5pX3NiKSkgewoKCldvdWxkIGl0IGJlIGJlbmVmaWNpYWwgdG8gZXZhbHVhdGUKIXNiX25v
X2Nhc2Vmb2xkX2NvbXBhdF9mYWxsYmFjayhkaXItPmlfc2IpIGZpcnN0IGZvciBzaG9ydC1jaXJj
dWl0aW5nPwoKCj4KPiAgICAgICAgICAgICAgICAgdXNlX2hhc2ggPSBmYWxzZTsKPiAgICAgICAg
ICAgICAgICAgZ290byBzdGFydF9maW5kX2VudHJ5Owo+ICAgICAgICAgfQo+IC0tCj4gMi40OS4w
Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
