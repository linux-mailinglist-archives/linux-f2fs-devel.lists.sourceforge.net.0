Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5486A6E112
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Mar 2025 18:39:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twllH-0006K9-Ao;
	Mon, 24 Mar 2025 17:38:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1twllF-0006Ju-V9
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 17:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DhHc3L6BTQyQ2VV8zBOxramxCIeT2sQL+pcCAxhBKHI=; b=ldePTnYqbuTXvA1eXewWF7ya4/
 hOQaZ7jfGagwhdFfu4SgXtyCaVp4mqjski3+Rwza24qufvKaFbwFIKHq07f0/UEM/+QTBtAveRUpw
 fQfSUe2lcXDvs4dsgul2YP7GAFyCVmLoJayPl4K1rbomQS5dCZzgEQwOQa2yAGT4KTak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DhHc3L6BTQyQ2VV8zBOxramxCIeT2sQL+pcCAxhBKHI=; b=Lzge+sVFENaxYdc0weCatFUexx
 0+IcVlYpsX6chv4ty2PtkJh++pesN0nfF5jLFqRAEric9ap3CDTnxVCVsjldC4Td95J9xwNBsjm5g
 IsA5gJbIOW5s5NldiFVnJWn7vDe38hbFIepAyP3LXBg2wQAVbRX7zClGpajrgSLGUKrk=;
Received: from mail-vk1-f174.google.com ([209.85.221.174])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twllB-0006q0-23 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Mar 2025 17:38:54 +0000
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-523ee30e0d4so2281332e0c.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Mar 2025 10:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742837918; x=1743442718; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DhHc3L6BTQyQ2VV8zBOxramxCIeT2sQL+pcCAxhBKHI=;
 b=AyjlTD56PexwPiClMZSns7ZZjcMoiE1qsEBSCG/0WkjWw722iHvcBP7obe3NlMXs+f
 nkT4f0TGyG0bPeetimV2xOMM3ctaASKTSC3ygO+fO23g4TibgVY8t6PF1Oo3x8i9NVR9
 aL85wfT37jNSBeQlnz1gD9f7l3dwwpudr6pwLj0T8EmIV2WrEP/uB87YXAaDY/7FxDyt
 qeAovA/egklhSeBCGLuuye1XAgsSMxgUhS86GuT996T1M5vFdh4mJPsD3QUZdzx8bA7N
 o7xqhVNMcldZXEWkDoYctvzwCuRjGT4J/gJ0V0CZZNxoOPnVTZkXxETdrRP8AsWH8uIz
 AT+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742837918; x=1743442718;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DhHc3L6BTQyQ2VV8zBOxramxCIeT2sQL+pcCAxhBKHI=;
 b=ItZyv2/RftYW6HbsYyadibS+xoH4aLvZ4uGMJnpF3KgwL/cjUtfPVhJyKCr6ZQ5fF4
 hSMosx700AGtQxeFntNxC7GMZyrHwEu0VuBOiom0TEEIkQyYqXstzSASXDUo+kq88qbB
 vNgjpypLzAmxkL5lOo23cg9mcG+Tf8rteqMtsjTBw3/XefVAMmgz4DvH5/t3k9nYYHf+
 5j3xzI33YX9ZA+Xm55K2MoXhmZKECI5s8D+IjCX+0LLNX1kqvrHyugHASSs2Q4dtzDSq
 rM37C6k7LdcCNw9u/3FLqFpCa3Hs+cbsgef9osZTbjRUGZm09sNe7TyOvFm4y0HmHKZY
 IlwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/KpB8zL1GWED29FpBjBZKOGIOgTGOBo8Oub+giICBekTuA2R1bSi+TGj2nBMWhtROJbs52aDADRFnXb4kxvsf@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw73jOCgfGdFg8NffdXose9/FGWV1fzu5pWNb6943Vot4W0fqWZ
 ngc1cnO5MnO9awJ4EXNUBotDqnZcwhSUGVaVK8idG69KbBun7FQXdu+GVJAFviBHELnV6WC1JRm
 iwCMxk6o6IwDYRRchwVEUGAa0sqnMyQVcH6U=
X-Gm-Gg: ASbGncs+s7Z5V9EU6JRp08ETtGyUwV7s1IacVvYiZXhiPBZ34r8RaT7ErOXLeKxRPwg
 8/cf6iJJhO6lbwVfuwN6MNG8sMXwbG0HxU/lkCeDm3VRqpP6QEr6X0Bg7tLmoqG8t4+RjMKk/PM
 EiVH0hB5hqmOV67VhhVwRNUPj3aHbdMKh+XuEBc3VO2YMtKVMCA/wJpusJCt5vmFdWIvEJiQ==
X-Google-Smtp-Source: AGHT+IEzxJQSAwtY4T5y4jVtK83eFLd4Wpa9U8MybWVatoj3vVUzUPCTJomxtapoBqMT2APoYvOPmk+h07WOWhzl2TU=
X-Received: by 2002:a05:6122:1994:b0:523:c4df:4de3 with SMTP id
 71dfb90a1353d-525a8379e19mr9547011e0c.5.1742837917941; Mon, 24 Mar 2025
 10:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250324114935.3087821-1-chao@kernel.org>
 <20250324114935.3087821-2-chao@kernel.org>
In-Reply-To: <20250324114935.3087821-2-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 24 Mar 2025 10:38:26 -0700
X-Gm-Features: AQ5f1JruqPU0fNSM3E1FCT6wTPSl17PyFmYvi_g6RwuDXRhVN5gDldsd8Gr8BaA
Message-ID: <CACOAw_y8o88oL5vy=YYsN0A8tTOkP0p5qBdqivo_bUWrHGODXg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Mar 24, 2025 at 4:54 AM Chao Yu via Linux-f2fs-devel
    wrote: > > w/ below testcase, it will cause inconsistence in between SIT
   and SSA. > > create_null_blk 512 2 1024 1024 > mkfs.f2fs -m /d [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.174 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [209.85.221.174 listed in sa-trusted.bondedsender.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.174 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.174 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1twllB-0006q0-23
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: zone: fix to avoid inconsistence
 in between SIT and SSA
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBNYXIgMjQsIDIwMjUgYXQgNDo1NOKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IHcvIGJlbG93IHRlc3RjYXNlLCBpdCB3aWxsIGNhdXNlIGluY29uc2lzdGVuY2UgaW4gYmV0d2Vl
biBTSVQgYW5kIFNTQS4KPgo+IGNyZWF0ZV9udWxsX2JsayA1MTIgMiAxMDI0IDEwMjQKPiBta2Zz
LmYyZnMgLW0gL2Rldi9udWxsYjAKPiBtb3VudCAvZGV2L251bGxiMCAvbW50L2YyZnMvCj4gdG91
Y2ggL21udC9mMmZzL2ZpbGUKPiBmMmZzX2lvIHBpbmZpbGUgc2V0IC9tbnQvZjJmcy9maWxlCj4g
ZmFsbG9jYXRlIC1sIDRHaUIgL21udC9mMmZzL2ZpbGUKPgo+IEYyRlMtZnMgKG51bGxiMCk6IElu
Y29uc2lzdGVudCBzZWdtZW50ICgwKSB0eXBlIFsxLCAwXSBpbiBTU0EgYW5kIFNJVAo+IENQVTog
NSBVSUQ6IDAgUElEOiAyMzk4IENvbW06IGZhbGxvY2F0ZSBUYWludGVkOiBHICAgICAgICAgICBP
ICAgICAgIDYuMTMuMC1yYzEgIzg0Cj4gVGFpbnRlZDogW09dPU9PVF9NT0RVTEUKPiBIYXJkd2Fy
ZSBuYW1lOiBpbm5vdGVrIEdtYkggVmlydHVhbEJveC9WaXJ0dWFsQm94LCBCSU9TIFZpcnR1YWxC
b3ggMTIvMDEvMjAwNgo+IENhbGwgVHJhY2U6Cj4gIDxUQVNLPgo+ICBkdW1wX3N0YWNrX2x2bCsw
eGIzLzB4ZDAKPiAgZHVtcF9zdGFjaysweDE0LzB4MjAKPiAgZjJmc19oYW5kbGVfY3JpdGljYWxf
ZXJyb3IrMHgxOGMvMHgyMjAgW2YyZnNdCj4gIGYyZnNfc3RvcF9jaGVja3BvaW50KzB4MzgvMHg1
MCBbZjJmc10KPiAgZG9fZ2FyYmFnZV9jb2xsZWN0KzB4Njc0LzB4NmUwIFtmMmZzXQo+ICBmMmZz
X2djX3JhbmdlKzB4MTJiLzB4MjMwIFtmMmZzXQo+ICBmMmZzX2FsbG9jYXRlX3Bpbm5pbmdfc2Vj
dGlvbisweDVjLzB4MTUwIFtmMmZzXQo+ICBmMmZzX2V4cGFuZF9pbm9kZV9kYXRhKzB4MWNjLzB4
M2MwIFtmMmZzXQo+ICBmMmZzX2ZhbGxvY2F0ZSsweDNjMy8weDQxMCBbZjJmc10KPiAgdmZzX2Zh
bGxvY2F0ZSsweDE1Zi8weDRiMAo+ICBfX3g2NF9zeXNfZmFsbG9jYXRlKzB4NGEvMHg4MAo+ICB4
NjRfc3lzX2NhbGwrMHgxNWU4LzB4MWI4MAo+ICBkb19zeXNjYWxsXzY0KzB4NjgvMHgxMzAKPiAg
ZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NjcvMHg2Zgo+IFJJUDogMDAzMzoweDdm
OWRiYTUxOTdjYQo+IEYyRlMtZnMgKG51bGxiMCk6IFN0b3BwZWQgZmlsZXN5c3RlbSBkdWUgdG8g
cmVhc29uOiA0Cj4KPiBUaGUgcmVhc29uIGlzIGYyZnNfZ2NfcmFuZ2UoKSBtYXkgdHJ5IHRvIG1p
Z3JhdGUgYmxvY2sgaW4gY3Vyc2VnLCBob3dldmVyLAo+IGl0cyBTU0EgYmxvY2sgaXMgbm90IHVw
dG9kYXRlIGR1ZSB0byB0aGUgbGFzdCBzdW1tYXJ5IGJsb2NrIGRhdGEgaW4gc3RpbGwKPiBpbiBj
YWNoZSBvZiBjdXJzZWcuCj4KPiBJbiB0aGlzIHBhdGNoLCB3ZSBhZGQgYSBjb25kaXRpb24gaW4g
ZjJmc19nY19yYW5nZSgpIHRvIGNoZWNrIHdoZXRoZXIKPiBzZWN0aW9uIGlzIG9wZW5lZCBvciBu
b3QsIGFuZCBza2lwIGJsb2NrIG1pZ3JhdGlvbiBmb3Igb3BlbmVkIHNlY3Rpb24uCj4KPiBGaXhl
czogOTcwM2Q2OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5pbmcgZm9yIHpvbmVkIGRl
dmljZXMiKQo+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9nYy5j
IHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+IGluZGV4IDJiOGY5MjM5YmVkZS4uOGI1
YTU1YjcyMjY0IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ICsrKyBiL2ZzL2YyZnMvZ2Mu
Ywo+IEBAIC0yMDY2LDYgKzIwNjYsOSBAQCBpbnQgZjJmc19nY19yYW5nZShzdHJ1Y3QgZjJmc19z
Yl9pbmZvICpzYmksCj4gICAgICAgICAgICAgICAgICAgICAgICAgLmlyb290ID0gUkFESVhfVFJF
RV9JTklUKGdjX2xpc3QuaXJvb3QsIEdGUF9OT0ZTKSwKPiAgICAgICAgICAgICAgICAgfTsKPgo+
ICsgICAgICAgICAgICAgICBpZiAoSVNfQ1VSU0VDKHNiaSwgR0VUX1NFQ19GUk9NX1NFRyhzYmks
IHNlZ25vKSkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICAgICAg
ICAgICAgICAgICBkb19nYXJiYWdlX2NvbGxlY3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsIEZHX0dD
LCB0cnVlLCBmYWxzZSk7Cj4gICAgICAgICAgICAgICAgIHB1dF9nY19pbm9kZSgmZ2NfbGlzdCk7
Cj4KPiAtLQo+IDIuNDguMQo+Cj4KClJldmlld2VkLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgoKVGhhbmtzLgoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
