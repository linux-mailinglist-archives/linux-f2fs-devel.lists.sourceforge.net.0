Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF3BA85978
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:21:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3BW3-00025v-Jx;
	Fri, 11 Apr 2025 10:21:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u3BVr-00025W-Aq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+cCFl64ENACKNdO/30oh8kUagXoBJzV4MggyT9FXbXA=; b=NnvqSgDDlx1ABWX4BK7q7lCgaD
 19kHgvGxrmFVS/RQYcLERpc06aVcDgvm24S6q24nw784hXOfMiFwjtmWbsvkQ5tlXA3FAe4rggpDd
 e+eIuyLT+od8YE9/5CHIQJ1mbHRl/A/fs43U21dd4HrEDA3kX8VixDfCglV4fxJ4qTVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+cCFl64ENACKNdO/30oh8kUagXoBJzV4MggyT9FXbXA=; b=UaHkxwtKw/vyV3BohR/YY86aBr
 DXlljqEDb7ia/f7+6TFMpH4/EP4I3vgUKpJajZzbaZbkB/tAhb5QVBZM694didiv5BWD1sqNQOxMU
 oirhDQo1A8C1jW6cXeX2oJDdS/GsyyTY5NrkeTUmZbuZl6y2HXHhtQsNCUXDutRqSAgM=;
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u3BVb-0004hu-VX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:21:31 +0000
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ac3fcf5ab0dso318482166b.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Apr 2025 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744366864; x=1744971664; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cCFl64ENACKNdO/30oh8kUagXoBJzV4MggyT9FXbXA=;
 b=h10YV1m670aC/m3vgNoqlbB/bb0272Y9lRGc3Vj/UueEdY1vHAjCU8t7G3R9524HDy
 r2yHFHRrYtJKfO4gRR2X/YgkQcqPi5ZMFzmU/hkLkkOO7HWdXa8UQlVebEnTYwyzxSy1
 /lt0iVCSpeqWB+R1KmN+SEIdAwEIvLvz9C/2BuQK7l37zxqkgrDWIQkIH/efsLjTcNEa
 i/0rH7ENV8r25HD+8hZo7ub1B/FsuY1UejP2qcXR/vuJhGooYhE7c/4bdNF78MKWQFSo
 KX2hP+FK6B9gT29LR9oz3U8tDHUMfekZAmYS4ECTBX4Ufk9ImvVUiiySJshNw5gw0RAF
 BB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744366864; x=1744971664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+cCFl64ENACKNdO/30oh8kUagXoBJzV4MggyT9FXbXA=;
 b=mE3gOK2JAMQhb9Sq2VzFFsD3T+u63vgGmDPDQp388GWe6iuQkN54C4TPD9+D7hXi7t
 6tbWQStCbOG/nadABjTN4XFXaqBw26pqWn6j5RW1kr65WmrbEJLEkWq6NBtWo1SSuUsu
 me9DijZNvQ1IUt1wh0tE0Mj4hiCc8R1dCAWhzlADEpqJ4b/W5Dq6xwWk8WFQiiBPmERR
 53dr8Z1Vl3wpuWTifY84l7U2y7Rs2e+yK2TLyscXKHbkUkPYjsAgfuD3TvkqZBybKIbB
 LNMypKifpqtn0os0seRNrwViOjbcSdN7olkxn1F43Lcm+/QOIyqUWi1NdULzYQ5f5Qny
 nVUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi2zcMII3jQBhKNPn/o+b7ZLzMLbQpSpJDnfK9Co+Lph2wbtGYXYQK8bvz0/EB5D2JqJHzIqDpkPoUiktfSqqc@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwJdSkVjOHkeylh/XZHpri3wsVkF9qhRPiEucDNaea0L0utMDlC
 1JZuOYQcxak699kENVF/y4kZ1KjF1IkMBP9Vl3q3FM+A5/X48eeZCe5/tdOy29qLOwp9STk/0Ws
 I22XkYF4SBdzqBSaLS3XhHstxEq0i6ysz+9I=
X-Gm-Gg: ASbGncs7W792EJbcvpwW2Z8NX5bkg3XXjeJrW4n3qzPMQIp7pHziw/2ENqSYZ2cCmaz
 4BvDqca3B95wiAX0/oRoOwzxDsxvdrsVwIZHxyCrAcwiggzXUCz8gAWegcnUhec/6SGmOZLbLvV
 4ijBKBho3cGbi1R0cUrA982t4=
X-Google-Smtp-Source: AGHT+IHGKyuoJXQAjeFQN8YC/U3aCLjG9YZkbRscOQNqwj4eUzsRIf/Pn6ZyQCjZyxUGLh806/q19P4yimb3Q1j5wDo=
X-Received: by 2002:a17:907:9483:b0:ac6:d160:e3b9 with SMTP id
 a640c23a62f3a-acad3499d49mr179332566b.22.1744366864025; Fri, 11 Apr 2025
 03:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250411100526.7939-1-chao@kernel.org>
 <20250411100526.7939-2-chao@kernel.org>
In-Reply-To: <20250411100526.7939-2-chao@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 11 Apr 2025 03:20:52 -0700
X-Gm-Features: ATxdqUGqc2rP-AtOCzyV3ez2Z6V5zsN9FrLwDFsGuy72zKc0tBF3aBAVtcZlHlI
Message-ID: <CAD14+f3XQjvRxHEFm9OFv2RSOC_Ekbzu-LiJhRj+XXOndYw1dQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 11, 2025 at 3:05 AM Chao Yu wrote: > > resize.f2fs
    doesn't guarantee atomically resizing f2fs image, > so that potential suddent
    power cut, IO error, out of memory, > SIGKILL received [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.49 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.218.49 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.218.49 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.218.49 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1u3BVb-0004hu-VX
Subject: Re: [f2fs-dev] [PATCH v2 2/2] resize.f2fs: add caution message for
 resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMzowNeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiByZXNpemUuZjJmcyBkb2Vzbid0IGd1YXJhbnRlZSBhdG9taWNhbGx5IHJl
c2l6aW5nIGYyZnMgaW1hZ2UsCj4gc28gdGhhdCBwb3RlbnRpYWwgc3VkZGVudCBwb3dlciBjdXQs
IElPIGVycm9yLCBvdXQgb2YgbWVtb3J5LAo+IFNJR0tJTEwgcmVjZWl2ZWQgb3IgcHJvZ3JhbSBl
eGl0cyBkdWUgdG8gb3RoZXIgcmVhc29ucyBtYXkgY2F1c2UKPiBkYXRhIGNvcnJ1cHRpb24uCj4K
PiBUaGlzIHBhdGNoIGFkZHMgY2F1dGlvbiBtZXNzYWdlIGZvciByZXNpemUgdXNlcnMgdG8gbm90
aWNlCj4gcG90ZW50aWFsIHJpc2sgb2YgdXNpbmcgcmVzaXppbmcgdG9vbCwgYW5kIHJlbWluZCB0
aGVtIHRvIGJhY2t1cAo+IGRhdGEgYmVmb3JlIHJlc2l6ZS4KPgo+IHJlc2l6ZS5mMmZzIDxwYXJ0
aXRpb24+Cj4KPiAiUGxlYXNlIG5vdGljZSB0aGVyZSBpcyBoaWdoIHJpc2sgb2YgZGF0YSBsb3N0
IGR1cmluZyByZXNpemUsIHBsZWFzZSBiYWNrdXAgeW91ciBkYXRhIGJlZm9yZSByZXNpemUuCj4g
RG8geW91IHdhbnQgdG8gcmVzaXplIHRoaXMgcGFydGl0aW9uPyBbeS9uXSB5Cj4gcHJvY2VzcyBy
ZXNpemUiCj4KPiBJZiB3ZSB3YW50IHRvIGZvcmNlIHRvIHVzZSByZXNpemUuZjJmcywgd2UgY2Fu
IHVzZSAtRiBvcHRpb24sCj4gbGV0J3MgZW5hYmxlIC1GIG9wdGlvbiBpbiBBbmRyb2lkIGJ5IGRl
ZmF1bHQgdG8gbm90IGJyZWFrIGFueQo+IHVzYWdlLgo+Cj4gQ2M6IEp1IEh5dW5nIFBhcmsgPHFr
cnduZ3VkODI1QGdtYWlsLmNvbT4KCkNhbiB5b3UgdXBkYXRlIHRoaXMgdG8gIkp1aHl1bmcgUGFy
ayI/IFRoYXQncyB0aGUgcHJlZmVycmVkIG5hbWUgdGhhdApJIHVzZSBub3cgOykKCj4gU2lnbmVk
LW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+ICBmc2NrL21haW4uYyAg
ICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICBmc2NrL3Jlc2l6ZS5jICAg
ICB8ICAyICstCj4gIGluY2x1ZGUvZjJmc19mcy5oIHwgIDEgKwo+ICBtYW4vcmVzaXplLmYyZnMu
OCB8IDEyICsrKysrKysrKysrKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2NrL21haW4u
Ywo+IGluZGV4IGFmNDA2MTMuLmVmNmIxN2QgMTAwNjQ0Cj4gLS0tIGEvZnNjay9tYWluLmMKPiAr
KysgYi9mc2NrL21haW4uYwo+IEBAIC0yMjIsNiArMjIyLDggQEAgc3RhdGljIHZvaWQgYWRkX2Rl
ZmF1bHRfb3B0aW9ucyh2b2lkKQo+ICAgICAgICAgICAgICAgICBpZiAoYy5mdW5jID09IEZTQ0sp
IHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiAtYSAqLwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGMuYXV0b19maXggPSAxOwo+ICsgICAgICAgICAgICAgICB9IGVsc2UgaWYgKGMuZnVu
YyA9PSBSRVNJWkUpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjLmZvcmNlID0gMTsKPiAg
ICAgICAgICAgICAgICAgfQo+Cj4gICAgICAgICAgICAgICAgIC8qCj4gQEAgLTYwMSw3ICs2MDMs
NyBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ICAj
ZW5kaWYKPiAgICAgICAgIH0gZWxzZSBpZiAoIXN0cmNtcCgicmVzaXplLmYyZnMiLCBwcm9nKSkg
ewo+ICAjaWZkZWYgV0lUSF9SRVNJWkUKPiAtICAgICAgICAgICAgICAgY29uc3QgY2hhciAqb3B0
aW9uX3N0cmluZyA9ICJkOmZIc3Q6bzpWIjsKPiArICAgICAgICAgICAgICAgY29uc3QgY2hhciAq
b3B0aW9uX3N0cmluZyA9ICJkOmZGSHN0Om86ViI7Cj4KPiAgICAgICAgICAgICAgICAgYy5mdW5j
ID0gUkVTSVpFOwo+ICAgICAgICAgICAgICAgICB3aGlsZSAoKG9wdGlvbiA9IGdldG9wdChhcmdj
LCBhcmd2LCBvcHRpb25fc3RyaW5nKSkgIT0gRU9GKSB7Cj4gQEAgLTYxOCw5ICs2MjAsMTIgQEAg
dm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuZGJnX2x2
KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGNhc2UgJ2YnOgo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Yy5pZ25vcmVfZXJyb3IgPSAxOwo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTVNH
KDAsICJJbmZvOiBJbmdvcmUgZXJyb3IgZHVyaW5nIHJlc2l6ZVxuIik7CgpzL0luZ29yZS9pZ25v
cmUKcy9lcnJvci9lcnJvcnMKCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiArICAgICAgICAgICAgICAgICAgICAgICBjYXNlICdGJzoKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMuZm9yY2UgPSAxOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTVNHKDAsICJJbmZvOiBGb3JjZSB0byByZXNpemVcbiIpOwo+IC0gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYnJlYWs7CgpJcyB0aGlzIGZhbGx0aHJvdWdoIGludGVuZGVkPwoK
PiAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlICdIJzoKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGMubmVlZF93aGludCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjLndoaW50ID0gV1JJVEVfTElGRV9OT1RfU0VUOwo+IEBAIC0xMTA0LDYgKzEx
MDksMjQgQEAgb3V0X3JhbmdlOgo+ICAjaWZkZWYgV0lUSF9SRVNJWkUKPiAgc3RhdGljIGludCBk
b19yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICB7Cj4gKyAgICAgICBjaGFyIGFu
c3dlclsyNTVdID0gezB9Owo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAoIWMu
Zm9yY2UpIHsKPiArcmV0cnk6Cj4gKyAgICAgICAgICAgICAgIHByaW50ZigiXG5QbGVhc2Ugbm90
aWNlIHRoZXJlIGlzIGhpZ2ggcmlzayBvZiBkYXRhIGxvc3QgZHVyaW5nIHJlc2l6ZSwgIgo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICJwbGVhc2UgYmFja3VwIHlvdXIgZGF0YSBiZWZvcmUgcmVz
aXplLlxuIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICJEbyB5b3Ugd2FudCB0byByZXNpemUg
dGhpcyBwYXJ0aXRpb24/IFt5L25dICIpOwoKImhpZ2ggcmlzayIgaXMgcHJvYmFibHkgdG9vIGFn
Z3Jlc3NpdmUuIEkgaGFkIG1hbnkgc3VjY2Vzc2VzIGluIHJlc2l6ZS4KCk1heWJlICJSZXNpemUg
b3BlcmF0aW9uIGlzIGN1cnJlbnRseSBleHBlcmltZW50YWwsIHBsZWFzZSBiYWNrdXAgeW91cgpk
YXRhLlxuRG8geW91IHdhbnQgdG8gY29udGludWU/IFt5L25dICI/Cgo+ICsgICAgICAgICAgICAg
ICByZXQgPSBzY2FuZigiJXMiLCBhbnN3ZXIpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlQocmV0
ID49IDApOwo+ICsgICAgICAgICAgICAgICBpZiAoIXN0cmNhc2VjbXAoYW5zd2VyLCAieSIpKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigicHJvY2VzcyByZXNpemVcbiIpOwoKU29t
ZXRoaW5nIGxpa2UgIlByb2NlZWRpbmcgdG8gcmVzaXplIiBsb29rcyBiZXR0ZXIgaGVyZS4KCj4g
KyAgICAgICAgICAgICAgIGVsc2UgaWYgKCFzdHJjYXNlY21wKGFuc3dlciwgIm4iKSkKPiArICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiArICAgICAgICAgICAgICAgZWxzZQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gcmV0cnk7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAg
ICAgaWYgKCFjLnRhcmdldF9zZWN0b3JzKQo+ICAgICAgICAgICAgICAgICBjLnRhcmdldF9zZWN0
b3JzID0gYy50b3RhbF9zZWN0b3JzOwo+Cj4gZGlmZiAtLWdpdCBhL2ZzY2svcmVzaXplLmMgYi9m
c2NrL3Jlc2l6ZS5jCj4gaW5kZXggMjY4MWI5Zi4uMWFiN2Q3NSAxMDA2NDQKPiAtLS0gYS9mc2Nr
L3Jlc2l6ZS5jCj4gKysrIGIvZnNjay9yZXNpemUuYwo+IEBAIC03NjUsNyArNzY1LDcgQEAgaW50
IGYyZnNfcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgZWxzZSBpZiAoKChjLnRhcmdldF9zZWN0b3JzICogYy5zZWN0b3Jfc2l6ZSA+
Pgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdldF9zYihsb2dfYmxvY2tzaXplKSkgPiBnZXRf
c2IoYmxvY2tfY291bnQpKSB8fAo+IC0gICAgICAgICAgICAgICAgICAgICAgIGMuZm9yY2UpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgYy5pZ25vcmVfZXJyb3IpCj4gICAgICAgICAgICAgICAg
IHJldHVybiBmMmZzX3Jlc2l6ZV9ncm93KHNiaSk7Cj4gICAgICAgICBlbHNlIHsKPiAgICAgICAg
ICAgICAgICAgTVNHKDAsICJOb3RoaW5nIHRvIHJlc2l6ZS5cbiIpOwo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4gaW5kZXggN2UzZjI1Yi4uOTI4
Zjk2MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2YyZnNfZnMuaAo+ICsrKyBiL2luY2x1ZGUvZjJm
c19mcy5oCj4gQEAgLTE1MjgsNiArMTUyOCw3IEBAIHN0cnVjdCBmMmZzX2NvbmZpZ3VyYXRpb24g
ewo+ICAgICAgICAgaW50IG5vX2tlcm5lbF9jaGVjazsKPiAgICAgICAgIGludCBmaXhfb247Cj4g
ICAgICAgICBpbnQgZm9yY2U7Cj4gKyAgICAgICBpbnQgaWdub3JlX2Vycm9yOwo+ICAgICAgICAg
aW50IGRlZnNldDsKPiAgICAgICAgIGludCBidWdfb247Cj4gICAgICAgICB1bnNpZ25lZCBpbnQg
aW52YWxpZF9zYjsKPiBkaWZmIC0tZ2l0IGEvbWFuL3Jlc2l6ZS5mMmZzLjggYi9tYW4vcmVzaXpl
LmYyZnMuOAo+IGluZGV4IDAyZmYyNDUuLmJkZGE0ZmQgMTAwNjQ0Cj4gLS0tIGEvbWFuL3Jlc2l6
ZS5mMmZzLjgKPiArKysgYi9tYW4vcmVzaXplLmYyZnMuOAo+IEBAIC0xOCw2ICsxOCwxMiBAQCBy
ZXNpemUuZjJmcyBcLSByZXNpemUgZmlsZXN5c3RlbSBzaXplCj4gIC5JIG92ZXJwcm92aXNpb24t
cmF0aW8tcGVyY2VudGFnZQo+ICBdCj4gIFsKPiArLkIgXC1mCj4gK10KPiArWwo+ICsuQiBcLUYK
PiArXQo+ICtbCj4gIC5CIFwtSAo+ICBdCj4gIFsKPiBAQCAtNTMsNiArNTksMTIgQEAgU3BlY2lm
eSB0aGUgcGVyY2VudGFnZSBvZiB0aGUgdm9sdW1lIHRoYXQgd2lsbCBiZSB1c2VkIGFzIG92ZXJw
cm92aXNpb24gYXJlYS4KPiAgVGhpcyBhcmVhIGlzIGhpZGRlbiB0byB1c2VycywgYW5kIHV0aWxp
emVkIGJ5IEYyRlMgY2xlYW5lci4gSWYgbm90IHNwZWNpZmllZCwgdGhlCj4gIGJlc3QgbnVtYmVy
IHdpbGwgYmUgYXNzaWduZWQgYXV0b21hdGljYWxseSBhY2NvcmRpbmcgdG8gdGhlIHBhcnRpdGlv
biBzaXplLgo+ICAuVFAKPiArLkJJIFwtZgo+ICtGb3JjZSB0byBmaXggYW55IGluY29uc2lzdGVu
dCBkYXRhIGR1cmluZyByZXNpemUuCj4gKy5UUAo+ICsuQkkgXC1GCj4gK1NraXAgY2F1dGlvbiBk
aWFsb2d1ZSBhbmQgcmVzaXplIHBhcnRpdGlvbiBkaXJlY3RseS4KPiArLlRQCj4gIC5CSSBcLUgK
PiAgU3BlY2lmeSBzdXBwb3J0IHdyaXRlIGhpbnQuCj4gIC5UUAo+IC0tCj4gMi40MC4xCj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
