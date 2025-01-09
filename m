Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6DFA06ADF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 03:23:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tViCl-00034a-Oz;
	Thu, 09 Jan 2025 02:23:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang66@gmail.com>) id 1tViCk-00034S-CS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 02:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYSnN65DOwI6sQwKzOOHPj/G8MN27fbQnfxsULVVxKE=; b=JQ3sn4l/ozmNZCr/K+z8u0DGzU
 zkiqKzR2w8hL52pVGxTUfEYQUPWKUx1OsmD1ZzqX4aOaAUbzy6ZfvwDTruX75VH0LnX5AOGlmEkpw
 RmCx1yrHLVMsrENUuL1YE13cynsJuHMbfIqLd+Ar1LL1XesE2snoXXrh1AfyBpv3Eh7E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYSnN65DOwI6sQwKzOOHPj/G8MN27fbQnfxsULVVxKE=; b=Wf7KnpKuYtOKyBaD9/t76Gkx7e
 ExC6vbuYM2IQjxqStusjHzDPluR7u6MrR0AWPH0CmNOtQbdooc7khAOVMeC/TKfmqFToI+NytfXYt
 Msh4fbl47Vjq+P+IYwAPkEVByXxzastNehiTTri5yImPLEG4qQMyySUIlctgFYMcAURM=;
Received: from mail-qv1-f54.google.com ([209.85.219.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tViCk-0006lg-Gj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 02:23:27 +0000
Received: by mail-qv1-f54.google.com with SMTP id
 6a1803df08f44-6dd420f82e2so5635476d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 08 Jan 2025 18:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736389395; x=1736994195; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dYSnN65DOwI6sQwKzOOHPj/G8MN27fbQnfxsULVVxKE=;
 b=lKP8o5ZlN8ETmywwoNuamBb3F6h05L5tvgOoXoN0JtpXOFWSBVRZiGgUfzl/tI+E0I
 AryGE0Hipzb49DFyXWgkri3TFnk2qttvDJvvoKtBuEuckdlHWqK06Q9FRGdRaCUV/eal
 KonwgDGE8ntHRUay9sdy+S5XWpxDIbCF+5B5nvMJK6wK0vGCUsa7bPDr9Htw8bEcwvTF
 nF5QHjVV7xt1+IlkkaQlvAAvFZbODeUl10n22T7MtB8YIiecm2Sd/5f0gpnc4ua7svZR
 vKRnp+8LZDgFKuU5l/mzCIjDKPiKcX6UYPDvUSjwAQFZkRX8pSM1mTU/fqEaF7wByu1l
 fy9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736389395; x=1736994195;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dYSnN65DOwI6sQwKzOOHPj/G8MN27fbQnfxsULVVxKE=;
 b=qyDsJxwu14SAqSXeZ2mSuygBfhy2Sa3j3p/ll8YOXI1Ed1gN0GCpbpFL0BR2wpc6a2
 FZPFow144pLJYgcDzbMuWoaPFJPRmW0eOMggZIuRE0H3+I1DabgABhy6J8cXLNMheOeO
 dvXhO11+hYqAX1rZ8T8AJS1Vhnm0zEEP0U1xOi3KXKH+uCxEJMyi7jvelVsdPOYu1Q8l
 fHInVUX0uqI4+qFMPyDG6D43BoxZ/5HneR9N+Zc2O8x9D2RSq5krXyDBDKJDvmTuwtxo
 k0+Y2VApg/BT165lN1LJhgassRE1R6DOfvIbNSyMD1BfTZn6i7l9jZZwil7vJCGMjg3m
 LhYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7ZabI/dDo3yh/tCvqSBoiV6Mxnn3ZYjOp5MtwnJMFgnXVl/G5JVhh9tQv8TIGijfUo5SJFUG0PgFth5hUTCqa@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyV2sADHI6uh8MJtQVLbq0HBzihF+0D2/PuJ5VPp+lWIoZ7B/nG
 SSjVibSgw82DnZRsCG105GjJhjKY3vvlI6Mu2Mzle+uK5p56Wvi5W42QKSWXwe9eAJ6JrS/lNDm
 Uuf2kbxk3BzVncTC0Jt+VEsLhp1q63GZ2
X-Gm-Gg: ASbGncv8LGihk8Hl6edEc/dEdLIo1S0htt+eTqH6ThsK+zhTDWM6oYOFGFQlAfae8fH
 DSr7jNLoFmMDEyetaI9ottSSQpKn87o5CmffHs0I=
X-Google-Smtp-Source: AGHT+IGC6nV6oVAs1SA4FZfcRw7HWd0AHFm/hscPreyc5OhUlnRoK67k0Ji+9CV6qHZHg+gfRCU8e5BdfnG5t4X2Blw=
X-Received: by 2002:ad4:5941:0:b0:6d8:8466:d205 with SMTP id
 6a1803df08f44-6df9b1cde29mr88530716d6.6.1736389395565; Wed, 08 Jan 2025
 18:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20250106033645.4043618-1-zangyangyang1@xiaomi.com>
 <Z37D7TRFCvqMoX5U@google.com>
In-Reply-To: <Z37D7TRFCvqMoX5U@google.com>
From: =?UTF-8?B?6Ien6Ziz6Ziz?= <zangyangyang66@gmail.com>
Date: Thu, 9 Jan 2025 10:23:04 +0800
X-Gm-Features: AbW1kvabOXgj3LMNqePsTnRH7WGGc7k_s1jLjM9quIUIGCQIg7HZ696e9gxfFaU
Message-ID: <CAEJnjmwVm87QVYminhzfJC5So+QFDoad7yfhQKepwRoR5pLsXw@mail.gmail.com>
To: chao@kernel.org
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Jaegeuk Kim 于2025年1月9日周四 02:29写道： > > On
    01/06, zangyangyang wrote: > > From: zangyangyang1 > > > > When f2fs_write_single_data_page
    fails, f2fs_write_cache_pages > > will use the last 'submitted' value incorrectly,
    which will cause [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.54 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.219.54 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.54 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [zangyangyang66[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [zangyangyang66[at]gmail.com]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.54 listed in wl.mailspike.net]
X-Headers-End: 1tViCk-0006lg-Gj
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix using wrong 'submitted' value
 in f2fs_write_cache_pages
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4g5LqOMjAyNeW5tDHmnIg55pel5ZGo5Zub
IDAyOjI55YaZ6YGT77yaCgo+Cj4gT24gMDEvMDYsIHphbmd5YW5neWFuZyB3cm90ZToKPiA+IEZy
b206IHphbmd5YW5neWFuZzEgPHphbmd5YW5neWFuZzFAeGlhb21pLmNvbT4KPiA+Cj4gPiBXaGVu
IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZSBmYWlscywgZjJmc193cml0ZV9jYWNoZV9wYWdl
cwo+ID4gd2lsbCB1c2UgdGhlIGxhc3QgJ3N1Ym1pdHRlZCcgdmFsdWUgaW5jb3JyZWN0bHksIHdo
aWNoIHdpbGwgY2F1c2UKPiA+ICdud3JpdHRlbicgYW5kICd3YmMtPm5yX3RvX3dyaXRlJyBjYWxj
dWxhdGlvbiBlcnJvcnMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiB6YW5neWFuZ3lhbmcxIDx6YW5n
eWFuZ3lhbmcxQHhpYW9taS5jb20+Cj4gPiAtLS0KPiA+IHYzOiBObyBsb2dpY2FsIGNoYW5nZXMs
IGp1c3QgZm9ybWF0IHBhdGNoCj4gPiB2MjogSW5pdGlhbGl6ZSAic3VibWl0dGVkIiBpbiBmMmZz
X3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UoKQo+ID4gLS0tCj4gPiAgZnMvZjJmcy9kYXRhLmMgfCAz
ICsrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4gaW5kZXggOTRmN2IwODRm
NjAxLi5mNzcyZmJjN2YzMzEgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gKysr
IGIvZnMvZjJmcy9kYXRhLmMKPiA+IEBAIC0yODE2LDYgKzI4MTYsOSBAQCBpbnQgZjJmc193cml0
ZV9zaW5nbGVfZGF0YV9wYWdlKHN0cnVjdCBmb2xpbyAqZm9saW8sIGludCAqc3VibWl0dGVkLAo+
ID4KPiA+ICAgICAgIHRyYWNlX2YyZnNfd3JpdGVwYWdlKGZvbGlvLCBEQVRBKTsKPiA+Cj4gPiAr
ICAgICBpZiAoc3VibWl0dGVkKQo+ID4gKyAgICAgICAgICAgICAqc3VibWl0dGVkID0gMDsKPgo+
IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBjb3JyZWN0LCBhcyBjYWxsZXJzIHNob3VsZCBoYW5kbGUg
aXQuCgpIaSwgQ2hhbywgd2hhdCBkbyB5b3UgdGhpbms/CgpUaGFua3MKCj4KPiA+ICsKPiA+ICAg
ICAgIC8qIHdlIHNob3VsZCBieXBhc3MgZGF0YSBwYWdlcyB0byBwcm9jZWVkIHRoZSBrd29ya2Vy
IGpvYnMgKi8KPiA+ICAgICAgIGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKHNiaSkpKSB7Cj4g
PiAgICAgICAgICAgICAgIG1hcHBpbmdfc2V0X2Vycm9yKGZvbGlvLT5tYXBwaW5nLCAtRUlPKTsK
PiA+IC0tCj4gPiAyLjQzLjIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
